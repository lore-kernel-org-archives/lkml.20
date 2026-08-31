Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175ED43B3E5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183410; cv=none; b=TiovUMav4aQTTGXOgMXv2puyfQP/E2Wc/G5i0a8rK4EARNI5x/8Lpzpx9PpDXubvCZeBMTPCUiF9T9HYEKNFsh2gGSVjsN8lMrlV4TliY/+5fKJbBZvIcw8+3HxFl8rLh4YYv96SemMw4/v3FDVc8bF2TucWfYvkZTh4k12GHY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183410; c=relaxed/simple;
	bh=RXHMH7L5X5viH8MuZfC3yL4+XM+W6sEJkSUTTYexSWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qT2r3ktFowle0UMa1aZaTLaJM8qRa7THpi9I2VlHf9RbQ7bnotrUlxX9PhSYoD2EUWPhr1Terzrki9nj4FrBkRxFyd9654wp8E+MCvO/whxKY4ZnoKyL1NvgWTTrZkYFa+wC9+IIr5m1iJkoF+J4LnHmO+KnTftHqaTWqWJ7GY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeVuYfBh; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeVuYfBh"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2529b3139fso442031366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183407; x=1788788207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fneGRjr+ySvdkLjxtzdgXXRUjfjDg7lmHVjWGaGc48A=;
        b=UeVuYfBhRivUcfKfIBoz9Hx8fwBGsbJgclYgspSZiqGOH0Lk4xO1OAWx9SzBVoFvLq
         ARP2YFH4kVGG7fdrFix+ojcJsjLO025J+axTMiPqRbb88RKHWajuagD9zFatv2tAP0/M
         5SrQpRBm0EDEWRW+6/LyQhRBI8nr2mI2+ViaSKjFh1e/A7y8ga4SIJvQB+1kolvVT9cG
         sEpfmrFrj5iV7yYON3QdhpHoKkGCtGOD+4xjsCTgCj6bHE03DAHkKpIcG2ipmF4nYLjh
         fwSp0CRBQk/U/1MZ+BsBOpYWNCqSfn3Iupnlv3VKNwvFyG/chcjv2ncF8y7R28xDOKJN
         ePvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183407; x=1788788207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fneGRjr+ySvdkLjxtzdgXXRUjfjDg7lmHVjWGaGc48A=;
        b=ChQs/RcLRcbGcKFk+ibMgtb+6z5mdFK2eVwHDUo93HWvk2dX3eUFnA0SzpXlePjiXa
         xvrU0dZ9rjQ1GB0ehykSb23NHga4cjPTh5kHAdvM/vh1uFeBmqMexy0kAAg1qBvS72fQ
         fhXNx/PWi6ZeXac/mNO8y3EW7Tjxnf/kID4sXB9fAXVteAS1t4VGlxouOTQZDCp0WwBk
         tS3/nX/heMS3o/JdaIed73nP+ALZT/DMexMrijjJfbyzQ91W6ySe2n7AFxZrpnLf1xpW
         eA8BuEuMTSr38SIbUNCML0ZDxsHpQQzwZnISinzM8DonX3d38OSoTBVYVZkyVjIaLt5K
         6k+g==
X-Forwarded-Encrypted: i=1; AHgh+RpGmAUZ5P8KBCKbS1dEmxRMcvXgtEPTrQeNHIgqhEY7QN0E04/Cga5yZyT+8Sq+Cl79SKdBv+LKVrhzCYU=@vger.kernel.org
X-Gm-Message-State: AFuF++lKP8ROZdRW5M/sCi9J7KoA3Als72MJjPfxbRqAdPGjepfofJXY
	KyZdXVTIZtJtlDJmoAsmwJZbEg73sYFMQe5AvnNQ17PWjzPvwPTrTG+g
X-Gm-Gg: AR+sD11SXqmblZyjF/AKr0mEMGc1zL8wbZod1cD8Phoeu7bnTsoV5wuG3TgSYTXoe24
	mxN5Hq8jXcD7ZSGip/hf7+Bsy1dO23w8OZV+yjCJ/u+GBbINIVZci4gzRSGu47BH6C7I9PictYn
	KRwY9lpFqFrTHGuxK0TsJxwe/AWL9mwO4M4o6tAiUvgrB8noqYwJ5Fk2UCx8caCIyrIuPLSLV+I
	Ld7JvSqZhEaZoOX5B4CTliQ3hyQbFr90HQC/aFW22BEk1EuX7nPVfx7SkWLWXWCcLQwtOI0j3Ub
	1mw9mCG9pmvt13xFchvkVEpJgAg43szY01qPA8EtVYjYpldprQnh4TeYy5/7DPLa24Rr7S4+UmS
	8FHK7RUhmx1ScQK9LNlkPFB8OOJ9Q2obCbF3a2co9vaPpEOHaG5oaR+gjYqQUbgzM9DY7GmpU2v
	XmlM31r1nNanH73I6gLjTdNIyqV57jMU3jxXSgYRFuHQzSKE54rWTkpL0o6v/cEWEukcULvQ0AW
	pk6VfHhAQwI2V5/6HarQg8g
X-Received: by 2002:a17:907:d649:b0:c25:62c7:fdef with SMTP id a640c23a62f3a-c2562c83b53mr1418035366b.18.1788183406884;
        Mon, 31 Aug 2026 06:36:46 -0700 (PDT)
Received: from [192.168.1.124] (83-131-188-88.adsl.net.t-com.hr. [83.131.188.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2853dsm467137066b.18.2026.08.31.06.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:36:46 -0700 (PDT)
Message-ID: <97bd737b-31d9-4eef-9594-76fc9739e04a@gmail.com>
Date: Mon, 31 Aug 2026 15:36:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: wwan: qcom_bam_dmux: account network packets
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830085400.2542956-1-sinyavin@gmail.com>
 <apVH-Wd4d9q1uMzy@linaro.org>
Content-Language: en-US
From: Dmitry Sinyavin <sinyavin@gmail.com>
In-Reply-To: <apVH-Wd4d9q1uMzy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for the review!

31.08.2026 11:23, Stephan Gerhold wrote:
> This is a bit odd, why did you split the two if (netdev) statements?
> The skb stays alive until it is freed here, so you should be able to
> obtain the length even after bam_dmux_tx_done().

Agreed, will join them in v2.

> Would it be better to increment the stats after the packet was already
> passed to the network subsystem in this call?
> 
> I'm not sure if we need to check the return code of netif_receive_skb()
> and increment rx_dropped if it fails. This seems to be handled
> differently in various drivers. Maybe someone else knows?

My understanding is that rx_packets counts good packets received by the 
host even if they are dropped in the stack downstream. I also checked 
that mac80211 follows the same pattern: first dev_sw_netstats_rx_add(), 
then netif_receive_skb(), ignoring the result (the documentation for the 
latter also states that the result is "usually ignored"). If there are 
no strong objections, I'd leave that as is.

Best regards,
Dmitry
