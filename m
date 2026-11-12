Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501966;
	b=BYG1avb4OxcaBoaSAdJCHjiKzvf7lAJMF7K1C8pG4Rv0pzBw4za6FhwYOrJrt05OcFap
	 XTIsoS7BSUK1zP07Bjs+LA36GDCAnyjxs71jDiDQzyditpQlV8sB9Uzm6uJ6LUasV92Uq
	 kBNDCMDiPsad2E8YxsRFy1GyJul7d9h70CyrsZ72JZmlPodmW6N99ALq4bLv6eyx1Zqvj
	 VbZjHFVmYjfkzWxYBLfsLU13cwAE7oUYm1Nz/fhtYzfs0eKrI5Q9rg8iXxwJdJOHUMpiL
	 crfjzck8vkMjQBB+a7v7Ov8yH4/shNkGV3PukyzdIajebg4mF4fIeFyJ902DoeqOVqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tfzQxxWeLzH5F3hwJGBP8SJilKA+fkDjCsVxJYymu8E=;
	b=LYnQ5peI0ORxLOU37zcSO8GJphVId9g5tAGPizl3b0heGVX7f2pxqhhbHOnQI2x5D5I9
	 aDbXF/f2pucFRMfRaoLSrPZ7Wr7qBbUwd1p6MlH4gkh2Zz2uVaSHxssqWW8u55pC8F7of
	 KTH3QvK7wZZeSwS//eoOHoYo/Ev7+BWzlyEk1GGUOlsh76NRxFxh3shTFmlIK9OeMv3AU
	 uipxgrifJZh6i3QIh51FjbKXQXDczPFI6aqoLe1JGZH18lsRzFvHEtUCOvbS6as//MMz5
	 13PfYyurLE76cpHOn+VEccc3P2eGBpY8bXAQ/wKs5+K6C3JdjwaexG+OJkCw+NOP3TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3co+VPB;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC612606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC612606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3co+VPB
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so6848038c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501965; x=1795106765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tfzQxxWeLzH5F3hwJGBP8SJilKA+fkDjCsVxJYymu8E=;
        b=C3co+VPBMXdVur0EJSiLbqAe5jcOgIJABG1p6mnKkCjuDx5ArRZPpzqXInQsdWQkjw
         62y63T7mJfEgh3fTGRbq6GDjXE8n3yVCcuWLrqA18UxdEXleLUFyTXQl/hW2cGv2e5bc
         cdgFE1TTc/FfcYymWoiBYuc56TSo6+B8x8lulUvcAqU19MkTCSBSAeR0CB10de1iwm1e
         hifvSfAD5+IFLk1K3J5AhI04SvtFyCDjHOohvume8jMh8nu7TBhhc2Z3MLPK6l6Rezr0
         aM4BkniVOGiqiS88qQ5abqpsM5rsAI2AzjW1OVq64irnbEhCR4EDCM26Mc0Mt5tdmMcB
         Zj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501965; x=1795106765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfzQxxWeLzH5F3hwJGBP8SJilKA+fkDjCsVxJYymu8E=;
        b=t6LSfSiQYDKWOgOdQDFFvIsdbwgrS7nC7HUIPIbDkpYvhxI1FQVl/l6Q2Xy+fFJqt5
         OXONQ7ng5Xb/NYTcVBYwVnGHqLYf4+gxElxZg39CgL51XeLlxBDa1mBl6o+yA4N1pGaJ
         JYwx96eewpKMXqI1c2pErdfmtq0blmXRLYwLIUJfEdG2xIjFGDTH6wUpCAtu3qI5OQFi
         +u8rrWVZqV9Ba8jRG2jSAVeuP1nCidt6WLsMR9Ia7MiCpL89j17ao4JIGnuZc3JZlr81
         WPlbqr3wMjl74yk3QyEucdfT6wKoyx2mxClvk7+8uUx0XRHxrHndGqbXw6Kch1ljT/vI
         XhNQ==
X-Forwarded-Encrypted: i=1; AL+hErEqra1q7+/b2PlDNvhq7oXle0UQtBCfsLrjX+vbgSBBr6FFsyEJ5f3PmBWPgYWt8H1M212yXorOfgOd734=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HF8j07ZbiK2rZb5LO6g6a1IDEr0bLWzpC8bJdKVT2nrf+R0jT
	DcwhP61+bbUpnRLxG1DZAx9316tCY+d7hlbBy4rLdgmJicpIELrwxgMO
X-Gm-Gg: AYBFou15j/Np5pk+1vSfPiq9yKJytPzaPtBYZ49GE7r+h3j5gpKSkXf8T7es5/LyQsx
	TtOcmu81U3c/7wsrzD+aIi/r0uUPA/yLQ+peAB/V8Oa/uVdQgbjI09vyM3yevI9K/iZQcOHOX/6
	LGu3LPu/HsI/tovO7wuaYJ0FaIuIFbQ2M12fbuR1WH6msCuI/rmT7IUzKEfv+EC9SZVO3PEjFG0
	5AiItLyMUl8WBbdciEj4jn8MLgrUurjIPlRLxVs849d2IAvuVTGHldezu24IV/eWwBG4TwuvU1g
	UxY9ea4MdvTdJmXYbDc9bPOnF8rEw3KVPfgLgLhGu1LrUIn54A/8XhNjNe+ukXADOdpfdhWG4h+
	cMC+EaW1Cy7AgQrV+/1Q/Lehf/4XvR+EnC48GCzGE7y7Pv3nRzLvKfyhGTaeZQM3bSMOusZ4dNb
	PlDnjdamUqaYq1HK2O16TcZimMgZoQxUl9yKB2JO+bPWL7kTKXO5GRj0qwfYaim20/VVvRMUy76
	ll/dYFJ6rRuy7zVIwKV0XjojHTpP+9rQtb5l8WG/QmxiIVQhDwugH1lAe2jua0Txb1ZS+BCYf9r
	8MxXMbDI77AuThGHl/zRzn0JowJU9JhgWBKXPk/jQb3Gg4U6+d160dgjdoLcbp+33D6GnHRRJiV
	uW18ZJ06lW7lO3ITBJw2YvVSiQ7eMP43HwPkd0ZHbIIte
X-Received: by 2002:a05:7022:ea24:b0:1a9:e382:cedc with SMTP id a92af1059eb24-1b5030fb905mr111453c88.46.1794501964586;
        Thu, 12 Nov 2026 08:46:04 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:03 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 0/7] wifi: rt2x00: improve the throughput of rt2800usb
Date: Fri, 13 Nov 2026 00:45:34 +0800
Message-ID: <20261112164544.3176458-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series improves the throughput of rt2800usb.

Implements
- Frequency offset calibration
- Better fallback rates
- Aggregation
- GRO

Tested on WNDA4100 RT3593, 5 GHz with iperf3

  patch                          before        after
                                 TX    RX      TX    RX
  2 crystal calibration          27.7  31.6    28.5  69.7
  3 MCS16 to MCS8 TX status      27.0  70.0    29.4  70.0
  5 RX bulk aggregation          30.5  67.8    30.5  80.9
  7 threaded NAPI with GRO       30.5  80.9    30.5  161.7

RT3070 did not have any visible change for both TX and RX.

Patch 5 added WARN_ON_ONCE to get_rx_seg_len, but it will always
trigger due to a bug due to USB data toggle. The fix will be sent
in another patch.

Changes in v3:
- Crystal calibration: save the frequency offset of the beacons in
  rt2x00lib_rxdone_skb() instead of fill_rxdone, through rxdesc
- RX aggregation: enable it for usb_maxpacket >= 512
- GRO: Add locking and reference mt76 on how it is done

Changes since v2:
- Correct the link tuner start and stop conditions
- Extend fallback and MCS retry calculation to all devices with 3 TX chains
- Remove TX AMSDU and fast-xmit

Ho Jie Feng (7):
  wifi: rt2x00: start the link tuner when an interface is added
  wifi: rt2800: calibrate the crystal of RT3593 with the beacons
  wifi: rt2800: make MCS 16 fall back to MCS 8 on devices with 3 TX
    chains
  wifi: rt2800: don't report an A-MPDU length to minstrel_ht
  wifi: rt2800usb: enable RX bulk aggregation
  wifi: rt2800: support A-MSDU in A-MPDU
  wifi: rt2x00usb: use a threaded NAPI with GRO for RX

 drivers/net/wireless/ralink/rt2x00/rt2800.h   |   1 +
 .../net/wireless/ralink/rt2x00/rt2800lib.c    |  89 +++++++++-
 .../net/wireless/ralink/rt2x00/rt2800lib.h    |   1 +
 .../net/wireless/ralink/rt2x00/rt2800usb.c    |  33 +++-
 .../net/wireless/ralink/rt2x00/rt2800usb.h    |   6 +
 drivers/net/wireless/ralink/rt2x00/rt2x00.h   |  37 ++++-
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    | 152 ++++++++++++++----
 .../net/wireless/ralink/rt2x00/rt2x00lib.h    |   2 +
 .../net/wireless/ralink/rt2x00/rt2x00link.c   |  10 ++
 .../net/wireless/ralink/rt2x00/rt2x00mac.c    |  13 ++
 .../net/wireless/ralink/rt2x00/rt2x00mmio.c   |   2 +-
 .../net/wireless/ralink/rt2x00/rt2x00queue.h  |   5 +
 .../net/wireless/ralink/rt2x00/rt2x00usb.c    |  62 +++++--
 13 files changed, 365 insertions(+), 48 deletions(-)


base-commit: 3c311bf321442d4c4f452a1a08bc9efce242a1f9
-- 
2.53.0

