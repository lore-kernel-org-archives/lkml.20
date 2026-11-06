Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943903;
	b=wen+lY5i5JbdvulVH7sRtZQCFQKaGUhWRn7jC/jRwl8yGg8IobDEVp6VXqtxClFBpSdQ
	 NFP1ig6V7uWlsXdBW9kryG0ErTtfQSrImpqkxuShGNrDL5jJ5YUlHSa82LiPKIUfDXCgL
	 XDXHo99xsm21hGYMJcrdkqFwi6zGT+y4F1zUxL0d0uspns/hfAG/82S650L8rsk+kJi7W
	 7soHPicJWdf3nBhES1XqRIe61XuD4G8eaAGb3DyH8Bbq+TGy0sGaN+PzJSGp19CFyv/OV
	 pQkyJHZOcx1ARrraJwZep7lt93JRGN5cPvG55AqEoJLDPjBoHBMUYJFo+8yvoerrrug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aICijDd7xJCkTfq11nR+yzRU5122aZYdbxC4LCJRnpg=;
	b=OhXh9fv4IFbZqVt2GYsMqJ/PXp+bpneUvIb4MZK+WdzxfyZpj4fvoOHfzUkE8KEY4NSl
	 KDyBf8o4ToNHrp2aqFfo4wRKqfNTSSKATfu+ym2ju1RW8QCz4Q7dfMb5L7MtSPt3DME1k
	 JlY97HxDNgLZmJuEaFeNrdvF5OP58Fe/pTo/rmb9ONUhgXxPYoyPZG0BT8BtBLuIeXxes
	 ptVIKH9a8EcU/S23YV0+kjw+svHbYQp7YNM+K6fcvo+nYPTs9c12pLdOSqUs9wb1j2/Hm
	 Zq3JGbwzdOvKVchQQs3zCDLVZPeGm7i5Rq257R1p7v4UKN186BIaDsm1SWss/B8r5NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+XTIMuZ;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58DA606A33C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C58DA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+XTIMuZ
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso1241175ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943902; x=1794548702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aICijDd7xJCkTfq11nR+yzRU5122aZYdbxC4LCJRnpg=;
        b=A+XTIMuZOsIXKHhMFKxs1APRslKsJq7nlr359txDUw7lVA7nympWDlULP9Pky2QaK+
         gpxqaN1ViX9e89SK+OIS6sywgsBbbSRJ58QWnprFSVME7mDSKOkYa75dCgcLC4r0RyYT
         5b9fSjfsINPBwj6CnsyNsAa2G7GV73PWySJRGcHfOonm3vttkntn/2BGxZVQZzi7TBOA
         yFdtzBQw8DSGwEYxrmk4P4zRzNch1ZqqjIpzBU0BMWOc9oUjV0BaQHqV0McBVYWxsnSo
         qdPojH6jFSK8SCNEcp3LmEuecxB2Csw62Oo+F+0JL73/N1eodJwHgh26Yeco9K3V4bZR
         EbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943902; x=1794548702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aICijDd7xJCkTfq11nR+yzRU5122aZYdbxC4LCJRnpg=;
        b=K+nGyR9pnw1xaa++zsnk9lpDC4isqRi3Szqej7+GqbShkpgRt0yCDhG3VA8UR50TWJ
         IvvXVteR+AbT12Lx4n+y9nBvbujhwbCljjIobcI2tkWKtnmywipc5BdU1hNryerfX6/b
         kVcncRobeFASqwErCxS9GGbiptg+tvwecJY5LRqCjkp+AfBEclYLmiJJut/SbF2fkIK/
         F+bpCM/BtamRJCTzxC8roGHk1EfQ3dGeufwZHJhDMN2kY4+XEi2GgKKDAeiMxARLlKvI
         9+GWzxmKltttQkXEr78KbUFc4fQvtYdAxjh4kXim/P3lj0d3OlBRkxygmlrRpr70hLLd
         5DLA==
X-Forwarded-Encrypted: i=1; AL+hErFsvrURi467uhDFjpUSNhgnaXs4UQ2fQ8xf1JUhqHyxFVksU654nj7ywX1zxsjaQdFss1DcBxAGt5nPtlw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VPHqjVtZpVcsATHmy6ZAOvyX08wn1knRbE3jL8XBMtC/PUqAZ
	1b7j4mCM79mApHK+bqf0FUMHJ08YD3DngUmhgC9673Xa+nH9P3NI6cHE
X-Gm-Gg: AYBFou1KZsnoyFdlLqIBPUIkT2Mlsg3iAr6DNYXxb32fZZuODGyoByEFefhjWXWiwKf
	HPvl31EcKMwn7MvTdTRNfJc74t/WdZdbMm6/AIZBePB+xCfWXnBtK7aIbrLXD+bz0XnBgohaXGR
	osgNvXpzlHu/42CcC//eINjUIikzL3RwP2KzejszS3wrWTdkWIxHyTt27XuU3jdoWAOvTA0SK6K
	9DZZzOQ3420R5Ld/1OtRE8/KPxEfIhx9BzVSccZm7GCKVkvAkWJRPcPNshfYU74hR1DW9t4LSvN
	V5eu6U9/4oM5HKuPubayY2KLyZHaFEmLAVd5wLYsS3AyxfttneiR81mFO3Ak93yhGUJKI7TJMx2
	yeqGqodsDxAd309OufMZu9BhYCsgl3ajIZlk7OSI/NSA5su2xLERU5T6TzrRsCiYDGiO5zWt2LR
	HmiSIh9EOF1IHTXflD1WI2YGQ6xA/XTtB8v9tAeKkEbriCCF4OxIH+4S7ANy5pGvHuysOh8NV1R
	hgNZyExmrFclugob78SgEgNxrDH5TDaA9/4IpxyFBJQGBiKnW53Lx53aW1mGuH1z8Wm/vOaAI7p
	jOrjAmcPn1AfXLKeTxEXrICOEzbXVtsC3uqpKtgNj6iiidSQ
X-Received: by 2002:a17:902:cf03:b0:2e9:7190:32e3 with SMTP id d9443c01a7336-2ed41bf64cdmr19435685ad.38.1793943901959;
        Thu, 05 Nov 2026 21:45:01 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f7cfsm1756635ad.48.2026.11.05.21.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:45:01 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] ASoC: codecs: wcd-mbhc-v2: cancel button long-press work on deinit
Date: Fri,  6 Nov 2026 14:44:47 +0900
Message-ID: <20261106054447.2019214-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106052242.2000264-1-hj351016@gmail.com>
References: <20261106052242.2000264-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

wcd_mbhc_deinit() drains two of the three works embedded in struct
wcd_mbhc before freeing it - correct_plug_swch (via
wcd_cancel_hs_detect_plug()) and mbhc_plug_detect_work - but not the
button long-press delayed work mbhc_btn_dwork:

	mutex_lock(&mbhc->lock);
	wcd_cancel_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
	mutex_unlock(&mbhc->lock);

	kfree(mbhc);

mbhc_btn_dwork is armed from the button-press interrupt handler
wcd_mbhc_btn_press_handler() with a 400 ms delay:

	schedule_delayed_work(&mbhc->mbhc_btn_dwork, msecs_to_jiffies(400));

and its handler wcd_btn_long_press_fn() dereferences @mbhc
(container_of(), mbhc->current_plug, mbhc->jack).

wcd_mbhc_deinit() frees the MBHC interrupts first, which stops new work
from being queued, but free_irq() does not cancel a delayed work that was
already scheduled. If a button was pressed within ~400 ms of component
removal, mbhc_btn_dwork is still pending when kfree(mbhc) runs, so
wcd_btn_long_press_fn() later executes against freed memory
(use-after-free).

The freeing of mbhc was introduced by commit a5475829adcc ("ASoC: codecs:
wcd-mbhc-v2: fix resource leaks on component remove"), which switched mbhc
to kzalloc() and added the kfree(mbhc) above; the deinit path cancels
correct_plug_swch (added with the multi-button support in 0e5c9e7ff899)
and, later, mbhc_plug_detect_work (added in 0c105997eefd), but
mbhc_btn_dwork has never been cancelled there.

Use the existing wcd_mbhc_cancel_pending_work() helper, which cancels
mbhc_btn_dwork (via wcd_cancel_btn_work()) and then correct_plug_swch,
matching the other cancellation sites in this file and ensuring
mbhc_btn_dwork is cancelled before wcd_cancel_hs_detect_plug() briefly
drops mbhc->lock.

Found by code review; not runtime-reproduced (requires WCD codec hardware
and a button-press event racing component removal).

Fixes: a5475829adcc ("ASoC: codecs: wcd-mbhc-v2: fix resource leaks on component remove")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2:
 - Use the existing wcd_mbhc_cancel_pending_work() helper instead of an
   open-coded cancel_delayed_work_sync(), per review - it cancels
   mbhc_btn_dwork before wcd_cancel_hs_detect_plug() drops the lock and
   matches the other cancellation sites.
 - Add Fixes: tag and correct the commit history in the changelog (the v1
   reference to CVE-2023-53842 was inaccurate), per review.

 sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1623,7 +1623,7 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 	free_irq(mbhc->intr_ids->mbhc_sw_intr, mbhc);

 	mutex_lock(&mbhc->lock);
-	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
+	wcd_mbhc_cancel_pending_work(mbhc);
 	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
 	mutex_unlock(&mbhc->lock);

