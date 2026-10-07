Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFB44B489A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380893; cv=none; b=Nl/355o7B+bQgsn/bs6B3cKAK88p0h70z/Pf8ea2mJ2lZ9Np+xnY1+LcL61ZKqK1RCKqhdYys90o28KRfdQPAd5xnchlJ8eJ6wE1gEHkUYHw5WS79eG1WPnVHf0Ohhjg3n0yVRfRhtZ2hhGxXxrpLwsRlFCD7RvTqisijqCoLzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380893; c=relaxed/simple;
	bh=I4PeQi4SmvyrZYhDDUSHgIx+IfnvBhcHBkpar0jUK/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+JCkrQBcUAS1/CEGehTO201uKGEn0M51EMhjLH28+yLqJlnYrp2DTNqA6v1Zdyfi72HK4zXr6mOvGjqavNm3yb8x3WTYZaKRu8tm8V9stC1XXAqu/l1wdAfcz5WNplANpQv+7DBcBJKcB6OAtFUQSeeclXMQ/sjdlcY2NsddFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY8YODyU; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY8YODyU"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-34c4a0868b6so3640564eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380882; x=1791985682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TOZ68Zqd5ykdIjDqMFf3hngPNxsHC1naKT//wwj0pqw=;
        b=KY8YODyUqIOH6CB81p5ahuVTAWYy7ma6MLfPnyTHm/wykJ8UtkyBD4vXkRgwpe1VHK
         ckVnWcY+6pK8LJKxWW5HUcbYe42KZdTs4XE0MeEbmIMmCBnsy1e1YAecrgLiapmz7UAi
         cDer4XRGS7bUjsRfpMEe9YiENbK3jG3aFp+p81pqH7hhVLqlVpLXRlwKoaSjRqBhUfay
         6L6HjOaGSxvhd6Ds/10GkWquQAs5uBeYGhc//Lezng7/kJGAB4NNRZXkWxXoUNYyHg+U
         ZZKblWCDpokzfaqU+7iVgjJepFEWCLXmFFhhVNWx8hIUa2C1yUeDr0k/V8OIj/a1SEii
         3S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380882; x=1791985682;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOZ68Zqd5ykdIjDqMFf3hngPNxsHC1naKT//wwj0pqw=;
        b=fGKkeBEOW7VQVETfkKiZfk3rGcl2/cm66hbmHysM6xVE3e1sbOYuWSQJfe5AjgAvO2
         7FYjypcBbQbbWgqLImSQBhBYR9572aklnt5QgywDa9OawqG2CgJkcTCqIVxyTvIoqHOs
         rNDFptFJMTUmBciwRkSVGJyRiULrh9hfs6tpCdhrErsEduTQz4mcOuCXeLDx7adnsojm
         O2jB6vb126cdAmJ2lmH2+i/TzT61EtuVESU3IzKp129tVH6x/aOA3QfLM2R7mM+hZh2B
         d3aRaKnZPoeI6L77xAPlNhORXnmIH5fA6/j8l/MO5o7jIDAwHvZIlm1DGgCsMbcE0XgO
         O8Ww==
X-Forwarded-Encrypted: i=1; AKwUvBz6uwBWvpqzCAc5JXFIG8Ew+VFgI5vR8wsFxn2vFGFHB4PHFsxKkoTG6Bt1xO47D7m0P+EKCOj9HVTezww=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIaFfqVmowXsLDBroDb3HyuVbkmZTDIa6CO9pRqNxb0i/+j5WJ
	+V4oGeRd8qlDytr37z4ekxE1mgaNOl/Akruzf22JUAbFUfHO6MarAiFJ
X-Gm-Gg: AYBFou0lf4xS8bSrKfV/xXqHhL9Fy72F1wooKzc05BT+77/HHizuZ5kLlRxi/HpdxFh
	oSFso1z+D+QsT95TioHOHK6YMwaJv2i55v6+IoK+H1VET+qZp+5Oaq0701UsLBHvbaRejTXYfOi
	81EtBfP72TsUHQ1QSFiiQ4cfrRHCh97Yq/aH6J6gpW966aQPZdNIcvt9OLcLtPoT1NKuvRWHjzY
	WbxMpox9dtxYn16eYIjyUpAGQZm0cyfnDqBoyubZNf2UyxyLAprwvHjBOMVCZuubjrTIKBz9z8T
	hhQQLn1wM90LXvjnpeY+fEvSmT2bARdKmhsJFRX4g4wjelAW5tzHTDb+JvgZdDjxXiw2RjmbK+U
	DnzaY0F+k2gM9LEqTbNgvtY/Zs1sobblpmK4HyAVw6hDYx+Yugd+gUeESf2K0PZAZr6R5FSNDDz
	0/XfwXCFaduXfnXvtcWrV+BAGyZ+IAmCCCM3SopkywHYT6XLEZxcA29brnOywk3jOUTHmdvuIXO
	4CCNKDpRH2+ir34IGhGuovcnSBaluTsXG1pUQ==
X-Received: by 2002:a05:7300:de47:b0:350:c7e7:57a0 with SMTP id 5a478bee46e88-3514530ab4cmr5957045eec.24.1791380881436;
        Wed, 07 Oct 2026 06:48:01 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:48:00 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 6/9] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
Date: Wed,  7 Oct 2026 18:47:08 +0500
Message-ID: <20261007134711.473857-7-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The store handlers copy the input with kstrdup(), which stops at the
first NUL, but pass the full write size to
hp_enforce_single_line_input(). With an embedded NUL the copy is
shorter than count, so the helper reads, and can write one byte, past
the allocation.

Writing "A\0" followed by 4093 bytes of "B" to current_password makes
memchr() scan 4093 bytes past a 2-byte copy. On an HP EliteBook 840 G2
running Linux 7.2.7 all 100 such writes fail with -EINVAL although the
input has no newline, so memchr() matched one in the heap. A userspace
replica of the helper under ASan reports a 4095 byte read, 0 bytes
after the 2-byte region, and is clean with this change.

The input is a string, so only scan up to its first NUL.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v5:
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 754ab03bfd7b..84d75926d768 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -166,6 +166,8 @@ int hp_enforce_single_line_input(char *buf, size_t count)
 {
 	char *p;
 
+	/* buf is a string, ignore anything after its first NUL */
+	count = strnlen(buf, count);
 	p = memchr(buf, '\n', count);
 
 	if (p == buf + count - 1)
-- 
2.55.0

