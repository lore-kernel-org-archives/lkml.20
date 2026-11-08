Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104437;
	b=Vav5lvcauMGmVs6aOiPXQbBVc/72qTxRKOfocS5VccJZubcSUGYbMaK5+wtyaM/AGP9v
	 ZH1c8lWR5SCSqm5xb1wPx61r/FViIhkvwYikUIelRZAON08KDeqXp4NH7Qo/nXyLGT+XK
	 kSirtBdt2MNOVmkNLADNK1Csa5pOx8T7bPGkG1k/ht0uGGf5loVgSEH9y90TQf547LDsz
	 6fH/8t5Sf4LzNcRNAQbz6qapd8Unaog+kPKSJWwbQFwOXUgAM6pyrff7k3otyKr3HQbjI
	 EnUxDCSxQ2eOT74DES79gu3sJVJDreT36epFPUhpvliCMwQ0vtlTvv9PWL0F9hbfUVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104437;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SYW4ZnGaz3QDrVdkhtkAhNL8qGxqKG9vxvJA64ntbyc=;
	b=ehstxgDm/HATwt0WYTtHhr6f4Hhx52BfEGMxJOc3+8Ugjcv3nuaA/b1JmLxuTSWkwL8w
	 ESFqEsGYFUAEsfehD7Uh0RepecDXgD+5C6gJE58fy2PH1tWlZPZODaAsQt7u4+nPQCgTF
	 MU9vlQLdZoWUQY6ZJITxZd7hDFS6kd4ceJ7iV640X6OBW38cwgC7mPu0M/dSVh2kUwfIa
	 PqoQQErf+X/lGuxSqZP76lxGa1xxIwaNoMsfIR5oGDR6NJDTWQqRBr1IZm8HpjU+vmW3m
	 NY3RDgV1TSB36+iqWoxU1zRBJsGAKO4ga7tjzrp40XBRZBbMUlHv6k/eYoxDaHb2uqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF42A606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF42A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso298821c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 18:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794104436; x=1794709236;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYW4ZnGaz3QDrVdkhtkAhNL8qGxqKG9vxvJA64ntbyc=;
        b=rfG8VYLpZVaRpjboGZMF/aok7zKZQwH01eHAgUNwOm0s//mSny96ePiVJNU5ag7yku
         BKqdeaQ/gzd11rt4kdBDiSY5jJekrQnUQhCP6mhL6C3ihxKxYrBWgfkZJS73lLPR2cuA
         Vbo1O1OXz5yI/JxzTtgcFKUSlAdj2O9Y7S1gSqtYFRc1oz2+Hud87hr1tpe9RFbJboDp
         gYdzrtgHIQO/Ps1/CPInnPV8H4pF0M6Fhm+Ef+dFTnZwYzwLLUzFdo17xCp+eL4PkoL0
         /pyKVeRUIyCwGfX339dS45tWTs+M9nAQSOlihjbUKkWkrcajU63uvoyb1NBWqt/zlN9n
         vYpw==
X-Forwarded-Encrypted: i=1; AKwUvBzlhMGeYq/bZi0a/Y86uYxG0k0iyUaw1R2jDXjRJPcaou1/nO2/iACBMHB3cfoJusz7ovpmMed4ckyoYZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FEdvE7u6P/2tobATgfet863cHw4Ubue9nB44SWuD0S3Okudd5
	10+UVDeMYsVXoB/rjcf/V6Jgkrq8qGNnAEV8MzsnTl3gT/VYxdcFWUULO2edKIqeZ6fu
X-Gm-Gg: AYBFou3VZDh6THC7VuU4wiVOA0sy6vrZHdBxtS5dj0k13O7kx6u7BzU3nd3rL13rLFc
	mdJrpfXmdANvCF2baWw4PcmGgyiR7Mly2Otfaf3ij8DXnR6v0dQD+MMfU+Oc1X8YB0RtwgWOAU9
	MZVwsOaGdGKOTAGlpK/wRGAtzjoV1OynIfre/54j93mzM46dEYG4Dh1PuY7mdIZb8iZnWjBEh/j
	DaidF+iwEEks2FKWM1yzwSke59inVCUVMZizP+pU2wCmAGiJE7BdE/QKIQ3DOaSxcyAIInkWSF7
	utwHr5ygbZYwUBM6T7dMiQJWxXN17IKKVEtHdGtkdUdknop5zA4iXXwJYUOxZGTKZBa1CD4bHVP
	8eUjpPt3Ct6THgaSs5YNPWjXpL9elfU+hEe/qgqJ/d9iAkyiXIKFZ2+Vu/ebmMznFtq8qczTsUP
	fftZ4Ad6v0cBvPZoAyTcJ/U8WyJEAAg4TytwxrzjRwirbpzSUKdgWw/36LIv9ULPa/H0fALXP6p
	q5uiJLn5Z/L56efjWy+5opylS/HXbztQbBjF7vT2ncLX3eQBaMqVOxclHCdgjn3aHww3xk/aVf0
	dBnqUD/bLbRFSkPHDCo/N9mu1qy/w9icAglnQ5zVeQOHMqo5VV3emx1YRtqWXSK0EWgwQ2yf0l3
	CaaJscs7oGyASDUnz4nr/flFCQEk8C82c7Dw1ha4=
X-Received: by 2002:a05:701b:2816:b0:17d:7b45:f927 with SMTP id a92af1059eb24-1b39febf479mr389625c88.33.1794104435796;
        Sat, 07 Nov 2026 18:20:35 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm3027961c88.1.2026.11.07.18.20.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Nov 2026 18:20:35 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] cxl/edac: Skip event records marked NOT_REPAIRABLE
Date: Sun, 08 Nov 2026 11:20:24 +0900
Message-ID: <20261108022022.3352-3-ai@linux.com>
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

Bit 1 of the DPA field in General Media and DRAM event records is the
NOT_REPAIRABLE flag. The device sets it when the memory at that DPA
cannot be repaired.

cxl_find_rec_gen_media() and cxl_find_rec_dram() do not check this flag.
A repair request that matches such a record passes the lookup and is
sent to the device. Since the records are keyed by the raw DPA, this
happens today when user space writes the DPA with bit 1 set.

Skip these records in both lookups, so the repair request fails with
-EINVAL. The trace events already show dpa_flags='NOT_REPAIRABLE' for
them, so user space can tell before it asks for a repair.

cxl_find_rec_gen_media() now reads the record, so take the xarray lock
there too, as cxl_find_rec_dram() does. Also make it return bool, since
its only caller just checks the result.

Fixes: 0b5ccb0de1e2 ("cxl/edac: Support for finding memory operation attributes from the current boot")
Signed-off-by: Jongwon Lee <ai@linux.com>
---
 drivers/cxl/core/edac.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/cxl/core/edac.c b/drivers/cxl/core/edac.c
index 4624ab4644..42683b7c54 100644
--- a/drivers/cxl/core/edac.c
+++ b/drivers/cxl/core/edac.c
@@ -918,24 +918,27 @@ struct cxl_mem_repair_attrbs {
 	enum cxl_mem_repair_type repair_type;
 };
 
-static struct cxl_event_gen_media *
-cxl_find_rec_gen_media(struct cxl_memdev *cxlmd,
-		       struct cxl_mem_repair_attrbs *attrbs)
+static inline bool cxl_rec_not_repairable(const struct cxl_event_media_hdr *hdr)
+{
+	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_NOT_REPAIRABLE;
+}
+
+static bool cxl_find_rec_gen_media(struct cxl_memdev *cxlmd,
+				   struct cxl_mem_repair_attrbs *attrbs)
 {
 	struct cxl_mem_err_rec *array_rec = cxlmd->err_rec_array;
 	struct cxl_event_gen_media *rec;
+	bool found;
 
-	if (!array_rec)
-		return NULL;
+	if (!array_rec || attrbs->repair_type != CXL_PPR)
+		return false;
 
+	xa_lock(&array_rec->rec_gen_media);
 	rec = xa_load(&array_rec->rec_gen_media, attrbs->dpa);
-	if (!rec)
-		return NULL;
-
-	if (attrbs->repair_type == CXL_PPR)
-		return rec;
+	found = rec && !cxl_rec_not_repairable(&rec->media_hdr);
+	xa_unlock(&array_rec->rec_gen_media);
 
-	return NULL;
+	return found;
 }
 
 /* Caller holds the xarray lock. The record may be freed once it is dropped. */
@@ -949,7 +952,7 @@ __cxl_find_rec_dram(struct xarray *rec_xarray,
 	lockdep_assert_held(&rec_xarray->xa_lock);
 
 	rec = xa_load(rec_xarray, attrbs->dpa);
-	if (!rec)
+	if (!rec || cxl_rec_not_repairable(&rec->media_hdr))
 		return NULL;
 
 	validity_flags = get_unaligned_le16(rec->media_hdr.validity_flags);
-- 
2.55.0

