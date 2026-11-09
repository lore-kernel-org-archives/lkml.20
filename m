Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222054;
	b=Yx8dfETpukoOpWnxK2gqS0hL9htwFN2oIUcs8qjc0qEiE67oYr0eJV3J2N0Yqv8IyJIt
	 pYAkzuw7l5S6kWA4hrisLLy/sEfVb3vVD4geiyHHlto9e4qxVU1kI0b8MQ48YBApOZLjF
	 P9la8zNzgKP642Hc/cee1cQrRsIA6RxoNIFIQvT4grWiNvPEPjmLjwTo7Dh9v4zojymli
	 iEyepCnkTZqcjgvls7CRVC5SLimlnMrIQ8a4HonqR7YhWaBFuz+ieIrzr83z1/gMgFT1c
	 Q7oZh+hmGXpvqcVIwuJRJW6ksOV8EnLuMaFqRufF36Zju/hEh9FbymE8dSX0/YgxvZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4iXeY4iqUL9ww0pQAAvwhem0iOVjitiOYOwOdTHElEs=;
	b=g6iPHrVg25/lIY10q3S9SU6a+E2boqqfi3R+ffdFvbTjnMwisKflVk8YXVH/9xhqPV9+
	 OvX2NxV7S4/zRyPl23rV5a0VTS+NE7Q4GCsLc46SMtvKv8keTak0ujmggNqqyMSgtxC+s
	 fXeRN/y7L8l2e2MY9rO9kYydc0Vlrs1yX+xcROKq57gX0NB13yR0UyEyyYj2FD6MiscM0
	 eh4F0dzcKfECClcPJb8zc7JSVQciXEMVW6n0DuYBRLwJ839Dm0gHCZqiBbXzw/4Q5cgKL
	 i48HFJF5GmNlxmYjM/jbWdo4eP2aCyi1+pBbMH9cMFrS3olI2Io4Wks8wkb4qQJeB5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dgb/Ob6Q";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35955606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35955606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dgb/Ob6Q
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1366868c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222052; x=1794826852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iXeY4iqUL9ww0pQAAvwhem0iOVjitiOYOwOdTHElEs=;
        b=dgb/Ob6QI01rMx87etoiMX2YGgi3uwE/Sja9pTJwEvfOdLa2+5qs2+VS6YOXYKcz0o
         +MYkHXzbIujBKtLr+3+/93zEKoJg4unV/zBPOa8JTwqEAaP+yZL/T0E3hNKjKTG3BPPr
         CmFFzSFLrx62/7MGwPsbC1zVXA2mBlEbRBsAjYQV80MumER68suOgFPiQ1It04NzVpu8
         /Dto9EuhNnMIm+uR+juvruLO2NZMd/M0uttdxPkDAoQVVesrYjah6ILq3Vwu28JYsj80
         gGYqrgt1eeZK54+oMZBd3gYfSnTnv96ZQcDaAt6PYwA3wywyYtkRX8q7zQ7SF7ZKBQmq
         q9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222052; x=1794826852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iXeY4iqUL9ww0pQAAvwhem0iOVjitiOYOwOdTHElEs=;
        b=v52lzq4XW235XjnUxYEmwwpPf6CKFIB/oWnP8g9a3c7tk+yAoaBcMnatEgow1SdWpg
         7+VqyUc4Y8YpqfqRYfE0JXZmEkYjd4cdfP7ziX7Bl9MvcCRz1zcOZh3qws6ygUoizqX3
         KG8vHUUtN2rMb7si3qRbub+Es7Cl9++lv33WKqUop/BktmPaE5mk0GypMCFxFRQBL3G3
         q+OdOJJNZK6rlBXXVmuJ5FlutPiOkVRMRCeCgBEFole5sRR0+gpuB+NqjeFqK0at0D4Z
         kdVkgXFo/Wa4COMzo3mkcFFhCx8e5skRjE7o8tM7KFEpNkrb+CqObD7AmwaA0RabRslB
         /KPA==
X-Forwarded-Encrypted: i=1; AL+hErGYpPd3fxAAm1/NPmBK2qvUI2tYgy61K/Z+mbLB7BzDLjLZG+EtKcTM6i64NX1fkDhPn8e7CgP+NOdS6FU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qc20nG9Si/Poos0KUhVlG4pSGh9WiDkiLftf/w6kqthZMaCr0
	Fy9jrJtQ6ZNcsFIqz4y44A1wSGl65uR84ccT+zSbBc5dJft18WMNcAfZ
X-Gm-Gg: AYBFou3AHSdvUXu1QWHO4DwPtZJmymE0TyLkENjSqNb5XZ4qIBiQv/qXAcNk+Qgichq
	F8KVHp8IsxV7xW/814wnaQL3A9U4QEd5hNrt2TcCsabMs7/ixc5I3OMNKK1VEvh7g4McvrLWrYl
	1oiOvLnZ8uDFufOvr0T9Ln9kZDE8vpn2gLVC1PjR6kUm+swk+viBCQ06Z3RfE7dNr44628tInBD
	EtN0ZZyceVjoctTA2YWyuerRtEQPPTfKDd9sz7xgJOOimfo/hvjDJD33S3XzU/tNk42s5SctAnv
	2HweCbIA2kxUosPA1XMYPuOIe4uVxq+2zolDxI5Tc5QBqs+ocdFrQLFDQMohcsO7tflNKlzxgTs
	kAq8j6Spapr6dxoM1Tqc2m/TTqaND0qeV6e59ePU4ML6ZU8Gbx7yToAcz94baVQrQcn14FFqaV6
	pLzlCQZ1UiM0IhCj7U8hYTuV/YP1Rgb3X6sedRyoKsdC6vauNWHezmR1WXn1jj8jP5xmwaWT4GR
	W+OyhifxAT8POSTjb483yE0sj1HSzgBsPV4IOKexAg7DlekOLLqUKzJD1px+2Odj6w2yUM0JyKF
	jc3EpNSrqVHUMYjaXqGreUHsrZumL49yXhkS/Z3ckH9wN10w
X-Received: by 2002:a05:701b:2092:20b0:151:5d01:9316 with SMTP id a92af1059eb24-1b39fedc89fmr6555851c88.23.1794222052154;
        Mon, 09 Nov 2026 03:00:52 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm15407609c88.10.2026.11.09.03.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:00:51 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: oe-linux-nfc@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] nfc: pn533: bounds-check the ATR_RES response before parsing it
Date: Mon,  9 Nov 2026 20:00:16 +0900
Message-ID: <20261109110016.1511307-1-hj351016@gmail.com>
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

pn533_poll_dep_complete(), pn533_in_dep_link_up_complete() and
pn533_activate_target_nfcdep() cast resp->data to the fixed ATR_RES
header (struct pn533_cmd_jump_dep_response / pn533_cmd_activate_response)
and, on a successful response, read nfcid3t[] and compute the general-
bytes length as resp->len - sizeof(header). A short response leaves that
read past the end of the skb data, an out-of-bounds read; the copied
nfcid3t reaches userspace via nfc_targets_found() and netlink.

Only the success path needs the full fixed header: a no-peer/failure
reply is just the status byte, and the existing failure handling (turn
the radio off and re-arm polling, or print the error) must keep running
for it. So validate resp->len >= sizeof(*rsp) after the status check, on
the success path, in all three handlers, before nfcid3t and the general
bytes are read.

Found by code review; not reproduced.

Fixes: 361f3cb7f9cf ("NFC: DEP link hook implementation for pn533")
Fixes: 673088fb42d0 ("NFC: pn533: Send ATR_REQ directly for active device detection")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
Changes in v2 (thanks to the Sashiko AI review):
 - move the length check to the SUCCESS path (after the status check), so
   a no-peer/timeout reply (resp->len == 1) still takes the existing
   "turn radio off, re-arm polling" / error path instead of returning
   -EINVAL and stalling the poll loop
 - also guard pn533_activate_target_nfcdep(), the third ATR_RES parser
 - add Fixes: tags for the two commits that introduced the parsing
 - drop the inaccurate claim that the other handlers already length-check
   resp->len (only pn533_init_target_complete() does)
diff --git a/drivers/nfc/pn533/pn533.c b/drivers/nfc/pn533/pn533.c
index b0133e51dce9..9c65b52a8a14 100644
--- a/drivers/nfc/pn533/pn533.c
+++ b/drivers/nfc/pn533/pn533.c
@@ -1319,6 +1319,17 @@ static int pn533_poll_dep_complete(struct pn533 *dev, void *arg,
 		return 0;
 	}
 
+	/*
+	 * A successful ATR_RES carries the full fixed header (nfcid3t[] and
+	 * the rest); the general bytes start at offset sizeof(*rsp). Reject a
+	 * short success reply before reading nfcid3t and computing the
+	 * general-bytes length, to avoid an out-of-bounds read.
+	 */
+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	dev_dbg(dev->dev, "Creating new target");
 
 	nfc_target.supported_protocols = NFC_PROTO_NFC_DEP_MASK;
@@ -1799,6 +1810,11 @@ static int pn533_activate_target_nfcdep(struct pn533 *dev)
 		return -EIO;
 	}
 
+	if (resp->len < sizeof(*rsp)) {
+		dev_kfree_skb(resp);
+		return -EIO;
+	}
+
 	/* ATR_RES general bytes are located at offset 16 */
 	gt_len = resp->len - 16;
 	rc = nfc_set_remote_general_bytes(dev->nfc_dev, rsp->gt, gt_len);
@@ -1937,6 +1953,11 @@ static int pn533_in_dep_link_up_complete(struct pn533 *dev, void *arg,
 		goto error;
 	}
 
+	if (resp->len < sizeof(*rsp)) {
+		rc = -EINVAL;
+		goto error;
+	}
+
 	if (!dev->tgt_available_prots) {
 		struct nfc_target nfc_target;
 
-- 
2.43.0

