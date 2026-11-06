Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007409;
	b=JECoH9IWeqhz/bZFhGnkDnnNi8CBVRMW+Z0PykSw+9LqwnB2YS2QMM1aTqgUAwZS5Iqk
	 reEDyM+x6m63kqsDtKIcANmjr6zlXYj7woj0BEiVMKsrlu8P45vRJnGvExjYFK4y5pKcq
	 BSgh4YDn8WFPunYKUdlN1Ab2CZ/+uyphhNcf602A3KbhfKDzMhQiP22VfYys6vJX0OlIv
	 UehbNCzxUmcbvCtJUN8SGGpf9OyB9wNFc71H0QWB/hXO4IOYMvydcrIBfu87VTFMILvlo
	 OwvhHYOBUhltwrsI+DZQr+FhU+9kfFn6suM0qDGL3v4oeYxBUd/2O40b3+lmpdGO8nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HFolVHsdlQxrFn7oJcUktRPcmpRgRmH6vLNq3RWKHsU=;
	b=T+EpjWThLPpB9ljNrd/dH1zeMbQGMBUKzrvIWm5/dP7lsRHKZAOcoNICmkc2f2gN1bQC
	 vrMtmlW45QrDAne6xxkXnq3GxkE4+LEwznGz8FLEzDKhU6IvVldug6taaomh0eqCncuB6
	 W8V0YnGN2d0lbr+E8V+YsfMvU0LrXAIrlES4qJGWXsdwTKQNKNMcXbHA1cP2kU6aRVInY
	 P2uGLgrCwCo3Q11K1RUxWvgba8lqqEjfrTaroqpGI4BIXgXQ9LouukcxZdp4yQ8zcWvqO
	 OvfwSYCWDGOymcloTUhUrelvqdAmw1TYh92NsJlEUkRd8LKBmYE0BaB4wasndCEOyew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=beLxm6Tc;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E48606D81E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E48606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=beLxm6Tc
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b29049d80dso388141b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1794007407; x=1794612207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFolVHsdlQxrFn7oJcUktRPcmpRgRmH6vLNq3RWKHsU=;
        b=beLxm6Tc+6Bxsxoeh2ubotiYZME2+AaKr51XOjMpuAM+32lbdM0ERjIFNpsP6laipI
         wOCiy8RKV3rp5a8r2vBwM7Ko2yk7VBEQ21t9H1AWid9L9lq/Cv3SucgAN+DSkr4alx2O
         PQKAmsj3j5iYVD4RlkwnO/ClKhDu3DaG0mcYwgaZYlJ2NxXBZgxEtIy1HKJj9s5AreV8
         L49LkACX8K5T8lCSK6843GjGBjqxDTZcEhqVu3GtqFba8zdK60w4zgOaeUgcsqSON2ha
         hpPFXsPo7rqDqh1v8Bgx1Nf5f8c+eqFMpEPjWiU3w8cUJfheHpNa05ny8zTBNzIMtS7r
         LJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007407; x=1794612207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFolVHsdlQxrFn7oJcUktRPcmpRgRmH6vLNq3RWKHsU=;
        b=bIENPcTWTHY24OMpMi4DYsfvN4Oc+sMfDhkafZAlRKN1owGXKhPzR6batsyB8g6dWo
         vcsV9YCpPhI2+9BQ+DbwdE83MUSPl0yNC1rk1MbFCEHaU2EGsKbqtuGWwf7pFAD1CtIi
         ppBYDGwOEvswRO8bidXxrXrjQ5sFWSynNwj96t7HXBhDN43TFkzVFRvopEj4mQ1AkXwO
         GlGfgZX9gL/QeAWGVYdMso9LRNeINYMFrhIZB8e5iZ+MzMTpngowoPB3y9XyHJ4AH6SV
         myRfDf1yhlYGfB3Bo9Uo0I/pOsymCR59qJTdWojjxTK94O+YOa9PzsZChj+wm6LLv5Cy
         BzVw==
X-Forwarded-Encrypted: i=1; AKwUvBxsxEhCVKU8TKcJcokAIr36yG+i6SX23eoUjdDO7oPE/QbRA22g6/+c5pNkkzSgqOT3OpSEI8vaxizSrQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aOCq66fNggfPhMERFmwjoXRC8vTe/EcQYUyu5VWI0Q4GiHT9t
	xhZYS6slHZQoPxtgcS6JorRN+o7YzX7FBSaG91uK23qZl+Nembaaabe2fjJhd2sqoA==
X-Gm-Gg: AYBFou1CjCkhu4Nlnq66jw9iPPvO8CDcZaTF714any9Ugx2VRNA7RxXqjMVSzEON2qr
	4lf6pHzkFNABXAUXkOlsljFI4GqAMQ9WDI7bIODm4x0xxvixFxdmaS3W7y+eBhBwVf7OoPXWgWq
	mGDYihhkCiyfMG6vC4nqGfmOj11CPJdsVhnWgTZ+YtPlqDfTYS7Irh48rUAArPUVfi7GPlVXVH0
	PuBMRv+AeejQNnG82KphwZMsdFbWmUruXQRdlwFT3mzxy9Bd4v2HnR/hStD7FV4qeykrQIQCnsr
	n1n9cNT8vg6GbX/iMnK6rk9oCrH0fsQSkevQ695v/5qfgIwc4FUsKiXT+KyO0gBrZzyL9H6s46B
	mD+2h6Y+6cBuh6map7+2RyaGXHF6iVtHxN7cICLzZmmdsQfqsm1ewGFGFid5hWgLyF9AjVn6lh7
	uGcYQPw/9WvPuU/OCInu9WAec1tE9mj+Hs5xTL+Wg+mKON/oW5iF26KiWmqCbrHcm0BII0kgQR2
	Fz0u/GohNiMt9cA5AS9gzlQdf71iv4tYRIUsbiK4myOtce5u9vk65gMeVaUpytvV9HnxvCLBibe
	HtoEbzdJcu+IrDOBD1wx4L4f0vXxrNRLRPOv8ZfhTmugtHfEaAbX5yuN4o0=
X-Received: by 2002:a05:6a00:4515:b0:89f:e1e7:e7e8 with SMTP id d2e1a72fcca58-8b37aaa7740mr3885857b3a.18.1794007407226;
        Fri, 06 Nov 2026 15:23:27 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b356c2c5a5sm973657b3a.7.2026.11.06.15.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:23:26 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH v2] rpmsg: virtio: Reject a message shorter than its header
Date: Sat,  7 Nov 2026 08:23:22 +0900
Message-ID: <20261106232322.1093165-1-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
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

rpmsg_recv_single() checks the msg_len field of a message header against
the used length with an unsigned subtraction, so every msg_len passes
the check with a used length shorter than the header. The rx callback of
the destination endpoint can receive a message of up to 65535 bytes,
longer than the default receive buffer of 512 bytes, so rpmsg_char can
copy the whole message into an skb and read past the buffer:

  BUG: KASAN: slab-out-of-bounds in rpmsg_ept_cb+0x4d/0xb0
  Read of size 65535 at addr ffff888002484010 by task rpmsg_echo/140
  Call Trace:
   rpmsg_ept_cb+0x4d/0xb0
   rpmsg_recv_done+0x29f/0x840
   vring_interrupt+0x32a/0x540
   vp_interrupt+0x146/0x180

Compare the sum of the header size and msg_len with the used length, so
no subtraction wraps.

This patch is assisted by Claude Opus 5.5.

Fixes: 9648224e564a ("rpmsg: validate incoming message length before propagating")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
v2:
- Leave the check after the dynamic_hex_dump statement.
v1: https://lore.kernel.org/all/20261102221504.175116-1-lian@is.s.u-tokyo.ac.jp/

 drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 23ff6c8b7a20b..3d58bb19e9297 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -676,7 +676,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
 	 * the reported payload length.
 	 */
 	if (len > vrp->rx_buf_size ||
-	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
+	    sizeof(struct rpmsg_hdr) + msg_len > len) {
 		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
 		return -EINVAL;
 	}

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

