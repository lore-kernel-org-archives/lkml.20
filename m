Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA037F318;
	Sat, 17 Oct 2026 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792239067; cv=none; b=fjvV+74WsjwfL6DlEtIiG2Nw0V589/iiO4BlNZWrhgZcKZaMGwCNOReekxwh/BcQAUq9MFaqQfBmDjIewK3+xGKD5yWYMU9gAPDJx7wSCPlLkBg1UvNrKnbyGEJ4vXmo5FSZu2TCXFIM7i9Xq2bTTNEzIZm+QWqW03mGNHoFgds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792239067; c=relaxed/simple;
	bh=BM5MeFN2yRAcUZMBQ1kVaJDLyC0kPMwPZ2Fc2V99c+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eUmQPMWsoaJurv8g7f6lr1NirjID2Mxmv6SuvOzEwpAbv+dg2XyhZJX9DsQyCStXm2Zwha3/91k5r5Z+YOhpSa48LUEMw6igAfuhpwpx3ar/R0+yC7ynsfpIPEv89lmb5FvoNttvN6cFnKcJWUvKvP++88p9GMlWmRf8SRvXsX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/+a8bc2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/+a8bc2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B121F000C4;
	Sat, 17 Oct 2026 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792239065;
	bh=veQdq2zi4suj+sytjBTYVEHORuVM5dkp0/o3mNbAOmQ=;
	h=From:To:Cc:Subject:Date;
	b=K/+a8bc2gLBBjRAX6SdSD4Xneiu0ZcZA4iBBo8XjYcU5HatnHnweU7rmdSyeAw283
	 yJc6rteOOGoQfWZdR8kOcelqKQYLAZvvGGgcSXwvug212wHf3CyVpaP3myRDDKixF5
	 OH6cXYawwdrdKkjc6bUwJuzeKRTWsFV1HNNIstwm6F29apVlRMOAzjqtWre89uyRwo
	 0kAZuN4lYTinWig0+Y6tETUYneuqFXya7fNN9gI/pNcohdtcMQIP3DdKsHt2DueWpX
	 53DuEGEHQem7LeAACudvbIejSXwytVV+jNO/cUOVyzT81JPduAwwGVB2uSBubo/nRO
	 PAMccXJnWoPFA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xI3Ff-00000007SXx-2qTt;
	Sat, 17 Oct 2026 14:11:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: garmin_gps: explicitly stop read urb on unbind
Date: Sat, 17 Oct 2026 14:10:19 +0200
Message-ID: <20261017121019.1777984-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The garmin_gps read URB may be submitted from the interrupt URB
completion handler and should therefore be stopped after stopping the
interrupt URB and before freeing the port data during port unbind.

When a USB serial device is disconnected (or unbound through sysfs),
USB serial core stops and poisons the port URBs before unbinding the
port however so there is no risk for a use-after-free in the read URB
completion handler even if the driver does not stop it in its remove()
callback.

Stop the read URB explicitly for consistency, to avoid relying on core
and to prevent false positive reports from LLMs.

Note that this was erroneously flagged as a use-after-free by Sashiko.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/garmin_gps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 8020149f5658..1853dc8a747d 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -1402,6 +1402,7 @@ static void garmin_port_remove(struct usb_serial_port *port)
 
 	usb_kill_anchored_urbs(&garmin_data_p->write_urbs);
 	usb_kill_urb(port->interrupt_in_urb);
+	usb_kill_urb(port->read_urb);
 	timer_shutdown_sync(&garmin_data_p->timer);
 	kfree(garmin_data_p);
 }
-- 
2.55.0

