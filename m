Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446B44F55BC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686136; cv=none; b=je3CyrC3wOVsgFW9xpdSmntCUa7tnZTELFjSmr9RAU/HIhuYK6DLwVNxZw453p8/aPQgQ4VfhLh5XfSl/Nly94yKn7cFFEjdW9yS0kFymOw72U+c70mdLg7JWF1oQRpilDuvXMJGajYhWBniMTZKofUqu/d9h22j85G+5uLF/Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686136; c=relaxed/simple;
	bh=lSvtUglAx1rTAxF63r2sQiaH4fhCBzuyiTNiuauSmaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYoeX/nbM806F/c48PQgA4GMOgIR3sHs1TO6LsyMIJaJqnCcmdYe1x5YjvE56p0zz3E5Xt6boyUaNCASu1qxZhiiYDUfhlSq6qqXV4ps3APhQN7tn02lGzEnITQ6KPPxnV/mvyX8XiRskB/6iCsu4VlgfjNhBT5fOndAFqmUXDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFZHQPpZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFZHQPpZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso3334019f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686132; x=1791290932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epA+CdgHUmlYYpLGEczrqq9cajap1pyqUy7Xk8YH2fo=;
        b=ZFZHQPpZUvy9TEu20hbFjtKkm/TrurU4SmIUOVJStUxCpr3vmyiuT1nN/EmxyAxKv1
         sFAG6pLa8PCJHWlpUTojcjR07vn1lqKjmJhXcyAgJWsHLqmD9b4tQlX0Vv3ix6tjMii+
         +KPogZ7ASDKiQg6hEjVxKCq6JcY0T7V7MIJh7rtpjMtSDcpmPKEQuU6LqGvuk51fXgKN
         CQq1+JklMehnSpraYkmUyJOjOtR9BIs/nJjXAV9dpOKrkI7Be4ftHaZqF3KZkbp+R4Ri
         eg+re1OnWUckdSXz2/8U8Pvqt4W+ySGhbTJ0374Vpqk1xR3xWaV4i6Ou/mYJN+iwaubK
         Pv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686132; x=1791290932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epA+CdgHUmlYYpLGEczrqq9cajap1pyqUy7Xk8YH2fo=;
        b=tbsIu1e/525mOGya4c+1Wa51ExcN0VC1jk8AbGg0VUUGgR8bfyrCzwoCmYyNkqqK61
         SSUoiOQoTz3JDvkYMNRb+iW9QCFJHA379DViVxsk5hNnvbrNldC6AkBxFI5WedxFqDde
         uK78+CglJ6PxuTPLAk+iOWOleH+GLLfwqIvoNYuTezFwDxDByWDUan6cCI9m+yXXkOZw
         cL2akvM7pxmb31lfgTBc8Xy3mUqFMiAM7rzPfKQUvlG6bQUPkndGB65ks4sIxfwmooM5
         AJeRTqLQdwf8Cwfz2kUVV48rkC5+wC6+mnjyYFmU8nBCUCh2bJ85Ebuq0Z85ntQUZBdq
         kMVw==
X-Forwarded-Encrypted: i=1; AKwUvBzsoVBiovA3JhphWinbLW6idSon6DUEQ62kBWWwPPhmgOdA5PqwxtJe6e3ZpLhnY2B/O0JTkeLXQIY3zlA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoPppDPx+1PSYaXzcWgtvoqFjYiqsQ8MFaOkZ3kK0/rLgNBRcD
	LySn8ra7D0s6uH4Y4CWt9lvsF9b4nvVRlj8mwyqbUjJJmKZe4DLs3hvn
X-Gm-Gg: AYBFou39WDQ5jrGfdaIOu+bX545UEN+dYIFRdcsEO55NIUrohKgG17P4y6pRxkdew0D
	9pxlCzFEHheSyf/8btW2fobmRjRxo+fE7NUtnJ8sZ/5SD2yCn+aV3597uI7GU8EDQdvnlD2gcKF
	0W/dzX6nT/P42sLC5C7RZuAuaC+Kw4BvQ79k8MGKD3yie6WnIyel8Lsc7tz6WH1bWzTxkTnKveB
	o8/76Nwk1XSExYx+ILXKeDFrS/4URPY0Xijmq3fSjP0ocd5NRZnmvLT3vyfvJOifPRNxokoouBW
	AuUmrzYk6GtwYfKkBmLd8KSjWCPhdOR4SMsIpoViwiq3H4B2yqoQvFWjOyI4P7T58T3L6x0K6jt
	WXkYjBXBv37CQoZpWJyLeN3I2yA/dPbQ66m1Y1AxZBt2kPzNxMERIykOzTpjQEVMwawVm40G98o
	6BwmT4k9li24AMFty8QffNOLk/6baD7vP7ffvVULUYcKbDUNIy0+56zIxG2MCWiS16rqCwhMI6Z
	1eenzIr66UvZYTtW+/m8kzVQvevMasFiJNHMKRg17mwHUeW4nwyqFd5om17jTeUnOFKIIPZgkjb
	vCCi2JCCSkAjxfFZyQ==
X-Received: by 2002:a5d:588f:0:b0:488:ba61:e3be with SMTP id ffacd0b85a97d-488ba61e623mr13300292f8f.46.1790686132400;
        Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:51 -0700 (PDT)
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
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable ADC
Date: Tue, 29 Sep 2026 13:48:28 +0100
Message-ID: <20260929124829.237997-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable the ADC on the RZ/V2H EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0926ab891fa5..8939e35639a5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -130,6 +130,10 @@ y1: y1-clock {
 	};
 };
 
+&adc {
+	status = "okay";
+};
+
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
-- 
2.55.0

