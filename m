Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413922;
	b=2GC+fvhzxg73nDKhvl6aQij3mRYgHjaw80nnH2aiTONzHzY0lpCi3gmpj+b77D2iHHPU
	 UIVqpgEGOeTkj3oTFreYlPTSjBonuTrWXo4w1hUxmjNRE41P+18Lr3JsZhtpIULyB/KWy
	 pe/YQtOeuf0f4PxqY13arWACoeSO4vudpl6pO8qoT3mRJPJpSjIf5CNN5luqMoOggITO0
	 He2v5ykldpYT0btlqiBIhQiqSZa1rq5IcdK5nOQmVr6nNKqxMbpjPRUCTDweHi57bCQF7
	 ppaHd9RXDxzNxaGSVXxiCj4IowHCKlihqxRIvpgS+lprBlLUXmT7yGUulQhDYiGbbKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tl93JRlsuokDAZ/kZAYyC2gobOkeon3ZjeST6XHzX88=;
	b=laUoZH9N49t2SJU2SbIZXw2siDPXFHTkj36QRI2rMJikVBnGwVOSFmeTOKKbBAf8N+yE
	 dM2FxkxhAwUQkSuK6S/K1pJo/mAxr4qvyp0UIlgYw0g/43U1wAjelKAGAgc6viFZFhT0a
	 DaW8ok24TXIbF5kWwKTFw6LMztIgVMzN+9EHNnUFolgGdfp881yg8+UDbXadfPEBXsWT5
	 KCEEVFioM8Huptna5E5sbX9sZJA8xzoNZxQRRMr+v7Ow3hl7vJsEdfdng6xEHAJkTUETJ
	 rcOUGAWBxkNDoWSbjs4MM1IFpzSYqFR+khf/pFRCML2VklQyrdimTntVEtPsLxX2lbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=gKStaRxV;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFAC60A3810
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AFAC60A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=gKStaRxV
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1816098f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794413921; x=1795018721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl93JRlsuokDAZ/kZAYyC2gobOkeon3ZjeST6XHzX88=;
        b=gKStaRxVo5TTjFggIqYp7llrrzPcPl69s/GyATJGxs41sZ0V4cyMGFkBrH/x6LMWlY
         rMSSEiHNHFVmqZ7EpXsGhR1b5yv0ik3kyAcyJ0sMi96QNRuLdLgYYPReEXAuQlx3PEmf
         h70aKddg1nWWkOmUdN27YvD5SaMgRqwov54stAPfpwkyKt34fJoy5Rqvqt5pMkIaSopk
         LDSA6kACTUw+Rh3y+lXxB1tTFrdrF26jVk+DG96N7skf8AB0G7d+m4WGaPUKr78P3n5n
         rMkOwhMggK4QyH8u+UtVAd7OR2aUhZbhfxm5HAjSLf9B5e3hKcMyllDAhs/5vyhytI1F
         lbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413921; x=1795018721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tl93JRlsuokDAZ/kZAYyC2gobOkeon3ZjeST6XHzX88=;
        b=pF9ljJyvEQ+LnqNY6MajSJbcb/Y9zUZtGd5j9ZKilkfW/bHsHbKJN8SmKixE9FK4pq
         9LezX66aTg3cxUGj2FzpxvqKsDbb/DdGzPfLbT+gd/xtgszhn47j6Mt77GpVqiUqrzsG
         4zZcvqIkbhs4YRa7RKCFeQqUAhyv3adx4YowauBBw9iWyZt0dynWX5TlazVC3Mv0NQQS
         93x8uAuJeoeSJk20LDliHZC+VabhDQmgCbOHFGD61259fpjegJ3gAoRoU7k46XA5EB8U
         1UHT4HZMSk/60G7BWKMdcCotiWeOCngDdC3G9BMbFFa5hqt6gDMh1hIxRn5jsddGvG52
         bctA==
X-Forwarded-Encrypted: i=1; AL+hErF6BAEnEUEklFVft2fEJUQDxDOog9wAp9qwepBt0hXun9ddCnoj3s8C3nzKYDBT/bJQou0iGJlTVJzF58U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Esam+2xc8DwNWbKKrrH8joWOjRF3+1wKoV9PtOxt0gjyX4WXp
	G+RuOIH5WvZWNGQTAQVrjAK/efuvM7PACyLAym50AgRiDb3zV7Q3xB9Ux46UNI/g/DI=
X-Gm-Gg: AYBFou0R5boE+THjfSe075sfNufZi0FHZw4u29/Agn0Ti9Q4PsYPmk2Uu/00/P+xF+M
	ucMqf5QmupBw6FjxMdgEolvn0pELxXLlXAYQme9WXK5UrdNHYRmD1l1fnsUdGJ5HHkxN36i/sxV
	NgkFIYBJndWIzTzXz0rTpFNPILZoUR5uzY5AFLAiKZ7LFfGsOJRO8sExwa39vnWx3NrM5Hc+Phr
	LJ2KTah99VTUb44Z2/JUEV9tYB1VvHD+g6f4nrB1UhdnTOkjezcfZykIhxUW+VR5yGPlOBxrX4E
	eI03FVG53o9x/Sx8xkcALN2wolMOmbacik0N4lF8cx4gQWEy6+BCJuQOjjUHzC2ju5bwjNO5T+W
	Tl/SjkSGn2kODfAnnUrugwVvXsAOd1Vwxvl01kSBRtOPDfg714w/U4CU4xY3H3RmrMC7DleexrF
	8/ikM6QfDvdr+8wBw1VIO9cuIzYcjY4/2hQXOd3mXiBXEC31/0XfCvccqXN5A24OCLn83mfjL8x
	PSETZtdRn4XcqC60ZxLyAa0oYOTgpGm4fZZ6O+f2OgQNBfiwjxH0Z2gLOYRE+UIl1eu3DmDS/th
	gSEppp5OmoAj8REGkbf8nCmF+RklLccssbHgHYK4JQNY9XdE9iWmirqXXAEj9Z+fsBo11EYVq3s
	Em5MfB7x8I+zYJIRtwsfYcTr15kC9Ok7ZcG4asHsUZ5nKsDhBRGs=
X-Received: by 2002:a05:6000:4914:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-499c6f8d953mr4709372f8f.42.1794413920839;
        Wed, 11 Nov 2026 08:18:40 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm12209506f8f.28.2026.11.11.08.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:18:40 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: xiubli@redhat.com,
	idryomov@gmail.com,
	amarkuze@redhat.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>,
	stable@vger.kernel.org
Subject: [PATCH 6/9] ceph: fix mdsmap use-after-free in ceph_get_tree() error path
Date: Wed, 11 Nov 2026 17:18:27 +0100
Message-ID: <20261111161830.1336485-7-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111161830.1336485-1-max.kellermann@ionos.com>
References: <20261111161830.1336485-1-max.kellermann@ionos.com>
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

When mounting fails, ceph_get_tree() calls
ceph_mdsmap_is_cluster_available() on mdsc->mdsmap without holding
mdsc->mutex.  The MDS client is still running at that point, and
ceph_mdsc_handle_mdsmap() can replace the mdsmap and free the old one
concurrently, so this can walk freed memory.

Check the map while holding mdsc->mutex.

Fixes: 97820058fb28 ("ceph: check availability of mds cluster on mount after wait timeout")
Cc: stable@vger.kernel.org
Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/super.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ceph/super.c b/fs/ceph/super.c
index 01f92d77ef45..94ff935492e5 100644
--- a/fs/ceph/super.c
+++ b/fs/ceph/super.c
@@ -1364,6 +1364,7 @@ static int ceph_get_tree(struct fs_context *fc)
 	struct dentry *res;
 	int (*compare_super)(struct super_block *, struct fs_context *) =
 		ceph_compare_super;
+	bool available;
 	int err;
 
 	dout("ceph_get_tree\n");
@@ -1429,7 +1430,11 @@ static int ceph_get_tree(struct fs_context *fc)
 	return 0;
 
 out_splat:
-	if (!ceph_mdsmap_is_cluster_available(fsc->mdsc->mdsmap)) {
+	/* ceph_mdsc_handle_mdsmap() replaces and frees the mdsmap */
+	mutex_lock(&fsc->mdsc->mutex);
+	available = ceph_mdsmap_is_cluster_available(fsc->mdsc->mdsmap);
+	mutex_unlock(&fsc->mdsc->mutex);
+	if (!available) {
 		pr_info("No mds server is up or the cluster is laggy\n");
 		err = -EHOSTUNREACH;
 	}
-- 
2.53.0

