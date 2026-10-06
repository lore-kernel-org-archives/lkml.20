Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FE73E3D8C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275883; cv=none; b=L5mHcJqWjo9jpawRrOO6ewuObFkM+6L7nmbLkobE3829HI+CYNk3gYA9ya7aPZxWHYBR5TfkQCYeMGDIQ4rgfeTRhVbNRFociRSjc488L1PYum2HVdx1lHPYJM94Q0guSFGMPQUq+0pTbVWdtHJ7NYmTwwnfvNmBVv5U9LOmszc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275883; c=relaxed/simple;
	bh=TJcktcEGamEdhHFJ9ClE6VyEpArG7YLDEnIitvHhmEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RGlkPJIPLX5j7pxYQV8tZ3iEE7NfQwIm6izumEzyVTKqUUHsB/pSZWVBHYwfsQEj85ESboqbzqn7SgAEf0G5bjPy2u+hjZumPfcxULG+YhM8s0FGaBjjkqSnOP7MSe+EAlueh53Q+IPmu2kvskwHNfYgWovnQMIA6caAjyVSb0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXv9ia5T; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXv9ia5T"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso236707f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791275879; x=1791880679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EACg+niuH5Pxfe3AChDaPMlD3C7ZrWiaf/KAljHZfEc=;
        b=PXv9ia5TZt/S6ZdtBWeypGTbAz96MuHYYpM2tX/BEPFqdIN4zYk4sdbb7bbScsjP4b
         s99WFE19Z1iuM3VZ7U8qbTSmRZk9Mno/VDZegO3GQrPAkgdAf1U3t+rBzvpRH3KA8FAD
         jwFAF81v+sjgTG8zjQn1t3/ogSvdaiF1BfV4H9puZ4Pt5t7ceS2ZVYyxZ4ivgDlgEck2
         nY4CATDwEOhquvg83qfKKkuXZVWC1C1midgLk8T9RtoSz1GPY+hqli7ueWGqkD2SJyrG
         pWKvMY0e/UmgP+0VLQWjgFtBusnzIfxZ5chuh5yIkrbMHFO/b7wvktWwMEAD9U6rrKLa
         EK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275879; x=1791880679;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EACg+niuH5Pxfe3AChDaPMlD3C7ZrWiaf/KAljHZfEc=;
        b=IRSZt1Cg6ClYrtN4/AdNyAxchWih2zs2qvb0YmorF0TrCxqwSNDzFET3oanK5zXnAO
         7RFfXTAtslrubTcQFSg7byI2PuIa5QSasbKlffv2PfVslerxd4eiUgCMyO1t0Deg2g7E
         oRZHkVDw4qV8S1TQuaZEfNhAzJoxjRA2ZtcfrVRi1UzqDSfdEqevjOl0C2nM//RnJOZl
         3V6V1aNkTcNbICanYi9HIGt22tKzyr535onFzfBV/m+Dc/fSzym2wQ69m4O4rq0FDpLy
         AUT017IVnXHaDv6AmCUSxS7kwYgN5x8/nskalGjPSBAE1a1QXZjC+MoToNKO687ttjP5
         1OLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGw3q+mJyjiYHdxiddC0cWVs1OBOIycRuqPBf1GjHRJ4p4Qwh1WqnwV4GKlFXNVIjllse6estcJrjn/fE=@vger.kernel.org
X-Gm-Message-State: AFuF++mhh9D6pMayUyFb83RBha8brxAHKEdot/yro81tPUJb/7+7rUVK
	KSqm6SUsPh86EmaJULKXp2CFY6slVtSq7AgDg1ONgkNadNvRXmF6NSz9
X-Gm-Gg: AYBFou0Q7M8Pdzfm9VOQmJWuamHyNeHUwrlBYZ059XDugU23soF4PtoqU9Sof8U6RDn
	cX+8QUAcpYlXBFJdo0gxlOMgyjT85nwykU2uLw/no1FIljsUrEOC2EBxdC+HOUNX7ZJzx/aHo4x
	jtITeZXfE3JHcJGt0m+tJsebhyWlrRSQqFVEFY5O1xP3Mdhaa1/c+dOFx4NNvzqWZKh/EipYfEU
	bwG0c+NtxpO6AE6XOG33uJkmd0J1atQZv6k9PcVbQua2VezmLbwTMD6+VlwGIUC+iDw59BZeIMm
	7X4IRy6Vp0udBMXWT4xhZFMjAHjcXAt5sgdDlZ9uqQ7VhRrYZqQ6P5UygsaCEn+YdJJcPpOi17u
	PtlOnmu6eMbFmCmZ7Q4JJmbcaexZqbV9STYckz3L+GJUTwUXhkdcnBC1nFuFThpuEgvA4K2wvHa
	V91IXBD0bTa3qGgktU6+HHMMQeL5uo4Y0rtDD9Kd0tiYpbY+f6S7Gz8ZPX8rwb2p1DpxatD7fQ+
	XDfeBM4sps=
X-Received: by 2002:a05:600c:848d:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a17b53c11emr11989775e9.13.1791275879338;
        Tue, 06 Oct 2026 01:37:59 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm331043605e9.0.2026.10.06.01.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 01:37:58 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Felix Fietkau <nbd@nbd.name>,
	Dan Carpenter <error27@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: mac80211: don't estimate airtime for unsupported rate widths
Date: Tue,  6 Oct 2026 10:37:51 +0200
Message-ID: <20261006083751.4015-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ieee80211_fill_rate_info() copies the driver's rate_info bandwidth into
the rx_status as is, but ieee80211_get_rate_duration() only handles
20/40/80/160/320 MHz. When a driver reports another width, e.g. an
HE/EHT RU allocation, it hits WARN_ON_ONCE() and returns 0 without
setting *overhead. ieee80211_rate_expected_tx_airtime() then goes on
using the uninitialized overhead, as Dan's static checker report
points out.

Seen on a Microsoft Surface Pro 11 (WCN7850, ath12k) while
NetworkManager dumps station info:

  WARNING: net/mac80211/airtime.c:532 at ieee80211_get_rate_duration.isra.0+0xc0/0x180 [mac80211]
   ieee80211_get_rate_duration.isra.0+0xc0/0x180 [mac80211]
   sta_estimate_expected_throughput.isra.0+0x38/0x64 [mac80211]
   sta_set_sinfo+0x7fc/0x8e4 [mac80211]
   ieee80211_dump_station+0x4c/0x84 [mac80211]
   nl80211_dump_station+0x594/0x7e8 [cfg80211]

Only accept widths that ieee80211_get_rate_duration() handles in
ieee80211_fill_rate_info(). Other widths then give no estimate instead
of a warning. Also return 0 from ieee80211_rate_expected_tx_airtime()
when no duration could be computed, as ieee80211_calc_rx_airtime()
already does.

Tested on the Surface Pro 11 with next-20260929: Wi-Fi works and
"expected throughput" is still reported (about 1049 Mbit/s for a
1297 Mbit/s HE 160 MHz tx rate). The warning itself is rare (twice in
several days of use), so this does not prove it is gone, only that the
change does not break the normal path.

Fixes: 094dc1619cb0 ("wifi: mac80211: factor out part of ieee80211_calc_expected_tx_airtime")
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/aneGlCMVnqRhlf6p@stanley.mountain/
Assisted-by: LLM
Signed-off-by: François Roux <franzelfranzel@gmail.com>
---
 net/mac80211/airtime.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index 0c54cdbd7..a4e1f33c0 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -632,6 +632,22 @@ static bool ieee80211_fill_rate_info(struct ieee80211_hw *hw,
 	if (!ri || !sband)
 	    return false;
 
+	/*
+	 * ieee80211_get_rate_duration() only handles these widths. Drivers
+	 * may also report e.g. HE/EHT RU allocations, which cannot be used
+	 * to estimate airtime here.
+	 */
+	switch (ri->bw) {
+	case RATE_INFO_BW_20:
+	case RATE_INFO_BW_40:
+	case RATE_INFO_BW_80:
+	case RATE_INFO_BW_160:
+	case RATE_INFO_BW_320:
+		break;
+	default:
+		return false;
+	}
+
 	stat->bw = ri->bw;
 	stat->nss = ri->nss;
 	stat->rate_idx = ri->mcs;
@@ -770,6 +786,8 @@ u32 ieee80211_rate_expected_tx_airtime(struct ieee80211_hw *hw,
 		return ieee80211_calc_rx_airtime(hw, &stat, len) * 1024;
 
 	duration = ieee80211_get_rate_duration(hw, &stat, &overhead);
+	if (!duration)
+		return 0;
 
 	/*
 	 * Assume that HT/VHT transmission on any AC except VO will

base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
-- 
2.56.0

