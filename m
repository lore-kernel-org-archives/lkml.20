Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530146;
	b=3tZIsPcvVwx/QpUYu11ylcxOHQ2CziHfpxQXpg1DRKABJn6d9oD8zPJ+VcFprv9pV1K0
	 FbKFJyRRG5HAignCYO95buU8b6qqyzNW44WettE1ErQJcR6POM+0caBWGEPoWKgRI+TO1
	 sqOcd94b01fj5tUCSWYceAOOFSXA5wnnrFthV2qXO5OdMRGIhQU3BtNtEyq6ocBwXKdny
	 RkSeMf8awglytSkTrMr/fEgrrLx7V9QVoZAbKHFxF8RIkqTdrC8Ql5zk0zpkHI6vfOuip
	 qggW91Rk6i64UCEWbdCig+rHA53gl73tDCZ3ZuTAaKzUUsVcJxlUrrxkHINel56/U9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8O2rqQe37Ap0D9XOCLpMKH/b4xU4kX+ufh8uf0elaoo=;
	b=lOxm5spNZJUkHw6q+daxZ/74Miqei8HBXHpxRTY+hX+WDlbgDBgiybgfMr17IA5EI6x+
	 tp5ma3D/J+0DBj0M2bLimO1aipeNWd3R+E4yjjSOJJWPblTO/QKBa2QYcUzrfj7zwTcET
	 7dFAo8pLciWOoN8q9IM34lwH0mRnmdZKwdDaE4Sy98DOUn8hQ+KazQNazFR+cKQQlTNpE
	 fK8qRtw0KmUlQQkZMe4IanMMx4luqzyIe91qgMq/KtgrtLgZ/KavySSw6xtu3tek+4qZR
	 aj0mtB1Kynttpuj2cbP/kVVGVkypGX0FLOsxzXnhA7H1j5YfHS6rpuvt7DkdWnLS33A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pr7ecsZG;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B1606B7F5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01B1606B7F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pr7ecsZG
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso7219255ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794530145; x=1795134945; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8O2rqQe37Ap0D9XOCLpMKH/b4xU4kX+ufh8uf0elaoo=;
        b=pr7ecsZGvUtYZt2F88GEhZAXyVRfob6OO+ROkRbfMcnWklsSxclypci8XpB8Ekr0MP
         KoSewPODLpsgPUe8uPmpQgw/DPElcgzxooSfLOyDSWhLQ86p9YFJ4Aw5f0yJye9iPlGY
         8mTyKB8eGwNsHy2TaGyR3hK3gQy9JBzm7P6vkRKNH6RzeW9QK3Q7a43DQ4Iv5qkudomq
         PZPu+OwNc6mA5PBXNV5uXk6WEbamoUVgQFU/3bPjxNvpbznrTgmWvST3XM1vmEutqS7h
         sVoL+s91IhUp5pNlDVqspW09BMm7Nf0NBdAY3w0q0FLGeEpeCFLLCAFrALM/j9fWrvUP
         rk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530145; x=1795134945;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8O2rqQe37Ap0D9XOCLpMKH/b4xU4kX+ufh8uf0elaoo=;
        b=08TR1o3OrINtxu04S/nikaRiqehEtuXJefmeFFRlAMo+z+zhs6ZezciERUTf0Cjmb2
         Byvl6LaiGCL5aBFeumN9Q9U/d4SYYPrMGXAm6s8liHHg6eTW7MroHj9kQEkWv2Wz6Uj5
         J3mSBAYYOaZv4ltnNmCXAikPyPxN6r0cB2i3rlAxdo00Ea1rC5C61YQcOBVzmHuKR6Cl
         GhAJL7r7kwthV2Uk0txVTV1HOdDaT/LgCUYqDZ6KNnONg2hBWF8ol7Sz5jIpdc6TFqEv
         7aahRVqzD/aHmuIzqV272JX4iS4pkycN0aClNF2hAbT6YSVwuPMVECLdqyy0Jz+k0NCs
         egQg==
X-Forwarded-Encrypted: i=1; AL+hErEoW4rpvXVq1Gsj0wMJ1kReHGdLyxlJvxMSgX+O82/12kj89WcI4wcmwXyy3KVMQXIBzy7pgJGgRO5mEIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ipwD7BdTerqQ3kjX6SzIGRO1KhMfjQd068Vo/34rSXIIpGOYn
	K1sYaqQRchIyH7HUpdXVHFQkmrHpK4uOtIJopMQjEQoeN0XagUFKSo2fUj016luVhbVXfUxYm7W
	aklD0ZS1XL28qNUCNDS+8cDIpZSlApHT+WDxqxQ==
X-Received: from plfh1.prod.google.com ([2002:a17:902:f541:b0:2ea:ff0c:b0a7])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ffcf:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2ee0de29212mr9523355ad.39.1794530144817;
 Thu, 12 Nov 2026 16:35:44 -0800 (PST)
Date: Thu, 12 Nov 2026 16:35:34 -0800
In-Reply-To: <20261113003536.3622755-1-sarthakkukreti@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113003536.3622755-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113003536.3622755-2-sarthakkukreti@google.com>
Subject: [PATCH 1/3] usb: uas: complete inflight commands on status URB error
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

When a UAS device is unplugged while hub_wq is frozen during system
suspend, usb_disconnect() is deferred and sd_sync_cache() issues
SYNCHRONIZE_CACHE to the disconnected target. If the status URB fails in
uas_stat_cmplt() with a non-unlink error (such as -EPROTO, -EILSEQ,
-ETIME, or -ESHUTDOWN), uas_stat_cmplt() logs the error and frees the
URB without completing inflight commands, leaving SYNCHRONIZE_CACHE
pending until the 60s SCSI timeout and triggering the 25s DPM watchdog.

Complete inflight commands with DID_NO_CONNECT in uas_stat_cmplt() on
non-unlink status URB errors while not resetting, and unlink inflight
data URBs outside devinfo->lock. Preserve non-DID_OK host bytes in
uas_data_cmplt() when the unlinked data URB completes.

Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 drivers/usb/storage/uas.c | 47 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 265162981269..5aa369087295 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -310,9 +310,49 @@ static void uas_stat_cmplt(struct urb *urb)
 	bool success;
 
 	if (status) {
-		if (status != -ENOENT && status != -ECONNRESET && status != -ESHUTDOWN)
+		if (status == -ENOENT || status == -ECONNRESET)
+			goto bail;
+		if (status != -ESHUTDOWN)
 			dev_err(&urb->dev->dev, "stat urb: status %d\n", status);
-		goto bail;
+
+		spin_lock_irqsave(&devinfo->lock, flags);
+		if (devinfo->resetting)
+			goto out;
+
+		for (idx = 0; idx < devinfo->qdepth; idx++) {
+			cmnd = devinfo->cmnd[idx];
+			if (!cmnd)
+				continue;
+			cmdinfo = scsi_cmd_priv(cmnd);
+			if (!(cmdinfo->state & COMMAND_INFLIGHT))
+				continue;
+
+			if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
+				data_in_urb = usb_get_urb(cmdinfo->data_in_urb);
+			if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
+				data_out_urb = usb_get_urb(cmdinfo->data_out_urb);
+			cmdinfo->state &= ~COMMAND_INFLIGHT;
+			set_host_byte(cmnd, DID_NO_CONNECT);
+			uas_try_complete(cmnd, __func__);
+
+			if (data_in_urb || data_out_urb) {
+				spin_unlock_irqrestore(&devinfo->lock, flags);
+				if (data_in_urb) {
+					usb_unlink_urb(data_in_urb);
+					usb_put_urb(data_in_urb);
+					data_in_urb = NULL;
+				}
+				if (data_out_urb) {
+					usb_unlink_urb(data_out_urb);
+					usb_put_urb(data_out_urb);
+					data_out_urb = NULL;
+				}
+				spin_lock_irqsave(&devinfo->lock, flags);
+				if (devinfo->resetting)
+					break;
+			}
+		}
+		goto out;
 	}
 
 	idx = be16_to_cpup(&iu->tag) - 1;
@@ -428,7 +468,8 @@ static void uas_data_cmplt(struct urb *urb)
 			uas_log_cmd_state(cmnd, "data cmplt err", status);
 		/* error: no data transfered */
 		scsi_set_resid(cmnd, sdb->length);
-		set_host_byte(cmnd, DID_ERROR);
+		if (host_byte(cmnd->result) == DID_OK)
+			set_host_byte(cmnd, DID_ERROR);
 	} else {
 		scsi_set_resid(cmnd, sdb->length - urb->actual_length);
 	}
-- 
2.56.0.611.g1030f0b940-goog

