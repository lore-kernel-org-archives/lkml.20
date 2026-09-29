Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C2051DE00
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686137; cv=none; b=QWS/iOFM9E4xbiOapkpeFqtwTXiXiyvW3hoOD5F1NnndgPrgM7GKKS/ueQShPBlqx8mUXo5Ao5pI24uMg53N0p6qoGkBDhEKI/QQHBCivwDKWMsd3S42HE8wC6abAm5JYVQ3aSMiyA2GlVcVNRWAq0bQdcT42/XrsyVaEys4q3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686137; c=relaxed/simple;
	bh=3wEoFwaO0iFWgcSRe1rBVJm/B3HLnQlNmpfCo2dBkHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxdl8xOeoXdj1l1ig98ivBtGRJB/J0Zg6Cng4baBfXl1QSpyhRdOW8FRwK89zMCC9FXJGmk+K4a6wOVEQSlHkWq5xfvadm1bfa4OZ+n42r0BS/cJydWAzR6zWnw8NlEPboqkYmwOUNe5wYAB6PNZjq2KmF9t1ab6IWqH9lUqhXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9CHs4Xu; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9CHs4Xu"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so2473698f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686133; x=1791290933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wGmpRNkgFTWQDnXT7MrfhvAHxqpIIx/rDduJ3KFylU=;
        b=R9CHs4Xuryuj1LFejH3ldj7l2/tBZl9TZJIT5uWwtRSy/SoPpKeekG4zrmDd4hTNqC
         HZu+kd3lD0Mj99MSY2TlEWvMhvfcDhrl7r0gkWXidQdWQHl8V8Q+uPcuQEHMFDp0PdOi
         9Qzr61dHBBHxAbNHmVdNbEnY9xqV4/3QnzCNSRXNNFCjllZKkPIQaiiFoLdhhrsFYIDr
         EwB5yi5xpWC4G2Ur2A80AYNtJBWHt62Lc954U/m2bgCDoafs7wZoJo2ufD4OWEktkhpO
         Rfz0AiPLDFSB9T20IcIRbhmS5mixIXIkdoLU1ixtEi4ycYIXj3qgjOIn+Jja5dFFORQe
         m26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686133; x=1791290933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wGmpRNkgFTWQDnXT7MrfhvAHxqpIIx/rDduJ3KFylU=;
        b=ObCEnORXwSeLxdZI/TOpR1qDq4BZy3dUL0f7mMjXEfeQVmLRRk1H/9Le06MbqyX/0m
         QtXo5kWyPD1VlUFbgdo0IdDjZXIyBRKYRuSbZoxapiF/o68x39zTglpgRrcO2cxQzjFl
         FwZWMltUzo1pR3pcMbG/sQf02IgGH9lAdhi5t7gMzwBTWA87Ntg4xJoxWyeDOgJj4HKd
         Sa0S2HnUrMRfZV1+QONzdy20m1WUK91QfujYyNYr8eXPkEhOgpr/W/6F7vSIgUFipBWV
         jiGAmj9urA8tvZGNCimv01uFZgb53u3i8gEdMpny9yK3yhmW06rgHV+8mDdoMx1ldy7a
         xZYw==
X-Forwarded-Encrypted: i=1; AKwUvBxhiPZ7BW3Bq5uvaP8dSpTN2NKKWx8OI71XQahbePjJq93ho8wc+YevVflDX0hmIj9fXFUwa9Sddkn2D7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTS1+v6yllH8zTuB3/M0yL1P28AloMz/W4Z1IU8sVaCSpLcHq6
	o1GW1fG0kLwvtwaTNftsUtcDOphrbZcL0g39xzbJ+W8bQV4v4zU5B34a
X-Gm-Gg: AYBFou0Uv4wKmlDdQt6X93EeMv+xJM7MuQvnzOZqAwh7+BMKWtJUGGQ2+FyYalfVZwC
	WHEb6oaG1XGnbsWeLkUgN1bH9+GSsf3hWhl53PMEwXuo+Y540LW2BRyDG8i1Hvmy43bGAyxBBI2
	1UljqiBP5WelLESaDWPzscHiVBtEc/AqYkQ9U8+TwhX5lgBo+yRRDa475kArGJJBOxgFrLf8XIi
	AJqyCjkKZiTXhH1Xwvj9ISqSWOx5zENsP6XiMeY866E2YZiA4jysB4gXkJr7VwLr1Enm8qYtJ1p
	erDtcb5WIsVHioXkSLtXEcYXvhzpGu4MTKpqocClhb0L6RRFvmj2Ty3qAn+riKDooy6oUDkYStY
	+U4j+LQbhNc/SSUPpdh0cmxr8gdk2w7x4zTe7B7D1iY0of5d3gHKp8L4U4rBJUgvNj+yxDsDeWM
	Dnm4cDuC07iMHnu71lUyew6qqj/Tadn5hBfE5HIeK0xf3sYOew75GMUs5guEWXD0KGKSTHY5NcN
	uqekaavu5ZdjPvDQXq9TY0d4rQZeUzqDyuQQi+1ohtpE4C8MKwxtAov/WJm03Mpv3Ou2GIlIujN
	j+EjPAhDnTVc70FctQ==
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id ffacd0b85a97d-488716a5e3amr29250652f8f.27.1790686133236;
        Tue, 29 Sep 2026 05:48:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable ADC
Date: Tue, 29 Sep 2026 13:48:29 +0100
Message-ID: <20260929124829.237997-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the ADCs on the RZ/V2N EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index c43325dd1c55..5daad7f37e3d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -122,6 +122,18 @@ y1: y1-clock {
 	};
 };
 
+&adc0 {
+	status = "okay";
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&adc2 {
+	status = "okay";
+};
+
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
-- 
2.55.0

