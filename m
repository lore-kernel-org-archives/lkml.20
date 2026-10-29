Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281715;
	b=x557FgnDNbs/X4RaAiVV1nHfeLTGaoytnUaWg5+X6flLIRDu/rMRn9Fvg7yXXkVU/M9/
	 JFW0vFqo3IVWx1Bqzo/XFLBBdmJl8OTO4V+yMfOZi1e6Tg9wfJN0/Gi/6IgaB26nKdaIC
	 fb+XMB/UjhXunwRcJpuj7joOPM3tl1I0aTgleEuurv2pysZZcU4k/voiGfn2wpdutnBc2
	 iL5KjkJFFuUz+uv1nzJ8QXNhjIN6+R7VkmVuMZEcI6GoS0mvWj9h3yI9hvHKrVMRA9l7x
	 Xmshjg0uNp6eDGbJP2M7wIaScpOIWMajUQ0+Aqjh9nZM83HqJoFcnuNJKq2lJmYTb8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6FAsT6Nlkq5SUXzwLZ4CbonJEIj4q+1xkqhKuzZAeQY=;
	b=5d0QibL0rBdVAooamGsxX0OgnbQN1Cr7In8rdLHgD/BdwjUmeqq8wPvtMzpYDz7UgAq2
	 Jw2uB/j/hL1rQ7pWj391FbUKaRW2IBJvPQYVNvO3ueN4T1MNZvvSq+oL6DiJHkCNjRb9A
	 0HqyDR+xS4Y5lWSDvkWmlcdviPZv1iS9RJaXFzXM5ioF0t9IClVwn2fvQWFb1hc0heEHL
	 6TXxnT5bT4p8vOjO8Zi8o52EPCt4s4UD10gFtzXE9bVs6F42pMJBsnHa8S0R/eCYZ93gd
	 dKk/nDAOB9S2+fFLHND5Jf+AJfURn4mZtm4n9bgsCg4BH21p6cACbbeiDl9XC1uzhUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNlZcfKi;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E1160A2634
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3E1160A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNlZcfKi
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-89d6bd67045so404756b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281714; x=1793886514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FAsT6Nlkq5SUXzwLZ4CbonJEIj4q+1xkqhKuzZAeQY=;
        b=vNlZcfKiFrbQWMDu8AtkAr0fe8dfBLX67ScNnCxoD7c5ltOQQh5auiFl+Xw3ioGBdD
         KPNqTVbjBhuUF6bOY0v5XquFBKifXPBzinDIdyhXLWxKyZzJ+dJ7goCKn3jVmN9c3xCN
         +g1doY10A3A6JuL/5FPEW4Joqok0zTfa4T750ZJWbAuXRZBZ1QJJMEU6SDrTfUb2nod2
         NShddLvb/Gi8qIYVctWei4cAxh3xW+WwpRFVBgx6wgp3f8SsB6d0JaM+3z5WLTtvUYvp
         s1PnH10J6HLpl23vzemaRprMHNV5XYal6uZ0lRXY0O2dfXnebVaY/+kOPMsy2Ww7UBZN
         W9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281714; x=1793886514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FAsT6Nlkq5SUXzwLZ4CbonJEIj4q+1xkqhKuzZAeQY=;
        b=dsIliOTfw+wOfOxRUV4Yorb79SjwJfoqnNtDbCUy8PM+waazIszhb34gfx+b3epKUf
         ZJgtyXWWau/Mgv59kfHYHQoEEDFowtCnkRzrGTgrn+LL9g029nKsQP+tcTtKKlcoFEK3
         swyAoJaZ1DYqR4toDsnQlVMrWLd0KVj1To+zaghbbdhQ0v7WdgtQKwqEbU7AqvELNvvh
         X7ziwBe4/h/ccKCR9cN1fSaI9rSfmgoi4LG/hkN4EnmUEpInTCbwQl22UY4bax3xy+cC
         zhazBR9JU2e5GJitCX0k8XLdjcgEYMAdmPzR1w1cn5RhYSTlQ8zl/nMA7vCR10U3dR7y
         hXBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyUGKeMsZD8MjvBZ4OlkZ4w5iSYcDc6AD/FTgWaSIVo11tafY7lZSDh3KuzLVm16Q4CIjZuQ3H0FYNaow=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXc2ebwF+ggF6tfuqKs6S2gbXDokQ+ZLbc4Fve0yTEpCo4/EIH
	nzwuZFj1fT7NPsHZjfrDvx9ryCMisI+0fyxC7ojUnzPN1MfysgRtLosG0EQKTHYQ
X-Gm-Gg: AYBFou08t4QXMBUhK2NnXUHPO8Mty0dp/n/7pKYnIdxqzvcVIIhfshm1cUARNPdIt4Z
	3uSPstdqmKs17gxqyWGKtKmkm+Bqt417PpJtzBH7uh8Qy77DKWna9HYejOFVNstXx71a/dooZ4B
	1zAi3P9kSTTETijAJDF9hvHdrpMj2AgWIPR+QSQNxSc1BMD0dCyycVmGtvj919JtxQ4zaawpenf
	3ISJVL52qtzuWxXhGG1j9Nvn2CZvB2lqH+H1VGLOOdVDi+pe6qAkomY/MLuYb5K0S+v/Rp6vof/
	thhvncxxeLwB+nOb78O5ooya7n6A06sdNMqoGe+YV4T57I0QbocCv6J8Fiphey5z5fF5VccmaKA
	bVjnek2njQO90IKRt6UR598NSP1oJytIPM3EZS2vptmI34QienVRn9BjVIPdkEwRDOLwCULyMyD
	GStPnYdX+SClWPjhNG8sr/Wxn9hcF1FvzXBGMy7FgLoggR1TJbUUM2OPtV9vUFk2fFiVoHuzvqS
	brvvpTvlA4BCbywbJZ+uIqhKmIQ5CCkiSKkZCbf9UvhZMhm05sWsQVvgPqkpNrjtUDotm76XhVP
	3xX6x8y2j2f9J5QFlzeMUNsmnG0Ufb+dVhcX3+SD3ij/JleIMT7xAmgGfWdwHYOv8ASyaqnGQhq
	o61o/PGka
X-Received: by 2002:aa7:8613:0:b0:89e:37b1:b820 with SMTP id d2e1a72fcca58-8a82e90b2a2mr1414879b3a.2.1793281714328;
        Thu, 29 Oct 2026 06:48:34 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:ab4c:c3be:c4b6:67cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5baf4sm2455023b3a.1.2026.10.29.06.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:48:34 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 5/8] wifi: rt2800: don't report an A-MPDU length to minstrel_ht
Date: Thu, 29 Oct 2026 21:47:46 +0800
Message-ID: <20261029134752.1299130-6-hjf3108@gmail.com>
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

Set IEEE80211_HW_TX_STATUS_NO_AMPDU_LEN, which was added for drivers
that can't report the proper AMPDU length and record this workaround
below the TODO comment.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 1 +
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index de234bcc7a065..032cd6ac345f0 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -11860,6 +11860,7 @@ static int rt2800_probe_hw_mode(struct rt2x00_dev *rt2x00dev)
 	ieee80211_hw_set(rt2x00dev->hw, PS_NULLFUNC_STACK);
 	ieee80211_hw_set(rt2x00dev->hw, SIGNAL_DBM);
 	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_PS);
+	ieee80211_hw_set(rt2x00dev->hw, TX_STATUS_NO_AMPDU_LEN);
 
 	/*
 	 * Don't set IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING for USB devices
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 823785088a308..66094da07325f 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -373,6 +373,8 @@ static void rt2x00lib_fill_tx_status(struct rt2x00_dev *rt2x00dev,
 	 * by the hw we could provide the real ampdu_len to mac80211
 	 * which would allow the rc algorithm to better decide on
 	 * which rates are suitable.
+	 *
+	 * Currently, we work around this by setting TX_STATUS_NO_AMPDU_LEN.
 	 */
 	if (test_bit(TXDONE_AMPDU, &txdesc->flags) ||
 	    tx_info->flags & IEEE80211_TX_CTL_AMPDU) {
-- 
2.53.0

