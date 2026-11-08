Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140945;
	b=moqwZti5VSTSj6hj0z4C7HmtshMGbL4KItYopIbczotCfguNIQ3fqzIwloZtOhGXeXeK
	 0WmtFCNNeraTm7RuTlv1sQ2NwgeuZp5eeCnHuKf0KmwNrjRHLnLOBS99EvTwMLShY0V75
	 0pOxbaT7PxXl43PYfUnQpLikBeY4h4LdAFFQhjuGq7hN45f+x9Zz49Ne8Nye8DDhGml78
	 2nDlAZwsnDgKE3L8Uep931mkR6QjtLUW8dO/X0S1XzerPFHd8EFFhNjpQP/tqemE8+60x
	 KmxBoyyjieWcCZW/7NX7VZi+XC4vY5y92bBBLtTuk3spRHqIikOduBxNdfGwsVGGMOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Si8+elJrOqJ4FlfCJWkOKmX5QdVoxka9MT8fi02MVY=;
	b=3CTMG2Fxty/clV7dXhdSyvy5mSpduKEz51Po+OE4qSMzXnmmB9F1lIcZ5p+p90h1UgB7
	 FBBfvcYbyeAEVuEc6LntIpQdPjCersIbra3wO8PDoKkWYSFoReOA1PvlMGgIyLea71xbk
	 BcIveDJ6XRCK7W3BrCWJzPyup3+evuL2l/RCUVr2XV4lwYdiSX8TVI9FgUKddgDAItP9b
	 QNtraxWjvCUOWqKTsygXAs+3dSHrpxzi2IB2B5fgrlZWA0nHIjDkG4Z3gmjyVCl+1dXhT
	 JVFBrWc4CwsU49Yrgp0lgtIdWjiJSeO3W5zNv882nFLIH+bwIPwbWyOe34oNw+fwimA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S+Yg+so/";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C41F606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C41F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S+Yg+so/
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3704d30b84fso87045eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794140944; x=1794745744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Si8+elJrOqJ4FlfCJWkOKmX5QdVoxka9MT8fi02MVY=;
        b=S+Yg+so/wrYSMEqce3JawMB8vT2zIoQojZ/DHUYMAuB5JrUIMjTCcq/nFfwR38Rqgt
         6e4j3Rr3HdIB+zBUDjJzr7VFBOs8LZRU0hSmSWAgqYRY+c4yiQqdYHa3aNVm4Lk6rtFt
         EadmBXCYDUD8OpJablBSr7NsiOt0bMSooAhCOr5fPlSWe+i1CsGj0a0WCso9uaXh2/4n
         aM9vHDv+d81UjDxeyl34pBEl3R/xzIASSnA9eEtXc7pCNSWS+7aU+b1Ux9UOpI9dbxd0
         b9jBLeMU8Es4H7PeoLjhUOVcaZp76C3YXdTk2AbMwpW5nYamlDQ7r+jojZ8JRLkBIjVF
         pudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794140944; x=1794745744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Si8+elJrOqJ4FlfCJWkOKmX5QdVoxka9MT8fi02MVY=;
        b=ECPghjddCsIJ8QKRwx4qvTmrgdD2kzmnhEB9o8uYkAQNz90fk3JU+Ki2O4I7okFXDy
         f97oUKyzzRjbg1kJTr7XGX6Z0kh97rO7im60gEJd5r7/yXOsrHPVzHIj+V73BQY158sB
         l5o5rDSpj69NhnT7NWOeBuxfPReK5J0Kq4lasv92rOPIww7oKvUFQkoctGABXLpGe1nk
         YMPkFufiQzoSAKRkPQ3CvovdFttrq12InqS1cR2Gw2AQ3FInSWbS1Y5AdlOTEMi2u09I
         n5oEjd5R09pE+aMMomdU8ElyNL0ARLgbi7N33LRK6hITMWdEctZUkED9wFZsAiQyo4/b
         /KUw==
X-Forwarded-Encrypted: i=1; AL+hErFLsF4AaVCIGBDMvvAZX78t3LjRgjIKIhpta5pYUkUqyV4wIZalMkxys/0RdeBHM9FgxvFZYwo7H16nw+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1Oa5cmpQY6NuFfgAjCWp6YNcLebeJWD35/vR4Koh+/4k+bBmL
	ukzR4cuuQWbBibOvr76Cx7JdfYg94qOBbUBiBxRr+CuhOJBevWA255lMgi2pc/KQpWcQdA==
X-Gm-Gg: AYBFou3u6phwdjBbbrgwLcqaEoaIEnzXBdeB3n5l8SaUJigVSfPqPVXyCuLXku7UkdY
	3JIHgXLFn7gMiLjwrMl46B39hOc+Wohdrlc8UAeovKSxlIhuFzzJwTlVvaxC0EyFM3FIK5y4efa
	wNeRSxHSs1mIy4N18X7Nekie+OxOPyCO3jRcBWEkMsSLTcLe8csfc0AgU9lwaH+IdLqxICZWVr6
	6cYeMD4MlvQZe1sLol7THQBfj1bfK3orePP8z47jWyOw5viGIFLR5guhV200RV8Ug6S5p/rnNIY
	6nad0w+rSQolpfFzaH6ZOKMlJWTGrbV6WBjw0jArv5fA0ONFWjdIFU+M0WoTXAhElk4B+vJM+bv
	+Vh3YfxnkNFwo6no5yjvEfUuHJ60AbQ4OTY6XSlyXaylncqVbsjTvDOYvhvcSFuPs2NrMgkxD5i
	cQ7kyIk38JbH2Fkf64dXNkcjAhiH+aQgVjdNszwnBVOZxIz+qVCiVjmSLdFOKg8r07Y5IZv/ovO
	brNiFCNpPrVXbsaTXx+2bygTHr9hmbYpCLp901QqHenA+TdgfIovgD+2Jx2SM3DpvEehw5e9aSF
	pV0kgwmpx0iWPGtAAl3Nr7Fp1KpaGMpWbOCQV4XGqLrT3Bh/5RFtp8CNdcaDz1T5HA05XdWlhpk
	SZvXn9PtEEXRRyk4Fcz+4RpOyRb5aCi3l
X-Received: by 2002:a05:7022:418c:b0:1b2:3448:840f with SMTP id a92af1059eb24-1b39fecac01mr3000460c88.7.1794140944129;
        Sun, 08 Nov 2026 04:29:04 -0800 (PST)
Received: from codespaces-88e7e5.2t4prynt4dlezbzls5ze3dxsqg.rx.internal.cloudapp.net ([13.71.3.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3731487edsm6036253c88.2.2026.11.08.04.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:29:03 -0800 (PST)
From: Lame Morupisi <lamemorupisi12@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lame Morupisi <lamemorupisi12@gmail.com>
Subject: [PATCH] staging: media: atomisp: Fix block comment formatting
Date: Sun,  8 Nov 2026 12:28:40 +0000
Message-ID: <20261108122840.85622-1-lamemorupisi12@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Align the multiline comment describing the MIPI frame memory
layout with the kernel coding style.

Move the opening comment delimiter to its own line and align
the subsequent lines consistently. This is a formatting-only
change and does not affect driver functionality.

Signed-off-by: Lame Morupisi <lamemorupisi12@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cd..57179298d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -130,21 +130,22 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 		even_line_bytes = odd_line_bytes;
 	}
 
-	/*  a frame represented in memory:  ()- optional; data - payload words.
-	*  addr		0	1	2	3	4	5	6	7:
-	*  first	SOF	(SOL)	PACK_H	data	data	data	data	data
-	*		data	data	data	data	data	data	data	data
-	*		...
-	*		data	data	0	0	0	0	0	0
-	*  second	(EOL)	(SOL)	PACK_H	data	data	data	data	data
-	*		data	data	data	data	data	data	data	data
-	*		...
-	*		data	data	0	0	0	0	0	0
-	*  ...
-	*  last		(EOL)	EOF	0	0	0	0	0	0
-	*
-	*  Embedded lines are regular lines stored before the first and after
-	*  payload lines.
+	/*
+	 * a frame represented in memory: () - optional; data - payload words.
+	 * addr         0       1       2       3       4       5       6       7:
+	 * first        SOF     (SOL)   PACK_H  data    data    data    data    data
+	 *              data    data    data    data    data    data    data    data
+	 *              ...
+	 *              data    data    0       0       0       0       0       0
+	 * second       (EOL)   (SOL)   PACK_H  data    data    data    data    data
+	 *              data    data    data    data    data    data    data    data
+	 *              ...
+	 *              data    data    0       0       0       0       0       0
+	 * ...
+	 * last         (EOL)   EOF     0       0       0       0       0       0
+	 *
+	 * Embedded lines are regular lines stored before the first and after
+	 * payload lines.
 	*/
 
 	words_per_odd_line = (odd_line_bytes + 3) >> 2;
-- 
2.56.0

