Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C5054CF78
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954965; cv=none; b=TJt5RamzFRq4Ogb2dH3+t29HPhegRMYsGLhpf1Lr+cVTeww1vroBrFFNjnOwIC7xYel7oLSEQr50qiRrp8aWuy/UP3p12pVPqjVNJSTetcE5hFRisfiC7/yueTCmMLv4pXz6MeHhWuRien+AobL7DEqWBteHuxlERjwzmzvfsYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954965; c=relaxed/simple;
	bh=cpND4ajGQ4whtwDxApGKl+yItkF1v+76zOyXZudaCQc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ktt2WTRNSYQDb5MVkMSlyb1RC2gvINAY7lvMgXd2WV/xDf3c62yXAv5PIeIVodytfT/JwXoau2oEUIZgXNB6XD/hwjp3neNDiJFMt9ELF7lMddEHFrynfpA5hr/tu4PeGf/b+5F35/k9H12YKTK7fSX73Ktv2SfAvqGC3fPE/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aCk3c5ON; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aCk3c5ON"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-485b0c83a89so382461f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788954962; x=1789559762; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YxIvPRsg58vNQqeM13M4GmviuEdPs+Gy7tCd4tfN1w=;
        b=aCk3c5ON9MrtmS3jNpv5QswjHT1lAwYhlxHoPQriKuqjQQM8ExT5AZmOiac8CQDpJG
         1eVrKVPyxvgsXftSUIyl9kl4M0Hs/pwzgfxGm3XRQMoQairACl6gob3MPMnPpj+QIM8+
         dR4O/lVh/Ha5qd3PrGsIo3IfRE/bFUByinuii++t/eX+3zH9QdDGbbAoD/aGyEUDebjm
         Z+vL1rm5qsTnN7E85d0fRhXsoyrlrHzJNFhyKg6Ns/CN5VVAkRxnNMFfSVtP+p14TINQ
         FqHgiKUe02oJr78/Ff7vpQpz7PgU+mQH7w3RK07cScXfMIap71Am5sudLj2v9pYow4nG
         OyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954962; x=1789559762;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6YxIvPRsg58vNQqeM13M4GmviuEdPs+Gy7tCd4tfN1w=;
        b=ZNIcGvx1JWxtjrKP8LTWAr9AVcXLAIyMDFH+09Tzu9W/uh7nCDlUUlm1piYY3yDT7E
         HDYkhFqgWjs0jUhVQC7Y+zLYBzVlK44hJ0GNFmi1scORt1KgrwzOkvMCeKoFyRTUNH+2
         adzx0PazZWXpvregKW4z4GxeZ2QHBOk5nZpWVCgSQsHd5G3N7zQpo/zx+n35svn+33Cz
         5G6bcegSywThvJWYXNWR/6hgZR0CZk3ReCdhK0OB4AU86LVWKd30PElYdaKMzvN/rRuI
         DOGFDDicLZtcF0+VXddIwN9H3g9Z8UjWb+65HYrzKvY1fEEybyf6Va6YfiKTGmbX4+pR
         LoNQ==
X-Gm-Message-State: AFuF++kEtF6sRfoa/fsYD50e0U8O9soKJlO2HqyW1FzdzkwOdFg4Nya9
	x17zvUZi6aLykWx2LvnzhzxdFq6PYkFzd1aUQ8aDOWljBSg8O15bN2V+irnbe10zzgnKommVsQ=
	=
X-Received: from wrbfm8.prod.google.com ([2002:a05:6000:2808:b0:47f:552e:8614])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:240e:b0:485:8f9c:2879
 with SMTP id ffacd0b85a97d-4858f9c29e1mr27912309f8f.6.1788954962028; Wed, 09
 Sep 2026 04:56:02 -0700 (PDT)
Date: Wed,  9 Sep 2026 13:55:37 +0200
In-Reply-To: <20260909115530.1924665-12-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260909115530.1924665-12-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167; i=ardb@kernel.org;
 h=from:subject; bh=7/E8aF0Htzhx3o/l045gN63OQScc68FeKEQViLjvVRA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWuhp6WIefaHhAn5NxbyCB5ROr8tXC40hfPXhNOCLWV3n
 rxZIC3VUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACayK5KR4XCbo8/ba9XbF0cf
 +67/0dntxbwWmQfxkiWp+w01eHjUghn+Cl+wXXizl8s7fYr7/ITNYu/tg1ib6zPj7yRblPG5HnN jAgA=
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260909115530.1924665-18-ardb+git@google.com>
Subject: [PATCH v2 06/10] efi/libstub: Avoid efi_puts() for compile time
 constant strings
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Vincent Mailhol <mailhol@kernel.org>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

efi_puts() performs a UTF-8 to UTF-16 conversion on its input, as the
EFI console's native character set is UTF-16.

This is pointless for compile time constant strings, since we can
simply define those as UTF-16 to begin with.

Note that efi_puts() also performs LF to CR-LF conversion, so this needs
to be taken into account as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/gop.c    | 6 +++---
 drivers/firmware/efi/libstub/printk.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/efi/libstub/gop.c b/drivers/firmware/efi/libstub/gop.c
index 80dc8cfeb33e..6919e28ba92b 100644
--- a/drivers/firmware/efi/libstub/gop.c
+++ b/drivers/firmware/efi/libstub/gop.c
@@ -309,12 +309,12 @@ static u32 choose_mode_list(efi_graphics_output_protocol_t *gop)
 	efi_status_t status;
 
 	efi_printk("Available graphics modes are 0-%u\n", max_mode-1);
-	efi_puts("  * = current mode\n"
-		 "  - = unusable mode\n");
+	efi_char16_puts(L"  * = current mode\r\n"
+			 "  - = unusable mode\r\n");
 
 	choose_mode(gop, match_list, (void *)cur_mode);
 
-	efi_puts("\nPress any key to continue (or wait 10 seconds)\n");
+	efi_char16_puts(L"\r\nPress any key to continue (or wait 10 seconds)\r\n");
 	status = efi_wait_for_key(10 * EFI_USEC_PER_SEC, &key);
 	if (status != EFI_SUCCESS && status != EFI_TIMEOUT) {
 		efi_err("Unable to read key, continuing in 10 seconds\n");
diff --git a/drivers/firmware/efi/libstub/printk.c b/drivers/firmware/efi/libstub/printk.c
index bc599212c05d..f36639886d00 100644
--- a/drivers/firmware/efi/libstub/printk.c
+++ b/drivers/firmware/efi/libstub/printk.c
@@ -136,7 +136,7 @@ int efi_printk(const char *fmt, ...)
 		return 0;
 
 	if (loglevel >= 0)
-		efi_puts("EFI stub: ");
+		efi_char16_puts(L"EFI stub: ");
 
 	fmt = printk_skip_level(fmt);
 
@@ -146,7 +146,7 @@ int efi_printk(const char *fmt, ...)
 
 	efi_puts(printf_buf);
 	if (printed >= sizeof(printf_buf)) {
-		efi_puts("[Message truncated]\n");
+		efi_char16_puts(L"[Message truncated]\r\n");
 		return -1;
 	}
 
-- 
2.55.0.1003.g10538fe699-goog

