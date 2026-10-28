Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793181489;
	b=SNghU5FwWDWhx0GUxHImq/ZNevbDJRuXo6Z91PFVZDht3TDeD7jCBZxzBUp1xzogjyZt
	 N0UB4aMh/gBgXkBzBvnUxuh+92BoLIobj+jO1KElmnqfu8YxA3d9AeaCR8pU0EC8qCOel
	 9NiEiiuxPgyI3MU93OE7C83l5H78th2xMm15VDMV5qHeXiVeQcT0MxEBs70SpXkpsu3Xe
	 kazQ0WO9FlBx0JvWOaMPm4jjenkA4MqghlGYdIDdhmFKpjHMN/Wc3ZwEEK0CNoVe2zB8r
	 LLQqimlAVVfgtGk4pq5JQqyxLiwNJ+K3nR2ZOQVeEMdj2yihcHLPa1d0BoaejJuelsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=41H9i+urkxTO+w/0ierDFemHP/Nr+s16bY0dL3YAOLQ=;
	b=hKqIrtEXezC2IqGrxcpGPXx0QINxwGeg78IiJt2u4vzH4vK/nJ17Uq3Ksy8fgzgdeMuN
	 Seot9KHGsYDAuT1SwsjIvv+dBSShF1Cgcmq1LC0/G0T9UKfNsMmapj5QXM2I4F4d0YydX
	 HYRBLBDuhD4X86f7BkTcHmtWtdPctMHLlKW9AUTTZGeV6HjMJtB85cmNYpk6EwcjD6IbW
	 eehUhnG6yxAtRV26JrgLQJDvA+Qo9vHQ0ZSYNN3s3aTtKh0K9Yi6AZ2/UIy30Wjtl4tJq
	 VvMvEuGN2HN03zvVu1wf5+mN8Us69ptJC3QfRpdqGuAGUREb4OZvUaMCgOZCFBmDbAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mR9bQWfr;
	arc=fail smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CA6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mR9bQWfr
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e812e2b31bso4021575ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181488; cv=none;
        d=google.com; s=arc-20260327;
        b=IUwmq4gS01PHReUcSdzMtVz8X2MMHZ0zN5HPBmBRpBriec3gzTKwOMuqgvHaqRb4si
         KNjWPQovogxEOlkiCaLV/ZQNVpMRg335FYK5ydBAOPle3kOLQNMP8WOSoONxOsoekT1l
         sSUPSGWybAxSsza6GdevefQFTPvvOvtf18YUuZ5wpOcQ4FAloeRw/qVb/VlGyHJbLvwu
         ufUwtlPwuhEDHDGizyb+L1/HCsDCeqbWJfsFRRX/UPRnby9ICqp+S172YuulKzHd/Chc
         OM60tMjJ+Di3fZqsIcK32FcVqKBmJVz4Jw3NxQT2bxW72ga3jYVEVWQ6bf93mVEYuZn0
         zJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=41H9i+urkxTO+w/0ierDFemHP/Nr+s16bY0dL3YAOLQ=;
        fh=7RLGV8sskiO1ncws2ZurwLo6nK2VpII3miafcQu4FkI=;
        b=VM02ksrWT1TVg+MF41cy3f4A352uV+Bw6RYgj0R29xlq9i2L0gf6kNSvMK3xDD4pTM
         Dcziw2k3FsOFeueabhAw+gC6ApSL7y+nfKwyj8Mpnp1Xo5VOTuQqU7SBTFGVh8xfQWJg
         nc1Id7/g89vy3tk1pfqjvAb4oLimslO5Ncy6z9EABHKkuL7TYxKIaEJHwQ1iq/GriO0o
         o+Y4C4VzyK719NNYNOmiokXiVnm2rKHz+c/VVvaC0/3rwYsyF/lIjseCd6C37gdDpu8A
         /vaOBOD4K8ydJwksGFZv1uhWd2Genun9ZeWDDRkodWRdBXf3M5fZGwIBh/YfK0GtY7HU
         xidw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181488; x=1793786288; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41H9i+urkxTO+w/0ierDFemHP/Nr+s16bY0dL3YAOLQ=;
        b=mR9bQWfrpQSEyA8w8vQQpTeb6rqA1diuIIvyEUu0740fATagH/JiJp/CmESJcbGX1t
         3swFfulYdW0H3Im2yFdkr8hucynKr3+xmi8kKfQgoMmr0+/ZHpKkwKjdYD+pAxW/5ypb
         qGND6lIi7HdU2Z3J4SBr2o/5Ada+bcwkR7VI0cinq7eo3GNUPyLrtt3LBzt0CS3D6cwO
         b/7ZAXT+9dxEI+mPU0qARLR3FgwDiwbOm3FX8rYXcUC6wUgO1vtEc0NBM7VHtzW9dYZC
         25X7sJvKuLP/PrkfCXrZxOpQW6DTF403rb4OI8mqLYx4rqCTid4sxdU9jqW3FQuxO96A
         qpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181488; x=1793786288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=41H9i+urkxTO+w/0ierDFemHP/Nr+s16bY0dL3YAOLQ=;
        b=x5sYmHgvpfancrZ2d4SeoXtrH25BKb/UEKJxaSL5sYTr3PXfO8Gc94ZHBkk5qZq/UX
         IGeIwRhpkZDhmEsYJhih0gh4YPupFYqAeI/aSVhHC0euL81uWjZKT4dMeluTLNhGRwyh
         9AOSow7sPJduB5EdLmrcOQLJjhiUA6muLRX8vfa9da6kSW/Jvvfuqt/W23uN0Ex9q4qm
         49Ix/Bni2UzCYHj+xHBAJuXV4E17OA565/UgR0FvfkDC4NFDLsGk/y4NJFl6T9XXdqPD
         OKntT27rKvQHgsfEAf67g98hTDni42pMqly3jOdPAM1Uw6CUdTi72aDtfFLTg8RLpFGk
         Vc2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzaSm2HVlXav8nwt2Tyth6nRH+iVF3zTNSMldqV09MsqGrIc/ng6K09STdg66o+g/sFil4XHE7qC6OA6Yo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYRcyUSPuCCmtF2nHiscH597RHYQyhIAH+a9T90YmTv6l8j8R9
	wDeBiWuYnJWcq1vCIR23j0g43mKZl9bARefC6RkDcty3e3ZU445IDjexa99GUUaEFXf2IpHEh6C
	qCI9DzaFVG3CEF+W/RJ92yzT1DJ+HpPA=
X-Gm-Gg: AYBFou20rhgoUZPF9/BCjUzix1zwPIDK9WtLpk64Bkv18pdfWGwpajpP5kD5FcaMHHk
	Mr6XXSsSCxMYp3ixQcKbh+ppXF+dmetOSA5u08xNEDZmx/t130BnQA8KDhzHwPDja0W+pWwc78U
	nrVyGZlnZmv0h3vNGp0PpHN6NVHCe3/A583GZMcXjfqGUiafGQif6/sFRuiSBRwM12loYFjtymF
	L4NRrvB0o7oFH4mN6d45c8/IGnTrAS+SQtBcWEiZ10YkZ5sckTKtmdzfxB7pWHeV/nzD0IAEpZn
	1qWCw+cjMyWHR2bTECv1s8P92u/AwSfVnsPnT4AX8PE/6QPvIFqgOk4+B7DaMRUB5DtG+8ZznGK
	FTm2vwX2qk7JclmTfoxBcVGGqGih3tn/IqzfeV6lHHEhxSkkEd8sek+1QRW4VmcuMtkiME4Q/UF
	CP
X-Received: by 2002:a17:90b:1845:b0:3ad:50ef:f5ff with SMTP id
 98e67ed59e1d1-3ae580a0810mr1345260a91.37.1793181488076; Wed, 28 Oct 2026
 02:58:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-3-644d389b2de1@demangeot.net>
 <CAB95QAQaogxV6KO5kpv9RBpzhhmH_N3Dvvy=nqWHOG6qAQB_aw@mail.gmail.com> <1fcc110e-7269-44de-a415-1848922f75f6@roeck-us.net>
In-Reply-To: <1fcc110e-7269-44de-a415-1848922f75f6@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Wed, 28 Oct 2026 10:57:56 +0100
X-Gm-Features: AclHuK8myNrcWnb-qofZFRDe2ZMmZ941r08XlIFfykt2gE8457WimKvkwEaJGN8
Message-ID: <CAB95QAT99VRMofNC-nVL7uhwf=otgt4FWx0X1Bf_aoxpOfCgAQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add water temperatures for
 MAXIMUS IX EXTREME
To: Guenter Roeck <linux@roeck-us.net>
Cc: remy@demangeot.net, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 17:21, Guenter Roeck <linux@roeck-us.net> wrote:
> Me not either, but that would (should ?) be a separate effort and might
> take a substantial amount of time to get accepted upstream.

And a hardware with the second EC, unfortunately.

Eugene
