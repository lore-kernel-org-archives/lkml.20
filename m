Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756575;
	b=sSzPgfvOMartQwPtiK0nv98Fnw1PJkgsH2hR8I6g1PC/UJowQZvI04aDGl/7iL/XaF/t
	 cYxCzbKSrlJNjEr2LqwYqCHHOzuQFuMDUQqkPAGOlRjZrxU+5PYYOwl53eR6u396gjifc
	 WCCahzG6hyFA27BuU2t3Pm0XzrjoN12I7cph1gQ+BBbO5vdwLxFlIo5xHanmsZYIX6VEU
	 2AvWu3HxQdj65W/s8gIYuOiOqf/dD1S9L/82AryPHYDF1if6K4+3r+bQLz8+f0i/0+5Lh
	 5Nfbn8yljdsKPkhOBtFCr/o3Xjk2TcVfkV3mxIIS3qqjolfh1MXRsfbZkIrRd9bW42A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PGbGz4TbxsRm4CnuNTXPVX7exvrpALjGesuQgwBDcN8=;
	b=grqFFn/vepWeHSDWqY6GCBWWtseBSJXDBfbkXVicEDwQzEqDe70FMCMKNTGwHlqCsrcQ
	 5qFUBPhwmtQz1mlHUNZ2ar3kVtKVHDB7Pr3TMqzUhaA6xhQhVXKbSpPQGQVuiWHVdNr0m
	 PnhmE5+kAlSvymJvvi+G2kz0E2z1L4xU1wEjpIFQF+PbXej2VB9XsddeAQga0i6RfGKzP
	 IVQsb6dFFI5+s1BFmnrgyhH6r04AhZWKc2IsPsuiSoDheztL0CEzTYfbMLoSByoSz+4Wd
	 aKDXB97mnfaq3aravR6t+W93Xpo0x0fqcJY7L8g2Adfc79QM9/C41oPqkFcMrplx2xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1XrwkZe;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6407D606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6407D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1XrwkZe
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e942864693so3887055ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756575; x=1793361375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGbGz4TbxsRm4CnuNTXPVX7exvrpALjGesuQgwBDcN8=;
        b=E1XrwkZeEo2dGC3AqBV58myzoL3Owtm4ZJ406k5WI59hOjxLeRup5JVLQeYT4UVExo
         h39YAWR49oAuDPKApIqQPhqV2wOIWwAU7nCguS+9e4OSUnYa+iLZbi+3Un/xdif0scsD
         7SJCqA198dK0Pi030yh8b+VlFR573YKqGgsu4t7lBy5jb9clgu6N5CG0GAKycx14+ZPj
         nMuHP0wKrfKyB6logd2crGETf3/gVRe8tMAo+Df6O7GD42+xpvFzgBlOWMZr4J3PwgDU
         GKN3AfMClxtSRjna1JWBeIjBl86ig1ynWohKqQnG761wS9FdjjmbRqUco+KytL/bMJJl
         zILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756575; x=1793361375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGbGz4TbxsRm4CnuNTXPVX7exvrpALjGesuQgwBDcN8=;
        b=wC3KmoODjJtpa/3KE1DEsyDwng96N8+98diJlNiBYdRPdaPOV/3HU+TdAUhLAYxSUM
         ZpDEDazrsk1h8wEPp8SBy6zgwhQuGjSbZXGXm/Pc4Tn0/+lkH0eMhzOwVDw0vIMxddwV
         pqbofRMy8KktY6W3sZchJjFaeK8zSakFAtiodjgjrs+t8X4FSNEmS0wfgqg40+nnFNpb
         BPOIN+VUny8XVjHcIQs1wy8PHqwKJPHMTcv0wQ6VgJ7aKYXMCggSb+xu/a6unrn5ISmS
         f7dKn+Ng2Q54JB4kL2fQReG5nUo0nLh60BnHrCHkG61JXGemL7D8lnZlICGs7MrTUqF5
         djcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzK76VghksuyceAlTGY2U1jJjYJqfH/9uNtczy8SdiGfgXc7t9pM73i/7CPXzL0vR5tqttUsDFZHZ0/SGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPWJYRChnttAIIykbNzCgr2fpNIvX9LcuIbpaE21aQqQO8U4DF
	CoOAHbUh8FdW+ZRIVv2UehlKElr6JJC0E0JEHdg57jaPXGfczNs9zhC0
X-Gm-Gg: AYBFou1N63JFN1a4SumpjFXDWQ00Tinc//s1khlnZVJ/hXyHYXsnTGdbSPZS+T0ktQR
	beka9iGNqUmH1zFK0F3tWM2FBXBId/Lw+Tu73glzhNbXhPCc93a9KTFj7VsF5Cty7/DORQtigkc
	I9gX1n00ARBPeKSBh97hHPk9wVLp1lWkX47nrGS80WPD/ufC/wjUJXKX03CcvxmoTwpwcXilZna
	FyUvEM1Mv/g0dfhNdUtMHm42wh0M1nWJD/P4QsH4LLY3CyIy3CwxejO4AZ/L+X9SD7aTMtwoOIJ
	PdcYS1plXtO6IW6vwgjzMfbgaQkmY0qeKO0WAy6JbrSYU5c7dRSANYbbLy49WaRBSbye+q2bj7R
	SV+SOGitBl7hl8FAtmgrXJc2LYuL/4d5an4TZiX8b910VIGOaKDiF9T6/RJWS/qum+viRO5bOAM
	Vex3Y+TaHJOPmhlpptCt4ss0e1sQ5SdcT1HSK3bOwtCIGKLtQRhPq3SLkP/Gy+tRweQHELtDk7+
	1OmaddKQICaxH6S0hT198oGHtaO78/h4R17A4NZOn5Wa8UPBrves9Tt
X-Received: by 2002:a17:90b:518d:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3adce150aa0mr1524440a91.57.1792756574675;
        Fri, 23 Oct 2026 04:56:14 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7ae0:50::498:6a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3addd73c20csm11163a91.17.2026.10.23.04.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:56:14 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: Re: [PATCH v3] block: annotate lockless task ioprio accesses
Date: Fri, 23 Oct 2026 18:56:09 +0700
Message-ID: <20261023115609.12244-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020125233.9820-1-ngocthang2710.1999@gmail.com>
References: <20261020125233.9820-1-ngocthang2710.1999@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Damien,

Title: agreed, I'll change it (v4 below).

On the pairing: a release store pairs with any load that is ordered after
the pointer load, and here the ordering comes from the address dependency,
not from an acquire.  The only thing the reader does with the loaded
pointer is dereference it (ioc->ioprio), and the kernel memory model orders
a dependent load after the READ_ONCE() that produced its address.  This is
the same pairing as rcu_assign_pointer()/rcu_dereference() (see "ADDRESS
DEPENDENCY" in Documentation/memory-barriers.txt); READ_ONCE() also carries
the extra barrier Alpha needs (arch/alpha/include/asm/rwonce.h).
smp_load_acquire() would only be needed if the reader looked at data not
dependent on the pointer, and would add a barrier on arm64/powerpc for
nothing.

Why not plain WRITE_ONCE(): it would silence KCSAN, but it does not order
the initialization of the new io_context (alloc_io_context() runs before
task_lock(), and spin_lock() is only an acquire, so those stores may be
reordered after the pointer store on weakly ordered CPUs). A reader could
then see the pointer without seeing the initialized ioc. The release is
what makes the publication safe.

If you'd rather keep this minimal, I can drop the release and use
WRITE_ONCE(), but I think the release is the correct thing to have.

v4 follows with the new title and a comment/commit-message paragraph
explaining the above.

Thanks,
Nguyen Ngoc Thang
