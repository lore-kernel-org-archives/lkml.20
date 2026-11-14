Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667761;
	b=xuBk6NnWZCuSJ16xScGNBk/k+HD1zBN1wLXii4DCrfAz1F57WEf8GzlPIJy5f4WobnLh
	 Tka5NajRbW0RTjuhgmgGf0m9W9ClJKrW8Ismx69bKKuhn+jgwV6n62EDVXrTZLOc7ix1z
	 lqBm2Qsic2e33FMsXlTmF5WlDLu35tvHfrylkCC74TzDCTtiaOuBXg3BeFO3Gx10m5/ee
	 FCRQFXRRRWECrz1kCL/jjRyG0binHdnPkqGR1J+WRdfI+aIlYFqQMdOMD4jggR0VQbC/C
	 qyYIuEOKTNwYJWyxg05GsIIowaM3lcN6WH8iNqWucoLxCZjju9+nFvfPS3nHqOqKdjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y2/DBpmjNNHeB2wLGkpV5YarrevGow3+qZX583Pk5bw=;
	b=fa+tcbMbTAMu6jLV/Svl/y1gqTX+BCb1j2xHesx9qJHifGj/y6lsIg15ggycG0oxoAKV
	 VvdMQ7W87CEZ5rAMnlckedrZBBlAVoiImCkfXFw/sfinYGnUr+AKmZXgKa+PZlTAhP+/F
	 EU1ieE+o/JJ5Fixcy4wMr9iE6lz7f8ddmgPRt3hZSeqartfapeoR01GKPkh5lx2J1IGG8
	 ZVuJDqpZjBMn65oy5H7epsCry9EntPmQpJN4paZ9MNeDmub96+iBoScjVMXRKG6VZUj4s
	 Xz++CDnczJLp+ruwgzG3Rgnwk7yAe5FIZRfoLjXFhPHnV8+plcsO/AyvEEEuGBSl7Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ci09glpN;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF4606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5DF4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ci09glpN
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso725985a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667760; x=1795272560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2/DBpmjNNHeB2wLGkpV5YarrevGow3+qZX583Pk5bw=;
        b=ci09glpNs+mOtQ5xGsxwki4XErIpYQvmS7EJKkpHeu+qoe1i19BO8vfkAg243dpEKc
         QiYaQJzLwXjv0mmSX2Gty5f31fLFhcwiNApstIYcMeSTxv9eigaW+vtfnRxz+d6UDb3l
         8lo7Yp+ZSxWvL+lBoY/a1oc/UCTi56d+v1AfikVHPFTZehKtRI15wNIIW/Z0BE3lf1E/
         TTVjgAiHN6aK9bXmbN7szCnP8lZMmaLi+1kVIJNbyUyiLMiM8vlfE/zSPs1ekhfVkJih
         AlnfXQZ1pV/y5ujHlFTUURfZMc8kP6PfBAX+XMfQtZ7Gb8gOSUR2ZPcmYT2cKAWmUNN+
         EhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667760; x=1795272560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y2/DBpmjNNHeB2wLGkpV5YarrevGow3+qZX583Pk5bw=;
        b=FzZBCwNXKCTKgsxAZkXENLEjKk1mBnt2N8ZdK7xHOc6n3mNJXF0HfT4Wx3JENxONr+
         Le0vQcoAZkv+D0fCaXlwTfVUHQPEubo9rEq8bkawtZXt7Xhbk6y8CnLEvEGzBMhJkMNN
         NRNoUwP926L+qV7xxQm1Qx8plkvSSmWzdDHMMH7mZhr8JCxEhb2F/mmtNLhozi+Aldvz
         J1oHPveSF/kNoEV7FBgWRZQvHDe6ocWtswqoz9PzblG6IoMDVMpFIY/GzqJUuOO/eL1c
         9n7vODqndWamuGwW/HZlFScmryDCmUHJxHCCpN7v4jmIwpPbV+igAhdVqu/rssxH473v
         s09w==
X-Gm-Message-State: APuU4Z8tQW+SZA+DVacNWRgEtOF9U0mCx+L0wK57LGVQS0LZCSheuXfX
	x2TiN7MStLGqa2Axi+ZSs/Ewy1IvD+ts7VyhHWhzJDo0OKu++4QURTLN
X-Gm-Gg: AYBFou2tuCRMtWQZuAF7Ssgm4cirZRWSp+m7AZoMV+LHd3GwZdvnnoHUvmENC5FAJAv
	MkTsNUABWnwu42JFBJo4Ndlsrm79dLXJkBAXxW8HiClZu1MZdazV/gCApfoKEQSlu1WeutV+Z4k
	W2m1T3L8VOhB0t50pqA5vzKTvlx881cmJPQ42DOi9bSf2sqUk2UXePB8FKOl7Ex9JSPdVKtDO2e
	U2CGfEgyHFiiHHn+AH9oUXW53AXQzXLjz4w8wE7QhxJkwE05TMu+AnSr2NbzgROv7ARm8e+3v1N
	dWyl/Kpj+kIPJiT7bBJBJqNJkoKomLyyLkJK38bO3EBNEWeMS5mva8bCuBG8Mt2oUh20ltjokYh
	3TZUH42QiwlVgzmRdNBwFv4z/338jOR3xd09QcVUVJIRnn7SiJ/7LHldwulQzFkpMPJd80tQDQr
	0PYBcA2+UvQ4diA6LblRNqnnqDp2OCjO2+um9xLFYl8Bu2tO7ec3ADX1wRVsiY8C6nNh3gafib1
	hO0E/HxC579E48IlDK/8JJag00EqCZavbZkbVIgtBep56X+dv8EhT1CfxiKWPEomk54W0SExnLh
	1NSq+UrmQKPY7CgHXIeL2/u6yWGN8ufjvlNp+lXhHQzjQczqgeyp9fG6OCSk1fTLFM5XiLPfwGt
	F/lnpxtFdlP4M/A==
X-Received: by 2002:a17:90a:c88b:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b1b0ba890emr5889521a91.59.1794667760115;
        Sat, 14 Nov 2026 06:49:20 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm14353082a91.10.2026.11.14.06.49.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:49:19 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 02/18] mm/swap: clean up hibernation error handling
Date: Sat, 14 Nov 2026 22:49:09 +0800
Message-ID: <2951eed4feabbf1a72dbcaedfc011782d9885604.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

Restructure the error paths in pin_hibernation_swap_type() using a
goto out pattern to avoid repeated spin_unlock() calls and simplify
the return flow.  Also simplify unpin_hibernation_swap_type() by
making the si NULL check inline, and clean up find_first_swap() to
avoid an early return inside the loop.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c41c4d26a7e6..c69a924acb74 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2331,21 +2331,18 @@ static int __find_hibernation_swap_type(dev_t device, sector_t offset)
  */
 int pin_hibernation_swap_type(dev_t device, sector_t offset)
 {
-	int type;
+	int ret;
 	struct swap_info_struct *si;
 
 	spin_lock(&swap_lock);
+	ret = __find_hibernation_swap_type(device, offset);
+	if (ret < 0)
+		goto out;
 
-	type = __find_hibernation_swap_type(device, offset);
-	if (type < 0) {
-		spin_unlock(&swap_lock);
-		return type;
-	}
-
-	si = swap_type_to_info(type);
+	si = swap_type_to_info(ret);
 	if (WARN_ON_ONCE(!si)) {
-		spin_unlock(&swap_lock);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out;
 	}
 
 	/*
@@ -2354,14 +2351,15 @@ int pin_hibernation_swap_type(dev_t device, sector_t offset)
 	 * the same session.
 	 */
 	if (WARN_ON_ONCE(si->flags & SWP_HIBERNATION)) {
-		spin_unlock(&swap_lock);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto out;
 	}
 
 	si->flags |= SWP_HIBERNATION;
 
+out:
 	spin_unlock(&swap_lock);
-	return type;
+	return ret;
 }
 
 /**
@@ -2441,11 +2439,8 @@ void unpin_hibernation_swap_type(int type)
 
 	spin_lock(&swap_lock);
 	si = swap_type_to_info(type);
-	if (!si) {
-		spin_unlock(&swap_lock);
-		return;
-	}
-	si->flags &= ~SWP_HIBERNATION;
+	if (si)
+		si->flags &= ~SWP_HIBERNATION;
 	spin_unlock(&swap_lock);
 }
 
@@ -2480,7 +2475,7 @@ int find_hibernation_swap_type(dev_t device, sector_t offset)
 
 int find_first_swap(dev_t *device)
 {
-	int type;
+	int type, ret = -ENODEV;
 
 	spin_lock(&swap_lock);
 	for (type = 0; type < nr_swapfiles; type++) {
@@ -2489,11 +2484,11 @@ int find_first_swap(dev_t *device)
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
 		*device = sis->bdev->bd_dev;
-		spin_unlock(&swap_lock);
-		return type;
+		ret = type;
+		break;
 	}
 	spin_unlock(&swap_lock);
-	return -ENODEV;
+	return ret;
 }
 
 /*
