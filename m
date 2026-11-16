Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827070;
	b=a1xISTTKjXgpnkj+9ChPxaE0FOGhmzV4Qdzed6IA1Gi6RgbafQgo9ucu6z4dX+39yraA
	 wl33LmYdWhRFFwZZwv+OzD6JH/j6xzGfxXVuIH+DpW+6jduI/puwiT+eJYptSj8Hdns/h
	 nsq4LkPlWPD4gsPM9NhMXa40oGAHBCNlRNTRrraBJaZFNYk1CU1L2j0qSGbgK2dBSGqrz
	 y5I6TilMY7kJiuXBMVfZHGISTgs7EAytoZqXgItOlIIP+pF1S/tzSRma2fLq6yBCSP5Un
	 1sdmPl13wZv/FIgqUE4UnSwcKWW40Z4Z9KhmGllVcbVTTLj0mLgbLk6Pqq65Cx9hT7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=de7uWRaoa1siS6iLR0pU/Ia14wz6HbTA+F0jrLsvNd8=;
	b=Fa/TOjEL141rPaBvHKfuEnwIYCH8SRmWHmEo1W0VZOnWg5AL0wPlpoF9ZGKx8PWmeVJr
	 7SsHDZmV7GS5w2d1oy3+qBFCJIAZs53IfULp+jmwUWxoIGwpsyfIUXGm/XVQW//picPvU
	 m1UOagusCOsCIokseyg9cFRP4Z3VwKr6pJrfiExssL64ccoXzzvE86PDg8nzSApuuZjYR
	 y+EByahR72+M14NipRxzvOxdwl6SdMeCz+X0bGgxwu/sR0/FH+sDZYqEM8yyerAQ8i9bE
	 gK6NkOS2xCLw3O86rwCCe+1X/WyqfOyhz6c2km45lYheth2OBbkTOK26hrxsyiVm8RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ibJAJtbb;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B03606A8B7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B03606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ibJAJtbb
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso4462459c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794827069; x=1795431869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=de7uWRaoa1siS6iLR0pU/Ia14wz6HbTA+F0jrLsvNd8=;
        b=ibJAJtbbIcCUBdtIoLRGx6CFmDNCRopaCWZBlDlXOvKpbGxlDj5rpUXO6jCszQizOn
         IrNKEJG5z/O1kYOYOgC2MW7as+fIB2ZgKrNRzuSsmagX3J1tZGV8R9BRkH8sCQ8h9CaR
         LPD21Tg+mJUYdmtWnuk/qYn7GAbySopb+45f8OibRIJ3/I9Y03w9CP0ahX0uptAERBCc
         BLUn35h1bsp83vYs63GBxDHYfkJIkEMgq8o5+Klp/DosYSy8fTI7V0A2H4Vo6+8qWGWu
         RfW2nSlV1J2IQQSWR1JSYJwoPPd1Oh6F4EOuhz4b6Rqr1fLOxG1E7DRqirDj68aO2eCO
         ULMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827069; x=1795431869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=de7uWRaoa1siS6iLR0pU/Ia14wz6HbTA+F0jrLsvNd8=;
        b=ilqLBO6s44foBANLCV+4spgKX+kyuzsReIwvk4W4V7AxYmryMF5FF41MmQ1gMo8RKz
         XL0s+kvJqFp/Y7i1n5ygQkxck3dxRNbeT6IdBYCuyfToJui1u1YtJUPVkmVXJjkeM3Ct
         Wrz5QLobecsGLxV5urRianrNiO9mZ4T45ukgJlu7LuDTNqSR23VXlptP4xt410rV4zU/
         Zc8EIaTgtkmxesQMTXdCmKh8ei4Q1d4ZzBIEvWJgnp6xgtZLFLDZA4HY4mBQwYRpasXe
         3vdKll5y37/y/u3Ol86TSPDTjcf6xynT6tCY6Io1KQmAq6RAUWU33kCywf0j0xGF+jjo
         cRFg==
X-Gm-Message-State: APuU4Z8GQ3TH6TX2bhXaDQa7Bc6UqNONrIAi/75zvdPx39FqMLvH+XcA
	P3u2KXOHfimjcHKxJrsMT6WOv5+6cSkmGQLHun632yeSLuc9h9C+5r9R
X-Gm-Gg: AYBFou3xQJtA/piyNq1JVRE6tovkNBMgmMS/5G8S8sjgkg+UC9vRp+IiuhqoyhBXm2e
	10K2QWZT80zg6eYV9kMnnXpb3ZxiNs74SPVKOK0hDWTlyCmpDBms1/8fzH1sHRLAU3Q6OZPUe0d
	GXulqFt1xwFiSfDr8ynLlwNxE5zdpftmN92Jg2zrijvvWyofCIDtpoq9Il+BS3qrEp85wtZR0lE
	7u8OpBBi2ojfqCmwL5c7mS2FccGLeqJaCbid7QX86Uw+9dD0jzevokxrB42tsTm1ZgEe+RRR6T2
	IJRznKBmf7naAVdvRgGNWVGHfog1ezTLLU3l7KTyjbWf2PiIHiw0Cx9sUPoIhBj5ydHCgpy1S8x
	7MRG4RmFY0NeKV7P6DmH8eulqNqOy/3K4S/tK0TCsaC6z5RBp2tzjOv8kS34M1yd/CgmGW0fWOK
	mYOAmSWVaUhF0nCqACdLmYGpyw/yHDtUpOCLNIYtTO9oXkuW2NguvP2UWqG9nZ+6DY4TBI4Oh4H
	QDLSn1vM/ldty7HOzQOciz4HtZ8d4pUCykizz7MIgMMoUCsvvqDXuB/5RotYPLrcxV1rLdzCmeI
	jea8YVEp0/0cBSvMjeqYx0vz0vvqXQRjraipy4jri9b7bdU=
X-Received: by 2002:a05:7022:b881:b0:174:cf1b:235c with SMTP id a92af1059eb24-1b5031b37cfmr9037773c88.43.1794827068735;
        Mon, 16 Nov 2026 03:04:28 -0800 (PST)
Received: from naki-PC.localdomain ([203.175.14.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm42999260c88.9.2026.11.16.03.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:04:28 -0800 (PST)
From: nakixii <nakixii@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Barry Song <baohua@kernel.org>,
	Hugh Dickins <hughd@google.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [RFC PATCH 10/16] mm: memcomp: queue restored large folios for splitting
Date: Mon, 16 Nov 2026 19:01:16 +0800
Message-ID: <20261116110122.309748-11-nakixii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116110122.309748-1-nakixii@gmail.com>
References: <20261116110122.309748-1-nakixii@gmail.com>
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

Register a successfully restored multi-page anonymous folio with the
deferred split queue before installing its PTEs. Keep the existing
single-page, failed-load and rollback paths unchanged.

Signed-off-by: nakixii <nakixii@gmail.com>
---
 mm/memcomp/fault.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/memcomp/fault.h b/mm/memcomp/fault.h
index b83ee7011aedf754173dd90034be3d6d25536414..afdde325c0e5f442868e9354d9abc84ae354bb0a 100644
--- a/mm/memcomp/fault.h
+++ b/mm/memcomp/fault.h
@@ -218,10 +218,12 @@ static inline vm_fault_t mc16_load(struct vm_fault *vmf, bool *locked)
 	folio_add_new_anon_rmap(folio, vma, start_addr, RMAP_EXCLUSIVE);
 	folio_add_lru_vma(folio, vma);
 	folio_ref_add(folio, nr_pages - 1);
-	if (nr_pages > 1)
+	if (nr_pages > 1) {
+		deferred_split_folio(folio, false);
 		set_ptes(vma->vm_mm, start_addr, install_pte, pte, nr_pages);
-	else
+	} else {
 		set_pte_at(vma->vm_mm, vmf->address, vmf->pte, pte);
+	}
 	arch_do_swap_page_nr(vma->vm_mm, vma, start_addr, pte, pte, nr_pages);
 	update_mmu_cache_range(vmf, vma, start_addr, install_pte, nr_pages);
 	folio_unlock(folio);
