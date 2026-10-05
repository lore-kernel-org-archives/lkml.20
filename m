Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364C41BA82
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196873; cv=none; b=nIk89/hA3BTJA2Dmb0QGsoIPcqUNbqwTpx661wlINTqDTvUlPaY78YxNZ3EJHqbahy+eu6KWpiySc5dWKt7ZnpDqgV1+Vxc1ws3yZ20Sy2QZpYil0inln/gr9eOVFUALjZ5DOBryM1C2MoEjlp7eabZ6ctz6AaJ4QXOQuXgF99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196873; c=relaxed/simple;
	bh=kggvnJycJsFAnh2i+OCqfJkWm8hhIDCqBxoCdeRLvLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nyjnpc4GTgeGNm6sarCNb5dpa0KVipiZ20yHrCRVZ2EqKykmZQlzckS2nf3gsvlyFG0uW4n96TyPqiwWT5jRvWpK5x4J22RuUeuVFSBms7ruMDbj5R44rpqjQdwz7xrhoq3+40husfBoY9qZCGMx5ixISX3vyBl0eqMuF1Ygul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRn9fB3D; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRn9fB3D"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2a99so793796fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196867; x=1791801667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfNFTmG0Deh2nS7aGVDRGia8yVBmhaEcXB3fZ65gnZU=;
        b=XRn9fB3DkdZsM5NdfcWksOMSWMZUYY8W9Bn6RDaKvn1NQgSskyEPyaomtk5dj1Y5BV
         FJ3Ye4eqLsyCQSUcM81AvP9gOfRGsXmA7VFbZpJCoDlySrNe0lc9oPcBF3/jzrvXsqtT
         x72KR3GxKuKX9PG46HsUVOzOMxoeZvoxecd+z/Rqcz8K8j951GQEJpvi38hMB5QhzfTf
         +Qyx3DG0CEif4Q5TSg9Z77hDZ11NNI47ZkaCWl5/ZAeqM0QLbiQKVAi7DjZhjAQRux65
         NIEiPsP0eSl6O4o85NIZ9o1+2E+sB9Ary/PIF4M/WW7hefRV4GnDqN1kTBNxOLPoUZxp
         JOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196867; x=1791801667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfNFTmG0Deh2nS7aGVDRGia8yVBmhaEcXB3fZ65gnZU=;
        b=yZJAPH0IYO00t0iO5ePUxOqclRSZ7hQkrMo1GTT3bQL2s4dU0Ut3cuPlW0/UiAfVt+
         SqeYoa4CxXi4VOuLC1eO0lQAp/asL/wS2dNnE5iyr3LTllXUhZts9ghnc5Z49OwIebka
         CY2uAXlwS9zxaeLp3X+fXxQGcvdiN1gXhoiiwnuvU4cRp3Wlne3k+U3nhkZZvLE0TjeI
         fN2EeflFXDa76u39OS/s/U6tOGXP6cAWhZ9J6f90fYTiVBH6VRusbvZ8cE8uxV3HK9Ai
         w3+Gik+1iqSbFZcHsDicTn6dBirO2EKmajEGhFRKH0Q8wITaJ+wKsvbUYntJlCvniyoW
         ps8A==
X-Forwarded-Encrypted: i=1; AKwUvBw+/KUPlD9PGGezjIKoDVCc0Lwc0/XN6oUo2ZWz4LhYUUCO+KdBX/LqruyYyd85PE2A/dRKVTTmRZQA65s=@vger.kernel.org
X-Gm-Message-State: AFuF++lQTGiKnJXEAKMe7zNyKK7PUGUJ34FtYKHH+Dqj/mmBXM+P6hAz
	aprW/Zkv9v3JlXGMxBFU3xk2PinkZVgDIwftFbmJbrpqOl4XYRnrN6ROlsN/uh3p
X-Gm-Gg: AYBFou2dwnlmC+91MZZkCWfGDE42pWZf7lLDaZpPd+ead3TUlGQ8JyjP+nsHm/9dKMH
	MSPboDgDUMLs4Wu49+lReCqSU7mflqgX1kkVD0LSVJCfUMvdt7sL1XYuU0+LtV7rdR37LLJB7qq
	XSbh4GZovrL8IU2l/cJvP49fZUxr/RAcKMCF5/oCCGFRvyaNkD3qNlKsgEpMyFO9MuEQ5r7LWam
	28x8lW678g5rOcLzp7kZaHNSgaQRcLAL8tBozV997C7x2mdGumfPJA7yl1PMIi4Gad+TLSGOPpg
	74rZlA/9pvu/jdlmT3QgqUF2zNy9dogrGbxRZhcOmVUDOoU1mF8XnWNZbPnpQGkOtGRvseGugbb
	3Un6jwAnf57cPqvJflvoG9DS/ZRlfq3OV8TSenAuMZLB3DommenTudJmRKOOmg5q6UT9hcXxsgZ
	OdDZtkM6OylGmyAkTFXTmxVn8J52SUSfXcF/Y+BWIZ/z5z3vmWc5xrviuMWbfj91XpRF8vcHcy7
	hM3+DNU2knPYrC0Ii7YiEY=
X-Received: by 2002:a05:6870:b44c:10b0:49e:5b59:abd0 with SMTP id 586e51a60fabf-49e5b59b7f6mr2174867fac.24.1791196867684;
        Mon, 05 Oct 2026 03:41:07 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:06 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] fixdep: fix out-of-bounds read on a comment ending with a backslash
Date: Mon,  5 Oct 2026 05:40:44 -0500
Message-Id: <20261005104050.1786222-4-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

When skipping a comment, parse_dep_file() treats a backslash as escaping
the next character and skips it unconditionally. If the backslash is the
last character of the file, this steps over the terminating NUL and the
loop keeps reading beyond the end of the buffer:

  $ printf 'foo.o: foo.c\n# x\\' > foo.d
  $ touch foo.c
  $ scripts/basic/fixdep foo.d foo.o cc
  AddressSanitizer: heap-buffer-overflow ... in parse_dep_file

Only skip the character after the backslash if it is not the terminating
NUL.

Found by fuzzing fixdep with ASan/UBSan.

Fixes: bc6df812a152 ("fixdep: parse Makefile more correctly to handle comments etc.")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/basic/fixdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 54063d980..9b57fe555 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -280,7 +280,7 @@ static void parse_dep_file(char *p, const char *target)
 				 * escaped newlines continue the comment across
 				 * multiple lines.
 				 */
-				if (*p == '\\')
+				if (*p == '\\' && *(p + 1) != '\0')
 					p++;
 				p++;
 			}
-- 
2.34.1

