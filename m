Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273B639B49E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789620232; cv=none; b=ubM1DBZ3vMWLKyJcs9qDkKmtgRwLeoC3bKMAUuFlWHqACpOZ6EnF2JeKZEVHfYwFiBOgKowjA4epFRJUQ2aDhrO25xmZBp+PH/i4kKDBWt8Q8g+K25vsWUCgQJj4dH/bNiWZhzxx81SlpxRZwqDysOvNV9J9OKuQnz0cFvPhXF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789620232; c=relaxed/simple;
	bh=bvxNinmhhArVjCNyHtBoEX2+g0Xz/lQjyb7Hd/sVE8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VE1tUaOe8l83fLLUGcmf8j6Sb9i+lufYwDRX3+4isP7UTPgLhI4OYd5YGSAYf4Dm09BdwLJM85BzdOtx1N8yuNQMCKDdyOOYz+7G42QRBJDru4NQPVzYkidxmLTMnAOCErodTr9R034iXp0CmbgDQuRbcBTRuVVmsUeGXjz7GrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7R7fXMo; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7R7fXMo"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso368012a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789620230; x=1790225030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=adrTALwJCdcmS4nJH3ZIST48L5iXRSGsY1/xx0Jbnik=;
        b=R7R7fXMoUUKi3MBE8SCzPrJ2GG+XxmRDvJpQv7DfRtmVLWfYlWZO8W7ap+Bhqk+caK
         fRjhAU7JSaQLQJSGzLtLTldHV1kSGrPJxbDN8ACwPA3pRtPc5fw0vH3H23LizOvegohe
         H1JN4ReDkQoRGyAE0RIwIhRogbMPYaSAoKrray7ma2tvuY6pL/P+NQiSrFfQGG2/mOYW
         HJJNBxsLRJ/iJFwu4IgSNVo8PIv/cuUVUTCgLfBGLOh+RIjsdcfB/UBWlCS0t/Y36IjV
         CDTnkz/2bYYbY1+z5bGXGxkpeVfRXiKy0caKRRW6I1ui/ZW5smJMF+k3+mllYX10TGoX
         HmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789620230; x=1790225030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adrTALwJCdcmS4nJH3ZIST48L5iXRSGsY1/xx0Jbnik=;
        b=K7J4qSQQhJP9IaIruiZWecHsUO3HrtQ8QhYYH9Hm2pPbjYmq/hVwb2Jd2mwmt1BY6z
         NOcLUULuRgLjXBYab6nnCJBCHJbrw+r7wyxqLOdYgugaCzzzPocsEwhtwmlq3RmkF6YA
         Q7bI4CEYBzgMEJyZMQreEdlvfOeps3iO1vy9EC6jIa2rxJDMxPCJYt5FnF2JfSDWvs/Z
         8k0vpf/E86l+w+zlauw+ZEb+7gx1nSNVhX+N4VrAvzJhyzMNYOnvXPQ7q818vzAgH4Dt
         jqUQpiSkOans/tiqhAT9xzPXSji1hVm/Gz3bHQa23JjJCkGwIbIqO2Os54bHo1fXybKg
         +iYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwX1LRrRHlMvs3eLCNrIegCHa+5Hx88hWFDhXr0Vq/bzIRM2oJFWWefQ1vZPRc/0xPoH/7yCRcAxmIiB3I=@vger.kernel.org
X-Gm-Message-State: AFuF++n54EiVOezfROclD2Tamrh+ajhjkOCMLfIQbTyU0fc7ByI0QMiz
	Y0C5QzRCy0fyoTN2AeA8Iw+eFoLDvoL5moUIUeorlXPwFSX8l11T7uBL
X-Gm-Gg: AYBFou3YyPXaXZ2A1AOYs143K1b/J0dPPEXf7SdoVdeAJhG7uXeo4LHgtOXPm/9LnvD
	uu4dCp3/D2H8n9fwSRw0uwLmC/cBkqPodtOs6ciHjzxlz6XhejYowddQVb28xs7MyPI1rc1/TBh
	7lqPwPjTaC1xZinshE3ylpIvSsGrqgTUCDVt+MPSFi5/2ci/qRn/ZKykJ5QTwb3wPdtepq8wTOL
	YPWI6Qz5zp1S5/zrdW9wokRs/I77v9SlMEgJ/kPqEd5T0dZHaegb+ZZ65gCJOwtCj9WPxJpjWfR
	IIBuANgQZ9ZX/bFTY/Ajwo+lKEK2W2/6iDoY1QRg3nt2IV1jk2yT4Eew5kbh0E7nQHOUppSFEuT
	0j4uhgdMQQKtuHmWmtpSLuooZ1mAbUNUaKepjKGwdc2Cl7LFtDYq6NwxQIu+3+Xk/1t5azwWVRm
	i++pdeyZYY4Ry7HVoN6MA8kC0pCECm+6k9YZ14acWAxXOwlXyal5PGaqO07l1YGw6JhQ0dCTEEP
	+qmy+/PxIAhnqtTyZhTLm4yc3dahUyZhyFzYG99HSSTuOBPqzv1/0w=
X-Received: by 2002:a17:90a:6c8f:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-39e345b3c87mr3872140a91.23.1789620230172;
        Wed, 16 Sep 2026 21:43:50 -0700 (PDT)
Received: from casta ([2401:d800:9045:4f1a:4e6d:4c1f:5b78:9e96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360a6c8asm3038405a91.13.2026.09.16.21.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:43:49 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: code@tonyhicks.com
Cc: blum@kernel.org,
	rdunlap@infradead.org,
	chenyichong@uniontech.com,
	zhangzekun@huwawei.com,
	ebiggers@kernel.org,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>
Subject: [PATCH] fs/ecryptfs: fix slab-out-of-bounds read in ecryptfs_verify_auth_tok_from_key
Date: Thu, 17 Sep 2026 11:43:26 +0700
Message-ID: <20260917044326.41276-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a bounds check in ecryptfs_get_key_payload_data() to ensure the
key payload datalen is at least sizeof(struct ecryptfs_auth_tok) before
returning the pointer. This prevents out-of-bounds reads when userspace
supplies a short payload via add_key().

Reported-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b9529ebe6a9394ddf825
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 fs/ecryptfs/ecryptfs_kernel.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..3baccd4143e8 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -124,6 +124,9 @@ ecryptfs_get_key_payload_data(struct key *key)
 	if (!ukp)
 		return ERR_PTR(-EKEYREVOKED);
 
+	if (ukp->datalen < sizeof(struct ecryptfs_auth_tok))
+		return ERR_PTR(-EINVAL);
+
 	return (struct ecryptfs_auth_tok *)ukp->data;
 }
 
-- 
2.55.0

