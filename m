Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013440;
	b=aymkJimHUNMLXDCpwiMSgp3gbcqzyKKk63dKpoxMfguldOf5J1NOeAkzS37y0JAXX5+K
	 b8uZdla+CHpaUKL9C3GNYHqA8rkeSFDUMfICtxGJJMe56qOG2db7DsdTypyZg/ATcL5c6
	 /0v4usE/KHwz6m5yWN8rFaLlTUzwnod49OBuAAkLfXv54k57zIYeBgf/nDgECjcxYdL1q
	 meQxkxt1qcrP/oKsI31ie3371cf1oL4svzty3bBgly32U4yr1dvyrW+0aqK+4Oq5rG/t4
	 eFS2MpEbLWyVEo6bNucH2zlHXXDWuZgMjeRVeWcdhD/hYbjzzi/FzpFmC45IXNovENA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=fmsyrygG81C38l9zQdlGfkeoPAPtMMphWRdYuBnpfhM=;
	b=NUzwS6Wp9BPkQvH/iMS/FDV2/6xFfpswT9V19yLtRUC4JcHOWzbL96tGxqPLP6wazgJh
	 aSpUPxnCKgfBNIfBCuznpEjdPe5i4qn4nJeCMtYEn4u9iUHBO/NGtkBD7sJgHGi5wDajH
	 6UMi2H1Mc9o7ggtFzfdyJfkvWDMxEEDnF1pgLOTVXCSlSIlYaVbm/E9RAfvB4xNK2c+iA
	 vFN0Kt3y65hCKV/Z6vlfbRzqa19PR9rtUk1k2+qB/UIocS0p6ZTZw9rlP2vNp/UtIp9IL
	 6zPk0KuAADhyivMSBNkxusHqJ1r18MujxlQmooWJAmBBbSQqPl63jDPnnWaFRAWfvgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VzrrUTnc;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35744606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35744606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VzrrUTnc
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ea19bc317dso23372615ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013439; x=1793618239; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fmsyrygG81C38l9zQdlGfkeoPAPtMMphWRdYuBnpfhM=;
        b=VzrrUTncN/o2GRkTl9FF7gc0lN35ukiRUt9yxbGohobiZTuWuvestC/uHneEx53f3q
         phOsGNTPDFkwwzTlUy/W4K3NxeLNQkEYXq84S133i64u6ZXuyK795nqQM+Hn5EBfKMWt
         6N/AH2TsDwCIfKUHtitPYBVrc94WLuJJtvBapqXcFQJVRXD8ih9NMgAtdG4/ixyL0WkR
         HipByeASH8+F1wD8Opszv/9hhAwn/Kpq1EFKRBuaZ//pg4YwL+8o4oB/bttTE5zr4LPQ
         QYMvddCXRAIsK5CNx+GL65U9IfVV0emGQ31yx3eR6FJGCUYzPviEzJgKGOjn/HmXqFbc
         Zzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013439; x=1793618239;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmsyrygG81C38l9zQdlGfkeoPAPtMMphWRdYuBnpfhM=;
        b=y4Lq7hU48rmarj+hXJgh/uYr2x7C5fu6bPJBtY03hbPMwikJhhnOqagIDPvffU/GBZ
         SppWdFszQ9sI/wFDaaleiLIhDwSOPK3OJoYDXlSBleR3CneFc6qX43few95XtsO+r0Uk
         m/3zsyNfCDzlkQ6UWVSTCZeiPJqmR2C8dMIs4qaOwz0LR4WtW9Z1Jp5V+vMcqz2zqlgL
         gpSDM0vSqsBQUoHXPu5wKRkbQaWefYFF4HZVtv8NFnfZn7IXbxTyQj3rQtJ3963TNtN2
         FspiqSEYD4CPJcYqg1b55LehGchE82LbLRPMWeuK71boPvQD4HmGcob8bH+ZKVX3DOX2
         L10A==
X-Forwarded-Encrypted: i=1; AKwUvBw84R/Hjj6nEGEz1xXDcqAkeguiKhzlfTOi1LM7KFZhLbMxQnwR5DMamskXMgiVLWzsRtG6ooV8fRBM5io=@vger.kernel.org
X-Gm-Message-State: AFq9FYJccf5ow8XvDjcDFfxBEK9Vf+ar7fWhrLdtqv5+C3SXL7j4Igmg
	KVFOivxrBjayHpx1OyZVRcl0w1iGwnlwhSY4SO2mS8B1hsnPRhchqRhv
X-Gm-Gg: AYBFou1E2STYzCNgPvWvU748xwO8Qzib62fWGMhJHqhnKFJtz+FlUWzo68K1IU+fJIC
	odzRkcQaMQ0PK75sRLn72PXlYLt3CJC1U5GLCF3HHbDTa3/ECuNnQogA8EWAC0nqv3wGch/XcZG
	RSvA0WNuaJ+nKqaz6qB4pPLXJ3B5kDdtl1iAZ7RaWZSAzLlrE+9lxa9QDzz41rh6l7jSo6HOWkR
	IcsdQUcmT7rLL73e62ZMtOVOZbLJesLhsl28nzZ+o7FUhbeI1SA8sWYG+XVv6O96i74fih+rVsP
	Tzn72d+xVYRo/GFXB5gwQSfogVlKlS4hgNK8aM0vm7GZGzNVEInDbEz8z8cL8KewBcPulof9UZn
	17Ww09aGCoeKlZ0GNWsobIu3N9irriVJfeP0Pkm8xmqpRV4JBo6tV4hJugnLjsjXbkCV66njQmu
	U+YyxOgYqXQtcSY+I15ks+qSUoYpOOA5jOEh8I13YQYc/6lapWXLhtnoDnmPSxdmJB8DEFfPRx7
	yLcLkoDBButij02MIADob+zyP14Uq8yEyXZ82f/ZvSq13j2jaAwO/84dx0Ha9FVM0bBFODZ04p5
	+6mcc/G40RVs6MbsjZdXFqi7OnfSGRwSiFBjuBbQYDYl+MgDMKRbqA==
X-Received: by 2002:a17:903:3905:b0:2e4:aa09:fa9f with SMTP id d9443c01a7336-2ea9c84b404mr55890135ad.57.1793013439353;
        Mon, 26 Oct 2026 04:17:19 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1df35asm14878235ad.60.2026.10.26.04.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:17:18 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] Docs/admin-guide/mm/damon/start: fix grammar
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Mon, 26 Oct 2026 22:14:33 +1100
Message-ID: <179301327249.2.1796164575094900927.damon-docs-grammar-1@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

Fix a few grammar slips in the getting-started guide, like "make DAMON
monitors" and a region "that has not accessed".

"The line of the commands" used to be "The first two lines".  With only
one masim line left, I make it "The first line". 

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/admin-guide/mm/damon/start.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/start.rst b/Documentation/admin-guide/mm/damon/start.rst
index d98b0eb8e771..a83fcc2265bd 100644
--- a/Documentation/admin-guide/mm/damon/start.rst
+++ b/Documentation/admin-guide/mm/damon/start.rst
@@ -63,7 +63,7 @@ the execution. ::
 
 The first command of the above example downloads and builds an artificial
 memory access generator program called ``masim``.  The second command asks DAMO
-to start the program via the given command and make DAMON monitors the newly
+to start the program via the given command and make DAMON monitor the newly
 started process.  The third command retrieves the current snapshot of the
 monitored access pattern of the process from DAMON and shows the pattern in a
 human readable format.
@@ -71,7 +71,7 @@ human readable format.
 The first line of the output shows the relative access temperature (hotness) of
 the regions in a single row heatmap format.  Each column on the heatmap
 represents regions of same size on the monitored virtual address space.  The
-position of the column on the row and the number on the column represents the
+position of the column on the row and the number on the column represent the
 relative location and access temperature of the region.  ``[...]`` means
 unmapped huge regions on the virtual address spaces.  The second line shows
 additional information for better understanding the heatmap.
@@ -95,7 +95,7 @@ monitoring results to a file. ::
     $ ./masim ./configs/zigzag.cfg &
     $ sudo damo record -o damon.data $(pidof masim)
 
-The line of the commands run the artificial memory access
+The first line of the commands runs the artificial memory access
 generator program again.  The generator will repeatedly
 access two 100 MiB sized memory regions one by one.  You can substitute this
 with your real workload.  The last line asks ``damo`` to record the access
@@ -170,8 +170,8 @@ set size has chronologically changed.::
 Data Access Pattern Aware Memory Management
 ===========================================
 
-Below command makes every memory region of size >=4K that has not accessed for
->=60 seconds in your workload to be swapped out. ::
+Below command makes every memory region of size >=4K that has not been accessed
+for >=60 seconds in your workload to be swapped out. ::
 
     $ sudo damo start --damos_access_rate 0 0 --damos_sz_region 4K max \
                       --damos_age 60s max --damos_action pageout \
