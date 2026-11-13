Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537619;
	b=K3yCHoGeRErlNRvEkb3dqiHjYpokI2c7uuRj2BbM0h+XfAhNpPIstu0TtayZr4AUSu3l
	 GJoV8/tNDFFHTUK7EK73qXGUrnAo42pkiRrtcT9Ga2oiRV6NSfsru4J0UzINk47+Rup1H
	 r3vToYsPvM/7wgRqJ0l8Ug+5OIP99/ozUXrt4bz6xi0w1pLBEV15m5PugTGgGtW6gRKwo
	 nBEl6pXeboY8xbIhFa4FNvKs31X+R/TqSr5QRzH4L+Kgaqe7FjZWC03MgW4iU3hUgNtuG
	 iwqIqEuIJOaF97LWgXr/3R88pYMakRjJjHkBNJrS1fYZmO7RuIB3N1rWBqAQrA804GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=CPwtUJVd7keNZw6evxXk+bPw16MkL52vmivrbbfL9hc=;
	b=ARYyIR3VwavSDmVwchMO0eya79MDOL4n9QH+B422ViCk0Hrs2jDX5boGdH3P/QhrufQo
	 VyRNa2Ko5nxoBtDUrFPZtQ3vghnSYHmMWN7JCYEzTze7T+yursY1LiTFuonxIB+m+QAiV
	 uXJLx8ocwI+mnPnreS22qgfOCVU2ak1rQFy1i+ZsHSB+PjxzPKdSDLeH8vewtQ70oVPUB
	 QTfYeNDSkftNX2qrMMzhjKqJA/62N06nDXBdH08mHzU+F3FNom83XOn99HFpiMdBH0QAx
	 H6rdNOkpGSOUn7ZdnR6zYmJDM0js11Lkhw7PbuZl8z/OGyEKm1syvfuHYs0Rifjv/Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0ityr8n;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5380B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5380B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y0ityr8n
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1019024eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537617; x=1795142417; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPwtUJVd7keNZw6evxXk+bPw16MkL52vmivrbbfL9hc=;
        b=y0ityr8nb+mOQyp4/fPEF9+zrJG6mgmdmpJv+Y93RzqZgid2J4tuXTgbIDQdJRgjiJ
         iETDR9u8/s60tJn6y6BcQlC3fAO5D1xyLBbqiXRNIYv6pEdc6PiYfSLXcgUJeRB0JLmk
         s789SYVpcm7+tqlu2p8MiJe0GmTEhIF6xEowEBYim5RlIEIIhlxXhwUW6MvYKp8XxJfO
         zZ9TrsY+3I4ltn5yxgxHQddQvAUtBPOLbVR0N0N3RoiLRa56cnSiXTTJUnR4DBe6H7vM
         YggFCmdVHMUZ5/NRTBbRwKBO6fQjp4+LNS6Ke3jkuC6E3TAX9ceVcdCF4KDiOgXgDkON
         P25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537617; x=1795142417;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CPwtUJVd7keNZw6evxXk+bPw16MkL52vmivrbbfL9hc=;
        b=euvLoFF0XNt5ziqhQoaa1TCYymfQpnpJwGGZc7JBRQVELdjdP1hC/Y9FtijINxofDA
         BLTx+O5/4Y8X6btMXYYZ91cJHZNa0d92HWXPp2eV8VPxGQAfmlM42xjS7vN02G6jJN9C
         dlxMRsafUgYXhW8iezs1WBlc37T41YlAuuJcvzykNySLEB6wf65bXONht3eZ68M0+T1R
         mT2vpjCNY1sN1vuDTBoJOCVbYGeyt45uMry9NazF/8gJgBu7NJ9P4n6wgPtKlcW6AWLA
         baqCr96MO3MdqoAv+vcLlJq/bGKcmUir/9EKpCu0eq35xB7r2JoOHm9DDcr5LY4LeGO2
         igOQ==
X-Forwarded-Encrypted: i=1; AL+hErFk8V/Rvp9TrHXW4DpTIoh1wmEkf4pjCUc88AnYhhPtnGDThVTFAZ2kFcqH7pLgDb+A7AwyyDlZTNLgtYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3SDI7LZm44+xrW1VFZakiMATN+Av6DbBzCQXz7oJLPdkc5EJM
	v2eJ98KH1Q0ZfeIxIQtiOQ3ycr0edPp3igOt3YsAk6bjkS9sr0QM/k7i
X-Gm-Gg: AYBFou1X2t1ovQjqzzAZxDpQlKPVSMcFK0OrHnD7fdGKk8yexaxV0ffPte0l9NY2QK5
	NJP/9DQrWCgS69ufTpFWOMZuYX3FEsvPuxPMF+eJjMG0uPm//7AZxbBByW0CgjhjxG5dnyrouuW
	+wIygxHI4zFWQMt9cH7HX1SndXWGOnFjjSMQSBtVUsBpQPxz1u/mIgCuvqvlAQa8sSzs/sC6R8G
	SKiDcPO/vMicGi6iCU9hC1vKzS/ca21YKUs47DmxLDZG2AbSxeLa23bxy3jcCNpB9fZrh6bFGYK
	CoD9Ee1moy5DB0ayi4caGKzAOrq2sYw6PMyCVDav8+8qq1JQmLaqg1hnHudZDiGLTFbr4iLg3nl
	Q10bagGYfDOzF3q0M1ySC8WxDLAL3eFDdYbCm5tEyDDux89y28R7E8nND+XnnKqoe7+TJ8/a/ka
	xSQo8J8vIy0d4Sp6Z3IKa1VXfem4LoexVsMhRQWar6UGgErRsww/4mAT0eqqfaVn9jxpdlyrNbj
	D7bWOnbRuCsFdGcL8hHmI6Kfx4vzxCS4BzgrclypmB8JaKesz8isO023oenwinqOfQXKjrxwkn9
	mZsPAVH/uCOOoeVttKz9CfbUpsgqjw4DEILxqhHvWCW8/oTrN6QrOFLuO5tD5YUCbQ8gfg==
X-Received: by 2002:a05:693c:835c:20b0:375:e4de:96d3 with SMTP id 5a478bee46e88-3796721dfb7mr971406eec.31.1794537617110;
        Thu, 12 Nov 2026 18:40:17 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm3949197eec.20.2026.11.12.18.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:40:16 -0800 (PST)
Date: Thu, 12 Nov 2026 18:40:15 -0800
Message-ID: <1222b26cfe220b4a9a77ccb8ce82fd35@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aelin Reidel <aelin@mainlining.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 1/3] dt-bindings: input: document Goodix GTX8 Touchscreen ICs
In-Reply-To: <20260228-gtx8-v2-1-3a408c365f6c@mainlining.org>
References: <20260228-gtx8-v2-0-3a408c365f6c@mainlining.org> <20260228-gtx8-v2-1-3a408c365f6c@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Aelin,

On Sat, Feb 28, 2026 at 02:56:10AM +0100, Aelin Reidel wrote:
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..6307495c2746313cfc32cdbb701455d1596be435
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9886.yaml
> @@ -0,0 +1,71 @@
...
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt9886
> +      - goodix,gt9896
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply regulator on AVDD pin
> +
> +  vddio-supply:
> +    description: power supply regulator on VDDIO pin
> +
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-swapped-x-y: true
> +
> +additionalProperties: false

Could this use unevaluatedProperties: false instead of listing a subset
of touchscreen-* properties and setting additionalProperties: false?
That way other standard touchscreen.yaml properties supported by
touchscreen_parse_properties() (such as touchscreen-x-mm,
touchscreen-y-mm, touchscreen-fuzz-x, touchscreen-fuzz-y) can be used as
well.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - avdd-supply
> +  - touchscreen-size-x
> +  - touchscreen-size-y

Why is avdd-supply required while vddio-supply is optional (given that
the IC requires both rails and the driver calls devm_regulator_get() for
both)? Also, are touchscreen-size-x and touchscreen-size-y truly
required if the controller firmware already knows the panel resolution?

Thanks.

-- 
Dmitry
