Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416BD3FB7E1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490254; cv=none; b=j2LSh0NB7Ei3M7eiOliUHuoSiu3tdELN9W2bTVqbFkfAgCNOr17rf8keqOJmFxr3QOkGJpd5gB3WBPgdn6kUlWwg1qobMmhiFlYXwosrc9wW5jHdNAhFS46KWo1WUz3iFBpxNintjJg07p3XbUzUyYbDINesjz8Qhs7W257eljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490254; c=relaxed/simple;
	bh=SPNeVcNAIskjymSBDJ61tNehH0EqUo01+uZSYGg4VhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l647VpDc2v68sE1Rg3kn7tl6tkRAsXMe820wtwagUvsF8WeSlhiSRaWBOCfIJMPy5F6AIp9mdnLb0y5vop3ijc5n+Bp0Xfybm3pxencyEno9OkdkP5NdgpJbFi/yf2DjrTv6C224eE+VLB52g6jZgEjen0yytqoLIIeu4YQAOdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8v9V7iy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8v9V7iy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so276515e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490251; x=1790095051; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPVDtoQIiKo7Xq5jgNyBXX+8rd+sPKBP6LHpCTgUfCY=;
        b=D8v9V7iytwp6qmTxf2TrU+ZmXQ+nofevPY//0586aPB+ctKa7fjGjLtKZlOXtbCgN3
         PRIipZQaKgxIy4+s8qK+ojpv4pErPAEYonkH+O62ah0xS5aFgE2KdXao9XRkjgPjrbYY
         WqM83FR2vKORrHgQNfMXiqJaBHeCjY2bw5QC5kULkogMyn4UeyKHHUK6KN/agNBq28W8
         lceqzyqTDWZlTGSS5uGFb6oCJofWZP00IF4+80xThYMsB4AGQIusEprGLVypglwPB2i7
         Z0hEDIARShy5dz4PrBBcFAaHNXfXRd0Z3OYRLZtems2tq4p4H5+Kbt2SNSeyl/GEGLZ8
         udxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490251; x=1790095051;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPVDtoQIiKo7Xq5jgNyBXX+8rd+sPKBP6LHpCTgUfCY=;
        b=SYd0zBSHJgjzZXXuXOd24qWGSsMHQoeKUe0RtGDWDRqGvffwwPY3DNfuy/z4QwnC9D
         cvDjdudhVNyUlwEqW3OYtZKsLfg0w2FYJvAnHg5DWzQiAKM2w7DVfs+YwzDFYielbeBP
         HU0LgGf4ALPfb2N+wivy5GFZy9Vk/+hG5pOsWVr2U51KLJHyk93zvvbuHa+ePO5NPcaZ
         HOtNGeED0OvdOa7uZAzlOn3IX7uIuGuhaASfIxIwXRbOBTKnwJZ7bbSOW6bWxYzZvr1y
         bTNFrbkTsGL2hKFTwF+Bng4LX62nL1+0infMXW9+J/U1fhP1BZQR1INtLFrNuVfyc3BF
         1ECQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5gGt9yho7cT4P4ir40fbHnkIScICiFX8btGbMDzdgnQdSlyz94G+2b1tSeFFu6/PudGNomq6BQ1nAYB0=@vger.kernel.org
X-Gm-Message-State: AFuF++lYxrGrxggTpUWLQxew77v5SKIxCtgK+hiaapuwkcR2F47crt0/
	Rmdc9jmf/O+cprDkgVdfov5muCMcUvAZ4euyhZwitNs2fqX2FVEDX/0h
X-Gm-Gg: AYBFou0yG4FIIMfKDpnyS9MfylT+YiHY3vHcUOq0t6XMQ/ZkuDsYDpQ3i/uNqVoTb3h
	P32LVK6H2ARnewNyvizxhutP6tcoJ5eHmkXW1iJuGA2f8ho1+KEiPJ/wRzUvl67uXdKElVddlJt
	IiL0ta8ULwng+3kBtEfyeryfKuajv7NPJU3zXZ85+XHnRD3qN8AwFMpujT0FybGO4YLL1Tv7dT9
	wkh5Z4sH5sx6mXO0ayzskI3GHFLLWcTvSnT6Yexw135/Ph/TIf6z6bxALlA9Qoa5L0tKq0dIN4Q
	rRHC/UCUMgxZr34aySwWiOVnBoWMCuZePlOtslaiKROx/aqJd62Is0nfk93uIoNE2RQ/Ye9bkTU
	/pv90bB9R4Dmmj61tn1lo+sujIZeiNzKN4EjmuGV8l3In5yH9T6A6hhH70LioAdAcREcLU+/a3g
	nMx3vAOMRO7lt5SDshDO+z+zhr3lYgkzLYKB978d+zDf/gqaNfXaKZstn0QtFXtOnCkWA=
X-Received: by 2002:a05:6000:188b:b0:487:999:7119 with SMTP id ffacd0b85a97d-4870a8d4169mr2232089f8f.0.1789490251328;
        Tue, 15 Sep 2026 09:37:31 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm310609f8f.1.2026.09.15.09.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:37:30 -0700 (PDT)
Date: Tue, 15 Sep 2026 19:37:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Wei Yongjun <weiyongjun1@huawei.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH] mm/hmm/test: Reject overflowing page counts
Message-ID: <6f0d39089e938d4f53dc72632eb84aca34de7015.1789457465.git.error27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The number of pages comes directly from userspace.  Shifting a value
larger than ULONG_MAX >> PAGE_SHIFT discards its high bits before the
existing end-address check.  A request for a huge number of pages can
therefore be accepted and processed as a much smaller request.

Reject page counts that cannot be represented as a byte size before
performing the shift.

So far as ChatGPT and I can tell this doesn't cause an issue in
practice but preventing this integer overflow is the correct thing to
do.

Fixes: b2ef9f5a5cb3 ("mm/hmm/test: add selftest driver for HMM")
Assisted-by: ChatGPT:gpt-5
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 lib/test_hmm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 6911daa9f854..b409c42bfe6f 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1624,6 +1624,8 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 
 	if (cmd.addr & ~PAGE_MASK)
 		return -EINVAL;
+	if (cmd.npages > ULONG_MAX >> PAGE_SHIFT)
+		return -EINVAL;
 	if (cmd.addr >= (cmd.addr + (cmd.npages << PAGE_SHIFT)))
 		return -EINVAL;
 
-- 
2.53.0

