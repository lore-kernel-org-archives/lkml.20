Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3337D30FF08
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399318; cv=none; b=q3LYteOiYKUWIyKSUo5umlVFY4PRAAZGZXmvRAObqelCHkAkRxD8RachOHX3zLLSC17Y6GwNnehe3qaLyAOfpqwv31jvXlDEWNhNVMronpjko2/mWo5xyIJSV9pOXBRf9Vsxa3gACwtTcjYpNFuwNOxq/c/Oeohp5kHuZwyesY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399318; c=relaxed/simple;
	bh=7nGECr84emLqWyNDyOX70IfdI2ORNdzf43u4uutTtBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqvSY4RZ+K9w+6AaiOcXt6Ac0hKlCroqJBDWfNwmAUfWW62J+N+LpwFqzEP0pmsXAyXHn1kLTBhJIF3jpvX4fz8nTR6xmGUgRK9n8/kUvbAmCD2tJNlNuSb8jDPsqZ8aWVvPqkD1RIslJ6VNO2bCIAkJwpqvCea8zfVHmlYyJgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rCvOVXKx; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rCvOVXKx"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so400202166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789399314; x=1790004114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLA3m0NGa2cvdE7XQveDYTZqplmx5lDSMQV/pnRZYqg=;
        b=rCvOVXKxPv/FFfQwsHVmxjQFa+mToo3kHUmwb/zeEi86gCXrwww/IsL+EXkmnzSEWM
         M+Bnbd3W7+ml+S/2sYTojU5J5Ms/9I5fLoC//jrQ9IH8qSvvxiE4KWzZ2+RqxYllreOr
         IyMFgbUY8QdLcVd9c5CYXlmS12/dz1FoiNfFxbYIPBan2VBuP5MjT7rLNQMTnuzz5z9q
         KNpZcYlWHRiTjQxgOAA1NLiy+yd7nRcAfFFmzh1seVfzRdLiBy0oO3Vw9KVRW0HXS9kC
         9hAcigIQ2zDKkI4JqnG/PLMNIMqrIn5qVPNpU+UcfRWqNdKg4FUZYBhhex9RopqdDD48
         gZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399314; x=1790004114;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLA3m0NGa2cvdE7XQveDYTZqplmx5lDSMQV/pnRZYqg=;
        b=Jgo4XHH4eEWO5BA4q5oSgkVqcgJuTUGUXjsvKQxpj7DOSO+YKZbJl4zymGkktV07zq
         kJyLu93w5ByihWHnA/DiQjwJ1+QT/QQGWVjZC1ueyLASUoKHLr/KDja7bRlEZHqG0OOG
         DdxkCwCK0okDnxtWNpQMiwbnHRgJSpgMMld6L841WhdeKDxiQR8eRU71mn2tr8XCAjBt
         qey9Z5cMoA0Mj4Au5zq86KRWBkRdjWvyWCamD49zBsEGyQUhcHr59oRU+ppaGiD9yN3U
         iBaJVuO4xv8Idsic9DYmG4kYiE0eHzPzpgfEss2ErXbZYnVuQhndmdN7u76Vc+yhWjw3
         FRTw==
X-Forwarded-Encrypted: i=1; AKwUvBwFumfEsSiuoCDq0wRZ36lRW6PEIBZ6C6rhE9AVfZUwFpQROZIDngtaf0UHwVtfq5qp4KwHLmdXCGxifNo=@vger.kernel.org
X-Gm-Message-State: AFuF++kMNVBOeBDIECxwW30BXrNQfmr1agVmzHeEcvcT8QCiw1KxLwh9
	/ZTnTKlYKfZeKkdHxM6x5NP9m+6bik4wDrOn3ReyhNVg7ZMVPDjh+H+Q8Lk8KcLjHQA=
X-Gm-Gg: AYBFou39tAyl/GQpBSrNjtwKsASGAaPlbPLStQ0xmGNtQ56Nk8fyIYAPy77HcpZ6zI0
	Rjraf8lc++UBGHCOSomI2VxdU87YQhcQpcZvA79esNNukQVjZEGLI8A2XciM6LaYCaaVw8QJyHH
	MrW5n6SmSNZs+j5RDd3mxc45xogwW4Vz5VRUw6DJFpPAflDQuuZ5j4ndZgdYKsyDbf8N4qfaDNY
	NrwSykbF8JqpUJQUOtZcTejY6hZbX7CEmGDEcuPygS/6L+coRjm0HDSO2b8ViWinoKjdWi3VBw+
	6piOLtrGtlWv7dcymDHCC+d8HO/EB3EVmlx4TPvnuDW3T/cNFbuTFJbm6iCNcZAuiEWmZgY6vvl
	JLWCsIj2d5ShUA/qN+lcI9rj+BUEZ3ZkmokEo2qJYY8UXdg+R+vzp31GM/BgwZivF8K5YZrDyXC
	yVjMJq8uB0g7HHZfBHJS/jNeWJFDG2q1mgikjkyJyUkq+3mVzZw+WXAcpQ1bsXZ1KLNxtVXZban
	n8uulcd/Gw=
X-Received: by 2002:a17:907:3c94:b0:c25:c979:e76a with SMTP id a640c23a62f3a-c29b8767641mr374816866b.22.1789399313992;
        Mon, 14 Sep 2026 08:21:53 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm470622966b.36.2026.09.14.08.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:21:53 -0700 (PDT)
Message-ID: <18b629b6-5944-4a1c-9573-fd0ee4b25cf4@linaro.org>
Date: Mon, 14 Sep 2026 16:21:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: qcom: camss: vfe-17x: use the write master
 matching the RDI line
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-5-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260914133416.1030231-5-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:34, Hitesh Patel wrote:
> Signed-off-by: Hitesh Patel<hitesh@ebytelogic.com>
> ---
>   .../media/platform/qcom/camss/camss-vfe-17x.c | 22 +++++++++++++------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> index f62fdabbc..0cfc24255 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -403,10 +403,20 @@ static int vfe_get_output(struct vfe_line *line)
>   
>   	output->wm_num = 1;
>   
> -	wm_idx = vfe_reserve_wm(vfe, line->id);
> -	if (wm_idx < 0) {
> -		dev_err(vfe->camss->dev, "Can not reserve wm\n");
> -		goto error_get_wm;
> +	if (line->id == VFE_LINE_PIX) {
> +		wm_idx = vfe_reserve_wm(vfe, line->id);
> +		if (wm_idx < 0) {
> +			dev_err(vfe->camss->dev, "Can not reserve wm\n");
> +			goto error;
> +		}
> +	} else {
> +		wm_idx = line->id;
> +		if (vfe->wm_output_map[wm_idx] != VFE_LINE_NONE) {
> +			dev_err(vfe->camss->dev, "Can not reserve wm %d\n",
> +				wm_idx);
> +			goto error;
> +		}
> +		vfe->wm_output_map[wm_idx] = line->id;

I don't get why you are disjuncting on PIX here.

Also isn't this a problem for ~ every VFE ?

Again.

- Fixes:
- Prefix patch title with Fix
- Fixes go first in the queue of submitted patches before functionality

And since you are going in with the knife for vfe 17x you may as well 
fix this for all of them.

---
bod
