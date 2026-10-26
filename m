Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792987401;
	b=QbQ4ZIkPDyFNpw+2r7FVIF2vIUYZ5Iwv1E5BKJp5DDDFhef0VGRx11qq84I3fzP/CDrU
	 kDo9QjEta0DLn+S8Is1jICXHmq+GS3oxRQPxgMFdX3halsEieZaWqDcTJpIzdab3CUb8L
	 jMyHIIrBJmVOlpndJwqkMcjzxcLM9vyZKf4l240mC+0AuUvIzyjoqpsbYdFX/zpYRlGGa
	 I2CC7UYILfhhhxsjLavQ6nAcmau7alzuW45eF0wVOj/rrWbMUyL2fFNrdoyfuLG8Mg1CA
	 XVh7h2tDtg1ZIYIIMSDIFBJbPlsqYSJ9qT8Hw0kxjS603Q4NnVxJDJSQHqSY6AjAL0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3KuQhni7ciZxPrEr6n6P/Hr5PqJj3sEm40NyKjGJZn8=;
	b=f8jDKI/8mdmBLxUKTY04792auAHEKinzDKY63GJqszwK2xWbBi2rqWSSMILyWSJkax3f
	 JzNmN1tnWZ7dsGEdIK11ovEn6Y5wNfI8dOJwqQISOFM7G+7OUFANJTn1d5OA6iJVnINbx
	 AvHQcR0EHE+7D6Ik+m70ciB7ZUzTm7LwLX9qK9VTQ/WLgUa491uT1I6oGRdDbs76lRcws
	 mEnsLCq+FO6x52mO7Cq02rO1CHdntZEvZjAj9vq9n/JWfY+nyfOo94g8zYV7mbHT5bjLp
	 JtSY2NwCtUCbip2Lpmtr3W3Lt0ayzKuEZrVfVYvBGZl3v6hrUAaryTbN96uxVciL0yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a+NX4pth;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D561606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D561606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a+NX4pth
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3550c917fd3so3892033eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 21:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987400; x=1793592200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KuQhni7ciZxPrEr6n6P/Hr5PqJj3sEm40NyKjGJZn8=;
        b=a+NX4pthwV6Ri4S67cFuw8O41QG7QDnKKAJQybYrP0ZEvaWiH6Bv36OSMMXR278I97
         3FESxfeWIvrGXuIbamwuyr5/QJhGA8c/Hw1pxVAJCCafXg2GPbanBsRxwo9ORUEqnthf
         qQsIm1i/U6daUOT06DnLcEFpfZO5p/hEpmyRWSBc1y5k3ck+C9JaZ90gBeUiA0jloTcS
         8/Xr6Co1/iEKAFpfU5VlL2Kt9QnZI719BSA+KVXp+TSSgU/0frbMapIN3bFkbXB/+6Lv
         FIHEuBCgujoYJerMmN8jZ6ShFu09M7sIvUJhtRjJcEcZwxdaWuM/mi0YhkwmheU6wSrZ
         ZjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987400; x=1793592200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3KuQhni7ciZxPrEr6n6P/Hr5PqJj3sEm40NyKjGJZn8=;
        b=kGQzHh6cjzLHcoiIUD8D8gHGcBN7WxMlu3MisTQK/Qs/xOAwQN6SqxPGAtF9soXqsI
         DJ/gcTIYfhhoEmtwrtoMIiE5hqEZEfVitVeOZE3P3Fh0iYvMONsotPqUtfj6XhjfIHl0
         ys0y4tL4rT8gmjp/9Q/DfewjqvTPcZ4WxPcLMlLUIJuziicP8JZqY4yq0syDNbIsc6XA
         yqH1bFcITgvs2yArSPQqIdfPOaJTMFkQC5NSeLoKdEuvQ6dOdLB9AYXCskzpcSi/cY9H
         Q/q1VdjXGFhSNFF4AUgX13UF2jGjiD5ryjrssqwlbJCt1KKYxVWGorSzqrJIshONTQQ2
         LO2w==
X-Forwarded-Encrypted: i=1; AKwUvBzDsrAHHlwKWUOQQpAE8OET8JqvO6viOetsJ3Bw/GfJmJkyL7zEN//NHrDMLOzlIAjS3U4v3JErnWFvTsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQZp4APvSmVHLs5197XAcjwIRT+4wWRzwXq8m65uq/mjIgIiQZ
	S6GzKEkn5W5FK/AQjkQr5ksnMAOWAD6XcbI3XLNN0K01iuUAde+OGaBD
X-Gm-Gg: AYBFou1WNggxZLJ0/FJJPKKL7fWDqyEaDbMpyIMh27ZRe7C/y7rZpmmni76y6kXKw5A
	aqvLXXLvmLM8lixsYjAPTT6Y6nQvAT+OQHGZ6bLOrHb6wqRCUtf/aX4TatLx6oKOlsCDOl4132/
	wRApOn412nW2emA+WUG0+wbQBbxy9wjmeihQRzkfDC0EoUmf3O9M0XMiEDolD+a5kHexBYLSuCJ
	P6A0KLgWkhAomz7zYXiyljeJ1mM8y9RvIOI7Rp9jzZ3MjH7PmLHV2e5GQbYyJJW7vWErBovRiJG
	v8rEzBJ6/b1bRqvBjUy92F6GA/zQ9YI6+EltLJClErtfx62YkzI2tJRg+/et8l6B/kPF0GmO0CJ
	sNe56qOQNP5tymasPO3dM17UV/DjEdiXUlAPqh+4XdIEH1gqlYUlDqBz/cmhr4iwrE/VvBkKtXL
	sEWt9zbTv99s1lxvnRPomYP+O4U6P1ehKCXzFvc259nRthzORYMM2yq7y4oYk5Nst+daWaZBf5H
	xnmbvjDwem9gBAsEGxxAg+0LT4Q0w1XMTlymfbdfLo4kETdE1MkJJIq/F2+5UD0Ke4fajU4S44W
X-Received: by 2002:a05:7301:5404:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-369e8336354mr9216297eec.5.1792987400302;
        Sun, 25 Oct 2026 21:03:20 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f4164886sm13973765eec.7.2026.10.25.21.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:03:19 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: jjohnson@kernel.org,
	ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH ath-next] wifi: ath11k: refuse a peer whose address exists on another pdev
Date: Sun, 25 Oct 2026 21:03:02 -0700
Message-ID: <20261026040302.2635133-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
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

On a Netgear RAX120 v1 (IPQ8074 v1, firmware WLAN.HK.2.0-01792) a
client that roams between the 5 GHz and 2.4 GHz BSSes of one SSID
crashes the firmware. hostapd adds the station to the new radio at
authentication, while it is still associated on the old one, so
ath11k_peer_create() finds the address on the other pdev, takes the
"transitioning to another band" path and asks the firmware for a
second peer. The firmware then asserts:

  ar_wal_ast.c:286 Assertion 0 failed

followed by "Failed to add peer ... for VDEV: 1" and "ce desc not
available for wmi command". Both radios stay down until a reboot.
This happened with FT-SAE and with plain SAE.

Refuse the peer with -EEXIST when the existing one is on a different
pdev. The station then fails authentication on the new band instead of
taking both radios down. Moves between vdevs of the same pdev still
take the existing path.

Tested only with this firmware. The hostapd side is being fixed
separately (do not add the station to the driver at authentication
while it is associated on another radio). With that change band moves
work (24 of 24) and this check is not reached.

Assisted-by: LLM
Signed-off-by: John Macias <dencity7@gmail.com>
---
RFC because the existing code deliberately lets a peer move to another
pdev ("Assume sta is transitioning to another band"), and I could test
only one old firmware (the RAX120 v1 has early IPQ8074 silicon that
needs it). Questions:
- Does newer IPQ8074/IPQ6018 firmware accept a second peer with the
  same address on another pdev? If it does, this check should probably
  depend on a firmware or hardware flag rather than apply to everyone.
- Or is the hostapd change alone the preferred fix, with no driver
  change?

 drivers/net/wireless/ath/ath11k/peer.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index b30a90698..42686e41c 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -392,6 +392,20 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 			return -EINVAL;
 		}
 
+		/* IPQ8074 firmware WLAN.HK.2.0-01792 asserts in its AST
+		 * table when an address that still has a peer on one pdev
+		 * is created on another pdev. Refuse it; the old peer has
+		 * to be removed first.
+		 */
+		if (peer->pdev_idx != ar->pdev_idx) {
+			spin_unlock_bh(&ar->ab->base_lock);
+			mutex_unlock(&ar->ab->tbl_mtx_lock);
+			ath11k_warn(ar->ab,
+				    "peer %pM exists on pdev %d, not creating it on pdev %d\n",
+				    param->peer_addr, peer->pdev_idx, ar->pdev_idx);
+			return -EEXIST;
+		}
+
 		/* Assume sta is transitioning to another band.
 		 * Remove here the peer from rhash.
 		 */
-- 
2.47.3

