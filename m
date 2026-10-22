Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697176;
	b=Rmv1TS+03WTxeHU3S22yIHIN/NqLnT7eNI4MdWh9l8G/se9SxB0qv2qqTtGMoL5GPim6
	 n8hUZqIjqkvy/nJBNnz2IJSY7xvIWX5Ax7XH7oG0FOluI7L4IOvKiwcYg+NH2gD8xcqwL
	 UWVB0/qxcAJeStDtnaVUSYmFCHrn9K7En11L82ykmiTxCrVlGXuwSlEJ34jc6tuzdDjns
	 gVXyQ+X3b84kKt2ES9hCsdH/1ezaXozgdzyWDixEuAv0Pe0QtM041N0lOgas9m7MCtZS+
	 ceTeuX52/VtVm4UX8WSq4Zhzol0yIxQFO2adZdGxAOupSqLku9FLyzMYdXuNunlFk6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gK7izGGtZVYQa86HMWiLhtBvLLYZxvuYYPXUeMfCAJs=;
	b=TENMGUDuHBmvsvtIKjuErRZeAMlaNfTPxK8Ua96TexxMf5M+dl0oKrSz5OKM7Ib53fh4
	 mv+FCPeTvEUkdGLqxRyi5gllJ7c1QwmnYUD3oAy6RAeRDGH9bevYK3NAUA6eZ3WBTpruO
	 /mQ+uo8EYsQNRyw2wOfRd9rTWgsp+rgzVHSxZvhy37g76ErURKPdQSA7V+Zxh2z7TGVG+
	 ElAtG+R/AUmCWKn1dV3OVq8EL0Vt/sRlzRZZUmQO9gV7ikmquZi/NbAoDibSRDkg1VMoh
	 7B9NLiX9aE5InE/msr64460xhngck+4Gc+di5EtPl6cVqxjBLubmeaUzjNO4/JN8AQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Qju46AX/";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A96B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qju46AX/
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35943f55c06so143180eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697175; x=1793301975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gK7izGGtZVYQa86HMWiLhtBvLLYZxvuYYPXUeMfCAJs=;
        b=Qju46AX/WWhzm85wKH0dV9cGY9cLEKbV/bpBBPt4d4j1X8gO8+sNByrdzXiuMN2cW+
         4PvQ49wMXxZeMy1TcFmwdh95p55HDma5/PBjcRGuwwA2+8gr0DAvekmbMfxK4vPH5+e4
         3IooWl2cRb0PC5JO04IgnkeSyxPEC+JAujgQUf/ooLSLMCwuiTLDGQg5zHb6VSNbQbOU
         NdLjQ8xRr3RBxKkCBCbHHoP+xsbDkPqTDYY+H9SMVEWlT/I3ajRIWAk4WaF+4aZZ5Lbb
         xk/wdfDChc95Zvrt/HBGQDaEVLUj+zdcwBrO8gKPIOr1OM6z+uqcKyO+W5Kf2SpeIct7
         C5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697175; x=1793301975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gK7izGGtZVYQa86HMWiLhtBvLLYZxvuYYPXUeMfCAJs=;
        b=XAxV2XJCpYkTdKGms54lf3LXg1W+5WD1RRBHqJrSGOuRkD4nmqayQrrkA4JW8zEpX+
         yApICojI8UAtDkgh2n1YyQINSnupE37aYq0doWoLFrCqp5x5q9XZKZBi8tQkI3GTtSUf
         Dny4q9xnFTeLexSXfrqxc41s7JEf1J/8q7p5jP5tNUvxf+vJBzpTs5pWktsyWig2Lv3F
         OEBDHKPFRtyxZink51i0yZIsY2UmXaZxRfUz0q2LXAtywWFjqH02S1D/wrD9e9lvZ5wR
         Yc/xQC3hrY2NdH0I21TcrmotUH2jN/wEcLYoC4BwZ3ukHMn92KztzRO2Uc6xVxTAcJcU
         tHpA==
X-Forwarded-Encrypted: i=1; AKwUvBzTkIMT3rgYz24nv9Q6MSYwUPJ87U4yHYfmqyyzqJBbpihHlls0tXSFmcZVVi5Wn7ncDWNZhLeTYYxC8So=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+XUuHXSCCSAu/pNfaq9F+9L6B9v/nA053s8GOuS+2NwuFaimi
	6aKbkQ/kDWg4PXSJJKXycaPHf41I6UTosKbOexJNP5aOActUnM1MyBaT
X-Gm-Gg: AYBFou1+onoMiXuRfIi4iqUwvHFwqqEACdVCDTd7/xr0spT301aQjsUwlebdxoHSTTn
	s/IiWtvdSMULKddvK6hBExw7ylt3pDWc9PWMympCR2DmJui2XdQp3WYZzppDdjkwvO8QSq9Y1Ru
	MuENab1HX4q3edaM6PGK8MtgCEwvmxzt2KtwaX8tfbgt3lR6j4aFk5CbYBKqWdXhZKqPfM0LzVx
	OE17E3u1gfUz/EEOGq1KFVNtHWhbffxaP/GS/9J2ykXLCy5zc5WNi4VGXOPwLBAksL6+Vt/MPhq
	JxplW+gwgjs5t7/hZ1zfVLeBB/HU+4ypC1XUEI1/tOk/qgI9JnuILcFcVeuZbv8bpJ73H1EgARl
	wo/2Ce89jNvu+yT0ypVSobK6ifocZFX5mh7MJe66vyfwtNg/2f5UnHw+NGB7aofGJMoXoUzWwHw
	NvkH0oi9afrYyBwtzfxixasc+2rr3jadkZDwAbYvpGgUW7R55BtHmExsfiQyy4Xcfr7jj/MDvvd
	JSLLlXMcyjvlmhTMR59zP652RKcY3xLSJu86jeNWGS45U/uwPPtqrlB+YZjCwi/euJKa276hBFR
	O+v+xCjxno/KOe21Rd3YSg6hScTp7Qra9o/OmAySoM7fTfAWnfcer5BCZnPSc0Bcvc7Ao7d/qX6
	7CTGgSlMgHnbKo/JODhrNHvigADl1
X-Received: by 2002:a05:7300:559a:b0:360:aeee:9b8a with SMTP id 5a478bee46e88-368afd86aabmr3963048eec.8.1792697175344;
        Thu, 22 Oct 2026 12:26:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d8fb1a06sm328384eec.23.2026.10.22.12.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:26:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	"John W. Linville" <linville@tuxdriver.com>,
	b43-dev@lists.infradead.org (open list:B43 WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless] wifi: b43: HT-PHY: read 32-bit table entries low half first
Date: Thu, 22 Oct 2026 12:26:13 -0700
Message-ID: <20261022192613.3329978-1-rosenp@gmail.com>
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

From: Erik Conijn <egc112@msn.com>

The PHY latches a 32-bit table entry on the access to the low data
register, as b43's N-PHY table code and Broadcom's wlc_phy_read_table
assume. The HT-PHY code read the high half first and got the stale high
half of the previous access: TX gain table entry 0x1a/0xc0 0x10f90040
read back as 0x10190040, so b43_phy_ht_tx_power_fix() programmed a
corrupted radio gain word.

Fixes: 1a9313923718 ("b43: HT-PHY: prepare place for HT-PHY tables")
Signed-off-by: Erik Conijn <egc112@msn.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/b43/tables_phy_ht.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/tables_phy_ht.c b/drivers/net/wireless/broadcom/b43/tables_phy_ht.c
index 1acf2df66e5e..a6db39c644e3 100644
--- a/drivers/net/wireless/broadcom/b43/tables_phy_ht.c
+++ b/drivers/net/wireless/broadcom/b43/tables_phy_ht.c
@@ -622,9 +622,9 @@ u32 b43_httab_read(struct b43_wldev *dev, u32 offset)
 		break;
 	case B43_HTTAB_32BIT:
 		b43_phy_write(dev, B43_PHY_HT_TABLE_ADDR, offset);
-		value = b43_phy_read(dev, B43_PHY_HT_TABLE_DATAHI);
-		value <<= 16;
-		value |= b43_phy_read(dev, B43_PHY_HT_TABLE_DATALO);
+		/* the low half latches the entry: read it first */
+		value = b43_phy_read(dev, B43_PHY_HT_TABLE_DATALO);
+		value |= b43_phy_read(dev, B43_PHY_HT_TABLE_DATAHI) << 16;
 		break;
 	default:
 		B43_WARN_ON(1);
@@ -658,9 +658,8 @@ void b43_httab_read_bulk(struct b43_wldev *dev, u32 offset,
 			data += 2;
 			break;
 		case B43_HTTAB_32BIT:
-			*((u32 *)data) = b43_phy_read(dev, B43_PHY_HT_TABLE_DATAHI);
-			*((u32 *)data) <<= 16;
-			*((u32 *)data) |= b43_phy_read(dev, B43_PHY_HT_TABLE_DATALO);
+			*((u32 *)data) = b43_phy_read(dev, B43_PHY_HT_TABLE_DATALO);
+			*((u32 *)data) |= b43_phy_read(dev, B43_PHY_HT_TABLE_DATAHI) << 16;
 			data += 4;
 			break;
 		default:
-- 
2.56.0

