Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001769;
	b=FGLWDisxr3sZPaBN3plAtGahBr8qUd1RRdaiM4lzvHNQnXClxwgkrhevS+kcLfHMjJh7
	 el2W0VrGFo8mCXgb0XlYxXip6juM6DLaDW35HuGRZNbCh2aXQnGlNGOePyAGqJUAJdRVj
	 1WkyqUO30lWeQQC3JrAJhniHs2RdwwXul/gyvTxObhBl7PR0NRjHsb5wHX8qHUgCXQ/7E
	 OXaF+6I0BRww1jWn3Am4IjCCrYCRT2jvpBXc9HWPsjI02KHtkYcRs+KmTZ+/3Hu1toWte
	 57y8zahms/sK2vbfKS/u8NOF2J9ziep7DcFnSoCX9A+aDh9X1KtH/Bc7Q2++bvLlaAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001769;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uAYaxeqiO3EFcx6b3dV/TijEGWqi49tfP8usMyM8q/8=;
	b=Xt4oY6f06CNs+0/lx1mAx3Sm4KlD7c4pTvUtvkzVpYbkDwSfEDggWaNnrYb6YURBFQz9
	 dEhbDjl5NRdlb30zRM3vHZEmJf0Z3aDgKjezHlrnL6QQYBivX2jQuq2ksLp+MKWwARu/f
	 l4XCkbl2BA/UfAx0wv2mXVhXdhrisXqKm3iSpQIvWkTE+7ilm9fiX4POJx3nW8DPATMm8
	 qXBAqr2af7yzn731PrjPGfCNe0eIuE5Kbw+hQvHavN8eY/VPB7dyFbaIMDS9akEHEJI9Z
	 4/Ce+hbtr/RtVDokUQ2+nf0ZRUbkKmOiRuguBGK1TkUy1DFvvH7vJXntltpgra/AiJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XbCFXiyf;
	arc=none smtp.remote-ip=95.215.58.222
Received: from mta1.migadu.com (out-222.mta1.migadu.com [95.215.58.222])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70061606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70061606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XbCFXiyf
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=M2vUNFESdf8UcymT8hZpLIfWSeAjBKgtnQoCKkOWGtA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793001766; v=1; x=1793606566;
 b=XbCFXiyfd53I2U6rUn0a6tfgIsXsLRGnPk9Df5ofMIgusvXpStcf7O9GGcbaOM6it3/k4HCn
 J2xjorfRJj6uhinSb3Q9oTSzON+YqsEz51TPCv2VZDsv89HIh4sP09ZT66ST4ChrVyztH33Y+Ri
 YVwhGfVcKsRmAioZ7waR7B4o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 30faa018c302662d;
	Mon, 26 Oct 2026 08:02:46 +0000
X-Mizu-Trace-ID: 30faa018c302662d
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Hao Ge <hao.ge@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>,
	Dev Jain <dev.jain@arm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 02/10] mm/kmsan: skip vunmap_range_noflush when KMSAN is disabled
Date: Mon, 26 Oct 2026 16:03:21 +0800
Message-Id: <20261026080329.140244-3-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261026080329.140244-1-hao.ge@linux.dev>
References: <20261026080329.140244-1-hao.ge@linux.dev>
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

