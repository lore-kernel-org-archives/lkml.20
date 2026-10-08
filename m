Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC141E5B70
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477663; cv=none; b=Dls7zVJ6ljTk37egK/g/CqARFhEQ8/o5kSxiVdloJGYWcnRVnHkOpWL1+kUQ+DhgHPQTH1nLHsbi0RWMFkgvUlUb+IStT127nmeL0MhQ+BtYW7BOhEr9C5EFh5mTwadOy0Y4R2oHtRybiv1wX52WpmMQ55X5gIlsekNOhkLQYCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477663; c=relaxed/simple;
	bh=CGkt08J1CJ/VMUDa51WjoDDacvdEDDXnqieV0LWPOc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dxp628PHGiKksKlvDSwPVbUeBpb0IXfyRymJrb8Ry2aD8xpVw5ga9k2rkklW3ZUHUXXC+VhYr+GOWzbRb+JOkwBCqIKbXIVl2jfiIvmNpBuw6YV6rzRUYG2jioqJ7JyoaPdHyvjW34mWVwv/PelHyvoqjajDNwqek29P4I2sJC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncg9kAgQ; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncg9kAgQ"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6e560e00a86so2110167eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477657; x=1792082457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ol9KVV9igaZHeICPjqaqiMrJ1pRvQcCPa+Vpo3abd3M=;
        b=ncg9kAgQHBns3QWBJ24TAwvTgAGHN46Z9BldkUYoqD42Zo9sK8BakrGsB8eYmRAuHd
         vfOYGCsNJPGsoIwj9VLK0SMf/LyZBj6HK8V4H0gwJ6SQ1dgVzt/of5/6m6+4AI5OOMNZ
         w1taSeXTEl48HTYWDHARpgVAUzlCX+/+Cys0gZ3fmOxUqSjyIAmL2q4QP3uXNffoARMe
         IYOX9fB8FbKs32iRBWbPDF25dhLXBxcnhtonBJdWdezgetIaYQat8vxbCwmrw3mhl0x7
         /KAPE3HC0XGN/WrbzYOBV7+L7U9uBi/ZjbJOeIyRTUbwTz41Er4qM7smYc+ZTavmfBUP
         Y7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477657; x=1792082457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ol9KVV9igaZHeICPjqaqiMrJ1pRvQcCPa+Vpo3abd3M=;
        b=zJsvz0TczAbp1QlqkDVSkbU4yZx1P+VgwFG672r1qoqB3MbkNtqoz0qD5kOtMrf21M
         kOXZFxOl6+IGzYdWVjz0fzka6IiYTk0mi3ZSKaobSBEDU2hBgk74xy4DCcw+sQWmYi9I
         nm34v0ScVbhudbgB+N8Rgo75jJA5FuF7A4ncknKSPSeG1WN85tXSRzFjW9ho+fACh0hJ
         41KyMRo+PVUGvd19840pghznojYf4fjh8FT5t3F+da5BRWlqhhjzIxcal8X6qTYYcYFK
         7gUI6rBslXUjVvtOZlsQTmMdlHkcg8PqNrop5u36Vfmx9Kji/7OMQi6UhXDm6cTpwd4v
         dIPA==
X-Forwarded-Encrypted: i=1; AKwUvBzaUCo9oHZWcruC9DVmtPT7orPOXHbAQR1VGjbAG9ttddCJ8DUt0eLOmW5PVEuTUynCTk3ujAZHpGOziTc=@vger.kernel.org
X-Gm-Message-State: AFuF++mM10wqHm5fmDTZ9/awp8x7x7Vz5/8PXk81DBBvPr04ri5cWEl3
	E5AuEoIyBTqs44r0yBxywGVMA8e0FKV4r4mJuwyRE/5jrppFPp3BcCmj
X-Gm-Gg: AYBFou2BG6YLsphw6ku96vbGJj4KNr2GRqhfWqPSlfzy+0b6OvWRrLI2zSiDp15Ik3E
	ex0RQoDEA1fTFWxdULjLUnOiis2c6jwpohRbPfxfIACqksbPimgMh6SZzGOayqELL8aVNkiLPz6
	25OF1Ja6KgP44ODTuZA8/svWaUPzxB1zEqOb7Pe2pIo1ox0pReUo/W1/JKOcJiexfnkyo8n2vHv
	HvWl/779uqh6FP1Rx/waknn2VZCOSm5UgdPTS5gDrAKPC1Sriu/wTVA0cj9wcERPZH/dtkLb4qE
	SO+lMG9PYzdkUXx4PJfv83fU78NMFSC5nwgUR0pVneKlVRPl1XuIwK2NNtEmSgNvylUrQxdGJ3C
	VtBkVofVzM1R/XnPFoILgGwca0VobWp0GrmRabPmLogjz2p/mIvREyglBF+cxe9vfdtInWwSmul
	AYqjcj/G3sPWAuKLp7rtQdA4tRh3Dv+xOgnEri7hlEb60Rjl2JxxhfhJPHPxkXUS1xIBK4jejzX
	q7zXtctuAKJ
X-Received: by 2002:a05:6820:1909:b0:6d7:69c6:5292 with SMTP id 006d021491bc7-6e7a87a417emr4835468eaf.45.1791477657232;
        Thu, 08 Oct 2026 09:40:57 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:56 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] modpost: fix pointer arithmetic on NULL in parse_source_files()
Date: Thu,  8 Oct 2026 11:40:33 -0500
Message-Id: <20261008164035.3668885-7-lzsx618@gmail.com>
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

parse_source_files() checks whether a dependency is in the same directory
as the object file with

  (strstr(line, dir) + strlen(dir) - 1) == strrchr(line, '/')

When the dependency is not below dir, strstr() returns NULL and the
pointer arithmetic on NULL is undefined behaviour. This happens for
every module with dependencies outside its own directory, and UBSan
reports:

  scripts/mod/sumversion.c: runtime error: applying non-zero offset
  to null pointer

Check the result of strstr() before using it.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5 UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-8-lzsx618@gmail.com

 scripts/mod/sumversion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 3dd28b4d00..4c59e7cfbc 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -364,7 +364,8 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 		}
 
 		/* Check if this file is in same dir as objfile */
-		if ((strstr(line, dir)+strlen(dir)-1) == strrchr(line, '/')) {
+		p = strstr(line, dir);
+		if (p && p + dirlen - 1 == strrchr(line, '/')) {
 			if (!parse_file(line, md)) {
 				warn("could not open %s: %s\n",
 				     line, strerror(errno));
-- 
2.34.1

