Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434290;
	b=iMbPLn35I+4dH1cpxFRLXeiinU68IipH3a3utsYsLOcHA0Gu/q8wlaCqyX0BccYQ+QQK
	 /bS4EBl/rRPkAATU4scYp14AIhVTiPWdtqcAdJmNaDaldKCEolewbyNiYDgWzDmhXr1n4
	 JCFtjtXcImcTS/YzbBzN3t5nt1I1fVe51ApdpDU1KII4TLJCNQL+UztcaxmctPzgk9q9I
	 lNeSnAFv+x7cW2H3eeHy/YsQmFXnIlXfTQ4g3OfCh+PhdlhAaljzaYyx7CKBpOd5ls4ih
	 I8x+tTbfTTqQe3XAeqbXf+RBffFDl2GP7ZdsVzdx5CmhCYlaKBhyZyJLet5K/Jgv5cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7AqszT9JK11llslLQymtoeL6/CVsiRkIvN5VK7Yksp8=;
	b=g+rNRY/RpvqnMuPz8GJDerjiZPo+/RVUqIGKqjFOfYfm04xMgT9USPJkBxRJTGbftnbB
	 wRHA2kvykK0zh+5TJRHXjNU7BEmYvHDlqp8M0Vej8/6hbjzG4HUfJ5DxGvr4kfSvnDB2o
	 K1VALPKx+6W86VMMxAuJ5jKoJWugb2jzDPCALzqxN7HJwKmYAMFNjD6yBTt0qRLQfO24F
	 UzSZCm2A7xI/4CxZDrW+7d+gOQIcIxas+lVPpMGW6ehzC0wxz2rPpRmxTMX2f7H5jq4Zp
	 eoghyojHUzNfGYrBe4FjmmGsFIkWMXU5K23fngFfhGGJGY2DDCbM78RvB41OaH0qRlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AAEQoXKH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB6D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB6D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AAEQoXKH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so18487985e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434288; x=1793039088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7AqszT9JK11llslLQymtoeL6/CVsiRkIvN5VK7Yksp8=;
        b=AAEQoXKHc4qVf2HIjiQ8hLWltD/WNmxMWjj8qt5UwN5hy1+/yKrcck/VhWskWsunqF
         yo0007HiGPNS/iWFOfPU+uMkVzFV0mVFotObqlrQ2gGZ1h5uzaOtd/PZAvrllk3OKRkO
         H0N/htnBfc9Th6zrFhkmNfUNHTOSduebN3AKmub6tijY53xDOZwxBXoXLyJnUkvACQu2
         z8f9zH3xplsg9qACQcCSLXriJf66GOnJZb4HrOCvyTuUJ1c+zEEZw8pWQy+Xje2QmB3o
         isUsgzbXIR3XQwRcpIrTdp+wNcw0rWutNAbNpJR7cLXoOL/M1OBQW7JSRiSMfkm4wo1d
         nkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434288; x=1793039088;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AqszT9JK11llslLQymtoeL6/CVsiRkIvN5VK7Yksp8=;
        b=PWM7huoTbvGc61HhNvnrDOLiUn/ncVqqZu34vwlCFqiwrfanxNoSmhmD9FJBCUyppN
         +2P0Jc7xmcoBMZO6In4mUAg+Nry1WrxygxPtTwNYEOHCb9aeQYvKsjIfSomsM5ViURQ0
         W59+5/RVj6GsSGbVW5QI/aRVLWqZhnf336IMVnO1NO5beuKlA/ZY8ItER7Ov+0oGpNEy
         8M7ykJ1LdmsJ1qPISJ2r4UPyYtZy33DCVKy07ycLlynjyITEho7Vw8da21Pu6l3hWx3j
         bJXXSpdERjraLEUBmtCzKXwQI+g8IeNEruh7B3a529kx3D5gNfX9Ke4HuDwfsuV+LRRL
         1flw==
X-Forwarded-Encrypted: i=1; AKwUvBwn/8NYg9l8G0Fahz+NpTbAb/JXi1yYnFe8XGQgLHlscnx5Eu4YgY1qAznMYxVCfZgTALJ3y3yi3zAJrOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQOUjC8gwGYImJiW0ww4tshibGk87fLtuBHO0FFZQjjO4rhuLJ
	cF0qIpFoVT3CSubj9J6LUMYIm+EPig/ZwnyMUVqex6HKsfb39EHw9ZTJ
X-Gm-Gg: AYBFou0dT5Y2RzaXeUIwfc+YOLXgMmsP15ZC86Giyj8V08c0bJbKkeq+stznHVrMWpY
	K9/7v1NUIq2DOjuKeXV29+Y7Y58L9Pn9ZFg+PNVqnu8m/oIPs2G52QNULM58CRSbi7lmbgYXdUH
	qKuf8/S+e6KuzCHviuAUocYIF20XVKx9whJ79xO+D4od10b+nwZ+9pjW60Esru1r6eCPuG1exzX
	X6tvIpw7LiALgoPCBejelzp6ao9Ai3o+W5zC6LDOY86SoOeu0iZlN1JQ7Cr7QUczTaagA7LLWMb
	L6GW8ZgDUJ2Pzl0VyDsAiVPdKWY7Kbl5LPNfaVRMcHa3X6o0TIWVr8FSb7knfF21DTCCvcd0J7c
	Kinftd6wloEicLgOgt0d6FxSbJQPV+CToWuO430UAN6FQyW7ESomdDsHV2ZiCuzxItVwbEl/bVC
	rtBe3Q8g3dGzSuHRxW7XYvS82Puf2XeBtZ6aTE/OK3YdCnrqH5kFhquu504j7zOMVdD/9LsyD13
	LjkEsLZfH6Y8F2wRMBZg4Vfgzz0Bbl3mza6KmLMFJnUmZcoCWAKykWIid+F6GyWYwCsqTXWVlw=
X-Received: by 2002:a05:600c:4684:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1d76001e9mr174049105e9.16.1792434287773;
        Mon, 19 Oct 2026 11:24:47 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6db78csm613743f8f.2.2026.10.19.11.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:24:47 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Date: Mon, 19 Oct 2026 19:24:45 +0100
Message-ID: <179243379000.31842.4735750009847702427@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019162722.25587-3-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 04:27:50PM +0000, Sergey Lebedev wrote:
> The clock tree is computed from the input clock and the one link frequency
> the endpoint gives, as in vd55g1. The MIPI rate must be an integer multiple
> of the input clock, or the sensor would run at another one, so any other
> link frequency fails probe.

Thank you for posting this. I tested v1 on the Snapdragon Surface Pro 11
(X1E80100), where the endpoint is 420 MHz link frequency (840 Mbps) with
a 19.2 MHz xclk.

As posted, patch 2/4 fails probe at the integer-multiple check because
840 MHz is not an integer multiple of 19.2 MHz.

For a test only, I removed that rejection and left the rest of the driver
unchanged. The sensor then probes, the CAMSS media graph completes, and
capture delivers one complete 644x604 Y10 frame. A continuous five-frame
capture then times out waiting for frame 2.

The 1200-pixel line length below 900 Mbps is already present in this
standalone driver, so this is not the earlier line-length issue. I also
tried the ST one-lane OIF_CTRL value 0x81; the behaviour was unchanged.

For comparison, Peter's generalized vd55g1 series, with the 1200-pixel
line-length fix, streams continuously on this same machine with the same
19.2 MHz xclk and nominal 840 Mbps endpoint setting. Whether the sensor
internally rounds that rate is a separate question, but rejecting the
configuration outright prevents this Snapdragon model from probing.

There also appears to be a second difference to narrow down after the
first frame. I'm continuing to bisect that and will report the exact
cause/delta once I have it, so I can't give this a Tested-by yet.

Best regards,
George
