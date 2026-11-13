Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599100;
	b=Hx4QDswni1wzXklyG30kLZAQ664je8pcLHc6IQlPQyRyY1+vtmuVjNXb1EHo2UlgPcdO
	 2Z/T9Utj1QxLG8kFkI0vWhvcRlVI0e2u7euM7rPFjIRlfCsAbqGRm8GiJX+Iai260ydT2
	 zNSgqaXFdSGfVScyZT+3F4/cqqgW/+FNxNIgbfSGmzjKRMJmxVbr5YrVY4Qv+i4VFnPvr
	 Qkw0NezrgcSdT5ciy+TmzTq6w2r6i4+4RO2arHzcIOJNe9QfnikehVN6efBLxZYqotwJN
	 SQx+IdptOH8tiMNfCLtH/VUq1aWW0kE3wDsFvhE0U4GeuHPflIufelzaoUoKNeEb2xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=TSQaVzf8K6j4RVfK5HDz3FjLKLxGcucq+FqTpajAUEk=;
	b=RXIoyPoYD7K1pnCxcaiqmkj1H69JHxVPgtPKz0GodL+DcTwgqe8D7wInbIiCR1zdXwRZ
	 8fXWae8j9SJi2n7pFa2GNZVzbGmKqfYDTiwQVgNGhbHZrY+SxPGPUTQ7Qr5yhiqpOuAqa
	 2y6xUTKpAynPhy695H+2qCr6g/g92EbPtue6yRXEyXES7GxPRWCeIKlZbWlEM63kDmB72
	 C9rH/7lCIP14ZqFro88COxh1tiv9POeFKcN2ZFF6Z0wek2i4UXtfz0hjePu7ZkkSriaFV
	 ZA1adMpCEkoaer3rB39EhXXIPKytpw8CNX+z3AJjzUOKkHHE1bQvVbSVJ93Bea7djHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F30Xv+mS;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A27606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A27606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F30Xv+mS
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4922523d1afso674425f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599099; x=1795203899; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSQaVzf8K6j4RVfK5HDz3FjLKLxGcucq+FqTpajAUEk=;
        b=F30Xv+mS4lS0O8CpXMoXKeLA6GLKhjJmrWtumTTHsFSFRx5uuE3LGWPibDRVHegjho
         YtR5Pwn95fi02QbWg7Q3lDLTOQ9yO348o4sBjZOu1RdJRS645jcczHhDF4Ob9P7ptWli
         AoOOCoB5EI+pMpioc7P8RDlf7FyuvWnrsNn7uWId+7Wl+8F0mV1S0w+p/qT/DjXeaAjv
         aO+lQ+rtwcWYTv31g6g8qLUdFXBIZB3kYyN4tkm5NOJjnM3KSTF3lLfxEMO/zSB4PbYB
         v8k8eIwbdGAw2nXgM7Zy9nfrKPZCdsJWydnZf3KgSlo0ySEIDDXJzp6bWbgmDL7Ixqfx
         25AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599099; x=1795203899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TSQaVzf8K6j4RVfK5HDz3FjLKLxGcucq+FqTpajAUEk=;
        b=zefepljLRQlJNSBGzji7qUweQdCG12mlkTQgrf9Mp5sc7P3jVFzu4lVu/QCEJ9KK4B
         qk9jM77rGrpZb3d3x+uctblOP5UBE5C6Ed2ZUGE1i+WcljpEdiZzOrrtnpIbc8Aq/Hiv
         GRYgte6znDWnBDx8mN4rIxoXrZa7d8qX8dJkIfThrnv27sNbxDdCW8mI8he6PYQfvpV6
         1xK/izl/8cfcw+mmyAVjwtu++hF+wS6Vou16p8Rntxp+eIlIGVZuNLIg2qs7yFqbj6v4
         T86kE8Ltadgdc0K1OGMgk1MmBbTumwiZpAxhBmJ3p+WkBTATbFLvR74sAZi24VrkaSNL
         fWTQ==
X-Forwarded-Encrypted: i=1; AL+hErG5e2cpeGToDQvBwMW+R3aJrYtj/r6Tz9oPlG07GpySkqCE7bW22YUniFeswyqDxozQP+rDvSSu6oydR8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9A5F3QQRRD7Y1kYPFBdmdL4tr7F9YCSEZ22YOEuzq/3Jx2+xcK
	m3COeoYQqhA1/gQYeU9e42ugCE3rI0m143BU9LJ9VvytMi5hBCp4+P3uV1IlZmEc
X-Gm-Gg: AYBFou2X3lmB201wfNe/lNinNQMRzT4ZYU8+GS+qBUsBcwEMpTBIXZJywYlspekIxuo
	EvGbhAryb2dwrnaJ/jWtyMv1pA+e4EVLzkwoq3TCm7w31CG1PqcCMrextNYcRZAgqGbNUtivBlv
	q21kvjurjCfcitps9z0pdnXvQ2jqRz2mgEeg1KO7bz8UjMbpEjivopqiTwBGDXSBlIDqqwXLvsV
	sCLB8/zUJKRn24MD5HBSrYYlm9XDRIhwYIM4g8OpCq4RNSjtf1QSjn0P7KpcRHm3g/v77MeVqf2
	jsVS1W50pX1fOOMKT0yY7jzNiXhkpyyIB4tsg2KP/PREGihv+MoEx85GkhJaZZ62giFu/exLPqu
	40BA0Ehc83B1iVNmJqrLyjm5pKwGBCU9uMGJk+10YfoKRSEuz6Ih+rdsbYH2eGkiT1jPuXzRC30
	Yqh/pqUA34fTAOvfL4sEisdsFrsELMM/h6j5VM7uf1l9v1P/rTtUNZwf81KXHKmeesLgDv0WeQ0
	61QYKHdSTTrZwjqtMk62w+UtzxJST0pT1XE05Uzf4fEsZdXsR9/hYmM2husXRM+OGM7KOfwiacI
	8zPJcjBMzSpkpbCPiK24HoBQg+y499mHnOKm8h6CwxRjI0URKxHKvQ==
X-Received: by 2002:a5d:5c03:0:b0:492:9630:6a71 with SMTP id ffacd0b85a97d-49c6fc9dbe9mr8723383f8f.1.1794599098394;
        Fri, 13 Nov 2026 11:44:58 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6647059f8f.12.2026.11.13.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:44:57 -0800 (PST)
Date: Fri, 13 Nov 2026 20:44:44 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/4] landlock: Simplify landlock_get_fs_access_mask()
Message-ID: <20261113.a18c311fd502@gnoack.org>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
 <20261108-b4-landlock-refer-nonfs-layer-v2-3-2b405fc1b3aa@gmail.com>
 <20261113.ojir0eich9Ja@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261113.ojir0eich9Ja@digikod.net>

On Fri, Nov 13, 2026 at 12:25:36AM +0100, Mickaël Salaün wrote:
> On Sun, Nov 08, 2026 at 09:23:50PM +0100, Günther Noack wrote:
> > Return the handled FS access mask as it is, instead of artificially
> > adding LANDLOCK_ACCESS_FS_REFER to it.
> > 
> > Since commit d6c7cf84a24f ("landlock: Simplify initially denied access
> > rights"), the merge operation already bakes the initially denied
> > access rights (LANDLOCK_ACCESS_FS_REFER) into the a layer's handled FS
> > access rights. -- They don't need to be added explicitly any more.
> > 
> > No functional change.
> > 
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> >  security/landlock/domain.h | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> > 
> > diff --git a/security/landlock/domain.h b/security/landlock/domain.h
> > index d9ebf4857fce..812c324cb6ef 100644
> > --- a/security/landlock/domain.h
> > +++ b/security/landlock/domain.h
> > @@ -262,16 +262,12 @@ static inline access_mask_t
> >  landlock_get_fs_access_mask(const struct landlock_domain *const domain,
> >  			    const u16 layer_level)
> >  {
> > -	access_mask_t handled = domain->layers[layer_level].handled.fs;
> > -
> >  	/*
> > -	 * Handles all initially denied by default access rights, but only for
> > -	 * layers handling filesystem accesses.
> > +	 * Initially denied by default access rights are already included for
> > +	 * layers handling filesystem accesses, see
> > +	 * landlock_upgrade_handled_layer_config().
> >  	 */
> > -	if (handled)
> > -		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
> > -
> > -	return handled;
> > +	return domain->layers[layer_level].handled.fs;
> 
> Could we add a small companion KUnit test to make sure the semantic
> doesn't change?

Sounds good, I'll add one.

I'm running under the assumption that what you mean here is a test
that covers both the upgrade function and
landlock_get_fs_access_mask(), so that that KUnit test keeps working
in both versions of the change.  I'll stack it as a separate commit
after the first of the two changes to landlock_get_fs_access_mask().

–Günther
