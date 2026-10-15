Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4553C3CEB8D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081671; cv=none; b=o4xC3VC1ZMkwJ1Tqm5KWz+THoqHcb//h9sS7hnvJGq3cSjrjzi4+TsWLBpFooemOz1wFOT9WOsngRW8/371ndlQyw3TU23emlg+bTPBEbuoJlv0bPjlvw4QCM8dvPcQdjn5cHeUUx/MDGHQEZ8HbeV4COLyV46DEKv5Zwq5DO+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081671; c=relaxed/simple;
	bh=er4Tuw6Gu7IwW8odH4NBEXg7Gjk9UavWAoCqAR/3EVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HWzJ1EgTYLUWY9Oo0Hds6hj/bhqdhH+JVQ2AthtV4HhEVxLjJKNS78viVEojzce4Uv9p3U8zAmQ+DjvjbnF3BrcgRPPfOFP2wamyQ0ZiuNy16kp5EE+5D21NpZwl6piWT+tFb0F6mk/yuTN2YDafutAgwUlAzb+lW+EDbi37D8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBZUrmHs; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBZUrmHs"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48af27fe287so593707f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081654; x=1792686454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X84a90E3GFkeZ8GJPoTzUj9Kph8WHPax4PI6IgjkQJ4=;
        b=CBZUrmHsRopppRw/+MXCKyc7W4gS4aS4yPpWNLxFFhSAK6cxDQNlkU4Xi+9Bx19IiV
         hLciPgzp/1CivreewRgoG0etsGpkMr9psQJhsWDnnH6OFrqAI9L7W/voq64tvupSe6ro
         18eN58iPAkVBHtmPVgtQQFZ9c/+j830gRdYEW7Se0KvUeH1BhfdnCJO0qexWID73f1WM
         3W9azmxJm4Z4oARQ8DqeGAfFsqFKza9aSHb7vn/e2ASyaXZBBDohjkLC1tVzZIB+Limh
         S+4bypfd+ZlxMCkx7oRt9c1MM278QWfZO5xwo8a92Cd5+yo8eKQrAJa2M3D0/sWzTvhk
         bUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081654; x=1792686454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X84a90E3GFkeZ8GJPoTzUj9Kph8WHPax4PI6IgjkQJ4=;
        b=0p3V6L6LEwevTd1+aj2gosUv40D6ab69AM+HHMk/lkCeAbBgbns7VFcaCW4ZzWX29i
         fNJKDtLRAiHPR31QACYC1XVlT3oFKALnWMrbd6DnnxLwdAhi+UecBaTg7mm43HaXkmZS
         CI1p/hJhtqNBUbG77IDJqydSa4PoeH7FGbLAmlrWQzFLl8Wq4OJCwupBC0Ki9DDp3cCQ
         HIiM9tX/+pSslyaRBLJ8KBac68xoR6ATs/TQCHelK5cdzxzC/gN8K9R7SkJEARL/Mcgr
         7jvYQty+Au2Ax4y+F9Ff1PnyAOEhWx/wDkYJRr8oqezu5BAfqJ6PtHjuGubtav8ueWDN
         NXhg==
X-Forwarded-Encrypted: i=1; AKwUvBzsXPwJ8jeqYfinh7+YQPfMb6DSquzlbFpDgAeKCHAjsl1CU14BL7qjASWaleqQxSkbInwNZqsGmq3oYVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPIc1DRkat8/dnCR5WbKnJh1zomAh2PMR5zNKMO5tgEc+FysfM
	Mv4esrht/6Eadcu1IOFKRjbb7OmWKl+NJkkuaDCz1b6W/utjP/zy41VH5Ov9sIcN
X-Gm-Gg: AYBFou3HDW5ut8sCKKUNB7dlJUJpSqsBpQbAZvJqmE2/taXd5uIzzbckOaHWnBn0/cb
	DX6SXlM6Zs54wJJXkDA8jIAkBcC3MGMFWLru0a57SmtMec4SV4Z7BV2IPhyt0NYTHNNUTaoRPOq
	/Jr4WMNdJdyGbpn0UGOsHODPHpcDuMVVuo0PDD4L6e7al1aIWwF3tzk9IV20jMNLlamJWvGlul/
	Ks6UU1V8D0tJ0C1YkFPzPls509zAceKGpSqT9QQXPJqgjjx+zgX0cNHLX35/qJqXTGQEROkOjrB
	L/eMZjrk93b4dgZlX4KRH+5YnoSPhDW+5N7a23VigpgBO+blBjDNzIR/OJvyjX8BBvY1khtxb2t
	04l09AOkNx+LdVdbeaR97SdMKJ+svcSPW8uNKV6wiBjwTqawCIGkN5ugQGTxQE4I5sv03r79Jni
	uJ0zPwjhVy9voekQXUysObwX6ZGEp2kQn57UEFdZ2VBAvzkvuSUzCBalWSMRV7eAgo2EvEOTFqE
	KJO
X-Received: by 2002:a05:6000:26ca:b0:48d:c15b:5d29 with SMTP id ffacd0b85a97d-48dc15b5de2mr37647508f8f.2.1792081654031;
        Thu, 15 Oct 2026 09:27:34 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm19029652f8f.54.2026.10.15.09.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:27:33 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH] usb: gadget: u_serial: implement flush_buffer
Date: Thu, 15 Oct 2026 18:27:32 +0200
Message-ID: <20261015162732.3170938-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

gs_close() waits up to GS_CLOSE_TIMEOUT (15 s) for the write buffer
to drain while the gadget is connected. When the host does not read
the port, for example because no application on the host has it open,
the last close blocks for the full timeout. tcflush(TCOFLUSH) cannot
avoid that: u_serial has no flush_buffer operation, so the request is
a no-op.

Implement flush_buffer: discard the buffered output under the port
lock and wake up the close and write waiters. As on other tty drivers,
a hangup and an interrupt character (ISIG without NOFLSH) now discard
the pending output as well.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/usb/gadget/function/u_serial.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..2b99e33cbf3a 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -822,6 +822,19 @@ static void gs_flush_chars(struct tty_struct *tty)
 	spin_unlock_irqrestore(&port->port_lock, flags);
 }
 
+static void gs_flush_buffer(struct tty_struct *tty)
+{
+	struct gs_port	*port = tty->driver_data;
+	unsigned long	flags;
+
+	spin_lock_irqsave(&port->port_lock, flags);
+	kfifo_reset(&port->port_write_buf);
+	spin_unlock_irqrestore(&port->port_lock, flags);
+
+	wake_up_interruptible(&port->drain_wait);
+	tty_wakeup(tty);
+}
+
 static unsigned int gs_write_room(struct tty_struct *tty)
 {
 	struct gs_port	*port = tty->driver_data;
@@ -914,6 +927,7 @@ static const struct tty_operations gs_tty_ops = {
 	.write =		gs_write,
 	.put_char =		gs_put_char,
 	.flush_chars =		gs_flush_chars,
+	.flush_buffer =		gs_flush_buffer,
 	.write_room =		gs_write_room,
 	.chars_in_buffer =	gs_chars_in_buffer,
 	.unthrottle =		gs_unthrottle,
-- 
2.55.0

