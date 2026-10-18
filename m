Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B221C4BF945
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792330177; cv=none; b=C309ufzaVAAxGpSB/NL0YqCPJ8yA/0nPtMLLJK3LPM2K73t+4lU1e7Tr2dF7iW3n12gUK3goVkNo1QtZNmSYkCU+I4vnPT0nY/7WeJIRrQ+c6UPVcSMgCpkCyL1eIXTk8w5D1XF4gtjJo//5xRzqkP4dgxor5xrUknVvsl15qSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792330177; c=relaxed/simple;
	bh=aaZ/xfQMHY9Y0WooyFtWFJTJzmhk37MWsnb8cA317rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZxoj8IZCFPYN747GMjfcu5b4cZY/khB7hPc9S//pfCq33MGDSIXq59Fqdsqlm/hTgBoFhz8gFJ6Zkx+wfWgmNCU9KtKyW5ed+oCB6zhtGM3xonwemq13vgHHoVNjRT82KLOkjHy67yRgtxV0ChsKG0nyI+lu8kbxFM9pxnnhpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6W5bODC; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6W5bODC"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2649540eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792330176; x=1792934976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbcIoitvuAfvu3Q7bq63av2aFlfOV01EbbwSM1UVRBA=;
        b=G6W5bODCnIh3chSl00IK9TmdisgEBNbbKZNxhWZrNjTLCtDdPglbTPPJ7CqUGhZw36
         MPg1vmAzUE5CnjxklMXIzKyGD12KZVVGlb23d5GdSDG9p1iw1MTvBUj8aPA+p8jbPbte
         kDMK7yPcKzOQSWbm8Wfc9Gr8rrA4qnYuDf3xZjNAC0wTKQmpOgiTUOsqBi9YvuqmRTS9
         CD6vVOmJfruJnVcIou95nDGnDRLJJzXlSkKPPlofl1euoKu8KzxlqsQWR+Gxx+Qg+fVg
         7UJvh0BsgjeZZ4CHopoQdZjYZFW66FMt6bYYuPiKqw02/eeQriPsTBP4J1RhhAsqXpNc
         7ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792330176; x=1792934976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbcIoitvuAfvu3Q7bq63av2aFlfOV01EbbwSM1UVRBA=;
        b=K3lRC7JATUMIR6OEE1niBtM9/560jKqxAhnOj7CwEYE5FsIz/0W9Eh+SNtsu45+Fds
         UZ9OPhpxrWU+zHYSu76s5Jgq8npbSexQ2DG0MteP7j+0Hv/NVa1au9SuOCktGZEhGCAm
         comwE90TQrPwhiHwjKLIGNpgJZS6Qgy1f9JHojGhq8CfLt/vEvjrdXxqB1r53B7Efqnz
         9T1q+MJAtq9NrppISbzYakOaE7/tgEnNi/pCTOAxtYgIng/ilHMtkwRXS6D2dOHxsnum
         /j6cMcov357kRQiax9xmhhppMVTrccZpmkCrkEdusGz1doQyghrTl8bKShyDCpHA0JZr
         ehMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNWU1A5dq7MPE0IYflMDzlfJab5LD7ygp6ukjYAxoZFEK2OoQcWnOkkFAJ749rPUcZ1/oyQGoCh+pt3Ew=@vger.kernel.org
X-Gm-Message-State: AFq9FYIns+qCgf4qCVLIjkoCAxOPY9LhNp1VQ4B9WX7z7+AjzOryr4Ez
	Eggk24LGicj/yC+p+OofDaNXSPWxNC35aZ29bKONiSpmWRhjkICjVEo+
X-Gm-Gg: AYBFou2W0hrs11GWT2dbFnDZQNb+Rm8uTpUrQwvihJnWMqV/AJIzzBHb/7hQMHXaNXu
	Ji68PT01S+IwFmVLeq7a12t4pBK7B6pjCURyDp0Y9OJht15bxhYgw68uAU73tZI4RaAPXACwfPj
	DZKuORlSwVa0ym6lFd8zX5Wgp+SSUCLeDpCCpthVV5i3zsVFOEzl9nxEdaDB6OoEjoeL7Pz+XzL
	VLRpNMtmFioPy6ph47I88c5+yA9HmEOOyy9ZYHmsfj8XIpEPXiMR2jCfkeceN32oMtoTFa/7SUp
	eXPYgq3il9xE+CLDK6jiD9pV177lVGFn9l9az9DFXvgkeCrPtbioczunjMb/vf21KI5RxXtuu/m
	yePrwkILx+gFMiERe17JY+z22iFIX34GBItk1nbr81E72o8+ugOxDF+c2ErTjE9EVSeru+KruKl
	9Zfu12abAPmMJiARJWAQMenBdNn8rKko43Uvf/jcfO8cVAajgrR52xHmliLgc0yTIvp77K2rlKR
	DH1ZC6G
X-Received: by 2002:a05:701b:424b:20b0:185:b157:f271 with SMTP id a92af1059eb24-185b157f2famr6583291c88.23.1792330175524;
        Sun, 18 Oct 2026 06:29:35 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm20099539c88.10.2026.10.18.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:29:34 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: helgaas@kernel.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com,
	lukas@wunner.de,
	linux-usb@vger.kernel.org,
	d@rrell.co
Subject: Re: [PATCH] PCI: Extend Apple Thunderbolt power quirk to Alpine Ridge
Date: Sun, 18 Oct 2026 10:29:20 -0300
Message-ID: <20261018132920.7407-1-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016052503.GT176164@black.igk.intel.com>
References: <20261016052503.GT176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mika,

On Fri, Oct 16, 2026 at 07:25:03AM +0200, Mika Westerberg wrote:
> Unfortunately I can't expose any of the non-public bits without going
> through an extensive paper work.

No problem.  I'll describe bit 26 in the patch only by what I measured:
with it set, SXFP() really powers the controller off and Linux does not
bring it back on resume; with it clear, the controller resumes fine.

> I can comment on the ACPI bits, though. I think they can be put into
> drivers/thunderbolt/acpi.c if they are strictly TB specific.

That makes sense to me.  I'll move both parts into drivers/thunderbolt:
calling SXFP() on suspend, and clearing bit 26 just before it.  I'll
test it the same way as the PCI version, with a USB disk attached
across suspend, and send it as a new patch when it works.

Bjorn, that new patch would replace this one, and nothing would be
left to change in drivers/pci for Alpine Ridge.  So please drop this
version.

Thanks,
Francisco
