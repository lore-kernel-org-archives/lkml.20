Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482337;
	b=F6d/0DQ+PxA50BPPpf6tcTFTiNeJ6aYHgl/zSSQYXLJNrhVzys+9jovpNdU3I0yv8xWT
	 O3qFiI01NCKZiCklH/1qPsK8ovgzY2xMvdmNjgZk8izDTdYE7zd1mxH0Vqr/xfk051dvT
	 7YhhpnAJ+dO+m+/5jAsmZb+GwN72STVYHymKd2KcBERYtfP854SoxT4Gu8Z17CB43Empt
	 cEDW1Xa7ewhe/koAN4F+aF90AZ4JiDyF4FV5w1Ak8J5uggoMb3OGi3mHJAj+iABHCKxzR
	 sh/YMl5PEkdJAj2gCALZMd+Wm6yUlqoCO6dGgne20tlibVAzheMLqGnvdq/7TWy5m+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482337;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8PaTPRfY18/VrkHR3rlFWu2zaXTlaADkuWpNQpBjuZ0=;
	b=ltMnPoe3u8e9cCxC8seHlikLN4z2LIObKlNbbSLF/MjXUWfoZapj2MN53z9eqYUrJhsG
	 UNTzLGOYcGTQmFH51r6kIw19PKVodWDBi2q5HN7Ky4gJbfZpiUzq9S3cNgANMWyRnxTY+
	 qpXEml4HdmyZUr3cv1DKtZh2kFdgbDQiG0hxZUMtV9IGfUlBsmY2SJLM7wAfqm4ATd3ud
	 JJwp7AF99xwvkPYzI96jrNv/6VYOpxWJU95SzJNkowaNi0XpTx3HZvh72pC6vcFTYU5t4
	 Xp8qyJY5ckunvZdN9lfHkyWMenC45M20ycz5HbFis0M7wj3Ba6sDtmIye6xhicAUesA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lK2AqCxG;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59DC606A335;
	Thu, 12 Nov 2026 11:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C59DC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=lK2AqCxG
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6515633D;
	Thu, 12 Nov 2026 12:16:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482191;
	bh=CNvO+8+4X3vZ3+dwSeXTIkMpEyJGlbKDDed/6QEVRzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lK2AqCxGcEH+5Jdz2JbN0TXkWgBngR4tYVohgWpSfOgBLYxPZK9lvziwAkiPS3MRj
	 Fv1mPBQYsAGLRQWzz0+492lrtF55yC3XguZGgJ9ENNG0wO/2FpM0N0zPu6C1XWrIwj
	 E77V4EoG0FQ18OQipIMEXvS09N8qqfui4KDnxdVM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:03 +0530
Subject: [PATCH v5 05/11] platform/raspberrypi: vchiq-mmal: Support sending
 data to MMAL ports
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-vc-sm-cma-v5-5-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
In-Reply-To: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=obSwlVdM608icuVl5+YqF7zv8oNbUjjskp6328gSnko=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB4KjXm53vEFC2Ox3e3/JGfP9x38YpKfj6Dq
 ASo4JfalJWJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgeAAKCRBD3pH5JJpx
 RfcaD/9D9sW9bBcqrq4VykqwwaVwsfV+vxb5Qgfl8sE7TBPcjSInosaBsOCwwOenJCbknfAeEkB
 lOP+8sjtBXJf0LDaIc0ZVs2+g2mN7V59I2BiwHmZREUqQsorM8tBIfg3soiz/+S6toh9B3s68Q6
 rCvD0lC04RZdBsbiFVz2/Ezr/fioD7YwqhpB1e5zmqD7goOJvYwU1Mi2GYTbNAsfR9Y7tqMefNa
 oiQxi9rL6ao9btaA9yCDMoNh4Bk2WLSVmXwm7YrJNS6GeepS+xSYyClXD3LWE7HLJzwLJf3g3Ak
 5hRyR78sF7CrNH37BS36BlX014xPod6wEPmLG3CGMH2jEUy0/d4uqhP8UUzkvC/3zZFT7SxfUhH
 VknI/8dYCnlPzlyTdiVJU+ce6M3BNWdRZMtHUhS7xs1n1yvzXweG7D4lI5BPzV9/NR+5HJyBqUy
 GrGGSbZnt0iu8PRgfCv7cwcN3KJqJINlNr4bpDCWgODct33Gn5bCMFlC3ee15Z2hFDhZMkSYloO
 Se1dlXPVjkbTWqMUJofyEhsuQRqIkhyUSF4YjxSULBiNhFAksDmsSeToQuC5nP0OgZo4W89YQ0Z
 6X+Mh6/3TRH7ymEI63YYyjWZE+cwNE1bQjWBHJIKgLD2n+oLBZwBMp+eAiTKT7rzkB1T2GU8BpY
 iMFuEzlrq8DzjLg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add the ability to send data to ports. This only supports
zero copy mode as the required bulk transfer setup calls
are not done.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 2909def73f3d..5091bcaddd11 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -430,11 +430,19 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 			(u32)(unsigned long)buf->buffer;
 
 	m.u.buffer_from_host.buffer_header.alloc_size = buf->buffer_size;
-	m.u.buffer_from_host.buffer_header.length = 0;	/* nothing used yet */
-	m.u.buffer_from_host.buffer_header.offset = 0;	/* no offset */
-	m.u.buffer_from_host.buffer_header.flags = 0;	/* no flags */
-	m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
-	m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	if (port->type == MMAL_PORT_TYPE_OUTPUT) {
+		m.u.buffer_from_host.buffer_header.length = 0;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = 0;
+		m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
+		m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	} else {
+		m.u.buffer_from_host.buffer_header.length = buf->length;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = buf->mmal_flags;
+		m.u.buffer_from_host.buffer_header.pts = buf->pts;
+		m.u.buffer_from_host.buffer_header.dts = buf->dts;
+	}
 
 	/* clear buffer type specific data */
 	memset(&m.u.buffer_from_host.buffer_header_type_specific, 0,

-- 
2.56.0

