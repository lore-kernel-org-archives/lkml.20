Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA12D3A7F51
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 22:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787955408; cv=none; b=BfJgsfRWCLxkB8nrcTk6KgWvaHn38oiDMUu3dc3mBoJi3XX5nRJeuhx2v4rZnR0jluKpIHaat+yYaU852ose4u6nI3HMGW1nQXMIX7Sau4AiZpLhEOoOCaTH51uovW3Jeuiclf/aURHKOIDmWlD9JR5A6uLN1XzzY5Hq+dCpNlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787955408; c=relaxed/simple;
	bh=I4ONtpSI65nX+ymt+jKYapVQOmaAeCgKvckUVaQ3X3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CAL3b+8l0k4Cinbo4HX7qizX4JD/k1740h6eM05Vs4DfcNGPp4KmJgytyp/WBQUlAKGQsu6d5GLdRdzW4xpmEGGFsEUx7MKCeUfbJqGEsQNdiC1ERtnn0zzIYEyv1cQ9J65cb6E+UX7/1dKi4ctMdBXMmR0ztkfcrB32vKcTQ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGGOHn5S; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGGOHn5S"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so636863f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787955405; x=1788560205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+NVBt2+YV7TdDLoFYczsvx72Y9+mslXywiFQEZGZJM=;
        b=DGGOHn5S8xXhh8U5W5C/RpnhlSFLQQQ4mDtCvmvyC/uYVXZaAsLemQOGN6kWc9T9V/
         h5bqi7bkDpltQ/ZwIZCbFwMS05P27+EyXLgizQR+oqslQ/tIh38ic60tmL9hGRPUZ1Rs
         UELdCIUlYZ9yrfgLn8cs4VnqkmUwN6u2JdtM/qDCaGK3jA/Wx+98qmkBnI5H/H61CMs+
         abbiAdQ9xaYVpp3S2dRXFO1JCqpFN+uFBJHW0t0h9IPijmx6h3XBS9PJbOUS36Cy0NBH
         2Q21WFVn21stg2DzsaA7hHb6LYQpPznAgQEkowH+Ilxpl1HrS+B51bGwTTpPGNsP3UOz
         9+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787955405; x=1788560205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+NVBt2+YV7TdDLoFYczsvx72Y9+mslXywiFQEZGZJM=;
        b=RYIpyYFbka5pz5yHfZYveFwL/CDrIy+7rDDSCmL3/zMusFHbeNyddlrSTfi+jVhvI0
         WjYoPCYXewkfQFrsLjBMEDoTbWp/ZbGdT4vJe8moj2uGPEar1/+WHsYypc9d7Z84+I0N
         kChK6zUAV1zY8TrLnFYdvLzVOskoq4M6NwzyBUfr4Zk9onw6GjbWIZnjYxCf5LaEPKL9
         +VbefkVAhEOCgJDjGaHz6PRkARSyEHIxsreyz1Sq/yR7mgKfOTa6oGO250Rbbiox3ccv
         mIAtKgfz6c9xN6XN5lbdEaIH/rFd/TZVl/91gS95ARnZU+z3NM4q72geMHgbpV42LTZT
         dZ+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwr3aX2ldZjnLtZwDnVrSzGqhwqxakslA5XheEp5ogXBAQHMo9VyLzLBP4ERisvFfwtyQ3rRsbK8Sen5ak=@vger.kernel.org
X-Gm-Message-State: AFuF++neki/yj+M2MNXmGd1zKiC8F+ZxOLY8ee4s25kP2ZB5/reO7wiX
	pGIKgdj4XxEPYQFWDK9Ej3HqGxZM9Jk1FNkpBquygVHnuN9Sdc/V/YDFUIS8SryKB2aUiA==
X-Gm-Gg: AYBFou1p7hLhGq9rzySZzPbrcvYXQrJwhLSI+gW4+fyBYISn8uGL0HWaVxfdpxk2x9b
	9j0dFooD2UD7oKP1nMQmqkXg/KSUu2g6wbKd6w6WzsgLTzvGLSBlXz4fpXk+ihiux8DF9vQhqbk
	FKcjwE2aHdSUBf2DDc3HzEM3S77dohzdxYWSQcDt3F4umE9OWVwv/gHXRgcMYgXcMbUFnFWozXw
	zyT0F5w7W1vR26phAHuquiUwJRPQ9x/Yvtu/xJOIhq774g33kFl5SE9n7+DNP1zeBfrhoBt3vyd
	ZxGcBpcoOAwnTWfLsG9ywhy+WwlibdwddSFLWy5oCS2WCTEBcVWr3ACT2yrEvpV2rxkqyQ4WPme
	pmddDdNDX8XDnRlgmJF9DYE9Xw4DkISdorWSCUsK5fZQhsO0fZGhPHhg3Gt35M2FAJG+UFZIAv/
	6eGJQ2mSoUxDmyiKvln1tzbsRBSHkXEvAoxjjzGIUXj1+u78YSf0z61yqsYugTAASka9b4y1qS6
	aLnZrraKEUY+eLXIITfu/EpiH3w/oqw6wp8W8kJ49CV3ecziaNzayMRaz0DXDvox5bYAsSS
X-Received: by 2002:a05:6000:4a1e:b0:482:e658:bb8e with SMTP id ffacd0b85a97d-482f79bf4f4mr17244716f8f.12.1787955405089;
        Fri, 28 Aug 2026 15:16:45 -0700 (PDT)
Received: from drago.hgw.local ([2a00:1d34:ebf3:5500:6828:ce36:77ad:ae8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f16sm6361576f8f.1.2026.08.28.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 15:16:44 -0700 (PDT)
From: Deniz Aydogan <denizaydogan1902@gmail.com>
To: lizhi.hou@amd.com,
	amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Deniz Aydogan <denizaydogan1902@gmail.com>
Subject: [PATCH] accel/amdxdna: fix race condition in mailbox send path
Date: Sat, 29 Aug 2026 01:16:41 +0300
Message-ID: <20260828221641.10034-1-denizaydogan1902@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xdna_mailbox_send_msg() reads and writes x2i_tail without holding any
lock. This is problematic because the DRM scheduler thread can submit
jobs via aie2_execbuf() while the ioctl thread concurrently configures
the same hardware context via aie2_config_cu().

Both paths eventually call xdna_mailbox_send_msg() which does:

    tail = mb_chann->x2i_tail;
    ...
    mailbox_set_tailptr(mb_chann, tail + mb_msg->pkg_size);

Without synchronization, concurrent writers can read the same tail value,
overwrite each other's messages in the ring buffer, and write conflicting
tail pointers to hardware.

Fix this by protecting the tail pointer manipulation with a spinlock
that is held for the entire duration of mailbox_send_msg(). The lock
is initialized in xdna_mailbox_alloc_channel() and acquired/released
around the critical section in mailbox_send_msg().

Fixes: 3ba13f5e7180 ("Merge tag 'devicetree-fixes-for-7.3-1'")
Signed-off-by: Deniz Aydogan <denizaydogan1902@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 271617347..337f89113 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -60,6 +60,7 @@ struct mailbox_channel {
 	struct xarray			chan_xa;
 	u32				next_msgid;
 	u32				x2i_tail;
+	spinlock_t			lock;
 
 	/* Received msg related fields */
 	struct workqueue_struct		*work_q;
@@ -203,8 +204,10 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 	u32 head, tail;
 	u32 start_addr;
 	u32 tmp_tail;
+	unsigned long flags;
 	int ret;
 
+	spin_lock_irqsave(&mb_chann->lock, flags);
 	head = mailbox_get_headptr(mb_chann, CHAN_RES_X2I);
 	tail = mb_chann->x2i_tail;
 	ringbuf_size = mailbox_get_ringbuf_size(mb_chann, CHAN_RES_X2I) - sizeof(u32);
@@ -225,8 +228,10 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 		ret = read_poll_timeout(mailbox_get_headptr, head,
 					tmp_tail < head || tail >= head,
 					1, 100, false, mb_chann, CHAN_RES_X2I);
-		if (ret)
+		if (ret) {
+			spin_unlock_irqrestore(&mb_chann->lock, flags);
 			return ret;
+		}
 
 		if (tail >= head)
 			goto check_again;
@@ -240,6 +245,7 @@ mailbox_send_msg(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 			    mb_msg->pkg.header.opcode,
 			    mb_msg->pkg.header.id);
 
+	spin_unlock_irqrestore(&mb_chann->lock, flags);
 	return 0;
 }
 
@@ -487,6 +493,7 @@ struct mailbox_channel *xdna_mailbox_alloc_channel(struct mailbox *mb)
 		goto free_chann;
 	}
 	mb_chann->mb = mb;
+	spin_lock_init(&mb_chann->lock);
 
 	return mb_chann;
 
-- 
2.55.0

