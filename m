Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793286946;
	b=hHs61Frk0YGehViDZEdIq1GSvZ8fg07SLb2viawKzBYCracSvSWB/2ugbfkmveRzLbbS
	 thWr/ITYKVpBsVK8bGxrug3x+2qNVaEhlwPXXxhQVUS1kDbcbZ/KDJNwGATtM/04LkPQh
	 GM3ApQ3PhCgWXDITlMZYGQ5OhPPoBCrotenB7M5Ri1PV2JYXeqHkkXKFL6p/CtSYLuqlU
	 +bJIavtAgHRQpLU59iCefHVG3NAwsvpZ0u8j3bL5fMozW5SHOHpREFVeiNCDVKIz7WtAd
	 JKQ8cLHWYiNPbL16SSeoShtxfFo2/KIW+pM0Of2kvCWZbOPwbWBo5BTyENyVZXpAPng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IPw0/BwW5p18oDLi2WLGpDus6SNGg/LLfcJaEGzwHNY=;
	b=PIRy1+em9pN0cnwNuhZ7rP3weUOhniCkiiX5x3h6iWK0m179fLCwsqr/YZzk3nMo/WO2
	 /5Udsz3xxbMkDxKoHZ8cnDMZoD9/YFFz30abFGKGYuGel8Qf1M5TnyXr94APeu9ngi8m4
	 zBzTg1D/PkhdFxZDAurASwLmxK/vyQ8SzA142qdurYJ+fH05y9rmgLKRn89TGQbSuN93W
	 92XYTqnw4DGejTLEfV0LViW12OwtIk9quDz1hleF4MWHPSgWjFfepChD85UMAYNKa6h74
	 yHbxkchsbYnUKYyJCJQxbQGuU69WX+Okqi1W5SXUDXLka8sQTuEy2nI0MHt3joZWzzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="YQyg/dT/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DD6606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60DD6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YQyg/dT/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so12267545e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793286945; x=1793891745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPw0/BwW5p18oDLi2WLGpDus6SNGg/LLfcJaEGzwHNY=;
        b=YQyg/dT/ujL28wE43zB9C71dKTfJvrpo1KO7D/jy0jgZk57/H3YiRCfnPIdlEjtefB
         cm9TH64FFLTV7C6TnCMnOyD69bLOmwueKLUc9AfG/hzzZqbDa49UOJllTF0SoFzz151M
         robsLl7IiNBMSLdqR4zpZ6WtNnotbqIHkq8A78rrWjUChIlyzIAsrH5AWqD9i/bb5KrZ
         puWCXXX+R5t56iuBpzEJqbITqy6+NolpzxgqagrHv9//AyxV8xI7MhWEOdrhukzfEDVh
         asADL3kyxGxBlSuRdtn4HdxQ2oJR+jbVezVHz7O6CXgyBbRhjhFg4tPIioMJs5PuVTI8
         UrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793286945; x=1793891745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPw0/BwW5p18oDLi2WLGpDus6SNGg/LLfcJaEGzwHNY=;
        b=DIvNzoYEGVyQrvMFJVEl2A37V1RSl/XQWcE9DxAoDO3MCuJGHrhtkaC9HkyqO0rXln
         +GCUNwmOmSH4Qgr0p/7meZK0tjtYSgpg7ccfAfobP80VQGd+w9IwSbZaYbCA2jvL9bNQ
         p52aIW2um4rXs8aY0/YYMlQjT7Ryxr+rpW885Whui/hj2jJRcypFoE4wgn/lE6J2gK1F
         uw4IwxCoV64oDQRhsY2Ep9nFiY9mFIRD5bdFPTlyh5vq8HwVdpQ6D7/asVwQdq+hftEk
         wIaqnIF71ilzRkWD6K7x0wrJkWFrDt+r3ken80u0+LQiQOjIsrMee+p3BsnKPk/YqWCr
         z1hw==
X-Forwarded-Encrypted: i=1; AKwUvBwiXc7Y9n7VwWV6JFegndEQElP4DvK1eT1Pp4G2RT4ztYgsKg8muifYrsMv4z57yMan3Vn6zLeOH73OtrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4pdEcfd0M8In0qso51bDwCBALUy3CbzJcG5TjpjrdyPYZnbxD
	mGMStjF6ZWDsg7whNivPP7wsD2gAqCRgAXT5D+3VOX30YT2wfE15Y3eSQ4iSvw==
X-Gm-Gg: AYBFou1ZPoyK7XQ6KSlJallfPBnPx0v3gwnfnAH+PxFzE/UzoHGnYmI5dKav4UHJ1eh
	XwEf0Zb87MbqDFDzU8yHNAFksnDvnyAOddsvsVynH39ylTp6xCmSU2y52fFYsmMEzn3oMQQIR6e
	gXKU8OtuzxTASTD9DsbOfG91FMvVC1mKxzAv3+l202JiTC02m8VAkm7HyKptR+/H+V2thYGbBo/
	L3HmPRsdGrAhXrtX6b2c9cH0XoDBfLiGPBKP+itvwfAlIR1Tbte1ReJKuzn4luDtHKEjLcRcHHk
	rFt8J4OIudG1Mc98x0Tcxt3vB4WdZ+/JWF1hMsmbdBwawiywvt+GV3c04fiFae1eJK7rhvGBjXc
	d/eN1y+4zXEMzRMN9LS9vW9s7JylwTbXLcxPicjIiguQQdraGAI64UwbnlA8EQvAiKO6H6cVrrs
	n6sLeyzxfXISaFc9P16ltBJayBAlWyi4K2n8jmojCtTATVNiWlEKFrV5MI/ul0OD6yYGiXMGTMu
	fwPtyfrtJRBoMUU0CC8UKfdA+u79miAd7RXToSIhvj3Fot9mpgjpqBqn2s3FH76mKKQB+Uf5rSk
	HOseWm99vshI2i2Y4DNGfWVSJcGonzfiAWWAKF9klvrQNhHxI/JhQid1GwJS9JcexuPcK0HjR7B
	kH0rq
X-Received: by 2002:a05:600c:3e15:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4aa871e8bc9mr81472915e9.6.1793286944585;
        Thu, 29 Oct 2026 08:15:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:7e03:5f00:f9b7:8364:5700:ca7c? ([2a02:810d:7e03:5f00:f9b7:8364:5700:ca7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a966a56abesm88595065e9.0.2026.10.29.08.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:15:41 -0700 (PDT)
Message-ID: <57e4f2c2-d692-4130-835f-e507574c7252@gmail.com>
Date: Thu, 29 Oct 2026 16:15:40 +0100
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
Subject: Re: [PATCH] scsi: target: tcmu: Fix divide-by-zero in
 data_pages_per_blk store
To: shao.mingyin@zte.com.cn, mkp@kernel.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org
Cc: michael.christie@oracle.com, bvanassche@acm.org,
 linux-kernel@vger.kernel.org
References: <20261026195245337ktSXy9G17VCcXyw760g9s@zte.com.cn>
Content-Language: en-US, de-DE
From: =?UTF-8?B?Qm9kbyBTdHLDtsOfZXI=?= <bostroesser@gmail.com>
In-Reply-To: <20261026195245337ktSXy9G17VCcXyw760g9s@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2026 12:52, shao.mingyin@zte.com.cn wrote:

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> tcmu_set_data_pages_per_blk() only validates the upper bound of the value
> parsed from data_pages_per_blk=. Zero passes that check and is then used
> as the divisor when computing udev->max_blocks:
>
>    divide error: 0000 [#1] SMP
>    ...
>    tcmu_set_data_pages_per_blk
>    tcmu_configure_device
>
> Reject non-positive values, as the neighbouring max_data_area_mb and
> cmd_ring_size setters already do.
>
> Fixes: 08976cb548d6 ("scsi: target: tcmu: Make data_pages_per_blk changeable via configfs")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> Cc: stable@vger.kernel.org
> ---
> diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
> index 425ad1246a75..07b514678176 100644
> --- a/drivers/target/target_core_user.c
> +++ b/drivers/target/target_core_user.c
> @@ -2524,6 +2524,11 @@ static int tcmu_set_data_pages_per_blk(struct tcmu_dev *udev, substring_t *arg)
>   		return ret;
>   	}
>
> +	if (val <= 0) {
> +		pr_err("Invalid data_pages_per_blk %d.\n", val);
> +		return -EINVAL;
> +	}
> +
>   	if (val > TCMU_MBS_TO_PAGES(udev->data_area_mb)) {
>   		pr_err("Invalid data_pages_per_blk %d: greater than max_data_area_mb %d -> %zd pages).\n",
>   		       val, udev->data_area_mb,

Reviewed-by: Bodo Stroesser <bostroesser@gmail.com>

Thank you.

Regards,
Bodo Stroesser

