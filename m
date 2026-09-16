Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A10C4A64FD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575046; cv=none; b=hbZCrJj1N90g2D6gYbjch44+OkKF3Tq83EAYBf8rIMR0VQEtj8xjBL7SfATUOnpKObbNydXl0pD2dNHdvgBpoGv8SUZoGoKgGBA+FUrBfmENhMDbvtY5jtskhJMjerx8o6rqz59CKQxxLXhkORKX030q7nUgtRdjwiJjnNCb1iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575046; c=relaxed/simple;
	bh=jRGuyNoeAYzVvO6Ipu5riZv9jM8Q8fQw/YB1R2vQM+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQAn9ny1jCpFTOtEsFs3D9xSC35ItBL0eLVoMr6F1fnBme01ShFBlLfOE5kT/xRSAs3Hhnt2WjJF1Yi8s8UZKUUuV+yvGWNrUvA8MgK/126DjxZrCB8L3Ok84KgH+H9u4sUtdgdT9LxIX8LYtYpONI2N7oh+aropGrgj+0/OYdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ruhZYiyO; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ruhZYiyO"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48704fc0141so96312f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575042; x=1790179842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRGuyNoeAYzVvO6Ipu5riZv9jM8Q8fQw/YB1R2vQM+w=;
        b=ruhZYiyOUIS27Sf9uIAVIUidzqLOoPHOJzGgH8bPUpet9DJhKwToErisqzMDuLm3Bh
         SjoZTMQqmlxiUjzElcTTroc8ommXWYglCt/LYt97JSXsqHH58yCUkBfAYyRqlJkGCBus
         1NKTpixb9xf3xNG0CBsHNiVs/umDqsyiROXQjFD1xGPdzAjWeyeboRc4aNlC2coBWPhG
         CUVd8rwBphUJ3IgfzQSCJQ0XpvRU8Z8p6dYze3MwFdikKb60yWzowBBHPgF3vIgvXQmL
         UU6uZNodwKOUZi8O7/W94RECVVeWyxcLSF+gCZWf5jzIQYQ+lC+w2jA5CNDtxRF06c36
         8sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575042; x=1790179842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jRGuyNoeAYzVvO6Ipu5riZv9jM8Q8fQw/YB1R2vQM+w=;
        b=q9XR7clwr8DBBXPezU9XXqjriOdUv49667bUOmL66zWCdjp7BIHPYGSsKgeIiszKNJ
         fqPT+eLsgqkmsGgkCG7Xz1AK36HOvwKk42jDrAXXDL97IYvCcnJA43c5Js+NUo+6aGJC
         /BI7MaOkVY819iaXymg4bBBG6/uIcHwKmAx07rkNi01WkFZvNCmFitpgXmBdQy7d1vhA
         FGzdI8e77NPRE8+vlvr0nex5ogtnc2w9i/Ye0P+pIwDH96wfP7nxgpxMjo2lhIZkKEkt
         QH0lIaYQqspDZWyJXoI+2k7WY/Vb9aTAZc010EqE0MlAVSUxmfD6a8DcK4MC3axR4dHs
         VeUg==
X-Forwarded-Encrypted: i=1; AKwUvByuh/1CSwLOqSHvXv8v26dqvNALSKW9YIKkNIISZ2TG3/e76D8Psv8aCm47MLPx4pfZw9SaIzSaBI4vEvA=@vger.kernel.org
X-Gm-Message-State: AFuF++kX3EmcLJ8sb1fNljF7dc55fhH/xDMOYLKt40Phts6xd/bKoXfQ
	/3eoEdYTy3OJl6QL5dbjbAMs/drYqDFxdrXECHdwV4IrywdOJOwcbjSC
X-Gm-Gg: AYBFou0xCUYgs5lQtD8gqzU/K+8LBIhhnOyjIN11MdJjMqv9rtAjKROq/zN22HSdPPA
	qv4858HPZu3gxjSncP+8j5CCi3UrzBkGrXxMOco1ZhCySeW+3/zxlYMXLzy2/kiq/Jj6IQcpfdb
	SSVESS8sMnM1PuxX/Q08tOyTb3KZ7tJBR2QdDsFfrr+02q/UmnBD4zji0/TxKpaCZvQzxiIF56s
	DQsGFlyqsLOGfV0gjJ2ddsqLpzzno2dbORXIcQpVtaK1FbzTR/4pvIYzuzmWbq2FUglBYC4w2n5
	Y00zvS/x4iXZsIk+vLF3X+2heB/yeyNvbKYqC1KEyNL0RLNo873ZWeZDjStQgNW2VO6c2P9a+lZ
	85Nsb1s3rgAqFocrqRwZV9m9btZxd36SMSpsY6MX1bJzqpx5IAt4JeL4+nnzzzAuPMoj93ncc1j
	9wpKGxMjQIe2xuMMsIF3wxRzd3ARIxy8bqOGeyaonB0v0jjZXHAeO1oIydYKJwWmFLz1hD7LpzP
	sIyqr6R/72WLKaYJCCki449KZ0IxiEyCSS6S6uAw9NJl3X1GnLYLqmwBcZGSN88E5NAoIRtrjBT
	2Q==
X-Received: by 2002:a05:6000:4a04:b0:487:10cb:ac16 with SMTP id ffacd0b85a97d-48710cbad2dmr2186039f8f.4.1789575042076;
        Wed, 16 Sep 2026 09:10:42 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E02002D5AB124699B1F76.dsl.pool.telekom.hu. [2001:4c4e:1b8e:200:2d5a:b124:699b:1f76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf43511sm7720177f8f.33.2026.09.16.09.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:10:41 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Frank Zhang <rmxpzlb@gmail.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	luca.ceresoli@bootlin.com,
	daniels@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	macromorgan@hotmail.com,
	dri-devel@lists.freedesktop.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] drm/bridge: dw-hdmi-qp: serialize HDMI audio callbacks with PHY enable/disable
Date: Wed, 16 Sep 2026 18:09:59 +0200
Message-ID: <20260916161000.11756-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915103433.13163-1-rmxpzlb@gmail.com>
References: <20260915103433.13163-1-rmxpzlb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Frank,

I tested v6 on an Orange Pi 5 Plus (RK3588): git am onto a
drm-misc-next based 7.3.0-rc2 tree with PROVE_LOCKING and
DEBUG_ATOMIC_SLEEP, HDMI output to a TV.

The reproducer I used on v5 (output off, then open and close the PCM)
now stops at the open: dw_hdmi_qp_audio_enable() returned -EOPNOTSUPP
three times out of three, nothing from ASoC or the bridge was logged,
and since the startup failed, the shutdown path never reached
clear_audio_infoframe().

So I also ran the sequence from your commit message: PCM opened with
the output on, output turned off by the compositor while the stream
runs, PCM closed after that. With function_graph on
dw_hdmi_qp_bridge_clear_audio_infoframe() and
dw_hdmi_qp_audio_enable(), the clear call after the disable takes and
drops phy.lock and returns 0 with no regmap access inside it; with the
output on, as a control, one regmap_update_bits_base() call shows up
inside it, under the lock.

There was no external abort, SError, lockdep report or might_sleep
splat in the whole run, including two output off/on cycles, and once
the output was back on a new stream played on the TV.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus (RK3588)

Not covered: I did not try to hit the window the lock is meant to
close (an atomic disable landing between the state check and a
register write), so that part rests on the code; and I did not check
Dmitry's condition from v2 [1] that a PHY off/on cycle clears the
audio registers.

v6 overlaps with Detlev's patch [2] (both return -EOPNOTSUPP from the
audio callbacks while the output is off), and [2] no longer applies on
top of v6. For the crash, v6 alone now covers both sequences from my
v5 note (open with the output already off, and the output going away
under an open PCM), so my remark there that both patches are needed
does not apply to v6.

An LLM assistant applied and built the patch, wrote the test scripts,
counted the traces and helped draft this mail; I ran the tests on the
board and did the listening myself.

[1] https://lore.kernel.org/all/urguajogb4zsz4jg3ef32hpyf2awxkywdtlk5ackdi2gjai4l7@vpjaf3sznkto/
[2] https://lore.kernel.org/all/20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com/

Igor
