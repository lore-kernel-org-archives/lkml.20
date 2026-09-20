Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9573175A95
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876605; cv=none; b=FHsDYwDzce1KON+9drTYYa8Od7uDYpzfD7UvBNf6GnMLBcLDl+8UZCcUvCbXl9oLh11VJvys06RPzs6wtem7kZ2O0MNeE1Ck2QP3dPKvvVRWf+NhYBH0Al/IVrvtXpfOut4hAjLJw243UAIrKmMh8VirJvIIQ6nYH+uQoNKX4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876605; c=relaxed/simple;
	bh=5xtl8vECwI7N2hTr71DbOthQhLvmhRGN/CfVoklgn3k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qwu28JfePLtvD4XWkTKtsW1PA7Aw3wo8AEy67ViKvNnP67SDFe/pFddfDFsFVUumFOCd9fVgwBn1bPc08jEYoFM3z3IOHkNj8n2neNWS1asl32JVok9aORY8WrsFtBLLTfDQm4UYDpr5p7o93H8kAgZOTWCISwhkfsJQszAxDGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E56QnhEb; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E56QnhEb"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f6so12330065ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789876603; x=1790481403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F4hmql1IX0BfyhMHnyF3zu0V+uINNkKnUB2MDx+f0d0=;
        b=E56QnhEbiTcs9Unli4lDyRv1RtmsbHVW6B1Ey3/ZOvY3bgddKSK9YY8LXKhTcyhqCZ
         i0p5sXxWnU860dbbaY0/2oboV8HkMHlqW0MooWrqQH6hHVxoqDaJ2oIJc5LHimB2703p
         wjH1oP1Xjz1KqBKK+DcGPr1URb7NtiIrLN0KEO1pqING4bKGjnnImIgTQ1rvswd1wFaB
         WBL1aM+Fw03rymtmwirCtVIV4HnVUirk6Pzm3oZd+Yo9kJf9B3me/KNEOaMiMbRXfcpU
         8hw7tP59rN3Nk9qR1gFbI5DwkZOyQNrsF8Ac7QOD+8GZGbY70wxo4p9sMsuNInMPyecx
         vjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789876603; x=1790481403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4hmql1IX0BfyhMHnyF3zu0V+uINNkKnUB2MDx+f0d0=;
        b=YX0zMho/8qmjAB8UUEG8U+XT3IjCc2tuP257Jupn9K9CpNM24xCcrhZDma5kBc0x4O
         dZOu0CzBTP+rpvidqh4zF8Ru6Lx106JeQZdkMj2u4qrdspX2U/qZHG13r3wVtJhjukf+
         c42E0BTEA1SRPycuQiewhg+0XfCz6KhvzeF9zaeWK77Vd449hfku4/B+PmBn8oDhg2I5
         Q5IvlZ/TyV+texFFqy0B0BMvelr2uZdjGf4WZ6E7kY58zRN+aGHFR3noKh4r04/Cs3W6
         0dN/Q/tB6ZoGndagpgsU4YS9WhuW4kA0JtExfn2xq1H0lBTbJpI4DcfBcFH78XNSyN1r
         xuOg==
X-Forwarded-Encrypted: i=1; AKwUvBwwuhiQn6ES46Lwgk2zPCpGmg17IjipkeT2Z9JhUI1J1x8kvCf/lxahbp/egxECaeaXn6wEUcNIkROXK5s=@vger.kernel.org
X-Gm-Message-State: AFuF++nhIGWyijWlOnx8rfOyiXUxEdoN7v+kxam24qAdv8cn4IFVuUT1
	oSSKVJNKgGtnO1g/eyZd1uRR0QN2iygI/d9CEpzbTCJeEx4mq+GwEbuc
X-Gm-Gg: AYBFou1cMSzmJ7nFzc8oU9Bku9TWJigc51q4pI3HnFiT6RaAKs8gwX8HZCuYxu0WVWa
	nOfDil5DS9ramItbS5HFfbnDB9Cc8Ztj3HfHMnFPzQO674EjOUVNGW6aAnV/iy4Zo6fy1ansUJF
	6cgQL8xD/2PgFmfJTK9jE2EIg4w8xhvrNzpoetxkOin6mmLlUBq5YAK5MO47lCfluJqnuDOYY2A
	TCwFV2zduFn84Fl77zSXOb7QNtZWQEVLsIhdO5rmpuJiRA8QUsx4RLLhcJTYtKvgjj5bhMoM5Ze
	H72Y7qAbvR4G52tGiQ1DrDx7bL/7UFK/s+EcGnm26tD0UHmX2TsUAlmghWWItzqF/Jugk2T5R4X
	msQ8LWvpERaVHsaDdrrqMEJoMgbpuAkF9rxwjzpAt6QsFcy/YMPX5UHBkeRZPq488gLUYYvbXE8
	0ClySFxenI5oFcpOVZnkgNohmCgVriCSJ2pgFoJOYH4G3hW0TZVMSngpA+PPUBpM/aAqC7MrkO7
	YSrxHKpEybowomwpqFHqoPUgGE=
X-Received: by 2002:a17:903:1b03:b0:2dd:c0ff:e725 with SMTP id d9443c01a7336-2ddc0ffe981mr49870745ad.55.1789876602819;
        Sat, 19 Sep 2026 20:56:42 -0700 (PDT)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2de217b3a97sm14689445ad.31.2026.09.19.20.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 20:56:41 -0700 (PDT)
From: Kaixuan Li <kaixuanli0131@gmail.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Kaixuan Li <kaixuanli0131@gmail.com>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] can: isotp: check the frame type, not just the length
Date: Sun, 20 Sep 2026 11:56:26 +0800
Message-Id: <20260920035626.2581040-1-kaixuanli0131@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isotp_rcv() separates Classic CAN from CAN FD by skb->len alone:

	if (skb->len != so->ll.mtu)
		return;

	cf = (struct canfd_frame *)skb->data;

A CAN XL frame with cxl->len 4 is CAN_MTU bytes, so it passes, and is then
read as a canfd_frame whose len comes out of canxl_frame.flags: at least
0x80.

Of the paths that follow, only the flow control one uses that length
without bounding it first, so check_pad() walks to 255 over a 16-byte
frame and the caller reports EBADMSG on an unrelated socket.

bcm_rx_handler(), j1939_can_recv(), can_can_gw_rcv() and raw_rcv() check
the frame type here, and can_dropped_invalid_skb() switches on
skb->protocol on the transmit side. isotp_rcv() is the gap.

Fixes: fb08cba12b52 ("can: canxl: update CAN infrastructure for CAN XL frames")
Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>
Reviewed-by: Oliver Hartkopp <socketcan@hartkopp.net>
Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
---
v2: shorten the comment above the new check to say what it does; the
    reasoning stays in the description (Oliver Hartkopp). Add Oliver's
    Reviewed-by and Acked-by. No code change.

v1: https://lore.kernel.org/linux-can/20260919122852.1868961-1-kaixuanli0131@gmail.com/

Reproduced on v7.2.4 over vcan, one isotp socket per case bound rx 0x123
with RX_PADDING|CHK_PAD_DATA and rxpad_content 0xAA, a first frame in
flight, and one frame injected from a CAN_RAW socket.

	case                            stock     patched
	A CAN XL, cxl->len 4, flags ff  EBADMSG   none
	B Classic FC, padded 0xAA       none      none
	C Classic FC, padded 0x00       EBADMSG   EBADMSG
	D as A, with CHK_PAD_LEN on     EBADMSG   none

C bounds the impact: a malformed Classic FC frame from any sender on the
bus gives the same EBADMSG, so nothing becomes reachable that was not
already. D differs only in which branch of check_pad() returns.

No memory safety issue. KASAN was on for all eight runs and reported
nothing.
---
 net/can/isotp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

--- a/net/can/isotp.c
+++ b/net/can/isotp.c
@@ -754,8 +754,16 @@ static void isotp_rcv(struct sk_buff *skb, void *data)
 	 */
 	if (skb->len != so->ll.mtu)
 		return;
 
+	/* check for correct CAN CC/FD frame content */
+	if (so->ll.mtu == CAN_MTU) {
+		if (!can_is_can_skb(skb))
+			return;
+	} else if (!can_is_canfd_skb(skb)) {
+		return;
+	}
+
 	cf = (struct canfd_frame *)skb->data;
 
 	/* if enabled: check reception of my configured extended address */
 	if (ae && cf->data[0] != so->opt.rx_ext_address)
