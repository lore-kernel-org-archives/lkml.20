Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718865;
	b=IRMImDEZ0BKFOD5LzV0EeeBOvjKY0E8DKdgPClXFNYqcWFt5lOhMyFKa/UAYShEFa15Q
	 oSgrcVN+IRlM4nmCyvKXwiPNxoktcchYPaBbMuCp/rqCkpPhbJ7r1SESOL6CzB1IRwAYI
	 lD34Z/NLXZidt2QwFYVq92rD1nKdh4g/+gdVuFznKS0W2jYO/wVHvtEHIvW/ZNx4HKP58
	 tViYliFDVhK0ttEFuuj3iCP5G5Ke/Q50F3YLTC0ZbqHjWvqhc8gDuXQm0z2zq+jUnmzA9
	 J/QNThNU5yvQdG249W+ipu+xEo38FqUXps5CQT9eetkWNVOacSBhPlGY0Q1N2pRqJ/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wJ+02nslmQcKlhyZ5fgKpqxNB0L+SRv9NHg/0WiGSU0=;
	b=ZD8Y4x4rdjH9A9lM9knbuZNgSDJqEAdMwK0ismkO/TryJzV2f+kHXhjyhBXVn7AWguct
	 TfBi/m+NzGC/sp2/mdGoU0x0uOEDq7EOc9gQ5FnMLRUhRVaqjQ6flVE/ATfeewt+VGEul
	 FJ+8g5uovrPCbxCJHVbh4O/49dKeTgXWuj+F1omhM+3nD21EIuHQjtEkZDidvmzIqrUJN
	 HxnljHQragGvW0xinI5e5RuIi0i7F71La7RgCzoW6lJwU7/hFWT6QWD36AgKLT5QsdcFI
	 QSB1OI358PvFeg0cxGxQpJrKPb18KHoYhPwg20I2nF9ne0MHNNWAfQKDSxNve08OLkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HKt/jHM9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3A7606BA3E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A3A7606BA3E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKt/jHM9
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36bd3dd31a6so82118eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793718864; cv=none;
        d=google.com; s=arc-20260327;
        b=DqVgEPCMYpBFEzdTi0JSVa1qkGKzvz5ZcfgVkupYN4UKZzuMIc+fleY03kusclZueX
         V/PRirleD9eMTbAxeCAkE60F69b1gJbPqg0KSbbT0RToo5MQFdwgh1chsD/K/AuP6P2K
         ZZBKNZP5X8ER4aWugzvVlAbOA8AoRZz98fwAROiwKGiyrkt9xVRod3P7JyVgyTpMug4I
         AvvpnjrHf9GjFD/z6tJ6ex8upG3zBARKk/pzdd34u5/Dzf2f8ZMrQg5yy/D4V808yYbM
         ZFbUhcS7ixAtJ2SUcF0JjDo15Qa84VHdh0sRcaNfegXWc27BSUuupWAfIcU8sl4h6ciJ
         boTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wJ+02nslmQcKlhyZ5fgKpqxNB0L+SRv9NHg/0WiGSU0=;
        fh=ZhRE55ga/34XWWBpfi322D5UOSDlGExhH8uAnNsBuYc=;
        b=Y91dO8zvJR38wQNpIIXGNz9ZyHfspzEDIr80VMdqWumdMc/NUqQwMImB07V67P/pwO
         MEHsVAZh92LE9RqwuikahqtsNNM5K9q2zXUVLB1ThyG3DXW7RklDdeQ39vhpfft1SjNn
         Xb1IqRzkCHdFI9/RdlrvLOiRCekdvBQJokL+dI9Ii7bR1OoGQCohMNFzJThrvad4NbYA
         NB83QvFmAkCjxpkKJu0lpoZImLZjh/GJNrfRsWDYrGszSjoxO+0PTPonmzMfyLKs6biR
         aam57wpDcftR1wMC3VK/PsGsBUz7NHAQ+oIZY4wfc5ZUoorGvWTrYUerCIab3sL+4kuk
         ZiSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718864; x=1794323664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJ+02nslmQcKlhyZ5fgKpqxNB0L+SRv9NHg/0WiGSU0=;
        b=HKt/jHM9XEa13oJZOs/yjA5VIX1vLAECB6P2DHHWHBS/AhMJ/unDCMTGqjup4r3TCk
         jMrKP/9y/lIXYTE4dIX27mL1KKuVepA6f3y5cXZ0gEXV0Q2GbKay8Hl0Rix1epq/saGK
         6jAcEjkeCmWKS+nZrLNo0x7cTCioPB3ZiIb8eB8fLKOzu5dIyemfwxsYsyJA6LJAGfHO
         S8aoRGAW1vKtticYwDvI+uc8M738GmY/s5PUoPUYJxmekRHTkTI3px5CK0T97hX4MttU
         sr2ddZEqBPAVQug/6b0wf+OaZm/2+hUd3iV6RgXbD/Kx9wD+S1V/sHS5HvaqONHKLi1x
         HTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718864; x=1794323664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJ+02nslmQcKlhyZ5fgKpqxNB0L+SRv9NHg/0WiGSU0=;
        b=DHzp4CLxb5YP1zopNDdo7zvKTLcE+FfDi6gmaTnvPRU5fcovZfeB9DlrXr2866FHVr
         aMwV/UIs1GGiw/1Q31Fw2g/c/8+Q+/dqn/fSGP4vLI1RfJiF9g4HmtHMeLSlqq9jxM0F
         8tU77r1BdkViR6m8kG28rqmx9UBWiXJq04j2uh6p/nF9hGf2MixRHfmtIQu+O+cOAL+/
         KUdGBIOkCPODX+W3htQliDntME9qh7rB4xBHwbs/XoldSWwljYspQPF6/GGYrmwvaHyl
         52o9e8AA81rhwBBHqIFs30Xnna1/qtrNcks1DOoLDBh/z1+xlDbqRpvx2PN24TnXvuVy
         HZhg==
X-Forwarded-Encrypted: i=1; AKwUvBxL5nCA/6gEhGE38VrsLQ92lDEv/U4iYNzITJcNnI9dj1g0ooCthKuJ3/giHTBzaoqIR0C5p6NQsZOhg20=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GUKKceIu6oKp6VDdaOuzwWrfFf24Q93+vmti7JfObMwaaNatv
	tAWv9hFSNo12hDJYyG23W7be2JgvdX8JJkaJJImERHc/lnQVm+vHP9jkLp4v+cybJMdq1CqFF8S
	sNvJCrndcyEW1IZGtr/3v5R8H111EhUc=
X-Gm-Gg: AYBFou1KbdCn37ZkuArp7PDsCUvhdSsdycMzNRhJu4EjRLzKW/enU7b7XN+ZQ8py6BE
	CzPqk2sZmy+kcIbcQmzFPJ6KtEvEe6fk8kX+w6BHiTLFmrvRg1lOOFKao0micXBv80peghQJAsg
	Rc2S05Q27B5NdF6suNVt0+Ql6lnu/k7WgkLs/wUfsXG2UVZEsymGu7gjVW3rZpmoMMwC0Pnr8Y9
	JozXX1vC/gOF6MCR3vJgklkFzF2q2I64WNCBbt2qxbPyEt2JRrPMnyACWSbsT8CzgRfsVFzujjG
	HfRpThl3mQKLRp4d6YaHFAJ/6KWPDQJWiTeykQqwUBJyPu94ta0ID15LjWkfLr2q/lN63z4P/OD
	+KaSusU4DCZmipQ/BK+8lNjxRGnSnte/mPm1Mv4Upp/NuqrRrlJZ5bxqJ+isKo7tFazp9RnwugG
	wlc5MQ+uKJDVroqPwGopPi1Z84DbrzcbHA6WbyRBNVsllz
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id
 a92af1059eb24-1ac5b7dcb2bmr33315927c88.2.1793718864045; Tue, 03 Nov 2026
 07:14:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADnq5_NCB6ur05ZvP0fe9hsgLHM0=y_Wx31G4vkpKH+F7yZ74g@mail.gmail.com>
 <20261103150057.1227-1-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261103150057.1227-1-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 3 Nov 2026 10:14:12 -0500
X-Gm-Features: AclHuK8SYp_M16l6qppN00rSt898kW3_A2MyXrVqqWgCCOaDEzcq5A-8Uxrek04
Message-ID: <CADnq5_N-sobVK3qitqABjqMv2HMyGNdxX0XMXa4TZzVnMv8MLA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/amd/pm: defer UCLK DPM on selected Apple Navi GPUs
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: airlied@gmail.com, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, dev@deq.rocks, 
	dri-devel@lists.freedesktop.org, ed@aicharmers.com, kenneth.feng@amd.com, 
	linux-kernel@vger.kernel.org, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:01=E2=80=AFAM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> > It is the same issue.  I don't want two fixes for the same issue. I
> > just sent an updated version of this patch expanded to cover more
> > macs.
> >
> > Alex
>
> How is the problems same exactly?, Does initializing UCLK later change th=
e
> PPTable?, and as said this is not even a solution for iMacs, so why are w=
e
> still trying to upstream this?, and btw initializing UCLK later with 5K,
> makes it not initialize at all, so the patch is just wrong.

I asked around internally with the windows team about this issue and
was told macs needed to enable UCLK DPM later, but no one was aware of
any uclk dpm patching.

Alex
