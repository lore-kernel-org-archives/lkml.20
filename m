Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380975;
	b=xPOom2eXCd7s+vi3WufiB2netnygPY0wQjLJJEM2L6BzYu6SZZ7ZSBt32qHBceUYRWTr
	 PMmdJhlt5BAaPvTL2jjtuL0lw8QqkBnitNNF8ru4V22pv9bd7PX9LwfyBEqII+V58LKx1
	 +Aqm4wFaDnHJgxcKP+ebWeGT8xxJIyL+2iaR3fcLnZY6h+RqhPWmkPZi4Cked7YzIoUpk
	 MjPX29Jk3Hys7LP0h4Log9BX0BYeTqSI9fJnVrRMH0M2DB6I2BbCVCReCIo3U25xP26HD
	 BTBiP+H9gUgiSYB/oyUHmCjDNyfkZxHtTfk17k6x5QCxf9YyYcCAiTf8Q25NKDWKD+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=pfnkpC25liOJ53c0mQZ6/TSQvyf0Bspw+v/pqKKkn6s=;
	b=hRySgc5k9ZTylMBWSOUzzzR3SUii95hPjwXKeUCZFkeTZPFo1r7PGddaf20c6SvQZZT1
	 7kzJXA5Zf6U6BS2d65BelRuSF/f1dPHV/tSSO9QJgwDHbZuegycbUIs01Ay+C75zHXy2n
	 hVH2p83XQlmedp71yJJoIJp3a7fPjmHzLJqp3xX6EBBJhYD5rAHrMlpkhrfU8sh8Txf26
	 Z8jCUpkPlYhfHKP9cldJ4w7DYCKPalVc2kfoGep5greqXqGMMOPuTztXQTEwCF7JQhUUb
	 SQkCSDaixobmpyLmOMEpT22oW0Q6ETQpi5tp+8/JSDz+NndIcjcEhFLR6wiHMB6LlVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=GiTVJSUU;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAAA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECAAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=GiTVJSUU
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1969057a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794380974; x=1794985774; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfnkpC25liOJ53c0mQZ6/TSQvyf0Bspw+v/pqKKkn6s=;
        b=GiTVJSUUTJTF2cdyBPJ/BZtvlK7iTMLH1QbQ5d9mK2yMPgxzyZ61SFnsbCTr9mTuLj
         KFusQBIyzEpraT45qQpAtLT3t8iiAoG4BP+YOwvw5y7oplAoGRWW67i98qcxuCOTPf2A
         wMObzMfLdUUY/6HqQfz1Ft/fUz/yMYPJ6ustU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380974; x=1794985774;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pfnkpC25liOJ53c0mQZ6/TSQvyf0Bspw+v/pqKKkn6s=;
        b=pkjv6nU7ziqr3QONseAMMj0BabuNZYpKQ0cqDJAvkqo0BlcAsrKJ5IlvFgKrW2ymEw
         P1dQy80XHtM0bigsWoKY0nRwZOi7B8jqOXRENKrlsZnot3obG6lT6YJr9EonzVF3hkF9
         P0l23vXrgISspMxX6rTJlI1CNNv7oo8Vtot94fZN9Lw58fYaFpLfol9uz+DOYafr31O/
         sxmfvCyhbrlqUHAycX4qOEjx6U30WL+JEApyPMXkRRmtjllUVgj2/6Fx2/aNf0m94I75
         +4DpgjZBKQlaQOG0nvf1n0q+72jv/TisA8pDdU7hwGaKXbqECuEFBPjt1q1PUB/b9QM4
         WMkw==
X-Forwarded-Encrypted: i=1; AL+hErEuaxlX18ClzIE21QoadwlCNg95aE3kGDifWM9jhlr0B3/MJbGhMw+XwyM/s0YzgD+jT9gaPjlkIOu228k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5afNsWVA/HTMfsoF/YvkcOWbZXK5kWbZtqwh+rr6XwgU4b7AX
	FpNZE1+1hreu2KfHBPjoNRXtQstrwBUtfGMEa1FZkCTQ+zMSIBYUWfefvCQ6VIBXB0M=
X-Gm-Gg: AYBFou2eIDwGTidqxhh/0t+ttLq9teg4nQkcY8lBeetxemq6ulQhdCfz5Vj6hjO0JZz
	R6P047oAM9Q4ciEcE/Gg5sXgt3v1GHKMrX7QHJHa7QFp3mmCibjXGiOdnMoWyNEw4NXpuLtepyN
	nioixUCWLsYDVHMqu+80P7r1E/aoV+nA/vPeUC/HWHHVMjJ3Lqxjxlrq4yBWRPLcdlhpcUyIxgi
	63ctfEJnh8zKP/lKL1DtVkD4kxEozpdHXgIV9SrXTj14dnwX//+PF5rA+G0cjyUB6Jaz1FYPHv7
	zg7KcOpbDOx37pTto5T0dhVmBU3YU0r2/qeekSSzXksh16SZEzULpTMfbL7DFSdd/qOpS3kGsJ9
	VkXWC9xQo612CyXCaySIEF4pcjAI+Rxe+a3u0VP7Zwq1unXCF0Z53FD9CLEpvhVlOv6+O/sQ0iO
	eFlRKj3QyXnmqR+9ohcK6pLZ4oJOIjpWK5RQ0aAJ0i+HgtzDonUpDO+xtu1ZmZ04m91CSH5H3FH
	UKIoFkXpQD5/d8MH7sBOa2GWHAK+nO9gqqc9vajAvpQ14/6aWRV0ZQIKeVA0UR/vkn+y57abB7F
	t1+G/VqPb0gqV+LaII62BnYJwUcpMaQ3iQbMNkFtCX6FbK1upw+qR/po0lJuFcq3ewybiGzcuJS
	pNirt8v77+QKj2/6P9j8mbjk0nCWH1d1dKTTwAwerWdIovOyE0buJiCvperh74hE2DZ0HLzRTAt
	t+fowOJHSL3zExEpmHq6RuTlt+uYmG5C9D1gGe4+mIi82Okp7kh7tH
X-Received: by 2002:a17:90b:17c8:b0:3ac:9f24:44be with SMTP id 98e67ed59e1d1-3b182edc482mr1816027a91.29.1794380974284;
        Tue, 10 Nov 2026 23:09:34 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17da51f80sm3175523a91.1.2026.11.10.23.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:09:33 -0800 (PST)
Date: Tue, 10 Nov 2026 23:09:30 -0800
From: Chris Down <chris@chrisdown.name>
To: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org
Cc: graf@amazon.com, kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH] kho: Prevent reuse of preserved pages after a reservation
 failure
Message-ID: <avQUquBK6cO6tUUI@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

kho_preserved_memory_reserve() reserves each range of preserved memory
in memblock and marks it noinit, but ignores both return values. Either
can fail when memblock has to grow its reserved array and can't find
room, which at this point in boot it may only take from KHO bootmem.
The boot then goes on as if the range were reserved, and two things
can follow:

- If the reservation failed, memblock_free_all() hands the range to the
  page allocator with the previous kernel's data still in it, while its
  KHO user still expects to restore it. A memfd preserved through LUO
  can then get back pages that belong to someone else. Oh dear!
- If only the noinit marking failed, the struct pages can be
  initialised later, wiping the KHO magic, so restoring the range fails.

Dropping the handover at this point isn't safe either. reserve_mem=
revives its regions from the handover before mm_core_init(), and
relies on this walk to reserve them.

Carrying on could hand out private data, so let's panic if either call
fails.

Fixes: fc33e4b44b27 ("kexec: enable KHO support for memory preservation")
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/liveupdate/kexec_handover.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index eeec298aa9d6..0faa21ebb0cf 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -629,9 +629,14 @@ static int __init kho_preserved_memory_reserve(unsigned long key, void *data)
 	sz = 1UL << (order + PAGE_SHIFT);
 	page = kho_get_preserved_page(phys, order);
 
-	/* Reserve the memory preserved in KHO in memblock */
-	memblock_reserve(phys, sz);
-	memblock_reserved_mark_noinit(phys, sz);
+	/*
+	 * Reserve the memory preserved in KHO in memblock. It's too late to
+	 * drop the handover if that fails: reserve_mem may already have revived
+	 * regions from it.
+	 */
+	if (memblock_reserve(phys, sz) || memblock_reserved_mark_noinit(phys, sz))
+		panic("KHO: failed to reserve preserved memory %pa+%#llx\n",
+		      &phys, sz);
 	info.magic = KHO_PAGE_MAGIC;
 	info.order = order;
 	page->private = info.page_private;

base-commit: a0dc8eddbfdb6dd9c5c2b70eb66ab49cb1978425
-- 
2.54.0

