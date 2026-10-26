Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993027;
	b=hyJu6l06ux4/aXCur4GEtdfDAdHS4WgU6sG1f1HDkzrIOD11gTSGKIujtb0UHYW/YMbD
	 3hhViyf6Qfupk2D+7nFJQzYlluYvn5KGDbC7AJV7Z2dR3PBA00xAQCoBjCHomtILbj1dD
	 ZIoMo27iQf9p1kLQJ2DpDpiTWumR1/rnOxUJSr1iCfdCnfWwYpeijfZdSxfIfWBlUuWZK
	 gSUPRrzZmeoyIgvIHTJ0eQf0ohbJ/dtUVXIp8YGgIaVCHnKjkAmXvIShDmTyS+D97t7gB
	 nS2a9WoqttGdn+70WQyB2XQHEN8CkI3jn4J2mbFfJg73kFEhaqrJsAAET8A+9ps7yxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MS+SFJ9WWLq5oVbR7Ht5YirMH5w3cLZDi8sfy9s9yMk=;
	b=oFv+PSzHT1dfpqWxXfuonPIPkyZEgk6V1ajJUI0qeZr/jqepkJImzV2/0aJYv9PLJ0rJ
	 3K1wOc8ZyXrXo413b+JMxiHEulKdQnHA1T7aNJz3hXsXuH7RqUYj0pAsvS9Z4osV7j3xZ
	 zRQXm/+T1FbwuIJ6c3HVr1R2Hi139YnpL116i9nuegV8xDLAJdhFInm4zi58MD0kND5J6
	 OUNa1Fnwrx7dDy/+5Me5R/S2uTUdRcMLNzKDrD+uirgLJjoeuSgoQ79hBNA0uA/IWjOVQ
	 hFTu8SOowrF5lhZ19dAXJyB89IeeW8DjRVjX5NeHOvSlrsLFf2fIpqkGs1e0f9AVJcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDVOv7N5;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94943606A331
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94943606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDVOv7N5
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a594d313a3so273196b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993026; x=1793597826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MS+SFJ9WWLq5oVbR7Ht5YirMH5w3cLZDi8sfy9s9yMk=;
        b=gDVOv7N53HqoJDhT8tdMUtuwx2qYbMQTTge7pU/49d8/OFSHq09knx94eX699zk1BP
         9d8vTqA/qctNmowvdHgmPlA8qgCfQ3GKqfeDTLm9auMR7fBkjrGv9DVhjhCAJCLJIX7j
         XYW4onGmyPUvn7Y7T6m8mktIY7BSlC33XuuHOJlISpq3UUoLCeFPOebIzzdeZaHdc8RQ
         utZJv76Frcg696M2BBO5kycGFX/CGucMOfzJbcKUOAanDoOWVI1+tQd2AcVc0I4PIRKV
         F+KQUhKC0xavn8QHJvGxrcHNEsyY4WhHoJCQKWuqw7Igc0EDIJc1Z0Ixoq9ALBS+UPeb
         GyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993026; x=1793597826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MS+SFJ9WWLq5oVbR7Ht5YirMH5w3cLZDi8sfy9s9yMk=;
        b=MCjXcXXNV1LXF1jHyjBwKNZAYb2EDJc9GZt24JxAYwgMfn6ucOVTNr5/ewO8Kd6bq8
         fim+D+TeSEsb1Lhch6C3iMfbwpmzLMYxhZE0Jsf0xDo0I0KBrXnafMiovivBijpIjT+X
         dxcmWx49dNyxoGyBwNOGiSKop5U+ddfmR5k+9+BqcJbzXAT8MtrrKu4OTx3PN8nWdCDl
         Z/W2vQrFSZupfMxBJMxua6VY3lxtiLbZNYSaHGocTEyuMA4KAV1CEVavhHmZJsvnuDNZ
         fWhvA+WLe3txQEgx3BUkKkt19uo7Ajz4vujXXSaI5l4gKvDOSgkxP3gmEq4GW9sX+9F/
         xh9g==
X-Forwarded-Encrypted: i=1; AKwUvBxalLyjc2otspPPvJlg+oK5bfvS2VEA0khOmPNELgXgfTSPO5yZLO3ci8id7ZGlyghw0bREoabMDdyNOrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLefLHLLKLrP/K1tsL2P+X3/LyrTCX+hWdudrmSXcngNLfr3Qdg
	CmYfS1pGRJngTr+CcUPgqRTn18h/2t658nmxxSYguahzG6qgvw1EmElO
X-Gm-Gg: AYBFou16VizlutoivtSoxIPiqaXkODivgzcakq6Vkw5OFh7+4tpDxt4P7e96/W5gkmB
	uRAzcldc51CSTlg0XINwh2U+/lb7tIiXp4HSgGFLp5yvxQ7cNRlWt8GicKidBuK6LpyV4dOm3F1
	sk1S5aIyPQfJVYn4XbpgaO4zeNcshpQmscScU5TXT0EeNI3YUkOxPMniSiUNNiHjUmNfsPuF+Au
	7Ij1JPAmY/CgcucN0A1x5/gQSE6oITL6isiYoKoh/Qe70JE42EMn7rDL6t7wUhzqPTw+6CgLuwL
	wPJ11LrR5lAQSEMwfegsMmsZvD3kfDuEG7CHDAeTpEDNDHN5lRJ9fx0jD5JRpIt+zO43vsfHw1r
	Jrw8Mseib+YXhIcz78eWB2ey8DX8LRaQwH9IqZizuSoOmTW8mUaWu84d7cq4Om266dTQWI+AwJb
	7SRJ8aFTWgd2EGOBfN8oCEE5Z3soUKKuxsZirZr4Bf9aFjju6oFRmqxq+kMbmHtJOgFNPUfrDIG
	qNXQUStxfsdj/wVtOkEZy8jzLb7vzyHgZ3CqX/gK/dHzE9sti/HNUUv1Xg659TTGxJBKICRFjQE
	Xu4x
X-Received: by 2002:a05:6a00:ad89:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a36734e9c2mr4408014b3a.34.1792993025897;
        Sun, 25 Oct 2026 22:37:05 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:37:05 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless-next 05/17] wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
Date: Mon, 26 Oct 2026 13:36:11 +0800
Message-ID: <20261026053633.361454-6-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
References: <20261026053633.361454-1-ragulbaby@gmail.com>
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

The L-SIG length of a mixed-mode frame covers its HT part in 4 us
legacy symbols.  For a short guard interval, the HT PHY's TXTIME counts
the data symbols at the guard-independent bits per symbol, then rounds
their 3.6 us each up to 4 us units.

brcms_c_calc_lsig_len() instead divides the bits by the short-GI rate,
which rounds the symbols down before scaling them and uses the rounded-
up rates of the MCS table, so it can count one symbol less than the
frame takes.  Count the symbols at the long-GI rate and scale them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 3a383b0d1..c9a5877c1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -7119,9 +7119,8 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 		 * the payload duration calculation matches that
 		 * of regular ofdm
 		 */
-		/* 1000Ndbps = kbps * 4 */
-		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec),
-				   rspec_issgi(ratespec)) * 4;
+		/* 1000Ndbps = kbps * 4, at the long-GI rate */
+		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec), false) * 4;
 
 		if (rspec_stc(ratespec) == 0)
 			nsyms =
@@ -7134,6 +7133,9 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
 				  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
 
+		/* short-GI symbols (3.6 us) in 4 us units, rounded up */
+		if (rspec_issgi(ratespec))
+			nsyms = CEIL(nsyms * 9, 10);
 		/* (+3) account for HT-SIG(2) and HT-STF(1) */
 		nsyms += (tot_streams + 3);
 		/*
-- 
2.53.0

