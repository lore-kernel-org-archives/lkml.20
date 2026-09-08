Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98857598BFF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889470; cv=none; b=iXX9QgCRi85QSbbwoOJa0ktwcVvlQapz6gcvajJX1mQrD3NFAHOwtDUhDt5EIKMYnbVKAp//dt6VkpXWdftb9+JwypiasSjyKm2VdY94bXfjK35wtI1qGw124x6DLFmJCTOw1ddCBe1eB+8NkXzPS1stbzHKhpxRxb4FcwvjCDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889470; c=relaxed/simple;
	bh=lpSyEnjJKtBgxDyeC2nu9mnqwL1Wz57d/D2C6M7WDPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBedCOlBvrDCb8/fDSOzdfEL+VKtZjcAqS9VlwDQwrGWj4PbYz1FxtSaq4oEQhnkJz/0Nx2NviX3iAEvvFiqfEkMCyA75Mv/XHoxj3Tbjm2P5Z0oPY+nFW//AhrcWPWzQMyp83L/4gBkLioSczBWH0m9I6e/HzVONRIj7RrRcmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ag1uyLGF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag1uyLGF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4957eefd361so38800955e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889467; x=1789494267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=;
        b=Ag1uyLGFHp1tZcc1JuP31PbOLxXPPRrBhQxK4O6darDZamAK1x5k5n4jpLA3wE4bMT
         S+8gYsK8MbtyVIC9zSc7S317iFwJ0pcnPdEjL/5dJ5m38ygxz4DEhwCdoxEsNTw8HjAn
         bzD9Ub06+u6se7mJWr3DcFfGbHhe+wrB3dvftiZ2FVDE2GfZorxKw4TjCj08qKDewXTO
         INz1FLzylZEW51LBhaiYvOUKAsFbRKxO4rbH5gKqB06I3JaBi/8vgA2GSf821FT+sD2J
         vejxrQY8Cq1YwVMaxHMjW++pU+Yp1UWF3lDuYMfpihW6lCMCbM7LWOcE6qKWWXJ1FFsx
         OjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889467; x=1789494267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P7X+5DAft/iGazDSb7XtX+r5mhhxFu84ghIc52Wrj0I=;
        b=R+3IRjiqTjhrPNtb5kdwfatXnZ4SjcrWx80RlR1Dex9bxrD+IElw+JTRdf/VF3+mcc
         0JFUO4y9a/Ah1P/4OInc/kYp+t1A/K46qKDR21WLO9bRqGVJ9p4k9518oy2GZx+p6RN1
         f86XV/Jre+4nfZuhNfBnIzyCQw1UtxzVzkHvIzbAuy8uFJNa30l9kBlW+ClCcgmaM78g
         0Za99cBHh1S1avHupH3Pu62ikLjOk6hwS75gdbdsHnIVQaOLlv5TUnQeuoTOoFgir9NY
         bDtZEdKrjngdDxmWNm/vmjhwfkurmdyfL/g1+7bFIuKpK+P8GChvssOFx261vmiJr27W
         eAMQ==
X-Forwarded-Encrypted: i=1; AKwUvByjL408NpTRHKlYT4550mCuqXVd7fRq4nzFytcpFGQ9HMygKM4NzeXkqmPEv66laJRghoh8u91teal372Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lW+jgkTSF2q0A82+5qUXqkUzOWLMi2dBEY7TLMZ0mwflUJU1GS
	KZ4A8gt/kJ5HGJ9XEbpw363VlyK31RT3ckvTiMXMYt9rrWR/WXWclkuznDOYvyKd
X-Gm-Gg: AYBFou1edV32z1BiEdqzsvfQPYIZaPjSk8OBOwS5QScntVSq+Esl06WfjX5kuCaZZr3
	P/nX7wDc4TfscukL9/tGT/94fJBTB5XQh/tkOHAHmCGjSoNtz6Rl6uqxWifAAJm04uGq5T/UFKw
	/fwquYMob2hJ7OArb6dT5p48SeGdzWDsnCa0x557z1AlcK/4FhV57eO8VJg2kfNJorkHLnjsuZv
	RodfUOW/HPa4YvZ598Ma2TFywMQyW4ye/LY65CyKF4y5Lp0fcyCftgF8FLkQJ/pTRl28UgclA1+
	N5L8/xBbwhuCsZqC3Z+1VzXHLuq5nnsDSAzYbwWrbWlpSzQzr6aI0TsS9AkT8ZrY1vKZtSdeIa3
	Nj/hnxgJTF0RKpiqdd7JpxDcDuznImL3sQrajxjjLzbbrgzXcPhZHZMRtF3PcSU4A2CiLnOA6lG
	nIv7RB7mX9IMidmS1I+MIq1a9ZJuc7IyYkr7PhuZjrPDmHtIPprvdFE0eK
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr290969905e9.2.1788889466528;
        Tue, 08 Sep 2026 10:44:26 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:26 -0700 (PDT)
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
Subject: [PATCH v5 2/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
Date: Tue,  8 Sep 2026 19:38:29 +0200
Message-ID: <20260908174259.9009-3-l.scorcia@gmail.com>
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

Enable the toprgu reset controller feature for the mt6589 SoC. This
allows generating reset signals for the 12 subsystems managed by its
top reset generation unit.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..2645054a4a61 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -147,6 +147,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.43.0

