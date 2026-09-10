Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1B2355F5F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031612; cv=none; b=bsspbD86trXwc7OkmIHScELjrp7lfYYkb3Uv4xY5+QBe8IGv27N7qgBFEyAOdwBILAPsm82zsC5u6mC8aqpF/XUDOBdZDDJE6BPWrHf4rfH+n9/4ByZ1FpYzEiofylHc2yLpNVVge7Ub+Fkwx/E81rHIvfqyxVm26kvvQjMWbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031612; c=relaxed/simple;
	bh=v7N4avloEV/i/FflLURJ0xPpIvTNdN0tBiLjvOagGJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fx1tfu0DydwM8M+PqVRsOnQMSs5HBMUnCDsqbCjOqPU3LNl1GIiKoq/DDXHIXoNNrU+62Av6fjiBz3/MlkVslItBtSriCZitBih9zEA2S1WT8EK15AEyNuKBg+2SbwSkncbWQfKgtHZiZxE+XkPKDKZCPMjeujcCwQNB2P7i5do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BduoaHX/; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BduoaHX/"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b7aso1129192e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789031605; x=1789636405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v7N4avloEV/i/FflLURJ0xPpIvTNdN0tBiLjvOagGJg=;
        b=BduoaHX/PusC1HRDOaQrhddVJE8+ccMGCIQHdeB2eEiGTY8m22TillXLgt6/e+Gqn6
         CNrOd10e6zd2lUJY4knpDyGypLCRjWWTDurunMVcJ28qXF17wnQfAD4L5md6LxxkeZ+W
         Ua8uPZW/UMbWmQBrgtrITifDZJ7hWT8rapray9lfvN6i3he/WXQ33ResCTlPtpdoTmtW
         /D8h/eJTHm41oCfp3Ba4nMjkgSA9N5Q184MDfBDcBG5saDFP/Tx1Mu+eaQayqvW51sJP
         rGL/BO0pL1yPS1GPjCiT6rDSO/cIQU9VbgEnLBPCmsSKJ+WugSgNxbW4ZCdnNoYU5nHr
         ZS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031605; x=1789636405;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7N4avloEV/i/FflLURJ0xPpIvTNdN0tBiLjvOagGJg=;
        b=UrBLjPF+lBiYLc4OWalkq65vVbPwXABXHveZQCIMDFfGTq7uV9Vp8SHcz2i3IoZmy6
         RsWBkiMZ6uhPGmNI3dO+Kiw+dlxCzhhD2yhcE2EOO694N6pzvtHyJJZIQbhix2eqCfiU
         A8M6tOEVSdhpw7L0GvVOlFpkBB0W3uCGFaL56F78vm5qMlqRKqxmhDf3udBX2L1EpX83
         hwJtaTO6vBOPo6FFSBN2H1J3ZE+1ELUtQCzPlHaNl1VF+NqbcFZb+E+VFEJ2IlpHNED+
         r4tQzhvcvIZ+41HOPrlBaAa876RidGwQ3z2zggPUMEXuaNO/Bq3u7gP9D3BSQQYfxeHP
         d+3A==
X-Forwarded-Encrypted: i=1; AKwUvByn4SThMb6/PQQij1NFGA4VyVRL6KuxT8E4d9Dhr4eCpwNfpM27AcWiVwyQwuiPXblwQmhWeC0ymD0Of4I=@vger.kernel.org
X-Gm-Message-State: AFuF++n5b573F2Sy8BVk9d6jNRnjQXtgvH4VlhjwwnYEW4KLMnhJWLU2
	XqPZKKm4G0uSDxOUYLsPcBJGzoh+L/7aRHSyQBsvRLKzP9w8tvDrpAwda27pAnTc6t1c
X-Gm-Gg: AYBFou2LaMJvTpBaDXG8WPNNYBPPOzmoKYbMKaa3o3aRXkqRMLxaytsBovBZZSXSdQQ
	wDkTZmgMulV8S+b6dfAoxh4us6rI9gsXiq+WoScG1svV0sAvQwXOb7+N5Rx7gHmmXypq2FACLt7
	nuVhmLdeXC82O8/TtDMjfm5qmwQ/FcyM5hbtGHQTD1XNiJjU6c400WBi0yaBiixMK7ZoC1dF2gR
	7YOy9nMKu/kU6yfrbUVXY0KpxoB+4uDoeRQcwReIfvzK2n6OOfpBGGme+TKM/+efwzcfGMDtvy/
	U7C7B9QuNPzxK8S386lSyKB7xjUzhXUTlKkIVkLBAU+qV7jirQzOe5QRkXFcboJcbkYSEWMWawB
	ZsmpjwY9MhoWak8A6oTh2mufTleyn3TC4mOoBRUPjZI00rZxiEidgofvAGPRTPYw8w67LMeCENw
	h2CPVppDgCc4Yxm7skKfgWtf1vo6bkRjq7bdCD0/71KK3pdoI7x8wkhvp/PK53ZNUeg8HLxWs84
	opJGesRtAFjywAAjo6wpeAg0w093p2gjcZLAftV4jmkcjbwqxy3KQHBGseoYQHo3ZYPBnX8Ni5m
	mZIVqY5YoIiOE/Sd
X-Received: by 2002:a05:6512:b9c:b0:5b4:3ddd:8996 with SMTP id 2adb3069b0e04-5b8986d1bbemr1928844e87.15.1789031604614;
        Thu, 10 Sep 2026 02:13:24 -0700 (PDT)
Received: from insciwin.localdomain (224.105.88.34.bc.googleusercontent.com. [34.88.105.224])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed2b7sm4336333e87.14.2026.09.10.02.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:13:23 -0700 (PDT)
From: Dmitrii Tulnov <tulnov.dl@gmail.com>
To: julianbraha@gmail.com
Cc: nathan@kernel.org,
	nsc@kernel.org,
	jacmet@uclibc.org,
	yann.morin.1998@free.fr,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: warn about malformed KCONFIG_PROBABILITY values
Date: Thu, 10 Sep 2026 12:13:22 +0300
Message-ID: <20260910091322.4-1-tulnov.dl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a6171a9b-de34-45c2-90a3-4e5bc185e700@gmail.com>
References: <a6171a9b-de34-45c2-90a3-4e5bc185e700@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Julian,

Thanks for the review. I've addressed your comments locally for v3.
Before sending it, I'd like to clarify how the new warning should
interact with KCONFIG_WERROR.

With KCONFIG_PROBABILITY=50% and KCONFIG_WERROR=1, v2 and my current
v3 still exit successfully and write .config. The warning is printed
directly and does not go through the existing warning/error handling.

Would you prefer it to become an error when KCONFIG_WERROR is set,
while remaining a warning otherwise, or to stay non-fatal even in
that mode during the compatibility period? I'd lean toward honoring
the explicit strict mode.

For the compatibility tests, I propose comparing the generated
configurations for 50% versus 50:0:0 and -0 versus 0 with the same
seed, and checking that the malformed input produces exactly one
warning. That would put checks for the preserved interpretation in
the submitted tests, in addition to the local comparisons I've run.
Does that sound appropriate for this patch?

Best regards,
Dmitrii
