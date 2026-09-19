Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F187E257435
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820945; cv=none; b=W1bFl89ChfvmeatSKOr3eAfn72RJ6dKPPy/wy5oziBHcb9O+p46Bh75oiW49ETOy83Vodqnw8c1kuZiL9eSc4q22LeXmZdPSvFI/LEsodSYGd9AHnA+kHbAemwTN/FgoIuMnH7CLVe3gWRJxIvA1KjLB5aDBqvajRS+8a3yQBik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820945; c=relaxed/simple;
	bh=91uvQdyi0/lq7Gi4/gX5uncXDNxThn6HB59YPc7bl0s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n6Dinqmq+oXzSh0yhWK+hf54aD8271VG/hrwVGNSOPDC++uv03Y5UhCBC5tiIcfuabCC/NVzN9YT8s8j8LQLrUT7R2xpn4G38tEt1FTALtHYfZxdH5EMCXgpU+bJgWM6GEi8QqVozHQxWIu2LS3UWX/rDTaG2Ev4FRLRndxgK0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfnsHe73; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfnsHe73"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so10542015ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789820943; x=1790425743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/6vQJdvxZ9TOHvIY5SY33aXrL0n7YdF7rTOPd7lxys=;
        b=GfnsHe73IJIAn3p6zcnYSjtUCki9OkeBcigTW4A3CseD601LzbR4o4t8CbBXUFt4bo
         qGgDPY6kJt4aehyEejTdYm0349iF6ewk4j6cNekJDH9VUqX787FaXDkbhm3HzFxufFSB
         oVLdeClyqjXMg/T9FDk29RU3MOfCaUSsKMtE1kbo1Ypb+jeV1MCX0JdS01DR4eMHVwlh
         BrqEpIqhBZoe5mB5sUSdTb64Ekh4J/L+Ykouw7NwOrB87ttF7+IOkYJH46aysvnwbSX0
         PnUtGoVoQDI8RfXflOaTk+iAZZIeTGMgF0/7DdV0XX8DM4CU3PIE470jU+UZCesbXZRF
         Jlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789820943; x=1790425743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/6vQJdvxZ9TOHvIY5SY33aXrL0n7YdF7rTOPd7lxys=;
        b=EIJ1z70juqrOtYWAIvxUMc2iexX40bm9pZmbzO0FaM26cSfXKtZxxo+OpmsLnuWc8/
         xN+q0aaShEfroCyHW2NKsY/NqfDvnmpB8z/SXXWFvHuCoKmnluZHg7pKXUF9hTTAYEuO
         piYj/7xET3h0u1MLdoluJsYk2hR6oHhIKUoQMOZtXPrMsYjz7QxuMOE5tM86MhrP3dCi
         L87BSSsXQ9UqUsSe4mji2C8fZm7azVYekEwyiKh0gZeE8E3eZd9Dna91XcHUERk72cCg
         oePBl3Hvs+iWsEDnlaM8rZ3Fq0B2Kc/8RQGw5kuEK33xU48sTb6RWn53dZWbcg4DDV9C
         Mykg==
X-Forwarded-Encrypted: i=1; AKwUvBxLIxPR0GSXOP8NTINHDBN7k/p8y31NsplRd0N4xi37U/Ccl6xeQYU3U8jMIOyu3osa3T4weF6POSkXFRU=@vger.kernel.org
X-Gm-Message-State: AFuF++nqWpSA5uI63gvv+hIGQ5RowD9TlexBFgiaOSmt4c+2CsRCOtpO
	iVoRH1rvzp7C2NmA1cjvjMaV2K3ZenWjUcv638jHUMlmvK0w7pptf82i
X-Gm-Gg: AYBFou0pK01O5TKjtmNAz4udDFgRTMibtJ87umhWM5i8NG7etSM674MDlOnrTTwo2er
	Wga+fl/6gtPLdhvyJThTo321tnoAAwkm/ANTOAIYVN6hW9FqouR+IZlEYbePFU+Q8zAdw6cjHwX
	UkONX8EF7kTMD9CYEoyCskLvvw/vBRHnkMlJ29oaqEJ6UFOgKaNE2ENqlrEqmOoulUHz+RjotzS
	fAa8JH6EUSjKxrDJChhLBya0J269ELMUYRyaLKVov6suPd9FTbgXI5+KI+9c5d3rDEqphSvzcen
	d0kYC1k5nRVEO5+JtZpOw3B5NKJW+tbrEKU23Le7UEENPuPWnCmOazAWt0zrYQ96BFgXxAnBNCh
	WqGFvK87xcaeRMWWcloPEyNrN6wrpuO09ju/dmpfgg5t3X8A5z2n67xhLGoEuVnIGGZKLty2Hk+
	DCD/mU+BbJrcvHeSVEqGDij4FU021c4adyPlNBAjstwNhsiRD1ZSR/I7PJphnPipsk8wgO9szE0
	8U4pb/7C9jpvMibmV/WqjjZTKk=
X-Received: by 2002:a17:902:c945:b0:2db:8c12:6b03 with SMTP id d9443c01a7336-2ddb1ac976emr85986535ad.8.1789820943175;
        Sat, 19 Sep 2026 05:29:03 -0700 (PDT)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm9577965ad.83.2026.09.19.05.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 05:29:02 -0700 (PDT)
From: Kaixuan Li <kaixuanli0131@gmail.com>
To: Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Kaixuan Li <kaixuanli0131@gmail.com>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] can: isotp: check the frame type, not just the length
Date: Sat, 19 Sep 2026 20:28:51 +0800
Message-Id: <20260919122852.1868961-1-kaixuanli0131@gmail.com>
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
---
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
 net/can/isotp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

--- a/net/can/isotp.c
+++ b/net/can/isotp.c
@@ -754,8 +754,19 @@ static void isotp_rcv(struct sk_buff *skb, void *data)
 	 */
 	if (skb->len != so->ll.mtu)
 		return;
 
+	/* skb->len does not separate the frame types on its own: a CAN XL
+	 * frame with cxl->len == 4 is CAN_MTU bytes, and canxl_frame.flags
+	 * aliases canfd_frame.len.
+	 */
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
