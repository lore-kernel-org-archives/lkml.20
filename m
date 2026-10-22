Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697029;
	b=o7KEgiRPbcUxLScC/MhKCjXLSIxqqHRwFTGleOMYo8j4+dT4tplP74yPX4HV+jaV21Fx
	 7lq23pE3DhHFpwwW5EVACXGDSmy80DzYwUQJayCfEY0LTuvHmDHL/5w9QF+NuVYR7j1i7
	 oKZ6QVKAUiRazq73qNdFkZv0Drj24CBHCDnelarN4Zd2r264KoRCUnh5Cgw/q50buj16V
	 eAu5v7MfE6wFcJKDz29RgD3fIukG0iqvEsYtbTmpyJhaCBAzWfBOq9c88m9fHaclqceE4
	 sB42rgmNNzB9jPtIhl1HaCJRKAJkK/DwaJlcdQTV6B1RwUuxU3LBC7FJ8BPZSHoG8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mWyRbyYobbwew4V6IGeQkBhZcI3WNmI+oWsGUUslDMk=;
	b=U7deUr1PYXgMKfcMyTflp2D4IxkZ2AJ6PxlYSZ3z+HvFlbA0V0qC2KLUTTgiLmn2P/MW
	 XDniI2H7NitllYec8NLEWddqr9WmT6QcUKlCQMbFvBwXr1vscT22bhPqwQ4XUi0LY+5Pq
	 wkZhADxl3XG5cylqrq5d/SRwnV5dTzo6s/LVzhWq8hDuJjCAdP1uzr/1pnmorOQm3Bv0M
	 3EFcSWPJZ87mV4MnYwRpJk9cm1ex/uJnSUbdXeB2QHwNuC1gGFpXsZek6cnPul+wrMJry
	 1YblbaXviNxBliC+s7QriZnzY1TQi29mvWGC/ANHeIH/TZhZoRQGZFpHoLpXqKOzQ+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f2aWndYO;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA967606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA967606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f2aWndYO
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso144601a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697028; x=1793301828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mWyRbyYobbwew4V6IGeQkBhZcI3WNmI+oWsGUUslDMk=;
        b=f2aWndYOi0BcQtBJ/P4f0GNsHNQutqimzrnIgfZZhby1J0ouHPMov00i5R57dbvV71
         yws5H/5pTjO8znLBTEfLWLI0dPqMPn1+jbyGunxMZcuoUrKXpq5fUTvgX8a2DJwNou84
         Rnqvvhi/UTkyeNFaJwb3m/5sk3GITBCyHcHEFyf5ae8k1jiHoPFPpjfAvBzbAoUj1pyA
         mb2CcfMfaWjjwk93qTqqRNXC/6yk9yQg+zlI1dxah1tPnvxO8D6KzReAX262NrRGN+Sv
         mPygRLcSDb4wJVmsAqmMlt1icXaHC0/gtQXiQr/l46h4m43go5D4YhN67eQtdLBC5Dat
         gCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697028; x=1793301828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mWyRbyYobbwew4V6IGeQkBhZcI3WNmI+oWsGUUslDMk=;
        b=O1Selv5ecyBenKYfvyK9m8Q7hU6HiMaY9gLa1QXVVFtDEJ7qhoQDbkqGKIcNzKHQlk
         9AhnXFmM/3ifFRJik3k0UVHotlHBC2Ez8zVU7E0AAfxB77AftIuStA7C8KflYH8Qk6ec
         gYAJZctRvH/f3WNYjEGxqbz6EXeotop0/kxv5XtRg7ubqga0N01O10gzQLK1QJAYnzk/
         dwj1Lf/kbQmdhPnETKGjEN+G0f3TrscxZREsDuMtYPxT8hvjfFON1E6aZ5HjAC2e+hxK
         ZA8/+hMM7XYmb3CnRFOPN0tc2Y2ZiRtBEg8c2UJ64d8oOo0I9tZ1E6CjZ1O34NThabYz
         mXdA==
X-Forwarded-Encrypted: i=1; AKwUvBwP5ZQVtLqLrUBdPCw15jxW/JhHXPsN2RVj0HB2ZtT1+MuBy3RkaK/mEKyTVfncZueDqX0ytZf3OZepCjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVnU0/78JaTINosH4iWDVqqyWSRCqlwR6DofLrOD8Ueh5X0MnE
	y0kpqaN7HYlXx8sYdWFSuu69LRAobG4tkdxbxAPz34+LFokP618xcIyf
X-Gm-Gg: AYBFou3FjPwdRPD+bqFAjeYuGStaIQg7nThwo0fmxuB4J804WAedCZcHO7Y2EhNr2LH
	KU5ZxBOChsUrh8UqynbcsBP2NVTXfmVozhhI6O1XzlO+zJRw5CR5UShMIU7la5mA4wpYrfikTX3
	2lJPC66q/NTdp8hQDXPmUowS9flNL1OXk/vbFy2Ln6Ofd8QWLIasJVWUN3lLDPZIFRvi8DYThBo
	rD2CTchDaoDlmc0/UMvT+EI0sPt7ObMH+AEG3Y9Hgz1jop4wF56ItjxcjitJM7vO7RbKfHLqcoi
	X8/w8VoSWoMLU1p9f311kSWDo7HBytVG/2YO7KpyYCrvETVayyJCK+ysBS0uGyw0K6idfrvv4l8
	/YVCNnZO+F6wDrEuLYOxzwvGRkxGzTUBFJpMet5IvTkaprwazULPaBfXkRrlHSHl92p9ey3OE73
	FSRhFfXWQ5r7+AyGv1pI0rZnzP5HmBvvIEPXXiZa8sVFif0bcA9xj9c8AdJ4w/ZtB1Quhay3C7Y
	1uEnA8eGB8MDfuZrooVs5HzOQU0vzyGCC/wJndj87fJN2ywulp+9fGMZBnOgnUi4sJ8muucWw+O
	APQoBkbMSHIumvLyHkb59lndSXckLW6hu6YuFEBwS8x/aU3Yo6/XZhtyLxBZqUfm3Elh2902LVB
	oTwvCp5ML8Ac3r3n71trXAIhw1eqT
X-Received: by 2002:a17:90b:4c52:b0:3ac:80dc:f409 with SMTP id 98e67ed59e1d1-3ad86f39201mr4606639a91.61.1792697028146;
        Thu, 22 Oct 2026 12:23:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48ed6c0sm5532585a91.6.2026.10.22.12.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:23:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: "John W. Linville" <linville@tuxdriver.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	b43-dev@lists.infradead.org (open list:B43 WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless] wifi: b43: don't read the LPF bandwidth on N-PHY rev 3-6 for TX calibration
Date: Thu, 22 Oct 2026 12:23:46 -0700
Message-ID: <20261022192346.3327061-1-rosenp@gmail.com>
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
Content-Transfer-Encoding: 8bit

b43_nphy_tx_cal_phy_setup() reads the LPF bandwidth control from the RF
sequence table on all N-PHY revisions from 3 on, but only uses it on
rev 7 and later, as brcmsmac only reads it there. On a BCM4716 with an
N-PHY rev 5 (ASUS RT-N16), the read causes a data bus error, so the
TX IQ/LO calibration oopses there.

b43 does not run that calibration on these revisions yet, as
nphy->perical is 2, so this only shows when it is called. Read the LPF
bandwidth control only where it is used. With this, the calibration
runs and returns success on the RT-N16.

Fixes: 40c68f20e63c ("b43; N-PHY: write most of the missing code for revs 7+")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index 22359bd9db47..41a8ba8e8736 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -5108,13 +5108,16 @@ static void b43_nphy_tx_cal_phy_setup(struct b43_wldev *dev)
 		b43_phy_mask(dev, B43_NPHY_PAPD_EN0, ~0x0001);
 		b43_phy_mask(dev, B43_NPHY_PAPD_EN1, ~0x0001);
 
-		tmp = b43_nphy_read_lpf_ctl(dev, 0);
-		if (phy->rev >= 19)
+		/* The RF sequence table of older revisions is shorter */
+		if (phy->rev >= 19) {
+			tmp = b43_nphy_read_lpf_ctl(dev, 0);
 			b43_nphy_rf_ctl_override_rev19(dev, 0x80, tmp, 0, false,
 						       1);
-		else if (phy->rev >= 7)
+		} else if (phy->rev >= 7) {
+			tmp = b43_nphy_read_lpf_ctl(dev, 0);
 			b43_nphy_rf_ctl_override_rev7(dev, 0x80, tmp, 0, false,
 						      1);
+		}
 
 		if (nphy->use_int_tx_iq_lo_cal && true /* FIXME */) {
 			if (phy->rev >= 19) {
-- 
2.56.0

