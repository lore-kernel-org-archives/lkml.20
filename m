Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675430;
	b=jWLXGN5uXs7EQAhqkIj/qnzMhz3TnvTPLfygL7shGCKu9K2RgMrPVYF07J+TmEwrNoEO
	 cGnerP01SVR4VFrxArAYusPM1eZ7BsgM6/F7RtoK6fXz4lVF6/WI5C9XrEDG7aa+vW3JM
	 RXkF8mgFA0jHM/rY+CgIFQFcV7KHH/4UbKf4rl2ru4c5Fipo/U57jli+10Rvt6ulVHO81
	 QphFfZ54D6Be57VeC+CJtrAvSjpHjxqtsi/yJPMzFgdeamVSYQGT7oSur5R2Bo6trlX2l
	 NG4oAsbVA3C7KbdisZRf8MDmn6Px0LiWITVvuHZFyT2IaQ/BnznsDF1wfMhJPj0kvIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HNEqvmwAaJcQQT0bJS+96+mgAm147FSeb9nql8qeRUo=;
	b=U1XO9euAQRsmtvqWcXFSrxECOZ13Sj9O7wWnzLdFfYnybYmQ1iWzjs+18S8FP9CTq06C
	 at2rRJZ2rm43Om99cjkVm98T+BvPhZRd151ld5JRtf8rKksGwkWBFYyT7gxT6kqMkasiC
	 8RVZ6ked8fTBIIVRZZvZzTTtZ3cZS7apK/JI3GSBL9I8XLbDby729JoauvzNPR67c2hdP
	 XY1p47Bn2ImNXXfAK+zLUqrcpYph8sS5YQDJ0aLqlDqkEiZ3CB//qXa9nPpRcFf8eJIvw
	 KNwPLrL3F0e6PTHxdnJGpa+fLMYBBNJwrJkCaLX1iiKzV+y78+GA1XVdSZPrlWpQKdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKL8yMoY;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E6606A8BA
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D83E6606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hKL8yMoY
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1465bbbdaso2091474e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675428; x=1795280228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNEqvmwAaJcQQT0bJS+96+mgAm147FSeb9nql8qeRUo=;
        b=hKL8yMoYLxoIPKDUsLva/Ciqirrwm2mc+KOghdxk6j37Hb0b5hIFDNIbr3EuPi7MmY
         tOFYRtyT9d2+5r6RqBTIAJ15CLbODa1oC7l/bPrOq+cwViHygVonpc/+UdW+zqdTu0t5
         KLP8KTHXqYhA6YE8B2Qi2YVKzL8wmXSj0KmQbQTLJ5+07hJceGhq8i+tRVnPZaQaEpte
         Wp1ErZqvp/b0TjOxm2pnjudavZ1Os+UtGauuBkRzWvpd8D3x39lBAsWQ1v71Rxlbtf2N
         5rCGcYVSxfLRbtTWVPcXA3wdnOBsUSj/a4c5OBxK6bEAr9eQR9dKmrkiKclu59wo3S6o
         y4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675428; x=1795280228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HNEqvmwAaJcQQT0bJS+96+mgAm147FSeb9nql8qeRUo=;
        b=E3fGhhLFzQJmEwreFMl/tgOmLQLlSAUcGTyKA9CE/kTTUdWPI2T26VbbDeUHqJop13
         iP2TPWELc1X8KLo0yq5a3fuXstHEvDJsankdaiNOK6dn4TfM1K6NwQq5iJE06q6YPHfD
         7/y3uMjoVGDKAwYr7hY/nsnydkfUx7CU3RbZax6wHW0X6n3uZ9MaKCwEE2gogNQZdFQl
         oQpMwpGrSgQ2J/MhqM/0q7khGvhCYXDu2tNeJh14Oz6ZryjoMgrohZTYQSWBOEXDiFVM
         IfF7uVUCHPc5ujcLvPpfOjcf/rEErrGfTq+hdW613e5YYPWiPnUF73HRfGK7OQcqEm7e
         A3xw==
X-Gm-Message-State: APuU4Z93Ut07uSEdCMSO5Vy8qsZqwnYx0puNVS2xPLKZ4rVH38/DVd+H
	mLLGpoc+cx4o6efJYbk0P3ZOVf5bQblR/desC+re0SbcuiS58qQpb8nB9fPhcZYtGFZlwIF0
X-Gm-Gg: AYBFou3HdG/se8sybOCwDkp4nJe66DNxA6ThNk389ZVfT5axTG4EXRrZnL5EOwt7j8Y
	/Ay+I+lEl3P7jnf8ZVoz/gi3HdCD45Cxm5oW3+TZFfwV+QTbG3GTTKc03Kt1X48iudViL2qDjQT
	ldT+WAPBV5FBXnf0ZO41O6u/Pb0hM06+4ND+tMVUg92b24wQahOvcZTlf4dN9BTCRx34CLCSShI
	vuauW7T7XRaP2B6gXbAZArbawiuCfGNwcMdQ4hLZRj65vWEbxBfZdaOLUhnsN0OuDHpprfKjVp2
	xA1v7tM62i1GhHGslYPAEtqij5Rh/K34MgIdFBfqff0tXblXeN3oC46M4642Dm0SDRZCh82Y8hv
	/Tld6XaMPNEV9k0tKCcR5grCb/inE+x+YfiBFU5ghz0qWKEwbqWeI7BCu5K4A0A3/hp2y1wxDjX
	Y/xh87oE7n1qs8lsyzuAM+HKpuSPfX3NfaEidBtFjZSBYFQTP2N2PwM/MTD9Zaycy69qGydG+GR
	J0ueRYaQa4knLjt7NsVjxJo/dBTXyTKw2JZeV6XcW+KuoQ2tS0LbNh4Rl5N4kZynVyReoG++fBY
	C86ZPVb1bcMMUzAE3ZPKzbmpjMTdsiNehLg1TrkDZaXFUpm3YOPuG4x6Tko9d3qWWRcLfWgFAsy
	2uNq9O1fFm9Q=
X-Received: by 2002:a05:6512:3f0a:b0:5c1:57cd:50b with SMTP id 2adb3069b0e04-5c17079a9e0mr2059501e87.14.1794675427912;
        Sat, 14 Nov 2026 08:57:07 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:57:07 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	printk@lists.linux.dev
Subject: [PATCH v3 11/14] printk: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:51 +0400
Message-ID: <20261114165612.368785-12-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 include/linux/printk.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266..09a28181e 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -136,7 +136,7 @@ struct va_format {
 })
 
 #ifdef CONFIG_EARLY_PRINTK
-extern asmlinkage __printf(1, 2)
+asmlinkage __printf(1, 2)
 void early_printk(const char *fmt, ...);
 #else
 static inline __printf(1, 2) __cold
@@ -200,8 +200,8 @@ void __init setup_log_buf(int early);
 __printf(1, 2) void dump_stack_set_arch_desc(const char *fmt, ...);
 void dump_stack_print_info(const char *log_lvl);
 void show_regs_print_info(const char *log_lvl);
-extern asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
-extern asmlinkage void dump_stack(void) __cold;
+asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
+asmlinkage void dump_stack(void) __cold;
 void printk_trigger_flush(void);
 void console_try_replay_all(void);
 void printk_legacy_allow_panic_sync(void);
-- 
2.56.1

