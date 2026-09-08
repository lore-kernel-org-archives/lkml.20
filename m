Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995A59B686
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889485; cv=none; b=m4hYCcShtlyOn6bPmG5dJMSdIxqE8u03kUzwxQrc+oJ2CTscAIhUZXjRrSHA3TjrX6A6/H2Ra/VvKZl0Fl+vPkD4drR2pSNwpKalZ0Xm/D98X3IYUy1aXbkF/9c15mA1WhSYyN2J6iAbwCKD7n5nSOXXYWycv5RtbLMmUTJ85sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889485; c=relaxed/simple;
	bh=07ov/I/ldShm72hNuJQXaFMDAcMGOum0C8wl6iv0rIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwwr7UDQ37k0KFSFaHbJXW3EqUPM3np8u7+ImuLWRd1LVpgW616vl1shDkdTd1yPZGk2NU1cauZnlWCWKsyYsV+AaHp0yFeJrDkc48rWYDyxJ7X/9zgB66JXxUnhDwI/4uhxg9B4yS/AmEUqrtRNkTQqipLHvbnWAL8slVWDDLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkuZ/MIH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkuZ/MIH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so27597285e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889482; x=1789494282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=;
        b=kkuZ/MIHSK5yRaH2AR1RuW3PyD/IMk39SEKUnzMwGMxHAUJnt/IRHp77162XmjScMS
         6/W45zcdbLtF86HbUkyu1bJphc+BAbcVS0/FYMFcKjQavB+bgkT6gVwDp3Po0zbGxCGX
         EV2Px7S2mAA/ES4u2qhCzOOWJPir7JQAPKwy1i0uCspnllX0DgPdw9De1+ig/e2csye/
         AXuXj3fTrAGLSEcWFeVuTlogyxCp5CCxvFNtPAhlC9UAzSw1MrTsplZBh3hs12/dtWcq
         MwQZiV+HxBClnuwGSv51B8uApIdOS9tvPsO4bvX6HaPA8H7L4xqsdXDCK2D7oAdyytE1
         O+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889482; x=1789494282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzjiq1bNAWSar6CSSzfU0ZIGYB2L0BzVwz/Bd6duqAU=;
        b=qp+FLGr87ezn42mndvxEo6ekhzy59fRIq68WWhbGLtyddNyF6VKYYtAShOpj07J9Ra
         F8bkie1hKjaUbc5qlcK3cbA3l4txQQwYPxLT21v9gmYNLbBFmfIkJO/AiQcsutamaTie
         s3Icw/bakZ7HLYt6hey4tRp7THYswkQugr6fxy+lrCygVR3YlkYBGvlVnpb4R6bP4ogl
         hvKV22E8PtFzOR021211IwYPDvdgywnjS9IDWTM15oGeVnS90CbS3cOYFNALkHRvFZ3F
         AapFmrgm1QAPVSeu1uxxV2hBUUReSUuoj5/rsfOgzvOg+zu6mbjqzv1OVSDQVJe0wJRQ
         NbEw==
X-Forwarded-Encrypted: i=1; AKwUvBz0PBHl56Un58RRlcCdB03635iQ7v74qr3qTVy5x0Lr5LJjZIB11LN2dDp3GsaEhCREl6TwBqmBfi4Xn64=@vger.kernel.org
X-Gm-Message-State: AFuF++kuMr8W8cqxIzq2BAbzVv0HLqEe79Wioul4rxep2ix0egYJku1n
	za1+PfCmqoOPx45KFZIR1OKMIuKg/0hwO8ZkHLEjT3i8MK2hT5AbkQsN
X-Gm-Gg: AYBFou0y7S3q4x36GeydgoIb1iRwxmXqjGgXVqVbQsYtXBQNbYtbyaebZYsFztfnJ5P
	nZXb7Kra5v+DLCv6W6QUQfJ5nVrGzAyekUdYpj2ibMuyzmBMADytp7Ek2/5oqxkSmqCPm5EvCgI
	w+iH0sx1UEaMAOxjypqtzD74V4p4bw3cT4E8mS+8XKM5m9LM9OiXEApZGjyCWA5HxUTUpXzKUj5
	KxMzuTwL6MkN7XMqLL7skHVRZSE4NH7SBicxxN7v5QnAqJgLQC7P9BgXLJNc9vVQgVwPXiIGr0p
	2Ta2Y/d4mLVyS7BljvYVtngqnPxekxo5uQGaFWA8dX1AEFe7mhD38eAjVqkue5lbAoE1z2BR50l
	1jcw2z/TwDTdctM5BcKDvRkGlIq5dbY7ThcN3a4O1HtYRJnkYVkihKGTSJgvfM2YIHxf5zrRg9F
	7Q26Id53J8hJgwW9H025atLeYALKhAXrdxd4K/riHm5b4duJg8p8UAxBNL
X-Received: by 2002:a05:600c:4fc5:b0:49c:fe18:6dd5 with SMTP id 5b1f17b1804b1-49cfe186dfemr274872685e9.29.1788889481519;
        Tue, 08 Sep 2026 10:44:41 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:40 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 8/8] arm64: dts: mt8167: Add support for mmsys resets
Date: Tue,  8 Sep 2026 19:38:35 +0200
Message-ID: <20260908174259.9009-9-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for mmsys resets by declaring the reset-cells property.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index be215390730b..9eb24dc8715f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -132,6 +132,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		larb0: larb@14016000 {
-- 
2.43.0

