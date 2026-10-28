Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793160216;
	b=JLEXEGUd0ddeZzeCmxJV+n5RttVErfSmidpIbkK+Maq7adnq8NKzHWFQpEO1+kd8ug2f
	 7kDp5ZlxNYduI3FQpwcDFuin+5y8p4LMSk0/OhX8YJKeds/15fx/UBU7W6PPhucysA2kG
	 hfvnEFUcPYRVHz26tkpriuW7ODqFhN8bejxT0VGLnG8oQLYN8sjePyilZV3hVEcknyAbQ
	 wsSBQO6ljCN0KVmnQz8WxtD2JNu6lRdG5sQNOh/Qww8GFgKYAA90KZHPwGqSRB6uynQdh
	 V6Ml9x9J1TlK74AruovIVUCq/Fkg3KCvbjmvA2ExnR1mP5cb3KSj9ixatCAEeTG7Hqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ss8sAz9PIJHTokm5ODohJxcDhK4pxBivWqTZZ7RSTGs=;
	b=DsfoVvO3b5aOkjqVu7VRVWe2UWke6WPSt7DdrLkvLUc6AtbTeGI4Qel1YxsxZq/mBsSY
	 He0tJ1nQDnUcN5ZsCYvbGFlClb9LpcUCQS3MZpM3f0LV1VN0TX/PIkD3FETWUKTbXWYFx
	 YdHHHElgzI+RY3BWdJPw5rLlBWxzKoBh30C5+ytUA9kHXhr7PDd6t0EhJqm64euiJYpi6
	 Z3tLAx+iTt4FgyxevEYuSgryBURpIErGPh2oBfGrPXzHFJwJ9aTBf6SKVMxzoRslxnbxj
	 fP+e5vxUmS17ydGPO54VUGKfVfJzPaL+gzqcbyHyKYMh/8n2RwS8vbbu4B3MWJR2jiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YjqQ8V+P;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25559606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25559606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YjqQ8V+P
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab41538192so425410a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793160214; x=1793765014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ss8sAz9PIJHTokm5ODohJxcDhK4pxBivWqTZZ7RSTGs=;
        b=YjqQ8V+PihLHiLVm/7vidbzOKJC1IQpzeS3bR151cQPzMJj9LgbTScD3UXNex8hHAW
         hjqohocsTwoxwpd6wC22hOOZt4yQcUlGYBmS3VW+hMJX+6SbzlF1lpkWj7XKLBAGSMOO
         jOTd2bx2t9PbG2StRSJi3BYp6WXkjhxIyCBbohmuFr+VjltuUa0ijyDkGW6eAsLv/Ee2
         IXuYx+Wteo4MNf3QkRN5FnPw4OGI3daAKtEZhrz7iV6gm71E8I3RZnjQ+Fh4OiNBRrFO
         jNWbofABI/qkjwTrlQ3DIUMNcVBt5LbYbTzZFn89XDykoRq6g1iHCLDeCEsSdbQeSsoH
         T7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793160214; x=1793765014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ss8sAz9PIJHTokm5ODohJxcDhK4pxBivWqTZZ7RSTGs=;
        b=QxFpQZpD97welVfGvDsNUda3R5Zjy6QgdgVg56Tvc2FdMp78PKBui0Te0+r7TOMgFR
         7Fn/MvjUGoi3RJhnpkb7zZZSEnZFxFS+chwFPrKHdpE/UatlK537cct2U/Q46YgtyMBm
         I16BQc1v0duSW8xapyrFg4nI98x4VhvUtSlV3GW0nwv/DfQU8O1OG/B+Szu5ctMJtYhx
         fzh/3nQFZsY4hanld332ZeTcN7d80tUnnNDY9QdcnVgJKyc/8iCU7c5w2ryVGf7ToBR6
         rNE0/mRTAW0LrGa1CY8xk9NbJjHg0eJb3b/hSLM3Q3/MBLjwc1TnG4rIQGPaa2KefD6V
         RUyA==
X-Forwarded-Encrypted: i=1; AKwUvBxRMqaLsVJWbZpzUwCda53U0fhqXKXk0Shpla2G0cTM3AxcvrcknqCY+Ye/pm1tUD4XIWrLCti76SX0saA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOKrgDkWstpLlHQpvKz8WmvuKYWM6iu/xnC/EVzQdEYcSd0x55
	3gjLYNJ7CfNgcgn//iunmzjoy1UDSCJzLnB5WduwE0RGqzY6CSsLlAIy
X-Gm-Gg: AYBFou2WbXjIBXUI52Y111SH1HlKkRy9AkxZNWB1Y4+u3Y+7EIEXb2nCANgjW+oLBLc
	PdJ5rhIImYteVDPcPDlfxc/dI4f85YKO6QjXqpUMOQRzOLBThpEMO8tbQojh3cSKFMm8vmjsqgX
	0Az61gfDhhaqfR78JlJYbVxQ3mzwzZ45tLmO1wzyXkGQYkYkOyAxz7gUNjzSqPAk1vzOKWYUQGT
	m7XPstOvAFscfYcWK0IZvSv/sqXF+8nfYiTwLh0LvTmVFVVLptAtMrFHhBEiPakkZVYmLN0JigU
	vUTY6JBqrkcFtyZUc/Wd/PviKkXsFgSsZeG2x7vA3eQBkcoPvq9ytdhdZ6UFZqm04q2TD/pVr1X
	K/esdkdQ0tBcysmTqYO/2lmLpz/NwwsPIBZiLMADVxGm00qP+sptDOH+neIcXlp8Jvy1fEWwELZ
	424qlR0xABlVPZ2xyqkowFaC4ITee2N137ngyEYhWu1MkwIqdZw7JAA1MEyvd7YtnWrryeJFnFJ
	7XGXDE2bXFnn7WELyN7aw2MUhN0scxItxzOfIMsWn1nJ79YFApE1ajoUObw/yE3hwY1vaUSHP8O
	Lqk9vo2sXaNnXf4LhpH+ulw43AHqUqwXoBSTpTXqZEEESuQE/w==
X-Received: by 2002:a17:90a:ec84:b0:3ad:c4e9:7beb with SMTP id 98e67ed59e1d1-3ae58299f81mr854798a91.43.1793160214292;
        Tue, 27 Oct 2026 21:03:34 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a586662sm930651a91.14.2026.10.27.21.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:03:34 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: T Pratham <t-pratham@ti.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] crypto: ti - dthev2: fix empty-list wild pointer in dthe_get_dev()
Date: Wed, 28 Oct 2026 12:03:19 +0800
Message-Id: <20261028040319.171479-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

While auditing list_first_entry() users we found that dthe_get_dev()
calls list_first_entry() on the global dthe_dev_list.dev_list without
checking whether the list is empty. list_first_entry() never returns
NULL: on an empty list head->next == head, so container_of() produces
a bogus non-NULL pointer into the static dthe_dev_list structure. The
existing "if (dev_data)" check is therefore dead code - it can never
be false - and list_move_tail(&dev_data->list, ...) then reads and
writes through that wild pointer, corrupting the list head, after
which callers use the bogus pointer for engine/MMIO accesses.

The empty list is reachable because dthe_remove() removes the device
from the list (list_del) before unregistering the crypto algorithms
(dthe_unregister_algs). On single-device SoCs the list is empty from
that point on, while the algorithms remain registered, so a new
tfm (ctx->dev_data not yet cached) can still reach dthe_get_dev() and
perform the lookup on the empty list. K3 DTHE is a platform device, so
unbind/remove is enough to open this window.

Fix this with two changes: switch dthe_get_dev() to
list_first_entry_or_null(), which makes the existing NULL check
effective and returns NULL when no device is registered; and reorder
dthe_remove() to unregister the algorithms before removing the device
from the list, mirroring the probe order (list_add before
dthe_register_algs) and preventing new requests from being dispatched
once the device is gone. This was found by code audit; we do not have
K3 hardware to reproduce it.

Note that the nine dthe_get_dev() call sites in dthev2-aes.c do not
check for a NULL return. With the remove() reordering the empty-list
window is closed, so the NULL return is purely defensive; adding NULL
checks to the callers may nevertheless be a worthwhile follow-up.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/crypto/ti/dthev2-common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/ti/dthev2-common.c b/drivers/crypto/ti/dthev2-common.c
index ba6cde75d..099c0b923 100644
--- a/drivers/crypto/ti/dthev2-common.c
+++ b/drivers/crypto/ti/dthev2-common.c
@@ -39,7 +39,8 @@ struct dthe_data *dthe_get_dev(struct dthe_tfm_ctx *ctx)
 		return ctx->dev_data;
 
 	spin_lock_bh(&dthe_dev_list.lock);
-	dev_data = list_first_entry(&dthe_dev_list.dev_list, struct dthe_data, list);
+	dev_data = list_first_entry_or_null(&dthe_dev_list.dev_list,
+					    struct dthe_data, list);
 	if (dev_data)
 		list_move_tail(&dev_data->list, &dthe_dev_list.dev_list);
 	spin_unlock_bh(&dthe_dev_list.lock);
@@ -200,12 +201,12 @@ static void dthe_remove(struct platform_device *pdev)
 {
 	struct dthe_data *dev_data = platform_get_drvdata(pdev);
 
+	dthe_unregister_algs();
+
 	spin_lock(&dthe_dev_list.lock);
 	list_del(&dev_data->list);
 	spin_unlock(&dthe_dev_list.lock);
 
-	dthe_unregister_algs();
-
 	crypto_engine_exit(dev_data->engine);
 
 	dma_release_channel(dev_data->dma_aes_rx);
-- 
2.30.2

