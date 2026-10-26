Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013684;
	b=gk5bs9TqkIihD/KZD5B5vPv5gPljKmL+E1bRvz3TJZlr0OMQJfbTrr6fzOcpDRzPl/Wq
	 RFKHSXeLkYS64kOJ22IP6m/bEJhD6YPp5YC10n+BZB+DamJZExvTFzUUfF82RPoXqsrXN
	 4jwgBU44D4Igo3ZCg5n9pMOZEoTIEhFmK9luIPi6OcDYWiPYYl9NqXXxr6ziL+VTN4ZX0
	 ikKUEMv6JMG/q8lbX4C6io9LqwHZq9mFyW9nraNTQsozQ6Tu5rJ4q4GJlsWz8dMBm8uK8
	 MEm/eq0a1SoSFuxR+kMtSjooT5fMozhsXBMwb3BOBU0rIquikzEPqUaSbFvNKsDzZ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=YaPrNf7Cus6idRIRbovGwqOwkJFSxRQnPSz6SCMl2RU=;
	b=so8iB6HkAYWWM5ljVQveUNEKUfZ057d8nTdbMD0HnCaoYRPYIQlKdKQarAPl5vT+pPmM
	 PpYHatdxGfn0qCeSA59LIJ/XuLAafQGvLm2PZ7c12RAzD/jJadPNzl5xlqpDcDTfdPl0S
	 lIwYto3nH7qFCjxfq0ERZmF+hqvihRZCTMuSg1/Une8PG8gnpjCoggyv2OyrzroXFVa3j
	 rs3gQ2+NMs0PTyN946rDg/Z/4mp2CjPqJxmW3Rm/ppvf3P1lTygRh5d/jPa5jLi4N5l6O
	 Rdmfv1gEQRB1aWmJesp+qpaLUFxlqDBg/Cerynp1BUxMQWKRXWLYKJUXIUZ2KGCvTlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W5Ef6rX8;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0073606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0073606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W5Ef6rX8
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3564so506464a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013683; x=1793618483; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YaPrNf7Cus6idRIRbovGwqOwkJFSxRQnPSz6SCMl2RU=;
        b=W5Ef6rX8PruyPsFWXwK3d70zR8dmTZT1VVdP2UmoPlih3dyMJ9xT0XyjEzgpuUDTj7
         CHr2flhEVLbB5z/S8xxFDdDzHl5zV/XFnDi7RRultjDmJWMYdPNf+lk6JnF06WSwjOpi
         xMGO5YhzWtxdFSXRva+BsY9xBVrxMj6lin6OM+PvX/ZlJQ/m31Sw2+Jx24xWATZQVzl5
         ZuKCuipbctIJ50g/CKsnNeKxy4Y4E/1+FBBGZlPOy4v4VKyC6KgE6sZPrCEXKLQU9y5U
         4T9UaTjXQ2Wj4CZPrtFo6KtaFhPB3f+oM44kleHiFTsTaCdseinYhm8RxD6rmjImfWle
         Z1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013683; x=1793618483;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YaPrNf7Cus6idRIRbovGwqOwkJFSxRQnPSz6SCMl2RU=;
        b=R0NTdfgz4XodMOueXm7WvYFbSQJEKhxggTYEvAL6/QAhJeNBPCW1Yop1vVeZ4dMejw
         kFMPxVeDEH3/+Xi4LT2B74VgBY5UlO2/2ExU4gPZLTUCGEPCkxyrrI4sfvft2veuLBg1
         0c0tif8aWRMowUDyNj1aCNlmjyw64i92hq055WmMxosS7l3ZTy4AhRimvFUAHTa+nIfK
         g1Dt6vmqMSMpFwQQKGBJ0Io0cCkCm4JNeiRoxKUD27HbDSPupaWR59/uxreFW7Tkn0+2
         P66Zhhyo58V178xkjCOY399na2sjp9+H5y++wP3C84q6vh6W+4E3jzz87UTD8HowDg/H
         H6Yg==
X-Forwarded-Encrypted: i=1; AKwUvBxU83GLcMAAghR+5+Q+03KGPqTgTtuTNQClFAgkS0ZW4VDkTd/AzV5qGHq6JXDmfkvGtGVnWz996GXw3wM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC6W2/JvLZikOVXh3Gpxk2xJOiJ1TPFzcNM33JyZxq687m5Vj8
	sj1gb7Z/NDfMXcmIwWOnz2DAM8AbX8V6apkIGQH1mw8RUfUCoQm0eknU
X-Gm-Gg: AYBFou3ykR+Ywf494JjJRbF0ok90HO83VuND/znyPG07jcBOnPxIWMkn/v6Qmtbky6v
	QvCWyXHiYKrx2XMMoHCC6gzPE1n4LVYAVBYHbxPLFGzNfHqTRr7QGIupmEjz+Heiv9Ajx7SOobu
	n9RdQj7aYHBdp/fBAowoCiBPvCid1fR994JYqNna6AgWFDI668bypB8v1rQW9xeZoahBiUHa0Cj
	QYfAEGtHZeLQthxo5dTvbODNhoClrJ9MtfsGb/yoXako2s0AjBWfzLv/n0W8kNQEr3wi7JorURd
	dLM8yaHG1e+/T2UMjGt1f8tznUSqTl+sqx6IwKVpJuOz5fBXLx+TcARchmkFRNYAzqqghUyHyBl
	l2mcLoRRuol7wnJyRZ4fUHiR8J2IAR481VrWqqQEWxutekJv3nU/70Q/Q8Z7BeiSZ0qg8QfjYcw
	CR7JO6h0l2QUKjZMfobw4Nb674BfM93d5E54hy2XykOj1z/C6FNI2wVNJMZ+/ejTgVMWUWXWL4u
	DL7I1mLe3xKVDkaoJiz5udkROwsekpxRMFv1FpaQaeqagbOrszzY4Ig0/1QabZMjGvwj8opO9fv
	LJorH6l2h49yuiS+1nhl/IHuuzDhfxG4o2G7j41fBX+AOVLcUGwFEg==
X-Received: by 2002:a17:90b:564d:b0:3ac:7f4c:a690 with SMTP id 98e67ed59e1d1-3adeafb0449mr4836978a91.35.1793013682850;
        Mon, 26 Oct 2026 04:21:22 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af24sm7907912a91.6.2026.10.26.04.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:21:22 -0700 (PDT)
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
Subject: [PATCH 4/8] Docs/admin-guide/mm/damon/lru_sort: fix remaining grammar
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
Date: Mon, 26 Oct 2026 22:14:36 +1100
Message-ID: <179301327249.2.16817896016779044743.damon-docs-grammar-4@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

Manuel's recent grammar fix for this file, now in damon/next, covered a
good part of it.  This should take care of the few mistakes that are
left, like "should automatically activated" and "Make DAMON_LRU_SORT
reads".  Rewrap where the lines got too long.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 .../admin-guide/mm/damon/lru_sort.rst         | 45 ++++++++++---------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index aa4cc90ca57c..c628e3f6e587 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -35,7 +35,7 @@ deprioritizing cold pages on their LRU-lists.  To avoid it consuming too much
 CPU for the prioritizations, a CPU time usage limit can be configured.  Under
 the limit, it prioritizes and deprioritizes more hot and cold pages first,
 respectively.  System administrators can also configure under what situation
-this scheme should automatically activated and deactivated with three memory
+this scheme should be automatically activated and deactivated with three memory
 pressure watermarks.
 
 Its default parameters for hotness/coldness thresholds and CPU quota limit are
@@ -55,7 +55,7 @@ DAMON_LRU_SORT utilizes module parameters.  That is, you can put
 ``damon_lru_sort.<parameter>=<value>`` on the kernel boot command line or write
 proper values to ``/sys/module/damon_lru_sort/parameters/<parameter>`` files.
 
-Below are the description of each parameter.
+Below is the description of each parameter.
 
 enabled
 -------
@@ -70,12 +70,12 @@ condition.  Refer to below descriptions of the watermarks parameter for this.
 commit_inputs
 -------------
 
-Make DAMON_LRU_SORT reads the input parameters again, except ``enabled``.
+Make DAMON_LRU_SORT read the input parameters again, except ``enabled``.
 
-Input parameters that updated while DAMON_LRU_SORT is running are not applied
-by default.  Once this parameter is set to ``Y``, DAMON_LRU_SORT reads values
-of parameters except ``enabled`` again.  Once the re-reading is done, this
-parameter is set to ``N``.  If invalid parameters are found while the
+Input parameters that are updated while DAMON_LRU_SORT is running are not
+applied by default.  Once this parameter is set to ``Y``, DAMON_LRU_SORT reads
+values of parameters except ``enabled`` again.  Once the re-reading is done,
+this parameter is set to ``N``.  If invalid parameters are found while the
 re-reading, DAMON_LRU_SORT will be disabled.
 
 Once ``Y`` is written to this parameter, the user must not write to any
@@ -87,10 +87,11 @@ active_mem_bp
 
 Desired active to (in)active memory ratio in bp (1/10,000).
 
-While keeping the caps that set by other quotas, DAMON_LRU_SORT automatically
-increases and decreases the effective level of the quota aiming the LRU
-(de)prioritizations of the hot and cold memory resulting in this active to
-(in)active memory ratio.  Value zero means disabling this auto-tuning feature.
+While keeping the caps that are set by other quotas, DAMON_LRU_SORT
+automatically increases and decreases the effective level of the quota aiming
+the LRU (de)prioritizations of the hot and cold memory resulting in this active
+to (in)active memory ratio.  Value zero means disabling this auto-tuning
+feature.
 
 Disabled by default.
 
@@ -112,8 +113,8 @@ Filter (non-)young pages accordingly for LRU (de)prioritizations.
 
 If this is set, check page level access (youngness) once again before each
 LRU (de)prioritization operation.  LRU prioritization operation is skipped
-if the page has not accessed since the last check (not young).  LRU
-deprioritization operation is skipped if the page has accessed since the
+if the page has not been accessed since the last check (not young).  LRU
+deprioritization operation is skipped if the page has been accessed since the
 last check (young).  The feature is enabled or disabled if this parameter is
 set to ``Y`` or ``N``, respectively.
 
@@ -125,7 +126,7 @@ hot_thres_access_freq
 Access frequency threshold for hot memory regions identification in permil.
 
 If a memory region is accessed in frequency of this or higher, DAMON_LRU_SORT
-identifies the region as hot, and mark it as accessed on the LRU list, so that
+identifies the region as hot, and marks it as accessed on the LRU list, so that
 it could not be reclaimed under memory pressure.  50% by default.
 
 cold_min_age
@@ -134,7 +135,7 @@ cold_min_age
 Time threshold for cold memory regions identification in microseconds.
 
 If a memory region is not accessed for this or longer time, DAMON_LRU_SORT
-identifies the region as cold, and mark it as unaccessed on the LRU list, so
+identifies the region as cold, and marks it as unaccessed on the LRU list, so
 that it could be reclaimed first under memory pressure.  120 seconds by
 default.
 
@@ -237,7 +238,7 @@ The maximum number of monitoring regions of DAMON for the cold memory
 monitoring.  This can be used to set the upper-bound of the monitoring overhead.
 However, setting this too low could result in bad monitoring quality.  Please
 refer to the DAMON documentation (:doc:`usage`) for more detail.  1000 by
-defaults.
+default.
 
 monitor_region_start
 --------------------
@@ -310,7 +311,7 @@ Total bytes of hot memory regions that were successfully LRU-sorted.
 nr_hot_quota_exceeds
 --------------------
 
-Number of times that the time quota limit for hot regions have exceeded.
+Number of times that the time quota limit for hot regions has been exceeded.
 
 nr_lru_sort_tried_cold_regions
 ------------------------------
@@ -325,24 +326,24 @@ Total bytes of cold memory regions that tried to be LRU-sorted.
 nr_lru_sorted_cold_regions
 --------------------------
 
-Number of cold memory regions that successfully be LRU-sorted.
+Number of cold memory regions that were successfully LRU-sorted.
 
 bytes_lru_sorted_cold_regions
 -----------------------------
 
-Total bytes of cold memory regions that successfully be LRU-sorted.
+Total bytes of cold memory regions that were successfully LRU-sorted.
 
 nr_cold_quota_exceeds
 ---------------------
 
-Number of times that the time quota limit for cold regions have exceeded.
+Number of times that the time quota limit for cold regions has been exceeded.
 
 Example
 =======
 
-Below runtime example commands make DAMON_LRU_SORT to find memory regions
+Below runtime example commands make DAMON_LRU_SORT find memory regions
 having >=50% access frequency and LRU-prioritize while LRU-deprioritizing
-memory regions that not accessed for 120 seconds.  The prioritization and
+memory regions that are not accessed for 120 seconds.  The prioritization and
 deprioritization is limited to be done using only up to 1% CPU time to avoid
 DAMON_LRU_SORT consuming too much CPU time for the (de)prioritization.  It also
 asks DAMON_LRU_SORT to do nothing if the system's free memory rate is more than
