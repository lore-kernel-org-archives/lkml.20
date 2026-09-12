Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D031388868
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789200644; cv=none; b=uxs867cYjv4yjTEW8t90D+VdEPzNDHVeYOBaRW/zlYL90agrbJN6gDGbFxUvQgpwPEjLV4So2DmfT/kIQXWVV/RtI0puh0Jgxp0rSP96jm8u1XF/4YUdnZC8Ff6WRxrJV38jIj9yaesN7of9Wf/xiLtbQ24rf8behvgf+/+lpcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789200644; c=relaxed/simple;
	bh=jipvs13dUFb5yrSXQVJH72ueZtpWAQhemw94A0aFTrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQMPs7LmTBMrY5/kPaL+aQRYQKrpUG2Xx7rPnminuSdTLElLG0rhly3f5vwkbbAUSjDhrofs2AkpHxhok9vM2Lo9c/+ugRsAZngTAAItoaxeldwLpTHEYrep6S4E92zsh2OYpyXiHdwfCFlBYO8yo9ZO83Eiw1OYKv34Xo16MZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z09bmaOE; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z09bmaOE"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso323545a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789200642; x=1789805442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSYO98oHKaatdSJA86Zv/zyqDt8H9puU2z+h8TsbVQM=;
        b=Z09bmaOEj18jfB5ioDehIVHBdDd6FRqLjUl6PQ87b0zOp9gfDlDO3UF1ibkErXfk50
         cWqdK7meIPHPK6GRAcOiSMOb2JCKu84Xfc9jXTKDBtuOaLdeC6Z+ZFRDjVmXkkrQ8qPw
         cbvFr50RYs4wapSx8Xbr/ZHW086pHAi/qRw2yNQed4eCMG70zcAGTHoxU1Llz84QhJKK
         GyQbtcpw0Vt5U+6/5EK4Q5SOHgSNuuzW82AHzsIeYl0NGcMBkPbNWxSpI/2/T6QWOmBD
         cJZpu44YKq0lnG+gY464w9nGoZP3h38Hs9YiMOtz88Uq08r0bexyuEX6mlnOk7ZtjBBw
         5D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789200642; x=1789805442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eSYO98oHKaatdSJA86Zv/zyqDt8H9puU2z+h8TsbVQM=;
        b=ZYxpcfUvYt7y8n3oWpuK5xG9LZphZfBwVDfj7Yf2vxPRyqMn77vieih29dB9Wm7Aju
         J0UrKi3aiVZr0OThOOzYd8lC8+GKRi5Qps+8S3K92B4mSVvoaKJi+WNgx7l5245djyK/
         4LxCHiGjBFTgPO9dw3Dlnc9vSnZEkxKn/5bmJhTgTcTTJnpiSTQ4/rdbiAn8WooNH06e
         VyHS/+6Y4Yc9c4dMV3nlFDWSkWoHKne5Fg+vPX8kwSMRqbU+GBZhdlG1m8Lv4A2k31fa
         YvxylEmJ8dSLH6jSOvuLi1W0YV+/Dw4N522s2h74e4wnhM1RSEljTm81zUbRFzU+Yf5q
         vHzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4mzv3C1bSug5jz+dTj0rTsT1lfE0ovBZqh4yVVMkxG4+w3Kb/1SFag+jZr0tm+rPEqJuTkJqPCAJ0ebU=@vger.kernel.org
X-Gm-Message-State: AFuF++mUjcdEA+sYMTnORwB3yM0sgKxYCL/nxqCgAm4aejVaDxNUVdFr
	sory9MQT7b+uCYwvcrjgwehrReZoQVLtCq8vOHNtGahLnHmKl6X8jocA
X-Gm-Gg: AYBFou0RtboEUEXpxK9vEvFbIFhuGgqJflZAW72T9pCVXyorb7Fk1OFJhgZ8rqUP0yE
	6v0mjh016St+SLiScP5VkX61RI3PQoe+wnCOCFY8PhELJ0Yku2i9CxyGFi47J3KOh51CTCpLfgE
	l0dvQJs2JQQ+gKkX8KPE0TObIrXpOd4746YohmfhbLiBRccBXssnRayb3s3EQvaqKOSasDBmPRY
	r3RpEhf5T+E9gJMcIkyda0e3MusdTX2poyCmitQZmkC1pA/kmRtnDS0ZLVVE2kuqJ0fbq5aLaOx
	6xyWWyZmmrDQob08Aka4swgWqYOB/KOcTEo9V7IthXYuppvZWKjwcRVqc7Z8KJcfJy2syYkMxvt
	DEANk/xlPBPNRPZDS8qCoAsTsvKkE3FNkWX+V3UJepHBWFdLLwX0mlks/3yiTB7Izr3sifDof9h
	mdMz2g5ej28oNr+sR+XLGrzdcX6WiZi7+KjdAFQVkYlcLkhq/yCnUZrC1TOi77oAQYFimbKMBFm
	kFt8dVB9qgUty7O3csuc/dxVcv/8XcX7yzD/sezqhDZ2BpfS7MrXFU8wpkKk1e3MLr+Mb5rfiAk
	cF77QQ5zWBSAIEF6PnLSJgp/1d9BM59rDfohca5biYW9
X-Received: by 2002:a17:90b:28cd:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39d9b983602mr13970959a91.0.1789200642156;
        Sat, 12 Sep 2026 01:10:42 -0700 (PDT)
Received: from 0xiviel.ip (122-63-135-80.mobile.spark.co.nz. [122.63.135.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db7ae6d25sm982474a91.1.2026.09.12.01.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 01:10:41 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Eva Crystal <0xiviel@gmail.com>
Subject: [PATCH 2/4] accel/amdxdna: bound the command error payload length
Date: Sat, 12 Sep 2026 20:10:10 +1200
Message-ID: <20260912081012.2274075-3-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912081012.2274075-1-0xiviel@gmail.com>
References: <20260912081012.2274075-1-0xiviel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amdxdna_cmd_set_error() computes the length of the region it scribbles
over from the BO size, without a floor:

	memset(cmd->data, 0xff, abo->mem.size - sizeof(*cmd));
	if (err_data)
		memcpy(cmd->data, err_data, min(size, abo->mem.size - sizeof(*cmd)));

abo->mem.size is a size_t and sizeof(struct amdxdna_cmd) is 4 - the
struct is a u32 header followed by a flexible array. A BO smaller than
four bytes therefore turns both lengths into a value near SIZE_MAX, and
the min() in the memcpy offers no protection because the underflowed
value is the larger operand.

No such BO can reach this function today. Command BOs are created by
drm_gem_shmem_create(), which PAGE_ALIGN()s the size, so mem.size is
either 0 or at least PAGE_SIZE. Zero is reachable - PAGE_ALIGN() wraps
for sizes above ULLONG_MAX - PAGE_SIZE + 1, and nothing rejects it on
the share-BO path - but a zero-sized BO cannot be vmap()ed, because
vmap() refuses a zero-page mapping, so amdxdna_gem_vmap() returns NULL
and the !cmd test above rejects the BO before the subtraction. This is
not a fix for a reachable bug.

That leaves an unguarded size_t subtraction feeding a memset() length,
whose safety depends on a property of a different allocator and on
vmap()'s behaviour for a zero-page request. Compute the length once,
reject a BO too small to hold the header, and use the result for both
the memset() and the memcpy() bound.

Signed-off-by: Eva Crystal <0xiviel@gmail.com>
---
 drivers/accel/amdxdna/amdxdna_ctx.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 163b5fc..c24bf1c 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -152,6 +152,7 @@ int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
 	struct amdxdna_client *client = job->hwctx->client;
 	struct amdxdna_cmd *cmd = amdxdna_gem_vmap(abo);
 	struct amdxdna_cmd_chain *cc = NULL;
+	size_t data_size;
 
 	if (!cmd)
 		return -ENOMEM;
@@ -173,9 +174,16 @@ int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
 			return -ENOMEM;
 	}
 
-	memset(cmd->data, 0xff, abo->mem.size - sizeof(*cmd));
+	if (abo->mem.size < sizeof(*cmd)) {
+		if (cc)
+			amdxdna_gem_put_obj(abo);
+		return -EINVAL;
+	}
+	data_size = abo->mem.size - sizeof(*cmd);
+
+	memset(cmd->data, 0xff, data_size);
 	if (err_data)
-		memcpy(cmd->data, err_data, min(size, abo->mem.size - sizeof(*cmd)));
+		memcpy(cmd->data, err_data, min(size, data_size));
 
 	if (cc)
 		amdxdna_gem_put_obj(abo);
-- 
2.53.0

