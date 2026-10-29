Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281717;
	b=w6AlMJvNlzRjEAC9z99QmvpCE9REiWJiYEIJlxCWMU+PZqE4bxLby1MQt7nqjPEy2NjJ
	 +ULLEicvhT3lnzdAFY6gOKwAPwoZPhLc1P16RfKnlk0NJPjuYwV4oOxzlAYsxpo/VGGkD
	 OxB7PhvqE+/aguj8nqYXnW/08PVksTHEYUUWu/tfBS/mEaixTNh8fnqXIEnqo9zBFNuCr
	 mTVdxMhd5Nv4cKMstWLkp+uLJJUAK9IP9pcdrF/+Q8dxv19w4ZqRRVdz/9cCXhbSdeLuM
	 7OJZCc4RTUspKCwD8rmM8N+05DlEgdU94rNHKBEY+3IuI9pK02tOW/wA9lWrMtVCLnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lTNzjj5RXp4oZpl4oAxMzOJeDQHpmOcQuGYre6iPlX8=;
	b=2/t9c8uP002HBRcpC5Grmfgafh2bxWY9N3Sp/AtxeEMraHbQVQ+EJIdR8tPMmMMd+8Un
	 k3+YGPO1sz89iyiD1ZReU9aD04s07jNI9QdOzcjVXu7dkAvCQRQM8PsCMYC1B42LS+6OW
	 9t32hUZEvtQkU8RajQe8rbliAl343PF8cZmfHp43PcDMBj1WTyKEOf2ain1L7HO2v8RDv
	 9hgu5zu1Icv0OHzyPas70BYw5fwdWunpyeJaWTbsljl4/S8Os8RYnFahXT3JqiZupC83m
	 +M7ENRmZMvwbsvucdyILe1reVNxhEE1+mazAilAeuYNBGYR5mFcPqn8yQkF9ln4MYMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XHU10XTY;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A898606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A898606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XHU10XTY
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a06210b29fso1103885b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281717; x=1793886517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTNzjj5RXp4oZpl4oAxMzOJeDQHpmOcQuGYre6iPlX8=;
        b=XHU10XTYOELX7RDqGgN+sEsm81rhvRClEAGzhxP6NgcUjO91e0vUXDaAEhrTSdHVbC
         QAahsvwFDV0Ga/bWysK9toNAzPv+05T5MNFinUS1pRsEXLu9UH0/x7ITjFVSSuHhzsS4
         RIjhCu4jACBALzT5iaBXfbC+vpUL45V9ahl4VeoRPRHZTywM+xzM7+mUkTt+3FpNeuBz
         tvkEC5t3Wyg4cQB53HVGzMjgDy1CGUSEZvDXWOOfmHqnpqwX1/nuJ5VQHed/5AZndNOG
         DQW1iaOkeEJ79/c4eLi/QIdXN9owq2FvJ92BT7i3b1njuM9jZik2zwrIzPyF/TxMkcDo
         NULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281717; x=1793886517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTNzjj5RXp4oZpl4oAxMzOJeDQHpmOcQuGYre6iPlX8=;
        b=NNHdFaf2A2It2grJsZG4+H4pv73Dv5s2D+qr/f7NqUyST9MKcXqRFGbTlOsulh+MmX
         NrKCYZwy5MkWRg7WsM2HIjEu9CV8pZOw20wK5ifq0N5Ht+0XUtOQa+JDxGmi7gdQQugQ
         w2V54x0J3WWdrW3lQyRPc0EfcIcIz5q/O/wUEgtpEkEsvzQacyHbW2d0QfyeMGrC8O3R
         VCmBDK9eeOdVSgug24HGBSyqLYF0MFNwgzumikbHZ8FP0fw6rJe7KAv1aLOU2lWocuQQ
         eygVUlgI6oOc3+312c9dV3EbX5Pt/JUHlFBqvcsRX19ixw54VQUZyAQHIXuPE5oZ86I0
         hWpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxME9W8LvX0dZg50uv8jwP4rob13B0vm85u2mrLirn9Y2xXs+m8uyGEG7459RzGpTNjtagLnRwCEBMK+yk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaXRNp0LcGvXoe+9aAbFYjIy19n2L5imMXa//i17waRuQHGUjm
	ZUMYuWQFwiSmcgcd6rdrHCOk1FaKBXPrSJLUasLJjbbV0/cUSeepG4KZxchK+87D
X-Gm-Gg: AYBFou3SblE63aeQUTqSSh2yLM0e5hTkFVPH72HMJRrbDZeXRWYTmrLUziUNGrxizHM
	68GBiSQ6778GOu8iebjCId+vGHal6jswT0cERlEhotK4AzUP5c78bc3b0ZE8uftAAg9XKyMdcJi
	YHQwVjNFsftj/4ZmbQ2DgEgOP/kxMLCn4HqxbZhP1x+UILcjTO579ZpVLt852Tt2YgJEdrCqdXD
	Nq8nrJmYMq9zhr09QVY5BXuAEAZHY9OraswLYcZ14fs63bD44ygZaNP8OGeSwxI33o7QF/zSr06
	wkMbo1ape+vSzhfbSD+5aESEfN74s3amWmhyCsAK4e8NTpGSlemHFv9B5Yf+eeRxc4D1u6yK0TR
	4JHfFlhhBUXYRPxE04Ai7YN0Eyu2HMuCQKnunSE7VEbGzSYcVhh6lUncLgfSlgAZpsyzNNsKeBh
	rPhr5IwGsxMYQLuZ3ZiP/pGRMfMP2A9HRmgvbiHlmYmjgofufLELqVqVvK+UANtEB+DIgDx+OWS
	wu9VcxmjEXYg2ZXrW4M5oU6sE0dTz0DDWRImMpteN3Xw8TQDCNeRqSYUhb+tYU+PVbCP03odrqa
	ZZpp9TnbQ4Yp/8yi5e08e8HE2DIF4Oeq8SB0l52vqmSGD78CFMyhrIlg+nJ0bVydQ/RC0VaKcUI
	BIGHcS13Kuh6bz8A6RqV5ihQgTBnthw==
X-Received: by 2002:a05:6a00:b56:b0:899:394d:2976 with SMTP id d2e1a72fcca58-8a6e78d158bmr4556674b3a.39.1793281716645;
        Thu, 29 Oct 2026 06:48:36 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:ab4c:c3be:c4b6:67cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5baf4sm2455023b3a.1.2026.10.29.06.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:48:36 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 6/8] wifi: rt2800: set the mac80211 fast-xmit and aggregation flags
Date: Thu, 29 Oct 2026 21:47:47 +0800
Message-ID: <20261029134752.1299130-7-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029134752.1299130-1-hjf3108@gmail.com>
References: <20261029134752.1299130-1-hjf3108@gmail.com>
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

Enable AMSDU TX/RX support for this driver, which can increase
throughput.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 032cd6ac345f0..8b4458a74d33d 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -11861,6 +11861,9 @@ static int rt2800_probe_hw_mode(struct rt2x00_dev *rt2x00dev)
 	ieee80211_hw_set(rt2x00dev->hw, SIGNAL_DBM);
 	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_PS);
 	ieee80211_hw_set(rt2x00dev->hw, TX_STATUS_NO_AMPDU_LEN);
+	ieee80211_hw_set(rt2x00dev->hw, SUPPORT_FAST_XMIT);
+	ieee80211_hw_set(rt2x00dev->hw, TX_AMSDU);
+	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_AMSDU_IN_AMPDU);
 
 	/*
 	 * Don't set IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING for USB devices
-- 
2.53.0

