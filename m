Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B39471CF5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249023; cv=none; b=hcKNNrioqoGoq9A2oMdkbCW/byb174NTqkKlu/rVqI8dutyIqK9V25FAOz4ZGuxZRvKC8Y0yVJFoouLNG92WnAf12AXC4/vz/SKVSCBM/pcy2s2SdJFDA+/fv6PTnyAjmtZdImAxOr2+MHY9cH+K4swBHDq2HmzKiymnNM4tRBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249023; c=relaxed/simple;
	bh=/rbvHcyLFzkOkhdGFkadotpTkB6WTk/HoLFqLifD8i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTV70wwFuX3f9ylb1/w2IAs6iP8IlirRH1dHKdL4enfXRu1uG3oC1ut+GCnc7GwyvEKLNVFUT+76OXagyBjDSqI4rOcoNQSnHMEzztoUe/HvC01nReHyRGW3RUW+Is5f+Kw4QJvOUz8l/lWmHWshLf4S4n8SXivbUyh2wgP+9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M7oa4Oh5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M7oa4Oh5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d715f4a587so8231175ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249021; x=1788853821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=;
        b=M7oa4Oh5JLb12LGDew9uMpM0cJ3sj6tPtJks2pmho0j2NlD/gc4quOMjE9GngiEICU
         3wnNYCJWJuS41IGV8YksgZDr+hdc7WmVHt2P3xsd4jlCneumQey5pSJBGioxfMkic1yB
         wr3mxw+YYCPWyqzErw7dSeR4zXwkjNgGLl0UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249021; x=1788853821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ehsC4fkcGYgZxU5YfTTtJEKH9Dtw/4IjhfNmBesfrM=;
        b=C9Q6gxSKpfl2bSxy7184NvR3t/LxBS0hGHc71dpQzGUi+ltAgPfikr24VHyzAsBZcv
         CDe07ZKWetPhX0dzyPOhoD2xC8guYHhBKbqvXSKFZHTg/gnY2544Kpkj933V8EfHtoD6
         rjtHWtzyMHgXym0fBO4Q3DR/WWHT29ykxWdcfAVytpR7eK8krf8l6x1TnLaG1HmbQljd
         lRwkrmmQd5nGG3q+WUa5ibU8fgz/DMeCaoWEANC57Ifr8fKEIrEqKdSJUy/TkB8t2oPd
         Ra2Levvzg6ZFKTfTYSN5cxrWMVV+q2cHXP28x27y9FSEbnStbjj+sDGoXi+4PNoPm7bq
         rEMw==
X-Forwarded-Encrypted: i=1; AHgh+RqI38yzDIQCT62qSPuppmk/uuOwUSiNr2Rayc+Lk0UANaVAkHBrlc5cM9cRIdPRSWoXAsLMBXEUIhpq6f0=@vger.kernel.org
X-Gm-Message-State: AFuF++nX4S3geufPiLtRMrOtKvqgCTUSpbhzKag7Xz5Z0XIWJLFxZMgS
	KUZInyVf6jnLYBv2gdoKOV4fZ+ACSv8dx7crdNlSq/Y6m68rkxjodP4fqp2K9pVVCA==
X-Gm-Gg: AYBFou1A5V6X9k9U/qLtMTSsxNJe3TnrABKadhspMOEQx4jh5dEbtMJu4WwNhJ7LmmI
	ckGaRyIQZ4g17cj3UoDnp+l5wheU3PPTFBzN0GPCpK5RFI/iFDfX4bcq8XGOAy1R4qhtayNXjZM
	7mnq8/ZE83WhPinwcT+EZD3pRc7rDOEi9z/t2m5gpEpxTVFwRwMfPQFIVEDP3DGrzGcW6kFfhIU
	LVw1hYmTctyf/FNqE8wDburGHlvVx9nbxE6m6DdDaeiqnFEvCcoUdsHw9ssfq4iYC0QzdtV8ZuQ
	cOIudhGPu0xsasSSKzDf0Fxr5n9pLxStyMq3xVsbkya/sYAvBIUdLl1/yVG+pkVelSGXBvTUP/G
	UwKoKspEpcn652WHnki93L6AIa9JD3d21CDVOz8RZjmE2ms+j1GbKYplvJ4owzgq6Px/Ven5qDj
	hTyKxJt56nG7G900FH2xXynkHTOD9hObGUklc4+pOs335I5pebqugclhhC3LjyM+4MZXk38D7f/
	NJQhadtophwntsdn/kdI9Gup7iwnqfFRAnd6k6fiOjfU3w=
X-Received: by 2002:a17:902:f791:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2d91dee456dmr196089085ad.15.1788249019467;
        Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v6 8/8] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue,  1 Sep 2026 15:49:26 +0800
Message-ID: <20260901074930.764550-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.55.0.897.gb25b4bd76c-goog

