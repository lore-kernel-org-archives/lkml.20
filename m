Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079192;
	b=h1pBnha7LJxbn1eAAgabsJie3N/1aLJbLFqBAUvuqPdm4z5fZTjXoxkr1wA3CBNpktEM
	 Eerqj6j6WqOM3yfJuVL0SGO6uwqc4Xt+mnv8s0bM96wBRqXiu/01RKpLtIli5p5cqWnkB
	 oH18Tc3yIaXK5UOcaeOL+UQcYNPy1eB336uHYNJZcxCAtlYQvlXRNV7r4sHd2Zj2+cHel
	 SryLKwbUvC1ruE8YU99uAyXRYDXuDf39EnbeXh64OkcDh1+3pwHKRQxxWtHaMTY36sRQO
	 4LwcVdWFUgv0L2UFCwOQa6N+Of5g1L6Iq7F5PNQKBSkFopOo9HG5YkjrH8TuAGY7BWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fsgc145zwHET8lvApLf2hA0PKAQBWP1kvOH0cyQnSe8=;
	b=xcpyFjHePvykNHMJEOtCjdj1tMpAh733Ezr6IIMxBhUF8ViNftoPFL5dUXhlUpjLeqne
	 y6TUIbEzN+rS4n55cLKOrI8l0tbFT0JtMA752NOOy4f6rfNzet60c++JP+PUKgwRIPpkp
	 BEAOIWmX8zvpXky+FXjdrZ8DMuSG67gVFWRbnODfz9nuIEJ0F3+6w8Mt2wUkCM4HKcaKn
	 8hMLCleP9PFHCQwMv+x+MCvx/gN86bh/q3tq7PFPEiAyPmDSYuj1QPd7fN6kSZUZZi8/O
	 kINVd0+4ZsqLFTydOEJoLHkRUWsoQwELBq6f/+pKZdE0Z/VPTVflGGPcQ344q2gy0KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Z7Cak0sV;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C268606A338
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C268606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Z7Cak0sV
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93e635220b4so177660485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1794079191; x=1794683991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsgc145zwHET8lvApLf2hA0PKAQBWP1kvOH0cyQnSe8=;
        b=Z7Cak0sVPYDVlTVtWN6Ehc8TdfydtFdbYV4fK9sTpR2rgLokdojTHPgr16ezty/AHS
         5ILzEEg9zIYy+0nMbgQp+dbEsix9RGwRbf+h4pEaCkb3kktB4kWnOQ+UrbC4D3jTy1jX
         wpy5kJ60tBqsYp465NuMSi4DM6ZZDLrW6T8RMR3mHchkAOK8Wn3ii/uHY4vdhi8Xo2Y9
         TlIkdID1id2sUJ2gCsyVWLRKdtbQaM5OfC5UhEcHI9WWx30KdBM5qUZHbbLXwK8Pp5JR
         MZqJw20C0b9Nzx4R/o+sVSZGqk5bjnKvD5zACVQCxYYLPVOPW2loSY6novsLpgTHTt1c
         HuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079191; x=1794683991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsgc145zwHET8lvApLf2hA0PKAQBWP1kvOH0cyQnSe8=;
        b=F+zxBrHfH+yFNY4oa/qONA1Hx4omancsB1Ee8G11nAVJnwwyWggdrPoYxPvax/L/94
         97SKjfs4JU1iv3xtWfx12hydgZrG/RIbuphOnitV2FamwlTYI6sOZPvQV72ZXpcCQUgV
         8XsiKw41RGj79KIuDPN8eYhqwmRcEjYeQTwaCU/gxAwpV8UtVvbdp9qiQdm3X7TXtYQ4
         NpUm/BIA31E5WcP0LK3iCnJEIq98ZaYYnTXFjkcQI8PM5J0RacAqQ7VvAyqTiGuwxqP4
         R1b1j/tMtuQGnP3AxYDcUtmSK6iddnk9dUAGwJZOuVwLtWvvBgE6oe9kBUBDfO/vJTkL
         zQMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2gldrbM0aBaEKOa8FPJ70fMpi/jC7iKPXmvU6VSvZ6ZZpjLJkSfj0d1npCTxFBZTCkIa0768yPa3IHY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r/OtVG+tPx8R/fzV19ii7kYGyNqAVlkWmWr5hIt87Ah5dJBXm
	aAOXT+F98v0CsFGDySM+KQZriDTiZpliDtueUeUfDUapfEYW3ViPxK3r50zcJpGrEKc=
X-Gm-Gg: AYBFou0uAp35dFXRatJnLAozEyKfBbOhmdKHGeVxHzvKiY+2Gn532OjqGYrDtKNS9DF
	gO2k9TgXrPV114+jpuMG+TOsLGlwAgyQ4BVpAkfNO71OXyRkzs3qnlStazUApo5ldwXnUF8Wdb6
	yRVJah2aKOM4Z9vdevKkrQ9o9FhpAZ41RVkclKmJ2bt0rppB2u6yc7ZW8ZxncJhvbHONZmjvh9j
	VoRJvIhnQnpUGXcmoE3hDUK+K8XscHa10h74rU1ay56lTQv9kQJY0mvUT1rlfwhRYMu5zDaN7cB
	PMqALUap4VtfLL73BOvCWY/oY5ATAJ0iJ0YjVjwEHHYYGbZvTbQsm5QqXCq+MJgUY7Pp1KTeDn1
	V+1dn6migsKyF401G8SlJapYvkgjmxNqpTx5jd1u0WURITyVXpnJzLR9XebLcT4XpASLSplFP7H
	cSX/ktjDziMlOGF/jWho726mtlvyBnkRKbz1Q4cGkdwABba+4qfIoW6Xw/gR+7EaclqS+eqJmMa
	EyynQOp6Xe05SaF+zx2WDgTqKN/5KvTGzRChB3bnJ9cxtu6ZGaxs9N4EaZB15EQ7E8MnTMbKFmp
	vSWhcqzYr4Rg7ACb7kqk0lFfX5/GPaik5r0TzYk6pTyAgFWjAdq2wNg8YvH4kMu5UeQ=
X-Received: by 2002:a05:620a:4156:b0:93e:646c:9133 with SMTP id af79cd13be357-945f35bfe65mr1012265885a.64.1794079191223;
        Sat, 07 Nov 2026 11:19:51 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782daa389sm2934085a.26.2026.11.07.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:19:50 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Sat, 07 Nov 2026 19:19:32 +0000
Subject: [PATCH v5 3/8] ovl: setup overlayfs' private bdi
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
Message-Id: <20261107-b4-ovl-containerized-sync-v5-3-d34b4ae57fdf@toxicpanda.com>
References: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
In-Reply-To: <20261107-b4-ovl-containerized-sync-v5-0-d34b4ae57fdf@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1794079181; l=1000;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=oigsy1vUIPeqGe01IWwnaOrpAKAk76udNuQNtC58Mj4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNI/mI7OdiJcEaP0mvnF4I92ol6HamcTIv5i6f7c4gVJLbFmOBMSe1XrqWUH4y/1LsDC0DWIHi8
 /QqJSQz9ABAE=
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

