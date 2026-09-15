Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E012EB0F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435237; cv=none; b=Nx7RxxkjZjz/wbIoIhg+PkORhBBAOFJ1oGjy15RHApy+UO2KEArW94UccA3VnmptM92H0aHVTKhkIo3trOibIOvs8gFrCLD6utHsu/qTD3pOPBxsC+ChT2glTBF6DyI//4Smu0ZbwWH9ILOpXEYxxLFYEMpc4CXBShlEzsOcqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435237; c=relaxed/simple;
	bh=CLoTbPNnFD7Nf/FWMZIj87k9uF5C+XkJTmib7IEKVno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbJFafZGP8J4LLMRZ5vHQd4ATeLmkdoEOsHOlLxLbV3wOGa55sAgqAPMjFg6HJtHasBPjy0f6sSYHUd1Ja1Hypk/mTs1ERqef9uSHv2vev/aJRjBPk983dTNMSwxO08MT/Jt5syzncQ2LCECW2Aa1LS3Zn09+xHKgolN+d8Sv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlKJnuek; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlKJnuek"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e28a62abso43000971cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435230; x=1790040030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFEVv4dcy08X3Ik3HgrSf1qU8ho0jjZ5Mt4Ngu5dZIw=;
        b=LlKJnuekpTYOvLF203ixtRfg2YfTgXIfAJ6c8MOe/6akF3oOyTPXLxOpd5LPDdUTzD
         kbed14k/V33uMFqHASt5oScMev/oITKYdfuHSWSf04LhAOmUEQpdqIEtyW2gtvpYN2f6
         0LLakiEQ6lWm4wQ27wV5KLYEZ11Z40lw4wuedXBpL3x29ilDR1Rz2DGbwqBnvR992XsY
         ETEg8e80fKMs8qZAd443y06Km0AHqyiGbjofe1hPcBMaD3FMbG0wYXRSiznBMT4nH/Xc
         f7ZnEN9MtNHwIK5ZqNmcdTRKFW1u+gQhBdG7sUMYPgqEQ1MU5lME+Hx3LhtZ2VIvhkyw
         SudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435230; x=1790040030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFEVv4dcy08X3Ik3HgrSf1qU8ho0jjZ5Mt4Ngu5dZIw=;
        b=DMdxa0c1NNGaO/TXFXRw0mXV1ZgpVxKeoQwD8dLDgb8yvt0HVJMiyHNHwfO0MQF2JO
         BtPMgiO2YojAtRiaF+IF6dNDv3u2WJFtTt5Gn6LKe7q9/iRzlvchK59K5ePv3cAXHo84
         a7ru9DEhYt8YkMiH5F1rDvhxJFfGcjNyB4pOuNat0miYuWbRpUdis1DTT0jSQUHumjVv
         P5Kf8ulMFUprMOmOdin2f9sZValnFXqb4g0NbYhfdEcqJx2aDq1xVQLLGZznqplSFeAP
         ucIOIulwjD4sn/e3QDK8GGuHvKgeAf+U6rY5uQpmWX1a5gS/RNAxjW2IupyuEp+7vEkA
         CXqw==
X-Forwarded-Encrypted: i=1; AKwUvBx7mvY2k20FbeCRVASxuA6hm+68BQE6PcvbStqmE3xxJTXZ0P97q++zpN4vflG6H7QOxVNJKqyUqSTuH7A=@vger.kernel.org
X-Gm-Message-State: AFuF++khihfU3jmSVSbUsjja2OXzSBtzK4v3y4+TIfovf6WNJ5YXxb90
	d4xRqojDQlk9Ln3KXKykv3enLxflpF/g/NR/N5w+GkwaRxrn0pgXnbQ=
X-Gm-Gg: AYBFou0YUgfBOZA3Q+iNM/LTgGoVcfbzx6KxA9qK2wZolYK82GyBaV9kwrJ4Rsgq2Ns
	OiMTDp07c8mDzENQo72Xxw5GXphmKeFMWmk8s+dgfJHjSwLCSm7VeXK8G6efRyTxX7lteixKiUU
	Oh1nBC0ymprDFX9efobAF5tcV2CjVzsAfUcmjpSegqNi1HfJRqzk7H4HB3Vl7nrGZwR/cDarkgs
	ZSJgnYTFbvckRj/+MsIUd8Ghtu7avRfkEs0VNr+pVArPegvb2IF+HjXFjxIeuwMd5mmwbsnwiwl
	KOh7tVYzAMWaz0MP0qLNgNEeiOlgQn1Ued6b3zJTf1vrbjhHz5lMDc0d/dznD4G3GjzI8wC6Yfu
	oE7s0zRHL3M2cHgmFJwkGplPNDwAzdHBc4UZl9hLjxsr4E3lM8BLIjX0MrvBQSrsZm7jvOP4a7G
	/Ts7Q15Fll+HfXdaiI9QtBCSRNPLEueAkF5+yPfa6oYwRRJWVsXH2f+lQOYnd+TPR/Oa+osMJtW
	NMNbfFIDcYQho4irOUHXuHR3mtOPoyKSH9wx8E2+pFLqDj+LX0Edur5uk9a9UjtOkWHjpdfGYcR
	dkvqyiqKOK4CBu27AxowrUKOxG3TwysU6ue/u892vHVuVx+hDarGUrJCJqv9StynScBn9Q==
X-Received: by 2002:a05:622a:1bab:b0:531:164:fa73 with SMTP id d75a77b69052e-5310d0005camr81499831cf.32.1789435230101;
        Mon, 14 Sep 2026 18:20:30 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:24 -0700 (PDT)
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
Subject: [PATCH 3/4] usb: ohci-spear: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:10 -0400
Message-ID: <20260915012011.61874-4-mhun512@gmail.com>
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

Probe enables controller wakeup after the OHCI core marks controllers with
RemoteWakeupConnected as wakeup-capable. Removal does not undo this, so the
wakeup source can remain attached after driver unbind.

Disable controller wakeup after removing the HCD.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: a6eeeb9f45b5 ("USB: Update USB default wakeup settings")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-spear.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
--- a/drivers/usb/host/ohci-spear.c
+++ b/drivers/usb/host/ohci-spear.c
@@ -103,6 +103,7 @@
 	struct spear_ohci *sohci_p = to_spear_ohci(hcd);
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 	clk_disable_unprepare(sohci_p->clk);
 
 	usb_put_hcd(hcd);
