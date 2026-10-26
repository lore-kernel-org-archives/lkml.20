Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025779;
	b=UXl64qPaWRA0QnsbzGcdqR4zOLvoC77Jip4Xk7NveKE879PO/27A6uPFOsMMOE4pjUUA
	 /yeaA8V5TWrRVfITwFiso7AAqrt9FcDcBekb1LEp7+3gMfhDF2qT9ZqMgu319E8qtqaBT
	 2MtRFUKFnN8pzQeyYsX8mU8Z5m6uGzSFq7OokslUlxGkqjSZw/9wBH1l0JS2n3FXnZHRJ
	 PNiSHXhWGV7CipJVYCnr4o5i+Rad0BvE+nb9atrGA/5CICe8gM3EhzWk7SdjHHAPqioNX
	 +C5kkfBwkA1SY2SHwituJ4S+snzn9j7e9Lgm34RwDP/qjVBQ7FxgJjGXplolaIiixwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:
	 In-Reply-To:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=py3eSCH/kMMZStYTruOia2CNu7tRlswpZyoC5eSohtQ=;
	b=FfhilwYShzUGRCHa9CFPPvAznUM8mQklMPBHP2PBskRmm+i/DeP5BdGXq3gZuxUIpPjd
	 P4T5osX56koPB30F2ROMi0yQ2iTePx9PaHbteMpYPD929jLaFhjwbOxMWWJYwXARPSSWT
	 oI+puexaloYU20F/+Mt4f3m/Y0H9JkdD509WgNfzgLaczkbl2tBcQ7ClXR2457z7BOUlO
	 L1hUHSumzSr3xcG6erRGkF1a+y2Ja7qoYeVabl9NMQtBcZsJ9gvA3+0iT48lqlQTgfGKb
	 WTXmCbh0dtCWDZczd2lpFV/MoudkdtiY9c2p2HO7iKsnUqgFrnlCHJp28utX7c6uouA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Sjo2ss5a;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2160606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2160606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Sjo2ss5a
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so4302948b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793025778; x=1793630578; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=py3eSCH/kMMZStYTruOia2CNu7tRlswpZyoC5eSohtQ=;
        b=Sjo2ss5aQ2dVEHWf45qnSnSEFkoJnTfbuEVwIGHPPhnFs84dZacKMID4PZAHBEpgMI
         kzrCjPH4AezauNyEYGpRisAl1HIXVwO50z0jysSU/GCliCrOWIQA0FY0T9aTAyp7mGNP
         yyOD0lYJD/cAWBtWjUEmenbXwzeas4gaSL/HbyD9z4T++HPXM2viZRpbAK8+FfQFr5Jo
         i9XT1MBX6QcDwtLolxAsu8e40QK5aXBsmQMhqUdxswjiwXi9dN0gWBbRq7lMReo6kc/y
         X5YGILHUFtd7aj1DOJwKmOMgJWk64QTlJ39q1S9A0UUlhGREjNxqU/I7Mnhy30eNb00q
         TfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025778; x=1793630578;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=py3eSCH/kMMZStYTruOia2CNu7tRlswpZyoC5eSohtQ=;
        b=KGn1prKNvVernCSO32a5k7zL71UfJZ1q74pUo0ymKB//Gq/R/5E/tU1B9vtUhqcqfu
         RbH3OFNSV1mD15/IUy7TwXiDLaBxAtl4psIspTGsQkhZpHJMLx21AFOn3qIt1m494Brg
         HumB0q3P3YhhY8RqQRoY0EMfFTB/Ktc4FaghFXUvBbc3r4T244aPcR09Hcq93DD8uES7
         Lu1lk8EjTb1LZwBWLBK1M9R7MpmNEV1/8Mm+TV4U4FFXntA8MxBeqgkhrMwJp2afVcQq
         D9XqMyo0546MHL60X+Q/cCDWEtT6158qPpSoDo1lT/tHGekBFOX7+f242ROiw7Xn2WtT
         O/PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiAiRjGahij0n5+GxzG54hzZYpWKPUEOomCxbLIfT5e4x6uYiyeOBxlU8kCpbOcEJvNIRsoE4XqZdiuL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ+PlkyZzKIQRC0cHM6YVYAxf+GBn+z0+BsrbHITKR1FOAEdBk
	lqBH0E2pb1uyAiwYu00DOXn0ZkGC43UwHRiS2ZyisdotB5f5gcW2sDVrkvpOpdL/D2/ey10p2sa
	rF514HEwkcxS1DQ9bajt3Pw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from pfbho14.prod.google.com ([2002:a05:6a00:880e:b0:8a0:6a08:e927])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2316:b0:882:359f:ef17 with SMTP id d2e1a72fcca58-8a36715c0ecmr5483904b3a.12.1793025778027;
 Mon, 26 Oct 2026 07:42:58 -0700 (PDT)
In-Reply-To: <20261026052632.1848929-1-hy50.seo@samsung.com>
References: <CGME20261026053046epcas2p31ae8a493f40c0f12523feec6e036072f@epcas2p3.samsung.com>
 <20261026052632.1848929-1-hy50.seo@samsung.com>
Message-ID: <18e21b71f8996bcc.3137322e31362e3131332e313435.1c875f.0000sendgmr@google.com>
Date: Mon, 26 Oct 2026 14:42:58 +0000
Subject: Re: [PATCH v4] scsi: ufs: Change the error check sequence for auto hibern8
From: Stanley Jhu <stanleyjhu@google.com>
To: HOYOUNG SEO <hy50.seo@samsung.com>
Cc: "Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, bvanassche@acm.org, 
	kwangwon.min@samsung.com, kwmad.kim@samsung.com, cpgs@samsung.com, 
	h10.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

On Mon, Oct 26, 2026 at 02:26:32PM +0900, HOYOUNG SEO wrote:
> v2:  
> https://lore.kernel.org/linux-scsi/20261022074249.3098100-1-hy50.seo@samsung.com/

> Signed-off-by: HOYOUNG SEO <hy50.seo@samsung.com>
> ---

Please move it above "---".

> +	if (ufshcd_is_auto_hibern8_error(hba, intr_status)) {
> +		hba->errors |= (UFSHCD_UIC_HIBERN8_MASK & intr_status);
> +
>   	cmd = hba->active_uic_cmd;

This brace is never closed, so ufshcd.c does not build.
