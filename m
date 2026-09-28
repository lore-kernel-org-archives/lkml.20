Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B752F443E31
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576094; cv=none; b=pmkn5Sv0Ry7d931jnZ+eg9Ob/xjbSClGX9aS8I9BTrhywsc+Pxtl/Hc+15zy85sP0hvMkCqMHcbhsMR7avHErbH+e9FkIcHWVrDz4lWqlO7OrqQgxjeFrpvJ0Qo2sX2jzPd4YgsOAfJODpIm4xJn7j/7dLXMtBpXCuwk3DklWKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576094; c=relaxed/simple;
	bh=yGo84h1q5k7DqGwFtapqM3KeulWARXvoAl3BUIovgJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lgwwUY4eLBS7RDgoUR1W+HWnO1xziSnWMEbLl3fScQ3GCRWuv/PIM6mhEv7mEuVtekkjT47cZFUWH0qBr+zbbFGvzkSVNK7mQBM44xCX/sEgcwWcnhKkNYNPN/N4675ZhlNH0wixsxZXNV/f0iEcGKyjVLuNP7TRoREg5qI0q4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCnhyY93; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCnhyY93"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso2194845a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790576065; x=1791180865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enVf1SyIQ9oZvAJl5nReVDRZKns+mfLkqH0FfDFTL44=;
        b=YCnhyY93JpbW0Ue1tSIvHG6EbBfLXvg9uXIIzPXq9H997b5HjM+b5XTDe8Y5EUxJ/9
         m8++dvn9QoQu1KNlW/XQH9iKFSjF4fzWHXUmAtY3OnJ3xsYekVXVi0mgX/tYC8TLjZOf
         +AUOlNlXvK8RrU9BgKc11zMGFfm62iSR4cxL9BMp8r/ipaVgBNH97ormakWsk8Hr/hfs
         13z7g7B+GtI2QZP7gox5ClaZr1dOrlAY7Do01ygHx4Bt7SdHEHyyTG91F9vj+TZrLxn6
         b5lNmSVMCym6h20rEkPzeqiSFgDc7fiR2kBp353UcIWL/4/qSYWkDJXS6yYxnCxMnAsc
         YKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576065; x=1791180865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=enVf1SyIQ9oZvAJl5nReVDRZKns+mfLkqH0FfDFTL44=;
        b=Yg7OdATen4s/f/vGUShEdehTpNDODcRi03P86SpcGH0DNHuZ3WQQwYV6GQ56IHOSvY
         OEFCGRWLaly9Km25qMSJj3fEqh6+wRDQ+4S7WhVzXxZVcXI1CA2Q0NmDDRyQVoKlIlWY
         LsZV5HbpMjOk3yJgNY7EQueq5TvIC7T+CwWOZn6FEGkGOLV+dAe91B351TV/BWmtOkNT
         P3c2acC6RShj+RMYXm6sPV7TBfSUB5bmN4uJ6R7qJDmKcwt1f/bKxAvz2Hkz8/0/b8fV
         mLbbo2ela89twD0TmgTKz5cy4+pnLohTpqlB2BMR2s3BFaRw8egAeN6DByves7n0gl+Z
         bnSw==
X-Forwarded-Encrypted: i=1; AKwUvBztBaoNLKfDT7YMjrQWo7eZs2JXWb4pE/Mequq+jQGPDOgOpwX7UpQViTcab58fs9yUVSTnkspFMeSQPuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZ7cCxXL3IaW+V9nMFuncCA8CFgM53+wy3AziJeg+3Y2y7X3tg
	/V2+0MEUVqT3rQuqRyVJo0xj7+ciuvEkTuibNGp/gyZQ1TLYpRZd1Xzz
X-Gm-Gg: AYBFou04K3IkafelhLevcsv+s0gQ2oJd0Ii9YUAais0624IBdX5rG7DMZgVnjw8Ebmo
	g1QSzEnqOwCHKASL0eq3vk+FoLvAKX//6/6098QBxES2pWf4Tf7vXFSQnwMJuvLFwvT6jOUtcOa
	35O6dxHwKWmPK2V/GpggATu/Tsa33sKuk9QVWdoiISejk8Zp1JqIsBp3pF8wFwMbQ07Q5D7mLUU
	wKBHgOok8Tl4BXfSgB0ICnDeV221k10/+8v6z6qekGpnRCmGlwGKLtVuBFxaQMKBsC7aRwVBHDw
	8q1h8/MdaC6M4KW6GSittT6CMRDqQeeprla9YP+5hhygBvsMsjouhzZTnAtZu4OztV/LEA0m+OE
	koP8+gaw68a88Ogw8re57+v1qq0AJ+y79sH7KTmqXttyVPskgBlkTafu8ENxTDdQsoGcDjnYAtv
	UO3aMOudCuUYJew6h980iVfIm2rSE81SBT5XqlPrYEoiaqlWjhDnaTIL9vRn1KM1F3imBk/+FKs
	LS2XYBUDfZQZs/ZPuXeiCQ3nM7KRVwYzTpEqtknf9aynEfqCPT6kbix9+IRg+2Sv6e1SK/Wtpid
	AMI=
X-Received: by 2002:a17:90b:4c03:b0:39e:6a82:afd6 with SMTP id 98e67ed59e1d1-3a098feb5abmr10108909a91.40.1790576064881;
        Sun, 27 Sep 2026 23:14:24 -0700 (PDT)
Received: from yupeng-XPS-15-9520.. (c-73-169-192-12.hsd1.wa.comcast.net. [73.169.192.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9892dbfsm18864088a91.11.2026.09.27.23.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:14:24 -0700 (PDT)
From: Peng Yu <yupeng0921@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Maurizio Lombardi <mlombard@arkamax.eu>,
	cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Yu <yupeng0921@gmail.com>
Subject: [PATCH v6 2/3] cgroup: export cgroup_e_css()
Date: Sun, 27 Sep 2026 23:14:16 -0700
Message-ID: <20260928061417.1574676-3-yupeng0921@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928061417.1574676-1-yupeng0921@gmail.com>
References: <20260928061417.1574676-1-yupeng0921@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nvmet invokes the cgroup_e_css for each bio and under
the rcu protection.

Signed-off-by: Peng Yu <yupeng0921@gmail.com>
Assisted-by: Claude:claude-fable-5 [Claude Code]
Assisted-by: Claude:claude-opus-5-5 [Claude Code]
---
 kernel/cgroup/cgroup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 69b0f0cf2f3e..5a1708ed6b23 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -554,6 +554,7 @@ struct cgroup_subsys_state *cgroup_e_css(struct cgroup *cgrp,
 	return rcu_dereference_check(cgrp->e_css[ss->id],
 				     lockdep_is_held(&cgroup_mutex));
 }
+EXPORT_SYMBOL_GPL(cgroup_e_css);
 
 /**
  * cgroup_get_e_css - get a cgroup's effective css for the specified subsystem
-- 
2.53.0

