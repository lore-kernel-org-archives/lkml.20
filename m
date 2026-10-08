Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8993AD526
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477659; cv=none; b=a9byrZ0LLvhy80YqVSv6GGqfAdj41EJAebKiiH0cioabNVShU45DIR0iHv/svwW7j0fKk1K+ulrMmmKkisiDyVXmVMA+GLiicWuAUCG3ADENZ9TOi2GTiATPF2cFlehxSy3P7E3o9Dl9Q53coGxbeUIjnV83aSFDnaf4q71ZXNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477659; c=relaxed/simple;
	bh=a0Q5F0AmXKiNzoBKS3lSnAUeaKLJcNU3lOveVRrVoyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DV2xrtXAyuU6PEQav8O2T3BtFKqgGWz3wCbmaaxY1eqsjWWPNjWuR7iCegoa9U2iT1+34QbSyCra7cQFTly7093jxgTU9hXsVz87stRQfMhf7tJvOs8RiPgTVogRbeNzdQ3ttqphTgD7q4ijli60UEBGIfyhw+5atKEjDIqQirg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuJv5BdF; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuJv5BdF"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6dd7070699eso3993832eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477655; x=1792082455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpFBb8SAxU073g9j+68SAmlLBQHqt4SI1RVx+GlxzvU=;
        b=iuJv5BdFGtAcMy1DAMKvhDxV874XGdPRw9FBV9XsH6cwNmazEqq07YobtgFCK8fr/w
         GcER/boMS+6yjVsMB5EcN4R6+qCit9t1JqBxRNMtNnBrJRax2uIZvL0h74mhQbTQZgsX
         4EnKRHeZnLQF9g+v33ehRtK5cq9fUXeP6G9aHtksSeEAZhjHifwgyD0mWbpeUiWRq+Ol
         PIc/tuqC6dl9EHPTuMLx83Ot7754/usl8UQfdSc3a3XSBU6xOKzeOCLAddCkx1Z3KOjp
         iOKBCrzxRlJAO8LHCr+eIl/qs6hhKGAHpAGPsFg0nZSXEPEIR41I5Ub5X3GnHBdBiyCH
         bB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477655; x=1792082455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WpFBb8SAxU073g9j+68SAmlLBQHqt4SI1RVx+GlxzvU=;
        b=uEJAK36ZTdARJ1cOOqtG8me/9HHUN0hVJu2s5Vtrv6dbdIxmiLFwfx66royo94OLjJ
         n8T/jrTQnEw+iKRStpu0y1GX0fUB8lD4WkawTX/SAB7un4u8wWBMXkZ7sPBQYjYbnUHr
         WB3xcD6d4wIHs/e1mOgWYnTHECv64gplTxGWJrqRjDlMczR9EdFfnBuisVyhp+UmLq8m
         fNQ9J3QucdjakvUXq0TKEHzRgKUI0x5rdl1gRCW7LzLQiSciUJBWLYJY6QokZw825VFG
         rJ6rWLnlwJbEarvhXzMElFadN+EiSJyw7DYOq5aKoyYyvNE7EboB37n0FPZQmypg5i6M
         3EaQ==
X-Forwarded-Encrypted: i=1; AKwUvByxKs0tDKNWAfVrIOq4USUd8frzeW8xSL7UQzyNc3wtIpK3LMbbzASLWioeFnpz/oZaAqKk4V73JaW3xJA=@vger.kernel.org
X-Gm-Message-State: AFuF++nLOnKa8V8pavMxoGmBpOcxm9KCZ3lrjDQRXtHJllSEzajw46Cq
	wFz71+CYDHFD6tkwZxW2oxezDQ9NIXX3TJ6xdNEC2P9LgTrL2EZLjqiCJdNPpw==
X-Gm-Gg: AYBFou1kZ2/RFo+MfaTDt2iHXoIjWoqaaw3b9PKJNqQ5U7fhly4mCnqp68OaOsbc3u+
	jtyiIm6avlB8N+nS7352ewan01CwgwsChOVOHS4/36ENgOlUak30yZYhu+jhp/QytLic8RjVcde
	ATdhMGvGvfJ+e+MftghxslqbnwvAPHEpTy4nO/kYAEFZsx5JoqHisdEalpzw6+wVvp76By72skK
	K5TWzeWhOgyJH7a1tHuTNkOTBb8CZ2H/ZcXZ4RG/EaTqG0kn+nZBw1rGGq70Bqc6qikerQXQuli
	X3yCow0eHorI7pekBGssru+WuTtGLdzGboj8NkPel7ihXpeF0zcffhgnQFjpr8KSEWH2A/BHxtp
	vSHeW7sGfwCChMXyEN1JGwk00Z9GC11q+FskQAKfqi9IFIHpKc+y5LejDlPmcSH4niS3muFJEUe
	5yOeFwgQCWzwFbvLxxLbK1zJTtUvED6cGG/A4ISLt4L/8eZKgY8JrU9++HKHyBV2uuFBGjUljcf
	rdIP3eY/QV7QPM7fPQgFIU=
X-Received: by 2002:a05:6820:1887:b0:6e0:e81:e5f5 with SMTP id 006d021491bc7-6e7a6c5ece7mr5641831eaf.47.1791477654868;
        Thu, 08 Oct 2026 09:40:54 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:53 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] modpost: fix stack out-of-bounds read for unterminated PNP ids
Date: Thu,  8 Oct 2026 11:40:31 -0500
Message-Id: <20261008164035.3668885-5-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_pnp_device_entry() and do_pnp_card_entry() copy the PNP id into a
local acpi_id[PNP_ID_LEN] buffer to upper-case it, and then print it with
"%s". A PNP id that uses all PNP_ID_LEN characters, e.g. "PNP0C0F1", is
accepted by the compiler without a terminating NUL (the kernel is built
with -Wno-unterminated-string-initialization), so the local copy is not
NUL-terminated and printing it reads past the end of the stack buffer:

  AddressSanitizer: stack-buffer-overflow ... in printf_common
    ... do_pnp_device_entry scripts/mod/file2alias.c

Limit the printed length to the size of the id buffers.

Found by fuzzing modpost with ASan/UBSan.

Fixes: 72638f598ec9 ("PNP: fix broken pnp lowercasing for acpi module aliases")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-6-lzsx618@gmail.com

 scripts/mod/file2alias.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 61a831c187..7685fb5135 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -573,8 +573,9 @@ static void do_pnp_device_entry(struct module *mod, void *symval)
 	/* fix broken pnp bus lowercasing */
 	for (unsigned int i = 0; i < sizeof(acpi_id); i++)
 		acpi_id[i] = toupper((*id)[i]);
-	module_alias_printf(mod, false, "pnp:d%s*", *id);
-	module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
+	module_alias_printf(mod, false, "pnp:d%.*s*", (int)sizeof(*id), *id);
+	module_alias_printf(mod, false, "acpi*:%.*s:*",
+			    (int)sizeof(acpi_id), acpi_id);
 }
 
 /* looks like: "pnp:dD" for every device of the card */
@@ -594,8 +595,9 @@ static void do_pnp_card_entry(struct module *mod, void *symval)
 			acpi_id[j] = toupper(id[j]);
 
 		/* add an individual alias for every device entry */
-		module_alias_printf(mod, false, "pnp:d%s*", id);
-		module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
+		module_alias_printf(mod, false, "pnp:d%.*s*", PNP_ID_LEN, id);
+		module_alias_printf(mod, false, "acpi*:%.*s:*",
+				    PNP_ID_LEN, acpi_id);
 	}
 }
 
-- 
2.34.1

