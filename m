Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387901;
	b=cdFs0EdhMpCGU6oKgeS2UQORn/B2HKRdhDHbLnrmbxpameyEPNHvRH2F9H/IxhOdgtdp
	 F6t6kMqsMcCjfm2fWdaXLfC36T2IK03vpScy67h+IE+qqfcCPQTO01kUPBnpUXnHCtTwv
	 ThKHBYzbo62eO9yrWIV5wpevzg8CKQ8/adHCdW1gqdbHe8qP8ZVLro3rY4wHML28IVDnw
	 S1GoIzPB5uL6E5+PNdCqfcKOm2Ow1SOE72j2X7RgBzXa7FLjXiqOaXlPYxQ+dZEFovcnQ
	 waMLVbztOSP8H0QIb/TlL1mjT7hAWuKPsjKykYAEDtmkLJKMNIwy+d4M1FeQMaPy39Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lWvHlJP/BhWXCtzu8EBRNTpvuRwa2bkgzs02+RZsqMY=;
	b=uSm9y3Lmo8Efabzv6ETO/rFS7ArKojN2MnI9OjZEZ3W1FyPZ70uVD+3r8FJkvIvRwgNI
	 j8vvS0fx6U+JO1xLEv47fPJ85FBHKRYe5zFo5N3AGawWgPn/UAY5g1N8r5ILu0K85NtP7
	 nf+jBhbOJzo1tf5McTkQnyzgyhteE7ZjhpGPIcIN0gLnKRJ0XDKKAJt7a2SiXfZmQxuzY
	 AaY6KKpwxEwR78bcDTT1t7BhiatKjACCm+jrJLwpZ/dR1UA+pO5iGepMyHrKS364Jcs07
	 9CkR3jeApfKD+SQ2RFaVdRlXpNAW2+Qt69EoU02gfuStXRw6fY50x4e3Vi5QHNBodcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSkSDtEp;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D7460A2601
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D7460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JSkSDtEp
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3704d30b84fso3781321eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794387900; x=1794992700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lWvHlJP/BhWXCtzu8EBRNTpvuRwa2bkgzs02+RZsqMY=;
        b=JSkSDtEpMeWO+FjL9oZ11YGGFfiza8PqjVEz02vDfborSl2ArjiU6T7kiZvSti2uRv
         JXWJcA0sRmc8xsm6KiwPOrokbNO5aLtOsm14+va23tDpoQu5bAd6CPUxCHkLO1aAuj/F
         LCgd4VmqZ4tzOu+EcJGUkTBpDk/2x6gKQd6Iwn+9qwl/cWh16Nlm8gcoqUBWz/rvZv7x
         LZm+H7GUt6C2489UZQ3GZeO9tXk09ysy+OYGIozg/YI7/z8npcL2+smoEs6XWtNtMfW6
         qF0/TYBEIVJcB8nDs/GWEDw5emYryvRLNQWH7PMl4yByiOjdWMrszAk5bq1hinAuVOKh
         LdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387900; x=1794992700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lWvHlJP/BhWXCtzu8EBRNTpvuRwa2bkgzs02+RZsqMY=;
        b=Q8twkFZ6IlDC+E+cB5ojhnJTPrw8oVDlGisc2HPDDZY1+CSrJ6q9rxZ9lOOqhgTgOK
         h2W/0a63xph8s+d8mYI+HkgK1Z/tRy4XX5UcGlbN5o2qXuPkqPw6Ed+FK5dr87BVyh99
         +j9HmcmxQbRwWeqfBCqSpnKs7MibNJKdcs7bqP4aPhHFavpmOxsgf+JWl7lRpTvwqoge
         274fDMJoAOoZ7raWXNa3snIX8VzD4WfKvMvA/+et9K7seGkaIUUo9kf7xQHa1GbzCMtO
         +g67LbhE8zkjuXNuFQyDm7hO4PDcnU3/qVoFpbPesgLRAqaWFZj/vEmPUYlervLzJj8a
         9iKA==
X-Forwarded-Encrypted: i=1; AL+hErGbZonDtxkteeDydZovGuf7io2sAhIulbXXGQlc+7m3m3tG158jby1dT8pJlBKOJpRZtTCIfjUgRdxoMeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vor1POtF5P3u2d4cZ9mTPcysMYwe1QmfFI5cE95SHuM7JZeTq
	OGPL9JmgYkObCRJuOjxJqvoWvuN30aGUTH+WYBp1viVz9NVX01V74K+/
X-Gm-Gg: AYBFou1CHiwX4vmAMnX8La8E8o0XZwtdnkajKoXvUzsRc07rcyZgYu4VrY3srih+p8F
	CiZQh8u9ffmC8MTwcWQK4U6L+3JCXZ4RcApXyOJXLrPr3xJa0FE0XXTCkTNZ4kxmKXJckykxL2d
	uxWC6yAHlgcHK+iI+xm2MvaVnEAIieStX36tBzUY1y1uwtYrDOBRNXfzERJEVIvctNeKivlA2XE
	Dv6pxT4I6EFdm8Knocfju+IePpqknf1S9ftVTNYm8TqYOrwD2PIPqtoaBd1EL9HioVgTK+afgAZ
	+MNXTvOsju5peyRuVMzRVWrZxqnKAKIH3yc+sD507uFvJCG0Mm7zRiwba+Mcs+rr800lrKcr88y
	7rGgFjcKSx5rMUd8SftudAF/yUyCz2kmVx0thHCoK9yMDL4t0qQ8675Lrcf2/DJY6GZvG6OOL3e
	afB1ebxTxjhwqGwqoY8Q2xkxV8iN8U+srqi3UDmOX/wmnLclAFMT4w4LTv6gyL1c0jAyss+rWBX
	OAxmsz0Z1pW3pARCBkJ+HyV/SBEsQVwl/89pdVLEk9X/dw2fBX76d08ssKjWOkMHLMjSOV167uM
	URLoR6staGB5POjIhXyJ7+e16HInx15zKWcieAcxInEGU7rd
X-Received: by 2002:a05:693c:8012:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3768385dbc3mr2405165eec.2.1794387899983;
        Wed, 11 Nov 2026 01:04:59 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm14180891eec.6.2026.11.11.01.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:59 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kaixin Wang <kxwang23@m.fudan.edu.cn>,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] HSI: ssi_protocol: don't cancel_work_sync() under ssi->lock in ssip_reset
Date: Wed, 11 Nov 2026 18:04:47 +0900
Message-ID: <20261111090447.3047656-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ssip_reset() calls cancel_work_sync(&ssi->work) inside the
spin_lock_bh(&ssi->lock) section. cancel_work_sync() calls might_sleep(),
so running it under the bh spinlock triggers "BUG: sleeping function called
from invalid context". In addition, the cancelled work ssip_xmit_work() ->
ssip_xmit() takes ssi->lock itself, so waiting for it while holding the
lock can deadlock.

Move cancel_work_sync() out of the locked section. It still runs in
ssip_reset() before teardown, so the use-after-free fix is preserved.

Fixes: e3f88665a780 ("HSI: ssi_protocol: Fix use after free vulnerability in ssi_protocol Driver Due to Race Condition")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/hsi/clients/ssi_protocol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hsi/clients/ssi_protocol.c b/drivers/hsi/clients/ssi_protocol.c
index 7c6ca8391a6b..96c20850fd66 100644
--- a/drivers/hsi/clients/ssi_protocol.c
+++ b/drivers/hsi/clients/ssi_protocol.c
@@ -397,11 +397,11 @@ static void ssip_reset(struct hsi_client *cl)
 	spin_unlock_bh(&ssi->lock);
 	if (test_and_clear_bit(SSIP_WAKETEST_FLAG, &ssi->flags))
 		ssi_waketest(cl, 0); /* FIXME: To be removed */
+	cancel_work_sync(&ssi->work);
 	spin_lock_bh(&ssi->lock);
 	timer_delete(&ssi->rx_wd);
 	timer_delete(&ssi->tx_wd);
 	timer_delete(&ssi->keep_alive);
-	cancel_work_sync(&ssi->work);
 	ssi->main_state = 0;
 	ssi->send_state = 0;
 	ssi->recv_state = 0;
-- 
2.43.0
