Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564275;
	b=EabhNpFhkUkaiXNi970BfHgs/LYpWLRXIzhWskbas15fWODC2GoJCNr5Ntd1tBiGVyOJ
	 USKV/2YknyDxZMHbCeFEWjsecU2QkJj6UTun/LgZBuXG4oGxhS/ZNx9VcZQFhISuz/8Gv
	 fL5/W9cYeJ9w03sAbF7iwKJpw13cxyoSxcp4aA+OZ30waV0f03F16wEiisRpZG+NKvw0T
	 2PFDo701NaMW33aHJupCheJqqRSHPtpKg3RzWimhUDr6Vlc2o0nrjmgfpeMmO0Cz0rzHK
	 8jv8AnasAoMT7NmvyEyCLdtfQ8vNnZZMZslYTlATBpliaNSZNUYKpA1rAmV2GNf6IiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IslZwScJ+AfRGcBpiL9dKDI16HL4dxngXHAAdwckctw=;
	b=zTe0I0FVO5DtkCDohkqTDrh0lBUyXmZmb8+iEncA7ur19ZTA75H28qEw57X1AQ3AvQEA
	 mgJp9nWl/FbiPmfOA18iK6ElIGVt+xMMiclnWE0tEn4bqmKwPoZ+KJBlm+HNsEydfSSRr
	 m7HMNT+JNK2CpS0rnqUo37oMwCdueuFnF9xVTDmfFE3qzKtIlXaG6x4/Oc94imfeqQxte
	 b/zvJcgt1aB0Ub8oWSajLTSwoLgG1ETB5i7tSA6p5dRTDHVtvXTLpL3tyKxtA4yWAxwIs
	 mTEPzYXc3LSSGC6qKe4OwCkDfRiwdF1pfTB6okb8Nd38BnPQj0oPRiQXfLA1GLkpjAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4tNQ8cE;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D27606A33D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D27606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4tNQ8cE
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a18fc7a38so3626824eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793564274; x=1794169074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IslZwScJ+AfRGcBpiL9dKDI16HL4dxngXHAAdwckctw=;
        b=R4tNQ8cEhQbr/emYtQZ0+NbX4/cQaAn9PE0g1wLTTGd5zzE2oRbS0kec22MyV1SMjj
         80l0uaEbuszJcGTIlhyz6w7124aI5BsFSzV1oOWdr3myFQOQUXDJ97rCpPr82DHt73zL
         Jw6Vgac3Zl0J1ypUSXdc/ipznr3rC8Pkwy6nHRs9x8EXcT8ufhJBeNDmate0JFJ4JzEn
         mpKyFrN2Lpl9AtPnfWhj9hXxX0ChkH+P8EQ0Kz+QmbaHocHhiKkGluFbAF8vvIcJWCTr
         EXf3Ac5Uv6ehR+k3rsXW950g1I9qfhf1HN3sX9/c+0l/qXH3T6piG734xGaqCHo51x1c
         xAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793564274; x=1794169074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IslZwScJ+AfRGcBpiL9dKDI16HL4dxngXHAAdwckctw=;
        b=eiIeFvZm5pyat4RlPk+ypj3nzAA+cncp+F8+taKreO298WHWYqvKjuayAmObp4q3GD
         EbQPHU9qpbQ8tIk1lIAfJY5zFKgV02hk8il0KxB/SjK8T69GR/RmC6/J7zDUj2zNpzJm
         ZWQo8zPVfiwqSc5fJIrUmg+Waw9tqRBRwU4V1m0poLTop8GMI8ROYZZP0qL4OKrLnmHL
         2HNAiMSuP+OBNh4j3OpaoupF34IpN/oUwlsOewPWFRvKkP9F0arDqcD5OmG5ef/znREA
         Jo1owxHfmZeRDRoyxIF4IPCQf0ni4Mu8r8l/qfl4QAZDG9OErw/Ssb0FxWBIR/7cp4LM
         QGmw==
X-Forwarded-Encrypted: i=1; AKwUvBwna9RbmcYrXlRLkHK7dDI+1ghdTEYPiGTiU16BgojDzDZMb3d59aQNlELwbbbcvFtlQ4VE3UW/eVvprYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/ONvl8MoXTqdta4NhwOouylQeThnDuYQE26QGjPJMbJvkOCSh
	kmpeeo6dKIXKq+c7g5jfZphRnEzUBjewZP5VAAgBUu1vb2JLOXIjHp1F
X-Gm-Gg: AYBFou3e888HpcrYGgPgDgdOsnje1tHwcXQM/ehINKXAxxfpMLk/WykA0jmYWiedS3d
	HFlYYUxOpM4u3xHKEydwT9yU5sjQbFLR5GS6kgZBv3OuOmmOD9sKtGMYywqMVLRgHBUY3wj+Ss3
	83x3Bqze/NX7wbU7l5mcA+NbYUR3ss745/Fxdy3tYK/mQ8mNCyLukXeMkLfPX1gLeFjNRYrtiWn
	gb8QOvTL0uounfL9ECPXtCKogB1qLhRHh+yq4qmiNjVWgHgYB1A8igOAmLAhv36/+CaYkCQpyDR
	k1SdTKUPLhlSm8j/sKakzElRZUa68qaCsqHNuUrcG+s7MLA7CowRlDih5isqXzjOZtzusE/tdkQ
	tWv8tqtlaG1ECPB3mXRhFkRmQLv9HReHbDEN5OeMNcs1vX91FycHnfR+5Sl5uKPvuVLhMuB7KiR
	ZV/NMWi1wNe0ZRBuulGGAo9wu3bdf5UIhT++F2CjbkiL96AkAmowMaLERigK6z9kwlLk0u9jDWl
	oDlMG2A5PDmgvunAevpGbej2vHgD7p+a3xWIiAeKFvLGZd/uQ/yRkRKWEsmqd3ua9HTq9IsvFDj
	ZTZgGvY9QJ9v50i+VrQw70YqZfygAweipOe+h7MULTHz46hGYBDuRW6C/4rFVE29zYo=
X-Received: by 2002:a05:701b:424b:20b0:199:7dff:f9cc with SMTP id a92af1059eb24-1ac5ceefcafmr12613027c88.42.1793564273864;
        Sun, 01 Nov 2026 12:17:53 -0800 (PST)
Received: from pranith.org (c-67-164-4-239.hsd1.ca.comcast.net. [67.164.4.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm26752101eec.10.2026.11.01.12.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:17:53 -0800 (PST)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pranith Kumar <bobby.prani@gmail.com>
Subject: [RESEND PATCH 2/2] eventpoll: separate nested-check objects by cache line
Date: Sun,  1 Nov 2026 12:17:31 -0800
Message-ID: <2c0964029b9cd01bf214cd9a521ccaac6afdacb9.1792432666.git.bobby.prani@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792432666.git.bobby.prani@gmail.com>
References: <cover.1792432666.git.bobby.prani@gmail.com>
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

The generation stamp, topology rwsem, and global mutex occupy one
64-byte line in the ARM64 build. Readers of the stamp can therefore
share a line with frequent rwsem updates from independent workers.

Align the stamp and rwsem independently on SMP builds. This leaves
the mutex on a separate line as well. The rwsem reader count remains
a shared object; this change only removes mixed-object sharing.

On the local four-core workload, nested throughput rose
from 5,325,959 to 5,487,081 pairs/s (+3.03%) over the parallel-add
change.

Signed-off-by: Pranith Kumar<bobby.prani@gmail.com>
---
 fs/eventpoll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 635db25e7e93..1d616a3b7b5b 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -422,7 +422,7 @@ static long max_user_watches __read_mostly;
 static DEFINE_MUTEX(epnested_mutex);
 /* Local experiment: hash collisions only reduce concurrency. */
 #define EP_FILE_LOCK_BITS 8
-static DECLARE_RWSEM(epnested_rwsem);
+static __cacheline_aligned_in_smp DECLARE_RWSEM(epnested_rwsem);
 static struct mutex ep_file_mutexes[1 << EP_FILE_LOCK_BITS];
 
 static struct mutex *ep_file_mutex(struct file *file)
@@ -430,7 +430,7 @@ static struct mutex *ep_file_mutex(struct file *file)
 	return &ep_file_mutexes[hash_ptr(file, EP_FILE_LOCK_BITS)];
 }
 
-static u64 loop_check_gen = 0;
+static u64 loop_check_gen __cacheline_aligned_in_smp;
 
 #define PATH_ARR_SIZE 5
 
-- 
2.47.3

