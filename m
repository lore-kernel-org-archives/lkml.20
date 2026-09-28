Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C301373BE0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618181; cv=none; b=CCp1oeissu1aKsmHG5VllNHg4ntpJvImXhRQYPPZflIb/splWlrWiXSFVx0j79oDy5mGrsrTL2eLEzfaC/K3AVBsz2MDumWRjQPZ7A7mr6EU9aVK0M/MdkjO2Bl+jTYML5i+pmlQoSx+xvpbOQ+VtndqvgS6zNUg3gT55v44SOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618181; c=relaxed/simple;
	bh=JxvuznqLzoNHOFITq+5sVj04mlf4U2b0YpG5PaxY7SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlHjxprVAi8a0cGi4n53YWkAyTiKC6lAG+EZnNOd2e5OVJEqiBCEkB1UzlwVBR37Ks+2+6EEHR3LOyY9Al1sw6y1OD6PbZRPXzkxsWgEyFB4Jj9FqQb4VWTyFRW5V4n7dP23kZTZBJN3yw/J0D00LqOn1BV+GNr0Cc3NXKQd7Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Nop+348M; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Nop+348M"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so63187e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618178; x=1791222978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+oiZYN5anlVv9s+aMa0ZbcmkVGe0RnDqM3OKTw5q4I=;
        b=p006hxymnpdiwgYF4JFeO7KvcvartOtqv1LzHmpfEZENOqdha6tQOGt7C6g4Ar7mAX
         Tn2k2ueL4cy1TXj0dltGjY5B0jSBSck0KB0xAq3NgBzO99okpTmoyPIbGFBByFmmYnCB
         sxSMSs7Ju8q/1bgLNYLZtz+p2BS9yYsAqvc51I8m4Mh7/5YpMRk3f15Fz6xt+3WwF3pw
         BvfILkLtYqzxne53aPmrjxAHAACfSc319k4VMPzd10LW4+YXGqFINnKPCUsOJzlu/ekD
         g9mphPXJ3kyfbykwJon02/OJFw8+/erjNynC36aeyMLKniq/CFiJfAe5MLmsSxMIxmKK
         GzOA==
X-Forwarded-Encrypted: i=1; AKwUvBwGwnXwGOUOnk1EIlCqT/1Vu/g5nzLzdOOUa3LKXDIxrIkQc8eBt85aRBtSKkJUiWVYzW6wNndGEDbBemw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3AN/J6nJ5fR5r4rG7o8J7KQwwCOXjz3yDu2DrASW1bJT80nHF
	UM5dwHNQF9Pxfjr0gw2vjxM2pWP7Dy2DvvWq2gsKcQ1KyPBuOpsonlOIhXXaz6qFF0KylopnScK
	p/QniO2IE62aP4NGXPgggQk8TCr3BUniFVJqcqWzyF8BMDPeJ3ItoSwFHovyL+VJ40DjKZlObnS
	fdM/mawTxk87R0mqKWuR42KhcnSPBxUJWLnuvhavuUQINLm/QUvWflAWVfY3NJA+yn2PqMsFHBs
	KQaRQSNWB1lIvQs
X-Gm-Gg: AYBFou2Gw2kkCzQY2Lk4yN8xF3FawbiHpc8JRiPeW3aFo2pNwd8HceyITfciGFKt0qZ
	hhjy7ylfyYgfsoL2Z+P7WiDYGM8+aeh9rIwz0caHT6TSWIk6TOpZkj+hiiuZZ62OOcQriLce9kb
	+WmaTR9ZcjR1br7TRGWvglIsaiWYezSiy2MfrE6V8qIZ5a9E5WLfy4JMnwYimMxIpNsBLgNmPFJ
	iaqJo3m5EOeBxUXfvO58PVIw8hUhYgOJVWIXUzVD0BPaML1GeqhXOenoo1z/yAI0otgWhcm8M62
	V9blg4ekPR6cECDT+Ca41r3rqZwYROLrK/O/g0RCZxD5PrPe4Te14Dm+PXlp/Mgq6xiEwSuxJZV
	HD29JtqJt7RllOffm61ThhWrpbS5VoMcuqasGI53/qA6oYtq9rOShbQGzwaTSDPTXSeqpq2MiHL
	30GqdQSBbhDQbUZTM8Q3rfebJmqD1JVqDC
X-Received: by 2002:a05:6102:689c:b0:79f:aa0:3790 with SMTP id ada2fe7eead31-7b94f2ca7bfmr50645137.19.1790618178293;
        Mon, 28 Sep 2026 10:56:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5ce3cf993ffsm1519190e0c.10.2026.09.28.10.56.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso140062eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618177; x=1791222977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+oiZYN5anlVv9s+aMa0ZbcmkVGe0RnDqM3OKTw5q4I=;
        b=Nop+348MUt4IpyY+kIQvSt4XZq85xIr1HwJ66IjENZI7lOHiz5laaFqg9RYNabPB+g
         dOvmvM6osEpK2c0153TeRNBFof2x31StiLCTjP8tr5WRNPG5rfbm7h0ZYKvXHQXg9LY7
         tV52FkF0z1JliXIceqqKP9FKfGeYln8OIpW8g=
X-Forwarded-Encrypted: i=1; AKwUvBwDsjfEJoFMM2kXXGEj52lIpVf1OTnP82X8zjdsuvDMr2orsP4BeAXzEGpkQ1se83en0brHTANMZ+RBYXg=@vger.kernel.org
X-Received: by 2002:a05:7022:d42:b0:148:ece:8cc3 with SMTP id a92af1059eb24-14b2ea0652fmr138507c88.24.1790618177002;
        Mon, 28 Sep 2026 10:56:17 -0700 (PDT)
X-Received: by 2002:a05:7022:d42:b0:148:ece:8cc3 with SMTP id a92af1059eb24-14b2ea0652fmr138487c88.24.1790618176363;
        Mon, 28 Sep 2026 10:56:16 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:10 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 2/6] crash: Notify pre-kdump callbacks before switching kernels
Date: Mon, 28 Sep 2026 13:55:36 -0400
Message-ID: <9ef573cdbbf5e659eea16fa23afeaf2488049198.1790014793.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790014793.git.zack.rusin@broadcom.com>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Fatal x86 oopses can call crash_kexec() without reaching panic(). Run the
pre-kdump chain from __crash_kexec() as well, after finding a loaded image
under the kexec lock and capturing the original registers.

This covers direct crash entry without moving all panic notifiers ahead
of kdump. A missing image or failed trylock leaves callbacks uncalled;
the shared guard skips callbacks already invoked by panic().

Link: https://lore.kernel.org/r/aquttpMVKX8e6zGB@pathway.suse.cz
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
New in v2: cover direct crash-kexec entry in a separate core patch.

 kernel/crash_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 2b36aa9fade0..5d9fe9e00f39 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -23,6 +23,7 @@
 #include <linux/objtool.h>
 #include <linux/delay.h>
 #include <linux/panic.h>
+#include <linux/panic_notifier.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -139,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 			struct pt_regs fixed_regs;
 
 			crash_setup_regs(&fixed_regs, regs);
+			panic_notify_pre_kdump(NULL);
 			crash_save_vmcoreinfo();
 			machine_crash_shutdown(&fixed_regs);
 			crash_cma_clear_pending_dma();
