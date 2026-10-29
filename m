Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311900;
	b=WTw9ZH4VM85Wss0G0gbVJNIpt6lAPJ0/YCXezZCXkWfTnntFXMm1UkEcbq1yN1NHS2zz
	 1MQGt78UtVSWdJ8BeziF4RSt+dTZxeX43sZ7KGHaRpVu2kV1UjlQHKnp3Uuvt3M8BgZgq
	 JKy2ZRMoX6eqGIBzjvX4nrjuZx5+5b50zKBdBWsmrABXXJJjFC2jzhUZTNZ8WpGAbf2jM
	 SsyWZ1d9g/UGA7VnvFMpjW5TXDa2P6gYW/SxniAYAQlthhVkF+QBVKhmSdRxWp2JCskqU
	 g6NwORDA7JpMS7xJogxtrbdsZUkgVkZiN35Cbbwj/4bs2cISVNQ0dQn6BryKuM/cF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5jNtZbHxCXS7Amya3dC3EE3s6XNWDFBG2KE54hDksKQ=;
	b=gd0WjTpBElcTKK+Yu9/qAwTYL+/Ca761xktGBWqHZp3x6Q53KMw4EbhS3S6pkERTQzVY
	 oAdXXdJ34S6LGmfb9qCyJnKgU/SzykB/AwOgGTzEab1/+R5lnS6Uk4XZm6PVh3O3OFGly
	 4hKr/TOnQv0ukQzx4nnUR0R79IRqScZ9p9k1iOjV5RxCRidArOH3tfEIowKi4lPluaqdN
	 pUvyAVmYZBsn3gsmZWLzT8Xfj8miVkCI+YDomVPD9Gv+N+WA9L9ZCc2pig4Q3X8Vis/IZ
	 jo0ujMvOzPxjUWlhg/6CKqsEgDfU/RfD8NeQo1l39HOwglwlBqJwQLXAUqJIJcfgv+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoZdQbsF;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9D6606A323
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A9D6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoZdQbsF
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso438405e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311898; x=1793916698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jNtZbHxCXS7Amya3dC3EE3s6XNWDFBG2KE54hDksKQ=;
        b=JoZdQbsFVWPXIont+c9qQKJKUugHbIIPKhgkwvBEeX1Nrf1kAPMM01K3WqnfJfFwv6
         syCiNUQV6b4DoGN2IcVUiCe4uPUuCZtMejWSVcZH01CGV2nMY3fAI6LHuJTMva71O+nu
         DPMEXHTLobv6RcZuqJ8+UE4PhEectz/1LncuIXpwIxzexKN3EV32aWzq9X+reDQSMIPP
         AwJRc8Vv42P4Zewsst/0OHNwogxY1e5rDTQ3ZgX8tpjVRIhL/+4czp8Elh/Uz0o+R6J6
         Fz0i8E7ouEoc2GK8Rzm7FNpRNzKALZHZyuEP8BHrJXgdJdG4HoS8w936F2H4LAzZ450O
         +16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311898; x=1793916698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5jNtZbHxCXS7Amya3dC3EE3s6XNWDFBG2KE54hDksKQ=;
        b=UQeMjAuGJfRpCuujE0ddfprLg3mZiTZtZWfVqTAvKXvFHDH3UVc4B+F0ISppd5mrpz
         nfeiCRQ8wN+/DOQIghKZlqYjKbw5UZxOp098JBSkIFTYiwhvJR998PGFru9pVnYhAK8u
         AVRgMagoMSLgd4HG6IyWhbgRfk5oncXDLp9l6X24CIYmwZXe3wTd0eM16+7swjZ72Pzd
         Y6vrsRZaPHTDCZpEI36+YNfDFUVy6fUlQQuiWyV4I4Q1s9dR+A+ZsKJzjcn5nhTo6Smq
         JWNTrv1vlnmD/g7PhkV7McdmWBRzKWDSMhkWI8Yha/XKbNjvZ3Jh/KkUeu7Me7bb2yWI
         ptMw==
X-Forwarded-Encrypted: i=1; AKwUvByriHJD6KI+i5xfTtAOV5RFrjQHrp1jKXPICVHPs/cFDmbkVJMLAkDVla0WTcIf6NzYe6nYmJ30VPByp3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbKVsY9N2b6k1cAHM7Qu6MroVVPDDmW/ASv7JjPfu4sbckLm+l
	Lyl2xM7RkOUKKCU6cV1WsLuRfcXVRkyFd5L0XvUvHjs1zswV07LOayzn
X-Gm-Gg: AYBFou0RuUpdNV4tkun+4/NNihqK5GC6jK2k50AOu9A38QCHiiksQkEw0nbZIAVH5aE
	xB++kneAclf4xzfaQJd1ni3ND9XvoHz+ZifjAC9JZ/G15hixzBFgrOEOXNIorP99SNHiK7cQyg6
	tpVe5WDL6RbpZGu37X2SMBNk4SYEgMOKC7KKtz6gPQ9UHaKSU0oIn3pfGEjGGsOlGogHVPvYLsd
	UUtnpO+bB6GL7sXzVEaVqE5UzzyH9CE1q2WicJZP4XMZOAZ49ryhvi/YGp8XPWPZv+GOy/qvmnu
	HuXFhKKNo+/Pju02LOrUscxsErD3jfN5g+zyoCZ0DGr7AS4ZeVOaLiLwNrbkqAN6rt4dVesVXTD
	97d8nF3kjxYlYlmfThuwAttCZdOUlwpfoqX3MZNRqwQB82P75pgoUfT+bkVJREoWHAfO9T4SZ5+
	pd3rxTxXP7/dleNqDeozEX/CAzv8fov0IGvbmqixHYHEr7bk4O82PdHV/o/BjzN8C2fvc3wvZki
	JnaT6nh5fmsn0I97fD749A+BXZSkMdUrQMZX1C2097tL+aaYFPw1mMItTsyOZDhr2naY8RXWJ5X
	Hi6S1bFtkT3mVw==
X-Received: by 2002:a05:600c:46ce:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4ac189928e9mr7162435e9.29.1793311898530;
        Thu, 29 Oct 2026 15:11:38 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm104011305e9.10.2026.10.29.15.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:11:38 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Thu, 29 Oct 2026 23:11:01 +0100
Message-ID: <20261029221129.89068-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261029221129.89068-1-azpijr@gmail.com>
References: <20261029221129.89068-1-azpijr@gmail.com>
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

mfill_atomic_hugetlb() drops its locks to copy the source page with page
faults enabled and then looks the VMA up again. The retry doesn't check
that the VMA is still registered for WP, so if the range is re-registered
without WP in that window, a UFFDIO_COPY_MODE_WP copy installs a uffd-wp
PTE in a VMA without VM_UFFD_WP. That is one of the leftover uffd bits
hugetlb_fault() has to tolerate.

The non-hugetlb retry goes through mfill_get_vma() again and fails with
-EINVAL. Do the same check in the hugetlb retry.

Fixes: 6041c6917903 ("mm/hugetlb: take care of UFFDIO_COPY_MODE_WP")
Cc: stable@vger.kernel.org
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/userfaultfd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 3b71712edab4..a70ecfc8a998 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -810,6 +810,10 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 		if (vma_hpagesize != vma_kernel_pagesize(dst_vma))
 			goto out_unlock_vma;
 
+		/* The range may have been re-registered without WP meanwhile. */
+		if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP))
+			goto out_unlock_vma;
+
 		/*
 		 * If memory mappings are changing because of non-cooperative
 		 * operation (e.g. mremap) running in parallel, bail out and
-- 
2.55.0

