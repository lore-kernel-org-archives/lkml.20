Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F949331EC2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056917; cv=none; b=gp+Nv3XRQgbozf3yiSwZBlhxFNYP8ZQXQwGiI07V2K/T8if/LmcToZiXA5IZn9xRiT99va0i01tn21/i46i8Hb750ilgUyKD9iYMM1vcue2Uw3Q2Ql7cDzTRQrTXExLs6IgZYEB8B+OQEOS2yoS9hcBJCB0Ac1TB+e0IHs9uITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056917; c=relaxed/simple;
	bh=sDdKrJmvs5QWB2mO+IddhtMXz6qcKGamXBsMMe9RzFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQDtawnFDpXpvrdOyP7xj+4ye4e5jPKbkn+dnYH1mATP/PnweLycgg5N2k68gln45BdH7UDbKFAlgz8+9zr1P+z9RmXPzAgfqGyVwpDVh7EKMOzv2x8XfMBmjASKSIUdRsImxDrill8qUiktbjfRjeKL9srgAjNDMCtU9zM3HUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhJnvQJA; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhJnvQJA"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so3628847a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790056915; x=1790661715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=fhJnvQJAHSiVbBZJWpejnHZ15mqHkOwtCOlvpAqWhbklWNe3zVTwiV1Ir7jT0AB7RW
         eLb3xugrmsvbBlp7DewfrfmWqapmA68wJWuZjez4H1q7jKi42sWZ15aTXLk/WbY0sIQV
         /dE2fB02jlWZDMZTdBP/XZV7g8ZKNu3GBt9HZu5nUPdhIJJMqiMVf20QhHnXDg3qhYi7
         M3i5qWS6Q84F1/IrDe+hFmd9/agCA3sax0sCdcxMv5lj4vhjNEBnHb+pJfNqqFy9tF4A
         eOfmVm6QC7yO82giPpXtomNou0Ueui02s4oiAmrxOW49YFsEhaRjb4/BNmofWIoyZLzR
         BFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056915; x=1790661715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Eexq0zFYxGYgBaFUWATikMtDj/TkGR7YrZ6T7c8q8=;
        b=Ucutpw6cx9CJ6+KFWqxEmN9+focZV8pw71UAovLOaDE6KtUURw8nwmdRomxpvZT9Uz
         Eo9jouI6qfdyYEimKMZyr2Pc9OSxk5PLx8+JEws7xbH7woUtofxjJ9uqlBkxE9WbFeLB
         P4H4Gv45tpcicr2CCAAXDTwoxmPeKn/nu3szVJQyrLF64mWWE28PYpsViYboyZBCO6jS
         h5gtH5lcr8jmIZxovfQAjTHYZJ9K36Z/Ep2Q9xBTf2w2uhFvCgxFiiAvM+TWb5q/F9qB
         b/Qe70B9f+96zw9s4UfesH9P10yGUxB0/QeeUO+LkgIOvLhtfU4ydoAAA90M7vJpYQ4p
         vMtw==
X-Forwarded-Encrypted: i=1; AKwUvBwYPY66KN0QpS8qghN0OzD3jU1RDv6d8jbwNE83rD4JgqVbMysQbd5iJPz0nVBW/ODnLSSBxAYkqAjrqlE=@vger.kernel.org
X-Gm-Message-State: AFuF++nHpwJK4tE5Ldlg/7LpTqbKozkD/1iG2+nws6GEno7DN//ij0BQ
	msldqUaQ0ZG7aZ5J2vxfCu7HcHULBA27A/EO2AvS321EEmQOh/CW7Jv0
X-Gm-Gg: AYBFou15+F/gfzOX2JhTiNsdDiyS7iP+NtCZEZaJtHV/mcQU7ypVClZBxjwzUZ4F+2H
	5IG9xChXrE76zOKcmO+p0LUK7YC+mek0TxPS+0f7wPPPE3BHhxQcAS5ESYuOCCJGRrv6029ZGgy
	+hDNQFI2/MaDavSR9a91YdDOhamAZqaJp61JwK0Bjy2+1V8o4DRgfmNn7U6jsnEeS3fsC2TB9b9
	dfbtjxcOB+GBH3WCzTDmo2Vrft2IdD1/vHLbr1IjC2T5e1Hp1Lq3gm4oaC9iv5NbO4GUvmDIx6j
	hw0E31M43MdNsPumKPYo4S0dyNvvwCVywok4p2ofvOZR9oBIFniclB/pjwPcF6GF07gwMLLaGAb
	63/Cj2spuCCpT0HfR9m/87TnQq9hxUNnu422+FAyBioqH57zzIUje7XfMhokbIFXs9g2FG0vIGR
	MMIWIvx2XfgLegXwAEtUREFzNZl1cq/HoP1JzlErRYFrDUjEkqDuu0mYXU6JtVQoTYV+2y+tLAt
	Atk7fwxpjYroi5j5WM=
X-Received: by 2002:a17:90b:558d:b0:39e:1ec8:ee7b with SMTP id 98e67ed59e1d1-3a07309f897mr123698a91.7.1790056915456;
        Mon, 21 Sep 2026 23:01:55 -0700 (PDT)
Received: from [10.25.133.25] ([165.85.205.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e8439sm2788903eec.3.2026.09.21.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:01:54 -0700 (PDT)
Message-ID: <878dc90c-3a4c-45fb-bfbb-2ba802bfc14c@gmail.com>
Date: Tue, 22 Sep 2026 14:01:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
 <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260922033428.1690822-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 11:34 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The i.MX ASRC hardware supports three independent conversion pairs
> (A, B, C). The driver previously registered a single DAI with generic
> stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> multiple independent conversion paths from being used simultaneously.
> 
> Replace the single fsl_asrc_dai instance with an array of three DAI
> drivers to allow up to three independent conversion paths to be active
> at the same time:
> 
>   asrc-0 -- ASRC-Playback / ASRC-Capture (backward compatible)
>   asrc-1 -- ASRC1-Playback / ASRC1-Capture
>   asrc-2 -- ASRC2-Playback / ASRC2-Capture
> 
> asrc-0 retains the original generic stream names to preserve backward
> compatibility with existing machine drivers and board configurations.
> Each DAI retains the same channel, rate and format capabilities as the
> original. Update the devm_snd_soc_register_component() call to register
> all three DAIs.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

