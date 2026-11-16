Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819365;
	b=vXd8cZ15e3jR78ejwWDxvm4O5wuilDbIfFI+DHnUAiXeGAAcYNrRIadgEegDSfoOQxN9
	 5MeywZCwMmuf9SAdz+sCYSCKRTCCeho09pVtduv6+55h8PTrtv95rXu2KTLJLdAzl5GPd
	 oEnAEx8CwmlPznUC+jWNpXxBWbwclIwn6HwP0ib6yBk0iAQQDuOLrtIRI5FX25tGnNCuL
	 ZmBhy+hipCWz2i3LzMecMWCRGpF9zHeiUQDH17p7zyPR9lKqB7Vz/7uz59vffnOPMJf/X
	 CtYs/gnlvWq0oSEhVKiSfvQ739hQD6ILiZu5EWaE2qz+I6pycz7T5YBd9c2AqUv9OqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819365;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=R32gEKrW706ZiyVdTAS8NJ1wU1G9YlflcPvlSWnKOWM=;
	b=bXRIe2x24MC5OWXsmvJMay0Wzi6fS9wMkXbrTxobTxBEbY6WSQg7DC00XlbFE0SqVCcH
	 1Lcb54Kflgn2/FWLeQKxMueXCWrlnCbEaJ68cy7Vfy4Jzt+3oEzSTmd3jKxYIFRU9XkEH
	 adkj3axBEkFSRhbS/otcpei6Dr9ETtYJPTnUA65C67uTLJ4i9wsXUGxkl5U7Di/gqvs3y
	 DjvRrOwQ6WLwvCmwjecFh7H/qKEl4EpThdB4N+ewSTKzCWMGyvFeJNd49aKE5RupJoBXE
	 u/edlEP6wT2aAdcoLxRdSxgSistRPf/qzwCsPZ0dnytaRuJDJv93g7bUt0bOkeNJ1rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D60606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSsVK-000000007s4-3RPS;
	Mon, 16 Nov 2026 08:55:59 +0000
Date: Mon, 16 Nov 2026 08:55:45 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 06/14] drm/bridge: it6505: bail out of the IRQ handler
 when status reads fail
Message-ID: <179481904177.211952.7029866729856302771@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <2e003c2e6fdb56d03c3a6effdf090079afb2ffaf.1790552614.git.daniel@makrotopia.org>
 <179251509977.78870.3399297204284524303.b4-review@b4>
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
Content-Disposition: inline
In-Reply-To: <179251509977.78870.3399297204284524303.b4-review@b4>

Hi Luca,

On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
> One first question it whether a read failure is realistic or not, and
> whether you have experienced it on real hardware.

I have not hit it on hardware. It takes a failing i2c transfer, e.g.
the chip NACKing while held in reset, which can be provoked through
the force_power_on_off debugfs knob: it6505_poweroff() only calls
disable_irq_nosync(), so a running handler keeps reading from a chip
that is being put into reset.

And hostesly, my interest here is basically getting audio going on
that Lenovo Ideapad, and for that

https://lore.kernel.org/all/cover.1784561622.git.daniel@makrotopia.org/

is sufficient. The 12 other patches are what Sahsiko has been chasing
me into, and all the complains it had looked valid and legitimate, so
I took on writing the fixes for that as well.

[...]
> I would consider replacing all the 3 it6505_read() calls with a single
> regmap_bulk_read(), making error management cleaner.
>
> What do you think about this option?
>
> Perhaps the three it6505_write() below could also become a bulk write.

Makes sense, INT_STATUS_01..03 are contiguous and the driver already
uses multi-byte transfers elsewhere. I'll switch to a bulk read and
write in v9.

Cheers

Daniel
