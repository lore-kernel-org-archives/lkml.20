Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F8E221FC6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570056; cv=none; b=JPjHSver/o1vVEVj+iAKgoo/zURVqMf2ByGVblU7lmF271jdMsD+6j1/oZMXbVRaMx5Cp+58Hi9XViuy81M4FJHL7SfLLFlK/qqqG05iQVot1Tcfg4E5GZE/U1YIrsLQnf4amSExHXH5oIsE1hg/XeMGLyWCyQ46wrFBqARUlzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570056; c=relaxed/simple;
	bh=4M3XeYI8lfZyQ0kdxVKYo99uiVCoJeAAy1bxt0mFJPs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UBJPsZ3mB5aD6HVuqjN6GgxKNExZtnwWkTr08t3bpHuUJZbLW0S/T0mY9dGdDm3bira3kWKtuJrvUNwbpf6yUslnkwvcr+ChFtGWy+fwhbw5ilk4css54N/Ibjn24VLImBwvfk9RR64rZ0S5ce1qD58xY8rHA3cIrbvL/nVKGyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hBJF3vjR; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hBJF3vjR"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4994cf6cdb9so43761465e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789570052; x=1790174852; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5xo/Tmz0T7aPKmXCPKRwoNwYrD0vFb3mWe6uQZFyqY=;
        b=hBJF3vjRNOcUWlJm44CO/ai4feMv7qKg25RwbyrxAa4TpdmOSUY+umQuTrCWCe5H6X
         FcMwT36yPADKtcfJYODnL2o2mqvKbzNTKsvDj0fLCUbuNbPnQai3tr37eIBXynORIyuW
         oPsVmdJr2LshAIcDX3YoEhhXBXnQ8k/otC0NfvM98IMdAvzSX2O/qGhAZF/mx6iOlrEs
         Rfj03lWk24yAM3eLpec5Ryi+GhSPbGJ25Kyliy3gz4KY/zPrViapwhP9ugFwG2PZi833
         3OFtRJZb9byuYv5Eb4xw3uPc1q0nkx5ZlHRQn9BWuLsbokOSScUUV2NVygyq65yXiEd/
         Zhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570052; x=1790174852;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5xo/Tmz0T7aPKmXCPKRwoNwYrD0vFb3mWe6uQZFyqY=;
        b=GmKMH1uKy/yxJ4NpnGieZmKDh8Oa7ENnWZdd2GsUis2vf4lE5XIwA6yBsd6TSwoLJG
         QexfdRFTZnVK3P5J6MpU9PvZUZnnOW7iOCBpzVN79Bmrs9wyDGFsCzbT4T+4dCJCcDlv
         yzZqq6EXU4la/kV9ISKKazfPKwc95TkKXkKuMEssB6KbzsJTY8RbZEt6+SZWenU3IgDD
         XPTuotq0b0u3gCkuN+81Tgr2868qXJPmqnNV8T5sHeiJWNfWJ/EngfugYRzGjFiBGi4Y
         YD00ue5+xMn6+hq2G3zSHGL1aHiY8dIiAu8CjtIXXUsBVNfgXRJqzyclH1EVa+L7brY4
         WnNA==
X-Gm-Message-State: AFuF++mnIhcGh8aP9vD1E/Ys3UX+Xlxzh8eUXMMQ13KmxSDxDOiKefLP
	Z6sb+QtDhrgD0fhXjkvO+FwwkrOErq/ksRX/FBm+ga54Aqm9aXCcbUbvnwONd11YcFyvoj4dwg=
	=
X-Received: from wmbhi10.prod.google.com ([2002:a05:600c:534a:b0:49e:661c:77f4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b87:b0:49e:6c9b:4e94
 with SMTP id 5b1f17b1804b1-49eb73308bemr44031795e9.28.1789570051918; Wed, 16
 Sep 2026 07:47:31 -0700 (PDT)
Date: Wed, 16 Sep 2026 16:46:53 +0200
In-Reply-To: <20260916144647.2651379-11-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916144647.2651379-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274; i=ardb@kernel.org;
 h=from:subject; bh=dlXdLd0hhW7NlWGwnSX6SvP8+eAGOum46CB1gc4SNxc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWvV6nuhlcpndC5+UPqwZpVFuYsFq30/27SrRmt/2V4+o
 Z185rxSRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIUg1GhnV7TZZtXR50v5TT
 qEym9q6KdwqP0d6HAe3Jv31WlU6Res3IMKH07bnb09Tm6257Mdmf5+qXGF/+R+btt/e99gqvr3s azQAA
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916144647.2651379-16-ardb+git@google.com>
Subject: [PATCH v3 5/9] efi/libstub: Avoid efi_puts() for compile time
 constant strings
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Vincent Mailhol <mailhol@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

efi_puts() performs a UTF-8 to UTF-16 conversion on its input, as the
EFI console's native character set is UTF-16.

This is pointless for compile time constant strings, since we can
simply define those as UTF-16 to begin with. This takes slightly more
space, but removes any runtime handling of those strings, simplifying
the code.

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
2.55.0.1032.g73a4cd73de-goog

