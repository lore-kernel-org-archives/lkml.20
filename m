Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794157108;
	b=TQBPEG4HX/r5KCn6kOZDTac2mZFU2dfaOT0lAeI0tPuNQMletD5EIMP8p7rVoTriLcz3
	 Clayumzl4fYaTK8x/i/GicR8jAE5UKg+AmAMBH5PjfoxZ1CbZKEZsR42i4HADStQ/CqqZ
	 gGgr2tztcsXLM0gnVlZTMCzpcLWIxj83R6JVgFh50OT3/GaWLe7AHKX7x2mazbSlm99UL
	 kDjMwc+ITfL9uWl+AuiSh++wReGAbMiohmPa2rG5bEinqtMnAdLAR8rZSL3H8wyt05Cpi
	 TdsY+BcNpPopSh5bWQkRw0gt94wKlPkO4M+DIldioGkz82E95f4hxuI8Pxke6aqDOrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794157108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P5/FgJx6xQuodGivSipA+H8MZrv95a/oZ5kRZw8SEv0=;
	b=mIBjfrcVpnTGhQbbbLwKNNckHyKgQ6O7XXT+AwGoOiqnlSRcV0V8+/1cu+Bzr88uqqdg
	 gUz28bFlSpwDH8crXlhTAB2xbvioo+ob+9/q9FgEfLYB08J56AY/EHzWjH9GWI1g7W3Lz
	 +1Pzcn9G13oYPXizvD6Zxq7JPBfPUTeA5ebCCldi/LCgk+yfxpqQAM4HTTSTfTzL2UtSa
	 RyOGN8Y96JKITKrNPE7AxSRQdlIlBL14anfTaE0Nfw0QtmFftP4LlvWOogd67QPIR9q1f
	 IGPXZx1kXAyiBrCY+IaIQEl9Ojnaj7l61+eTKavlWiLxFHhI+oqSFtlYr7RR7gVrD/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkdgHZGm;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73B606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B73B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QkdgHZGm
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1adbf62dd31so208016c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794157107; x=1794761907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5/FgJx6xQuodGivSipA+H8MZrv95a/oZ5kRZw8SEv0=;
        b=QkdgHZGmSsLi5ADkdkJ9VZfphXO5ZbhqbbOTHZmnn3V16q59Sqq/9yeP08PK8xQBVu
         lqQ/rYuLmooHGpexNb/nDvltvkMhII+oy2PSdd+2Rf35Qa099JW3NWfAZ3M8qPBGguLQ
         HtfaOuG+z/u2JGJKHCeeehp/6M13qed77999QIXuA3kcgKgFGeoKLjdbGj9IsuOH8kad
         mWHU9Bz6IK9QzgC8Pyxj2XU64RJNjGfwq/HwhG40TX57zn1I3P70h/LNH3tCIuH3OJkL
         16IWUuUVvAFrR5sW4J5FHdUdBoxLW6zTIoo2f5poG6QAM4C2xdAj2aLq90mxd4R6VtrQ
         YbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794157107; x=1794761907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5/FgJx6xQuodGivSipA+H8MZrv95a/oZ5kRZw8SEv0=;
        b=PWPla3mb8k+EausazBNvJAgENzebxNyxl/Zk9DmWICTfyWxuvI1MomhJo3/HfQjzyg
         gxkD1NQMduO9exeGHTyZgh7gwX5LdHwrLOu50r8F+EHC25YRny4hQtOT0p6t8QE+X9b0
         81bGgCIou79+2MA2KXOhmhdX0DNwNfNtuENMeUja8edZQhGP3NGpUleXMZ0Jx8iH5vdH
         2wt2pEs+WTgq8gqi1nS9dpAirVE1ayezWHJMwzTB6FHHZgADdZBKXKXCwXLrIMW/eFTR
         sszi6oId0KMVoAwDfK2bZTbnAd7ZnRiJZtTZplFtQZ+omFjLCrXkYNSug4qPvHe2ywF3
         wa7A==
X-Forwarded-Encrypted: i=1; AL+hErEqgCOFOf20glDEcuN0CihIxKv4XjyDw7j7Ka29mb/vDbin9ckzTR22KfmF1bKoo450meaOwkU70ks+4Mg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TgYr/9yohD+4NC94DQSdZNAw2C0MtuNm3axUoSB5OJsgt2Ss7
	SC/zraleaiG+AlYlsoiPYmWHQJi6aUbFrA9xOOGE9Ug0ExSYQ+C7erY/
X-Gm-Gg: AYBFou1FRr0uDQ/vcApNr/EslNwDk+C9VI8knDLrs4xFaH9noTUsu//B0MVw1UlXG5F
	jbzK+0Yq+I4224aHBopXir/JKN45ZSUFATO1lzZaHx0amOcQu1dN8RTxBYjVmPbxn6z4bA2Ud6C
	JoJei63FuR6ZNrkASHoxrwGCeN+gsZKwIL/peOsAYVd2eVjgXsQict9mO3CRY7e0RKnTnNrFDi6
	kaHfPSa1mIZspV4ggBg0j8ZiWUbrpK+HbgKS1wXK0l0Kk1O3XItuR40vESVgbMm9zb3YVyDVEDN
	AfxfGMoWchMnw2Sy9OAEhe/K+nCxjwv9XbtOI/tryjtTNxT35fy/1tt07BLj87s+3swoxO/B5sj
	44dQtSvxODFBtvkEn5JRbdKnLB0Ljz8TT42nGK3cOKtbM4HSMXtAqg1z83efwdZZqQ+p23+RsxU
	tGD3d4rlCzvUQkKLcHEUlBIqCrH585UtBcFs+XNK3F0h5DG+u74O7iFiXbD9Nn7RfpyDWhpSVuA
	8WKryBgzmTpIxLu1kzQCjBFGT7GFBZhxYuj4LyYKQV9ygKzeizFvIWYDzp1WJlXdapnpQHshJmL
	QIszpQ8yP73zXUQpyGx5mXFnOXWpmscNjTOIAnLWvqgvdbvl
X-Received: by 2002:a05:7022:1081:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-1b39fe2dd5fmr2487572c88.1.1794157107231;
        Sun, 08 Nov 2026 08:58:27 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372631df629sm6539935eec.1.2026.11.08.08.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:58:26 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>,
	Peter Huewe <peterhuewe@gmx.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v3] tpm: flush timeout work outside buffer_mutex to avoid deadlock
Date: Mon,  9 Nov 2026 01:58:12 +0900
Message-ID: <20261108165812.676876-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

tpm_common_read() calls flush_work(&priv->timeout_work) under
priv->buffer_mutex, but tpm_timeout_work() also takes buffer_mutex, so a
running timeout work deadlocks the flush. Flush after unlocking; the timer
is deleted under the lock, so no new work can be queued.

Fixes: 9488585b21be ("tpm: add support for partial reads")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v3: Trim the commit message to the essentials per Jarkko's review.
    No functional change (same as v2).
 drivers/char/tpm/tpm-dev-common.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index 6569212..ee91f45 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -132,6 +132,7 @@ ssize_t tpm_common_read(struct file *file, char __user *buf,
 {
 	struct file_priv *priv = file->private_data;
 	ssize_t ret_size = 0;
+	bool flush = false;
 	int rc;
 
 	if (!size)
@@ -164,9 +165,18 @@ out:
 	if (!priv->response_length) {
 		*off = 0;
 		timer_delete_sync(&priv->user_read_timer);
-		flush_work(&priv->timeout_work);
+		flush = true;
 	}
 	mutex_unlock(&priv->buffer_mutex);
+
+	/*
+	 * tpm_timeout_work() takes buffer_mutex, so flush it after dropping
+	 * the mutex to avoid a deadlock; the timer is deleted above, so no new
+	 * timeout work can be queued once the mutex is released.
+	 */
+	if (flush)
+		flush_work(&priv->timeout_work);
+
 	return ret_size;
 }
 
-- 
2.43.0

