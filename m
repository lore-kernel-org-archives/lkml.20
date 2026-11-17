Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908961;
	b=VMVZI0yBpZbP8af/AiD+P81bfD6Bwoz3SIlEtyfbHhKR6rBKxaK6odds7P7B43C00uf8
	 pRHByXeGon/YgCabd/4oiqe1rrm/QtckmWMUC2ZDrghP0gr6uiKSckpBY5RWVPgH4Csg5
	 zcyaESiXqF7Lu9kAcJYmNgv3c8JL7Z5VZGFpfbWt/LecmE0iSikLoQhApytTcKHdlZWcs
	 YM305+pebwE+2rpscGfg3C05C5C3NjXMScSGhbO11TJKIwKLbDH8HI/ChAjJlwO3nj90G
	 EG4cKW45rX3YC1BfJ7tO1BDMj99ee9W0AaNE05YZpzKj+t0C7CyzUx52bqnLL/DSK0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nzAX7Hn3HFG2m7EBlufJBm2QIHTOOunx0sHT1vMzPmI=;
	b=CS6Wb4VzZONwJ9LnD9P2eKI4avhhIsIcLKk8PXchyr5+u3G0ElJT2rsfgRnNjMW/AqMn
	 1ut7twVkm2l1nn5yyYRji70G85nY0TQvOfLNB5AIATfBw+9HoHLdVGmELwvcoPLyryJQQ
	 33gBbbkEOkD6BddHd3spRaLanCS+MClcSgkqkrZ2ktPrpvhfCzdjkSqYUZQ7BI2LdbTTC
	 aSB+G/EHEnvh+pMJWk3Ra8GDH8x0l+OCQYTXOVn28WsyOQfTKWWPVTJIgY2HaBVFwsJDD
	 AVvjn1OQEX/4EaxAQjAkbRR1MioQUCQAv7tvtN7SkX9j94UFGIYeGaR54kndF1b/eYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuTXy09v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69E7606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D69E7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FuTXy09v
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40e30c26a4so132837766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:49:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794908959; cv=none;
        d=google.com; s=arc-20260327;
        b=afyUQsnLcZqa0AQuIBwByHWT/E5lZzUEr2hfCln46vWi8sy5dU1kP664feXZctg+d/
         PivAFLuQ2w+IACsGVjOW9E5UYMNHXx/+qkvqvU1kZWGcOdCns18AFmmbRBWN8vDDrOEJ
         /hbKqzoMhy7uc66wYMqLX+ufoXLXhbE2E9M/11a+FM9kwIIRvP5Lv/AdKXyOOfTD+eOq
         LNvtbrSI9WvMioh3qkLeFIhmuwOwU3Yye4+YSDEbXl/xj+h8e0LVY+3GEitH3Wktqaid
         CqojcntW/UX64b7Tk2r44A1mbFQ+/BaQxypoM/eOF/IhKJVpZFRuZwmbC95FpP0z/PNQ
         rKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=nzAX7Hn3HFG2m7EBlufJBm2QIHTOOunx0sHT1vMzPmI=;
        fh=1wLNYY39Hdm3tpnqBy68KpDpGria+784A5Q70FbrgWU=;
        b=HqYOnFg2ILHi4dyQ+HT9luPoujVumNdgy7pQ6X8aXqs8EHrMRjmLuNu0z+LKFU/lz2
         lZ7l+bNyzOyQklleggQ9gg4KBEH1a3JQVC0hwVMT/OuQfOxbPOKiipzGnhC2sURqtCTy
         553bAjFhx99zCcBt/tRBYCW417eoYVhb3JqpGxXZjeHEIsh+nK5NOULpqhsOaLgO8f+9
         igQS3VYua9gqSXpktDgSiou6DbVJMGMezqkVhmIUl3S+0L2Zis06giyJJjIgT0TwaWDN
         202B5lUw03qvA91Thm0NYEqp8BK1FOGV3Hv2bzHIHdcv3iKI/yilOlrvBtQSavgFJT5N
         Ievw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908959; x=1795513759; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzAX7Hn3HFG2m7EBlufJBm2QIHTOOunx0sHT1vMzPmI=;
        b=FuTXy09vmSZcxYrRolEXtNEwnf5FkCxPoI6VBb0aCnsW/KLb3iVrTzVLMZ7uFX3+44
         m97keT1ED6OMuJD1L1dC+fQJPz8Ze+S5pdQQ8Oc7uYiNLC1DHWw0S19qGPeXVlkyMl2i
         fmaCHiyNPLWBgje72SkYvN4Ypz0kt1J+Z9nK01uIgFv2nT5AuQzqv5Z5jXOZ6XXU1DFx
         KeMvbXBsp3i/jbeaElOUx57ANAJq/NIYhnb4ZxyGaXQ8dnIFbwOUzHo5x9hAEscn8v0y
         d/FxqNpV6+q6f4i7XERimxtfYXM8YedaqLBBZPwZflqCu2ZBOhaZHczo6qUiRsM2ejZ0
         TbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908959; x=1795513759;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nzAX7Hn3HFG2m7EBlufJBm2QIHTOOunx0sHT1vMzPmI=;
        b=pP5J2lo1ki3Lrp8UIOwyfZr/ZrscLq4JUWh+i0ZvudQd2ymT8eQSYDT2eLPbbSpdR0
         4I06tYf7AV6ecl9vuno1YvkTBSijkZHLQmWuUEcn+Ccc5HNocxcVUzLDJ5TeTjt7pmZw
         wmiQT3C973rtka5H4+xRPJNhfw4KOaozEDw+hpGiNc7eqcGTRt7Dzwkc+wDQxwmZDww+
         ISHdlIV79erapbuspaDyGDM5+iA7cl44aqDphcJBQgBb0749mXntsCAnLF9/Uhqhj28p
         xp4bOypxMP36EyH0HQpLdujm0IqQ6tJO1ioYmqrXiIc+XhlxiGZmwJgMwbGxYtvCS3vY
         PhYg==
X-Forwarded-Encrypted: i=1; AL+hErGOg0KoUDS3eSYto5LCbhmoEB0eClABa27tB3fWEJivbggfEaV1kTzoSQw4nPqqjzYSEwiN1dkdw0ohy24=@vger.kernel.org
X-Gm-Message-State: APuU4Z874JFoZoPYLzHGI8MstmO7zbCYJ6THKNfQ12g8gcPLguLW4qep
	hzTOmygfdLA48CUv96t3coSuyi2PkJcOgGn0ucenYQOcmV5QYKes4HrXUrENZEgN2MG4F3W/Rjp
	QLRo8Ah+8mzWT1kx2M/MeW3/o5GOZdkA=
X-Gm-Gg: AYBFou1lusRqTtZWRnO4AsMJ4oyv/GXR8ptwbOX5lkvc34Ev2hC+F03HytX84uOSoHl
	fsNNIvkTPpEBoeFSbW+fxq1x1Ex7T6ALfj/QLsiOEO97euiNf2vJxeTKMjz82p/9LP8RP0EA4pL
	l6owGxStUcla7PtbLcLVQE2HEanE3wrM7Bp8hnRF/ZjtzaRgD6y470VC+Vjgjk4kXrhLM5rsJHh
	ctcOxD9JXHEsT5jrXgsj9mRSXnQogIAsUkeMQ/RnlatLLkVd52IgOrg6h7fe/e/dHMserNFjbN2
	O8syn2gYBp2ml7a+fDLB3P89/M8I9hvHMAzwn0grBEdDak5XlpiTWXEZ+avnhPYDGMBCHqCX5ls
	UwcZ1seyc1Z38ySBBUTv7VyNxo1wPu4sCUWn/
X-Received: by 2002:a17:907:d38b:b0:c3e:2224:1b86 with SMTP id
 a640c23a62f3a-c50f3164206mr191836966b.2.1794908959073; Tue, 17 Nov 2026
 01:49:19 -0800 (PST)
Received: from 118528743069 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Nov 2026 01:49:17 -0800
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
Date: Tue, 17 Nov 2026 01:49:17 -0800
X-Gm-Features: AclHuK9FEypfP2EGDWGzra0eltXLlU9490QSA7tH-psz98Putxd2YziaEXtElEc
Message-ID: <CAMas6S2kcCz0SSUEbrLsm87Xv0kjVrQUXA+ayjEgQL7JTh9hwQ@mail.gmail.com>
Subject: [PATCH 1/2] x86/mm/pat: skip HIGHMEM pages in a page array
To: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

set_pages_array_wc() walks a page array through __cpa_addr(), which
returns 0 for a HIGHMEM page because it has no linear mapping.
__cpa_process_fault() then takes that 0 for a virtual address and
dereferences it in its warning path, so changing a HIGHMEM page's
caching oopses with a NULL pointer dereference, with the CPA lock held:
every later CPA user (installing a seccomp filter, for one) then spins
forever.

A page without a linear mapping has nothing for CPA to change, so skip
it, and take the pfn from the array: that is where the primary path
reads its page from, and cpa_process_alias() must not derive an address
for a page that has none.

Measured on an HP ElitePad 900 G1 (Atom Z2760, i386 without PAE, kernel
7.3.4) with a graphics driver that keeps its buffers in HIGHMEM: every
buffer oopsed in set_pages_array_wc() -> drm_gem_shmem_get_pages_locked(),
and the machine stayed up but became unreachable.

Signed-off-by: Christian <servidorjarvis1@gmail.com>
---
 arch/x86/mm/pat/set_memory.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index b1d5c5a0f..4565438b6 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1847,6 +1847,17 @@ static int __cpa_process_fault(struct cpa_data
*cpa, unsigned long vaddr,
 		return 0;
 	}

+	/*
+	 * A HIGHMEM page in a page array has no linear mapping, so there is
+	 * nothing to change: __cpa_addr() gives 0 for it. Skip it; its pfn
+	 * keeps cpa_process_alias() off the direct map, where it isn't.
+	 */
+	if ((cpa->flags & CPA_PAGES_ARRAY) && !vaddr) {
+		cpa->numpages = 1;
+		cpa->pfn = page_to_pfn(cpa->pages[cpa->curpage]);
+		return 0;
+	}
+
 	/*
 	 * Ignore the NULL PTE for kernel identity mapping, as it is expected
 	 * to have holes.
-- 
2.47.3
