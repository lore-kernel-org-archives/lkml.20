Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460343;
	b=0LjHtYUsleBMv/j8OvwYRHtEYUrOdKIRZ8GgFMZtMh25zTA1Am8C3J+/dW5OwNn7Z8oy
	 zC2Q7YCrBK0kQwaxWUVKoSaovxDC/ro1dYoHsfPJV21Tm6IPVHIpRRr/6sGNj8WEXtp8c
	 IPYDlFfcIhGGWdzVN5N4NVeLI2ho+IULT0dRzoHadbBfp13xr3YPjHjBzcm64yN++MWAI
	 QHIzyC5lIMp3kQ7Of9oJumRQ4ybvmfYC7n3QeZMs5LaBVhKWkDDu8q4/tqaiJ9oMHBTCe
	 OZtuvY9jPf4i8b3V//qQeUiCnbWAnUVa0Z5nD8xSDL9GWA4JiOnUpLGZj9NAOCRGZ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7ejswm6wacGE5NHhK4DssE9Uh0nFxZ37NEoYPryOe64=;
	b=2orkPLzJ80ESCH2l3esH1cJzG+9X5pjEly2Oo2Ysg1dsitxGwrwZ0Fm2sBa0i8M5LEZ8
	 Xzxeci2ont8Ni+jCcIQnihiVdABvDNJb1KWHBuLi1I/AK1QJI/ZvYbZEH+2IlwW8tArF8
	 h2bN07LTQp6PAYTK8/2EH+aiC7/2rRMD+GWCH/c6KfgqgjaBzoAz4ObxwSvJKIxyHLNyl
	 y5Z8qioNfRvmq1cpNhQYGnVoRu7elFGd0dj+T5vFCeGzwZ0QeEpb++JE/Weknac2i4mko
	 kK/DlfnBgk77EJdLVZrGko5kL1soFHHL7nrDHANftaCtiCSRtsXHSAmVTkUetLRrcdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ps0Gp3T6;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1216760A262C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1216760A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ps0Gp3T6
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3081689eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794460342; x=1795065142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ejswm6wacGE5NHhK4DssE9Uh0nFxZ37NEoYPryOe64=;
        b=Ps0Gp3T6WYd/QAjVsbs4fyM4NUrJ3wXT4BNBKft0IcA97wQ2ApGShkhMLpqounLDY0
         Ex8hKT6xM3FZdYk9obYdoIx8eV0fTfF07+9nOx1GPnF8ljZSZv9rSknagduANkZk3LBO
         6ImG5k9PM74ea3+VeGJzk5FpdqSjInrgfq2atO1kQJxO8xZyb6JqL/6PKoSJMcilbLuU
         U7+OL64PuRAf3UZOv6GXgdiU/gXaGvx19zvzVhmPnJZ3o1/rdf5U6mNEJt49EwhIFbjy
         EzwGje5pEH/cvJBTER6nXsnSsY1kON50G9vCP/WlfTcOh8mWxS1Sl8ZgKU6rf2aOq7PK
         dFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460342; x=1795065142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ejswm6wacGE5NHhK4DssE9Uh0nFxZ37NEoYPryOe64=;
        b=dO3K3Ts4Hhq3qitg3izpDfmAu76ZfXQslamdceTerlzMvCAWxkVKO48w3tYXBepUwz
         oRbuu395w7ip0JNojNTzoIR4bzxff/uQYAUTW6w9TC932JyR45PSjBrEblWEoho6lzDi
         vH3f596ZE63uabc9FFEve7pHGUOTJjplYB5MRTai/QG5yR4Ai9u7e0d9YS/u2i9jHBHY
         ZVMKmXBfCu+Bh1bnUu5HI8eYEsL+qBqNTWIZvI+b4/Mf8vky5fk6xjcgqni5kiBZIS9f
         VhVoDShuH4Rf9j8nQqZj7gUiY97erf3Vg92FKehy75nUnhLOewDov+q06KJvrkWNpSI0
         xYIw==
X-Forwarded-Encrypted: i=1; AL+hErGWPH+3JKdPqmvAZblsxBq+2TKdNBtj8084pXpLgiey0ZBpjO2Sz1iBJ2zx2z/+dg9nyPxFY4GAO3krdj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AwWmPcQhR3iA6WW+vOnGwtlms/ZhUS1VfLLRHM2uM51H7nozD
	/eBOTztgG9Us0EHzthOrq3DRlhR8CKO6naqLNOJR6j8EXL4aqta7q6NX
X-Gm-Gg: AYBFou1JAfukwsKj81dku10+bSNsfh96dq6Qc1BMZD5j2H2YcfpiuPwQ6etuR/+B8+N
	tVpz2uCYmafGCdd24edpfzjGwd0xIQfujgxXDq8OSxrG3jaWxuEhJl2Yhd+zUG5DXVcsDgGIsbN
	blBrY2xQw+2XCK4WnS6/xNN2m/OVxNX4OKPdULk0fbpmLb9Ppsh79Y3hIUCl7tRvUZxzfRqpW4H
	ZYCAdR4voDwQ2oJR/7Xb7eezW23vB5V/FGQm0ikHiwEwMZk9N2lm9p48IIlcJk7VUUlgHu5s3IX
	xCD1ISB/s1JOjhvtKi42jLD9hzhEkRN89Mwl3ysDOeBpSuH6SjTuFUdZzBJfI6+PmqetxZwa4qx
	GW9ob6odDBdnm6MUxwDoJlFyBTNxMDcSVWl74hBM+23SY39blLVioXhes3+xjftwwwMRm6SnnOg
	YSETVMmtaT8YWWru+wiGcHda2H46F9QgTja9DrV4wp2gsqZvxni8A0X+pJDam1dsTB5C1kkPbSS
	x2u4MTsgUP6CI7iDwqBnYNS1Rgj+v2HVZNZltDOWuY+7MxXcuCAfyz7r70waOcqd40iYU86QLiv
	5Py9TJxlYi8TnULpcoev3LLu6SUmJlOF8PuYwGBTXjSAHJQe2XSNj4Y=
X-Received: by 2002:a05:7301:78c5:b0:375:4f3e:643d with SMTP id 5a478bee46e88-37686d3432amr4544155eec.27.1794460342131;
        Wed, 11 Nov 2026 21:12:22 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:37ea:9b2d:3d7a:8379])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm26095228eec.19.2026.11.11.21.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:12:21 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: hjf3108@gmail.com,
	Ragul Balaji <ragulbaby@gmail.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] wifi: brcmsmac: move the RTS rate selection to rate.c
Date: Thu, 12 Nov 2026 13:11:35 +0800
Message-ID: <20261112051142.2797529-9-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112051142.2797529-1-ragulbaby@gmail.com>
References: <20261112051142.2797529-1-ragulbaby@gmail.com>
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

Move the RTS and CTS ratespec selection of
brcms_c_rspec_to_rts_rspec() to rate.c as brcmu_rspec_to_rts_rspec(),

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/main.c        | 62 +++----------------
 .../broadcom/brcm80211/brcmsmac/rate.c        | 49 +++++++++++++++
 .../broadcom/brcm80211/brcmsmac/rate.h        | 10 +++
 3 files changed, 68 insertions(+), 53 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index cd80155a5a..4be0bb085a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -325,13 +325,6 @@ static u8 brcms_fifo_to_ac(u8 fifo)
 	return fifo_to_ac_mapping[fifo];
 }
 
-static u16 frametype(u32 rspec, u8 mimoframe)
-{
-	if (is_mcs_rate(rspec))
-		return mimoframe;
-	return is_cck_rate(rspec) ? FT_CCK : FT_OFDM;
-}
-
 /*
  * Detect Card removed.
  * Even checking an sbconfig register read will not false trigger when the core
@@ -6164,15 +6157,15 @@ brcms_c_d11hdrs_mac80211(struct brcms_c_info *wlc, struct ieee80211_hw *hw,
 	txh->MainRates = cpu_to_le16(mainrates);
 
 	/* XtraFrameTypes */
-	xfts = frametype(rspec[1], wlc->mimoft);
-	xfts |= (frametype(rts_rspec[0], wlc->mimoft) << XFTS_RTS_FT_SHIFT);
-	xfts |= (frametype(rts_rspec[1], wlc->mimoft) << XFTS_FBRRTS_FT_SHIFT);
+	xfts = brcmu_frametype(rspec[1], wlc->mimoft);
+	xfts |= (brcmu_frametype(rts_rspec[0], wlc->mimoft) << XFTS_RTS_FT_SHIFT);
+	xfts |= (brcmu_frametype(rts_rspec[1], wlc->mimoft) << XFTS_FBRRTS_FT_SHIFT);
 	xfts |= CHSPEC_CHANNEL(wlc_phy_chanspec_get(wlc->band->pi)) <<
 							     XFTS_CHANNEL_SHIFT;
 	txh->XtraFrameTypes = cpu_to_le16(xfts);
 
 	/* PhyTxControlWord */
-	phyctl = frametype(rspec[0], wlc->mimoft);
+	phyctl = brcmu_frametype(rspec[0], wlc->mimoft);
 	if ((preamble_type[0] == BRCMS_SHORT_PREAMBLE) ||
 	    (preamble_type[0] == BRCMS_GF_PREAMBLE)) {
 		if (rspec2rate(rspec[0]) != BRCM_RATE_1M)
@@ -6418,48 +6411,11 @@ u32
 brcms_c_rspec_to_rts_rspec(struct brcms_c_info *wlc, u32 rspec,
 			   bool use_rspec, u16 mimo_ctlchbw)
 {
-	u32 rts_rspec = 0;
-
-	if (use_rspec)
-		/* use frame rate as rts rate */
-		rts_rspec = rspec;
-	else if (wlc->band->gmode && wlc->protection->_g && !is_cck_rate(rspec))
-		/* Use 11Mbps as the g protection RTS target rate and fallback.
-		 * Use the brcmu_basic_rate() lookup to find the best basic rate
-		 * under the target in case 11 Mbps is not Basic.
-		 * 6 and 9 Mbps are not usually selected by rate selection, but
-		 * even if the OFDM rate we are protecting is 6 or 9 Mbps, 11
-		 * is more robust.
-		 */
-		rts_rspec = brcmu_basic_rate(wlc->band->basic_rate,
-					     BRCM_RATE_11M);
-	else
-		/* calculate RTS rate and fallback rate based on the frame rate
-		 * RTS must be sent at a basic rate since it is a
-		 * control frame, sec 9.6 of 802.11 spec
-		 */
-		rts_rspec = brcmu_basic_rate(wlc->band->basic_rate, rspec);
-
-	if (BRCMS_PHY_11N_CAP(wlc->band)) {
-		/* set rts txbw to correct side band */
-		rts_rspec &= ~RSPEC_BW_MASK;
-
-		/*
-		 * if rspec/rspec_fallback is 40MHz, then send RTS on both
-		 * 20MHz channel (DUP), otherwise send RTS on control channel
-		 */
-		if (rspec_is40mhz(rspec) && !is_cck_rate(rts_rspec))
-			rts_rspec |= (PHY_TXC1_BW_40MHZ_DUP << RSPEC_BW_SHIFT);
-		else
-			rts_rspec |= (mimo_ctlchbw << RSPEC_BW_SHIFT);
-
-		/* pick siso/cdd as default for ofdm */
-		if (is_ofdm_rate(rts_rspec)) {
-			rts_rspec &= ~RSPEC_STF_MASK;
-			rts_rspec |= (wlc->stf->ss_opmode << RSPEC_STF_SHIFT);
-		}
-	}
-	return rts_rspec;
+	return brcmu_rspec_to_rts_rspec(wlc->band->phytype,
+					wlc->band->basic_rate,
+					wlc->band->gmode && wlc->protection->_g,
+					wlc->stf->ss_opmode, rspec, use_rspec,
+					mimo_ctlchbw);
 }
 
 /* Update beacon listen interval in shared memory */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index 1c0259139c..fce98dd4d7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -903,6 +903,55 @@ brcmu_compute_rtscts_dur(int bandtype, const u8 *basic_rate, bool cts_only,
 	return dur;
 }
 
+u32
+brcmu_rspec_to_rts_rspec(u16 phytype, const u8 *basic_rate, bool g_prot,
+			 u8 ss_opmode, u32 rspec, bool use_rspec,
+			 u16 mimo_ctlchbw)
+{
+	u32 rts_rspec = 0;
+
+	if (use_rspec)
+		/* use frame rate as rts rate */
+		rts_rspec = rspec;
+	else if (g_prot && !is_cck_rate(rspec))
+		/* Use 11Mbps as the g protection RTS target rate and fallback.
+		 * Use the brcmu_basic_rate() lookup to find the best basic rate
+		 * under the target in case 11 Mbps is not Basic.
+		 * 6 and 9 Mbps are not usually selected by rate selection, but
+		 * even if the OFDM rate we are protecting is 6 or 9 Mbps, 11
+		 * is more robust.
+		 */
+		rts_rspec = brcmu_basic_rate(basic_rate, BRCM_RATE_11M);
+	else
+		/* calculate RTS rate and fallback rate based on the frame rate
+		 * RTS must be sent at a basic rate since it is a
+		 * control frame, sec 9.6 of 802.11 spec
+		 */
+		rts_rspec = brcmu_basic_rate(basic_rate, rspec);
+
+	if (phytype == PHY_TYPE_N || phytype == PHY_TYPE_LCN ||
+	    phytype == PHY_TYPE_SSN) {
+		/* set rts txbw to correct side band */
+		rts_rspec &= ~RSPEC_BW_MASK;
+
+		/*
+		 * if rspec/rspec_fallback is 40MHz, then send RTS on both
+		 * 20MHz channel (DUP), otherwise send RTS on control channel
+		 */
+		if (rspec_is40mhz(rspec) && !is_cck_rate(rts_rspec))
+			rts_rspec |= (PHY_TXC1_BW_40MHZ_DUP << RSPEC_BW_SHIFT);
+		else
+			rts_rspec |= (mimo_ctlchbw << RSPEC_BW_SHIFT);
+
+		/* pick siso/cdd as default for ofdm */
+		if (is_ofdm_rate(rts_rspec)) {
+			rts_rspec &= ~RSPEC_STF_MASK;
+			rts_rspec |= (ss_opmode << RSPEC_STF_SHIFT);
+		}
+	}
+	return rts_rspec;
+}
+
 u16 brcmu_phytxctl1_calc(u16 phytype, u32 rspec)
 {
 	u16 phyctl1 = 0;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 401fed6939..9f517be0c7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -212,6 +212,13 @@ static inline bool is_cck_rate(u32 ratespec)
 			rate == BRCM_RATE_5M5 || rate == BRCM_RATE_11M);
 }
 
+static inline u16 brcmu_frametype(u32 rspec, u8 mimoframe)
+{
+	if (is_mcs_rate(rspec))
+		return mimoframe;
+	return is_cck_rate(rspec) ? FT_CCK : FT_OFDM;
+}
+
 static inline bool is_single_stream(u8 mcs)
 {
 	return mcs <= HIGHEST_SINGLE_STREAM_MCS || mcs == 32;
@@ -279,6 +286,9 @@ u16 brcmu_compute_rtscts_dur(int bandtype, const u8 *basic_rate, bool cts_only,
 			     u32 rts_rate, u32 frame_rate,
 			     u8 rts_preamble_type, u8 frame_preamble_type,
 			     uint frame_len, bool ba);
+u32 brcmu_rspec_to_rts_rspec(u16 phytype, const u8 *basic_rate, bool g_prot,
+			     u8 ss_opmode, u32 rspec, bool use_rspec,
+			     u16 mimo_ctlchbw);
 u16 brcmu_phytxctl1_calc(u16 phytype, u32 rspec);
 u16 brcmu_calc_lsig_len(u32 ratespec, uint mac_len);
 
-- 
2.53.0

