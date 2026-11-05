Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.227.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793877098;
	b=2WnKSHSS+1R25sAekvmWKNZoXdUcmoFi8tEPu/SzK2zeTcJqIweg3Yp3a/bq/vBtCxwG
	 CCJtU+38Vz6g10qQu7t6e8NyFjFH45r9SeBtYZw4FgX/zCtnNqDfjAZoDkDoyhLY5WCqX
	 KD/neoBvwsStHEwLmNDgGE2vsoHMl+cY6stFMNmIMHB857w84vHi0ODRDSE1BFjR9nCkq
	 5vg5kldqJhXKfHESvFDNSrl4/MPcJDsCeU24ITLXkZAmT2yBArNdsbcYZKcAJ8OYrjSrq
	 ar3BqLBrugoAkozNq5ZdV58+lefiVBd5jSkMQTQh+pzWy6vaJOmCqxIy1RFqXbmvbXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
	b=uCtqe2/w8Pycb4VgaJbJCz9z2trWlikaCQ+1sFbATL8yn65Iyc997tDVPv6/Pb32dfj7
	 JoE4V2ZN1IIQ1uVoS1XH/1yTrRM+8lCpC7/XvorR10ySxUjNf3CoQJFWHFjrdp9drxNsX
	 gYjjQDT6U9zADqrFNyZQXSgM4ZIx9X8Ri0Fe9NKOo89bHVVkrYqw4vH/iAynO5AF/JQWh
	 ymsB8LIIXhvahVrWSVRphnLJ7QYA1V0BqA88ClOjO8GBa248NR8lXnuGzw5KrnrzrfID+
	 CPyTweWMtE6+zbiCzSFK1cXJLLbQzchUXFRIMBEEL2Koz1dCMErXwTRTHwEZoQ3ISMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCJHKpGU;
	arc=fail smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F23606A336
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09F23606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCJHKpGU
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2e7c8213b09so6493735ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793877097; cv=none;
        d=google.com; s=arc-20260327;
        b=CDr9qeJWH+ob/tK9deBk8OZwRdqI0UuJzxTWibaey6PbGAgNW3N3wWVml5UBvMxwuV
         fkB3NVfgLtautuA9Gd8Dj3iXfYha3mWxzKGXR2WEuvDVo50vtD2CZ5Vla7jOCZ+YPElS
         oG1ywHY594pxbYblS0bRpnTcaZ5jbAvr/lKszBwYS7wbiq//RIq+EXpr1vhrPKkw0vfx
         YQ9/s+FVaeopNyvhTeXJ4ONUajflftkiMTSHDYQHhWleTQb6HqhCZ11in3jtPU7FWIeA
         1mcWDQ/aD2lBS5t3LgZn4SbpPvx1TjgF7UGUQw3PHuv0bTlaLezswNBt2UbAIdwrvIrO
         AIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
        fh=ZL6hKb/qkkXpeAv2kqwVX1+4g8X+7kZFFiKah1Ug32g=;
        b=YC/xYA+n7eGFB402HCTD6Vpkhv+Oxr7jwCu9GMgiD0d49Q+a8E14GD7jvam/zZU4CI
         gMot/faQvEN4IBgAgURjupMWncQHSjVpjMaftjuUuxvlsQejr4BJtfo7Rz4VqC7XTWFV
         j+dKkNsZeR+TYCs/uNvSKU/X2XiA2KJlwK9rwRCrnxcd/ru0BTwGYjvkiRFNtbpb6j1Z
         EYdddf5qgB+DK1xf21eyeMNDm2DVyEmqH9uzP654vvCp6ScluCrpiRWkrtQt9T/lT3ZF
         wGkbIdeCbRSbDXbBt87RBJ2FMTnfqV6+eZyE7CNP4lQCtt3VxfqrIG0+CsHnpp+4rClP
         Q0Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793877097; x=1794481897; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
        b=xCJHKpGUq7uzZhoQ74QyaADEcbOAnTn6kZVHVUMQQjBb41VKKpimkEb2TmR1fjgl3r
         s9eYFKxwfoGMN6yrGs7ZuT+oBN6HNA2n5EaP4pUGcfKjSh5pI0S1jllEaiMar8v/40Zb
         wZ5WRM6oKOTA6KlZFC05vsGytferTk+vVQ4u0R+lyo/nvZkH42SsIdR7mW+fzVN9IKZU
         w/Jt+eF6/yyPr5W4NBKk8TGb2JUMOu/GrM+791mRV+XDmJ98gnbjThKYcPS08UeHNSNj
         iOiAJR5dH4MnNhcvcO+rxiw0jV/PiX0acPFVoMGTzdRM8L0/Esjv/B7j0nY9EivpJKYb
         d/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877097; x=1794481897;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XuSFZPqiwo0/+iUG4wYz7aJW1g1w6mQvKfCSFgzt1nw=;
        b=hpKnRxagc9ZvvborPpsVjO84okHjYy504132RvzWIgsJwjz+I1xep/1kpH2nw+T9Pr
         VvSmD8NROvJkCBc8DR54o2mH+jUnVu0aomqMlpQnLcs6c6UJ3Z0TJE2MuuIfYkwLig0e
         RTBJYVy5vN8h0saVdyzxv4bt7A8/9XXlqNx9bNdIpEm0qd95jAKib6+TdAOuXKmBDwzn
         mJ4SdcOJbmxzkYoxmhJYLmfjgarlIqklqnVvGqh5PVcJBiS4PZhL4erNgnno0iGmAuv2
         +T8PWOE2ipXq5tRrQVqsn/X9U2xUnZVbC5E2MhdJofWEkXUUPH1QsFbry7uhE+RlZsgM
         /QNw==
X-Forwarded-Encrypted: i=1; AKwUvByjzAlqptZ8FbmvPjbOpPm2tUi5sgu3eKmTc37IJqwWpeO3B4V9cZ6oxc0iZGNX2yzv3t5Wvt+3ltZHhzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uTuYrCXil/FirT03wOZex2If9PB5W/J0finUFKXaTC+gAe1Rg
	FhY3xZkrjCTapUHhjQUmRm4VoUkScFj/OOfvo+vC7ymD0rfwaTnHPgu5ny3dMMsLRnKwIoOiNmt
	Hhr8UK+iBMGPhvdLj5QSY4m57r+dZXw==
X-Gm-Gg: AYBFou37kPPpIP47NBaDMtWwKEqEic5Y6uSvaRcdKmsWqK70P6UgSUufihnbfSmcfRE
	FoQp7e6YVno5PAAQQsrH5aFlAGJ61cwoTfSspScT7ZfxPKa1jU8MYYwZue77A14UNOVlHbizKay
	vxniwOeVf26tspACjtRW6aMg77t0Iao59SIadNWXVf68Aq9GFEjHQewRehVqj5Tgh642qbBfks3
	aXVMB1ujSrW/EqO5i2OkhUucW05VIXm4QUVoqf3QtC1pNgPh8ha5d8QDTSEHBxE4ghJaz1uZ4UH
	Cd2uoCUR5QFI7tOKry0a3UNzWfS/oyOJNna/xhwsSXbJd0S/S9oZEk1H+J0wTi55lfMMf4Yrrhc
	L13x//G3+LTs0RtdYHLHl0WpIIpsFbygCOCVR
X-Received: by 2002:a17:903:3205:b0:2e9:5714:608b with SMTP id
 d9443c01a7336-2eb364b11ffmr186637435ad.34.1793877097307; Thu, 05 Nov 2026
 03:11:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
 <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com> <b2498fed-5420-44a3-a215-02438b623ef6@oss.qualcomm.com>
In-Reply-To: <b2498fed-5420-44a3-a215-02438b623ef6@oss.qualcomm.com>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Thu, 5 Nov 2026 13:11:25 +0200
X-Gm-Features: AclHuK_K1rA2ODQYQXEgmmGIBBNJicth9b7WPHwdpfBELTwGQmOcDjIv1-lq_Vc
Message-ID: <CAARotkeDeZAY-rxXApYE0qs_-kYEvLX8e9UjjtEVFH83Q+ogKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325: Add Samsung Galaxy M52 5G
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/5/26 10:10 AM, Konrad Dybcio wrote:
> Drop the reg and unit address (numbers after the @ sign), since you
> have a memory-region handle

Will do in v2.

> > + /* NFC chip power, switched by TLMM 42 (no consumer property in the binding) */
>
> Please fix the binding

Will do: v2 adds a pvdd-supply to samsung,s3fwrn5 and makes the driver
enable it, so the regulator no longer needs regulator-always-on.

> No superspeed / displayport?

No, the Type-C port of the M52 is USB 2.0 only. The vendor DT limits
the DWC3 to high-speed as well, and I tested it: with the QMP combo PHY
enabled and the orientation switch wired up, a USB 3 stick still
enumerates at 480 Mbit/s in both plug orientations. There is no DP alt
mode on this phone either.

Thanks for the review!
