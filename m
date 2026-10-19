Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636744A6CCD
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400952; cv=none; b=m96U+T8S6STYSu5r0VpcZNiJN6kxJ6D2Ohf4AD+qb1J3SZo0O1eDa6gDk5lo3TxFpvyX4RDtuJ6kujuIoEpC94mQuO4MAoVloFdUqqo2QNFYPiMrQrcBb2tPQnpBcGOIC/wrgtc+tMtAFfbhXYoVcJmHFC5GEiVTfyaRrzZZ13w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400952; c=relaxed/simple;
	bh=g3YIZCSmW9GAuNcYS3+rBFyCUZV76NZ97hW9R/Yj5tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scYbUj8kpusQepur7XBY9+kXGhSU+5Q/oSOMH6SfHbzJJlBcZhFCZ4itx5iqmbsbs1ri7123vGth6Kxtfc2L9aiRXn5HEiVTWie7NhvfgdCehsmvIuhxunNRv2DBz55M8/CpI911fibSSt9EWxk9i5I/00QIaSOktmnf9sZAyv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQeHZTSd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQeHZTSd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1070011f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400948; x=1793005748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7CZlbVVy/xg1aRcpbMRq9i2C75IjWcUsxCiERRLUmU=;
        b=SQeHZTSdblheFcUkSg3VbHpbC1/P928UYEiI4678yEkpnTYvFTswKxHW9iqPr8ErDP
         rFws1KmD+oYm4QlEIDntlmqZKB31rEMQVtkxbf1FXxBAEoLONiv+MVNOn1On1ifQym1Y
         Q2oOOAmTA7P24bt7G6SwPcUV1J43hGq2BnkkN3jiMtOlHZaq1AU0HP8pKi889LB370Iu
         2tWoKRyGecNGEYYsJDA11TO8qrqEw/ttTn0tbgCIFMj3cSko+U6/92oqaSYCyjbYiEtJ
         HbDtD8ZX5dZ8EfXXslAAhlQqkHhNj6dafL3H/90CwJvLj02n7VAnzmyc3c0WRDx6wbYI
         7Ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400948; x=1793005748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7CZlbVVy/xg1aRcpbMRq9i2C75IjWcUsxCiERRLUmU=;
        b=JAQip4UFidTZ2RHDU2/yIIIpDUVQPIqFolWAS9HuZx/XdXnuKWWpYGihRoHhcZ0qLE
         o+6abeQZxlUnT5Gu03UMLyU0rqK3zZYOqX700khLYVP4ua2xG6rhuKA6mrpMHYCLkmKi
         vjtA6Qot1ey5s/gvHcEPvdVhZSoQYrw83VT6SuxeZfVBujrhjxMjA3Nf1SdtAzBqP55B
         3AtyEM0UpVeRJIEQHePFMaaxDUpZTiDJgHtooubZkbbAP4PG0o3Dv11KOeqiCYWDQHtT
         iebejWykBK2h0vqhXoaiomZtlchy/3TjOiBkmH5p4JCg1cCeDm69CM/w38j7l5jJs3b7
         1gFA==
X-Forwarded-Encrypted: i=1; AKwUvBxh6bBXYjuwcRv8XltgjHynH8XLv98HoBZqdZdXLaAvnrukrw/xjCIfFqsBOhduY4SF9DasLaIaNRvoYBE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKIkY1EDijYA7lPiBV6siRK14J84/w63A2tLUcKj61xFmd0/S5
	ycWQijwh09qVjgJ/Y3RWlBphntvvgML/zziTsT962zvfH8ZpdyOeJIJK
X-Gm-Gg: AYBFou192qrwCQ8r1H9jwGPLfiCGoZQLnFDJACraOSJsUMthNP9rIJDbnWqlgkbAR/M
	VSXuuvbovpn/ge8OjGyAGVy85HQtT2Dxl0QIqMfB147S3qbUT+el4PR8KHlefJpz+bfZ7Sh88g8
	vGTXyyklts0TGA97J+LgpG1QnOpl6gICE5cxMz36phO+5Og9ITl1g60u15YC1jqglFly3IJ99xA
	LusYTxpiyPzkzTicQkijX1/rWpCHt1wOWRDz+3mKThMxrVMgmqclMzNXerjFWmAWsrva0JqJGBs
	okM8zvxOQSJOGDrhrMFyfazNWnakPSMjazqjrcryxX3wkeznzVlweEREa909EZRpFohMnSkiqsI
	bJ9rKnLAfrFrWcpAEWucnsEiH6aFZVLHIXaIRq2IakBbJdTY6CFCAIFbTnOGDJcNQkAhFftorrr
	mH8PN4c2WMpFDIjkjbzMwDkljnDddYzEHUzFtFj4GYHNWkzUW59+1dFz3Vhg/tCxX9dKGfL5UP5
	vf3JXhsWzSkRwQ=
X-Received: by 2002:a05:600c:46d4:b0:4a1:d2b5:38e0 with SMTP id 5b1f17b1804b1-4a1d760d9d6mr149685135e9.25.1792400948349;
        Mon, 19 Oct 2026 02:09:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm174734465e9.5.2026.10.19.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:09:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neill Kapron <nkapron@google.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Wayne Chang <waynec@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Felipe Balbi <balbi@ti.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 2/2] usb: gadget: u_serial: implement flush_buffer
Date: Mon, 19 Oct 2026 11:09:04 +0200
Message-ID: <20261019090904.3264978-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019085855.3259716-1-mehmet.fide@gmail.com>
References: <20261019085855.3259716-1-mehmet.fide@gmail.com>
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

Notes:
    Changes in v2:
    - none, now after the patch that keeps the port alive for the hangup

 drivers/usb/gadget/function/u_serial.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 19eea724280b..187a2598181a 100644
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
@@ -946,6 +959,7 @@ static const struct tty_operations gs_tty_ops = {
 	.write =		gs_write,
 	.put_char =		gs_put_char,
 	.flush_chars =		gs_flush_chars,
+	.flush_buffer =		gs_flush_buffer,
 	.write_room =		gs_write_room,
 	.chars_in_buffer =	gs_chars_in_buffer,
 	.unthrottle =		gs_unthrottle,
-- 
2.55.0

