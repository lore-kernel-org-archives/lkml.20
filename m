Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929834;
	b=fTXIic+SE7B18jaDDny5OOv+uuylzcxEC28xHt78mKeZE2Y1rDy+NR1AStq4mdY8QEqy
	 uI5VPRUeK2QWO1u1GGZu3lMy7GZS5L2eAdHmjEwo/s0qRmA3TeNxNG9AHJr7esXKGWIqT
	 XiscC87iEHokvoz6l+xw0nErScXA23b0qOVjadQdrwelH7GRIoYgt47zpnDELgoT27Rc0
	 wXEQidV82OnP0JpcbUtIrMSQH/pqT6HxS+XAX+bNSGBXkJLpKAHTZiT46CDZFL/4BOjwY
	 8n9EGG7Tkigj0fJ+28mGbybOVLkAIuJE5Q8wUXYcP7zJXVTW6hdvQeSLZ9+K1JjETfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LKdLJQzk+hjbpuBIp8LKIvBrdSbWJhDuwBNnuQ3+E9Y=;
	b=Dw6cGodA+aTqtU0uFOVYsAZHFlSGKowLnpEyCQAUPpYJHM7e+h1PIhR1WtHfT3GpaR2t
	 WbiSznjC1F9fHYzK9YNb3juG01GcVqaDxAfVA/eztesM5MeS+tKcP2HUBUCcn/9qF9VQc
	 rQ4iXccuHPqbGsMkWpmP7lBa7wWBTIzr65rdtulfjctOomndiIYFo7XCwjmJ65mfV0KuB
	 VS66TfxXy9j+S+d4B7M46MdU4ub5uANyHnMnubxALLk8myUQTQGFQBeT/IGrij8PS4YJa
	 qBRnZnx9b5vQgiZndNlz7eMgRqIwQEs46Mu6FcSLLSVwEts1gmGUcLchGi34AG7yAZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Cl3+cJ/R";
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A24F606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A24F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cl3+cJ/R
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50933bdf4bso246121066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794929832; x=1795534632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKdLJQzk+hjbpuBIp8LKIvBrdSbWJhDuwBNnuQ3+E9Y=;
        b=Cl3+cJ/RdMLwMsHTsFXKq3E92HfrGSiunfW9rpYSxRvClZF0G/Umr9IzPAULUNCy/P
         +xNS6v7g1ViZQ6BwbJgfN/cqwz6fr7Nrrox4B/wEr94+/VoFCmFBuC0EwBNHU1GmDBJz
         MXeiPUk2PvMwrxaGNhclltfsKmhl+u55Ew35Pp3RfaeYesKgGmqZICzb5YkQPCdnaQlo
         GSv5o8x6IElafkcKY7tfj2BvG61ba8brJaaatvP1Q866auavXqRxt1CTfwhDTAd+v0Gc
         +nUTIsxAfZsBcBWm1x1httoFkvGdEomHcqcPOzWdlmI/KeaP7qn4yRwCv23Fgdu64YRz
         9wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929832; x=1795534632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKdLJQzk+hjbpuBIp8LKIvBrdSbWJhDuwBNnuQ3+E9Y=;
        b=2jsWJsSD2tI0qh6aLogW37d5hN02KbF6mFBU915bPTAiQdaJDreti9Q6RUyXWJHXCB
         rOC0aC+4aiXvnhNBXvHpqSYmFjWOWMNfPtKzOX6lXq7p3SljjONfoSPKvaiYlkouc/Lx
         0OomwT9krskc33zoukW6JOw+L35spihyovUHl+sQJEUe+YZ2BmB23C18E1c1jwjUdogg
         DVgfO5DDpH/LDzLAX4ZCzGGzgzm3LinQ9K72AW/465x4Qs7jHdujGszBVqRv72iL2ahi
         /YDRUMo6HcAGxOtCXmxHaX3Gv34EwEOkpPkGC4GzOIjBM6bf/QtkmGGGe8DvspWngeTC
         LHKA==
X-Forwarded-Encrypted: i=1; AL+hErFN4svDV2ykJHHtI51m99WOn6bvLdYYbgIpZVHv20Lv5HHCqg5M/sDdfSnFBN+SBdFvHwMHiThudlUScn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Az2z12h3fO48ywkAXPiVAZbAu0P/+AanlMy6uy4S+6F+X/G8r
	s679i0pJihB3oKYCJxkoPt77ZAWXbthl4/nBi91wRskYrRz7R5loifZabshI/xquoh8=
X-Gm-Gg: AYBFou3eIs+iXf6JYW+OvU13zmTGazycUwFbnX/3OiXpWuRuiJyFmEj6dHxrosW2lVs
	Qx2ca4szEe8ngFurx9ii1lLq/uxm+EKBPewWRhnf6hEN+9Lx2Lmuj2oRb9mev1FkLhHYEAaKOlm
	a9R8Y1NFNOcaPpQ0qX8ON9wlk2jYuYrvcaW2D4+c38wWbgqvc/DkBQAipZPRpzjPhRmgBuhlZzt
	L2B10xi23EqycvEYyI7ny4WM+Dmt3WMNh9K3Z04bsU/2gmxcXxTHSc6sufZmMnIGnLHRo2kAyqw
	KrXXYQ1p9794X4rkudsDtt3mLoivvdjON3Rg4dqumZdmYlDZrVwDRGDS7R19Glq8An2tYz1Q/xx
	uSDun8cSX+ClsDCVevxOaEGrCKSuiheVWLaILur2s0HnuwqJJPv1rRa6C+U48/0Z/1KAF4lhmeO
	BePNMvHjcZEp0oE6Hm70L5RY5BcpB7BnjUebAbo64YfbXQHbRMVN/jxzQdpM5787Q8DI5Vja3JO
	aMov2uoBZmgURYEsbuqpYxNBSyh92n4CT1LnyvE3dk8/KxDiZd4ainMhd/1LPU1gt2zWAmoKWvV
	i+2aMJHVrV3pMAsRB2LkqpH/GVsFOBbBIfzI+u711222Ndv/g6YjtSrn2Tvl
X-Received: by 2002:a17:907:18c3:b0:c2a:ac35:95fb with SMTP id a640c23a62f3a-c50f3781084mr288834466b.24.1794929831875;
        Tue, 17 Nov 2026 07:37:11 -0800 (PST)
Received: from [192.168.0.252] ([82.76.204.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a32155283bsm6407600f8f.37.2026.11.17.07.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:37:11 -0800 (PST)
Message-ID: <3ea5d94b-6913-4534-816a-3935c689225b@linaro.org>
Date: Tue, 17 Nov 2026 17:37:09 +0200
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
Subject: Re: [PATCH] thermal: samsung: acpm-tmu: Fix spurious CPU throttling
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com
Cc: krzk@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org,
 lukasz.luba@arm.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 Juan Yescas <jyescas@google.com>
References: <20261117083442.830549-1-christian.loehle@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261117083442.830549-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Christian,

Thanks for the patch!

On 11/17/26 10:34 AM, Christian Loehle wrote:
> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command
> writes all eight slots, zero-filling the rest. On GS101, slot 7
> controls autonomous CPU throttling even when its interrupt is masked.
> Programming it to 0 C limits all three CPU clusters to about 200 MHz
> on Pixel 6, while cpufreq continues to report the requested
> frequencies.

Could you share how you discovered this? I don't have access to the
ACPM firmware sources, and the downstream driver doesn't state it
either.

How did you measure the actual CPU frequency, given that cpufreq
keeps reporting the requested one?

Do you know whether slots 2-6 have any side effects as well?

Also note that Daniel has already queued a set of acpm-tmu fixes in
thermal/linux-next, so this patch will need to be reworked on top of
them.

> 
> Program slot 7 from the zone's critical trip before enabling the
> sensor and preserve it when updating the low/high interrupt window.
> Cache the three temperatures so a writable critical trip can update
> the hardware without changing that window.

I think this can be handled with a smaller change: look up the
critical trip in .set_trips() itself. The zone lock is held there, so
for_each_thermal_trip() can be used. That avoids caching
low/high/critical, the .set_trip_temp() callback and the probe changes.


Cheers,
ta
