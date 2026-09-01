Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527823A6B8E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226915; cv=none; b=JDuESQ/18CyOA2CwBA0Drit/dbAZtx2fCpfSAqSW413ddREKHf4MuQ+LNo+qXipMCkEMnFM6cokcrC776CqImbfMhmUnKg8/1huOjiD9/mXbpKVxIAF09zVoYdvug3ShCKdq0V402sTJJtUOVVcjSekD21c2gs+MNXjOEnaFKMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226915; c=relaxed/simple;
	bh=/IWTzbVOPmeH0fF1mbSmboQLIEEWZ5g1EYRkSS89PdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TB0ilvoddHNfsPPhLj0LikRWwJJ8XJX1dRziUGNp0cqVbyDAV4o4hl0aBswiTbkPYq1s996hLwpK1P/fhVKZV8YG+dSKwKhsTcACdhqSSizzoy4sFaSrKEFOiBUynYd5haoTkRjuKKn2hTKYts+oliWZPxrmTTAFY7IUNxjOd0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXoNY/kW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXoNY/kW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d942c7cc2fso2874535ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788226911; x=1788831711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxfqE4kEVSw43vLgWwAc6GNw7gmwVaFgoUtBMJjaqys=;
        b=IXoNY/kWQ35ZewUoBWluuuB3bysaavJQbC1O9Q6GCPWo7bX9Fwlt37t3KG29sFDGEW
         j2hJfh1dGjrQUuw812e7Y8CQiyp/W4tXn+S4XK0l61/+T6DwuRkU7xQuxbt22JVjqXQj
         j87YGpNMkcV5+C3vT35hhaOU0Sq4gkhzW5ZEe95A7SYxa/QQf9Rwj19Klt7AxTOtcHLv
         dVmEvWByTVhAsRhBIRsKNy4YhqI6uAvaH9BLhFOnXEDNlsCb80irj3ZV1W/8eK1EzY+b
         vgWThtIncVkPgOzoDPqAOzfi944irad8Ciwi7LtZP0rWYakuA+PCXAzEFzdmg2MCK3mu
         sePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226911; x=1788831711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zxfqE4kEVSw43vLgWwAc6GNw7gmwVaFgoUtBMJjaqys=;
        b=X2MBW6OzfmNXbyB4jVzuXt2qvGd5rNN83X41JkaXlijXAWrkQ6XfG61kQxljANqMmm
         64C6lDCTLkau50RyZj07Df43QD//U9nABIBWn/9FfNdzzRD51YDzSSxorfuVlM351S+1
         JVAqLDS9Phw8RCdvSdjahqgUxy4cc13FKUg1KelTUDQaR6/l+Ex4+qCWv1XKHqKa5F5q
         yjgW6LWaqxwYmay3FjDO1/cTH0IunKz3oScJ0RdqcMDEtLMP5g1+/KwVe026ijDyGJVa
         WmchXZltPzMD2CrLmAmwrvxuvcrrvKKgKfNbkaSARY39KCA2MJxdJMySEmPj1E7aBba5
         x7rw==
X-Gm-Message-State: AFuF++lYHwizz5CSnRW2zMvKRRWR/8ldys8UMog5m9+p0ip9590sI/GG
	N2AGaheai4qH/RFCCE5ELfwzklNWFaRfXopMRxCb6Usu57GMIYcpDGwgPWvrXNFu95Q=
X-Gm-Gg: AYBFou12/xY221dsYmMuqRYh9lLGSlr1ca3NLELGvCE4qRaKZfUSln6ZrSbU1vCAaGC
	SA6TYwpOKD9stNc1ZmRhstblc9+hlb7/uufZPGUdLzBZarOLkowmjs/uvetCLYlpSlpDtFsnQUg
	LggjJ3exWh/0Ew1uQHsbcvs25Phfqsfz5sew/Wio6+oAHIld09O4aI9Ql1IBZHhKZ5puJIqIkP1
	VXakbu1YwFRrp+v6g2RAzpddNkL40vUvHtlr68ugwQBozX0AJ+68o32U8Ix2Bj7v4XSMBx5PxE4
	7PyIYpZw1R+wpQqGGRqA1e7qci2bII6k0syjfRSaISx5LWfEUeUrgNUdWkRqDwskVSnb9iSpJdK
	5Zn52k9gdoN1VWgcIeJpqU41+gWQonLl39YLpVuP3DSh4TpupXlcn2JnpRU2tVskjKs6guqsGcL
	Yo9B+j1ndpXAhm7g+XG8Vsmk/JYX3wXL/pWVp4+L/l6eYaAzytacFGgXs=
X-Received: by 2002:a17:903:38c3:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2d74dbe9f23mr521167365ad.2.1788226910927;
        Mon, 31 Aug 2026 18:41:50 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d8f2aa02edsm32961835ad.39.2026.08.31.18.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:41:50 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: akpm@linux-foundation.org,
	lasse.collin@tukaani.org
Cc: linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v2] lib: decompress_unxz: Make it obvious that there is no memory leak
Date: Mon, 31 Aug 2026 19:41:38 -0600
Message-ID: <20260901014138.22699-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825191333.34276-1-skunkolee@gmail.com>
References: <20260825191333.34276-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling __decompress() or unxz() with fill == NULL && flush == NULL &&
in == NULL is invalid, thus there were no memory leaks even though it
might have looked like that. Move the conditional free() calls so that
it's obvious that there are no leaks.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=207113
Link: https://lore.kernel.org/lkml/20241006072542.66442-2-t.v.s10123@gmail.com/T/
Link: https://lore.kernel.org/lkml/20260825191333.34276-1-skunkolee@gmail.com/T/
Reviewed-by: Lasse Collin <lasse.collin@tukaani.org>
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 lib/decompress_unxz.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/decompress_unxz.c b/lib/decompress_unxz.c
index 05d5cb490a44..9ccded9934c6 100644
--- a/lib/decompress_unxz.c
+++ b/lib/decompress_unxz.c
@@ -342,13 +342,13 @@ STATIC int INIT unxz(unsigned char *in, long in_size,
 				b.out_pos = 0;
 			}
 		} while (ret == XZ_OK);
+	}
 
-		if (must_free_in)
-			free(in);
+	if (must_free_in)
+		free(in);
 
-		if (flush != NULL)
-			free(b.out);
-	}
+	if (flush != NULL)
+		free(b.out);
 
 	if (in_used != NULL)
 		*in_used += b.in_pos;
-- 
2.55.0

