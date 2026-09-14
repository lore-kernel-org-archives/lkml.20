Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960CB471CE0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393333; cv=none; b=r8vNZwg5jvVQfXkBB22lsYeaX4p7FWMorwZVAsTlRQrXfJm1DmDxXnK2u2XPPp9AJNvp120Z68JKFxk4FOLeYog5KVfpWsckq5MvqyF7Gf5Fyg72jhlpoYtiMJBcwSNLlQlDwGg6+r+ZFnmU3wsUhiNpHPhJ+GrKhDQJWA60Et0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393333; c=relaxed/simple;
	bh=my4YDzbRH1SMHunkPuUmuAiU5uL68zArqNJ5vfSr8BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBaZQ8WkoEtKRW/nE7ZjQZUxct4oacUCN6hWEqdf5NnBob11O4ekEbd6drTIEOKgXUGx0aQ2LzxsSLDtNGJbUB7qyxAp1PEKixiLTnzKZja78f+g/bGPHWcOTpU2+pLjiEL2TrnGM/MWo6IwIh9liCoP7AnF6Q1kwUsiNWldXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrEsiyEd; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrEsiyEd"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9efso407019a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393330; x=1789998130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKtjDpEdHnXrE3SFNH1yDn+O+e2yDCOb7eFYMiTQ8vY=;
        b=QrEsiyEdi226z2SVqQIFQfNixV+WoUC32LdIs2xFhDv5gGRbZOFFF1CMYr7n9t4WQE
         jIgowQ8rgwgEl4gGc3sSeiIhO2W3MmYYxkPRvrbsMwd42l1yd5ao4IEStGA/o69uwBTn
         ZtHu+y79EO8WtqgpTefPlnD8MKS29EfCibCNGTlMk4qY3kYwmYy+VLVfngIOknnx4uo6
         pN5ZUACzkPLuVwrBDopB4eOpZYBqiHV37ogTkazeiAMVQxPdFf/HP4CpiDv4tmeuo4R8
         QtofJGp7s66BfU3AA1P1RcdI+hUl/7gsL9y/ovU/8hylcPmOAOuiMVKB1pLqvGqphtna
         JIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393330; x=1789998130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKtjDpEdHnXrE3SFNH1yDn+O+e2yDCOb7eFYMiTQ8vY=;
        b=JzBPNUeoFGmVEFFU6ShDMoVZlhMXfU/Z9AavSwl3MFVO0ya3allM/y0172z9V6amhu
         EzzNtVD7w+ESM/FxYC9Z9pWdZrO39spk73y9D8uIorUNRL2AhdhknYhkzstdlXkxHQAk
         c/PcMcHAHD7RRQyj76G66MpV0Z+DLrD4vaJ1Y+0gVdEzGRSRg595hpCTm5B7yKK6Libr
         Kj12XN6swytJ9fuD8NkV+18BRLtO+Q5mwQVPLsu+FOifYjPQQCtPMxKLfVy5eG7NC+p5
         cPJa6imrmG5rekEItKRiAXXsEHKYB3rWYl6GiWPMtPk0y5ba6ls+5B8sguegGb7+bjSD
         8bug==
X-Forwarded-Encrypted: i=1; AKwUvBwH7GU4ebxsqfG9/ER4tgz34Ya2rxx2Y0kzIheICaiUUsCKDf/E3EyRFprhW23EEbqmvB9XKw4vxZWQmro=@vger.kernel.org
X-Gm-Message-State: AFuF++lGqUu114Zpv7M9GPl2hA9KZOB8U0oWyhs9EFra17esdeBvDE67
	GLi2wWICyudFraWjSiyewX1oXGrQNg563it7hH/jUKsiLkZs+7wCMSe3
X-Gm-Gg: AYBFou0dTbTppLPmKe8PS+CNz7NcNipXsW6DzvN1F1YJinApczsnezNzxBHiNCERuER
	ejZiVjzsal7CSdReW0kG7ZLc9swKWJ8pA1KNNRTgGecfXz/6qUMRadKuORZfs1N2fybPVfvvO+g
	Hwg7udEU5rugcAKgbLpPR3haydubCyIz6xjtbqNzPygb0HcDKx+C5VISCZdkZ7gby3Gh6ctvWRI
	uxJAKEwceNV6LYDGr/syPPslxpyj1TYV2HyjdyxxrO3lJYDbG1FJ/YaqgCTJ225RW9N/xq7ZNcl
	zYIdSsGP2YX2Dlq4FZePbtMCgVZFiC0xB0rS1oGqGR5YAZq6ZSrQLlecz+bhGFVcwaiLVu39Z+D
	Y+inEr/+/6V/x0D9w9PPWKVC+1yr5Mf600XjGgEAMfE8QMoaxtUFewWP9fSLVdt0+dVY4nGXuwr
	utIDakOvaiaOsu1tiKRUIbiTXwfez6mGhTuGP6gazrMdC08p/HH9+adqxNKPjmOSsU1GlfqvtWY
	RcukVyjgUpuHcfd6n7gcWwWDAjkEKNjcddCYnmT8QYo2SLO9fsrbO0+ZlCeN6sytUcmLYlDDe9O
	EvltDdo4R3nAxCegaD2B
X-Received: by 2002:a17:90a:d88b:b0:398:bac0:238d with SMTP id 98e67ed59e1d1-39dec21ea0cmr3673687a91.5.1789393329459;
        Mon, 14 Sep 2026 06:42:09 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95091214sm22104575a91.3.2026.09.14.06.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:42:09 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: hansg@kernel.org,
	ikepanhc@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: Navon John Lukose <navonjohnlukose@gmail.com>,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10 Mode key
Date: Mon, 14 Sep 2026 19:12:02 +0530
Message-ID: <20260914134202.1295307-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2eab84cb-6d2f-4ec3-9869-e2aa9c1d75da@kernel.org>
References: <20260913224753.30281-1-navonjohnlukose@gmail.com> <2eab84cb-6d2f-4ec3-9869-e2aa9c1d75da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 14-Sep-26 2:40 PM, Hans de Goede wrote:
> So I guess that you maybe also have Fn + Q or something which already
> directly switches profile ?  If you do then KEY_PROG4 seems fine.

Fn+Q does, by a different path than the Mode key:

  Mode key (F9)  WMI fn-key 0x46, platform_profile unchanged
  Fn+Q           VPC special button, platform_profile_cycle() from
                 ideapad_acpi_notify(), no WMI event

(Used LLMs to hunt the Fn+Q path down.)

So cycling on 0x46 would duplicate Fn+Q. Keeping KEY_PROG4, and added
a comment in v2 saying why.
