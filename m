Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079821;
	b=5r8BYMJ4hXmE1Tk4AjglEJ6bi+v43JBvMgaHX5scehBee/5l5PmDkuoNljC5urr6h5cN
	 dAm1/edeWUrmeaYJkR7X65Yk+NAwzpr5zpETGdSC5NSelCeQBqT5WKVeARdrb/m/0Vhna
	 5aE4whoYf19UiG0yWe6Ufv2mWuSJj6T6nsQrljwFHsSWN9EuPMRVd5FMzfz4BpXVijngX
	 B0vaoNiyYsJdeYL5hpfno4T3V0nOy4r4n9relSLXDlU4gKhf6KfwwWVGUab3s50vIVU4F
	 iH1mb+yDb13JBUQnL/dpZefiVt6unxArjJtXBWLq7BtzqjxfFSqGnPtV5qSB+I2rEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FqWB2wVkmtIRr5mzG2098ehyTIGBIw8KJYdLx1Y6IvQ=;
	b=AwFQlvLhm8/tOm2UPvXkyQIVctq+9vh0Z5yEuD+OQjb+AxvBy1WfHGyZ5J5BUNLGPpfw
	 6TJ1VR5UhWa8p7ZTNPjz/QdMYQI9tSCQlBfw7nlEppVPVQHe8NBjsbiYlRuMQ19f+lz0o
	 9zeV+z+/4VOGZvUWclOk4+3mVmB/AYovvyHTcgy+3QVb6XQ6XfweyIiB2q0lfeJGqg7Ak
	 IFF0xyokvwrFOy6gNP9/DWdAYbvCct/DvtktbFoV/GxHsMA2jdqVgd5T+VWR9/8ECMZzN
	 D345elijHj/il5hK9WkKhr8vYcofTDmsVyF5GRqEXFczTdwoYH7vTnEFct0KWeeDKCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UScxL+7p;
	arc=none smtp.remote-ip=74.125.82.65
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31299606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31299606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UScxL+7p
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-181516de561so435644c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793079820; x=1793684620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqWB2wVkmtIRr5mzG2098ehyTIGBIw8KJYdLx1Y6IvQ=;
        b=UScxL+7pN50Cx5va0u4tF9i803tCUmr1fjXNMTJYSvUCBWs81tT39d6+7lEpMpfDuX
         vRFAdOq0vqk3UgoucZaFTpIiZy6NJFjRBxS4KFUl4j4ibma2Bb21zSP2bi/allqV6elu
         xcCe0RzlL6Sp1LMcLMhspT1e0k2odbEZ0I7T0BvnSOWF/oR9H1YO1B8L7MD2SEKSSuxZ
         70GzDqIGlLZ9sciXG+dH6TyTZ+Ouo38rg8BZk1COix1B/Sza/xAHTv78dcPoKw6Tp4rG
         TYol7YC7pY42JF8uhLOaWpob5I1ljDct2jINcFosy7JpQuQeKeODNoeMD9+guzOgxdPz
         Se9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079820; x=1793684620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqWB2wVkmtIRr5mzG2098ehyTIGBIw8KJYdLx1Y6IvQ=;
        b=R2A4aqJ2NFpVow1L5Zaud0Z32XhGflC5LUUKqluPIPNARb/sIikhOpWU6Xqbb0PtsS
         HBsdQggLyJTRTWxEV/zDgkDsS9uRlDT6O5wCJDzt/kBC+ejSd0wgKaBZEVSJhY5R2a9s
         H7wmKQPMdAA3hLyvYU6n8opDbt1iw4K8Bvqj9nluqZf+GcqHGE6mi3c1re11vLmD0gOL
         zMTcsFWLeRdYH1QtVMQkwBIYkxP42L+VcJDfCxp62Az8llqEbw0Q1Lpa2vcnsQIV6mGv
         gq7wgodPSepSF91AG4IxJTBM0vRkAyF8cSR2NBeh3NKayMulEWqkdGSsQxcgte042Pe9
         sanA==
X-Forwarded-Encrypted: i=1; AKwUvBzgonZD3AVS7alatmUJaN0C6/N8ooYKd1zLlFOaDhcxizauaHoS9yJsktqCFFTAq+bvIakdSSDlFWF2XQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQqkEYpnP1+L5v+W2EcttfQB28K5UWbgFGnxGleumYTIMnW94p
	3+Ui7rb8b8EER+NESqVh+9lgLt0YHConFbColIcjeOy4O3qpu2tGtAn9
X-Gm-Gg: AYBFou0VxATC6W0oTgkVkT2S2hzoEKneUiuHvHaJv6gsWTRV2PKScNya0+sXkYuPFi2
	iccA7X1TX5QJ4MPZYfOE4UhE5KBBHzFC1alrJDagtn+kKk2LtiOyM3UHJiksZpxZ3tjhDV71Zdo
	SXuluvHvKYDkKZgwDy55HNzpJPqstFt9l1bMRTjUd56L7KL7XZgXCUhl4tVjcM+2bt2KLgfyeE6
	gPPWEW4WEXpKP5g6/zrm3Z+U4LyaqeMItLxGLbMR/3FtvooGxsntiWCKeJFk+XQgMI/2xpDPAoi
	aW3Xd9dbuBB+xxFWewh3fwJqOJTJIA2xPF0atBf9bRO04lSD0c8wk4yPVWZOO/QXE26HO/NvkNf
	hbS/W4kOCBUS4X209gavz6ba6mU4hyZRi04yHbUt/LlCeINbCd7OfwZgmTahzlaSo0BA+Jb/UId
	YjkNTePgfJLjnBXP5tAoGZTjkNH1+uaX9eK2Hg/ITZk/eM8kexV3MOiU7b8A6w0CVupGWl7VnR9
	cR+FFmvYSCHfroqcyVgQlu9H+DYnl5HS6hISJtsV0MV6IGoaQsla9Oxi8cyeLIjk3CYfc4FLi/I
	MPSQOAYKE4sloIA7j/UfxhLjune2
X-Received: by 2002:a05:7022:2609:b0:159:d448:dd1c with SMTP id a92af1059eb24-1a3c904ca8dmr2950895c88.19.1793079820223;
        Mon, 26 Oct 2026 22:43:40 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d59f90sm29033485c88.3.2026.10.26.22.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:43:39 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] tty: discard flip-buffer input for TCSAFLUSH
Date: Tue, 27 Oct 2026 05:43:04 +0000
Message-ID: <20261027054304.35543-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

set_termios() handles TERMIOS_FLUSH by clearing only the line discipline's
input buffer. Data already committed to the tty flip buffers can be
delivered after that flush, leaving old input readable after a successful
tcsetattr(TCSAFLUSH).

This can be reproduced with a raw PTY: complete an 8192-byte master write,
wait until the slave reports 4095 unread bytes, and apply TCSAFLUSH.
The remaining 4097 bytes are still readable afterwards. Small amounts of
pending input can also survive if they have not reached the line
discipline yet.

Use tty_buffer_flush() with the referenced line discipline to discard both
receive queues under the existing buffer lock. The helper checks for the
line discipline's flush_buffer callback itself.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/tty/tty_ioctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/tty_ioctl.c b/drivers/tty/tty_ioctl.c
index 90c70d8d14e3..45cb77185dbb 100644
--- a/drivers/tty/tty_ioctl.c
+++ b/drivers/tty/tty_ioctl.c
@@ -496,8 +496,8 @@ static int set_termios(struct tty_struct *tty, void __user *arg, int opt)
 
 		ld = tty_ldisc_ref(tty);
 		if (ld != NULL) {
-			if ((opt & TERMIOS_FLUSH) && ld->ops->flush_buffer)
-				ld->ops->flush_buffer(tty);
+			if (opt & TERMIOS_FLUSH)
+				tty_buffer_flush(tty, ld);
 			tty_ldisc_deref(ld);
 		}
 
-- 
2.43.0

