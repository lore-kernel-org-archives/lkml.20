Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148068;
	b=TVK7IrHnAyLSc8r27Phv8pKCC3Fx/9tb+UJIny3dsx6XCVbCTHX+3LpoO41xRkx7j1YB
	 nxN48majo1ESkewZDOrG9frnRrQGI9Y73j9LLKmZXsF4tu4amX6g8pio/Io+s9S4tlg2t
	 95jPthMSqIdzGrbzZlsRu88zWZDgjnnEp8M65dCVkA1w5WsTWuKFWAoaNoE330IGIJwSY
	 h40tLMwKEoV87kchsgzSh39VFBwGNM+2dArzorM6maDKonZQzyyL1L9665XiUFGu1DNNn
	 fDgkFqQ+MpCuZaNKiBmipkT+lr85/bwrc3dgRbHW9y5rCJp63ahEpyCW0dbQgyKVkBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
	b=us7slsn0BydXmQyYcSpRZL/g9fZTqp33OTbBS+qEloBhlq7R4jYNROL2seLzQq9s2LR8
	 h62I6RvBoaSZJwP2sdj4tYnmomPNaHCrZHKYCIWZqElv1HvzBUTfQ6QuMoWA7E2tQg3R3
	 +6Ad9hy6DdIUDYWBA/xG1yUhvsT2O53ZDTKH83pkKNIYIjiCEOD2TAil3Q6OgoxNmhYg+
	 glFUrvDjVVRw+RGOVBbW0T/dM141Paxp4gS+BRNrPJmhRtH/cGxyn4HQMpEqINBRv3okl
	 TLfqg4aNKguqBCXjMRTbDufBKp6hwrUF4gClIUnk4LOXIminWyUCtUZS0fW6Hx7IGcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vMSfCDAx;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D37B606A33F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D37B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vMSfCDAx
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so164075c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148067; x=1794752867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
        b=vMSfCDAx7Gttf61BlOYJfcVYE1BYD/36paanqdJe3rmKlEi4ZLd8/dmhbIEy8fawvX
         WPi+isqj5YWOpxnr3Fslgn6U+E5e2Fw5Ya3BBUVycQFz+YU+S3LyeS2zVC+laV4rl7Ln
         fAY1OEc1HoEOfQo9jYGJAEEjZOCKCy8rFLwRT15fXJd2DNMTBZ77w8s9Fnf6rAPxWiCc
         AqGJZgeB3UspKNZw2CeoaKSYjj1hTfpfX21Mfms8osbGBQsgKYzzylTEEGajjihXFbxm
         q7TgSnaELTqObetYL/2Ld2vtzOMoUeJoImj+S/fS+1nizTLQZfGq7I6WSHDFm14qglUt
         8tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148067; x=1794752867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHv1Jqi7GXywnb/nW9IKsLC85UK00ELbr2eA4avD0lg=;
        b=evnWhI3bGwNsOh4zADDE0R9W5XuqLyur/eD8NVqf1ax+U1NTOzb7jHURUPGdsJJ+gQ
         GSq171G0oNX31G1E11BGOTdgLgCwSKrMVZ7V2aS0oGs97LbhpfBlHYTg+Z16TgGNCP1P
         7AIqbiQPYy+EVf4RJSNfMgqmZ3B3AZnx0/rSPN07jYoaysKTxggsE371JEHaDVNSA2MZ
         qLQkycWARXGMD/71GZsO7TCb/GgY2JvyIUM4HpwK+Cr+vPr3gwmQlPniOHGw1UuNWH5v
         LoiEl8gkMott/V4o+Bnt1ZR8EiOsz22Oha0dXbmXeBYE244qUTTnF8cjSPdaArLtitRt
         jGKA==
X-Forwarded-Encrypted: i=1; AL+hErGydNxGaHEzI3lVjyYHW+/qP74CkxZqHqfWo/pwEfazmZL/ahfJS7g69Hg/++PCMSgAJ/bzHzXt0xnMhfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z789BnfbPsJwFAyzTV4pgEthjNGu3R8BRSuqPdZiF1/35y+Ao
	73hMj8OT6V8SOMJn+y+u+Go8Qsa5xrflGAZE5+pvE3n3FPLgZ6xX2+hY
X-Gm-Gg: AYBFou2LAy0g1rqH/DmihFZdMWIAS9vDYqgRGqjBZ6N4lXa9+d/n2VzfaUGYaSFV5+Q
	Z35d3O0B31nD3YjhRuO/6r8bKxgnC1OXFqm5jtM8RRopqkvF9Qqr3S89sGwZtCY+QLuBtXUlEXW
	k6hxc7uptMjR2JINHJwDdnwARxEzNrRnO0Xi7exB9x5gykxo0DeOsjxS1/UJq4WlT/zm81iI31X
	EOcnmXz3TTgLWILTUjuyv3ICTSaCIaUvipTcZ0hG742zN97kjVjxRMWcBvj5gwigC0GwhIpDbbP
	8+AC90BTlwmfLasFHLD/MBCX2r9+DYcV3QzIQw4sDMfhlQBsffHdiMzJbTD1O/kFQABzWYna5So
	rra/MCzqwhiQXoHvJUgE0t7kcUJwhc1yQCz9PVkYKHWOEOfk7K1QvIw6NZikskfI48fHCCjjik5
	nlIIQcxTlVfGhjAyJajng2ga6w/O+eYr4B11ELeVqgw4edKvv6NcVF5sqZaRZvUtYT7ReGy6U3m
	8gmBTI3f09ugU46O8YCu+PCluu/4+Qsng3NlhUKEKHWytgKo7Y5TnfnlUCsrj/WivHEpXJl5ndc
	xMbEYBpVDOk+o1oRw4QUXyP7L6AF3KdOHhv3+KQ=
X-Received: by 2002:a05:7022:1701:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b39fec8a94mr2165816c88.14.1794148066707;
        Sun, 08 Nov 2026 06:27:46 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm7141347c88.10.2026.11.08.06.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:27:46 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/3] wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start failure
Date: Sun,  8 Nov 2026 19:57:05 +0530
Message-ID: <20261108142708.489067-2-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108142708.489067-1-skalpesh942@gmail.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com>
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

When mac80211 stops or suspends the device without WoWLAN,
drv_reconfig_complete() is never invoked with
IEEE80211_RECONFIG_TYPE_RESTART. If firmware recovery was in flight
during this transition, RTW_FLAG_RESTARTING remains set permanently,
blocking all subsequent firmware recoveries until the module is reloaded.

Similarly, if rtw_core_start() fails during drv_start() in a recovery
restart, local->started remains false. When mac80211 cleans up via
cfg80211_shutdown_all_interfaces(), drv_stop() returns early without
calling rtw_ops_stop(), leaving RTW_FLAG_RESTARTING set permanently on
hardware that failed to recover.

Clear RTW_FLAG_RESTARTING in rtw_ops_stop(), as well as in
rtw_ops_start() when rtw_core_start() returns an error, ensuring the
driver always exits the restarting state on error or teardown.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/mac80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e..ffd86f08185 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -57,6 +57,8 @@ static int rtw_ops_start(struct ieee80211_hw *hw)
 
 	mutex_lock(&rtwdev->mutex);
 	ret = rtw_core_start(rtwdev);
+	if (ret)
+		clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	mutex_unlock(&rtwdev->mutex);
 
 	return ret;
@@ -67,6 +69,7 @@ static void rtw_ops_stop(struct ieee80211_hw *hw, bool suspend)
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
+	clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	rtw_core_stop(rtwdev);
 	mutex_unlock(&rtwdev->mutex);
 }
-- 
2.53.0

