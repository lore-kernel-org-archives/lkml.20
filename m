Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614501;
	b=m7lhrPvnqoGiNRu8DK31V2Nh13wWllnUgsHlwyCzHuXQ2pCAsx/JaK0aeokwe59uq51N
	 RoEh+CQ7l1XjKYKikMVICi5cqOoi3GJB0gs3QgNLi1vbv8fUzwYKRMNTXN2cGh4PfzpLt
	 9MHegLiF6TFL3QC7Ezh3SzIUQTxzXhNR28V+bZ1pzhfTxdI32aZPowMPTRH+ivK9v0/eQ
	 WMyvHDMa5n94Wd9Al5t1YdcW8nkSN59+bbM7EJ4G8csDSXkti9HwHkVIhjF2nXyzyrg7/
	 9I71ol9ImGS3EadAAR09kBS2+JiJcxKw5AJ0StgUVLy29oM0jzU0d2ndYgZSGZY0yhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zRD0mPqiIs7KB0/9JW36eAF9YH1/o2iif3vtRCsEuiI=;
	b=K52yi9vlWGTQpiHcWhkwfal4yS8vW5z9fXwv0sl+wwLIHr/JvR/Mx+0I0RKBdps02pvS
	 2bcKxRDHJf2s6Wyw2mhJkA7XwUYcgnPvfMe+HSFER7ij1XfY186gXeKS2pDWuN8alYlGP
	 4pVDu6k0bl9JOuHoeT12EDBeQhZ0Qc9o60QTs67ABffI/S8JVY/Md5TG5Rp0q4T+0Wwq4
	 0mgOJLG6tatCc04DDdUNG+3JBGRAtATKfyvK5GJKYUu5rfOom+dOtsipKXOT4VVDO0z2E
	 YEaLfDLMCMIk2rljohsXXQ6AIEgJwHjsH37qR0g69I8SLkDXCph6W4wQFmVx1mpoWfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuYzLrCJ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1E0606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C1E0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WuYzLrCJ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so21151295e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614500; x=1794219300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRD0mPqiIs7KB0/9JW36eAF9YH1/o2iif3vtRCsEuiI=;
        b=WuYzLrCJVpYezwehGn20NF9BVugfv5+0l3QPG5LBtIFVkzS/3HVxp4S+yLm7cWWfHF
         oe+fv6BFtpHGIRyzlPb1k2I6ut7lBB2SgVC2lQXqFJ0xuJUtXAo4qLftjIhnjUqymrBt
         2Y/6PRcKm6019oSNcC7fS4iT+6aIWWXbGqKVPJb0tcEMIHGNl9kXaepkun7RAfWJb+Gn
         dJyzXbvPBSjdjkxIvVFV/B5FkCVENWLSHTha3zfmnonUjMAuqniLjtpBb+cyXWGetZLA
         MtwNHvo0ztng3wb2++bSt7/29WA5l/Ut0z/qbsQlYTEaMAfuk8pKs0Hseco3L1zU7Gfu
         /H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614500; x=1794219300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRD0mPqiIs7KB0/9JW36eAF9YH1/o2iif3vtRCsEuiI=;
        b=gSVBe8xi0zGdvmSXyfalfgvLcTv0KqfRalOEHJx8c4QV/rTb0k4sWSFgOEdu3HXqXb
         aZjM66vPPiBGW9WGlMoa9YLYj+0FYGeJ6+/FShdDf5JvS9hyaJ5lzBUGrmGIVN6IvyEl
         grZohpQhr0Oq3L8TYxC2h4WgtwutDg71wOCWuL7PEnLX8ofp/cychgZX+RJQtvphk5Bc
         Y7h84LZw2QpAvG+bsKWmNrGRX8mTs/g9EfuhbYQ4xv29HsuJYnOMX+5jSOhbhk7lvDhm
         gWyjMZgAARt6T7BzEbSfJRQZvagGPhAvKdm37vEaV2V8lmTvhFXSDF5bFcsWryFnuPlo
         NefA==
X-Forwarded-Encrypted: i=1; AKwUvByqZdO8Vk7oORnjo0U5E/KYaKWdpQgJyD3oM93eAsDb+uwW2PLaEaSfW8pmZbJE65f94635FKagex55RCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6atXrTQbkzKOhAfkhgDlVHULGRgwfAXI+k8nz5xDuFEs1+dZm
	4oeK4U+/3nNhwEHdEiLJ3Tsi9VAv9uATH2Jy3Nsh6Yx2wwE27H6hfIOb8eENdlPH
X-Gm-Gg: AYBFou1LZRnhWmRL5REzEMZbPYi5j08l1QhhBk0Rq55SNMz53vFUSIg2nuYltuVX1sr
	Vz1LhqyZIOCjE69Jj9od2Zf6kb2wpN0B8ngnTIZ7ewbDoS7+gtuljLGSe3+nyy2FQ949jvisiKe
	GR0o0+OInli6Qez/8pOBsu7ZyP5DALoM74lOmlKfS2SiOL8PVMCMQoLXwCJfG3ExUenSxeu7VGU
	O9CuEEpfBupmEaRpnb0YQ++0+R7Wc+yIzfMuPUnOYv1oc4uTyhZurPMgEeI26uXz15pJEy7yqY7
	4d3QIaOk3Pn8XEDHKbICwmJxAU4b0qpGSS1x8CHtRuR4SJjyI/CGwMz1kWGSqG7sq5s4IbaXEsA
	ytc/A6ttyCAeOJH0QqzZxDLWfVNUW+bhnvKV7Zzz5+CceUp1Q6JtbUZgM8XZM8Y5swCUkZ/0FkF
	SPkLfanuG6tAmHPEXKrkIZzvZ/NLwSU9pD/FoS8H8nn1m8fwPXOwlz25FuJ8OPdDviLpmMMTatd
	d511a3BXT+ltzK+tqg5THmDV/QAmdpslR5P6rd57zwJft2F85yyRi2IYaa4aocwi+VqGmF39nZ1
	vQ4c2BhoJzz7EgyIbgX874JDLht0BV/Q/QEHnOODeI8m/nS0xSnxvIZ96mnQ40e428lfg2NcjCu
	wfO4qRk/Lo/cCnkGSMH3sbRnjPdoXPs/IktE0wuzMe8uucvWbatmGFDwbypnGa+n8FA==
X-Received: by 2002:a05:600c:4e08:b0:4a1:ce33:1536 with SMTP id 5b1f17b1804b1-4ac1719112emr211409145e9.9.1793614499570;
        Mon, 02 Nov 2026 02:14:59 -0800 (PST)
Received: from maria-VMware-Virtual-Platform ([154.80.101.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm263888645e9.5.2026.11.02.02.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:14:59 -0800 (PST)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH v2] staging: most: dim2: fix non-kernel-doc comment in errors.h
Date: Mon,  2 Nov 2026 15:02:03 +0500
Message-ID: <20261102101433.4618-1-mariasheikh812@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The comment above enum dim_errors_t starts with "/**" but it is not in
kernel-doc format, which scripts/kernel-doc -none reports as a warning.
Use a regular comment instead.

Found using scripts/kernel-doc -none

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
---
Changes in v2:
	- Use a single line comment, as suggested by Julia Lawall.
	- Converting it to kernel-doc was tried, but it produced
	  warnings for ever enum value and its inline comments, so a regular 
	  comment is used. 


 drivers/staging/most/dim2/errors.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/most/dim2/errors.h b/drivers/staging/most/dim2/errors.h
index d707daaac3b6..966b0c731921 100644
--- a/drivers/staging/most/dim2/errors.h
+++ b/drivers/staging/most/dim2/errors.h
@@ -9,9 +9,7 @@
 #ifndef _MOST_DIM_ERRORS_H
 #define _MOST_DIM_ERRORS_H
 
-/**
- * MOST DIM errors.
- */
+/* MOST DIM errors. */
 enum dim_errors_t {
 	/** Not an error */
 	DIM_NO_ERROR = 0,
-- 
2.53.0

