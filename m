Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA30497B97
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164725; cv=none; b=a6K+YkIRwenzYXo8/kjvxWNBdr3CUuKFIT3HZ0LsB3EIoO7IMoC+2BOI2x2bDAuKnR9MeOiJ0aoxIjYX/M3bc/UkLptoCgyr6P8Z+llVDJ1LR/r24BLnh8HNNdfa4j8dGNlgt41UzysKCDLujQ+Qmzm7LDQC1bnm8UbPalzjpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164725; c=relaxed/simple;
	bh=g1HCBr8bsZcnUx3gO40OyrqGIOY7LwAa+VsmFs5/+V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGyyMoNpGdtfY6S0JfgQ4lasNhO8MXr//xCkA0ZBj60VQaXZVlqjZGGj+0i6MaBPpCjyKqprUn9NuQcQhi03R3ETqrVIYPnUsKOnol6i8NqvocXoj0Btp0G4cFDGtegCcaWCAhQg5VyHu9rnvACW0MAtveEZSgNHrdUy96vCqik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/DD0KnQ; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/DD0KnQ"
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-78a6c77d255so327989137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790164718; x=1790769518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lN2b/UwZ6UTOnQoQGsvb5dcfV+ZMY1X8+RCUQeVLWRk=;
        b=h/DD0KnQOc2oGXVJR2/COVNTGXNVlfKXHWxIUF5spcvkjpAYkYW7oLUdPeVzz4rdkF
         n/NdqC5ze33Y7o/hEZ8R8qTuPFjpYRhhLr/1YI/VePA0qLDSDHQVIJFtSG4DwoF1AVif
         IkdXgFhI9EvyUyq1a4/M3qFkNUAE9KpWnGbysAVHsC/g/kaziU1+Z4vapZ7R5BWv917v
         /PsEqWf6V2ZXndXr42HcoaM1ybOi8BBiOUM7oENIp00GQXzFrZYh9Mvdk5GBsf/v6f0B
         8li/nd/lc89m/PKKSQvGnsVWj1F1VHb9ppdmQ88s039MxNiOME9XKL6xlWanU/VJobNj
         sltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164718; x=1790769518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lN2b/UwZ6UTOnQoQGsvb5dcfV+ZMY1X8+RCUQeVLWRk=;
        b=CJ7/Ul0/4tKfVvJa1ligq0e1c7q9Idh0ZwsrQoSx6QZCK/V6bR9jz/baoH/ZVz1CSF
         Iw6fhgF6kUbMg2PVc4qQ0LEa46DDUmMurbRJL+SjVqiUlqXJ2iW3jKfirBHZSGfBRrB8
         7M2nt0jHGA0fWaaiz58+x6CoyeUo3UFG048gu//M7C+l3h/OUOqRgeqeW9hBJIYUyiRe
         Am6P2HiKGz6pa0EU5LezUOn1+5WIDO+JgNAgWMmwSsIAIp3nmgQbpklgH4BVg0dgqEqP
         jCT+8qk/LsbnULelYdrS0HMWryV9vIBV6ZcEGZy9+rUWBiLmNfNtcsh7NGxHoFpYgdfU
         JSEQ==
X-Forwarded-Encrypted: i=1; AKwUvByS0cIgbyuno9gPhhVd5CH4jc5N4cFmW9izMKIjGZ+xOp3jeHwvUgBvSWoUrDUjeHgKmDtnu/+JnpY2LPM=@vger.kernel.org
X-Gm-Message-State: AFuF++kE/4XByon0GNm4P7fKelEQqW96VBAuxmlmeBWmSJld26JbEbG0
	K83UVn0MTm0lBYBppP0Xe4pgdvThtzIu993/p4zZWF8qcGn7sWYQJ7dq
X-Gm-Gg: AYBFou0/JC+m4oTN4waFMWYfifyGo9YuXGuZPyLjTG4jWPLxGv2E4enb3Rmv+ZrijgG
	1QFqzZFSlQN0p0vX6oCLZMP8tkpsHAODbwerS+uJUhBnER6mM0Xf/uzMa5CaHRhD2PzSF+oFYiP
	fgS+h9N+ZW8F3xI+N4rs0CnsT2Q9Mv0ORBSccJawUjo0RkKWyHmiR2q9fbvXbOEnfjiUVJTltGb
	7ws12s2829qmKhlV5T6yzUSD0YkPXSkOeQ2P0Sx71MiyT1xzTLM8tzy3uTlcK6BvM0D6MVeC1F0
	q67E198LkpPE9x13q6JczUZsXC8KbFirDkFcyY5M6cjl5AXGY4ww/5lyIv2aynMmPi2eUVOKnON
	QwzwL4lNRTbqW4IFH/adSll/t7Ps6ZZ5ZPh2JPNnJp0jkn4uxiPSp++6SHt9NVVrxsu9iLgEg1D
	bYQC2i03Oyo55ypn84PhSr4yQhqUKCdsb2vsQY/Aj3vzwKWVEIF/iadeX342SaL/g=
X-Received: by 2002:a05:6102:94b:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7ac1bd45308mr2260190137.14.1790164718584;
        Wed, 23 Sep 2026 04:58:38 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985167e6fcfsm3257250241.0.2026.09.23.04.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:58:38 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: linux-xfs@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 RESEND 2/2] xfs: reject remote xattr entries with an out-of-range value length
Date: Wed, 23 Sep 2026 08:58:23 -0300
Message-ID: <20260923115823.3305596-3-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923115823.3305596-1-qwe.aldo@gmail.com>
References: <20260923115823.3305596-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xfs_attr3_leaf_verify_entry() validates a remote attribute entry's name
but never bounds its on-disk value length (xfs_attr_leaf_name_remote.
valuelen, a __be32). A crafted leaf with valuelen = 0x80000000 passes
the verifier and the CRC.

That length is later assigned into the signed int args->rmtvaluelen
(xfs_attr3_leaf_getvalue), becoming negative, which slips past the signed
-ERANGE check in xfs_attr_copy_value(); a getxattr() with a small buffer
then memcpy()s a full remote block into the small kvalue buffer
(xfs_attr_rmtval_copyout) -- a heap out-of-bounds write with
attacker-controlled content, from an unprivileged getxattr(2) on a
mounted crafted image.

Reject remote entries whose value length exceeds XFS_XATTR_SIZE_MAX in
the leaf verifier, so the malicious block is rejected at read time.

Fixes: c84760659dcf ("xfs: check attribute leaf block structure")
Cc: <stable@vger.kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
v2: cc stable (per Darrick).  Now 2/2 of a series: 1/2 fixes the signed
    value-length check in xfs_attr_copy_value(); this read-time verifier
    fix is otherwise unchanged from v1.

 fs/xfs/libxfs/xfs_attr_leaf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_attr_leaf.c b/fs/xfs/libxfs/xfs_attr_leaf.c
index d0f7753659c9..948dc8b26fe6 100644
--- a/fs/xfs/libxfs/xfs_attr_leaf.c
+++ b/fs/xfs/libxfs/xfs_attr_leaf.c
@@ -339,6 +339,8 @@ xfs_attr3_leaf_verify_entry(
 		if (!(ent->flags & XFS_ATTR_INCOMPLETE) &&
 		    rentry->valueblk == 0)
 			return __this_address;
+		if (be32_to_cpu(rentry->valuelen) > XFS_XATTR_SIZE_MAX)
+			return __this_address;
 	}
 
 	if (name_end > buf_end)
-- 
2.53.0

