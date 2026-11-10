Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320706;
	b=h4u0TZ228YWza5nv0zQZAgiQH+69bBgF61yx82B+8G0g1x4gJwnQ7N6qiCjBaFZ+4dFZ
	 QkyGsepXk+cOUttXFhxEA/n9ERcw33ycwHyQh8N/heKuKkhVAdwNlBcoMrm+0HJU7RUFb
	 trdbgiOsb+u6x0IQfKiGqIGy9fiXjSgZm4akjMGCwZGF+DFsW8I24rxBjxJfe6CPxdS8t
	 1MtCoYSQ7We1u7xuMAFwrOkYv0P+qBREda4y3HLOlH5qRf/hnT4Q2FJCrE5izsCT1H6U5
	 C5j5cFa5g+CPotrnPNxGxX3netGNp8H8L8Z0snaFxysbPtdhd2z7Y3ROBD4DIYi1s9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fsgc145zwHET8lvApLf2hA0PKAQBWP1kvOH0cyQnSe8=;
	b=3hNAveyEQpaIOaCkHA5/ypIAKyK8LdoYKys3cWMH0OFwJqdJ4+94NKZ/oDMs8I9YYvro
	 eNQO6xc5y6E4l6oOT840IdVzfeTzSXBS7nTgku4WV77gBbbJ/TRnojTBNF4uNGtxkKh1c
	 ubSkM/qrvVYWEpmIdUU5L6LW6DCvOkzn0MKxbe7z1zWzJ3/veIpFszOVyeh/5KpemY1qx
	 jFudqXaQ8caEA9s2It+w+EQqzmRFPDqPR/wMakt0tj/DgWyuQpGF/opbqSY1wdUanJTq7
	 i6hT13pkNO+qpvy/7hFKlZRYqdeiweA3USOGIUHz2uJaNiN7V40yGSdRS0xiB7vfSFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=KZ4ymSmw;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEDE60A260E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDEDE60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=KZ4ymSmw
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ebec7d5dcso16207436d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794320705; x=1794925505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsgc145zwHET8lvApLf2hA0PKAQBWP1kvOH0cyQnSe8=;
        b=KZ4ymSmwGQcTSEAG9tjuCzWtnNUBwSexP7mH4b7HisT1MmvhMnZkOsziIulTO8Zf3G
         pOAj8szA8/crd1BpkZnk4l7YKy1uaAaXtqsuCS6x2h2EVq2A6voMlZaZr/HuDPczmxEM
         e1J9Tp2fBo/7qkEOh0jXe345pHG+Qs3yL9m5y/SQUPLP2SMHajDlBC5OgVkAb3V0a1I4
         zwJMbbTKC3dTad5Cz267m2JvbO+C3FJmLz7UP8CHNCi7DCtNmfYtZ8byKNEPT2F9lxix
         QYd6KYHJ+qHhlAkSwLgp2vNVyBpg2+FQb1328ZtZaLXxO1mXZ+LX4+JHO2zjlFM4i3I5
         qrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320705; x=1794925505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsgc145zwHET8lvApLf2hA0PKAQBWP1kvOH0cyQnSe8=;
        b=wKHV7j7gPlSVI7qZcKG43ubI2uafQX4TyO72AB5FrFG/ROlcyOD0KJnm8EPhWuhL9t
         kAZ+TIfbzpwl1HtmscyV/s8IZfXDLauZ9druJ5oL+7MDRqiHCdTFroF1Y1NCuNJfDqiO
         kQNOI8Ncv7AHUdJWYwrqmB2VvVZa6PBivibmcH/W4+GoYw+O/mSPqiobzpa5BnOMaVwT
         mBxRhsUpiH+SFkmwrym+xMBYeVySaybXCnz6seOn/6BsQgH6IKwoB07Vbc8qNew6cnZR
         l2r+X48EWUp6BKSP2fBj0eru97dDVaSqyjrBuF265YPleaSnT0zA+h2Hl4ImyZl+/ScS
         H/zw==
X-Forwarded-Encrypted: i=1; AL+hErHqvv5O9yBx98u+1k6dBLWZ6FtxIGIIptH2bxnr7qU4t4mqyLQcJ/xYoO+BLV46xyHBQ44V1EXnQNsljYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PIxFwf1aNdsg7LQ7HWHA9bUgmg0c2zg/g43W09vS3ITJ8O4iv
	6HwLVmL1r2aNvOdB3C9oyX+YdY8yRy8LkLDWHCWY5TofeqN8CwyKnX7m8a5vopz5L3M=
X-Gm-Gg: AYBFou3ttsmpRX1HkuU007Sbx+oHGO6GhgTKprsqcbEQFQG1Rbf+yn2u8bZd+Y4Rpff
	yfULs3ZbUskd0eYYkJ4c9kziOcHfjqMl/elVq6o1U47+JFW2nQ4Bqg5DkAMrkI82ZQCw64/ud+q
	6QfD+eKrVRItRBj729O/To8rx8jh5Ih9F7YRcEHFsoTzL9uDGENC7NHTeKG5+x0fD6Ma0HfaiOD
	vyTyFI1a6rDpz7LOlVgoa946CTjXvhd0hS4BALLXmSnfXBwpgjAgui1M23XluuXI6+ZDcrg1w4o
	UbCMF1aXGq0p9WOVNlF2YjczQWa/TN2xZqPacDcJCds30zwZVDTpOhuZjacftJ+Bqqqa+tuG5PR
	u3kPXfL1YdYN0uRQYFEUdVn2gkSPZ3o5EwZu7pWyrmsifKBADTRU/0Xut19UxQVF5xBvsIjWsEr
	kV3Ng7VuomiXtIK354W398Mz6nYWjFRZb+pmX8MV+5BsdadMGEyrWGjRu8WbtM7GXRWtQxsK84w
	GIckpmTr7Btw7SbRc9+prbA8+8uw2Hz3VZlkX013pEK0MIsU158+CD7ZZqqM6X6SWvrMPFBRLOv
	9RF1ffHWDkdAl3eSqA1TBu74nV81gGiP0/uvTuZN+z6ItA==
X-Received: by 2002:a05:6214:1d0c:b0:91e:b7fd:b35f with SMTP id 6a1803df08f44-91eef8e19d0mr46530126d6.30.1794320704691;
        Tue, 10 Nov 2026 06:25:04 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04fb5c9sm22263976d6.24.2026.11.10.06.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:25:04 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 10 Nov 2026 14:24:51 +0000
Subject: [PATCH v6 3/9] ovl: setup overlayfs' private bdi
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-b4-ovl-containerized-sync-v6-3-43d1be16a4d6@toxicpanda.com>
References: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
In-Reply-To: <20261110-b4-ovl-containerized-sync-v6-0-43d1be16a4d6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794320698; l=1000;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=oigsy1vUIPeqGe01IWwnaOrpAKAk76udNuQNtC58Mj4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM6Qi2Z/vttC+ismRUqZpKJCnEVi+EA1CDQav1wZ91mZcSHpYI4N/AGPLItarZUhdimNLf1Xgkv
 0yxrYcudV1gQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <charliecgxu@tencent.com>

Setup overlayfs' private bdi so that we can collect
overlayfs' own dirty inodes.

Signed-off-by: Chengguang Xu <charliecgxu@tencent.com>
[josef: only for an overlay that tracks dirty inodes]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 81da70fd53a6..22a8d4eb3b7c 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1490,6 +1490,16 @@ static int ovl_fill_super_creds(struct fs_context *fc, struct super_block *sb)
 		if (!ofs->workdir)
 			sb->s_flags |= SB_RDONLY;
 
+		/*
+		 * Dirty overlay inodes go on the lists of this bdi.  fsync_mode
+		 * is final once ovl_get_workdir() has returned.
+		 */
+		if (ovl_tracks_dirty(ofs)) {
+			err = super_setup_bdi(sb);
+			if (err)
+				return err;
+		}
+
 		sb->s_stack_depth = upper_sb->s_stack_depth;
 		sb->s_time_gran = upper_sb->s_time_gran;
 	}

-- 
2.55.0

