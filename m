Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319C247ECF6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399692; cv=none; b=Z4dmhd+OrmoZU4jqHu+xAnpwydnY58gVShmMJ7YIYuy+wIOVxlmjyrk+LS29TR0kWLojPlPFWhLyMKVfSNMj8fNpwFbOZH+GilsG5o84wGdiQqdh+0gzcMubUIti6mjy/I0U+Nf9JodZ3srCXaG8YQC87UadVgMoZW4M4I/R9xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399692; c=relaxed/simple;
	bh=+d8Oj3p5oshm7ntJAldurnbE3ACbEUbHyyX2UN8meL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjIiiJRgDpLwVb3rmtClDrO9m1o60Gdo06ostt44wr+qFIG0xKdqEfp2W646XF+lbap0S2DdI1GjHMvzzF62QYyYTOpo4e8qHvUIeQBZkteNvegHkzEEDNY4LsRL3isE4HY4QXtBH+EQPOD4t7AdygAIxAH4mqi4TPUmu53+NZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cyA6XXU2; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cyA6XXU2"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9c4c3e3b2so2692928a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789399689; x=1790004489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=usjdH/oMD5uW30baonZ+kYj9XHMcowahynwuwBsx2ZI=;
        b=cyA6XXU2lxEEeFV1cGdspGqGbWMpXYqJtOj2OS0zzPVSmMYEtTfaLRU+RJTlU8n1pd
         HT+tYzvgXjKOR8vslqKQHAosefSNW+XS2GOh3m9EE18HNBjLutdstpDz+CCADPN8haUP
         7sOPLenLrLmjVpQ8mtGZz94PoVYQvYdZy8bKJKvVc1uQdwb51GPHZokh5x70iTD0X+QX
         CFQKTI2YTErparUiSIGFP4b3mMuM6wGRxK5dgqICuW2d+53R2wS9gcX8RLb/SxkTHZ/j
         GAenF3API9Nimiz9zGf0GVuszfatSsZa58b5QziB0wTXT7lf+kwKOT+CWkdlNKmjAgIa
         4pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399689; x=1790004489;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usjdH/oMD5uW30baonZ+kYj9XHMcowahynwuwBsx2ZI=;
        b=MJyRGahM2SB8lNcvG/D74OIgCIVR8XYowbwD/ikxcdH/35g9FxHJHFSY1NnNxCGG5s
         Cj5r0QmgkHNeFX7T5rNA3VLdZDQ6JLnA5aGSDTQThFb/AuaHIWZRqIbDhXVuIWGhwHTT
         xv/FEm1Behg+Wk4hA4+rkCtLiLbK5hj2rVZgIqhVH76hNGooFbpW/817A3LL6H4I8L1C
         Jk9+ZEmcpj8cgQfKy/o1GhFr000cJlKMZLom6lZUNq+IMZpoejwIpj20urNaewmOhS9T
         EoRFik4CTuK80oU4gIW8WJt7Yjhtz5MGvRrpy8D7TMTlATcyEKQR20QYd50W/lmKpGah
         mEHg==
X-Forwarded-Encrypted: i=1; AKwUvBz+nLASUyBRvTO54pQv53iF3Cmykf+2rLeEUXipjQLLREDaQN7pZtMhTgwKGPzXGDX5T7Acre7FenZLgAQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mteY1kWvGDI6Tq+WeI1/rM2/p6XmCBBLBAP0m2hn2EUNOjuwiX
	gb4Mv3bxSfs1MvU+BcG/9cuIOGbS2sOJQQvN/JLDo3nkUXFnzgCJ3raTLrUCzuuFqko=
X-Gm-Gg: AYBFou10BRZwqGUSanJu2LgLjAsho15u7zjxZW7Mk2doQjh/AWiPElVPQu+b2u+vJeY
	CRhcOXYP8k5DXw/XhQmX7p6FMjnMONkHBVDShQVfNyh5x0GOPt3EpgvL3ZgP+ehQA4yPELwwMn7
	N+3YQZ4xreQifwA9Yy+FjTuPYCaDDnCQ25hTZ7K95vqUsv0p/5Ku40HS4oKOTupPIWTSXUZPJPy
	Vs5ay4cZvsqGd+xPnvg4tuT7h76n33fV577bHg2L/bOCGwPCXW78etbda9JaYoNlgilyIMVsF2D
	b088WHtx5BtHlY9kNKV62nAkpq3+RDSKDTCURvLfwrHUmM6Qi3ANSJVZyo6T6xg93i1JfwsPW7w
	2rabwLAZpTBnU6d40gdfyiJqnFClWY0XXoTx4HZlwSDzWh9PuBs1IYEZDHVI8rrnKqr9Ealy/LQ
	6WlPSV6JxMfn2x3kaWGgmDS6RJjepUwh5g+jT7WAJyVKMuSULCQqfs6VbuD2KBlqgkBbwGjk75M
	KjTQWViAgQ=
X-Received: by 2002:a05:6402:4286:b0:6a5:f4f4:5c10 with SMTP id 4fb4d7f45d1cf-6a9f61e4e94mr4922390a12.3.1789399689224;
        Mon, 14 Sep 2026 08:28:09 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.248.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5920f4asm4385120a12.16.2026.09.14.08.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:28:08 -0700 (PDT)
Message-ID: <01fd3d46-2588-4d54-a131-ffe8d16e5dc1@linaro.org>
Date: Mon, 14 Sep 2026 16:28:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] media: qcom: camss: vfe: only reset the VFE when its
 last line stops
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260914133416.1030231-6-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260914133416.1030231-6-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2026 14:34, Hitesh Patel wrote:
> vfe_disable_output() stops the write masters of the line being
> disabled and then issues a global VFE reset. The reset is not scoped
> to the line: it resets the whole block.
> 
> Several lines of one VFE stream at the same time when a CSID
> demultiplexes virtual channels to different RDIs, e.g. two GMSL
> cameras aggregated by a MAX9296A onto one CSI-2 port, each on its

You can drop references to a particular part - all aggregators would do 
this.

> own VC and RDI. Stopping one of them then resets the VFE underneath
> the other: its in-flight buffers are never completed, its write
> master configuration is gone and the block is left in a state where
> the next reset is not acknowledged, which surfaces as

"Stopping one of the streams/VFEs/RDIs" - basically we haven't defined 
what the "it" in this paragraph is "its write master configuration is gone"

What it ? Define the object instead of assuming the reader knows what is 
meant by it.

IT: a spider that lives in the sewers of Derry Maine.. [1]

>    VFE reset timeout
> 
> when the remaining camera is stopped or restarted.
> 
> Only issue the reset when the line being disabled is the last one
> streaming on this VFE, as tracked by vfe->stream_count. Stopping the
> line's write masters is sufficient to quiesce it while other lines
> keep running. The single-line case resets exactly as before.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 319d19158..9cdf26671 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -814,6 +814,7 @@ static int vfe_disable_output(struct vfe_line *line)
>   	struct vfe_output *output = &line->output;
>   	unsigned long flags;
>   	unsigned int i;
> +	bool last;
>   
>   	spin_lock_irqsave(&vfe->output_lock, flags);
>   	for (i = 0; i < output->wm_num; i++)
> @@ -821,6 +822,13 @@ static int vfe_disable_output(struct vfe_line *line)
>   	output->gen2.active_num = 0;
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>   
> +	mutex_lock(&vfe->stream_lock);
> +	last = vfe->stream_count == 1;
> +	mutex_unlock(&vfe->stream_lock);
> +
> +	if (!last)
> +		return 0;
> +
>   	return vfe_reset(vfe);
>   }
>   

Other than the rambling commit log - looks like a valid Fix to me.

Again

- Fixes tag
- Fixes to first
- Fix in the patch title name

[1] We all float down here.
