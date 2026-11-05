Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845485;
	b=SqQvkyFZCIg6Fz1wWClepDSr7l9PnxI3HQMwFCHQNq2hLXxnwcUVY9DyN2xuxOILORrC
	 Tg5BxPOzbRFD+gnt7H0aCQCWWHywyqpFXGSYaWS1V0GxAoJCcacp5t1gSVjgbB/lTMWrX
	 ijVfWwQQCW/WflZrvAfhzLcd2nb3gIwdO7gpM/Yu2PPmizOmt7G34uHpvIFS6UGt7LUOq
	 PjG23D1agoPjtuBZ38AYEFdzhDkHurVUG7zrgpflugMy0cpgIIoAzSX3QRIXzk/Y2mQb8
	 oav4WV0VXBoFYS/C/62CsHrL3kg+dAVg9xyh11UvjyBv1/2fQCjIuKepiRgX9jrJ6mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=VUFf6jwNeGXVvbspON82vI4aFLY01le+Nblo8PEzIB4=;
	b=ekHVGstXFVarbC97N1I9lLVi6ORo7eTLa8ojnca5QVyCnoRtw343SdpSFvBVgLmuYiQY
	 +C9a1f59+QqTq1ycCuhq5oB8kRD3j5YsqKLz/A0k3UBr9OBZIeEva6xX6nqBvbtAOD1bU
	 UdFcREqdL+IUPfyu+Q0i8DMu44T/KQvSkMLm/ZGDOFXKbThBtnpJv5CYu48vOq4vBOwma
	 xvwhPbaXvBp2Rid0sne+2TwVAa3O44klB0eupACvvKc5+tDRkThI8XbERcpswbxijt7tS
	 hW0XCei9qIwZLtLEm29t79XW1sQlPyqgq4BSRCj5pO5L+MxuunB6LkAjfttld5LNgjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kooy8NWJ;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E55606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E55606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kooy8NWJ
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so1048597b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845485; x=1794450285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VUFf6jwNeGXVvbspON82vI4aFLY01le+Nblo8PEzIB4=;
        b=Kooy8NWJcFmw3Z8AeCPgH+MoCRF1OjxPp9Pmw31LD32CQgMJIuqljx0i72RopmbDqI
         JiiqvLAJFk0EwLa94SAv+JUznGaBJCnLizW7lTFSx5lNRJiLDCEDGSvhRNDDnWTuI95b
         GvgFcbeBDxyfYEVPx/pYwppXEjoIy/TcKPXs5QK+pL6s6RTwZxd7l+3p+n9vQmvyoAa7
         qkrsTZYBdwifySuGJFkPUq7S8LJtljSrkVp5KA7pECrLsY2bNztY3uCr8qTsIaWbZsaa
         70veFGunrWXxMV+K/V5uMW14o4irHArOhs5Dx50SPkuT1Q0g3Z4Ltr6aD7w2xgD2cybw
         1SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845485; x=1794450285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUFf6jwNeGXVvbspON82vI4aFLY01le+Nblo8PEzIB4=;
        b=t0niEh5l9LdWafWUFuc6lc8EMEcoW4bZO8S6A7a2Aev8/N/vX1qDWPJsWEEP1/4B2W
         fqEjiKE4vt0njRHy2gNYu7cN+Y6bCIBSXmDavda8nLZ+veCMmnUuFAgN1MosFVqRenp/
         Qa0Mb6KQ1I/xgSjKs3y9wzILGto3JJMAAJpIYV0vreW61wQB58QPTPOw9Ax5VnSWx5IR
         k8NFAt1EythoBMNtgQVZ47MBzyBm/DkkpDhGvEk2sZjrO4fL9w+mrAcwjgrm7LFYq1iN
         Hs3vgg2coBlkP7fufvqePkHWFAiB5vQsobaK/o7aplWA0qX3mWW08f0G4ZKWiBncOYX9
         mojw==
X-Forwarded-Encrypted: i=1; AKwUvBwcVR2VtuYFxYu0JO9P8d6J7rTfkbB2lYoz+KO0zp5thzwCCAVApGkG8lzEyZusbIjfO0lghSOnBGZmlR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jeSZ40vv66pNEFXXdZWhYH430G2qt5eAnllR6+1Prgs/fLmT3
	DROsn1Kta6hoRptoargzN20OwtTGfAijJ+1XCqlhHX1z9JDCIG9mYgMM
X-Gm-Gg: AYBFou0PZMJa6E4AGNJq4f1ZT1udmNGG59ZSd/Y4Uk7iH50ZUB/TQ+5WgeQVzRjWNs1
	5lySYIXPlj6+X8lpaV8+07cG61tqexC+RFvGZT7uSCYoYh6ZKEdFDXL5diG2VR75BXabKF4qGjy
	hBigV+kGNI+Y1ZDIDc/jzwP7gHkTGzufsGa7DAmdK/WmTxX2Hf/AibHZWKCXgCIt4yvu6yNaRqY
	e9L8ZQcgAjy2ceLfJO04IL6787Ck8HboWae9J1aR9JTyJciZiDsjag0IiXEtdEfsPVl7/vKr7mv
	Mo/36XLrXK+vK3QjLfe0eDgmMYzjZHLqgJ19w9zR3A3UmoLCQ16X8Ca+m75Czx0M/wzkJbBAMtU
	OAIx34a6Py3D+8oMiIp6y+7m44msaMCnmBG3Br+lyjaL771Zz6IzuElFmHRCZFGzj8OTAQfozUT
	HTeI8f7PXLGR13hZ4rVKifEUbmzO1Hqp0lTHHkzgk9nPJZJIH++tceCNYfpxHzKT9i6GlYFKGWs
	CnMKvixswebQGsDmG878Qm4ZuGMjHvBQ4HfoTadfXdM7tlRTMJzfsBskLiR3FT7ntgB75E7zRlh
	7Ztd7ZnKyWNkujRLJQxZQLkXRenBMbybwH2f50jlcX/vMyU=
X-Received: by 2002:a05:6a21:f11a:b0:3e9:24ea:64fb with SMTP id adf61e73a8af0-3e9289d8f84mr12476900637.41.1793845484456;
        Wed, 04 Nov 2026 18:24:44 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.157.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46981369sm1577747a12.25.2026.11.04.18.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 18:24:44 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KEYS: Protect pkey method checks against type removal
Date: Thu,  5 Nov 2026 10:24:39 +0800
Message-ID: <20261105022439.11846-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <auvG1wGifSsoCuaQ@kernel.org>
References: <aun7J2NGn57RGS5J@kernel.org> <20261104021414.50696-1-0xbeac@gmail.com> <auvG1wGifSsoCuaQ@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 01:59:19AM +0200, Jarkko Sakkinen wrote:
> Please respond to any questions *before* sending a follow-up patch by
> properly using email client and quoting etc.

Sorry. I'll answer the review before sending another revision.

> > +	if (!params->key->type->asym_query) {
> 		ret -EOPNOTSUPP;

I'll move the assignment inside the if block, here and in the other
method checks.

> There should be an empty line prepending the label.

Will fix throughout.

> >  	if (copy_to_user(_res, &res, sizeof(res)) == 0 &&
> >  	    clear_user(_res->__spare, sizeof(_res->__spare)) == 0)
> >  		ret = 0;
>
> Why up_read is not here?

To avoid holding key->sem across user memory faults. After asym_query(),
res is a local copy. Copying it out no longer needs the lock.

> Please figure this part out it does not do a great job minimizing the diff.
>
> There were similar repeating issues that I did not specifically point
> out.

Agreed. I'll keep the switch, allocations and error handling in place.
I'll move the method checks next to the callbacks under key->sem and use
shared unlock points. I'll check the other paths for the same issues.

Thanks,
Yuansheng Yang
