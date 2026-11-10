Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285021;
	b=IXHHjBP5LoPx9P867MexeVfZ1Hh554E7oPLDvhya6vx4qT2mLtlrtIuHT2TYqQCuRmdR
	 A3JncXWYye3XyjCZ1ofp508RY8Cn+1SWJPCQ/fbGOvTNrWR55/DE09Y9qMp4mbY74+mC5
	 AaBwkxwlPTPraV5jxy/RQJj/oLZJtkCPp38IiAEuew5XCErtOSrinKe6lB4tkzcaOhM9E
	 JuKP+xFCXPbdVXl4dvF240GH/Wg4gwqIQBvD9CCRL3x+CVAJmQWo7UAv2QqTK/LG3cEEW
	 j5sXJrIGQoAXcg3BtX6T8gFfKpvpoYqz8nmElmmKAkK/pFKx+3EIvaZ0zdqiL5fe8Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lyxNlKJrr7VosEoWkysr9zOPM5Qv8W1t3PwxQZCtDdg=;
	b=blBAH/h85OzSr/EgiSCS7vqd4PeAV9OOKENe7s7yZDUKQY+qSqcUQf0d4CMzeIl8xOQm
	 t7XSBoRC8l/Qy01EnXsn97SjNDAQSBvQPNF9ofDccU1qlg1gIBBL0iVkx3ZlZ1tzvCmXP
	 Jb6kidBFHX1lo+1zfzuZ2NC7C9IfdGQlztoF3DPzRvNO54mgi2aG23NOL2vjyZ1rxVUkh
	 YNegKvonRrn6wmXHo2jEI0AxxSGrDw/GNI3CTqyHupryzcPycUsTkHcG/KfNiwhAMUPkF
	 7ghXGdOFknReM3OYpEKQ98FpSN8isKMjr4/PCJKUPWLt8BJdP6zmlFMtdnu5Flx8ARw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhLF37tq;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C795B60A2614
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C795B60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yhLF37tq
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f2049ea7aso106511985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285020; x=1794889820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lyxNlKJrr7VosEoWkysr9zOPM5Qv8W1t3PwxQZCtDdg=;
        b=yhLF37tqJVy0RfoNOIf341vWvPM2VDB5/dEMhzJJI3vGi5Rv89+jEKjPQLGvAd9+EE
         B136HDRR2rEQSDkoJEXw3SjIp/h8jyoz7IFvxJ/N7oaaNQvJfagJt0d6CcURrIi/LlRZ
         ggYx0BKb8mxQ0nYbwkFgg9+sEBPGIt7Iy9c9Obg0g+ARQKLkJ0qiSHKMBiTJt3vDA0Ze
         b3vh6CD1rRKiF0Qx6tPeGkb1QYRW4fwGtemv/fN4QLEr+SBoI+1gGK6ihzmqSAw33wKk
         nzRkugrVd25XwNdm+pPLt7n60ejuUE924YhaGX1QAsI4vl4RZza8hQKR3UMfrV0h/uyl
         d/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285020; x=1794889820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyxNlKJrr7VosEoWkysr9zOPM5Qv8W1t3PwxQZCtDdg=;
        b=VJR730c/gyVsqBmKfToNnczPtbNvRy4bfqszZrxiJllCXdL+qcKOXwETTWlmlaO16i
         +pfCzUFFWRz+hOndDzLn5RfpNkBSLkMbxhtNVdWSIe4v54Pz89l7/2+yGCc18OSHxFTL
         eUl2/sEp/a/EH4R/QkjVKa22Wp6vso6OfVvqh+pbrWUwUPLooKEo0hfoyiko9Hn4PrBC
         VuNcWoS6a2uI7VpWcCpY8q6kfHJmiqxVL7cweY251nHXRpcGPER83cnDK/vFE7R0SYM/
         /KMF0ZypD+G5Nj+QALwkDCuEUIm0AU+cNComFHbCVQOOgPxFuRLfUfkxgd4PrJ2Jz7U3
         L6mQ==
X-Forwarded-Encrypted: i=1; AL+hErGdlc7szJBug1+DRDRM5nYR4bEjlnpYP3hn0nNAYOEqBMDcgcpZH1BqKWaVH+0C7NX72ILx6Ojm2ZT1K5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wOfvSucnAvBxI97yl+vZ7yo0Z2JCKGQ6cMezw4AYmwDc2Duvq
	Zn/XUl6sgd9qaHdU+CMW5GtBRb6hW53WdbWpCS4XN4dBrvhLQoPzvrE=
X-Gm-Gg: AYBFou12Tos62iA5AIcg/FDgEWZmiF7hvDk94DTOMrWDjs+BWtRqXYBFVl8AN4I0UJm
	cz2VLPVO3F8urKRkRbI1JLgRNzTz++rEtl+6XZhVgAwjCdVTDeGDefNHNWgnhwfHA+yXAzmywQH
	dmJQLJhFk2Ax4NSSYwlRajB4YlT86GHVmi0cypk7H4ZA3BRUZXh048fx3TEyy+xZbKET7IYmZMp
	2qqhlDAuxq9yl42ZAU8aGoruX8Wm1hW+T2vUPtN6y38HYevE8a9dDLZ4D/iBsIwaNCeSjqzY8gQ
	kOnnTr7TUtE1sMI2r5ckNicmHDZbDbn4MvRGM1a6THna31O8ecLebRl2jjtZ4aijij+6rYe1Psc
	mL4E2XD1fDMhTfPCgT9eUMGk5l5CZXy4XKDRcHL+ynyvKypahc0W53jmYxozEqdaDQXJVLMvZX8
	WWHxa+VWepkAFnKHSe5/eyB4dykD4cMKQpMvskWosMv7qEKiX9SZIvIVWayAXSMC9xGFIex1zPX
	FlJQJ4znTofSgduBYDQkw2smAghGKSPez9MlNlFVsNzrP97cob+yq8JGoSkw/NTfu6XNPbmhMog
	uxjWbT4K1xCV8deeAhNc846aBcpWYkFG39TY8MeVQuzRBkqAA4QWMGjV5wVtJ2k4B8070yr2Qdi
	9yIrqvAscZI6LPYkW+/LrU6WTgZoOeOLl+Fq/ZCR81DvGifi78l0gqGXIa3EPApUq
X-Received: by 2002:a05:620a:2a08:b0:93e:c12c:9b6b with SMTP id af79cd13be357-9479f3e4359mr239464285a.70.1794285019816;
        Mon, 09 Nov 2026 20:30:19 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e619affsm136779285a.4.2026.11.09.20.30.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:30:19 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH net] net: usb: rtl8150: fix rx tasklet use-after-free on disconnect
Date: Mon,  9 Nov 2026 23:30:16 -0500
Message-ID: <20261110043016.56986-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

rtl8150_disconnect() kills the RX tasklet before killing the URBs.
Endpoint flushing does not wait for completion handlers: a
read_bulk_callback() that passed the unplug check can still schedule
the tasklet after the first kill. During driver unbind, disabled
endpoints make RX resubmissions fail, so rx_fixup() can keep
rescheduling itself and access freed driver data after free_netdev().

Kill the tasklet again after unlink_all_urbs() has waited for all
completion handlers. tasklet_kill() drains any late tasklet and prevents
self-rescheduling; disabled endpoints prevent it from leaving an RX
URB in flight. Keep the first kill to stop an existing reschedule loop
before unregister_netdev().

Found by a static analysis tool under development.

Fixes: eff674a514bd ("USB: rtl8150_disconnect() needs tasklet_kill()")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

 drivers/net/usb/rtl8150.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index d51e43170e03..98c36c377956 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -971,6 +971,8 @@ static void rtl8150_disconnect(struct usb_interface *intf)
 		tasklet_kill(&dev->tl);
 		unregister_netdev(dev->netdev);
 		unlink_all_urbs(dev);
+		/* A completion may have scheduled it after the first kill. */
+		tasklet_kill(&dev->tl);
 		free_all_urbs(dev);
 		free_skb_pool(dev);
 		dev_kfree_skb(dev->rx_skb);

base-commit: 0edbc945eb9edd0086f25b151a79cfe4adc0dfa8
-- 
2.43.0

