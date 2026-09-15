Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247D0318ED2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435230; cv=none; b=PZdTcbqVHMRa8ALsh8G9oWAavbop2yJlQxYM3yDr0RD2+eEsJnTO6ENUDM5zKdu6Lu6gm9z4OpSIekWEhgq6PHGE3v/73g8sC3R/HGKS6JhSKpF380hqjlmJv/Ys5n3oT67ssxxmY+H9QvwBWXIn7zOKZJQjTaI2zFDiSVppWLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435230; c=relaxed/simple;
	bh=CKKoXinNIPjaJ7mWM3TvEUEq1iXPeisQkm64XntF2Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1sEz7f+ky1Nb9aArf0R+T47OsLt6D5DrDClY638gCb07NmvXBcmfELDKlLVAzqM2BCFAAPD6arAzhZaWZDLT68N0jPaekemeCmXFTQxYguByQ0Djb+Mwu9kVwRRz6cm2XUIALTv0GtMPu+tkx5Tna8vPlZlpjXtNfJt4zijIEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKDH2hy8; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKDH2hy8"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148aso30609466d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435227; x=1790040027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCRBWGGFnF1Ry6hzDyS1vYmZsFfXfi71bfZ207Oj8vA=;
        b=bKDH2hy88roSbWAbthQ36jUz4Y0jCVs7cNPSiqCFShYtQL8PzkxO57EEh8OwbrsGKE
         PI7upf2d0tAOHKSJ+BdD9TyT+3WcRz0WbvMwU//wMxAio4P8Xu8BHgcygCDIleLUb7qZ
         1knmaDQgS6L7eyyrVVtREKUkjE86DxvfVSkaoWXj7qU3lOICKNWCdzPxgcMqbaDXjdY2
         Cr99vKTnZzDoBgsK6bKramFb0uWCejvg2jzgmcu7GFtJHfMyeBc7xDbF7nZcDyF/s8UX
         N2UEly39mJdi2C51kkSW3ra9lb3QzvYV5BLjXKt/2hcNhEuayC/GA5MyhyiRtrFTEaUZ
         J4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435227; x=1790040027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCRBWGGFnF1Ry6hzDyS1vYmZsFfXfi71bfZ207Oj8vA=;
        b=s9tu5SC9luPXrG3tXk29hFHyVtwOffzaCxEN6MaCSyS3ReKKoaFRc1F+MJp8ZetsQQ
         DSgfe4q6lRch0I3Txu129Q+SSayJymJdP9+GmorGllz1PHz9BHqOJjf1ZnF7HrKSWwET
         Kd+/uZ264ElXgA14qxno9hPXOP0V00RDfJTvl+uov51IsUaiWzbsR9F1KEP5uqAO+Mw+
         zOJ+MtHk8CRoWDGBSNR80kJcSjgK18V3cyQ+n14EWwMZi5aDS4Ut2rxln3YggfRQ8mPS
         4bee2cmXVDS77MdkDu1yHrLu+vj0DuY/BhO1JTUmJ9wOv1St5xuZbNXnkf8U9zeQxekV
         m/Eg==
X-Forwarded-Encrypted: i=1; AKwUvBycQt+fypkIbbDMMhntwvRq1dxsAS3uuZ9tN9vBG/Q8RFIWKiXyjc7zf6U4fFDZo8tHQEgpIIAztl+/mXw=@vger.kernel.org
X-Gm-Message-State: AFuF++k1LMEBd8ybA5cTCK+pcK0c5IhDffDFP7qTZK9Wca2ftdSU4Rrh
	2D6ZOgSu+AHPVyHJg+vNqszV5LD87VlrOR23LYt1e8tjJJDuMy/pgo0=
X-Gm-Gg: AYBFou3L9n5Pv2DKEOkQKyb/OnEhBFS4kY9JC2VaoR2woDNWmqo4XPAH/prS44YiJcP
	Z0CU4Xmnfhbal7S1rqOaACVB125A82H6buoV6GxztxMUFiBXayZOy80q3kwnPBG8p1MIwHlIdha
	jFnfMauJUPiiOiS9c4lBvYL5qqX4MxgdMhxSpSIlbrX9oZ7sQDcebkEtzoxsDwEakOeBkQcDYKp
	78y3DyyfN0ispoxLQlZYMy2dyj46lxjTh75DIAJKNXBuZyUi4sPqILoJBZq9I+Q1tHUUGxXCILE
	zOCbT9lrtvnMhXK7LDeMgmL7lV2LQiEOnHTrki23WnnhtxlY3DgSvurfb/t6bM1WYrcYx3oNKHY
	Kn69akKxzON2MGbL3YgqEpu8OatoFKqNClNnu52P2Z41Al832QtaLFZUrQLSAvIDmjLm+L2LNlE
	51pBOTYfVNM/UNoKVJb7FHXxA+qn9S6zAfNVDOu5vCQqe60PBwEwm8o0seYMZfMArDyPUgJ5iUw
	lI2cMSzfOGZZ/3Mng01bCIzkLFEUOJvHGyIGA3giGiNRt1SXfYR9sTdcuuudRUe6JTOfEpbfVoY
	tARgQU5bwqPxyX4zmH3SRoPXl+I6/PEIcFVuVrXGkM34dasQduV5ADx9KeyXo9Gflsrn+K7SNaC
	DlzSzFg==
X-Received: by 2002:a05:6214:590c:b0:8f0:3b98:d6af with SMTP id 6a1803df08f44-9122e660530mr96067806d6.26.1789435222335;
        Mon, 14 Sep 2026 18:20:22 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/4] usb: ohci-da8xx: disable controller wakeup on cleanup
Date: Mon, 14 Sep 2026 21:20:08 -0400
Message-ID: <20260915012011.61874-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OHCI core marks controllers with RemoteWakeupConnected as
wakeup-capable. Probe enables wakeup, but neither removal nor a later
notifier registration failure disables it, leaving the wakeup source
attached.

Disable controller wakeup after removing the HCD on both paths.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-da8xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -447,6 +447,7 @@
 
 err_remove_hcd:
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 err:
 	usb_put_hcd(hcd);
 	return error;
@@ -457,5 +458,6 @@
 	struct usb_hcd	*hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	usb_put_hcd(hcd);
 }
