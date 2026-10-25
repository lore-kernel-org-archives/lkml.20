Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792937944;
	b=4giYksmnkUYuGgv2cvdaxlEAqnKK3ACSuhzLDOnH0btODDjt0eQgz33l2oBdocvouiRK
	 5KFCrgzUmxnhiCEYdKUJ0jf3uS+odgeCWpbeJdSWmUvmV3IQHMLKMMxa6rbeJd89hA0kx
	 79TzPs2kk6LJTTQTJ1DXhZUZPZuBPmVCNdNwxCkifpZb9jsSJTBt4AEzF2ST+TJVVSurS
	 YHNryDfDh9rixH/pOIl78gKVYLskSP3vSdoMB/xakpSBmF3UNr6mZSXTon71iH+bXaupB
	 B3IBprS1sMcP97+0ZK2FmGOEp8UTaFk/LXqUp2e7ONu9RkQ2rwAOvAhwLreuj0zyFjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=e6eB5/+HfPV8iGsvdknKspHRvaocTX1S/a3F3L9xITg=;
	b=WhfkttKQOMaHWsNPQxREV70+30ncLn3fLRAmC3IUE6tGSA5v/mhaAytGtgtIub7InK/2
	 0s7c9OH2Nd1hkBCCU4Zt0i+4fRwukZ+XWXqaXA5QHVkQUxzw14tlEoEKXbw5SAlc4Vrth
	 JQ3ip3X1Ql5uXf+mXXz4uw4woAEJLMYCQGtmkUCYvec9Z+2jChpXFDuohy3r7JuQmhjG9
	 XriTgtgDT6lsxhOW0SCVlFmD/eDzPhIFs9FcHIxfMSAnGPtSdNAUgxPUkwFtEx5+9GMHF
	 LTDMnRFKMqaVepkaDfI0YxlrsYAimcl4Es7ft2ZpnTzHnu6PNFXvs0uDs1rAmNSI72Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="krKMF/a3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB0B606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB0B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=krKMF/a3
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91b55859245so13567566d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937942; cv=none;
        d=google.com; s=arc-20260327;
        b=FY6b4dTWcik08apo8mrsCkEjTEteBf6AR8xRcdbZesBkmWz0fWr2JEfTM+y2PICO9Q
         dt3DOKSrPNtX6iMV/gIf8y93uKjkhp+m5e68YrLYzWkNGFPvZOR2Y9N29wuNYCyKfNdy
         GK/N7si7Fn/k8QumKvLa14Cx9GlYrPGYRZ6ec9Mrqb4FKt6jJ/Qk5Kf8kjoa3A+lQzy6
         ly4FZZMvOVnN5O+zvSZEEmlPaa4r1IGx94pylgBEDNYtYcjwrjh31V54W5iM83AWW4hx
         rjEcPGzAUMalF9QkaioT6SRw+16jGPHdzhBeoLAVIiw2ObJ6xxvODeOjQnGU4C1T6wcX
         CNlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e6eB5/+HfPV8iGsvdknKspHRvaocTX1S/a3F3L9xITg=;
        fh=UxrW7Qv8ueVaUwAw6R1XeFuq3txr4/wwz1krc3RUL64=;
        b=IhcrZc4X5B8Odqkhp55LpQQudh8bh+bNvRxv6NUB04zY9YVcr5qxoppXaMPN/v6aRN
         w8cFdodd4YAg98dr24WYmPkObEE50eIteZpydhbav6/Do13oFYcH23dASqB7g+dK3bRW
         wB2D2BtXjlkFXswukxSuLaFZKlzvfeH20HkA3o8l3ckU7uaGwSCmP0GO7x7wjgdAecja
         afpCnJ/VJpm734pbyBNkRrm/3Q9dPRFNAY5xYNlrfPLXqb04dhyz4XoRNxx5/ov//FjT
         wuIoh0yRpMazVRBKssDGnBgY2bSjwroVu4a9kSQ0/AnwmdtfPnxTZbyqVGKx77zytOUJ
         Mc0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937942; x=1793542742; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6eB5/+HfPV8iGsvdknKspHRvaocTX1S/a3F3L9xITg=;
        b=krKMF/a37dmQMGFgWjgS1lgoM6RJ0MCOZs2MWdstZSDiAD4I9yNYPYzczmFXh8SJsI
         X28FSziCwuvSXswP4y7ixvKPZ7NchH6arExeiii8VSWMplzgyw/ORvp6ABWkIf0Enupb
         yey4Zc7e1QS73OWCgkKQY9b1FSwPqpSs8rHkdyG4f2BS/0bTp+dptDnI3yMt6cykLruC
         ZgGQijwsYWasLpv/rdXpNMNr3f54Drm3vbjXd04NrfbQRgpRLvocSFadd958IoRLup5l
         p8QusmI21ASpHemoe7AeBJ7fGN0SkQaY2pkF2yAZXS4vztUb8ulLC30STQQLoNQnICz8
         7How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937942; x=1793542742;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e6eB5/+HfPV8iGsvdknKspHRvaocTX1S/a3F3L9xITg=;
        b=YQ3239pr7sQVE/C1zYj71qfxEOWUwdvFLqG5C6AzbP98g1o/kN09fiIjrgtx3fQalT
         1yDS/L9VVvbs2h2fR/xIx4BpihByRg4elh9shgS/T420E/t7jWlFPWq53ZmmRBstCxiG
         9H8Idb8TiwaYfIqkDckZQLNl+nDheWzgdh4cB6Fk3ZvZARlibOvd9uimBZFyyBl4YpeK
         WAMPWk7OMzk6bAZEG/xOVNvTR4D9gKrMZ97B+ehwYpFrZN3ibqfUtB9gdVBXqEbLzEPV
         /6iKknL0OiaEYUIyTH2xVScZxUO18TUSVeJKsVcOVx7ygJO8BpVbFvZg2gPTB3PghuG9
         SZoA==
X-Forwarded-Encrypted: i=1; AKwUvBxF0XCKW7MwHL2qA55qnjRlUhANnRUmOa9ZFLIex9WBts6s8U5jMmrbzrIgaCLAyYxdv0wkySHyD2drVrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLrxrfzHiJpmXe2AOpNBD/vjc8wYY6VfAJBXOPTMNaq0OgSlff
	GxocRaas3JKjWZLu6zqdWh9Ek/dQngeonm85JeyrscD3p8fYGhnRkVkqg+zAK5qKDpzINitHU8/
	/YkC/7UKyIeZsk/3ZnK/jQ/xkfK+WJlG1PTGLg3A=
X-Gm-Gg: AYBFou1Qm6KFuoeHfqmMj2Spw0FeJkFFxdnNL0J994AXzOZfOOKIRkAtaSFW7aMad/E
	EADPxW09Js37DOfcjwCV5wbmJ1iAWGFcx3Tda6UbkiwbNfVaqnd9P08wpTOdyTddr++Px0CKsb4
	gjRySbeejqnpF9qCRkBWhaBKbwLwnem02f6Z3lWZj8b2jL7X+dIVs+zpvWOoARcfMz4EKrL7hTY
	osq+eVFqHdzAm+1w3bCBPUz4NyTB84cl/VzYfixXf/jD6sSX8kWK+UtHXZSkvL/Hrkl550N/a+u
	7tfyEIUSPzlDqlKdmJM2eQ4ga9BBiZfJj/l46tWgt49pay4FQwrWpB80PiS5i5tl1yo8NGYfK9n
	jtXeAAUXDvEC+w2CiIP500XIWNwaaZMc31ZJ3k4QWxv4A4Lrvkkas9zy+QteHxCddYlhlmosb7y
	Y4lJJQqvFAXOkRdZWf4gqNbUiyyV/Q3Id6IQDetNizYzeY7PnP04A=
X-Received: by 2002:a05:6214:2b82:b0:91b:5d39:e140 with SMTP id
 6a1803df08f44-91c48f143efmr72761506d6.53.1792937942225; Sun, 25 Oct 2026
 07:19:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014162921.450235-1-steve@sk2.org>
In-Reply-To: <20261014162921.450235-1-steve@sk2.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 25 Oct 2026 11:18:50 -0300
X-Gm-Features: AclHuK9O3SRqSOfWpY-PAriDEEl8Pmx9Mwub1R5Mhg0M9i69HhGFGrrSKFIMqcE
Message-ID: <CAMAsx6ey3CMZrsMH9HfJdU9o+uGySAGvLWXAoAdfFSF3ZudoTg@mail.gmail.com>
Subject: Re: [PATCH] docs: ext4 filesystems can be converted to 64-bit
To: steve@sk2.org
Cc: tytso@mit.edu, adilger.kernel@dilger.ca, corbet@lwn.net, 
	linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2026, Stephen Kitt wrote:
> Since commit fe12931 ("resize2fs: convert fs to and from 64bit mode")
> in e2fsprogs, which shipped in version 1.43, resize2fs can convert
> filesystems from 32-bit to 64-bit and back, so the mention in the
> checksum documentation that this is impossible is obsolete.

Hi Stephen,

I checked the claims against the e2fsprogs sources: commit fe12931 is
"resize2fs: convert fs to and from 64bit mode" (Darrick J. Wong), the
v1.43 RELEASE-NOTES say that resize2fs can now convert file systems
between 64-bit and 32-bit mode, and resize/main.c at v1.43 accepts -b
(enable 64bit) and -s (disable 64bit), which v1.42.13 does not have. So
the new text is accurate. This was also the only place in
Documentation/filesystems/ext4/ that mentioned the old limitation.

I built the documentation with the patch applied and it adds no new
warnings. checkpatch only complains about the unknown commit id, which
is expected since it is an e2fsprogs commit.

One optional suggestion, which does not change my review: in v1.43
resize2fs refuses to change the 64bit feature while the filesystem is
mounted ("Cannot change the 64bit feature while the filesystem is
mounted."), and enabling it also requires the extents feature. Since
the sentence replaces one that was about a limitation, it might be
worth saying that the conversion is done on an unmounted filesystem,
for example:

``resize2fs`` in ``e2fsprogs`` 1.43 or later can be used to convert
unmounted filesystems from 32-bit to 64-bit and back (using the
``-b`` and ``-s`` options).

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
