Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F4D339377
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790126562; cv=none; b=fkp00FHuJO21Ono/HYVCD27EyMY6L3PxaLEdhfpX/8R7UWyLNVX6P1xTOT7VLv8gYIitWY5CmH03KA3nMEumqxdFEwVEY45cWHAlkh1mwxqnLM4IVELHdQwCk9B9SVbJuQro/aDEuEnauUPixoLXGBzIKnxk1NNqeEgCQMF7OPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790126562; c=relaxed/simple;
	bh=+h/tQM1KRRz94YnwCuXVu511Yz+gseQKHqy43pFBzq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYW4OB4sjxYKjqobik3G2w9aaKhYfelkw60z+B6NjdX/Q6ugrtIG96FPtElMCdQkysBmj+W/xC2/DcyITbbBoqDcS3fydPZ57Cld1cNv8lll4nmgtjPZf/rD0CiGHSprfsoxDkoFlx2dM/KwalcXtY/GFZLj5Nw7ZkK5oxlitD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wy921TE7; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wy921TE7"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dec5de01eso78096a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790126560; x=1790731360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+h/tQM1KRRz94YnwCuXVu511Yz+gseQKHqy43pFBzq4=;
        b=Wy921TE7G6KUWuVwkwRzZ16iM036rQS5E0LZMW4uXXGx77jeay2GOyMoEdKuuxoxHz
         QLh0PsoUevwrVZ32ehW1FrRHrXOtZzSRKwjo8wAKTBJ4us88RTPvboVeQv6LG01jHMoe
         xcYRPdV4AsSrPheo8RAYS9d2CVJX73KaEBrBLm6oLKj4pYAaA6SQS7Ognn3KxM8nzTQq
         E8dSg5V4QUnBFYJZ/0woKEjElYcSGXmLS0IVT6xh8y9vApOu369XbZe+aoK/bCZ72PW2
         twIPT1ugSPeslxSCFCAoZF6CJfruYKkTTnqzRpLpCytVdVuXtRt8F3oIKG1K8/AlQ+/j
         apNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790126560; x=1790731360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+h/tQM1KRRz94YnwCuXVu511Yz+gseQKHqy43pFBzq4=;
        b=iO2oo3Pa5TJ5LIeQIewaYNSP+6Z0uUkCNawn+W7apBbOopFxleoc6zlYySMMcwXqGe
         yVj/od/5e1cXEVkVts/ivvLLmC+swZOxzwYAFmh6qYOdI0xxNevdOrKvdXg4r1RHnutA
         8wAq1KQ33JUkr0GCbJxk5NeF+2BSa7KIu9Y+qadQjWf/adbWq1y9VNWx7Qo/M+jyXUrl
         FiQpay0L1DawfQp8B3t8v8PcuglN53Lf7TGZC/S/n4a4+jF5Aa3qHtnFUH0b8wJf7cRK
         ZgifNidy4RQb/O7F23TpLjwuWWrbGNBACJMJniu1sTiqkzhly6J0BwJKj79uQ2QauA1e
         Gdzw==
X-Forwarded-Encrypted: i=1; AKwUvBwOUT2TSZ+dNoRdQDG2OaXweDPyvK+PlEa3UJHkYzOA8O6pktrv0njkes4fn60xwJx29IRvIkd6mlJZmyw=@vger.kernel.org
X-Gm-Message-State: AFuF++lruvMeE2q1yo6r1adIYgNwD9F2cI6Gx/zzlq5zryUxdAkeaF12
	Lf0n1ZM6u7+3/IdU8TogK5J+SYaYNov6GHRikQin8gvjduAR4uSFkXyo
X-Gm-Gg: AYBFou1Kn0PfwfPcIsmNMirDERhMxKuQjZXFx6AYKUnbrhretPjA9vuDgp11VpOOUYc
	EW7wKMec3DUBnBzXqVKrZDW5ldmbhawRdh7L01O6FOQWz0DS4fwreVOMxPldIHF4IL8HRIUE2Qk
	QAEbJxrHzWeSzokPlY71p+5vWJ3aoKhLXy7J+v5x1UDznyqoaFrbwm9/chxXNX3mEv+c3/kDVWN
	3SwjYyo4u3t/hlgBVMsLZRJkWiTkNM0/FJpupOg/48EVVJa/fSoC9ct/kQSspC38fl2o9DOjyhW
	BNf82WGmW581+cybpu4POwTmLMzbixehZw1jVzVMWEQ5mu+no0U6qs7aVItWNxkPtgj3YYc4lRQ
	ngA8fauQcTRc4/NZ3Ow95xXbwOxJ4Rkx7SQWrdlvCxxujO2Rd8a48VDSi/j0pZdZnIWRNIs93zA
	ARnZ2H5nQKChdJlIG6m5MenqlQgbXUgAo2+wmJPpYzf5DD4GVHLLZ3uvGTJm8KCwHTQE+U5FA7T
	+5k/i96dgmQ454r6kPCg2/ApNYbxJZcDsjKum3GbBNnRVcCA2UU0dxuJX1QnJIQ5ReGp57rBUF/
	8QhPcvYMMOpPN8WIJ/DePgMZjqus3w==
X-Received: by 2002:a17:90b:4fca:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-3a07e773d26mr1573460a91.6.1790126560258;
        Tue, 22 Sep 2026 18:22:40 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07de1f20bsm1784885a91.11.2026.09.22.18.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:22:39 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: nika@nikableh.moe
Cc: emmanuel.grumbach@intel.com,
	helgaas@kernel.org,
	miriam.rachel.korenblit@intel.com,
	mpearson-lenovo@squebb.ca,
	linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/PCI: Disable D3cold on Intel BE200 Wi-Fi on Lenovo IdeaPad Pro 5 14IAH10
Date: Wed, 23 Sep 2026 06:52:32 +0530
Message-ID: <20260923012232.240305-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829093922.37103-1-navonjohnlukose@gmail.com>
References: <20260722021321.68902-1-nika@nikableh.moe> <20260729125202.33719-1-nika@nikableh.moe> <20260829093922.37103-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 29 Aug 2026 15:09:22 +0530, Navon John Lukose wrote:
> I will post two small iwlwifi patches for this as a separate series and
> link it here.

It grew to four patches and is at v3 now:
https://lore.kernel.org/all/cover.1789333511.git.navonjohnlukose@gmail.com/

Nika, if you can run it on the IdeaPad Pro 5 without your quirk, a
Tested-by from a second machine would help.

Navon
