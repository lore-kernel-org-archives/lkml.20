Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5683B19BF
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792208459; cv=none; b=JZBFu2sJJgMKHMjupoc/lvfKv346vIQlg8uBS1/VIGvaPhQZy0JGnubX4HpBNTUVMPm2ID754cYFEnd9ayoEc5G+OuE3RoOgCcAT2NdaIwumEbn9GXw3ird4o6lp7PRBIgMz7fq66J/voO3QNrfbDk2i9LNX1aAdK0kl1xktAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792208459; c=relaxed/simple;
	bh=N2nqS+VEn+OcEKXAy6ywZrjjCCKEsoNAXYazLkE0yyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qabcenNnmwHQE8V/MKekJJE1Pcwfz5XqYP4h9pZZjZTj7F3e6v3emvYtPpaIdwrUprBR7Ri488pDhZ0x/QsqEv0z/Ihl+/yD5QWS+K5R706CGFdVcWLJ2iDgmoUX550YZ+YaV6Ov8GwtT/KReEOanUAwaEcJf+3NH31luw4ArOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbz2nrvq; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbz2nrvq"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9ae47b00cso600015ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792208457; x=1792813257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+rXZh+xD9n/HNcvsUA42BBcSjkNxd2Q6tGapkKdwtVI=;
        b=Pbz2nrvqi5mfV4uyzI68xHum60vSNt8ShSNmX5T0rvyWyx8QKfeOFyOgkIzTERbKaD
         +314m6KGQ0uAqHfN52ZCaYse4QcHy+VtPiVfqQ0MWSKY6j26hRE3aGov6MX7ixCKvCv4
         sfLoGsqGIen3Bjckk5d2eLUaYfm72IejeC0t7qRl47SseVCTnCrzBx8bZGt1ZPbHv0J1
         jkOjlG5JapcULxaEPP2aVO5Y1MI4tWD6q9ILZLQ2Ju/uk01Wdjbg7GAqK4JCk3fzYqy6
         nLP6BLpDwAmUETng92hYj6cOs3sxg6Y0a6ur8627Vcrlj+p//u1MdfgsIpP3M+tF6DbI
         8qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792208457; x=1792813257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+rXZh+xD9n/HNcvsUA42BBcSjkNxd2Q6tGapkKdwtVI=;
        b=FRo+Kz3qKbVDFPpWuf6KFOSlFRd3MHpLNNIKCyfesNgbd7N88unXQUYyHzHojiNvSe
         nddGB9qNjbAvn3DX+yOPc6cslR275Ia4HWXl0Tr9snyqO5yMUN5kOCncPl0uY8SnB+eu
         Tf+A1rNQjW5CwqcEmsHTB6+Cb7P6SN2CtsljeOIelnLls6jHqGqYOBc28biiUmLtw2bc
         fbdxPW6moZi3CCSCCKkyp7BGjhUnL2gJeQwdId2zyPj7ASbUQCC4Pg+1/7UBxSGVdd0R
         M35o4KLpgzWhoL5SPAq1ZbgUR4mwPaXhO/IRDtAI2eaygXW9Y3MhX4FnP8b2Qz645Psd
         bhKw==
X-Forwarded-Encrypted: i=1; AKwUvBzGFPJhga21UHOuxa8unhdi/bwm+7+Xsfs/zbgFSQ8uT9TqCZYsjbpA2myPIhRm2wLTM5jF2VloW9dqGeY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcDc2cJb4JtxiSz3iNVl/Zivra2cBPynrh5invmOt4va5V85Oh
	nhGlTjI+Qfrj2glTd+W7Hb1Z8ngkV8LpaZDuzr0olx97Us+6djwq+kb/HnSqkmjo
X-Gm-Gg: AYBFou0C+pV+UD/dWoexh6UmN+73V9a3ZNrilPqX8RHyvTPuODizIECXYI2dJ5R7ooJ
	F0+r4n4hQtyU25Pi02eRRNauQRQj9ZEA+cRlG8MBqcv3lYoTIOt16bNBCKaKSWrijwemcgyiJQs
	aK3ZIqfmFkboy8em17RJZ27nwDPviWwWYdXNhIQ7ys7sZ+G24+oPfqgNeF2+EOM7AiDeHpWx1vT
	U1cMskhTI2EJuVZ53sgSLLrxiUCmO/TQwfoNDj0QwEhqWZgyK4cTPoHfoqryRz6bgh3T3MTvnVD
	zRPmpFKyLVu3hKYie5QLkDKVWYY/du2ZhUqkYNB/3pUN43IYBCZRB1yftiftTUPeKXIph3YXQjR
	d0fAM4RGApNcXsUDHUvOQ9rsk26zowXDbaPKCTG5QzdjFmrKzrgp35O2ddoY/7PeZVof6dqqTLQ
	0O0HzuxTkdoEmuRJdOdPGY955sSVV2dcrFa+jotv1dHTrCUYX0OcPv/cZSRN3zFSi2
X-Received: by 2002:a17:90b:1d4f:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3acef4fda1dmr2331888a91.6.1792208457028;
        Fri, 16 Oct 2026 20:40:57 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e7311sm11708667a91.4.2026.10.16.20.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:40:56 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: linkinjeon@kernel.org
Cc: senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>
Subject: [PATCH 0/2] ksmbd: fix SetAllocation EOF and rounding
Date: Sat, 17 Oct 2026 12:40:49 +0900
Message-ID: <20261017034051.72932-1-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAKYAXd_50E7cH51hxKi9xWfE3Hjyj0PhwccgsuGX416pEJVs8A@mail.gmail.com>
References: <CAKYAXd_50E7cH51hxKi9xWfE3Hjyj0PhwccgsuGX416pEJVs8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In response to Namjae's review of my earlier SetAllocation patch, this
series separates two fixes. Patch 1/2 prevents the existing cleanup
branch from extending EOF on disk and then restoring only the in-memory
size. It carries Fixes and Cc: stable. Patch 2/2 rounds the request to
f_bsize, the allocation unit ksmbd advertises in FS_SIZE_INFORMATION,
instead of 512 bytes.

The other review point, reserving the requested range when shrinking,
remains open. I tried fallocate before truncate, but the decision to
shrink uses an EOF value read before vfs_truncate() takes inode_lock.
The existing block-count branch already has this race; extending
truncate to additional sparse-file cases would expose it more widely.
If another client truncates and writes in that interval, our truncate
can extend the file again with zeros. I reproduced this with an
injected delay in QEMU. Rechecking EOF after fallocate narrows the
window but does not close it.

A VFS operation that checks EOF and truncates under the same inode_lock
without extending the file may be needed. I plan to discuss the
reservation fix separately with linux-fsdevel and would welcome your
thoughts on that approach.

DaeMyung Kang (2):
  ksmbd: avoid restoring only in-memory EOF after allocation change
  ksmbd: round SetAllocation to the advertised allocation unit

 fs/smb/server/smb2pdu.c | 48 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 25 deletions(-)


base-commit: bf3465919b0337dfef8798da01469145887c4ef5
-- 
2.43.0
