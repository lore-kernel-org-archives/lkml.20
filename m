Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278543EC816
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447387; cv=none; b=Adhcc3X0nO3uckNd2A/VAmOsqtiFF02g0HKDSF0WAtSqLUecWN87v8wGJDV062XrE5kNipHAss0Ke5pU1KugEVdNAtJXIevAj8KlZMGF+WRfoRq7dW39EpLoEY4ti4fIoM62563X82a3dPejZ6dO15uq3/KSFe1LTec0wYZy5E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447387; c=relaxed/simple;
	bh=XaEbPPT+UfU0uKbk1r/NwJlftCrBgRCD9xdXr8NWbWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rN3tW6AsD2amrfgf39P6I4PM57Mj0maYyUauNB8Oskl5MtlL4sQ2d31pS2uvi7fqT3lZEh8fwbNzHVzkUfecXj09fmixkYO+D42q5Ao6I5jTp8kRXBSOn2e7Ciga5Q4P9zyF4MS2fi5xV4NyfueY9VWhD6vruaJjq+d11f8mfoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=nevQm/Gt; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="nevQm/Gt"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f4e596e393so4606813a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789447385; x=1790052185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KecuzaS41v7LwLmE55yOH2pgb38r5HWPF0qMCrWrWdM=;
        b=nevQm/GtUSnCLtD4uQDG47IfzExp6G4wl/QBkvQtVEyQBwSsjAtAFim5X7AoNTRJ3e
         bgN9hQ2O3BI31qBsg6aFW9ZuRREaJVB+nZVecPOk3GezD+yk+7e0tgU1EAuZq/PNhZaN
         3+UVAqP/mrfHf7ZakI7lPSpvoCgL+qapf3SXhuo550Fqo6Hz2pAOrjMGG+uR81FPYRnm
         8NKTJucjfRx8Nb1akjZI5okyW41xmKYTPRNuhIe+pheG1d05RUTLfSDqN1J1uv0FxmFg
         7JoBLagVnueieF3RVsWN6h7iMKxOzA16JePf4gyyGrGKAHVcO0rWwWQBFOO1+6vUABml
         +LNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447385; x=1790052185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KecuzaS41v7LwLmE55yOH2pgb38r5HWPF0qMCrWrWdM=;
        b=GFxf7q/vdrUmhzAMrwS9m+LaU3ZABuRs4U9kjQvv5nXI79bzoqrqQ+icY0LHlVL63s
         A09XkmKoYY8slGt8qBMuOBtCYiWiONo9Yy1fznduvpa/TGhGm1Lmvcw7DVjUZVQcDFgC
         0nawHFrWPxoh475Mqe+j0sUjd8/DNyRtKAe6jNrZGarvAAoAF14/3te/pdtafhU5+NU5
         jIZyWcD2b2h2cCUdzh1vTRpKZj02SL83l+/fOhF1bQsXC88q3U3gvH2Pw2GrcSddws4T
         z/VxQEZ3QsdhthtYK8Hklk+8UXDr+BsuFDC6FfxVlNsHquLrlM3ZD/mCDUaWQjvBHYW7
         Iz9A==
X-Forwarded-Encrypted: i=1; AKwUvBySXQv49naYdb9liZnzP5nsVBRmeic6yvNMYssV6jQR+jd8H2vKPaH8+6wtATOKTpZThifrmQT4ntDNsnE=@vger.kernel.org
X-Gm-Message-State: AFuF++luTECqjVEAe1QzVwX8BV7grJzf1+nsjJP8rb6+mVCYhPIXRD4e
	SlCYrLSRKz4/klaJYlYAt1A5sy5KcUxSmPyRaAwik0yE6HW1DYtWg0m2RfctMuL8rg==
X-Gm-Gg: AYBFou3u5hbLb+bGKNE4v+//9ogmB/+GQNJFg79bocBCj7MzgkDLtGPx93j9M3BkAkZ
	cO7iFkleaZZhgmfWtueY4ElnJVULGoyDmtp/IdSWP3BBlMXFJPj9R3kKHkk+GwHVIrkYWmVZpey
	vcStPfDgZmS4rAp6ApeiIBAUqbhmQYoc3FHQ8nK/9jHJ2TWBABQRScgOTCmWmokRiraR1stzBbO
	NqSmfGLz0d6bOrMBb9tNLz1T9PidncZiJAimXawnW8/w/UplPj+jkQ8P+Ru7IItiZ9JdkWf7QiB
	bMgNnoAKZ5xmNMFlUgHTzfUedxHZ6GzkLExjEwOFrhsfzsEt6wyVvDruKuaWOEa4xpZoMScRlN5
	xaXgRynmn2mZix8s73a2TuWBv91CCGfERcGkG5pjHnWAgnRVcZngTpp9S+cIKx9cz6qTrWEFBsz
	/mAdnNCnwvKAwfxsALkPzIY7NWpJkIm1+nyXVkKSQ3EVXatBqSzAgjq9XQpeI0FUmSXq2c1/TH+
	ARbY0CNAdjA+OizowyshbaTdn3qpnvCbWTJvg==
X-Received: by 2002:a05:6820:f013:b0:6c2:e131:6760 with SMTP id 006d021491bc7-6c54214b322mr3376269eaf.3.1789447384973;
        Mon, 14 Sep 2026 21:43:04 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm20750472eec.9.2026.09.14.21.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 21:43:04 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>
Cc: ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+b0f93e29183ce737@bugs.sh,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH] ceph: fix off-by-one NUL termination in decode_encrypted_symlink()
Date: Mon, 14 Sep 2026 21:43:02 -0700
Message-ID: <20260915044302.711802-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

decode_encrypted_symlink() allocates enclen + 1 bytes but writes the NUL
terminator at sym[declen + 1] instead of sym[declen].  A malicious MDS can
report symlink_len == 0 for an encrypted inode, and base64_decode() returns
0 for a zero-length input, so the store lands one byte past a kmalloc(1)
allocation.

Terminate at sym[declen], which is always within the allocation.

  BUG: KASAN: slab-out-of-bounds in ceph_fill_inode (fs/ceph/inode.c:996)
  Write of size 1 at addr ffff888020aad361 by task kworker/0:0/9
  Workqueue: ceph-msgr ceph_con_workfn
  Call Trace:
   kasan_report (mm/kasan/report.c:595)
   ceph_fill_inode (fs/ceph/inode.c:996 fs/ceph/inode.c:1277)
   ceph_fill_trace (fs/ceph/inode.c:1716)
   ceph_con_process_message (net/ceph/messenger.c:1424)
   ceph_con_v1_try_read (net/ceph/messenger_v1.c:1430)
   ceph_con_workfn (net/ceph/messenger.c:1576)
   ...
  The buggy address belongs to the object at ffff888020aad360
   which belongs to the cache kmalloc-8 of size 8
  The buggy address is located 0 bytes to the right of
   allocated 1-byte region [ffff888020aad360, ffff888020aad361)

Fixes: 79f2f6ad878c ("ceph: create symlinks with encrypted and base64-encoded targets")
Reported-by: co+b0f93e29183ce737@bugs.sh
Assisted-by: LLM
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 fs/ceph/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index d52e2b389e0b..79c4409f183e 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -993,7 +993,7 @@ static int decode_encrypted_symlink(struct ceph_mds_client *mdsc,
 		kfree(sym);
 		return -EIO;
 	}
-	sym[declen + 1] = '\0';
+	sym[declen] = '\0';
 	*decsym = sym;
 	return declen;
 }
-- 
2.43.0

