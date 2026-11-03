Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793714792;
	b=qwdz0XvJSDjSfvLo6JCY7/plXi4sG1jvObu5JcqwjfFClk3IXMwuXnxtNAR4WySnl7W8
	 rMgQI6aW+rkH27RbipIS7sH/jiAg3Lkr7PW1Bmr40Rx4pFziRVdLBghjVxI7kOeSvsWBz
	 vm97eaPRyiDFVF2vR2AyKVrXMPPfYLyiMy9m3UI3MoSf/PQNQMEUukAOepX0wvfMGeCPO
	 ogTrgjMy+Hh5+qqmbqRceRUJvWfqwyrBZ5kLV7wChPP75fbc6ouwEjzV4rURuB2VI6L88
	 CnajcPcWrPgZI5cH7s7RlPWNjH8IkI0HeOX7lCbVAxc47pMRM3ja4pFrFRXHArdM+nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rXy+hT+GwvN91RjiAPqGZZe7u+gyV8gNKc/Oopg1PG0=;
	b=qO6tm7HbG6Y5+0IahDy09bxZt+GOX/O8Kc3zoFDYn7x0Sh2U14dQWcSa4TjI5T59E7L4
	 G4SznuWo47XoH4SG75HMu8rbTui7fVfI8OcjSuUNOmIBqWWGXRpF53IaAKwrHTbrfl1EL
	 SWvub1MNHZ5Onci0sl/jLxkELXSAX/j5rtbtWQwCg2MdJ0llO7iZ2ssw2MrAQ7pnH2hb6
	 srZYbFImKrUbNzl6nU8/0IVKq5kYWEpbNjjYYGz1uuoXyut/y15OLcd+qFmAi51pWMLyu
	 ipPVK/9rtINqpS7HML1QmoOZL5V+m/juDqOjXV4aPKxPulq2I4NiSBC4YbW1CPhRYFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnhRH4q4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC67F606EE93
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC67F606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnhRH4q4
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8470d7d430fso1516457a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:06:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793714791; cv=none;
        d=google.com; s=arc-20260327;
        b=cMBCwdTALJi4nGeo/aFmoQDZzwZ0ZzNFwCXDCFCstop0qeA58U924p4bLPNMSJGJmn
         qx2cp1fzPzziTBSEbbyfWXTinMZZfksj2HKzM55bVC/L2Q21AT4X5RDgADXr2DItoCqv
         00gOH7carr/2eivTSRFTB1A1aWeoAqtCmaM/tYng7FI3XoBeT4dCor3mrwcgFiKf4JyV
         lji+PoBxyIh2/qaLyBjyLCVVh6nHYaoMFDt7mVFLaaLAe5tNTM0jYEQgh6ym8Ih9A9px
         gSbRqziLTuKuzIPk8pSvqWMq7lx4AvNb7cxQGYNqHU6XjoW+fMZhiUs/D/RIVfxZ9NMk
         vobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rXy+hT+GwvN91RjiAPqGZZe7u+gyV8gNKc/Oopg1PG0=;
        fh=yxT/njflJEfCIilBJd5oiqT1uUMxfjJWwGJlf+4YdB0=;
        b=TRhFN1950T2Q7V/Rc1MqSWRHAWzqlBP3HOY2dFLYygp59b8kYIiaLdsxRK3rPh1eWW
         NGpq8xkvOpPo3GecP9t5HxIbnSxWehJRYnIGfSibM4mvliak7HyI5U1zaIyNwvWYkJj1
         Bs6DLFBf4A7c/zkc9mawk8LtBmlqaIjhLFyTTLriCr/EPlgZwbD9+l8nHlKnkYJ8Aomo
         nv/J981MGD5UCzh4dPDRqDs/jXJcDagBiZQAJIyvqxHeh/X+1Wi/T717oo7TklIX+MaF
         dttZB4Am6y5cLn/nEd6DzX1gJ9wJ+y3dmGv8wZZa5n3fnBfh1jkLeRCr5IV72otzMYtL
         rbfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714791; x=1794319591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXy+hT+GwvN91RjiAPqGZZe7u+gyV8gNKc/Oopg1PG0=;
        b=MnhRH4q4kEx7MQV7Rveki/MdNDXRe1zt023+RsTRp9ZgP2RKoKBip9q3+52kK1z81+
         J+SrpZbE3mPFTr97SFKGpBZHbx2vOHLztgUKJGNuDoCwkJa7yTfqOJL/+WbeeS/kj6Lf
         pop1st7WFkcaMg7e7KhcGXiN9gl8ISnWW1X0PnpbWFA8dMnjYUZna+T2K78K7QTg0aXP
         APg9pg4MSSJPUhy0peHKAU4G0leLOdzbGiCRXqtqerLqxYGt7OKn4L+jaiKAua+u6Ydn
         tfKdonCTEocezY9or2iLYhuvlK+OaD36riqELJfDrgMaQKK93Ehu5Otc3QT1jmTtlhhY
         3Wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714791; x=1794319591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXy+hT+GwvN91RjiAPqGZZe7u+gyV8gNKc/Oopg1PG0=;
        b=R5jRqW+LWp+JMDj1B1HSVyklb9mYcDh9ujXSERWkb4FAMIKjEW5t1YII4OKmYFSUSv
         u9BnqlQaCR8Vi6AwnqCySd86DRsyiV46/eaas/026eFDMYcR5MYEJE3E4oZaJK80eMaW
         Tt+7YH1XjMArTYECPUYJsEOJ0TpgKHSgf6Bkhn4aQxiybedeBF+j8xmF6AE7TX1T8Q+L
         YOCFL7C5Hknb1d0NxLYJvUle7jd5siRfNM6Mvd0UIfHG4Yoz9x6jjjxrXan2RQKrHSOp
         2PoMM2YQuj0b5PxWSD9G3K2Ujmmbmiz6rqkw3ojN68W03sG3dx+2OWimXjWhnPi2+fq6
         kl0g==
X-Forwarded-Encrypted: i=1; AKwUvBwo/jpd6mMisD86WHSzUK8ltVf5wUFzHY0AxGUujprvJfJ9ZE9jc2dZEal6WOUZU14CVr65rNcDHlK3LY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GSEi/JX6mI+ZDg4hYenJfLDb8XWFaSS4sqq/ULdT3uKOqZIGi
	cEBZc/6zehbk9EFfnVrYWo1S8JNZITVUJWEI5VlYADZFd1rcMCWg0QlmcGtFx6P5NOrJFwfK69V
	Rath2tSFby/Ie+p56eeAalxckUwDr3DI=
X-Gm-Gg: AYBFou0K7IDRjxZxgUmzQk3ZVVmZo4RbAl8Tfcd9qEtJG/NABJLMudIlYmzBPtpcYlD
	lPuca5ys40CfayfHqEvtG2YjS/CQN8o4jVU1+8NUfQ7CO6HpD3NBabyyt2Ei6LOIApgm5y2y2uD
	P4YXNpRgQ/CA7czzEzXzWYWP1niLAPva6tkq5MERU86vzxLWR6TnDNAVMRpGklbOrFme3VYDjDO
	E1HLPFLjHLuYIsj+Fp60wwCmFIRTSxYkygT2LohnJXykO+yZjhc3ODC0odH45z6zafMIdx7jigS
	aTOLK/ryplbHLQZcQ3Ub+mKBx4+VdF6fDsEpqU/9eV0DkPocvpusGdnqRs1GqJZOeqLWKZcra67
	DFg9pk32wGGgK0oo1MVlDxUHuqUHrffmhto0vhROktZY2Gu/0ZTFLL+Dncg4DvCPsZ/91U0DvNF
	TGXZfv42jo9eJpAW6XSwZYWGrY/q0aJo7gZ0WN
X-Received: by 2002:a05:6830:2647:b0:823:e626:2765 with SMTP id
 46e09a7af769-85d36641a21mr9639694a34.31.1793714790698; Tue, 03 Nov 2026
 06:06:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103130131.4069212-7-sashal@kernel.org>
In-Reply-To: <20261103130131.4069212-7-sashal@kernel.org>
From: Ming Lei <tom.leiming@gmail.com>
Date: Tue, 3 Nov 2026 08:06:18 -0600
X-Gm-Features: AclHuK9jA1t6T_L1_qeaqjfhfdt4HQoTqtOL_ZuGwvDN3vPKQfefu2TCWCSIAkA
Message-ID: <CACVXFVNhw7HP7SkR-1aokfOguBprsSdGBPtkZ-DyZssz4XaVAg@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/ublk: use the configured kernel UAPI headers
To: Sasha Levin <sashal@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>, 
	Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:01=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> With generated headers in an output directory, the hardcoded source-tree
> include path falls through to distribution headers. New ublk flags and
> structure members, including UBLK_F_IO_DESC_SIZE, are then missing.
>
> Use KHDR_INCLUDES to consume the headers from the kernel under test, and
> add the headers target as an order-only prerequisite of the ublk
> programs, as nolibc-test does, so that a standalone build installs them
> first. Baseline builds fail on the missing definitions; GCC 14 and Clang
> 21 builds succeed with the output-directory headers and target liburing
> development files available.
>
> Fixes: e371b9d3368c ("selftests: ublk: kublk: fix include path")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
> Changes since v1:
> - Rebased on v7.4-rc1. ublk_cancel_ready got its own rule next to
>   kublk in the meantime, no other changes.

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
