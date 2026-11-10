Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309881;
	b=pR5FipwL1J9fdtmLlUcqoMCz10CSzUiJ7U86iwSnnkVUb0sheieFSBLSG3vibcshx8aF
	 4k0Ilmbe7s9UEuZ3h1kJp1jdHrm5FSNCEy0VVOW+VD30b/PX7QvosOZt07XuwTOgyWewz
	 KAuf6gPB6BC3UUl9CC8VKbmljJbifDNdO0HZr3WouVu/Q+NF81UinRnMY/aayNSWSxCdZ
	 OEDy3U2/QiZushzBIubcp05eA6tvldCHoqIsSKPXLKUEQHrK+mEfmG1RPTEpABT/r4D/4
	 0xp6+ma84hQH4S6w0dN+S7OhAkn9zHpYOehG1MVHtEeInZ+p/8ylNfIRLsaaeYZiqGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309881;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uAYaxeqiO3EFcx6b3dV/TijEGWqi49tfP8usMyM8q/8=;
	b=Bbv3YmpsNSqFeshZecqaWCna5M2IRIcc7qLVzA2w3OCWNRquhqpyqaaZdR8s7hZaHkcV
	 txAKiqVcm9NoZ2qGIQ4j4y4zwGW42DmH1BIsHQ/Q9LCApnOcQBaQVSj3CqvIDD6YW2JUu
	 1fc1ZT/gQlgPobOfSnfsr5jpogoJjkCEJOTuFGRgUX4gx3B14hwsTY9jqNlhqZodvc/Aw
	 yhS3oTpHqHUBh7BKj/ipmZzj02eSsyfgIxxor5jUr6l45jA2mACte+TAUB8r7eWibiPW+
	 RKiQj0FOxyi65pf42q/o4Rb7hUWZdp9QqImzdT/gVIJ9G4ipDE1DSsZZEn6+3ctopww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eGebV1oP;
	arc=none smtp.remote-ip=95.215.58.86
Received: from mta1.migadu.com (out-86.mta1.migadu.com [95.215.58.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F99606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55F99606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eGebV1oP
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M2vUNFESdf8UcymT8hZpLIfWSeAjBKgtnQoCKkOWGtA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794309878; v=1; x=1794914678;
 b=eGebV1oPyx6afFuHuI/2Y2t3YTlleYH6W+PMr+X9IniPEeUceuoQo5pQ9DLWos8ezbAotpOJ
 XPSmVLWtcnb2CsCMYNz1UYwiXlcHj6paESxKt79lCqEe5iTQx5gnr8wpb9/DclB0fPI2C3mrNeZ
 jDNTD+VYwefaoLtuKqBY1cdc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 195e13a19fbd8c13;
	Tue, 10 Nov 2026 11:24:38 +0000
X-Mizu-Trace-ID: 195e13a19fbd8c13
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 2/9] mm/kmsan: skip vunmap_range_noflush when KMSAN is disabled
Date: Tue, 10 Nov 2026 19:25:39 +0800
Message-Id: <20261110112546.261415-3-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261110112546.261415-1-hao.ge@linux.dev>
References: <20261110112546.261415-1-hao.ge@linux.dev>
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

kmsan_vmap_pages_range_noflush() returns 0 when kmsan_enabled is
false.  The unmap side does not, so it still walks the shadow and
origin page tables even though KMSAN never installed any metadata
there.

Add the matching early return.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/kmsan/hooks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index a706666db097..107f66841274 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -138,6 +138,9 @@ static unsigned long vmalloc_origin(unsigned long addr)
 
 void kmsan_vunmap_range_noflush(unsigned long start, unsigned long end)
 {
+	if (!kmsan_enabled)
+		return;
+
 	__vunmap_range_noflush(vmalloc_shadow(start), vmalloc_shadow(end));
 	__vunmap_range_noflush(vmalloc_origin(start), vmalloc_origin(end));
 	flush_cache_vmap(vmalloc_shadow(start), vmalloc_shadow(end));
-- 
2.25.1

