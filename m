Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760607;
	b=oZXWvHtIcRpWoIBcTZ0pKn2lKSqxykb5t1kEg9yXg4yV4GI2DpPOAF+t4rKfo7FmXUcY
	 yZjJ2JzNGxa5QJG9XEn1izGjVCSCVUsBfemLhV529ZwEhbnFMJ4kaMAkPvwZrfgAF7zkB
	 3EqfhCbUWldq3zh/+0hTcKPMhttADLszHO7X7eqvVzbAt9ePuQ9/hqrazR6asf7WRodQp
	 +ZXuWmQEklw17RfX1+kIgTy245cS9qKzrm48tfVp+ILTcjp5cp1JLOdqmCGKKCvRsgBNm
	 cZFtZ3bKwfwMMMBYxhj/G7hcioQ8y6Ajp1ReH5rovpzwxQd4BHtl5d/Z27ADvRk8wIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KKb+d+ZaGGmKBJKMDQFVdGoOMQlb/jSR52em0tpyyQI=;
	b=dIFmSDEW+EgVttHJnLCiSKe90+cnbZZ6NEsEVXiqT7dc+qOAzXztgzbQfk8kBtkWCN5b
	 r5NAXz/EGEJZbn9ZAtU9CGVY2BUfbMbLLbe0pIkz5F/V4TSXY8/gZfxt9Hy8mHdr36Jal
	 e4fkFjbt4yOBsdIxRh6qia//glQFrGJhs0AczkYKP8i7+OefWnJgkiHEk5SChZ9ujHCHE
	 G3y3qq/vnoB+0CGO0mbg9YF/64qRYie9q16sj23UA3l4l1v0pwhGNC7EQul6C89shecC0
	 txEHnss3gT4JQlangOfuMKiOARGo3+IB3W2q8bEy/SIZ5mH7aYnVAGpUIny9MGnsOSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZtMIdJJy;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8E606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD8E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZtMIdJJy
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37986eb6fa2so2939660eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760606; x=1795365406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKb+d+ZaGGmKBJKMDQFVdGoOMQlb/jSR52em0tpyyQI=;
        b=ZtMIdJJyVm+mFG2Qv9z6k7f12/DNmDmsO0hrkDl1xmBBO+AfmzBkd5ZSYmcEIkOCS9
         fFoMEhd5Lt+ReBKdDfshMrAZQH2Vu1R85HZpdyaWA34Q6VuyFVLPiLkPVgY7adFrN53I
         Aq3RUp96k9/fGYLrPki2HnYNNx7CL9OzSVlNp+pDZMqVnOlbqc8IpiljpLqTf119Km3P
         Ye3uwvS3cJC2oUx+GVMOp8D566vDFK7qyUCYNQvWwwslOwq830yZmC8l7M+kJa9yEHgw
         hi3GKiJjoCobPiWvh3wokw36T/++/z+XzA991y22AF9OJoIfuNhzAaygoW084ro9TPkf
         buNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760606; x=1795365406;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKb+d+ZaGGmKBJKMDQFVdGoOMQlb/jSR52em0tpyyQI=;
        b=wK0GP4KmbpV1vtDOMkg/ghh+c5cBRRWnlp0HhsAHkDSLyHumlNBvb8z2ec4plLCdjy
         f/+7ZD7T5oUb9os0gA9sHFWZXG3uWCUfXhzouYD4adM8ZRU/uPkhY1dSv9lizargsWtl
         8Oqrdb/VwvOUv4lfq12VsHY/dXLSXrOlngUsmmhwhaybD4y1k6JzkGdu0gQ5dFrg4gJ/
         gmgM2vjIiXn/QmKCdgwt5SDPKijTBhI7JcZt12zqhcxHiBnJGJw5rgYMTuV1ZXeS2wJF
         7ACxnSPakkXFHtvV1jNdJOkp82CGvPqi0z02j3DtdS3nGxi/0XabWGnQYE0ge52+Gouv
         4+rA==
X-Forwarded-Encrypted: i=1; AL+hErEOYlPZ+9UwXgF5/+S6DgWvDx87GGgqgkfFwxK2Y3kxparqOV6E8br1JZ+N2FfpCsnGhMbpdZBoEmXxNFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sVy/Zbuw+dmnOA0HK79aD/cSupDbCYAv3Xugek6Q9RbmjcfkP
	XStkrpdO+qfe/tMTK5VzaLC2Jkp06v0xlaDgOZvXlse/uTx9J4GMkncQ
X-Gm-Gg: AYBFou3HWYh0risTN+hFCxBmifE29Kg80q607i+4pbRsJKFh/Joe467AE+xBwqkjvYM
	6zgKk5sEj6e7JlXpr0pR1zux8zHsGNptNRQoYm14AfyC1n9pXUHS3pYrhcwiFpB2R2Sl17aPKkj
	rVanCkMEzSjXeqS5k4gw+HP3c0ypmfRCB2vKAk9b3kMzclC7Yi4ZW2pwc0G4mMIcqpSLsw/N67u
	JP4AEIMt7G3Z2filbW05he26Fbg5mJ8Z4zjJD6xxvWeTS1j9jFCWZWn1uWMkkEqX2wGzwHeSqLq
	2R7E5SutDg3+XzhfudmHsRwHUCJpaBEfWOxlEXUc4xThq0rihbUrLk9U8nB8z9UMaMOa7m1apUG
	eo520w8r7t3aMCQqSvM2a3cNGU8MxvSTLMVCVeZ2gdzrjNVm4ZYWjh1U81CzMbgc84O7wtp9Jvm
	sX6azxEbI5OKyRuv1Y/erXdu4RV04sCSW1OmdxD08/uQxiDNryP5VM6wcEPjqXCXhv1pIKC9JoY
	XeDHslttgwXGtOa21yGqkn7/uWz5HPz2YSVRInocZjCiUAN8yW82R+B6vEjunqbEh0b0FIpNYdI
	Ip2vjxJcPhSvMtorpzhaFXr/6bMLln+2zd3/hluHa65rcg/hEz/sguDkBN04Yq2uAO4U
X-Received: by 2002:a05:7301:1c18:b0:375:b560:a323 with SMTP id 5a478bee46e88-3796365f033mr7898443eec.1.1794760605833;
        Sun, 15 Nov 2026 08:36:45 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm27292732eec.9.2026.11.15.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:36:45 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] tty: TCIOFF/TCION under TCOOFF lose the character on pty and vt
Date: Sun, 15 Nov 2026 08:36:38 -0800
Message-Id: <20261115163638.226086-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg, Jiri,

I hit a small corner case in tty_send_xchar(). It only happens on a
pty or the vt console after output was suspended with TCOOFF, so it
may not be worth fixing.

Under TCOOFF, tcflow(TCIOFF) and tcflow(TCION) still send the STOP or
START character on most ttys. serial_core UARTs do it through
->send_xchar(). Drivers without ->send_xchar() go through
->write(): __start_tty() does nothing while tco_stopped is set, but
usb-serial, cdc-acm and u_serial do not check the stopped state in
->write(), so the character still goes out.

pty_write() and the vt console's write return 0 while the tty is
stopped, though. tty_send_xchar() ignores that and returns 0, so on a
pty or vt the call reports success but the character is never sent,
not even after TCOON.

On v7.3, with TCOOFF in effect, TCIOFF and TCION returned 0 on all of
these. 8250, ftdi_sio, cdc-acm and u_serial delivered the character
before TCOON. pty and vt delivered nothing, before or after TCOON.
The code is unchanged in next-20261113.

tty_send_xchar() could return an error such as -EIO when the write
took no byte. Since usb-serial and u_serial also return 0 when their
FIFO is full, that should probably be limited to the case where the
tty is stopped. I can send a patch if you want one.

Thanks,
Cheng Yongkang
