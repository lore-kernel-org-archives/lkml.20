Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104441;
	b=J2kjsH1B/FEW7zb6aIT0pLOV1rf5ID+dRhc4b6Hhrd6jlEOoNu0fqyRGNQl07fKjRzPC
	 p0LEsNWhmbBNvWXit72IB/eEAfB35+RwN06mVhWIcy4VjZeXdHL/axO8u5WdyxZqa18Cm
	 Jf+/wyDY0Q+jJKVa1k5ThKFpcvagIRyy38+50bo5iosJUwQHt5KQgRxn/VgFA9Kg6jhze
	 pPh7VWIXXWOd0TLf5w21TtZ9YNK/DHT+ct4NmEG9296GHZvmZ19ZZ4by6a7WEVa1uxhgN
	 mnFhQ/np7f3rX9Hs4bvBumLBPvunS9qZZkqUp40x+hIUvLrh5pEYOi11bYBz5AO2O5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104441;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SrIhumD197mx4pl6yQkiB2jctqSFaHU4JKWvTq2PlBQ=;
	b=UPlqbOYWE7saC5KzuGAsQbESutkyhMTlGJlYoL7X9Cb7bsQSF0e03+al0+lQ5F+Ge+DX
	 /1gp9TIzVOLLJw3GsEcdakPiJ/CrKru2uiD2/Wuwtmo3iw59/UcANaP0jlE3lA6yOmp0C
	 DPgpaDR8eo4VbSWmQDpL9X9nl2m2FffDJHsolJwi0Fuueb1LY/uX9ukVvefGhn0mLhV1J
	 jZTDIQTGS2Fu2TZRMMh90/ZjMDpyJxmftH5fQNZrrj0GXICpuZt+sB1U8LnBmBw8F9c0r
	 Vu+oGVE4Z0HKxPAPuj6IzmwRBwA5L8XVtvXurO6VB8pkEpORdfyJAhyi7TzcepjATWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99825606A33B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99825606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1ae18eb9b69so52238c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794104441; x=1794709241;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrIhumD197mx4pl6yQkiB2jctqSFaHU4JKWvTq2PlBQ=;
        b=oA0qELqClTT3lZFyPTJq50nwei4F8c/iHOYCXcCNPs9qB0M0OGMJmSoxmS3sEKs4dZ
         sYhccYwKqAPZOyRjJEvD9irDMsP2Y8fh2wbJkU9iV6VjgL6SnkXKTuk7BSr5PZhOEeBG
         62wrA6Tto3L4ETMEOmh9GmcePcHaLS2AGO98ASO9WjV8pzTs8MN6Qv9p1fK19LHfbcx2
         yZI3wjFmu+nheJnO/Ee/jAboM5D8aXXOumilfFWkWSsPeJ2FVnE39UPnGwFUTVOtSF7h
         EvzTRbrsmekKgRtpJLFsBuVEu2eRGUwHTtJkG7puDmT3M4rg8Ewz9WmLU2kzj8gDrUvF
         fshA==
X-Forwarded-Encrypted: i=1; AKwUvBz8CyntZwi/IWSXiDTa2p8FdjAgIu5bhO2l0FNlTKpnftkIJPuxwsMEUaVlDoK1W8vQtRDYOIxQmWWOKto=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tQW5hklGoxBqdGDHfRuy2rEXDIvTpCQg7gHPNfVfR1KMbPAII
	srhPzRMoWrzYxFTNnUq37mCziSzVlTOWDU+82T3L27L3pq46spEbm4CAjZWghVfrO4UI
X-Gm-Gg: AYBFou13BMl97/pKrslXVgtoDmHVvD9ByiuwulAzW+UJOnvzoREV7OeBPijhK6Uapzg
	7t4zW4FCS2Hgw53UKbAy34mrbVh3dwRG3bY10vlqKZ9KnMVfglGLFZ1o2jnmqsiSBAtZR5Glo/3
	0cMrbuyNmdnV1RTbDy75gjaZpQsXxtZs/YI9/TcrfHZWCkdMdK4ehNS79QYXiihMpPq6BvIMu5j
	hu3rCYxp4hKW2NvikvA0INXv+jakzOAoPhGh8mr5HpcQ93gus9ZmI4it9qIlPaJDT48UuD0cRdz
	kCBH7kIDllgbM0wEe2N2IbQt1mq2oc4EdwGoDG9GVHBLIC/iztInu4Fsdw90hh9LOPdt3vICuuS
	FJoh3qAd9si6+2MfNFssrRvp47fTrL74WATEsQBGL2+yyNyzUon2tS3oKgEFZgWMO3gUs+FEMe2
	iFwT6Fcl86kycd5MRpFFHwCW2ZEBxBvEavdYFzFCX+zMG2MpcoY8n2oswK6o6hi+5znx7e7Iusc
	HMji2yDCBK4PoCCcsXxYGxkAce/y8cD3d5xFo+5Nej8XhrMf6na7Qcfr2uxhIYoPFK1KeW6PKw0
	EhbEqp6JwWwVa5cG1Qi0PBh3Xi745KKdEoVGblo8SoOlsP9EVXDtk8lMp6bBdA6NOYvjuqjY1de
	pXcZ/m4y404jMYqwB+7h9JSY4OBMvhDwjHg4GUfg=
X-Received: by 2002:a05:7022:1586:b0:1a8:b566:80c2 with SMTP id a92af1059eb24-1b39fed11a6mr498579c88.17.1794104440609;
        Sat, 07 Nov 2026 18:20:40 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm3027961c88.1.2026.11.07.18.20.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Nov 2026 18:20:40 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] cxl/edac: Mask DPA flags in the event record cache key
Date: Sun, 08 Nov 2026 11:20:25 +0900
Message-ID: <20261108022022.3352-4-ai@linux.com>
In-Reply-To: <20261108022022.3352-1-ai@linux.com>
References: <20261108022022.3352-1-ai@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The low bits of the DPA field in General Media and DRAM event records
are flags. Bit 0 is VOLATILE and bit 1 is NOT_REPAIRABLE. The trace
events print the DPA with CXL_DPA_MASK applied, while
cxl_store_rec_gen_media() and cxl_store_rec_dram() use the raw value as
the xarray key.

User space takes the DPA from the trace event and writes it to the
mem_repair dpa attribute. If the record has any flag set, xa_load() does
not find it and the repair fails with -EINVAL.

Use the masked DPA as the key. Records marked NOT_REPAIRABLE are still
rejected, because the lookup skips them.

Fixes: 0b5ccb0de1e2 ("cxl/edac: Support for finding memory operation attributes from the current boot")
Signed-off-by: Jongwon Lee <ai@linux.com>
---
 drivers/cxl/core/edac.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/cxl/core/edac.c b/drivers/cxl/core/edac.c
index 42683b7c54..f627c73ff6 100644
--- a/drivers/cxl/core/edac.c
+++ b/drivers/cxl/core/edac.c
@@ -918,6 +918,16 @@ struct cxl_mem_repair_attrbs {
 	enum cxl_mem_repair_type repair_type;
 };
 
+/*
+ * The low bits of the event record DPA are flags (VOLATILE, NOT_REPAIRABLE).
+ * Records are looked up by the DPA user space writes back, which comes from
+ * the trace event and has the flags masked off, so key them the same way.
+ */
+static inline unsigned long cxl_rec_dpa(const struct cxl_event_media_hdr *hdr)
+{
+	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_MASK;
+}
+
 static inline bool cxl_rec_not_repairable(const struct cxl_event_media_hdr *hdr)
 {
 	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_NOT_REPAIRABLE;
@@ -1131,8 +1141,7 @@ int cxl_store_rec_gen_media(struct cxl_memdev *cxlmd, union cxl_event *evt)
 		return -ENOMEM;
 
 	old_rec = xa_store(&array_rec->rec_gen_media,
-			   le64_to_cpu(rec->media_hdr.phys_addr), rec,
-			   GFP_KERNEL);
+			   cxl_rec_dpa(&rec->media_hdr), rec, GFP_KERNEL);
 	if (xa_is_err(old_rec)) {
 		kfree(rec);
 		return xa_err(old_rec);
@@ -1161,8 +1170,7 @@ int cxl_store_rec_dram(struct cxl_memdev *cxlmd, union cxl_event *evt)
 		return -ENOMEM;
 
 	old_rec = xa_store(&array_rec->rec_dram,
-			   le64_to_cpu(rec->media_hdr.phys_addr), rec,
-			   GFP_KERNEL);
+			   cxl_rec_dpa(&rec->media_hdr), rec, GFP_KERNEL);
 	if (xa_is_err(old_rec)) {
 		kfree(rec);
 		return xa_err(old_rec);
-- 
2.55.0

