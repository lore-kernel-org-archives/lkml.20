Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2B1421245
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884729; cv=none; b=lkSoukoGgLqyIKTOyD6DERGFY107s5MxH26eC8oBYgl5JkT0+KJ/lNcNZGZ+xqMBIBpoXTk+HzOW6fO/44Kekj9j8iYUqWXyQJ8hx+L6r+NBAFKojWdku95cvB2Gh/0q4WLvGeBuldjzrI8nC/iH3+t2Chj31uUo3yJH3UW8P8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884729; c=relaxed/simple;
	bh=jN51U1VoMPBxv5NImcV0DrxZSW0vwqbzSIuL5nPXgYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gV6jWDgif+Lv3AnUYsLS8nIkdZA1Ti1X9Zf/L9yW+ic4WQf83hZb3gwEgumzXAHRIY6WaTxTi9ADZ9lisLZsFKeAKDNY8gucmNHtAGbHEgvVR1pp9ESXInx545t0MAjgTQpJawFBiP06Y/ubWR/esG1B9q5g5PDNQ7Zq4XjATJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj/NltPG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj/NltPG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so27055125e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791884726; x=1792489526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8v0JkLJFzbjbUzSunhsNyUV3+4oWGxJqnDHXmr6loY=;
        b=Bj/NltPGlupEIygV1kW7Rl8/UCxb7w99HY0DXHVMuWYtuSOF7i5RYjaNkzJiMV7GRC
         UmCXlXDgc07Fxz50CkYRQfc6g0/9JLK1bMOHUd3WVRO1yp3c/mZvRo4iG5kDzuD1k5br
         j62gAyFY652WZEmitDHC20xiyylfRT4fYymtM9KNxDJzF5AxpMQ7GkPqUxgMfyth0FRd
         jCzn+aZfeqexEvZGB9MoJxrD2I26NOnH3rpeY/fMqoYudNlyS2njmeemPq3xz/VEJHEf
         kei+Ud7bUtgR+BRDlcMLOX4HTV61tato7zTXE9H8n9Rytfg/wXY76vKJ3sgjBsOwNOiY
         F4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884726; x=1792489526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8v0JkLJFzbjbUzSunhsNyUV3+4oWGxJqnDHXmr6loY=;
        b=bt9mIovR5Ss5MGFpu8mtHCeVGpix3DFTksBJ9es4Oe4aU5xp0olP8DDfBZXCWiMV+c
         im4bvjB6ASFwO+cKIVwlKtMu7UCc/CYVMI7bnAXWb7n4EVXRzWOe2ktjqhR6iMehZobN
         2dUcSZgGY3GIahHyLJOSWhX/4EmH2pY/h9L7n9uhdDQC+nF4RgByFwiGEvBYbvxmH//o
         X4fyoE/BLHTMDFvi3GcTzDUI0KawyxDaDbDJXWssYL8VlPoaTbTkRElhK/dnxxfJ2dfk
         GphUv49PLzl/tGlGVifPwFwSRJr39TsHaSlW92UdVzmHnBwNRkMjRHlghVQJF+JutE1j
         oaKw==
X-Forwarded-Encrypted: i=1; AKwUvBxTvG7zp5AjNwJN6e8LoTKdrLhJ0jY0SvBCGqkZoSEOBy7GBA8LSBfuAbxVLnnsHudf2KkCACAQNFG0V40=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsb+av07UOyOtib1zRdtSyPtUKXVCKr57kzW0ko9Qlks+gh7a1
	zQRucU7nDY9Rj3+BmC2svJj9eSGhj2A3KoujNjQj6QdhK9HNIOyYK9FO
X-Gm-Gg: AYBFou1jCac/og6Kav+YaJCvbrQj0VmZHYfsdHmxw65kiknmDo+RwqRCAf67yHEHM4E
	mqee6ncB9ch0dm7PYCaKloZ/DcIyt530yJXFzt2AjwxT8ajHVEzDdtZYCdWeePWAyLCRsMCv6Bb
	eYSXyHjZvisASr/ziM7fCd8FEIg45A/OO2lbSsQWgS3ii6ku/XwhI5VoF32HrcLCdMklFwlORuF
	j/lsV0TnEp2hEJqm8mmb4qw//A1WTfPSxYfQ01xIl4RK/yYMtmZJnEIkCzydItOpxA8712OBcHG
	qonSnUE3iP18OK0q4KRzOeLOn7Da6EBvYcsdKVLToY3EndntqKCCrjf7vrukPxIiJ7r9DgnEbLw
	OYOyC548KwLoSydfm6njj7Cz+71izdJnA9WV84tvATSXlcxiaPAoSN5UcU/0xOV55rSBqc4R28K
	UagTFrUCVwvDq6bI0dayHOWUXsPZoYS+QeBXIF9LQiipGbkvGPQQPt0zBc6ut6xZNEFRdSpYedO
	Iq8keRzdwQP6K/wsNsgFrcltuUee+NijZ989Q==
X-Received: by 2002:a05:600c:608d:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a18e48d45cmr252151255e9.16.1791884726303;
        Tue, 13 Oct 2026 02:45:26 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18dd15659sm233154305e9.4.2026.10.13.02.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:45:25 -0700 (PDT)
Message-ID: <9c311e76-66e4-4ac4-a59b-f0d7cfeade6e@gmail.com>
Date: Tue, 13 Oct 2026 11:45:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: parsers: qcom: drop setting of partition's
 mask_flags
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261006-qcom-smempart-ignore-mask_flags-v1-1-a48d9395b21b@gmail.com>
 <87qzhuzsea.fsf@bootlin.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87qzhuzsea.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miquèl,

2026. 10. 12. 20:27 keltezéssel, Miquel Raynal írta:
> Hi Gabor,
> 
> On 06/10/2026 at 22:00:41 +02, Gabor Juhos <j4g8y7@gmail.com> wrote:
> 
>> The 'attr' member of struct 'smem_flash_pentry' is 8 bits wide,
>> so it is only usable to mask the lower 8 bits in the MTD flags.
>> However the MTD layer does not define any maskable flags in
>> these bits at all. Additionally, the meaning of the bits in the
>> 'attr' field is not documented, so it is not even possible to map
>> those to the defined MTD flags.
>>
>> Due to the reasons above, remove the 'mask_flags' assignment code
>> since it has no effect anyway.
>>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> 
> Sorry but it no longer applies after Weigang He's:
> [PATCH] mtd: parsers: qcom: fix offset/size overflow on large partitions

Sorry, my fault. The patch was based on nand/next.
I will send a v2 based on tip of mtd/next.

Regards,
Gabor
