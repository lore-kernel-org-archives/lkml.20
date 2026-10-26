Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032833;
	b=GXF6O3rMTwhxqMVP2DgAIOs5yW+eKgDoDS6N4ODxyJIx+LqWsQCj7y0JsTT5148KkqB7
	 zNpmIbCpdnr0Ulwpy7OOufKWSgc9JLntWnbypDsamiG8CnBwk+tie1IH4EkvKsZIEKuh7
	 iBkLhOIlNdxjLrJC6Ju78OKxidNSLpeoeT2F/NCQUtJlZ+zMvCGsJ7yvTUhFhxQ32/fIa
	 ucIdMak+70/2zPBVccKpLPa6nEN9OLThP1hm6uNzkX/qveQQ6Gxfs+611LrsKKI/9An59
	 6h4dqKOYvZkrWO5qava1cRf+spY8Ak6i8PbEPYVKrTIIICBwKxSK2xazsV4kwyryDqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=klRyRRDnFZYZ2CDpmJK+E/gioA1RuNNa1jRJVKORvEE=;
	b=F+AT9aOsQIi0cZIUUFpWdgNPP79jNzuk8LIwIhmQqqQWoymDkwyGYtha6I+k4A15sFeO
	 JFf0j/TgnJLoqauNN4nh16tUs/YoHDxTVcdkKxWYx17Tb1u3yGaNf63HDbw0n5Zluysn8
	 a945pLEQWgoGmzTxIXakZxxyNDXSiTrmzj13KsJleKuFPnmuKBr1aYcLMI6yBFBu4/r8d
	 3A17vKtzzqjxmx4lfnicxBC+U+V4NCmoHQoNakgHcuexhWxePYcWd3popJj3mQvU2ArQO
	 6NY2ta4JwGjiiSnIYk62dOJNyjIOeRixaN1HHQpB78NaOhawSoeu5dQTowq9FVyiKtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=neat.no;
	spf=pass smtp.mailfrom=neat.no;
	dkim=pass header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=dz7SCdLb;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C546C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C546C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neat.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=neat.no header.i=@neat.no header.a=rsa-sha256 header.s=google header.b=dz7SCdLb
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1904300f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neat.no; s=google; t=1793032830; x=1793637630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klRyRRDnFZYZ2CDpmJK+E/gioA1RuNNa1jRJVKORvEE=;
        b=dz7SCdLbThCzmZC12nFqMLnO+viK5xvFhsXspqN0DcrbgyOtLnVbgCSW8kkHPAQlkn
         4iUYa4Pq5+R5Bdj1UyY2Is5OwYarh7PlBsRTUMe9TTiyb9PssfamefeyiJ80Loa8GMgE
         6oLu3+EeQpsY10X/BIEjoVt0lpcrC3KnHBZo/UHXiAVarfMyPRbVHlAXSUYdDBgJf2iJ
         8Aunp+OpixoeUaMo+D6cPcWZxCfiopwNSk9i+hblRbiC/sVtTIvtmlMdMdLXN/h7ojPu
         +SbKPbVITzSuAUlb7973QBhb4pmajrjNCGPFoZHoz1IwME3VoZdcXVOhqSCrweLLzwR6
         FKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032830; x=1793637630;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=klRyRRDnFZYZ2CDpmJK+E/gioA1RuNNa1jRJVKORvEE=;
        b=nH/JT40Z18hGsSehBYZ0yEu6AQSwI8IZbBH5oz6AVTQzMRPoC9z9+k8qc3z6CDzMvT
         yZGEipsx0iIsnDutXvqrJN3aY70l8p5SaD92VHiWmMonkJqfaKgE+JALm/U8hDGoexQO
         n63xXv1GnQLvyr9Y70cc+AsFcTcJ0EBkaA82Wa0FLKXXC9Evznl8c6K7QLuoJBn8GgLg
         RjrdU4qzqk+CKpDsSf3gDh+a5soFeySqOx3lzbpHfAU4a/eE0ihy8/McyhkbjTF7DhBz
         f5OETA2YgkhXJtrAAW/Rcb/YPCyoDlzcqUcwDAOjswu+WgNVmxAvvJht7Rsi/lhYyCkQ
         LCuA==
X-Forwarded-Encrypted: i=1; AKwUvBxdsZeZ/11OroAxpdt/j4hDgdki4TeRZYRxu3fw8FxUaU7aWB7KYIIJxnGb2rdPvyIXw8WeoEAo6U6cgMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe16JWtCOF6f+Hvmmg+SRxddPsCP5dzWtxyScX0JQSL8dZqS1G
	CqyHH7iHLejAPivWbx4DTNyb9cCk3AMqYyb2FWIqdzr3ij4prXDhvUgBpEss8sZGiyRwzHRrrqc
	3SyOS/B1O6ixiRKezKYy72/K4XsN70Tp6HNESHisholfFaperI/8EPJ8sSrnH5YqhBlhFW18z3h
	C947dKeucbfx1w7CV7SmiKu2/NNl8NBCtiPSJlfldcR2kT75PEWOBUbuh8PRxUt1DqBwE5EoAFc
	2b0vzJ047CZW6kZ8QU=
X-Gm-Gg: AYBFou0UUIcD8hAaTw49/Sk7PBTfkineBhyWYcHp2DDS9o6eCekqVJwvXaSdW0GnsfR
	ou/aNJcfmh+d71Du6t2cZxsqgmgvDTUXPHgoXIK2MV6+n8Vpr0fLYO7CX+Ft1MaIzOrW2nlzoy7
	NReLa6PJcBW8SYmGteAlpASKhhBaj5lFUWj9I/b1kNTlwV4Io7FglQckmi8qTKOeGkYBySQNVRc
	TFKQzqpq4txFexFPp5MVwEwh7X+iM6AA3X2upuFEPlmNuOfVqVgLzfA1M+n9wAgrskDQbtITFo5
	Hk1F1CNxTETgc8NYETucZpPGvz9eCAEqQnN8OkHTFYdYTHI4pNdy/VGqbiWSb7xfPxTZvOfqBvq
	XH3oDsFbjJl5C5R8X8zcAEa656iubl5YPEbrFkGsEpqA9MKKbdoWzNNgRyVDdEvjOtILoC8FDtJ
	6YxczeVbqe6nNSldfaU/OY+ldr8tt4c/CMsZ3VawkMNLsrBqSNM483W69lxiOie33DU0bIskFCd
	cml1rFGRuZ/B6ykGwlroUPLtGVaDCgXmggN4DiqhniETsxNIonzBbm4zMCtg//1
X-Received: by 2002:a05:600c:4e87:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a35acbea9amr145367215e9.28.1793032829991;
        Mon, 26 Oct 2026 09:40:29 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm205961655e9.2.2026.10.26.09.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:40:29 -0700 (PDT)
From: Lucas Tanure <lucas.tanure@neat.no>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dom Cobley <popcornmix@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] drm/vc4: hdmi: enable scrambling before the TMDS clock starts
Date: Mon, 26 Oct 2026 16:40:25 +0000
Message-ID: <20261026164028.78792-1-lucas.tanure@neat.no>
X-Mailer: git-send-email 2.56.0
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

HDMI 2.0 asks the source to set TMDS_Bit_Clock_Ratio in the sink while
the TMDS clock is stopped and to start the clock at least 1 ms later.
vc4 writes the bit, and enables the scrambler, at the end of the enable
sequence, long after the PHY has started, and clears it before the PHY
stops. A sink that samples the bit when the clock appears never locks
a 4K60 signal from a Raspberry Pi 5, while laptops that follow the
order work on the same sink.

Patch 3 is the fix. Patch 1 is needed on BCM2712, where phy_disable()
was an empty stub upstream, so the PHY kept running after disable; the
Raspberry Pi tree has carried this since 2024. Patch 2 fixes a
pre-existing race in the scrambling work cancel that the fix would
otherwise make easier to hit.

v1 was tested on a Raspberry Pi 5 running the Raspberry Pi 6.18 kernel
with the same change applied, against the sink that showed the
problem: plain enable at 4K60, 1080p60 to 4K60, 4K30 to 4K60, a sink
reset and a sink power cycle all lock with zero character errors. v2
and v3 carry the same code; the hardware test of the final form is
still pending and will be reported in this thread. Mainline was not
booted on the Pi 5. The BCM2711 path is unchanged except for the
enable order; I have no Pi 4 at hand.

Changes in v3:
- Patch 1: rewrote the commit message as requested.
- Added Cc: stable@vger.kernel.org to all three patches as requested.
- Collected the Reviewed-by tags on patches 2 and 3.
- No code change since v2.
- v2: https://lore.kernel.org/lkml/20261020151948.83459-1-lucas.tanure@neat.no/

Changes in v2:
- Add Dom Cobley's vc6_hdmi_phy_disable() from the Raspberry Pi tree so
  the PHY really stops on BCM2712 before the SCDC bits are cleared.
- Cancel the scrambling work unconditionally with
  cancel_delayed_work_sync(); the pending check skipped a running
  instance that then re-armed itself.
- Enable the controller scrambler at the same point as the sink bits,
  before the PHY starts, instead of leaving it at the end of the enable
  sequence with the sink descrambler already on.
- Drop the extra usleep_range(); drm_scdc_set_high_tmds_clock_ratio()
  already waits.
- v1: https://lore.kernel.org/lkml/20261020134941.631907-1-lucas.tanure@neat.no/

Dom Cobley (1):
  drm/vc4: hdmi: power down the BCM2712 PHY when the output is disabled

Lucas Tanure (2):
  drm/vc4: hdmi: always cancel the scrambling work synchronously
  drm/vc4: hdmi: enable scrambling before the TMDS clock starts

 drivers/gpu/drm/vc4/vc4_hdmi.c     | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c |  5 +++++
 2 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.56.0

