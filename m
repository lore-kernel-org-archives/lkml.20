Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E713EFFD2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185940; cv=none; b=MVF86EigMuVxA+rqrzUYtS7i6aUNpJJua1c/p0XsKcAvDVf6DzStZaF1MA+H/k/mCYYJSfo+7Fy12i6h9LAt8AR+eKYGLT1gZDJRfJtzIypmDqSK4zUrFKQrkeCPbaa4bTBJWGqJRd7g4QTOHdqeVHpWY1Rjh60vxk74kmgUD4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185940; c=relaxed/simple;
	bh=DRqmRpjUqDSGT29CT1Bz5Lx7GtaQYRiwcv3jI7PfffI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ulpc7B1JEBMByY8Bt4M17ucSlsEKhihEFkkFxx04AMqudCFAjPfXu7pey1j8uunfU/t3wxRnBKCpd64S/fveFdE92gtILkNBeAcYa7KxIGyTNjOv4THeyo0d0PxTLLQIK7VWdP7+Rj+lP6XPMuYz70FYENgMULEwomz794MPtRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juvsEDej; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juvsEDej"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso949236a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790185935; x=1790790735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+wYMt5RgGNAL4xbHbIdqrpDL5phee97AhbS4gBla/k=;
        b=juvsEDejJBQJJon93p7IBtrDxqDkq6uGZ6eZeuxZiM4dp5BAJrt/FpRN2bIEIG8Dqa
         udsl8fQKK9Hw02ALkhmR85/GrJ+5vhNv+N5gP5QbvGGJ0L+JYsFQYVXCviwYIQ6FKi/S
         fqMEtjppRSfGmKcxGdRAoGnuABNAHYIt9g3iaV2iClk97/wIiMpize+SUVBBh1GfAxf2
         ksbUYsXuu+Vxoq7Uy3BzuftjK4WypT++/URs0CDxeA+3aQ102DtZE9sCHrG8u9YAVHkn
         f8m/AHe6p9YE/LG1HnTxrLD/EnTuElAJuuvEoztdEt3OD8B7iP6xiHeBIe4dQ5pwSfDv
         SVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185935; x=1790790735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+wYMt5RgGNAL4xbHbIdqrpDL5phee97AhbS4gBla/k=;
        b=uPtMTl0pNdfMWxO6Fn/lTGEYyoLOiyLLA6xamG4NIuJDWvUVL/6AxsuIVu4crFDmYm
         AJwk8fTSrKF8AdWTRsstJ2hIhTuCZ+taEcuJNkoJ/PsaIt72Fpp9xpqyLa6WYnlWZuyn
         2FcfNK5DZ4XqdPyI19dmyVLCcR+wltbN9aGUrrCvDL6QrBYt1H+2aGUD6jHAdB0GAgbP
         KEHnrLdy0EBZ9BYHNZ1BIcBsKijXMgbFWtYHcLDnZwbgtkbWwmMEv6oYIimBhEYN3cPh
         i640PQfjWvrbTa1lHobqdv8AZdX4cp10/xcIU+ht5dYwr1q4AkPdhZTiHEPUbzfhxjDA
         c3vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOL1FHGt+MtDFs6YdGXmro9pnkpVC/GZ2ZV5SGlqV2xjnwf6U62rZIl0z+IRjuJTDB2q2Ji1MvGGkI82Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nm1anZ/7qtEvp901UkuoW1gtlSNnsaokjRJMPGCt7S2Y8r0Z5Q
	s+wSkDGmMxB/qsX7lZJppJBT0lUy3D22BRuPzW4tmxVzeWf6Eg2jSN52
X-Gm-Gg: AYBFou1MQSla6YRIpgfn9KxQkfTv3ZOVn+E3da/0qb91TbyuXZzCIsHH2ZDZfP1hm0i
	nNrQb6yX4QxuJtnEaNRkOSnVHN8YABQOXvNyFjT3UhpdPPDRGEFjl4kAoU554DyEJldiNHJAwwq
	rwjmaiKqSRPueos8piWYMqtQ6AXUEiDBVa6XDSnYAE9vrrZQ6ZvnsQV7Z07TyMKNw9y/DrRohAI
	oXJq1m7UsfJMCPOShLvvH3/MphIpzdINM9m/nHBgxNM9rgfqPT0mlzCraHmwJx38V01hzWQQPvG
	jkuK6aIu3sqIScrakizW0rMijXmI7+Qcxp0HG8EXxFKFxOmMDGMjzWIB6jb74vEsuArjE28Ordl
	Ju8IUoImFYXzKGcfBZMYg1bodgmV6qot3AAu/xEEfngfsnIzf/dVcTvrXg9FO5ivW4NFAzzfeEe
	kufxpjuZNR2nEJOf+pNa89hpSXqdWWUjMFbIPXYI4Lmboo0+k8f4iMmYqVAIL6Kw4JTr3J5FPCR
	F8k/qIEjuPwaLEVxx+2X4FWbeiNfDJCp9H1E8bCd25DG73wlgHcygL1FT31dq4xAzzzzYgb985I
	7B4oVBt0SJiRF9dAsM4uG+nUUVQ3iw8xlzEJB8HMrPTF9429zJJ4FtUW/jbcpyVsPYHbo2MSZMG
	64iPgA54=
X-Received: by 2002:a17:90b:1cc7:b0:39e:6c69:9b9a with SMTP id 98e67ed59e1d1-3a07e6ec797mr2946391a91.63.1790185935232;
        Wed, 23 Sep 2026 10:52:15 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5de5c8sm15188055ad.60.2026.09.23.10.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:52:14 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>,
	chenyichong@uniontech.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] isofs: validate directory records in isofs_read_level3_size()
Date: Thu, 24 Sep 2026 01:52:11 +0800
Message-ID: <20260923175211.1577344-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <volfx2r3ystjmi6d2qaeyu37pjodjrp3sef6y3vmte3ia6aqoy@acwbpwhk5heq>
References: <20260923153220.777907-1-matthias.goergens@gmail.com> <volfx2r3ystjmi6d2qaeyu37pjodjrp3sef6y3vmte3ia6aqoy@acwbpwhk5heq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed 23-09-26 19:13:03, Jan Kara wrote:
> Thanks! I've added the patch to my tree.

Thanks!  One correction to my commit message, if you're still able to
edit it: the out-of-bounds reads from all three fuzzer reproducers are
on de->flags, not in isonum_733(de->size).  The last paragraph would
then read:

  Found by fuzzing fs/isofs in a userspace harness with ASan
  (heap-buffer-overflow reads of de->flags).

Matthias
