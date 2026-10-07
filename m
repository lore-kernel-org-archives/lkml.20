Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C848422C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364319; cv=none; b=bBTbg5uv5dVpF1egATbCOrM6wQTozgKZSht6ry3l5Td9o9W6vftUBD7mRtbPbhP2ulh2H/izB8c5gWXM74fXYYcCFvLvpDlUmG0JfflclePbte+yXlVeLtRR/4hVA5vjfLzfjRkiUU/5R+10HxBAnyBgwcOQA9ewaxZDoARthHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364319; c=relaxed/simple;
	bh=98nEAcT23Pwhe+6Ltvx1hRH911j5IshnPDQKJ0/lQCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdV3hoO2W7J8oUFcn1s/GlYtD5Y9KBweN1u1fX5EOt7PAbuvfQaeWPml6Ub24sFEawP1cBP7zV0ZYlEpvOJL2QkHMAvNM2Mnl6hp8948Yon35L+hwLU3BfV+OKwgD+NwD3Xy4XcS7ymFYIgC4aBTEo2TAQBV4+JzzGTFQOQAOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSO7+6W2; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSO7+6W2"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so1401406c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364027; x=1791968827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2eXEVtdk6q//d2bGfSFjGQVcCv0Jpcj21oh/jRiX0+I=;
        b=lSO7+6W2QWYUm0G7klsF45em4O8S4pWZrym7hfTPygrMvvsKq3cUuwfFNSHTqDqJw6
         nqNjmNY6QK5ilORftPAhq+5AdUCl20AbqwvR7gkroVwmI9XsSVroKAAVAIZ/2Hl8IDHz
         5N5houd7GUOUE8Jpn9pAVPRb7EUURRpwhJHrdR0PJGgoWjt3lV1knD6lHSouj6j/RPF6
         67sZckEKgbl1yCwGd8rpx1ZfgOSdgjfJ3udAtA7yc5wrUGVsezsJ+GNhbd9AATOC0E0E
         T2Ajc98RU/k8KGO0fVgnyso8rL/wFDV9s/SkupaCP/1Yl6tJC4TGXHPnLSweqks2of7s
         KhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364027; x=1791968827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eXEVtdk6q//d2bGfSFjGQVcCv0Jpcj21oh/jRiX0+I=;
        b=l5UFhUGMtwZ9L94646OYY6crfJsItQy7j1xGemYUfr3QMS2w9KziYeiXyg92UEaXm4
         K1ZeSqQplLIbG7Q20++J4kacKOW1Jij/VYw2/FSj9jdkSHVj1cNPZqnv/RKWjZNdjHhJ
         Uza/b0/cKvto80rX9kR3fhqQ3WT/5uDFcl1Ff5E8oOgL9wNlj3eGIelytWfYRz95vGvq
         yf0fEdkl1d+it33lrgXKD2ieYvockGuwppZ2mJ4VhM/bUdz6rbKG7STpGe5v9cFZdedc
         gmJ8EuLGxp0PQfzIpqYw9FOjgl32JPEf0O8MYmB9KNtxjdC8ftV9YprM58ysU4aHHAbW
         Zuuw==
X-Forwarded-Encrypted: i=1; AKwUvBx49igehunZJWUbF0IPZ3u56muNdXuFFYF7DZhtNnG6ekIBvjrxWmHM38emgojcLKHWoOfC4NyjJ9PjtzA=@vger.kernel.org
X-Gm-Message-State: AFuF++nUVoKOnuWnJOdt6JyWljWXkXs8FzN+ecL7JHc5fCr+4YmVyz2j
	ojIZylMoebPQeHLIfqSH0uHgUTIHxJtToXyFkFkFBN9VkcoTFvsetjrS
X-Gm-Gg: AYBFou2MBn4EVTOkmaL5soy1btKy8IoPAASdDNlQDMBSWb5R3b5N98pPwzJesBnXlIL
	H6AcgsMEmjmTOI5T6KbkWYo5ghURV+M2vr3VKAqSLWv+fzHZA4U7F+SK3XIo3x+8U+G8olXiKL3
	Sy3IJnna+9WDo9y3FroFalh3r4bwgY/WxxnG7hd0JNHIHf5+wlh3DaAjViaLAJSuuyLfD0nx+tn
	pHg6M6ku6HrX1y3ewQbhYcEft6r0IdTYRQCUvQv/fLm+uyeC4EkNkqRLXiSz1E5mxKfWYCYUTFM
	QVEBtqr7BTRpbhKfLEN9tOBzlDSd0cYHxaOuy/wl2g2JmS5OKh2SqrFIqKfZ/CrRYxdk04s1yhP
	s+EhYQ/OV+G7WNUFZ2aYUBd+5Ord3d7EzmeYxg/E6vj7YNd2nhi+SWcT1p4guklPP2dwHyeJAGd
	phscBAHW82iQK7SPxTtAK/KToObPELGb7Vg81PJYaiC/MDwXxWzTa8FS8SKCHDCj8lyQovd5seg
	x5JnnrbkGoY2DMjkg==
X-Received: by 2002:a05:7022:7e09:b0:144:eb46:be0 with SMTP id a92af1059eb24-16204a7fe7dmr2141821c88.13.1791364026626;
        Wed, 07 Oct 2026 02:07:06 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:b72a:73d0:d61a:b984])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16168f62a5esm5470119c88.14.2026.10.07.02.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:07:06 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: dsterba@suse.com
Cc: mason@kernel.org,
	wqu@suse.com,
	fdmanana@suse.com,
	shuah@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
Subject: [PATCH] btrfs: fix use-after-free on quota enable allocation failure
Date: Wed,  7 Oct 2026 14:36:56 +0530
Message-ID: <20261007090656.20609-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

The quota root remains on the transaction's dirty root list when
kzalloc_obj() fails and btrfs_quota_enable() releases it without
aborting the transaction. Later add_root_to_dirty_list() then accesses
the freed dirty_list, causing a slab-use-after-free.

Abort the transaction on allocation failure to clean up the dirty
root before releasing the quota root.

Reported-by: syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=947286c775f432b073a8
Fixes: 8d54518b5e52 ("btrfs: qgroup: pre-allocate btrfs_qgroup to reduce GFP_ATOMIC usage")
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
 fs/btrfs/qgroup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
index f68b696b4bf7..42be06675c90 100644
--- a/fs/btrfs/qgroup.c
+++ b/fs/btrfs/qgroup.c
@@ -1204,6 +1204,7 @@ int btrfs_quota_enable(struct btrfs_fs_info *fs_info,
 	prealloc = kzalloc_obj(*prealloc, GFP_NOFS);
 	if (!prealloc) {
 		ret = -ENOMEM;
+		btrfs_abort_transaction(trans, ret);
 		goto out_free_path;
 	}
 	qgroup = add_qgroup_rb(fs_info, prealloc, BTRFS_FS_TREE_OBJECTID);
-- 
2.43.0

