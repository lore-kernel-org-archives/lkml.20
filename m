Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704908;
	b=TkMw1nbALk9Cx0e00H/BYl6cSyyCxmqvEzXKIr+CfyeVIcZO7o964983Qgx/Q821I2ke
	 vTn25Hxp2n+himFbeqTYRumk2kFZ+Ie+G4b+5x35nlqfL9Yi0B6lJ65ulFtkKG3gSLByI
	 2EU2udxUqm+MnmEdgeOFJ8w80/RpWKfg2W7u+UiwoAv03TtTLKUh1Vy9Ae+PF26KmDA6k
	 +Nwx7PGXbMZgGHtX5oHQd2Wd4K5mi68mAN7a5RGhdwkqHQ4dRiRuC5bRynfqoA+OEeGWZ
	 aTdRisPM99nLqD/hyNjH96Os6Fnag2c0potsfNGe7BDCaLMgV/xFoWRvygojtALeCcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mVXNNrUzL4JVfBqwkPb92DjVAJYfDjQQxq0TjJeAwMo=;
	b=w1mKjLJvu3nF/xHVlXyDPqSqGtyeJgrZqhbs2Or41mqf/8ejaAecbKMFGeoyhqgLXdeQ
	 iEkRCTzTphNOmBbyxSTa5TNeDRUpUBUulgvw1YEzSGbMNCk12jOIBigFhvEWOCUrcku8Q
	 TXKqUjgMZcVo5a9LQhlbdTQzOTYA6Nup0FRDjxgg2LMS/Al+2VTmGuTZDRb/ooGtErglq
	 hlFDiUncfJfZhHbzeIvLRCsS0HP9DByFzHo96wrPfEJ74hkMA3U1gyK8Ny7+UDUr9VBZG
	 e4nASTyjvnx4lzUmoPTcj5GAByDYFd26doW5jN/ISJBRN/OKCkfg630EKvFOmUXU5VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=wwxYlM3t;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31471606B13F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31471606B13F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=wwxYlM3t
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32849535e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793704906; x=1794309706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVXNNrUzL4JVfBqwkPb92DjVAJYfDjQQxq0TjJeAwMo=;
        b=wwxYlM3tmou0xPIr+/99ZsG8KHCvZNc+dZ43jiU04HHBThPPhv1Ug8wwbA4nRfgVvQ
         RJrWUl7S2Tl4euGA0R1FZ2CM3jCEdRwfDOSeytdF7syYQcEYLCr/0JOIm7winvyonDRA
         g13vfFMYoiYVnlMOm+egPr6cg1n3MpK4BSiMXBM7XKKFr8UTI9H/QvpQTUOQsBN77gx3
         gMomt6i57p7Dg1Aba+HpsxN+gNjK2nKNbQDfyxhTFhrA5w0VUjRhmi0rYOGl86VvBuCe
         D5I+PLgsbIwzgsANRKjaKM/Y4nZ8FNVvFlELsKO78xrVN5M60vx+7kAbOBlTCXp4NnGp
         POuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704906; x=1794309706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVXNNrUzL4JVfBqwkPb92DjVAJYfDjQQxq0TjJeAwMo=;
        b=1NygxZ9pOiEbHDJSsyDfL4pUNHg9veP6ewruZaStzx1uue2JYYgYtdbp5JJKjgVnUr
         WX4pe0vhv6UEko04GBEvQk3Bz4gvQL7sH2RdOyzbMlXllYhZL6XH6fFqws9IxK6rI6Qk
         VOmvUNdGrC5iUGfmuKsWE0eVyOpjCorxQdc8hSo/sDuChLIirKIZQmhq7YQ1tkxZc85h
         r/MKRih8QEpg+R0Skb5K7m0BqsrZHsf9Xs2+lznglPALdZY/QIv7FTAJHNVStSJKDeg2
         6tQ7YczCtAAuBGuIYeoxSgpHvQBvtG/GkrF16HKDkqcyM7SSEM9j9BBDJ3VP1ehNMyDp
         sgBA==
X-Forwarded-Encrypted: i=1; AKwUvBwlc5+9o2HHN3XwPBHheCPsmIPlITp56TfH4sXp5NYEzfgpsyibX15EZC4gsee5FUNEUKx++/59C6Jr0bY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q+N47yhtgV/aO5gWUq4Ee1SIOIu7LHHyb5H3ps4VhAr0b8HWC
	Z9iWRQ2eeQ8+RXNAqxBGfHzbaa2MWYoMKpmLY9r+yd+wnvH5nG30ARFB9Pbb6oybk7pqh/Xv7SZ
	dtWdXhQ4=
X-Gm-Gg: AYBFou1dN3osK2cqBsFrow76BReAcIW0QS/QWH9Q2AbgqWmud/8rZd0sB3S8vlBydjU
	TwxZu8CEAtP6tQRcQg4NAYmOyxI4MlqAzY27PPRMUfBdywZCBC1V5GXOropEAwrQZQdeTpHKZmC
	O3ArJLgSWCZWtL4B11hEXOTQLbXuOgaCQTy/q/teoCtfDZpdY/bHMpcEMkRdcpbN+JmOA7eL0XU
	E7oBTPFozRY/+1R/P/e7T7Xlu6ryx7gMWJ3SPlVZwx5Oqk2F4hdYShcX59AHIXT8ZT61Jd1gkIE
	eVnwCb+9+QjgcKkrLRwfhLw7EamXqlJhkid9okGaG3c2ryNo5Gv6tz5iW/AkxEVVcU0rzCwU+mI
	2ewLp1aHsUx90VTLp2r1MlDhu8/H9OluiNzeXtDdz8itIc0fx7X/nojrC/19kW+z5DAJbr4txPt
	uGPnFhx+z6AgnarNG44G06FH11f+g69xUIhiks0C1ReJzQTeFxnTHP3c099eL8JIaJAjmj3RuZk
	F1uvXUYlQeBlLSvGZ/kasZ3/MI+8kdPhzwWvYPULIqYbMMg9+iercMIhgvObWlGXYSXfMdCKIp0
	hZ3vQLsJrcV0k2iHQldIxFgkmwFp2cZ6kMe3Jx+RzuLnoCxWLXJGzcUQ2DxSjo6RcgXn0UsnrK1
	BdxmgovhJJw==
X-Received: by 2002:a05:600d:e:b0:4ad:181a:4355 with SMTP id 5b1f17b1804b1-4ad181a44b6mr182386425e9.26.1793704906599;
        Tue, 03 Nov 2026 03:21:46 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm76135345e9.15.2026.11.03.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:21:46 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 03 Nov 2026 15:21:22 +0400
Subject: [PATCH 1/5] usb: typec: tcpm: Stop a source from repeating a cable
 Soft_Reset
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
Message-Id: <20261103-husb311-cable-comm-v1-1-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
In-Reply-To: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482; i=alchark@flipper.net;
 h=from:subject:message-id; bh=zxAJn44JdpWKi1AW3DIpb8Id8E278rpA6Y1UkZuFeVM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9PHzk5ekLpwPOcmq1frV7e2zam6pd0zas3av3uXMSj
 3vI6a2b7nRMZGEQ42KwFFNkmfttie1UI75Zuzw8vsLMYWUCGSIt0sAABCwMfLmJeaVGOkZ6ptqG
 eoZGOsY6RgxcnAIw1YIOjAwP9Ox4wsozXDKFyxY91tqiquoZILmmumXCpUXaJlaVV2Yz/LNdeUy
 UZ9F+rpyqNQGz3TPV3/c+2FVppb80cq6motCBZBYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A soft reset AMS starts with upcoming_state set to SOFT_RESET_SEND and a
call to tcpm_ams_start(). A sink then enters SOFT_RESET_SEND through
upcoming_state, which consumes it. A source enters SOFT_RESET_SEND right
away and leaves upcoming_state set, for the next SRC_READY to replay.

After an SOP Soft_Reset that is harmless, as the Accept handler or a
hard reset replaces upcoming_state. The SOP' Soft_Reset sent after a
VCONN swap returns to SRC_READY instead, so a source resets the cable
plug a second time, outside of any AMS.

Clear upcoming_state when a source enters SOFT_RESET_SEND right away.

Cc: stable@vger.kernel.org
Fixes: 6bd181ba60e1 ("usb: typec: tcpm: add control message support to sop'")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef5210..c0c54caf99d6 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1914,6 +1914,8 @@ static int tcpm_ams_start(struct tcpm_port *port, enum tcpm_ams ams)
 		} else if (ams == SOFT_RESET_AMS) {
 			if (!port->explicit_contract)
 				tcpm_set_cc(port, tcpm_rp_cc(port));
+			/* entered right away, so don't leave it to be replayed */
+			port->upcoming_state = INVALID_STATE;
 			tcpm_set_state(port, SOFT_RESET_SEND, 0);
 			return ret;
 		} else if (tcpm_vdm_ams(port)) {

-- 
2.56.0

