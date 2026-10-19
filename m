Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438461;
	b=o3+u+E8vH/ZnFztYmlQvvG3uw+EhGbnyyVPJI1TTJkfQBeUlWXYTdDUAr0CBd7sS0fxB
	 BqYNx5eO010hxJyvIupAWjU+BPUmRSr7BtOaS7la4D1PiTjToAMd+J6+qsTA8PLzcXwxA
	 3qSoLh3UnCc0R87isQZsSvCyGbzEotsxEcDvu0fhmbePW6c+ZOExGrOJaDNKkUmm6K3eW
	 cE7Y4L+cr2InabJLSBtuGQZjf2iCmSrKVwLQMsJE/a5p8TpmyzPOnv/qzDs91qkeP9kUb
	 QJVjIdSm4wbjok09LNbXC0wjmfKI+4xAKxh0ez0ZusXvnAKIz4Me2c52gMxzWMOv8xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438461;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=nPdCuYuE8jyGvyTrrFNZUzAKYMUp25mkxsbENdnsNeI=;
	b=aQSNtuV4fZiF9FguIRiWMFyLnwH9gCP8Qsr1DnBLNCkgnmCbRpinbv9rzviuZ1Hchdov
	 M+YRyBw/Y9CBznMBInJKnGvLUasY5Bkzk+bHizgp9jTYn/9cCavcAa4+e9cDnMxHghSEo
	 FQUl2ONtkj35YuXUtY1yS7qHqnq3hF8HXcv0mDRV7j6PrQ+zh8sKZGawxgzOOXWQDv/zz
	 jJ9dck2CjOD1zjga+MhX/zsUKU1yBpTxd5kHd5+5jsicT+CcYnTGsDMF+s74vSMitZrxa
	 P0VIeoYrWkQdxoBulWwoTVAgFNzPbh9kVgB7NxH+AJcIm8xZgrNfCc4lcE+hG7InAEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ACBjv9jq;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27418606A31D;
	Mon, 19 Oct 2026 19:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27418606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ACBjv9jq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792438457; x=1792697657;
	bh=nPdCuYuE8jyGvyTrrFNZUzAKYMUp25mkxsbENdnsNeI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ACBjv9jqUcqTZ93BZ5Xg1NT+JWcIbkWtgyivUbjYQBUuWmBumZ7F+O0AM9/bHC9w/
	 Ve2ml/KQPnoaD44hqgabn3WAGdB+i4GroXbGQakkh21dfCDUXsLPIlZ3Qua7aHfKfh
	 Az+jWYgCHzTaZn8l/sruye7wr63+nVILEVTGcQI9llaF5ukqXymWlQz7Ps0lYa0CDE
	 ScjtWv546bDxXDU81RQu+cotn6TsvR3TSfuO8rrJzHcqsvf8+/F/XVYF5zp2m7IFNi
	 N1HNzWtEORYmkmxZOE+mjYd3MqqRM8GejQVV24XmbT30NMsW2yuTJ1RSda9q6leE1+
	 94BenJWe40GqQ==
Date: Mon, 19 Oct 2026 19:34:10 +0000
To: George Neacsu <geocausa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261019193402.52923-1-lsa.uz@pm.me>
In-Reply-To: <179243379000.31842.4735750009847702427@gmail.com>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 84ef21798b2e9c9cd5a8dec8a5dcfd56519c438e
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi George,

Thank you for trying it on the Snapdragon model.

On 19/10/2026 19:24, George Neacsu wrote:
> As posted, patch 2/4 fails probe at the integer-multiple check because
> 840 MHz is not an integer multiple of 19.2 MHz.

That refusal is deliberate. The MIPI rate is an integer multiple of the
input clock, and the sensor rounds a request down (UM2829 13.6): asked
for 840 Mbps from 19.2 MHz, it runs at 825.6 while the receiver is set
up for 840. camera-sensor.rst asks a sensor driver to use only the link
frequencies the firmware gives, so the driver refuses one it cannot
produce. From 19.2 MHz, 403.2 MHz (806.4 Mbps, 42 times the clock) and
384 MHz (768 Mbps, 40 times) are exact, so the change is one value in
your board's DT, in the sensor endpoint:

=09link-frequencies =3D /bits/ 64 <403200000>;

On the Intel model I ran it at 403.2 MHz with a 19.2 MHz clock, and every
mode ran at 60.22 fps, as the controls give.

> For a test only, I removed that rejection and left the rest of the driver
> unchanged. The sensor then probes, the CAMSS media graph completes, and
> capture delivers one complete 644x604 Y10 frame. A continuous five-frame
> capture then times out waiting for frame 2.

With the check removed, the sensor runs at 825.6 Mbps against a receiver
set up for 840, and the driver reports a pixel rate of 140 MHz where it
is 137.6. I do not know whether CAMSS minds, but a run at 403.2 MHz with
the driver as posted would take that out of the question. If it still
stops after one frame, I would be glad to compare what the two drivers
write at stream start.

Sergey

