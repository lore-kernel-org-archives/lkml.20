Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541036;
	b=WLLaRVQZ4HtElx05PVKYfjMY4u2LcLPCT4r+pSRRwaX7AxPGrWMrHm/gtYe7VRJNdW8N
	 XI/T/SukjKtV28V3ozXjGqNqYZgQsqF6fR8/Hrch4NSAyLpd1T2J0FmmpyseoxBmTsVlW
	 kDx5c1Ij9lotLqyemrCXdQCEjLj73M7fggsvzGb8PRtNlORNd+gUTsqYavq8rCdv6QqFX
	 rCA40i7VKZkXuaYBWxH1Z1PMRueDpBqu3Gg9itqUBxDIDHRPXP97u8ZCqS4UOVvzWbPLO
	 yrLdYjjqdwiq5yOuwnGjaH5gV9zivoaf+/Yhivr7c3IcbOQDqcGeJA57NHtbvBAHxPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cLTdiWqaUypqnMKDvc212NTksaDtNpFN/9XN0ZweAYE=;
	b=wxGHnZn+GNXOVhpuZEsXcZFkUJOxjVcLrxPxCJbcQ19uZMF8KlwnC6LPcwLzqSid1Wvh
	 H1odknDLKr48LC4trHo3HUyrcGfOOSS02yhymqCcuogTtKCcQE+Dn3aGXkMRgm+jBwDgN
	 icmoMlBtDTV0dSFJKyj/Up0nz0PRXv7kV4uzbjopz5siJH1Ntzd0WmxmczXPDwRNCsjt1
	 hy84o6SaO6i1hSlrBe37ESQFUIR2cr+MUXiYfcSSBs9sDXn7rmXvUDEJarnSxxZ1U5J4M
	 RWmmLezlOB7IUgrTQEvBK6FSij4dvLMN7Y5AWryO1ESX9f+4HuNhFmio/zb7Bku6CPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=stG7GrKL;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D030606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D030606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=stG7GrKL
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso248558eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792541035; x=1793145835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLTdiWqaUypqnMKDvc212NTksaDtNpFN/9XN0ZweAYE=;
        b=stG7GrKLgUVwczg27aAGBolS/4/uBW2dnBuja/wReBJ98l5tsjyLa8V8/lA6Lj99xS
         N6am7jJ7IFM2JGgJG4Pu1o3WGab5zR5MqXgDDO0DeQhEk8vlW2mHwrAMAjZrhX+4s3qa
         1xwDK+SyCW5ITDyi/c8HCQblxyANg5xg2wcS1yfyWYcgFr4AHihMdH1K3ioHdJtRejrf
         C0pB4bwrIlxtJa2/BGrYMqy00A0vNCU+xkbBz4o5pxUf/USz4mp0wJc1YznhIYDGfU39
         4wtWoZdXRFXkYOpeEl+o+KyJjrYEXhJi8xPac6jQc+Lak7H1ri2yiBsk7ZXtLa6WG8tv
         r/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541035; x=1793145835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLTdiWqaUypqnMKDvc212NTksaDtNpFN/9XN0ZweAYE=;
        b=qBkEyhoo9d6c6IfuZw5DUlsue63E29nzFaD/OolqN1hKlMPgcspk6JXhSH11rZ9PFT
         63AvDNs9r75s+zpozadKTrPXRqYVt9GI2Cfho/ls4/HoTezOiGuZ/EIP/mSlsDJPPbRz
         O/BoSPf7gfaXbKmGqbykGpPwYrsa1VUV70Zvz7VReNWobspse2iNZzd5aHyo0ZtGVxlW
         5ApKjStMDEhXV0AH8TuLyJ2K2wAzyqi7xXsLYZL5XpjjllIqYmv6L+c2MVCVyjfjlsQ/
         UILO5DMKQkRiueDge0GSKnwbq1Lz0rEtNQD8IEhMPbhv3J+rlEKM4o26OsJv+/lUoVcu
         KZNg==
X-Forwarded-Encrypted: i=1; AKwUvBxdt5LUZuKjOxKEtOXgilAUeNwuWg+BIzfqJkzqCI9Jxjke0BT33IrHd9VgFc4185ZPgs6HFi3kBzGMwP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwSJPiCkRPO8qQNd+1/ZJ3lsRE8LXxjlxlcvpuiVxBDpOlcW+6
	U/QlAkaUOa7G3DFRYdGO7YopWYYGjqlqpBZigW7/N45TSMZXRAv3c8kZ
X-Gm-Gg: AYBFou0u2KUU37/TX3SKynKrh9elFvuWVgVaC60iTYqw7zc4hC1Aoqs+2cswoNNt79d
	E80YwQUjMBkXEHAsVX4Q98IWaPsCFa7eVN9Rv4KXzilzzIYnrJZpo0/6vgfPt+/DYbrTZkRLH4u
	07neR6DAncUSwb+L/uzM4G50zm+r0d2iHqorDCzPnJKwgEvCYyxjZ3s6Yu1Zzb4y4xSdkRLkxbg
	tRC6wWMneIQ8+OMYGzTvCoBmYOuoGRIHxrXEhgVG5LY6AN/lMc58483dLQ92toDpwmDvPM5ixAB
	vmw1QiAS4dPDs48HToznG70Bp80GOkcnirVm+A8xzrIPdkKy8bLW+av7MwJs5GEifb8LuWW/lwf
	H2fU+tadMaLjZPHCFzLUZqOjQdJnGWCtgtr699m6cRLFQz3DxY75CbysLMIiQ51Yz94zLCjl1Fb
	s7lV9YBFkwWfKjqePhqEMIcO8xfnckAZLM5aAeRmw3xy86NwZXLuoFn8Caa7Rzh/HYwKQ1McY0P
	cqlxZzsvSnMqsjo23aw0/jfGb8SrepJEvZRL112Rylv8dWTXhPxejgAqbZl9UaChQSIdjXw7nLE
	AuTxIZ3ngsv4z2NLKEhWo6HtqDmEwMKwiDRN7Ue+GHFnbT6MaHLQd8W6JGDoV5dkkrF6hGmkMqm
	Za41QEMVgKBJmUCHV0CKWL2EpqssIyDjy6NlMVhrdGTYD
X-Received: by 2002:a05:7300:a202:b0:35a:ca1e:4d82 with SMTP id 5a478bee46e88-3674db53727mr959180eec.20.1792541034665;
        Tue, 20 Oct 2026 17:03:54 -0700 (PDT)
Received: from lenovo.localdomain (42-155-215-210.ipv4.nexon.net.au. [210.215.155.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm2756499eec.24.2026.10.20.17.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:03:53 -0700 (PDT)
From: Miro Kropacek <miro.kropacek@gmail.com>
To: geert@linux-m68k.org,
	dmitry.torokhov@gmail.com
Cc: schmitzmic@gmail.com,
	linux-m68k@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miro Kropacek <miro.kropacek@gmail.com>
Subject: [PATCH v4] m68k: Fix atari mouse movement
Date: Wed, 21 Oct 2026 10:03:37 +1000
Message-ID: <20261021000338.2160223-1-miro.kropacek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819222838.21256-2-schmitzmic@gmail.com>
References: <20260819222838.21256-2-schmitzmic@gmail.com>
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

Kernels are built with -funsigned-char since version 6.2, resulting in
the signed 8-bit position deltas reported by the IKBD being
misinterpreted as unsigned.

Carry the sign in the type of the mouse interrupt hook. The scancode
buffer is shared with the keyboard and joystick paths, where unsigned is
correct, so it stays unsigned and is cast at the single call site that
passes it to the mouse driver.

Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-input <linux-input@vger.kernel.org>
---

Changes in v4:

- cast at the atakeyb.c call site, so the signed hook no longer
  produces a -Wpointer-sign warning there

The functional change was tested on an Atari Falcon030 with CT60 in its
v3 form; v4 only adds the cast at the call site.

Note that the original version of this patch, which cast the two deltas
inside atamouse_interrupt() and left the hook as char *, produced no
warning at all. The signature change was your suggestion, Geert - if you
prefer the earlier form, say so and I will send that instead.

 arch/m68k/atari/atakeyb.c        | 5 +++--
 arch/m68k/include/asm/atarikb.h  | 2 +-
 drivers/input/mouse/atarimouse.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/atari/atakeyb.c b/arch/m68k/atari/atakeyb.c
index 49a9a459bdf4..1eadeb8e4d7b 100644
--- a/arch/m68k/atari/atakeyb.c
+++ b/arch/m68k/atari/atakeyb.c
@@ -39,7 +39,7 @@ void (*atari_MIDI_interrupt_hook) (void);
 /* Hook for keyboard inputdev  driver */
 void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
 /* Hook for mouse inputdev  driver */
-void (*atari_input_mouse_interrupt_hook) (char *);
+void (*atari_input_mouse_interrupt_hook)(signed char *buf);
 EXPORT_SYMBOL(atari_input_keyboard_interrupt_hook);
 EXPORT_SYMBOL(atari_input_mouse_interrupt_hook);
 
@@ -260,7 +260,8 @@ static irqreturn_t atari_keyboard_interrupt(int irq, void *dummy)
 			if (kb_state.len == 3) {
 				kb_state.state = KEYBOARD;
 				if (atari_input_mouse_interrupt_hook)
-					atari_input_mouse_interrupt_hook(kb_state.buf);
+					atari_input_mouse_interrupt_hook(
+						(signed char *)kb_state.buf);
 			}
 			break;
 
diff --git a/arch/m68k/include/asm/atarikb.h b/arch/m68k/include/asm/atarikb.h
index 68f3622bf591..c5a84c7ee85d 100644
--- a/arch/m68k/include/asm/atarikb.h
+++ b/arch/m68k/include/asm/atarikb.h
@@ -37,7 +37,7 @@ extern void (*atari_MIDI_interrupt_hook) (void);
 /* Hook for keyboard inputdev  driver */
 extern void (*atari_input_keyboard_interrupt_hook) (unsigned char, char);
 /* Hook for mouse inputdev  driver */
-extern void (*atari_input_mouse_interrupt_hook) (char *);
+extern void (*atari_input_mouse_interrupt_hook)(signed char *buf);
 
 int atari_keyb_init(void);
 
diff --git a/drivers/input/mouse/atarimouse.c b/drivers/input/mouse/atarimouse.c
index b1219cc4d9a2..6bac2288c494 100644
--- a/drivers/input/mouse/atarimouse.c
+++ b/drivers/input/mouse/atarimouse.c
@@ -60,7 +60,7 @@ extern int atari_mouse_buttons;
 
 static struct input_dev *atamouse_dev;
 
-static void atamouse_interrupt(char *buf)
+static void atamouse_interrupt(signed char *buf)
 {
 	int buttons, dx, dy;
 
-- 
2.43.0

