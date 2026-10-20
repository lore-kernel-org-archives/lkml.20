Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513940;
	b=V1ZsZLjmTxpYmQ5Kjla5QienHxUg2DCAnJZb7MA7p/m3eS5gmtirm9/B/kz9Q9SlLbbt
	 VkH0fyBFsv7vox+gEGct+4YNR0dPrfuWfE2RXBzgObV3I/PrlGDG7O4ZcBX0ysERsLB35
	 PBzF2Wegd+jyNjiNlc1QDOzHkQL7dy8PIKHMAk2KVwLp6QIu4rxgG4Q9TnHouxpmD3N07
	 PDhgXrEEP3uW5Ueisc+YEdF/abM1yaxRusTxs32MZ9+6UIsIS2EczuonDow61vOO1BitV
	 RQ0VnDm6M19xXhYc8D2Mfd4Q95d416lSI+5QR+JrYADlArj+/OjOFo59A44VT+FLjjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=x08WzkWLFZktjKG6biRXLu+HbE0bq2y1eJH9cT1aAfg=;
	b=jG6+pOzidhwoH2AhYMPBD8uGfdM+N4p4hDZqk1ilTCmR9iP+TQ5PWbDQM8UhpiguFG/S
	 qfJ2oahzJ+VlHoF/E0fmQ+F9Zhkvksk3rNHfNmEYlaJndWxB0maIycm4PUwi1XJUo40y2
	 b0l3jjUEQ/56K9DsuhLoGRqTpCS18cPMThnL5HF6mV1t5ZOnItsJACqss2aP85ygcVDlm
	 i1VoaH3caZmxXlT0xmGIHkD9kJy8u7UXJAanq/2yflFuZoxoqzRFxE1k9eeP5Bk5++f+O
	 fRZEFLx+KAdiWuEOb2kQW8Ts05ztO7oqTOwxlOg+I6M6qg3SyzS8gWMDSpKiRBatJbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PUtVTzSL;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2CA606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2CA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PUtVTzSL
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso10547783eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792513938; x=1793118738; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x08WzkWLFZktjKG6biRXLu+HbE0bq2y1eJH9cT1aAfg=;
        b=PUtVTzSL9MWUPbtAhO6NgmREXkSH2KhZpF+wjs9MZdxQz8/ae5NJwFLcy9WWjSyPJM
         JMMUIXHpRs3nrM+6CQ1G9x+wBtNbrxlQ/gmSfMMh6k/8C9SqjsjZ3B+w+YIFLoRZFIyz
         rUhnJgvz0Ad0T/Dfw4KMYciiRyB8byiTge2DYs+YU868OyApHq2qEpnR2UXPmcXmQz2q
         qgMJZ073VXC2zZ0sDRSx1P3qWhuxJp7LZs/sOKhb/ZfSKi2CqYuROoI2j0bQsSDSgIQR
         9XcCbrVJTyu1e5xYJcCvM8f1wLqtmpwKTDPHxzmojl8cGmqE5mJNiSESlUZFz7Cdy/cg
         u07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513938; x=1793118738;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x08WzkWLFZktjKG6biRXLu+HbE0bq2y1eJH9cT1aAfg=;
        b=YDB63iGNMwCAQtcBWsz/1cQ4osQwCax5TR30s4+ppkjTdoNSSg+uq7gxxYTYFoRtkm
         5hGdyONIpy3n3Vj2gcUxow/j2XRGA7qUGg9uaKCctuPEYVSZ34Ng9kHfetrE/OFMsbAn
         nPQNMTzgPn9ZrWunH1KzVWs8Q3/mVtIkLQgJ9Wzy+VvLH+IV+fmDLT0eTKtoG/0ZkMIG
         5v+09TNNnmnO/SZ3ZKzAWoTFI6aRr0ZZNJxfzaXkAS9leahAgoXDm+tHSJ7gy+yeDtve
         HjOLkm2p7v9BCoaAmQt0cJ5FITksJQ4c3syYjEw0QfRLf/z2u3ezPPDxK9WA2Vkgrc8c
         pgTw==
X-Forwarded-Encrypted: i=1; AKwUvBzdn6KuOeBiAF1x8gvan6T5DrvE9U+nqpLYiJswLDRU/MOpq6gFMKGIYpoqRRIti9yaL45VSCKGwcOStB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyYN63paD9TlWOUZpUE4roGga9wWrzW/IbJO3698U+FIgY1T16
	gmBTR1sfOMgMfpXsoMZB+iftK74nHMc3BqJ2edBaAUaD6/0SJNTtDlVzvYlx8p+n9fkfN7Sr8Os
	YZzbhdusgFw==
X-Received: from dybnj35.prod.google.com ([2002:a05:7300:d0a3:b0:35a:a58:bf9e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8641:20b0:351:1f56:3a89
 with SMTP id 5a478bee46e88-361a1e501f0mr17261142eec.23.1792513937516; Tue, 20
 Oct 2026 09:32:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:32:10 -0700
In-Reply-To: <20261020163210.742728-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020163210.742728-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163210.742728-2-irogers@google.com>
Subject: [PATCH v2 2/2] tools headers: Update the vdso/unaligned.h copy with
 the kernel sources
From: Ian Rogers <irogers@google.com>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Stefan Kerkmann <s.kerkmann@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Christophe Leroy <chleroy@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Helge Deller <deller@gmx.de>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

To pick up the changes in:

  vdso: Add VDSO_UNALIGNED_PACKED config option

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/vdso/unaligned.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/include/vdso/unaligned.h b/tools/include/vdso/unaligned.h
index 9076483c9fbb..726fd15efc82 100644
--- a/tools/include/vdso/unaligned.h
+++ b/tools/include/vdso/unaligned.h
@@ -4,6 +4,20 @@
 
 #include <linux/compiler_types.h>
 
+#ifdef CONFIG_VDSO_UNALIGNED_PACKED
+
+#define __get_unaligned_t(type, ptr) ({							\
+	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
+	__get_pptr->x;									\
+})
+
+#define __put_unaligned_t(type, val, ptr) do {						\
+	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
+	__put_pptr->x = (val);								\
+} while (0)
+
+#else /* !CONFIG_VDSO_UNALIGNED_PACKED */
+
 /**
  * __get_unaligned_t - read an unaligned value from memory.
  * @type:	the type to load from the pointer.
@@ -41,4 +55,6 @@
 			 sizeof(__put_unaligned_val));			\
 } while (0)
 
+#endif /* CONFIG_VDSO_UNALIGNED_PACKED */
+
 #endif /* __VDSO_UNALIGNED_H */
-- 
2.56.0.212.g129ede20d9-goog

