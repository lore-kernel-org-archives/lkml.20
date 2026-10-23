Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758407;
	b=I7lOjowhPQ/62/k01kVSh/dxE9635j61kShxpFwnQ7mCRgQWoBHeyYclXYprumIHugHJ
	 mtoaB8p+bVqWO0cmupjCLKcxafHNDivjJUb99wv8QiqHlR3fvH/rAUo0VgO78BI1h3XJ3
	 sQ2XexIKVT+yckfFq8s3iRWFWvJTafurzv8jw0/SwluDkJjaLQjXDsHLHhr079FnPLgn9
	 uuG4nBmsMnI4c2jBhmhV8AKL8FHNUwTtMswnwEBYU2f+g2dsmHjHhq0W8aylxmOgqG0et
	 nFbIKW4ftDDu0DLRQLqhMJ214zyqfdXmhhkAO8UsBF4D6vbnpnAvBeOblEHxpAnyqQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758407;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=jGnSz9MbD0nGI3cDu0s+eTY8w7lEguV0Gvk3C1h+HYc=;
	b=l8YrS+8zE0t2aGKHTPtz8eqRWqSmfaVPGPEA/iMDo35sXsRkcMY4Vos/4IGqej1Ij+0v
	 jVlMzeXfmZPedqvNmDLhNAMJrtQp1JRrB1oGSzm/M6R1obGpBfZ/ntVznmRuZ6wUIOLoG
	 Fyy88fGxdgjpbHb7ozJeI4w+WJK74uExpbkC8a4Uf9dwRbtxzMxnByhRk8Zj8/2YMKs3C
	 uhKgDVbs/zz/MYFiWIOhX4QpprKXG/RPWbFpP8GRb0TeuGbDjoVwh1LkV/qpptL5SXTgm
	 pN4ei/blml+Gd5Qr0dOf9UeUt0JgdMsGt3EOdVnWkzi5HhBTyPIJ8wM407cKd4IBIqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRTH64rm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19690606A31B;
	Fri, 23 Oct 2026 12:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CRTH64rm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B171F01825;
	Fri, 23 Oct 2026 12:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758406;
	bh=jGnSz9MbD0nGI3cDu0s+eTY8w7lEguV0Gvk3C1h+HYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CRTH64rm6t2a43dtLv4ByVgPemyQGtA3xLEbDJ+UaP0AehsIJS/cf8dCgob4Xiwyt
	 EMkXLVcuuE92o3WD/GgcrbHWiHBI5+eZB0zM0hdfOQKn7qbA7JhQ9sXm5vAV/Waa+p
	 PBF2MJ76crO8S3WeJJEX9aens60Jv91EYYNvG1RcE7bA91Pz1Ap1A44UFbaDwUdYkg
	 r08+BuLngxO1/vm7oSvU7D5/KbkMQnagJtfTC5CZFZdHm9hu1jb2Wfl+fCs01zqIsy
	 3nMMls39tlVeiWoKmhMPBUQedHUFOhYz9rit0E3fvJK+OJi2Asx6SLov2Qc0L5/H91
	 wX7GWwhzvKPAw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Maxime Ripard <mripard@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] media: Fault-Tolerant V4L2
In-Reply-To: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
Date: Fri, 23 Oct 2026 14:26:44 +0200
Message-ID: <xhkdby0boob5n.fsf@mkorpers-koolstof.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi everyone,

On Thu, Oct 01, 2026 at 14:55, Mattijs Korpershoek <mkorpershoek@kernel.org> wrote:

> On media-centric camera pipelines, every entity is known at boot time
> and described statically (for example via device-tree).
>
> The V4L2 framework assumes that every entity of the camera
> pipeline is always present. This is a reasonable assumption for
> integrated cameras in laptops or phones. However, in automotive systems,
> cameras (e.g. rear-view or surround-view) can be damaged or disconnected.
> When the framework assumes all sensors are present, a single missing
> camera can prevent the entire pipeline from operating.

This series has been discussed at the Camera & ISP "unconference" in
Pragues (during Linux Plumbers)

The notes can be found here:
https://lore.kernel.org/linux-media/20261021224119.GA383235@killaraus.ideasonboard.com/T/#u

I intend to rework V2 based on the feedback I've received on the list
and at the "unconference".

I'll try to reuse Sakari's work on media graph events from:
https://git.linuxtv.org/sailus/media_tree.git/log/?h=partial-reg

Thanks again for the feedback I've received so far.

Regards
Mattijs
