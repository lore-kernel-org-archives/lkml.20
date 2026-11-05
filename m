Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879103;
	b=Faj74q/k4GNODhp6VSvU998QnSF9aIT65P5zkrUDbcikijiOu0pHHTcOB/3tB2+44hGZ
	 A7yeDFxTzjHVMtFcNWflg2fLgIHZkLKneBQ6hswSjvSUefaU3qzQw5Z0jWaD3OTC1u4TX
	 lcnmLEkNMHbxly9iun6ypEGFcb7GmFjYROnomLqr4/3tFEvu4FlyXIas64SkvONNyvkDo
	 xHlPLPJieq8ZQKUqfP84BW8qyRRyXIwYlS9amjBB28cnqH1wEByhB4fTXImP3wF4ERiEV
	 SKoZrAV6JsA9QLk83j9877Ez6w0OZ+AjSU5B1549gXtmb8SHUYk3JBTlGAv8pv4cs4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HUzBUAOyVMMNnWBATop3PHNYHsyg1DIgGmHpxUSzv7E=;
	b=dyqerhkSvD/ERqJsCKqrjrVE/RSooXkuljsRwM+CUk0HPfHPcXS4RSB1+SLCtFHh9RPB
	 WmgPt8TeQdh1UYbSXxooZ8trOoF8uLYGTaNRAmFp6bkbSm3cTDZjgwXoKWTYlHkJMoqus
	 BtF3wwHbLkG1PBdcwJuNWcKiVNpL69YUOepBwCWUFAAhJ7zzHmtAp1XBKcCcENcIx6C1c
	 Gk1GKBCGe2ryzB6h90+/8XsrcVxPuKSCokzEObIc0JMt4ACJ+uJ2faK8RUNM6hVwjrFwn
	 wQnVKEzol5CEykzmH8dto/Uw4I7SkgPSwyd67vROOueywjj0oxsIAltWoCw4TH0hp5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+JMGahA;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF8606D80F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CF8606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+JMGahA
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a2af4c8d00so526157c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793879102; x=1794483902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HUzBUAOyVMMNnWBATop3PHNYHsyg1DIgGmHpxUSzv7E=;
        b=J+JMGahAN0kpCtU8BOpFVZOiphJHBbi4LTbwrWNz3R08QrZ6uEAhQMmm17g41uhZ+8
         gYq0gt3Js8MMiPOnN99HbkGAi/k9E8FHgaW+Z1Ewjw0tobWJn3PY63j3pNfiv8UQlGu0
         e0/6QR6QkPWxVDBu0XR+cWX4MWj0VhtjzkQUz/K1FhKdgx2WGN6kXWPLHrPY9KASQD8v
         /w/PQ8n7pt/2oe8MHbtIQL3vAZbx+VEPreR4qL2sK8UwulcP2Ytx373NO5zZOD5dGd23
         1b5rBGC8vOkpMlezwaG2Xx6i3VsZIHWbyGKpLab4XV3qoV06mDzYObVuMwMF8RwEXHub
         OTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879102; x=1794483902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUzBUAOyVMMNnWBATop3PHNYHsyg1DIgGmHpxUSzv7E=;
        b=0mlo7xRCllzlW8RJE3txBwaKX2aC69YFB/n69UF7+mwlIxdVoGiyfC0iRhGHDGroxx
         iV8iUvQnu17PBtbf4I9isvCLi1AEt3zhgoeXqWWWEijID4w7a7QUirA5J9KudoSbb4fH
         hw0wUkQMLbH0sNKB+LpGav++UiBuS7Rt+ONU6V3pGJI9fey4kozdL5QqZTSxITMfWm3y
         usgfkvjF9IZTb/TgtGp4ugvnO/Svi8Vn+Xg+ZOzHXhTGukwfE4G28HIVhXpkNhSsfDDS
         lZIZUQZuaf/uMy5xZ23tYVJOEDVMZDoVKXIzkUiaGHGLjhOsKVBDYXFTf2wMjmv0WvXv
         ZC6w==
X-Forwarded-Encrypted: i=1; AKwUvBw9jd4X5NE1lqBIkqW/4lzYXDZEPw+TUbLboeBp1ckcb95sEqyQI9pGBnjkZFE6Q8FRvHgodIeX2UVl/T4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e2f3rBV40h0z6O7nH454WyWSKYd+zjT9/GOOUmSU7aViaKVcj
	ZHqjiUOaVvH8ujoBOH8yIn3FeXMT0IvhyvVb1EsPa1G/Nf9m4yLUDDJL
X-Gm-Gg: AYBFou2U1SV2iGnNBPvEoxmRvDAXn/DnFTA9QqEJQtdYJ+WkycQfsuhORR6F1XkVWAf
	3hXIAJWOU9Juipv5YCN1iDfysM9ath0hE7b+4I2tmI2BLMuG108roskE3I41gwKev+hSqH3Wqla
	NRwsksqOIxieGnRiKGX75ujsC5NgDZQkcdyTzzMVNMjkU3Nnbjx8SGFQXa8Ixuw+0sM+voNOqBR
	BS937cm4Km6fXd8DBRd5ktj71zQXLqoqFcL3P5NO9hiLLTkMNwX2iIvo/S+YlaNzVNOCSBsUOx1
	tH0N9OL3DMDb89O8+p/PISM7IW0uabVKxTN3m36DqaOLaycvcQc/ssokhDXaEY513WphyPmZpJg
	Dqwcpk0S/tGVni9Stb6+rIohS79KjdSNrhfXYT/bUc354Dc7G1Fu0xN6bRKZf8TaqxO4tHp0/Au
	/4a5hMDgYew0tOVVCd6itWAyikN1Yjj55krZAoOcoaEfZrUOg/NBwcWI1gaz8KlYV8UoNY2y1BO
	s4Nbl/Qr6ujbiJb9X4MIh6y/V4nqN/G1eM3di6kUEZdO+HQRQiZ8cJTf1Qo5lKnel7GOZbK8jEa
	Esn7ZzUSgZY7qWtUY4I5QMKYKSaaX+4yfiStlA8X5tqZ06cuWfcwov0hwICGq8chGaact0EBA0D
	fd19CFF3dqA==
X-Received: by 2002:a05:7022:120b:b0:151:5d01:9316 with SMTP id a92af1059eb24-1ac5ac4f406mr25397405c88.23.1793879102040;
        Thu, 05 Nov 2026 03:45:02 -0800 (PST)
Received: from lwq-System-Product-Name.. ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245ac2f44sm16650061c88.0.2026.11.05.03.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:01 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: amit@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: rusty@rustcorp.com.au,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] virtio_console: defer HVC polling out of the virtqueue callback
Date: Thu,  5 Nov 2026 19:44:50 +0800
Message-Id: <20261105114450.971521-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The input virtqueue callback calls hvc_poll() on port->cons.hvc
without any synchronization against HVC adapter removal.  A port
removed via a VIRTIO_CONSOLE_PORT_REMOVE control message runs
unplug_port() -> hvc_remove(), which drops the adapter's last
tty_port reference and frees it, while the callback may still be
about to dereference the freed adapter:

    BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave
    BUG: KASAN: slab-use-after-free in __hvc_poll

Both sides hold only the port kref; nothing protects
struct hvc_struct between the callback's pointer read and its use.

Do not touch the adapter from hard IRQ context at all.  Only wake
the HVC worker with hvc_kick(): khvcd polls registered adapters
while holding hvc_structs_mutex, which also serializes
hvc_port_destruct() before it removes the adapter from the list
and frees it, so the worker can never poll a removed adapter.  The
callback now only reads the adapter pointer value (never
dereferences it) to decide whether to kick; a stale value can cause
at most a harmless extra kick.  The IS_ERR_OR_NULL() check also
avoids waking the worker for a port whose hvc_alloc() failed.

The price is one extra scheduling latency for console input
delivery.  A 64-byte echo benchmark over a virtio console port
shows no significant difference (RTT p50 0.089 ms vs 0.083 ms,
855 vs 767 msg/s).

The race and the fix were verified with an injection-assisted QEMU
setup: stalling the callback between the waitqueue wakeup and the
adapter access while a QMP device_del removes the port produces six
slab-use-after-free reports per run on the unpatched kernel and
zero reports with this change.

This issue was investigated and the fix was developed with AI
assistance (ZCode/GLM-4).

Fixes: 203baab8ba319 ("virtio: console: Introduce function to hand off data from host to readers")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---

Changes since v1:
- v1 protected the in-flight hvc_poll() call with an RCU read-side
  critical section and published a NULL adapter before removal.  This
  version drops the RCU scheme entirely: the virtqueue callback no
  longer touches the HVC adapter at all and only wakes the HVC worker,
  which polls adapters under hvc_structs_mutex - the same mutex that
  serializes adapter destruction - so it can never poll a removed
  adapter, and the unplug side needs no change.
- Verified with an injection-assisted A/B run at the same stall point
  (in_intr+0x18b, between the waitqueue wakeup and the adapter
  access): the unpatched kernel reports six slab-use-after-frees per
  run, this patch reports none.  Round-trip latency and throughput on
  a console port are unchanged (p50 0.089 ms vs 0.083 ms).
- resize_console() and the control-message HVC accesses remain out of
  scope, as in v1.
v1: https://lore.kernel.org/r/179378553951.72222.12851179500568566393@gmail.com/

 drivers/char/virtio_console.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 019bcae81af5c..c5b3a6c0ff3d7 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -1820,7 +1820,14 @@ static void in_intr(struct virtqueue *vq)
 
 	wake_up_interruptible(&port->waitqueue);
 
-	if (is_console_port(port) && hvc_poll(port->cons.hvc))
+	/*
+	 * Leave HVC polling to the khvcd thread: it walks its adapter list
+	 * under hvc_structs_mutex, which also serializes adapter
+	 * destruction, so it cannot poll a removed adapter.  Do not touch
+	 * the adapter here: hvc_remove() can free it concurrently during
+	 * port unplug and this callback holds no reference to it.
+	 */
+	if (!IS_ERR_OR_NULL(READ_ONCE(port->cons.hvc)))
 		hvc_kick();
 
 	kref_put(&port->kref, remove_port);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.34.1

