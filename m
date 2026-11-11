Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356665;
	b=gZv4VCuHjjUiwpe28XpG+Jf6Y7nF+2sfKa4JsXEsDrcrUrv47kpiFIk39za6WCbop/gi
	 n9TlO1zDI3uScU7Jytoxs3mBpZ0TOTSvwPOJeMzDaNttfF+xUD2ld4hPSDeu8SbMZMkXb
	 pDAC2iw+qKcbp1OcVODIAYEfFBRtvHOiuH0VXV89ZMIg9NxtnXqSsU0WtztRfnX7YUcTN
	 bO1+KqhWk/G42aaJnXvG1Qm3FtHx0lZKFvMFoCGe8g8cwlxmECcQc5Ae4MkGmRt3mnFq4
	 29ON8sQASAPi7jEeqfBP/lZE6FUowubE8q1JBiiMJf+nJ6ACnf9mXb4+ioKtKOZDtuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WlJZl+UE9pf/QC95ZJSnwsGYNSdLtTHc9yxgINOhNxY=;
	b=nkJzuItGXq6KmCY7tzN6OIX/rm1AKVfrfivCgsHxOQYEe9NC8v1RQhXL+MIb9Iubkrs9
	 6YUMSr99dwbQ3EaHwNO7t7bAqVUGh9g3JjV4xuGKM6TWb6sW1h62Pyj74QFLcwUiKSV0P
	 5J7mHFEJtDbhji+zOHBUl9iSta3/q9wBo+P6e1vLLg6PVCwo5nU+yXVOuzsV+CMZIhskL
	 zB1ysYB5OFmErh6KYcXxkT6VgX6xooIrPcaRwe2GT2vBRxluXOE6/r0bHWhjPDXPG1YAN
	 E9sh+dgIXA+xR5atPsrk3X2TBimfsR5E7EjrhYMNpWaqNw89RBQIKfaY041MVNvrAoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p85Su7jF;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685060A6F71
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4685060A6F71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p85Su7jF
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46a5954cdfcso2511295fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356664; x=1794961464; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WlJZl+UE9pf/QC95ZJSnwsGYNSdLtTHc9yxgINOhNxY=;
        b=p85Su7jFZ6yoicaYSLsRSAUeStCdDIVjHpc8l0nMwF1Ga2T8cUkPWsoJhSidQozccT
         9VfXHPEtDI+1iyAC5elG5TMivCYmn/zpSdGvYvxM46wmdTvdSEUitNmah2oX4ar24CC2
         iB4Nz7mOBnt70VOO3pxN8KGmB/JxloUHuWixW0af1AFirnKsKvWJ1ggy+PzQ5ELEVLL/
         +IkuOFmzp3MdFUCpETF1CGtgebDAePa68se8EZkBlrdzbhO03pFt8nSBf+V+Cp74MgdW
         Ki9Lirbeoc/TrbLX7SPh3xr7HDi6+NUK5280gQCgIbfzppffKHToco4m1uSGZ2nqW5Me
         y7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356664; x=1794961464;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WlJZl+UE9pf/QC95ZJSnwsGYNSdLtTHc9yxgINOhNxY=;
        b=q1myDFYAcSE0kwqY5Tvtlp/nj1SHf5vuxLz6CcVePR7zGrqXde1ppAQpO1BwMPewu8
         5BIjyRu29XfviT7F+WoKkxoKnVkrvBZCe0r9R4OqfIuqPzb5ld4Btvrf3w4Pq0ziS3n9
         YJ7lMemLcCHtqkl0Wnvs9XCp1bwvDFwFbLDyXwhiKmAPCPQ2Iwwi2H1YAABzEVPsn5M7
         J5zbNtq1Bxy5Sl5Z5Lb3lD1yKcM5Yu67Q/Vnie6Azsxc+8RLN87OhcSU4ViMWA3G1TXB
         M9NPqOicTm1kl3O8wK4NHes2z29ZweI0B+63wpzJj3+Ez5aErCLasoe9WW1/CN8htzg8
         h9kA==
X-Forwarded-Encrypted: i=1; AL+hErG/7Db/U2c6Jz8z2LTazoUxIKjib5uEMcTQ5fPaGlj1f+NRKRBPiDHa3GL2D9DyZVoPJIgk3aJZjTBoeAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yIEOA/DvyCb+kCjJkWwmMHv55cf4VyionSo4RAFHjXyJhAqV/
	lzmSBFYDFtZforHKiUIUyEZslxs5gJSTMOESQqU0GFQ23j0v6YFzor8ChXWZCP+CrXEHyEiqTdv
	j8Hz6YtqpOKaJsQ==
X-Received: from iovs14.prod.google.com ([2002:a05:6602:2bce:b0:9c7:8645:9285])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a01:b0:540:5827:6d8a with SMTP id 5614622812f47-56b98d23beemr555789b6e.66.1794356663846;
 Tue, 10 Nov 2026 16:24:23 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:51 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-14-dmatlack@google.com>
Subject: [PATCH v4 13/19] mm/shmem_luo: Allow preserving tmpfs files
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow preserving files on tmpfs mounts by dropping the link count check
from shmem_luo_can_preserve(). The check was meant to limit preservation
to memfds, which never have links. It isn't needed anymore, since tmpfs
files are now retrieved into a file on a tmpfs mount.

Userspace can keep using a linked file by its path until the Live
Update. The path of the file isn't preserved. Userspace creates the file
to retrieve it into, and can then link that file at the path it wants.

Preserving a linked file affects everyone who opens it by its path,
since its size is frozen while it is preserved. The permission check
added by "mm/shmem_luo: Require permission to preserve a file" covers
that: Callers need permission to write to the file, or must own it if
its size can't change anyway.

Signed-off-by: David Matlack <dmatlack@google.com>
Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/shmem_luo.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/shmem_luo.c b/mm/shmem_luo.c
index 7242664ee4ae..94d617b15489 100644
--- a/mm/shmem_luo.c
+++ b/mm/shmem_luo.c
@@ -757,9 +757,7 @@ static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
 static bool shmem_luo_can_preserve(struct liveupdate_file_handler *handler,
 				   struct file *file)
 {
-	struct inode *inode = file_inode(file);
-
-	return shmem_file(file) && !inode->i_nlink;
+	return shmem_file(file);
 }
 
 static unsigned long shmem_luo_get_id(struct file *file)
-- 
2.56.0.542.g3ef89b7020-goog

