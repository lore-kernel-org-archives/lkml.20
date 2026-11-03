Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793666624;
	b=1QAGwqgnLxwO4hQHN3mTXmSOkuJzQhrJm58625HXLQhfUoq4vpuCaMOXIPHn/dvjQrya
	 iijC5gwKLfzNeROK4Z554zBKuFOEmwjWjOgoS4LQaqQlQ8sfs0kce85P1Zq7DRmsY/8kE
	 IdoGea3pJzC7Lr4TaL51WhamPTRPImRcV9TVQaJW9QpPW7MRanJaru/LPy2O8PZbfYU8k
	 TWCQZE1lgcG+U91mG1o+pw82T28/aieBwbNP64MxHZRxAB/xCSaSIqS8tYuIKcm+aUBgp
	 bv2o2Ss2DVRyo60KQXiVXQXE8ioxMsrJnGxggAsuA0NMN+UrO5vIe2LkQiiaLU0Cc5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=7z1HE/KjWOtf8sdZhPk5sTCBtLjDDSjEVH4zmusVOl0=;
	b=NZsXg2G/ld09Ze80yUuO0NeGzyQusJCFrRRrNAxRsKlnYYI6M8qk3YhyO2hWuDke1zk2
	 k5Ocxh0fCNCDEi9S6AtFLrsUBJTWMa5z5oGdxPJQs6O6Fc+YT6yi7w76orb7MlT6xUJvX
	 T43eo3fUzoFdgz2VCeDHWmZg4w3TswxkUVpHm+uNvYZOvhCpReGmlxmuMA0aQpLpbtsbq
	 iHSrLip2j291P5fF/WcymJ9Dd4oDsrH3FAHsObtWwiIq3x/hVUrPaR9Epyv6EuNFtLG6v
	 tPuc4lGffIIr210xAWK37WvOFHWp1zz1f65XbttNYAgLs6FBsk7DtA+5m5Ddpn6JBYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjC1TcGN;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947BC606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 947BC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjC1TcGN
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535a54bed9so5415969eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793666623; x=1794271423; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7z1HE/KjWOtf8sdZhPk5sTCBtLjDDSjEVH4zmusVOl0=;
        b=GjC1TcGNC9WINjV0Y0pUC86ugkq/6GBBmH0xesqh6Csl8qyNo9VnyfnlAp9FrWUrwn
         9ts4gCQ23ErzT6CkzVt9h6TKmSANQZbHs5msDRP3yzJcX97MGPf3IA61FBBpqrL+Xyoj
         fZDjUyEYx/wrGyjmPOEXUlvn8BBOfO0hpe85aNoPi/C+cNdPsYo/e6HUbhWt+GDxCqes
         4q3t1TRmATOewGz+S6RGA89GC1+UyYWSF0JJcK/GPTKotjnazoOBACM1CwO//4suffN9
         EXtQw+McGtnSl/kuagwfXgKQjiNwEpaIg/Q9iwXgUFW5ImO2B8ri5Enw3CyDsQ4TwzpZ
         +rAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793666623; x=1794271423;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7z1HE/KjWOtf8sdZhPk5sTCBtLjDDSjEVH4zmusVOl0=;
        b=EbYlv3l7cy6zJhlNkarTORrTDMU9kDe+cInIEqx5fB6t1tUs/z9l9CiufOOt/VmN1m
         0TS3gYWFJY00jX8i3hN1FkF3GZDc+afzcSgAEGH0XOPJEGwmye+gycDd/n0WcQW9LzTR
         dq8XFrki3ktLBuyQQ9EPYon5GDKkx0U4DEn6VJR8rXBuLyJBPzeW5xQEYgv5Y08xJU9K
         QL4udIy1mElSI5gsOITvuMOsgeW3EF0b2kOlX7+FOoo+ik6QY22yixBSwNzhEv/DSXRY
         Zsje3WPa5QDn89euO38dlEnlgb9/0Kv5l/DBn/9lO8XeN2Zhb5Fvgzc38dfSLBMP14/1
         nU7w==
X-Forwarded-Encrypted: i=1; AKwUvBw2uhabBCVnNUuIh/cDnFGmj1K/nUDjgp7KeG5OzLJ7wEG/S05AePkMRXhtrdPXotCbh4MWPFO5EGaPhTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgzTcXllAVMfPueii+59vZ/70YNP1UcxLxImKhnEOOXkLyEdT9
	94IlhtPSsox9t7BudV7P+n+VIBCCl1g30fTVX+wna0ZRU/iUl0iuGgv8
X-Gm-Gg: AYBFou3wa2X1XGcW/jmpK0XoLs4K2XD8omDPUERv2ZdA6H7/I3YIk+UvPulgsHHkPUQ
	dHzhROdlLhiVSVKR09O7XNqP+MAgPdCBQ+Vn549xY2wTgcbaE0F1mF9c2Y5frIvmU9OSYlvXYC0
	+vjb8fXAmgOaIgcUL89LJXIa8xSdXRMbA4oFobH+1UKOE7A2wiGV51km690RiAtuZbdHkXdLHBJ
	mc1GeWOV6x43HYqsgk3DT6Yf+uqKzvqnIsQeIWzc+DNVBXPTU3+rPxVniqrd5Mg/aBpYBkrhd3K
	mIPcCp10u9jGWLd6qJ8Cr0dCeYbzA83UDqiLI11p8UBLG2cLZOOTeOEP9loI2hE8WKhiA7TMlL9
	5lNdbxOcg1nsrj0PvPkxDfZUslF6N4vUrIuAHcwyR9ei5QTu48oJ52g9o4ekc7gphUj/wIooF4T
	4+l8HuA+DE6sPPxFvB95ebiCXecXDxVLpKdjOaLhPTZXMo3LRKe8Ymc6LD8XgFZLZy9L7sE9P5E
	vAKcimMMNAHMOhaA5G2bisgJNqVhvKGWZj4igNkTBSrsxI/GKMN5gm3wE1s6RrF8Ed/wo3dmBul
	7YuVzbrQa0uJ0ZGqps//f9oP
X-Received: by 2002:a05:7300:fb02:b0:358:5bc0:4f08 with SMTP id 5a478bee46e88-36a425f611cmr15512454eec.37.1793666622592;
        Mon, 02 Nov 2026 16:43:42 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm36846013eec.10.2026.11.02.16.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:43:42 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 19:43:37 -0500
Subject: [PATCH v2] mm/filemap: clear page cache marks once when removing a
 folio
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bug-mm-filemap-init-marks-once-v2-1-985753b11173@gmail.com>
X-B4-Tracking: v=1; b=H4sIADgu6WoC/42NQQ6CMBAAv0L27JoWYgVP/MNwaOsCG2lLWiQaw
 t+tvMDjzGFmg0SRKcGt2CDSyomDz1CeCrCj9gMhPzJDKUolRSXQvAZ0DnueyOkZ2fOCTsdnwuA
 toakrq7RWV6MN5Mgcqef3Mbh3mUdOS4if47fKn/07vUqUqJqmri69VaoR7eA0T2cbHHT7vn8Bw
 qJ4xcwAAAA=
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

xas_store() clears the marks of an entry before it replaces the entry
with NULL.

page_cache_delete() calls xas_init_marks() after xas_store() whether it
stored a shadow entry or NULL, so a folio removed without a shadow, as
POSIX_FADV_DONTNEED and drop_caches do, has its marks cleared twice.
With 4K folios that is about 6% of the time it takes to drop clean page
cache.

Call xas_init_marks() only after storing a shadow entry, whose marks
xas_store() leaves alone. Dropping 8 GiB of 4K folios, median of five
runs, averaged over two boots of each kernel, in a 32 vCPU VM:

                          before    after
  POSIX_FADV_DONTNEED    1517 ms  1423 ms
  drop_caches            1515 ms  1422 ms

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
V1 -> V2:
- Explain the condition in a comment (Jan Kara)
- Add Reviewed-by from Jan
- Rebase on v7.4-rc1

v1: https://lore.kernel.org/r/20261030-bug-mm-filemap-init-marks-once-v1-1-699835fc6690@gmail.com
---
 mm/filemap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index b74bc1e5015c6..c2effedf975a2 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -140,7 +140,9 @@ static void page_cache_delete(struct address_space *mapping,
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 
 	xas_store(&xas, shadow);
-	xas_init_marks(&xas);
+	/* If xas_store() didn't clear marks, do it now */
+	if (shadow)
+		xas_init_marks(&xas);
 
 	folio->mapping = NULL;
 	/* Leave folio->index set: truncation lookup relies upon it */

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261030-bug-mm-filemap-init-marks-once-b83c6aa67bab

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

