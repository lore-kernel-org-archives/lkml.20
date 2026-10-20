Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792471299;
	b=gh2LwfalHPPneseQEQ5jjF6xWx0EP+F3umIRw6mbnTwsM3ycBQ29teeQ1remMt6GXxwE
	 fUjctvaF8prkek5r6V0iEdQXeBd+ruhwPtGkWHzsEuDl+cUnpdU7pMjahybxDDuUAo/yp
	 igEUgXgMnyWTYNBV3a4EiDBsj73q1H0wzy+OjN/d3N23XZsapmp6X+3WebOnG5Rh7ddTQ
	 DkHgodD8+2+XupEQUPdOsBtu8c5hHt9ZmFopav2ucgVZMWOjB2IzET/auCr4MYwUdTbFo
	 d6N4MiR90/SoSyT4W830bDd21b5kQlJcC5wa74KziKiJI/6HXxgeZW9lRKQH1JFIJRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792471299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4K10gDOkZE3PD160wnpT0ljtcztdT1+fKIxqNnjTmeM=;
	b=AITqr+q41pVbMbpGZLDFbggQjhvIuskflD8t3iwWFhHjozNzmvBpfpbpb3costBviPZs
	 4wJOyoJur73POeQ36SrxJc+WIsYRwqa66h78TIPosE55yCqQysRokEZHuHS2Ka6EFB9Ag
	 vZf9/e+SbS5SWtiLn4rRQCV7XMgtcKEUy19uEIkjkgpAoD/MHqLVfiZj9+tkRcAks15Na
	 j6/pCBQIJzdwlhW7v1Qr1L17H/8qNeV/c2Fv1mVumG5mspnvLaRozZc7ko3UroAonoD5r
	 PqfGJt4dx0+W5jOFh1eJtkMxGOzQ0Nbwh0LkT+/deF43/uI8CgIicqxGUKOcrA0sb1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rCj6oB0T;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4759606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4759606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rCj6oB0T
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1758619a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792471298; x=1793076098; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4K10gDOkZE3PD160wnpT0ljtcztdT1+fKIxqNnjTmeM=;
        b=rCj6oB0Tts/buXDRhQwBOZ/wE3fvSFwMm4Romi3Kym5+buRZo/KSyoHyNk9oVOhnrY
         LDqCvzoeLh6Ys4OJTn0CTU7ocVB+dvFL2wRQENTILVBo7ykIj5wxvrLwTFkm2cOglvqD
         a278cqvnIkQkH/yGwDQVRo+tw9il34Xs4c4r1QGkdaeW6dnN9x6dzKD09CD31+um6e8+
         Vp0bKxVrCJZ7g03nQ+C7zxsSwoUfomx4ayuQUMGFHjEhY+r2YaytKqDMMqeAAtx4Kvus
         6nd0UYEp4N//9EA9GBkMFavNmGHzLKf7JMcE8AJp25l9rHhmfn6LQUu7cG24Ss9v7ZEv
         WKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792471298; x=1793076098;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4K10gDOkZE3PD160wnpT0ljtcztdT1+fKIxqNnjTmeM=;
        b=WnrUJQgFUFN+8+ozDUb5U/pX3pDtUnRyVY5pXytv81vfJNNWesWZiVJ6jYLj0FWB9y
         KozHWe713HtFSXXVuiyOwD7PVAOk28l2SZukrjjKhjc9/ENZgpgEH5u7EYpcnMBvyE4+
         UHFBXVRHm4+ACUka3Z1BpBXZ0c5pnSDtQZAmLb3ZtwvmhAlRZ7wnEFSSb+m9ZpolZa8y
         noVdX65+JQIuB09CCmu7axQAKfxAihHjsBcC75XSWmQdBd3n0Sw6vXISGGnkpPC5IbMu
         VDSkXKuOEtMrvtnVUbyqvCJ3yiSq82v5ur3G7gyhBd5YvkX5gIaduv+jM+Rb00c26QJi
         7rNg==
X-Forwarded-Encrypted: i=1; AKwUvBwSO7cQ2QI4HJmK3Fan9mRbFBAKKUnlH+jAe+UvvfAGtReeJNgCTFpTwmkLulRUW2LD0G3sFKE3BsmvFs4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFuOtw4UT3zgszmRTkezhqaF9iLhIjrrBXEo6pPtPuC2rV7ETc
	2C2pNq8XAg49W5esYQ993MsG0MU7jT6N6IPT39H5nYwfUd19GqmOX6bW
X-Gm-Gg: AYBFou1hGZDesEy29FZ8jHuZJCbR7KHADV2XaXnEBcCyFLlXKpipUh3+w9hr4fWQ8h0
	k2SsvsGYUfRmfBBjRzudJRD7ih3wr3t5rP4tQTn+OsLY4LStchkqaFYkbvGDZ/Kc2YamJB896tX
	M5EbHyIJbvZGYx4bJzqZKTZdozDNgpttTvwul1tuqra82ZtprZFMzIraw+ayY6IWaWku7BhzsVv
	IyLAZraw7ppPFb5DA2vvfPuMaO+yzZjSSJtnYz22MSXbPUwxcTKESUvsoLlDWzabboACJHHmb3p
	423VvXm4Y02ar05rbD6gXsfa+c9DpNTH80W1ufPuj0OEfYOy75XIyCFgGqXBtaMX001VqhCaVED
	L7b2Npjgw5v2xiXtibsVjFD6ig4g5ql6C/JsrbjL3iigWkaJrThP2ptR9yfrK8+deb+SIXmg3ND
	4OjAp/YDij6QGp+lW7//FNY5Ep95sd4qhSmlJPCaARBlyjJMOI/05uy8mBbGuCZ/jactE+Pgoie
	QvpZOHzLwDDYoz0n5X6W4zb16FSXD6Lk+TDGSht
X-Received: by 2002:a17:90b:3851:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3acee2939b1mr7440626a91.7.1792471298112;
        Mon, 19 Oct 2026 21:41:38 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60274fc1sm2242645a91.0.2026.10.19.21.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 21:41:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 2/2] rtc: Add NXP PCF85053 driver support
From: Potin Lai <potin.lai.pt@gmail.com>
To: alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: pankit.garg@nxp.com, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
 Lakshay Piplani <lakshay.piplani@nxp.com>, 
 Daniel Aguirre <daniel.aguirre@nxp.com>, potin.lai@quantatw.com
In-Reply-To: <20260914141537.3881890-2-lakshay.piplani@nxp.com>
References: <20260914141537.3881890-1-lakshay.piplani@nxp.com>
 <20260914141537.3881890-2-lakshay.piplani@nxp.com>
Date: Tue, 20 Oct 2026 12:39:05 +0800
Message-Id: <179247114505.1909331.8772243042180533977.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792471294; l=1059;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=n5P1atnEZAPMo7JzNsBwROdmy+J5EY95ZUsmftBy8h0=;
 b=EdjxSeP0LCf0fvkfNg8X4WS1akYfDY8F5W5JzCUosWEW6Mg2pEAecfdbNqRFLjP+GLLWXEXrp
 qBasBTb3fAGBjoTyxOqGvZoH434FUHzjg32btWvTbtccwyuiA/ETbgh
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

On Mon, 14 Sep 2026 19:45:37 +0530, Lakshay Piplani <lakshay.piplani@nxp.com> wrote:
> diff --git a/drivers/rtc/rtc-pcf85053.c b/drivers/rtc/rtc-pcf85053.c
> new file mode 100644
> index 000000000000..2eb94b1da3ed
> --- /dev/null
> +++ b/drivers/rtc/rtc-pcf85053.c
> @@ -0,0 +1,900 @@
> [ ... skip 770 lines ... ]
> +
> +	dev_set_drvdata(dev, pcf85053);
> +
> +	if (of_property_read_string(dev->of_node, "nxp,interface", &iface))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Missing mandatory property: nxp,interface\n");

Hi Lakshay,

Would it be possible to provide a fallback default true for
`pcf85053->is_primary` if the property is omitted?

In the current implementation, nxp,interface is strictly mandatory.
However, when users instantiate the device via the sysfs new_device
interface (e.g., echo pcf85053a 0x6f > /sys/bus/i2c/devices/i2c-X/new_device),
there is no way to pass Device Tree properties. Because of this, probe
will always fail with -EINVAL.

Thanks,
Potin

-- 
Potin Lai <potin.lai.pt@gmail.com>
