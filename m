Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12825237A3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890628; cv=none; b=jYr+UPR0OXrWjT3vGujgwCaw5NyTREJC3yXT7OyPufjh5G1pwp9a6JmT3XEPb5LEwwwNY20iBDf+3ghr+9LavYb0YvPApr4MSr8jJdUJiehnwaz0HXITLQfuJDIPGemtsgz8QB8IFQqoMg3HlTJSYuPNjTHLv99ZkgmM1rP4Jeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890628; c=relaxed/simple;
	bh=QrQloLTgPyBoSDJmlMoitiIti6e69y2BWiWAb6tCtlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N6zmzm2x5eluOOf5paRxdRn4i2AXGiu7wFJRLGM1t2rMiZtusMqqmVHJMpS1RZp8XszCNyglEsKAUZnqf6NHrXzotbqdiyT63XfxweV4jH6vv+ONaEos2Er26woFnNjoDd80ZTG0pU7Q+xWKY5YrYezEzoCym/IE+9cA/NQ6iKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/1IHny5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/1IHny5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de0093c42so4665584f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788890624; x=1789495424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2pVC7S66/1r0QzvP5eIL5EhHuAGtHQbwAjanVNMfirM=;
        b=e/1IHny5j3TlXWKf0rTfiEH/5b/RZHAPye2C8va3JlzONcTNxKWD443rspq9JgR1wh
         2y3YdYd7H6SPTX60OrkS9FFx+9E/LYnGBAeV7iY/maZUNUdfB8xQD9Ql347YLi5HGxuc
         dV9vhoBMeP6cNx+XUZQ2EqPTmsPyyeMCS/V6gbhFipbPT6ZPHASpLMA4A5BIr0l8Wze0
         Hgt9lSnffoHUWeREH43LgIq1+Hu7ujXpeN1drcOIHPAyo482p0BT54gvz+CQnZ1cBemV
         gFx3jd+Wq4D8aDtSNHctbHRNTkr5ly48GlsRuLcWtDaLMwtZ63S9vl+dFSgtmWJjdzGM
         CexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890624; x=1789495424;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2pVC7S66/1r0QzvP5eIL5EhHuAGtHQbwAjanVNMfirM=;
        b=j1PNLLuEnSHCyIq/oEdgN853ZKdsym1Pe+M4+cGI8vHLUOX3UukcdFnOKic2MXJgnm
         gk+xPHO8CEWPv5F+RlfWke3ifz6IZpL6bRDlXDW//O/OJ4jllyuPKJzgkOpPtG3uSemh
         SzDRkwxsfVVYUJKoVkkCZb7SSc2gNoyVUH2qISDnzUhBcny/e8ewhZwoUMAmtYQLZDun
         NEA/uyXm/pSVmy4mwzqVAdNqbV2/IfBodJhiDhe6TsNLOWRKy797RuCGtci1W4QCsXcv
         wfRKe7KaGfdZnyPGXZihWsYGKv9/idliO3ojl90V6hBBE9a+xOOzOmrhFmIb+ZvYIHlb
         D9xA==
X-Gm-Message-State: AFuF++l5q5Cs9mfAuiXn8O0bK7xlD/yjHLOEsP6rP3EwY77UFwnzxNFa
	/4eKWBFeiXM+k54+efRzfR5lNggIOiZWEjBb99dE+rkGzYKa17sNBcE3suy8
X-Gm-Gg: AYBFou0+84sCb0NZLihro4bnQNtO7htD1iHmJuWTZy1T0Dj+SqCn0OVBZ+wHFsFtuX4
	vwe9nFW0av4SsYdBkQ9xSw9dFEtuAPYvICOwxRqe2sXBlwYRIiPvkR3fFC7RxU9rtE//F4dLxIR
	ftnd70xhFmF+1xrgZPvn6HVGd6oYvgstMjD6aDbN0aDUiRGg1Vyc7uh1uC0T7ajuSgAobI2VMqh
	BsKYbOgqc2PqbFFBACdkbBMaylbPUfkcGrD2G33EJZyWbXBED56+Szur7XEU4vfHztXXXmvj6lU
	ibHeFqoeRmpbh6wLL+/1379/MMFS8pJYQrvh0kTJ0I/C9fqpEf+sbq0wZ7asCGLCKJWCrmU7RjE
	dg3YzQH5hdTXPyx1vlMUPXuLruif75gyLnNT1ZjcZYTa96xOWl16vcdBAswA0U6Tx9iUn4EtOAo
	TgisKtA71/l15nO3yOcjQ5mX74enW+9MwE7cpQhryhGrdvRNOMMKGPoaBaou1UrvTyHQJOWsSQY
	nodtOYXI9gPAyzKnLhqxp8qVJBnlEHD19kaZJq4vTzbmSFtsAirG2i5kfvnRI1oIwD5MpHKS8tc
	dCoq
X-Received: by 2002:a05:6000:1863:b0:485:83a6:b296 with SMTP id ffacd0b85a97d-485872b8d76mr36158782f8f.19.1788890623419;
        Tue, 08 Sep 2026 11:03:43 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm37039330f8f.32.2026.09.08.11.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:03:42 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath9k: refuse spectral scan control while the hardware is disabled
Date: Tue,  8 Sep 2026 21:03:08 +0300
Message-ID: <20260908180308.788642-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The spectral_scan_ctl debugfs file drives PHY register writes, and
nothing checks whether the hardware is up. While the interface is down
the chip is asleep, and on the AR9271 those writes go over WMI to a
sleeping target and hang the firmware until the device is re-enumerated.

Refuse the write with -EBUSY while ATH_OP_INVALID is set. The reset
control already refuses on the same flag.

Assisted-by: LLM
Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/common-spectral.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/common-spectral.c b/drivers/net/wireless/ath/ath9k/common-spectral.c
index ca01a07f6630..0bbbef9e3b9c 100644
--- a/drivers/net/wireless/ath/ath9k/common-spectral.c
+++ b/drivers/net/wireless/ath/ath9k/common-spectral.c
@@ -805,6 +805,14 @@ static ssize_t write_file_spec_scan_ctl(struct file *file,
 
 	buf[len] = '\0';
 
+	/* Every command below drives PHY register writes. Refuse them while
+	 * the hardware is disabled (the interface is down): on the AR9271
+	 * that traffic hangs the firmware until the device is re-enumerated.
+	 * The reset control refuses on the same flag.
+	 */
+	if (test_bit(ATH_OP_INVALID, &common->op_flags))
+		return -EBUSY;
+
 	if (strncmp("trigger", buf, 7) == 0) {
 		ath9k_cmn_spectral_scan_trigger(common, spec_priv);
 	} else if (strncmp("background", buf, 10) == 0) {

base-commit: 1d8e73163ef933624341075f576e2f36ef9133f7
-- 
2.55.0

