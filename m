Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792454433;
	b=Uzyw+7+BB8YKJEEO/mh1tizaG/7lE7HfOlPm84w+KlDGj+/dPh0CISTloWbEu2LZAhG+
	 FMTXXjMA3q12YySr4Lh/4YiXBZ7Z1B3tZ6dKmCNfTbQPKB4PhWRjDMKuGP6iT7kUfHC53
	 7JygfaeId0SOUzL1LcBvB7wEpy3HiG0obKbATiDilGoTwT5c77/x1YCgNxpihfz9IBQ3D
	 wl8yWU6CyNQnriz3y/ZvUH3eBfyqOf2V2qQolPXlSN0wrlyB2ew9453eXYficAP/xPkQi
	 fnhRI7f0KHTvzxac1QJuYJSnn2ywOU7ZxNOjB7UbJZF4p8ElnGpfNEQ+fNX1bWXWGSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792454433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kOEW7S9rMOKRcbBBo1xEhhJSd5nf3JnZXymk/xgXKU4=;
	b=Nqc3PCM7PSfpUsrGEooR1BNVL+NXg/rYxivDSELS/miV6hmYgxTN0nbz0dEwhhesW4v9
	 Wu510lZfkPfXR4GTGpDu7orNGY3NovXfOJtUpNwonZo8nLqx1RCGC3XaAbG6JF+pRS3kZ
	 cNaqZwosBvYRV8vsv30RjdCj2uCDL0ESnC8qE9RR9MF7o3p6pp6/esdJvwxlxHweQTbjG
	 hxfjuzNh4pyNYKhCxluyayJXxHP9nlM6GoUNpEiSwsu2k1/YcHg9ssYgMPlVehtyZx9do
	 2Jj6h65LDLHmowt5c1M0aL1yuOMs5xYnySnoxj+gIZHkpV5ZRQqSJxVUsHMh4zfvX8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SCmOf8BC;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A62606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A62606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SCmOf8BC
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so4530318eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792454431; x=1793059231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOEW7S9rMOKRcbBBo1xEhhJSd5nf3JnZXymk/xgXKU4=;
        b=SCmOf8BCqz1c78pw3ObHcpI6bBn3M/Of4yKhXYkhXq98ab4cFiCh499HcxncWxO2zI
         49ZrOKmdCfuWkwFoP376ZIzcgSVEtxeH3voW98E47ZAs544fDDQpRChC5xn1cofnD1qm
         feAiXoIiZTBcDOagr9ACtyGvkBfkq+NpnIVAJ7tKZkbQhduw3Ofnu/zZTW7x6awuw8Kw
         65dHNHyvTeI4yP6+NA2a2NRaaTJvZ2pHkf/919Mn+b4tT7cxceztYFUVyV7M7Ue6/lcw
         H9ZmqAE073s4ZBwNdkFbnpyvjMo1nl9DayGnAdvaKF4AEKCT7nj9ikJPJGVzjvk6PXwR
         vpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792454431; x=1793059231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOEW7S9rMOKRcbBBo1xEhhJSd5nf3JnZXymk/xgXKU4=;
        b=I5hWIpbAd8VUutBAsftvsc5KhX1phHWwGvPD74/9uaZY6VQLlcCma006KQuOWupHv6
         slsxX3wO3UlxHKeBWbznv78eb8ueGOBOfJ46qkg50nH7SWKSmCQv6S14heAyvSXt8zkk
         LJ08OjMpCiNN/QvxjuYpPNH/pkpD0ObTa/ocGDdBW65ZUY8gcpdI5cAFoRu0sO1xS5B6
         p/zSjRgDLT/W+Hb7eDq1NrKsKzluR/dKslqPUGJY1WLKj6naXi+dCKjvXeNZ15xGujyN
         kB50NpZXKOuJPZwguzsxoW6au54HcpQfEv8smaLA7m9GX2adf0mKEK2cECcL3wPufrx1
         4QtA==
X-Forwarded-Encrypted: i=1; AKwUvBw2tf1tHxYRjPC8gLGe771aEc/0ssfr9t3LOZH6cvsz9o/lxV+uPd+U42ia/tEG7JxvAhhqVjXY66sq78M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNQnOazDDV4iWcTOEU1Mzzg9CeZETsV2cmGNcyHLoc8aCthq7u
	76mCFLTeHhatB1wiXJrIU/huUhWcWmFpabMObmNuMSctPIPmxJQUWQxL
X-Gm-Gg: AYBFou1+LCyLdvhISFRmj7LrXZbye3UTs0UQUuwMVdkRye3+eZnT2RIrnmF6XjoCXY0
	OicXBT2gs7URQz/I8veQ6diMd/OWLaZj/M8mGC8BfqQysCPO/X/aEjkWxBs5mjRBV7qmoMETxrX
	HxX5n084FhEh+PCKzUA5IgSNy82L/lUHIjE/we/TW8qOL8GfgL5kQADYpsKqle0x9lX9llh5a6I
	EGKWmw1LLnB84UIiYdkkLQwSLt7QoWTg3hw9Vt14+dqMAYnD2Tt4WN/87NFwmZY+v5Lr/wTgtLb
	sd2fQNubcgCq2pns9/c6hgfXpbDZCJkgJ/AbEvdo6UE5k5YJAfrFsabbg+lsqs/XX+KfYCjTS+C
	aNia2xZ4m9sq+xeFhRTxiIYmkeYIRzxCm7D6qWzTHgz2rN4cgZizD9Ng2tAfx1qPyG0ujU6Mfra
	rOt4g+umHJ7MpkBjEia0Vdd514XROFUIOkdrYoD9CeFdjO7oCZtNiMcyGv12HOFyWX7+GPQ+n9O
	nrgIviNP1anB9ZkADtpzOM=
X-Received: by 2002:a05:7301:6497:b0:35d:8c39:b2fd with SMTP id 5a478bee46e88-3619f1fe992mr13331411eec.1.1792454431316;
        Mon, 19 Oct 2026 17:00:31 -0700 (PDT)
Received: from stephan-Inspiron-15-3520.. ([2804:5d20:6009:6701:dfce:4d9d:7f44:24e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm37371921eec.21.2026.10.19.17.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:00:30 -0700 (PDT)
From: Stephan Costa Barros <stephanbrrs8@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ti-ads1299: add driver for TI ADS1299
Date: Mon, 19 Oct 2026 20:59:56 -0300
Message-ID: <20261020000017.14331-1-stephanbrrs8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atXAQXmGEeGdJMZQ@monoceros>
References: <20261019001247.483005-1-stephanbrrs8@gmail.com> <20261019001247.483005-3-stephanbrrs8@gmail.com> <atXAQXmGEeGdJMZQ@monoceros>
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

On Mon, Oct 19, 2026 at 09:03:24AM +0200, Uwe Kleine-König wrote:
> <linux/spi/spi.h> provides both of_device_id and spi_device_id. So there
> is no need to also include <linux/mod_devicetable.h>. The latter pulls
> in a lot of useless dependencies, so there is actually some harm in
> using it.

Thanks, I'll drop it in v2.

Stephan
