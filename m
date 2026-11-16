Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830838;
	b=LjPAiEMifZhMn73Er807XyFC91goZH+dGORsvjuXayWHVNoI/L8r4TAJyQAmFOlUDwiN
	 vkywFg55yJwydXJ1We3XohLVlJ0Xca70FaghNi1gGhdeBAnWCegTVjVInFOCi6n0kJ4DG
	 i8w2C1Jb25MYFGYhmPxHNBApE8Jiq6nLEkBEe5x/2anRWAwBNw+WD6y0CR0LcjziHhV2v
	 gumdngDP2UgtILQVrqKDBAQQ7wDgwm4Yd4gxphXvfCIoJkRrJ0DYZKb0QJc/W1+uOrxF8
	 iHZvO+VTz1Y9B/+lh/05MRdzL8mOPvnsBXxGFNf7HracybigCacd2XKx2iLnA227OsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VQ9fMu9NMp/tbco4p1dhzyKR+F65QW6o/JsPZ/GtUjw=;
	b=RjVQIGd7V1YPFrw47atL/aqKiqkyejQy9Cu/CCH7X/Rv+yun45e0cBewbKG65ugX8dcY
	 4pGLHyyemXSeBBpI1G+WWd4DXXRUG6SMhxCc1gxcdBFiatD8zu+nJSu3bNm48oQLO9R6d
	 JqQsSGfVj1AR4d3c+z+BZUsEpiCCPChs/xgf45tvOOfun3J/nD1VHI8PMf9FJOjgZOuET
	 dDNqW7RSODlf4lwZjl2B9JG2Y8VQsd1K+RVIgHPAFqlaROtENZKMg25+Bf0F35DGPuuW+
	 99u/Iw/2pfqOqc9H32ypErpANUbDhO1U8BWnJqQAXggrZRpeQRZFcYiG3G4Vx6e9V+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erOipV6p;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C415606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C415606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erOipV6p
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1438d9363fbso1597490c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830837; x=1795435637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQ9fMu9NMp/tbco4p1dhzyKR+F65QW6o/JsPZ/GtUjw=;
        b=erOipV6pLuuVWDPxlwozZpo3CWMAkKjgJtdW9SaFoRLOVdIyvsDCGXICfmTS5F00kf
         ggjOAxV1QekxIaYPspg9OXt5baNILf3bPITlKwlTcujsXLanNrJosaXJDBX5zCtS1CCl
         z3N+AuEYv1esxmHujjJszcVlLHiIfhvai7VAzo1aVkOwCUEAjp/3P+8zX73+UhDlu01b
         4LqTv5cmkz3opF6GJwhvgIDpOwi4M6Mv7DOu8iWF/p0dU+gMTpOosaWn2vVszvXQjwKb
         Y80VZ7NWYOd4Fj519/jgqrq4mT1oqXvfYBy3vNQCFkoiBa6BxUxlKXDvUpbJyHylKY7f
         byRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830837; x=1795435637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQ9fMu9NMp/tbco4p1dhzyKR+F65QW6o/JsPZ/GtUjw=;
        b=X/gM+EKYDvFSeTOPAeLkzKAbI4P/kOFuPZXdZ1+ImJPjzRGeB1E4EzXIhtYJ4ZMA+q
         +8EIKWV8bVXdob/tG6LSlT8Pn8TF7++AJNvgsKNjS7DX2b+HNqkaY1SqSgumXOvw/ZVI
         Nk97kCwQ2O0/lRTJCse8YJF0zrwmJEbXXzH6BYOgaCax9AD5+6HOIqudacVFXbI9Mmc6
         rvnCC76GrzANpbqL1oD3b6+nxm/GxH0b0IronF3hfH7Xn+W43rvpCYu+Qx/Abb7UbQdm
         YgFXm11en+GzBa5/0/rhXPivei5Th6JJKIvvNR/luPv0RApIATFgO1ju36XPPfrYwdQl
         acvg==
X-Forwarded-Encrypted: i=1; AL+hErGGcc5i8Huesqm32xBNuW06BhFtV+NXWDYRuTkuX2zof7gekJKKrP5BBkaDUjyBngYIna8Xog68tqijTTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CogPWE++pbmRJaEiyAdvVQAP/QqWh8k81727IHGRP331M0fto
	7uQseylUSAUWlz63BDK9Uhx3kgXH3Ax89mfAaMhr3UDDKKTds+BOkOFq
X-Gm-Gg: AYBFou3lrQmFh0Fenp8ZUsE/EyWyhjP9DkH1fXKg57ZJFjofD6DFRY5kLaQLiJ/+hDV
	XVf47fUaAcx8+9l+EMkvl8hq46ydaw3PMqL11qUzmEPOBIJfE3g6Zrn+NRsyenXb2IV/WqfSIey
	0oXoHqiHz6G/ZI5YEvRmRt8k/OML3RsW7VlKTiwgNbHPWbJCbXhFhlAuKI2hRd0gbIEU8jUyd/R
	VtENeuGlTg7cGZ86v3C9NjrOSfKTS163jp9qdCtXEBi6rrYUIfuK/GJIGLCfXJ7GMfJzhUVaxq6
	DhcsYMMv+yFqCFKAC88+fOqEYVwiERZartC+7d1ZWMfwZP+H2rvY8m2FLSBNLQ0HAz3upuaHiJi
	uuGPXLRz+uwag4YX+3p8T21UihQx7JPFjiH65Fn6WhjZOxJYJk4+b0Qyf6wVvJoJ7K7M+wwwT82
	etj6frYVlaOlzRxoYZGGVaBM09Tpj+14r9MQv/kcKRVEhC3XaXIcFtFuQyq+9/tj2StVdB2Bx+Q
	kFLNYe72hAAqk9vM7L/aAiH66ZqgOWZLC4Ghdr550PUkiRRG5+fDaK3A82xus/ckojv4ZKJ1yRD
	8DT5RHNkc2dM/1AaZDpk7nycx8gQuHQ9QfkZS12MryfImiX7qjPRCJOhn6lgS+OEo8Vp0UqPTA=
	=
X-Received: by 2002:a05:701a:844c:20b0:19d:233:989d with SMTP id a92af1059eb24-1b5030ad3bdmr9029261c88.14.1794830837228;
        Mon, 16 Nov 2026 04:07:17 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm32146157c88.11.2026.11.16.04.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:07:16 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 3/3] media: atomisp: Remove unused hmm_flush()
Date: Mon, 16 Nov 2026 12:06:58 +0000
Message-ID: <20261116120703.6681-3-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
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

hmm_flush() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c     | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f5..545bb52c5 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,7 +32,6 @@ void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
-int hmm_flush(ia_css_ptr virt, unsigned int bytes);
 
 /*
  * get kernel memory physical address from ISP virtual address.
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f9..f9abb1618 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -263,11 +263,6 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 }
 
 /* Flush hmm data from the data cache */
-int hmm_flush(ia_css_ptr virt, unsigned int bytes)
-{
-	return load_and_flush(virt, NULL, bytes);
-}
-
 /* Write function in ISP memory management */
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 {
-- 
2.43.0

