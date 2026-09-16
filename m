Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA35314A65
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570051; cv=none; b=BANHi6ETr5gxL2UbnVWSS0kQfLoVtB2qstM+rziUP66EYySRPSN4t0yAIQIQV/1EYelZhzrkqUjQwATQPOuMZ9Q9P9Sr93ocA4KnmK0lorOLd1pLHxaaoSc4rDFP1rm/IAHjuSxqUgdZJ/rCjjfUqiA/1iroWr0Arg8A/REHCVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570051; c=relaxed/simple;
	bh=C1oNciHcEscYHEFiBPOAp/Z1rml/FIlWarmSgscZ6yc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=muzozJjeL3H2pwNhyUebGaxnH1zjzV/1KSzVScPErEri91z/wCmaXiPZjNDkKRj19dUcib0i33WebXnb9Xga9dSgG7/N64G4mSxCirAtimROgAnGbOIO/JqIArTkFMzaoadEYk3N34iKM1PJzqL6+ULzn6tnSuZoKTSZP/Mg/fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ram7WL1U; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ram7WL1U"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so47446985e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789570048; x=1790174848; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SChD6gZN6HYF8sdEF4kgrqs3H/vnYWBrVFLBfW4Uqts=;
        b=ram7WL1UkFun17DGGjfsO6e/gXDih8BVBZPFc6KbHc+b7rw+7UxT/tQ2XAvTuXTaqB
         5oNh2oFIRZpK3VjWZpC0kSqSA5iIDhTIbO5Sds/bruL8eR+WkhjBiZj86N4sSaB3z7Aa
         GmMy8M6ACk/70uM/tMNBkwRgGAWC6dInIXAAtCCSrQBYPBeSFEar/674vTThJZseCqY/
         aB5t7kbNvAtUy9s6DYPdcvU8Fz0eIpyEYFZU3ZP+2562G88s/ASIzheutpWiFffoUgdo
         emC4bPyNhYhoJuqFgIVLlyXEPATiFEvCzN8LBYzHSN1TjkddQal/bcw/eTKqHdpRPNIV
         orrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570048; x=1790174848;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SChD6gZN6HYF8sdEF4kgrqs3H/vnYWBrVFLBfW4Uqts=;
        b=fGd137K5We2VYxlnij9jNbswloWztHHt0xK7EmjINIznpljrDxqUZ7rDAqEhnntvlH
         ARpGSEomm01THXIC1k7oKkIUn49fjavRxEqEqLLJcgvnrmKNTGs0SWAEsRdEnEpfpeSq
         0P8n/QpTCjzVOrXCa5JSSqjpA+/MktfKxgUF9EWl7HxORUAeKQiwrDoVNZfGwRDIy/M6
         r7Xr7Bh90I4Ry2Uz6qm3tNFPMlayuSfyFP+0IPX+fKcTZPxk4qlXu5lGeh9FGe4HV6Fl
         sS8KXixfUfipG245yv+6WvznLpvBwuXYB75fBpH83Ov+WUyb3sjsLvg2BQch9aZsWC1+
         bwyg==
X-Gm-Message-State: AFuF++nexjbJK7f8nPOXl7bmjzlcJARCY6zq0gqirw4pBfEybqgJcwi5
	r6UJLYxqJTTJLc3FULT33jEeX5KAFsdVOxWhaQ3cfbZUG8FKyH7dkdbjSuCVyps0bctdGuWx6A=
	=
X-Received: from wmbgx11.prod.google.com ([2002:a05:600c:858b:b0:49f:646f:58cf])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b29:b0:49c:fa21:e74a
 with SMTP id 5b1f17b1804b1-49eb733e4camr32594375e9.32.1789570048115; Wed, 16
 Sep 2026 07:47:28 -0700 (PDT)
Date: Wed, 16 Sep 2026 16:46:50 +0200
In-Reply-To: <20260916144647.2651379-11-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916144647.2651379-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=705; i=ardb@kernel.org;
 h=from:subject; bh=qgkzqtEAKN071Ee9/bQchBV2SIPhg66nmHFUwJgGBhA=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIWvV6tt+qv/5vh6efeW1WvZCDaON99Uy1h/fbsCW8PJ8U
 GG1rLNYRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIRRDDP8XLBYaKknVxKc+1
 dk897rVIyeXJI9vLkQG8B6x2Gj2pWsLIcGRGY0P9vA/Vou/Zp88LmcNlc31RyXOTjwttfZTsIw4 U8wIA
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916144647.2651379-13-ardb+git@google.com>
Subject: [PATCH v3 2/9] lib/ucs2_string: Suppress modinfo when
 __DISABLE_EXPORTS is set
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Vincent Mailhol <mailhol@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Allow the UCS-2 string library to be reused in the EFI stub, by
suppressing the modinfo data that is usually emitted so that the library
can be built as a module.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/ucs2_string.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/ucs2_string.c b/lib/ucs2_string.c
index d66fef9c9b81..f75fb4f7961a 100644
--- a/lib/ucs2_string.c
+++ b/lib/ucs2_string.c
@@ -165,5 +165,7 @@ ucs2_as_utf8(u8 *dest, const ucs2_char_t *src, unsigned long maxlength)
 }
 EXPORT_SYMBOL(ucs2_as_utf8);
 
+#ifndef __DISABLE_EXPORTS
 MODULE_DESCRIPTION("UCS2 string handling");
 MODULE_LICENSE("GPL v2");
+#endif
-- 
2.55.0.1032.g73a4cd73de-goog

