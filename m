Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559222;
	b=veQDHvAFhcccVmRt2RhNIfC8QIti3m1as4htbvfOodLdzBe1J3rinFEd2MtsEguY1m4k
	 iy4m7JfLG/kfvVXDX0zt7Ce/jIy+WNmCxUYF02fo/zzwHK6KeltZ96HUIR1lfDTvp1PDo
	 P9cVyusdzOoO2/5VZv0k4Kl/ThiO37e3x56UjkFxB3Dw/eGlPoDoxaWqYdoCN0spwHM5D
	 xSbvefCsQxbfAh6DsQXqt8uuFR3fJvKskk7Zd+um1ppVmV/Ej+HqVY4i06tr4lXHooshR
	 tEoW9sz2WpQxxiKQ0oXDEPAGVQ93k+EUQaP5hfHTnjZ4mokEl1VCzj8PEld8xSQKc1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lQZj+I5onjkuCEafsJ6iaagMsGU3FXN3YvHwXS5E/ks=;
	b=1luVEeyfk65FCTTusXlRjYTNfsmo4OUayySWE8enDluGozrwyYJTpye+KjUe0tFGk5ya
	 iAyVzygRrbxX4svRaBDLVwkQ76/4h6fgORN9xrEcRaIQN7XJbYotYhpkSbLR6yezAAQEp
	 /XwSQ+lhELstaJWH6htJJKZ10q/EneE8slQQlzAWWHww18+kEFhQ1Pbh8oB47xDsnx+zr
	 pT1yL9hgIWOES3TBO7vYGAbXXyx10XC678NC2AH9VyOmUfl6PfalQfJ/M9VHspijOOZbG
	 bre2UJ1l9h0wurNTvMKmB3xrIZGKiWZ7GXCTP7h7Kve916YUOZkckMYefa7A9P6Ngkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vMPn8R5V;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87521606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87521606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vMPn8R5V
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdd89d84521so672787a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559222; x=1795164022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQZj+I5onjkuCEafsJ6iaagMsGU3FXN3YvHwXS5E/ks=;
        b=vMPn8R5VMR9iI0ko8VJph2JIkdkn5kHcbotl71V6RBCRzZ4xd+JdtnHZcwclEOOlY/
         ihl0rygCUBMSiarvtTlBqqMxkfY9u2CClFgwurx1TK6eKare1vnVRAbexXkzeYIh46SV
         QBmJ1zWroreUI5Fzah7tNXOGTJ49iiIe/KtjQF0YlrplHBFRmwCcAIMZfL8vJRjiQ+ca
         7H9i3Hf4bT5R4NybB0h2twif9li5VoE42xYo2GJwYc24FbcbQw2OB4p3uTSZnbb3qqaI
         aMPWa6E4FT+mG8x74fpTtNJmAz8QYIfmmsQxJcv2IQ2XJk4eU+1//UWlcQlI0bDVtwUa
         yIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559222; x=1795164022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQZj+I5onjkuCEafsJ6iaagMsGU3FXN3YvHwXS5E/ks=;
        b=OpLK6EtU5n/z6YjhCGb3oa2nsGZRaBI9vxmQY8l4bTvA3Z3vzEtKxm/8dmz2h6EMAv
         zSwPlBrvj/XDknXH9Fu3N+xujDVmloYlk4uUP/x/L2MlrxBYlPJJos6UqJsnEvZB/pr/
         ZswBTahmA3CPpI4NH23HdeRnYssYRO4hPUX/+0t8L6M4tu0yxAO8v6lOKli0fvwVbqre
         vrKd/LnIxCTTnuXVfw/ZmvL9dMt3by6h/W71uzEhkGp6o1/HoK2+ZkVp+3Yq7KrClIiO
         vctNdceLoJW+2OjhqvFvXbVOFnSR7qbyWJgTsCg3KadE/9LG6twyetpzdmC9BJHiNV9n
         eHXg==
X-Forwarded-Encrypted: i=1; AL+hErF6JCE7lbo3DtQj07Hm7MagbTL8t4vM3J1+ym9JwtY+jtCX5kKIwcVq/tTKqXtuAAv0mMdSQ5BmO5FaZvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gNYIbB1i5vmY7TLe8IRnLizwlxMS6O5xk8x+kmyjCCYalax2N
	l+YAfajzEKYroH/bwSvNL2FP9fDNYKvNeOP4xAkWPpVGZ033++Lw9e93
X-Gm-Gg: AYBFou2d1nWDITdit/POqSurI0ROlDy8V54hvtlVQLnrD5z/RYu82cRl0LcIHGJ4iBS
	qJFgucnIAARuE82dTHlzz1T6AHsFqrChRSlGSF72dTVYROj6Qt2AfGn2Iv4cSQ9uDUpgIu5c7L6
	t4CAZa6ey7SGAE1R6Evay/RUO3Dg9qVs7K08N/1iDsRoLOMmR3atT2wKayXDMneeQiSGdSotW9g
	vpahUWEYhDbnaDtHhLZ9UhkICxsaTgTAhaJvwLJ+h1xKQNGdmh6wQMRKJ7Whuequ0OADvZURqXz
	KAJv59edtrv/4RHev3zAGKKuWnqEMIsxLxP2SoKc7V7yyOFBdcPV9NGvltCeek1rQJRU437IOnl
	Tx8Jvb/gB345/sUrdGHR4ZeTsMF8M/Zx1Ka9mOEze7jJBSW/btBZoAMIE8q4Q8tNy5luGr7fqjB
	znVtPi8dwAahAPacKTxYwb+RKhng6gK0STHIYcrJl0fVKp5sMUtM7T4V6D9V+ZMJ3JVq12xRqLk
	W9aA9RwzvCHSysJQOrlvJwINs2EbMBnAVWTPsStprMLF7jFFD8K+y8oGA3N5kg5kh47K3hMPYdK
	ndIE2wiv2HIdh5AUG0O6YnRxSIW3AiGY4TgWyIIlQ3YH2gKcGc61VjQECw5MQuQ=
X-Received: by 2002:a17:90b:4f41:b0:3b0:a1c6:95ae with SMTP id 98e67ed59e1d1-3b1b0ccfbfcmr894078a91.31.1794559221886;
        Fri, 13 Nov 2026 00:40:21 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b25a365asm1264855a91.1.2026.11.13.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:40:21 -0800 (PST)
From: Yong Liu <pkfxxxing@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <mkp@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH v5 0/3] RDMA/srpt: Fix command initialization and read buffer disclosure
Date: Fri, 13 Nov 2026 16:38:39 +0800
Message-ID: <20261113083848.1517595-1-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <92a82300-a454-4ee5-a191-0ce5a2ee58c7@acm.org>
References: <20261110030809.913063-1-pkfxxxing@gmail.com> <20261110030809.913063-2-pkfxxxing@gmail.com> <20261110052827.963143-1-pkfxxxing@gmail.com> <20261111065342.1282709-1-pkfxxxing@gmail.com> <20261112094138.1390409-1-pkfxxxing@gmail.com> <92a82300-a454-4ee5-a191-0ce5a2ee58c7@acm.org>
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

Hi Bart,

Thanks for the review and suggestions. This revision separates the BUSY
initialization fix and the target core control-read buffer fix from the
SRPT descriptor validation and read-tail clearing fix. Together they
address the NULL pointer dereference on descriptor parsing errors and
uninitialized target kernel memory disclosure to an initiator.

Changes in v5:
- Move BUSY command initialization into patch 1 and explain why the
  target_init_cmd() return value is ignored.
- Clear all control-read SG entries in target core in patch 2.
- In patch 3, log inconsistent descriptor lengths and zero the read tail
  with one sg_zero_buffer() call through the command's chained SG list.
  Remove the SRPT-specific DMA synchronization.

> Do the SRP tests from https://github.com/linux-blktests/blktests still
> pass?

I ran the following against this v5 series in an x86-64 QEMU VM using RXE,
with blktests commit 79c32fb31b7bca6a4383b749030128683cf6b6b4:

    USE_RXE=1 ./check srp

Results: 13 passed, 2 skipped, 0 failed. Tests srp/003 and srp/004 require
legacy single-queue device mapper support, which is absent from this
kernel. The multiqueue test, srp/002, passed. The kernel and modules also
build successfully.

This series is based on commit:
f66469d9905b39d2c260a15d7d6db450f4db67c1

Regards,
Yong Liu
360 Vulnerability Research Institute

Yong Liu (3):
  RDMA/srpt: Initialize commands before returning BUSY
  scsi: target: Clear all control read scatterlist entries
  RDMA/srpt: Prevent uninitialized read buffer disclosure

 drivers/infiniband/ulp/srpt/ib_srpt.c  | 24 ++++++++++++++++++++++++
 drivers/infiniband/ulp/srpt/ib_srpt.h  |  2 ++
 drivers/target/target_core_transport.c | 19 ++++++-------------
 3 files changed, 32 insertions(+), 13 deletions(-)

-- 
2.43.0

