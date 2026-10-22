Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698567;
	b=3Qym2rIXvX+gzr+outsiIOPn5d7is2xZ+ft2NkyXIQ+6WMID5iB7s1vOmF5lNJJLAv1l
	 7rT12J3FL+QvcNZ6MYdBcaKqxv3UnLDSwA2IgOaG5p6zYbvsrYszk/gOl+Q9YDh7I0ao1
	 bbMKI9onDPWdmsfCsOeOhxHX8bQu29XmCVMOArf5EZHk9QPlk8FpW51Tpv/d4pr3kytve
	 gh/lmEQSnoxupcvK5Q5+d4WNrPdjL6s7IOGxExkzIcndym7WieQ36xZeMPoCeTB7WH2HK
	 GhrQW+fwNqMRQtcHioZCUupWp3HmFCgfAgG0yxJvsFbX5Ts+6fjvCl+J1EN9Bn+zeGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aaS++5sXoJG/YlcvTtCnJ+zCT8E7XnqY59bgumC6lOc=;
	b=jQc6enL0xCfpT3C1zKWqLfouHBNfV0kVA2DiPGuiLW1w47YFS3GVTqdZ+f8AyWhx6s9L
	 CoFeqLFYSBhUeKTiBrRstpvjnqo9OCAk5iAKBKLCG1XQ6zeXCYyB89H28HgpiAPntim3i
	 tg1fJZxTpQXEeUyrOD+/OMr8hFDkqKpIKF2qPGX5CxBSwj5zUeUVhze62Q2jZWxCbVcgG
	 cvAl47/rIgp7EZdaSreMg4vACV1u5ifG8RxxgH1sSqVgLhUDd16mZSqBeVXhamM5XEkFD
	 055P47VQpPOp7V9AmE8JrgMJkHKM6fK8HVGak6FfP1YC3Cit51l4n/3VR0EmdaPcd/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="b/RNinda";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3893C606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3893C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b/RNinda
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc502d509c0so82613a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698566; x=1793303366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaS++5sXoJG/YlcvTtCnJ+zCT8E7XnqY59bgumC6lOc=;
        b=b/RNindabrXdOmwiZAP9uvX3eS7eESJU5lbH5Pz7tZtFfVuenp3KryR8GK9UwgtGdt
         Z5/ZZH4ovkhh+nHQpiAWOr2oCjx9QSK0mt4ssL1dya0c6NxP+hbYgQQSNXo1kDqNNs5a
         bTc4lXgKAdKXdIafx/EdDCEfkpEhfmtECeLg66JjYMCwFS3kBwuI1RP4b9SRrPfXkvhH
         +qB84ucMR8IytDJ5rrCbNqu9pB3WAZf3N4yIFgcI3xl10kOQvbrNPNQkITnOYunwOT+n
         km2IZ5ZOCPzuLp2xbQS2ndjOn6A7aYjGSF8qYOUEQK+Pq5la/IuUYPthuvKQzk7SwzP8
         38lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698566; x=1793303366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aaS++5sXoJG/YlcvTtCnJ+zCT8E7XnqY59bgumC6lOc=;
        b=Gi6eq9pq7JRTIQvJ+RSvGdL/Q6VOoLptudbP66C/GLaAmxDlpqy+Ho2rX62wRBULUV
         CxtUfAbIuOCGLvSsy5oQ5kgozoD1yVrJ28gitmXEx8KknJbRCcWU/KwcPYyk5I3yAmve
         gehU88yGClJBQv7NYJGNbbvqmhq+OsLuBMYoi1jkx0DT0nXeB4RpHCEojAX86EpgUDF+
         esEmbsJSgBGEH3+A2jRA6aIhggjxbeVpCK5iH1CNm8gy2/X6JFaB9VoCvbaYbATqTeYR
         Bf0DkzfaKXQJ3XY8GCEdVhGGKBsrmVkr80oGx/d2W3j2g55bmPdMODPOpyge1t0zS5l8
         hZzw==
X-Forwarded-Encrypted: i=1; AKwUvBzkGcvQekONg+03t0UALtLBRMZkvZH9fAULRPGOJ0q8BNknGjyDThGVQMY/1lKCBv6UCwMX+ijr/BoTiEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxB11MRz3sk99rw4xeWtMreT5XQgYPwQzJCiLdAxfgaf7E0oKc
	z+PMfXwdTBPMdMVQprgH3TfzU2gWVDHgWHj8USkAzgq2ZYYBw427pPBs
X-Gm-Gg: AYBFou2+twT+pudvDk3Ivohknu21PZxXthcRsNrgvxaK1b+gIFHLW90MINbTrCQ8Qj0
	oYBNG0YzAllD86CLTs4HuRKmQDH8Q/qgvov7m7KHZVYy7wQX6IG8WVrW7H+9L1o/if36CBhAcvH
	IdeMcogBC53Ld8phFUqCPwhj8Fc9PcLmyqWRRgithzvR44Oen6/tEgRx6pEUAW8WuHsZX+xwJ3L
	S+L5YmBiyUVF5przlVgQE+qeD6noGXjjBsK94x0oqEIA5mW86/0EX58QhawdivCU0Ho7yR1Ato3
	jwfNByTf2sADUJhCyb/l0Kch/6eeIz9Cca7jktDapt1Ts9ahH7P7ksKM5rv4TSQDYlslz7ankGg
	iBcHFSsGVARSUCFS78UF7BnWgUKRTSvSfNMpIwOjlPq+zGfcgTYz2hMWJlcFa1EycXyiwKW3DOK
	it2+0hwtwkCecijQYmaMWeBiF6FeSdWlRszwLy8fIiiXZ51X0mXnnv6aKGVHclWKZZAdgYV6Q/v
	XDYlG/ZQFEhI5mBQ/u3MbpqGDgOxjwMJVUGwGPm0zFjnnN/q8ncEpX/R8HwImVfrQnoMZtXd5sJ
	2HjtfKmjShDkIU1IS3JNl8vTY4VlMp/4
X-Received: by 2002:a17:90b:44:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3ad86f26e60mr5365036a91.59.1792698566516;
        Thu, 22 Oct 2026 12:49:26 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490d4bfsm6400293a91.10.2026.10.22.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:49:26 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Subject: [PATCH 1/3] media: em28xx: check dev->disconnected in em28xx_v4l2_open()
Date: Fri, 23 Oct 2026 02:48:58 +0700
Message-ID: <20261022194901.14302-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022194618.14170-1-neganhat@gmail.com>
References: <20261022194618.14170-1-neganhat@gmail.com>
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

em28xx_v4l2_open() attempts hardware register initialization via dev->intf.
If a USB disconnect occurs concurrently, dev->intf is freed while open() is
executing, causing a KASAN slab-use-after-free read in em28xx_write_regs_req().

Fix this by checking dev->disconnected under dev->lock in em28xx_v4l2_open()
and returning -ENODEV before attempting hardware I/O.

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..d653341ffd16 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2367,7 +2367,7 @@ static int em28xx_v4l2_open(struct file *filp)
 		return -ERESTARTSYS;
 
 	v4l2 = dev->v4l2;
-	if (!v4l2) {
+	if (!v4l2 || dev->disconnected) {
 		mutex_unlock(&dev->lock);
 		return -ENODEV;
 	}
-- 
2.55.0

