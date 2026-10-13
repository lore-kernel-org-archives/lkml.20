Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B97542EFD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926169; cv=none; b=behTK1nE3MlzpOzdvkSV5syFhsNTX3HiO/sswMwSF/kcBuOCUs4QcTrlaXw8317gLXUJHXsIfQjoEpwadMHdITopfu4+YOi4OzubE83N5gAPv/OUchCcHG2g9GiRWsJD2dn4Xi3vikE4jzVpzNPMbPeoIVNblpf8Wpu2oE8+Rag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926169; c=relaxed/simple;
	bh=mYsd403UguRpErjneRCONzy9EwzsT+JCk5m6pugKqy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgT7Orh6/FooZi19jhyXeT8JemlOE8DZ9VF3XNWNcveL4hgZrsDGsChZ1Rvj5umxIpZVO1FVZG5zisfsczdzgTNp4FfCxF0fiUol39Ie0Hs8dP/eqt5tPLkTWzUejTSQAR2DS5irCdzhk5ndU4ghCS1QtUWQw9kCGbW1wAdbcd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hh+x/7nP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hh+x/7nP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c37b612635bso50899966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791926162; x=1792530962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wA5IrwmhjCels3NLWyd4qYpH5Gev6ZGf3R+/qrMipb0=;
        b=hh+x/7nPpv4e3V5C0vz46r1zdPuAWNCNS0h3rb3lSdzHKNYwROKUzCRc/bUYDvj14v
         5mEh7hvhb8EN5xAZrIsAyhNaJ9KhWe3o0hl4aH+9Vpb7sWfcCK9LQF/EozveACbOuzAT
         B3oacml2vOQuJRhkvC/zKQ+v9EOa8JuSaGH8ew6sS9CzQSb2hlaZFuTI+51Ndr9+RPE4
         j1CL+SWkxOEjptKVIQcWJma/2doGkRhctFsPkNIA30wYNGBWdrTbYB7xStNIUmHXXAM2
         aQ0pcQyQwCZGnJ7iPy6nvrHMWg/7wQlL6dV9Ig9x/dT/4NST4AA8ORJc10kywPrNq1G7
         0TAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926162; x=1792530962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wA5IrwmhjCels3NLWyd4qYpH5Gev6ZGf3R+/qrMipb0=;
        b=tRUICcPBmGGq/qx8q1pTsePXH5AOyCwN0Or1l9e/Hcvn5y/h339ye7H1ch0YQlYhmG
         5X1JXVr/VSUTORqIGlqe1xXyNBmycjPBIcqmO1GlcPfiB6rrpOkjnr8bss3/rzhkoWqZ
         OZjLcwb6OT/6SIcZaHTz3L+CabUHzQLxg4D5nF9u51hDrSAzkY0rXJvWN3KiLkuuEzSi
         pDuoYrUquS6Fdz3hfnGltevzi7S/F+V3F1CfFNyEJPubuFi2nN1YlvbTEkoy54jKun2P
         gWXOH0cOrJx+TeKT6f/tBrxIBdptkjb8tf2ybfMMcTx1Gvi48RZt8HU4HJ0KW3Jytwn4
         cHcA==
X-Forwarded-Encrypted: i=1; AKwUvBwrnyByNhMrzzOQOUY6rfgSEO15HDwfu/Xi4mexDBS5UcnzfcyvGpD5io7OebD37xmomP1fy/xtWARs2EE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvu0+39MotxfHce0OpxcyEfGAZRlUnTfL6NF9rA6lnN1QkwfbT
	c+CNcDkkjrsUbJ5JfXxRvJUM+V5t6gQQI1x0OjsXZ34sy7p+VlcCfzfy
X-Gm-Gg: AYBFou3GQXW6YPQPC8+9sWU9oeJkgJH/RBmn1F5phx1YL/u87DrNNWfzOzh3GnDu6ui
	1N88/ckgy6sGO4fYHjWBCRSc3+opPVCdd2Fz0XZYuntsROmFU7k/RV4umw/xCHGLZ3ZVFjG84/o
	5NeuKgYM6e6+Tom+4NeAy7AP5jIOL1jPWUWUAfsrbfxWJciGtVqYX9UZkJUplvGrd6MX2n19UqM
	XGT1u0ucCTXp/FaWiFnrITOYqVraEP1p7rtWDkweR+Zu1SKh5un/psK1CBrKfFxwBxrXltQbaMB
	JM3zAcIf0XzCDikIA1evEGj+SNf07NHVUakkCfOGRB0w6lA2Y7sYa/GIRjwnTk3f1PiA9hX5fAd
	/BAhAx0o9/aptp6icy0oiVinrR7WCstxoB7+VIjOXCY9AyWUQDu2zSdYSOlhThNOIwlu+LGKv1D
	NeZQQgDLEdEw7hNuFISehsoMg9/jDufU4sslZsOLWqHq/F1eKlSh63YCJDSs1ScmwuNxt7CbSHr
	Dv2ytb6UV2HmkIZ66Y+aONPn21/iQfj8LnJopbE
X-Received: by 2002:a17:907:c19:b0:c26:19de:9ae1 with SMTP id a640c23a62f3a-c31a9f92fafmr1338813466b.32.1791926161754;
        Tue, 13 Oct 2026 14:16:01 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm256776766b.23.2026.10.13.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:16:01 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v7 3/5] alpha: bound EV6 logout decoding by the processor area
Date: Tue, 13 Oct 2026 23:15:36 +0200
Message-ID: <20261013211551.991723-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013211551.991723-1-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ES40 Service Guide, Table D-19, documents a correctable frame with
its system area at 0x58 and total size 0x80. The existing EV6 decoder
interprets system words as extended CPU registers and reads past its end.
This establishes the layout for ES40; whether Titan and Nautilus PALcode
also emits this short frame has not been verified.

Validate the processor area before decoding it and only print extended
registers when present. Preserve rejected frames with a raw dump rather
than trusting their invalid offsets. Cap the dump at 1 KiB and round down
to complete quadwords. This still relies on firmware supplying an
accessible frame of its advertised size; the cap is not pointer validation.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/err_common.c | 13 ++++++++++++
 arch/alpha/kernel/err_ev6.c    | 38 +++++++++++++++++++++++++---------
 arch/alpha/kernel/err_impl.h   |  1 +
 3 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/kernel/err_common.c b/arch/alpha/kernel/err_common.c
index 94e1b3dcf6d4..9271ea425a7b 100644
--- a/arch/alpha/kernel/err_common.c
+++ b/arch/alpha/kernel/err_common.c
@@ -44,6 +44,19 @@ mchk_dump_mem(void *data, size_t length, char **annotation)
 	}
 }
 
+/* Preserve rejected frames without trusting their internal offsets. */
+void
+mchk_dump_logout_frame_raw(struct el_common *header)
+{
+	size_t length = header->size;
+
+	/* Bound diagnostic output and never read a partial final quadword. */
+	if (length > 1024)
+		length = 1024;
+	length &= ~7UL;
+	mchk_dump_mem(header, length, NULL);
+}
+
 void
 mchk_dump_logout_frame(struct el_common *mchk_header)
 {
diff --git a/arch/alpha/kernel/err_ev6.c b/arch/alpha/kernel/err_ev6.c
index 8144f2045b5b..f12299ae1f24 100644
--- a/arch/alpha/kernel/err_ev6.c
+++ b/arch/alpha/kernel/err_ev6.c
@@ -190,6 +190,25 @@ ev6_process_logout_frame(struct el_common *mchk_header, int print)
 		(struct el_common_EV6_mcheck *)mchk_header;
 	int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
 
+	/*
+	 * ES40 correctable frames end the CPU area before EXC_ADDR (Table
+	 * D-19). Validate both regions before decoding or dumping any data.
+	 */
+	if (mchk_header->proc_offset != offsetof(struct el_common_EV6_mcheck,
+					       I_STAT) ||
+	    mchk_header->sys_offset < offsetof(struct el_common_EV6_mcheck,
+					      EXC_ADDR) ||
+	    mchk_header->sys_offset > mchk_header->size ||
+	    ((mchk_header->sys_offset | mchk_header->size) & 7)) {
+		if (print) {
+			printk("%s    Invalid EV6 logout frame: size %x, CPU %x, system %x\n",
+			       err_print_prefix, mchk_header->size,
+			       mchk_header->proc_offset, mchk_header->sys_offset);
+			mchk_dump_logout_frame_raw(mchk_header);
+		}
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+	}
+
 	status |= ev6_parse_ibox(ev6mchk->I_STAT, print);
 	status |= ev6_parse_mbox(ev6mchk->MM_STAT, ev6mchk->DC_STAT, 
 				 ev6mchk->C_STAT, print);
@@ -203,16 +222,15 @@ ev6_process_logout_frame(struct el_common *mchk_header, int print)
 	if (status != MCHK_DISPOSITION_DISMISS) {
 		char *saved_err_prefix = err_print_prefix;
 
-		/*
-		 * Dump some additional information from the frame
-		 */
-		printk("%s    EXC_ADDR: 0x%016lx   IER_CM: 0x%016lx"
-		            "   ISUM: 0x%016lx\n"
-		         "    PAL_BASE: 0x%016lx   I_CTL:  0x%016lx"
-		            "   PCTX: 0x%016lx\n",
-		       err_print_prefix,
-		       ev6mchk->EXC_ADDR, ev6mchk->IER_CM, ev6mchk->ISUM,
-		       ev6mchk->PAL_BASE, ev6mchk->I_CTL, ev6mchk->PCTX);
+		/* These registers are absent from short correctable frames. */
+		if (mchk_header->sys_offset >= sizeof(*ev6mchk))
+			printk("%s    EXC_ADDR: 0x%016lx   IER_CM: 0x%016lx"
+			       "   ISUM: 0x%016lx\n"
+			       "    PAL_BASE: 0x%016lx   I_CTL:  0x%016lx"
+			       "   PCTX: 0x%016lx\n",
+			       err_print_prefix,
+			       ev6mchk->EXC_ADDR, ev6mchk->IER_CM, ev6mchk->ISUM,
+			       ev6mchk->PAL_BASE, ev6mchk->I_CTL, ev6mchk->PCTX);
 
 		if (status == MCHK_DISPOSITION_UNKNOWN_ERROR) {
 			printk("%s    UNKNOWN error, frame follows:\n",
diff --git a/arch/alpha/kernel/err_impl.h b/arch/alpha/kernel/err_impl.h
index 737b958a586d..5bef23a00942 100644
--- a/arch/alpha/kernel/err_impl.h
+++ b/arch/alpha/kernel/err_impl.h
@@ -47,6 +47,7 @@ struct el_subpacket_handler {
 extern char *err_print_prefix;
 
 extern void mchk_dump_mem(void *, size_t, char **);
+extern void mchk_dump_logout_frame_raw(struct el_common *header);
 extern void mchk_dump_logout_frame(struct el_common *);
 extern void el_print_timestamp(union el_timestamp *);
 extern void el_process_subpackets(struct el_subpacket *, int);
-- 
2.43.0

