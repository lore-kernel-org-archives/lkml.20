Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED813E5EDC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336332; cv=none; b=fTUqKK24Z4GktiXoNIu4aT7tBrFhRiu58UnsoRpwig+qZAXOALTvWICXitw1Adk/1kV9nsjXqKgxZET0llBJ/4T9fxVRGk1B9iuSkRmquxWdJ3zMRjpK8cDEbE8fBQRWcZPETno5Wn9PuU75WuPoSpUKzBkICh2RjQqQOg+yXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336332; c=relaxed/simple;
	bh=bz7mbGwH1ozJNrH6PB/OKP0VMbYFPj8Q83HI+01Zh1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZvLdX+CjGxnj9i5/lPzMtiWO7QlisUIB16Ze5zoZaeuPRtmRMCrm0ZtyN1d0dSwaUN1IHOPuPTiF9Onl+VrHg6RbUdGSBI5vCPlSnjLedvk5nHXapjeu4+YyE7/O9AkoX/4zA+txG3L1koQdHZkKzNmknl4sUYFmhl9sbTZ/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=VZFpN4yB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="VZFpN4yB"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so7550915e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336328; x=1788941128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/nvq3O1f4VDKj1llpRvfWECSeeDrPmbkSrlnnczKPM=;
        b=VZFpN4yB2iXupBjl87i5Mu6LSjrFbCppHIjDYPc4y+zjwnnp3z5HdevEz4xcsA967l
         ctNtKky08LSKHWrRs2jvmUGVL3Nnkb6jgdpo85gPtR6B3N7B2FDG2OJjrdk1sU2U2bLN
         0QCJqqUozty8BIeLUZzAiJXLEshmQmXw3NQvJDHtOZcankKekHvIV8SGrWCjPoX6Se7R
         0l4CljeADHE8IAQ3YQXgKhwnSSWWwzNm3dksj8KNf24KrrP7Jbyx2kNXJIJ/g+O+xnhJ
         aBMVDjcRO5Rwnfcf+/SBgrvHNqvInGqMzWfCYxWvrJmF9co6vuJolDQyKEG39m4Bimmc
         HnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336328; x=1788941128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/nvq3O1f4VDKj1llpRvfWECSeeDrPmbkSrlnnczKPM=;
        b=faBUCDS3SFQjt4nzqkaKXzxM5wrwE/yfvhqSb0tcEDeUhBy0j4k/ZbeXj4LE1BhqM4
         CRPpY+OgCpxpKEX++nOyZrBtn9BT0r32KhQUriKjW3XfyNADDng9hZfxr3KKB0lyNsgd
         3uPQZSCckk2utzsZaLB2jLwwLg6YLWcA/IVPeCy7ogZwE4pCh25SRujNQo6AL72Oob00
         bN5pP/QvVy5JknTCgkkt9PI11e0wVaPgclsiXK+f/7Weg480oobbdA/ZtyLT1tROgAld
         yDTW4ovXKyY3JouIrnbXA5SY1ESLKlsY5ZYlzqW0qbOculIv2rzOAepVPRez/I2vukcd
         ueTg==
X-Forwarded-Encrypted: i=1; AHgh+RqCCFRfCAqbtQg4kODKZhaeJ6UCeKGFqSfTkq10MhOFE/++gkJz6XHOAWnVb818nf8ESzIraed/QvaKF7A=@vger.kernel.org
X-Gm-Message-State: AFuF++ntcs+tvnbGsyA7C+vaK+2AuY3CZWPwk04P1Gg4GRSgnW4/DYG6
	0KAcPI5oSxHFjhdhu+S/kbTFqud5TNBrA5mMtckpu3svmVlBLn34VQopiISKpPa6QX4=
X-Gm-Gg: AR+sD12MwYNo5a+55inNh9AK3LAvCVSih5Y3iNhnGal+8Sc7kN6d1yuXbDz47QaI4iM
	EoslVu052A+0AQj1n5jPywt5aGu3dOeWA52II4l76+7rNpsnP674krxskEwjjljR47B40E5ASzT
	L7KinV3P60mdC61OsCBWOTvXm4+CNhqqrxqWoCh/34x1fnrYsYvtW/b9FyW57hzArJtrp8l0ERa
	CxHvo1xEVZ+taGDCKO4bGrCwywDSliYd6h8yT1MV7d3FWZtFPOJOnfss0ye+cYyRrKL/OWhCpww
	UTB0kPp7IlQUTSxXhimR97FOoA0Lo06e6bmWdpS+KtnF6wcqZbCvDhLb9J/xKbZ5dKWHNXb9ePh
	r5Czq4p2gSjXK3e2PXZYylgKg27tW9rQ8FEOJsKs9px9aZh5e01omAWlgzseWuxvUkwCtk7NmkY
	lb1pyhnu28tr2LWvpsw/7Vl35IeXv8CbF8tu3iOns=
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49ce5842935mr59733985e9.9.1788336327864;
        Wed, 02 Sep 2026 01:05:27 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4761dd1sm31219815e9.0.2026.09.02.01.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:27 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: phy: air_en8811h: refuse a firmware blob that is not a multiple of 4
Date: Wed,  2 Sep 2026 08:05:25 +0000
Message-ID: <20260902080525.2211446-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The download loop streams the blob into the MCU as 32-bit words and
reads the last word past the end of a blob whose size is not a multiple
of four. The shipped blobs happen to be aligned, so the overread never
showed; a truncated or foreign file would carry up to three bytes of
whatever follows it into the MCU. Reject it before the first write
instead.

Fixes: 71e79430117d ("net: phy: air_en8811h: Add the Airoha EN8811H PHY driver")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/air_en8811h.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 0eeb7b9a4e26..34d2727e8222 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -312,6 +312,12 @@ static int air_write_buf(struct phy_device *phydev, u32 address,
 	int saved_page;
 	int ret = 0;
 
+	if (fw->size % 4) {
+		phydev_err(phydev, "firmware size %zu is not a multiple of 4\n",
+			   fw->size);
+		return -EINVAL;
+	}
+
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-- 
2.53.0

