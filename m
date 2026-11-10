Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322840;
	b=09OHuYw2f1WIyfkqXqWTqkxD/nVZklgOacLTwLryY7NGsk0yxV1oXKscpCmXxY8oyzc3
	 xJ5splmZny+x6L9HpTyUgzxwVhOtE1F0j1ZY+IfGxleuVQqxmS0mXpzuQiHSZgUPN7CQ3
	 DAg3Bhfj4gAWDHK1F3u9x6fnuWOpQsDJcuCS44Mmtd/Mnqf27aFx8hC73Y0MWmna2dLDz
	 XC+iiFf1ye1kfgvINVvhUeb9jnbVuCcfTJOS/7Kxk4zyAaOF5jrbZenTw/VKmhZWrdmX3
	 JRn8fNg2YmD1/5NFOC+Z+Tb0aT2LjxXW+FKKcH9BcV1W5haRH1Z5eiqh1AojZ7LTRUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322840;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YzZIHnwUb49OQ5Ge1hfLtzEhOshkFMXkInmhEVBjARo=;
	b=b7YRjsyilocx+IE8Q1BzHZqM2ZiUrjo9WrDJioQp1qrHxTCQZ0XIsijT3fiUz/0HKZQQ
	 tdZc32JJdggrzw3aiNB7N4o4i81Nxo4qbwwQLFVRZU7iwx/aWy9RR/nRya9f4ZUcddEen
	 L71IyfqCRE1uOn9Xlch2+FKoRGrkiBJIUYHP2izC+M14LbdlbFe4cppFkqxi1VCLuJL7A
	 /0zqH4kMLGZBInmnGCY6M2M7d3CUpXx4YZ1cCE3NthGcltj+n0GqCdnWeutt9XoAW0IFl
	 sV/2iGWQBGnYApXNaTlD7S3OhXeTLRDL0dgL65Kzqr6w79i3xlAVKA+iRtRgA6M81vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c9UsD3KW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tusOz9pK;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D705A60A3834
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D705A60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c9UsD3KW;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tusOz9pK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794322838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YzZIHnwUb49OQ5Ge1hfLtzEhOshkFMXkInmhEVBjARo=;
	b=c9UsD3KWmStb/oKxNMAK8SFDP0/vCTrWIN3buDC1DNThRqTcg5/sTvamBndQnu+V+XGxnt
	/7lvtSFG4S0HvKIqs3MdDrhGoO6g+9c0p9Lk3f46I+7mRMYIXrDk9byNjb/gZTIDJ2Sijt
	qxOhinJ1kBoNcrudMW5rd+u4G01EBwE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-VEyLuGL-M_e-XpKnO_mrMA-1; Tue, 10 Nov 2026 10:00:36 -0500
X-MC-Unique: VEyLuGL-M_e-XpKnO_mrMA-1
X-Mimecast-MFC-AGG-ID: VEyLuGL-M_e-XpKnO_mrMA_1794322835
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so1857155f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794322835; x=1794927635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzZIHnwUb49OQ5Ge1hfLtzEhOshkFMXkInmhEVBjARo=;
        b=tusOz9pK2ic6QyHtNsIwAaalvgbrOb/B1eGmJzxXoiJmJf6dDJCGS1OUG6pfXHX92Y
         FhKNbyYh106vbiIJ3/1TUPtFAL82MkXSmzhDy2aXSjfrIIc6D62s5+6ArVkrHJJiqJb7
         UplRoxnkE+ebe9N9+9XDYXLpm1oOUhKAyqe6uvSiBNpzmpF44ereoOr+sZZn5qcA9wJL
         IbVv8FmK+XZ+ntUE93Bbi/0PiJRTA3xiWRy88sxLQpwXLx4xZaz0ZE1TCDvjeecJ761S
         EVha7EUO02k2gLMEcepy7RzQum3wDjgDlph6Pzv4quqEGAKuHlAsQn/evjCS5FywUX/2
         y2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322835; x=1794927635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzZIHnwUb49OQ5Ge1hfLtzEhOshkFMXkInmhEVBjARo=;
        b=rTiNUmC/n/X8NyesuKLRlEhgjCDD/GCUAg9uaLac+P1pZhNDxQs7O0HaLsjjbPOHfi
         8BA4T/0f88QuSQBnkvZYH9NH5B3C56Oa54WkTBGhKGJpGrMveZInlgziWV45pZl1316o
         VCJnDSQZSFHGT3O3/hjvg/xjGFcBWmEOtwI9z4ZlyLOj8VFO5lr6Hgu2qJtNax3iMAtl
         C89YJj9uDRvNTHyowIWxOb8mob8cI86Yle9mEQj3j6KSCSqhV4F/rtwbPzb++nZpkMBQ
         yLC/ipV6K0SLNhLBexMOZQBpDs+CNefOVkobN21FpPGY4XqBGczQ26Y8Iy7m/15LpwHO
         qPWA==
X-Forwarded-Encrypted: i=1; AL+hErFV2ok6g4AvZuOexmn9lQNPMELHY9ZSMzE9uKfKKrXELA9HIx2Yms+HhLLKL8Bx793fuRnJTTCUbqKeXNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ld8i/OD5KhLOtYyU/W9ggINaS4eQpDZ82Xc7bePhSy2ldLf4p
	CYvMkNDKVhmWHk1Yl/nUEdVV1gjjdQjCDD4djJAOJBZBnQFUGLabn8TkReyOX/IqeN1MpdYlcrD
	hYvT+WAFOmqVtCoXsbKi1m827bVFcBjhqd4P0NXKT4jaPWphT7dlPMmhW8cl5ZFfbOw==
X-Gm-Gg: AYBFou2KTgrI9zaSilUe5NTJTGVEhv8hUJtpsuLrOQ8eg4QYyp7H7jYgiyzSdbIF+aK
	Yq42mLHlEjWKru4tl5r0/iHRVW8Tu1sToxogoLTCAQCyFuWNpiBZj/1kCBhlI7+UWzpk81BPrjF
	BlfSQsM+NyyY7HaJu38Dq4OPCSeqEJCr5CEinfS8ShlgZmwr3AabEXnRzfhJFJRZVUVvcCLnXvr
	P6/Zg/5hwUX5DulQJoURncDstdCzb0HFJLdWZ/WzdjiVinEgoHB/nc5Ql6F2MlQQnVeoB4z19W0
	637+0kwrciKIT5U11pdelA9/PfZThpNLqL7z9l2bsJYaWnl/wBthaXDhu1BWv+OXXGt/PovPDLD
	eCoy5VfyuaDVaTr2RuYn6O3sw8RZoymaBNIbP8mR6B7vG72EDbPtz/KC/F6dH6ot7jgrZ/fi8lH
	bWet3f25rR+62lqRBtcx1eZSnUMx3zUBSpVr5Qftil9NgU
X-Received: by 2002:a05:600c:4e55:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ba023050eamr52358705e9.2.1794322834839;
        Tue, 10 Nov 2026 07:00:34 -0800 (PST)
X-Received: by 2002:a05:600c:4e55:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ba023050eamr52357655e9.2.1794322834148;
        Tue, 10 Nov 2026 07:00:34 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0237fbe5sm47374655e9.3.2026.11.10.07.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:00:32 -0800 (PST)
Message-ID: <c14fb8f4-82b5-4aac-8c64-a2dadb210e9a@redhat.com>
Date: Tue, 10 Nov 2026 16:00:30 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v28 2/3] net: phy: Add support for Template
 Control register for PMA
To: Kyle Switch <kyle.switch@motor-comm.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, Frank.Sae@motor-comm.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com,
 jianmin.wang@motor-comm.com
References: <20261104060636.3901918-1-kyle.switch@motor-comm.com>
 <20261104060636.3901918-3-kyle.switch@motor-comm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261104060636.3901918-3-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 07:06, Kyle Switch wrote:
> diff --git a/include/uapi/linux/mdio.h b/include/uapi/linux/mdio.h
> index 06f4bc3c20c7..353ca13c64fc 100644
> --- a/include/uapi/linux/mdio.h
> +++ b/include/uapi/linux/mdio.h
> @@ -63,6 +63,7 @@
>   /* Media-dependent registers. */
>   #define MDIO_PMA_10GBT_SWAPPOL	130	/* 10GBASE-T pair swap & polarity */
>   #define MDIO_PMA_10GBT_TXPWR	131	/* 10GBASE-T TX power control */
> +#define MDIO_PMA_10GBT_TESTMODE 132 /* Test mode control */
>   #define MDIO_PMA_10GBT_SNR	133	/* 10GBASE-T SNR margin, lane A.
>   					 * Lanes B-D are numbered 134-136. */
>   #define MDIO_PMA_10GBR_FSRT_CSR	147	/* 10GBASE-R fast retrain status and control */
> @@ -320,6 +321,17 @@
>   /* PMA 10GBASE-R Fast Retrain status and control register. */
>   #define MDIO_PMA_10GBR_FSRT_ENABLE	0x0001	/* Fast retrain enable */
>   
> +/* PMA 10GBASE-T Template Test Mode Register*/
> +#define MDIO_PMA_10GBT_TESTMODE_MASK GENMASK(15, 13) /* Template test mode */

IDK if this has possibly been discussed in previous revisions,
but uAPI should not use GENMASK(). The plain hex should be preferable.

/P> +#define MDIO_PMA_10GBT_TESTMODE_NORMAL 0x0 /* Template Normal */
> +#define MDIO_PMA_10GBT_TESTMODE_1 0x1 /* Template TestMode1 */
> +#define MDIO_PMA_10GBT_TESTMODE_2 0x2 /* Template TestMode2 */
> +#define MDIO_PMA_10GBT_TESTMODE_3 0x3 /* Template TestMode3 */
> +#define MDIO_PMA_10GBT_TESTMODE_4 0x4 /* Template TestMode4 */
> +#define MDIO_PMA_10GBT_TESTMODE_5 0x5 /* Template TestMode5 */
> +#define MDIO_PMA_10GBT_TESTMODE_6 0x6 /* Template TestMode6 */
> +#define MDIO_PMA_10GBT_TESTMODE_7 0x7 /* Template TestMode7 */
> +
>   /* PCS 10GBASE-R/-T status register 1. */
>   #define MDIO_PCS_10GBRT_STAT1_BLKLK	0x0001	/* Block lock attained */
>   

