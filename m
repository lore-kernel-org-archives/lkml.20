Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908964;
	b=IMizMNwUck2QLN9ogCyymd+8mRWkyuslqv/94HqHHVzQEXQgqpcF0LymcC2iRB54v7AB
	 MrGUI8OQ/N5xDoIaJuoGDchEjb8GrQoYZ1EG0dRUmlRzZMoz/dK1YQjJpCuw8Oi9BAG6e
	 F0v5YsWvP831m4z3RCipIkciAQYTrJK9RHVbYO3wbAn4fdaSuy5kFzEt0D/7BUS3uXYJ5
	 ui7PZjBz+M9kNC3lvs21NXI/fqNxPoIFN6qAGp7LF5+G9kucme1QxHY6+Iuk8oiLx0qiV
	 ubt3+hMMOdZ3Uzl9dyVZzj7Q5diifovAbCa6FwYJNYPAqbCTNwRX30trKUdFRasemig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LkuWi3buIL9y9DvAsb8R48DKXGMzcNdsG000mwhqOTc=;
	b=aWCU31aZLcSSnMi95T/djoExqSUfzGtF/2QUZj+QpdV+nNgz8Spyf1GpgOpztLvw14XX
	 7P3OYLlDvjlZi+2nKmQLctygUquUcPiS/7VTHqed3c6Iizy662fiw6ztatFQl6UAJCde3
	 JKPg10O8IfMSAamU2Hp8/RBjDjzKWgxkTxt5hk7yOBGhkLBWveW+8Ns0m3EmtNMX6WX3A
	 9Mmz1uo8N6jGKlViRvEXecwmYQi5EWw2a0t/cyrg5WtSdF7vEhukvgxdpaiNJCVSgZ8Ty
	 eifDOt8kNjmq0yk7qQm+JE9o7AgA4wfHBqt+pbcBbROfN/3GDlLF9EyooOw1PSdHQTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kH6cxi83;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FACE606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FACE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kH6cxi83
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cdc606b47so768735166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794908963; cv=none;
        d=google.com; s=arc-20260327;
        b=LSPlRMWGs4CvnnrlBgx4FSFjbP2TUKJhkngcWHC5jYi5FiM/S9QTLy0zcQV3fS9G6i
         ojEaaUm04mmouTcrlXNFV2Hada0kDvQa5UOBUQ9pO3kjFqvETJZxMrn51lQNJZ7PeVGT
         xwvAhQSiNwlQgUt28X2TGYMPoCsSlcm1jFp7i8WG0JX7WniazOR/EdRMB9O+i2GlRH78
         o/h40sUEOjqr+rKI1SgKTNJySjq+9Lcbemng5p1IRBkTc2ZuRlCua2zvdmMVfLKagHT4
         lKVqemkWPAlHlOKhBdUKzOj33JK/K003hJ9xJmsNHPD6KknnK/t2QmMBH29AmAPUH/6x
         4Vbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=LkuWi3buIL9y9DvAsb8R48DKXGMzcNdsG000mwhqOTc=;
        fh=G3URvLBDL6lvrIjbNRuy9F1DUzBebBYBgQ8hDyus850=;
        b=AnnkPoTEVoJP8gyWBtTuX8KrP2aK0r/D8P0aSY97dyWAytMOV2ZMIDjnnGKdxFpFC2
         WuyLPbDaQ5gphJGUMw32BhkZw5mR+ULfqKuS4/kTzfb53SWfAc7k/zA4KgE/Xiikrjb/
         3derhlbTwhVLTfp9Nd85R1cAOppHsn9oOeHVFHZ7iphbo2/0445hPyQ8LHRBSLp0ZXDC
         NEJoRga7jKxDW0iZRZHiIx6xBS42v9bOw5cdpVJM9Jf6wLIK7HzRFgEwZVbL5D8LH6s3
         HcMIKdNdzPHoE+igTrsjA772Ym7NntGDz07e2LFIsj5wPfok2JFfoU7FTZSs/FvzK+cP
         YymQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908963; x=1795513763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkuWi3buIL9y9DvAsb8R48DKXGMzcNdsG000mwhqOTc=;
        b=kH6cxi83Iz9teLXi0hUVjLx0ipVnTVefivepI8SdjFPGdDNVcIM6W23u9vgNpv92oG
         giIcTrqJbiG3ui6AIlfXj72V8FSAM/pew+gQTw5qc6dX6EEDwyx7DraIDLckYOB+zEQg
         RDYTmjWo32eyI/PQIMjc445WLb7xXjIoBnz9TP46PnNyNFN1oamWOZk/e9xfIqeNSQZq
         daGkd/eSkv/qzE4tyjanbwyqrwKFFU6yMWeFw3m+sEzmDdLN0HuOLLb7K9Ru1ZUKb/rY
         Bir8uOK7n4aMBwe5ZOjhVzHlPZ0X5Q0WTNIshQRnD+2rzs390oPDU25S+ribY4wiGtfJ
         Qbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908963; x=1795513763;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkuWi3buIL9y9DvAsb8R48DKXGMzcNdsG000mwhqOTc=;
        b=fe1CdrhS235rmoUai87xRoU0qT2/WwCYqT69V0t9EvSRs5pDY+Xme6rZ7L+hEQKozQ
         2smYAYZj+E1YtekhLbfDzBR3+kH9HYOXhrVYwveX/8vtAYTYE4tdiL2v0eBXnTGGtw6e
         OzPzJRIQf7fsaiYEzU6InPwCQipQZPgTgh3VysT4JZwmN91mcUT8exUYRvZlc/40kWGp
         M5jxaLCTvYLYdVrcD24RpiUKueS1I1Cfk29psJt/rB+ZIxB1fMDsjSjeOJJrDq+Ou2SB
         SHYJGwvAShwuOCuG2lB8mzW2Z+7KN1yM7irUUNrhDdUegbQwBvpPafjhaYQznkA7a0Zm
         BlCw==
X-Forwarded-Encrypted: i=1; AL+hErH2bTepBt5I2i3JsVTYxr4qVFGveokls8LniCLb4Vk+FGKyl8CEl8p2rjIXxX3XC/GIr7D7pp6r84cJb6g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RtNk9BZXXaUA2OFce1XjJwRfnqv9paZUSPsKXVRRgd07kCa+L
	ZIEBAibzOgKwMJMh10Hbik5s10NefgB256hjDic20xBYJeKzss1a//EoMy7RwfJc75WBYzZHTAt
	zWWVJrQ0Jdf+p2214hGcBso7+6tC0ztY=
X-Gm-Gg: AYBFou0S8LVQ5XYdaf29TQsgmyVGiH1EX0w8UW4O+vyhCmorsb3Nb0+8o3zXPQw3lPK
	SBV7I+BPHf0gpS/BElYnOUtC5LS2pVGecQY4YDV594RN9nLRI68P4x6BwTeseJbreiDdjW14ngt
	58n6FbRliJoBVKqGO5s9gKU7CbJEkIYen1g96jnuTZPqMJ/liKD8X2r61CYVBC/yCt2xvnDTXIM
	C5OQjHN5HbF/oxEoyfG0oE/Gf5w0OFCZlfpvtlNnBpdVljhZdzQkwNe/ageoGP2AWzpMj6yZHe2
	Npu/eZBppnUYO/cn+j3SmoayMuBBUwOdxByZtipIn4CIM2EE4l+DEnEVjE+uLHpH2Za71sjgK4e
	Y5TWC98lpixY+i6HnSn6yIA1nuiHW1KYRFrbo
X-Received: by 2002:a17:907:ea8e:b0:c46:ca3a:10d5 with SMTP id
 a640c23a62f3a-c509642379cmr1088139566b.45.1794908962757; Tue, 17 Nov 2026
 01:49:22 -0800 (PST)
Received: from 118528743069 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Nov 2026 01:49:21 -0800
From: Christian <servidorjarvis1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAMas6S2z+9-TyTfFTRDM+Qk2rKpRoYAUJSvmMxEwG6eAnQQn-w@mail.gmail.com>
References: <CAMas6S2z+9-TyTfFTRDM+Qk2rKpRoYAUJSvmMxEwG6eAnQQn-w@mail.gmail.com>
Date: Tue, 17 Nov 2026 01:49:21 -0800
X-Gm-Features: AclHuK_GV8u0l8YK5wfxIqagpFOR3vBitHnKjP-vmvNR9TNyjOv66rmaXsCDVi8
Message-ID: <CAMas6S3cAZBLhcWbEWFuMxpUenr+fVzrjRS-JnMbmVtYTfVkFA@mail.gmail.com>
Subject: [PATCH 2/2] x86/mm/pat: track the memory type of HIGHMEM pages in a
 page array
To: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

_set_pages_array() reserves a memory type only for pages that are not
HIGHMEM, and set_pages_array_wb() frees it only for those. The reservation
is what makes PAT apply the type to user mappings of the page; it is not
the CPA walk, which has nothing to change on a page without a linear
mapping.

Without it a driver that keeps its buffers in HIGHMEM gets a
write-combined user mapping that PAT leaves as write-back, so the CPU
keeps its writes in cache and a device that does not snoop them reads
stale memory. With the graphics driver on the ElitePad that showed up as
continuous GPU page faults and microkernel resets until the device wedged;
the same driver with its buffers in lowmem had none.

Signed-off-by: Christian <servidorjarvis1@gmail.com>
---
 arch/x86/mm/pat/set_memory.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 4565438b6..77da61396 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2578,9 +2578,11 @@ static int _set_pages_array(struct page
**pages, int numpages,
 	int free_idx;
 	int ret;

+	/*
+	 * HIGHMEM pages get their memory type too: CPA has no linear mapping of
+	 * theirs to change, but PAT applies the type to user mappings of them.
+	 */
 	for (i = 0; i < numpages; i++) {
-		if (PageHighMem(pages[i]))
-			continue;
 		start = page_to_pfn(pages[i]) << PAGE_SHIFT;
 		end = start + PAGE_SIZE;
 		if (memtype_reserve(start, end, new_type, NULL))
@@ -2605,8 +2607,6 @@ static int _set_pages_array(struct page **pages,
int numpages,
 err_out:
 	free_idx = i;
 	for (i = 0; i < free_idx; i++) {
-		if (PageHighMem(pages[i]))
-			continue;
 		start = page_to_pfn(pages[i]) << PAGE_SHIFT;
 		end = start + PAGE_SIZE;
 		memtype_free(start, end);
@@ -2648,8 +2648,6 @@ int set_pages_array_wb(struct page **pages, int numpages)
 		return retval;

 	for (i = 0; i < numpages; i++) {
-		if (PageHighMem(pages[i]))
-			continue;
 		start = page_to_pfn(pages[i]) << PAGE_SHIFT;
 		end = start + PAGE_SIZE;
 		memtype_free(start, end);
-- 
2.47.3
