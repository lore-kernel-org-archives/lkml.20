Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E879630C62D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789790040; cv=none; b=rCL8yGAiKpcolCybPT1ouYyrnLsy+cbFMI7qnNUQ8qoJ2cSziQVs4u+QHJ8ZvG6GkY3QNl+CdTq1hMZd1ZDgaLfRU1iNwfAKlQptvl7BIZSBMkefaptqv2z8+HYRufTFUzmcs6U5YPqxEgAU3rO86i0vhM0mu4cEFhkhHuR0lvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789790040; c=relaxed/simple;
	bh=ar2zcNlv7+c1OyTtkaddUuGasqJNqHnuUoJCpv2NdIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1JpiS/vNyWHSR/M5gMVwQ8P8zQamUNeIQQ25gQzsqbU3tEoFFTBPCqspsvyAcKgjomk0UVhQNehjvBMOVVv1CvqDSt9upiBXxFfJLRn+H7SHN5nWJRZ+Qb/6tT9902NRQK++Pb5KFMaUh4P9SDy+Ut6lhUzFQR8+keVlgjcvm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMW7Rq2U; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMW7Rq2U"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso1311852a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 20:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789790038; x=1790394838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vINPVP5099LZ8ihUeZp3zwJQXFHBAyqFeLchbfWgNgA=;
        b=GMW7Rq2U6iBEIU5Camq06FyvBFRmvxCvNmgq7F55xS7rqCbz4sS8Owb2vP2W7ajGIa
         MYkQy50pfCiBGWsrmUe8h/AWPZ4jWnRnC7c9cLzLMwIo34gOt/Gwni9UN1Z1rKkR3+zR
         idiiBgG2nertauxD/eheJ4OtL5UdNclmwa0spVlFpcojo+OvZQLY9vuBAxFRwsKkFb0K
         QpPuksMAUJ9x/55YN3M6a8VJPwJ4+r+cJD6O9twIz+/qb6CIWcaWLjd3algWN93NwZS/
         GTJjXXVQ5sDe07BsHukcjMcmun+K8n0tlutL9pbgtEGvH8WDxCoXHv6U1KPZcktJqdKT
         tcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789790038; x=1790394838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vINPVP5099LZ8ihUeZp3zwJQXFHBAyqFeLchbfWgNgA=;
        b=gaAz6r9EKAPc6rXUu9s9dURInsTZdLBCxaI0+pEUr83iBBGEMw50q+OND6gDnVl7u/
         cnZw64JK/1eXDGUzZ4bffiL0S36ot75HHs9R873dA9KqrRjGdAY052s/Fp626zQcKx6S
         RMHIKoyUmE3+T1U9OV+euOk531dsWs6AQz7ayl9yXnyFy/q9jFIbdSZY/4IHoyj7//dM
         tUTMG2L52E06YKWR7yA0RfqLuJjcXhTu2eN4rTDxLk1I7zLxNsxC/M6ET0x9oax0izrg
         3vgDdSIvK8iyM0il65EMZD6dDT/S4A6BlrF98vwm7z1uigddDPXrVC4m/zdWgQa2PJip
         Ek5A==
X-Forwarded-Encrypted: i=1; AKwUvBwCKgfRHpq3V7bnSVdh/8rt5PqyitB4alT7n036NMigFDhFCrsP1VqVc2VEo3AKXvvNU4mctZ7OA9YawOE=@vger.kernel.org
X-Gm-Message-State: AFuF++ny80BOvbb6ifB6el4Fu3tM37StxG7xJL93TvovQWXrSMwqUmQr
	21JufcxTAG4i7NxZb08CzmDBGnEAv/gq2yKNenXI6wd5qpSsxxNY3DmK
X-Gm-Gg: AYBFou2OHiKQSzaOFId/SYkUu/P0MkuO0x38TjHXpwdw8boal00yS7XCHLPLbct7u3J
	tRW9rNrx3J1rjKlR4vYPRHylMBEJXyzrGPvpczXXkcr2pJETkRZPaHvmRChCTgP5ZLG/7JAqaAf
	SNi5iTHwMqvu9+n31hGbUFKZndBePi20xGXNQzFv425gpEletmXBwIyAlGByuDq9gDS6Z7eoT1H
	RzQ14vabWPXyTGyaug3ZKI8L/rRZLgXkKBpAwKWbQrkQFGCTP5Pz8ASbQE2ybjRO9MI9NxprXG9
	e25a+REhjzrBOaw+3taM/PKvd2JDeDDd6i2Z2SjPCLC1mCw1Q6sqO3pLyAO91Ae0/aBUwk3It+b
	5+8Anr1+5P/ijl/XbL3d7esFYfx3MhnETxrJWuInG/HGyxAi5hkIm6boI3v0KdkvklDOrhNM73K
	3Y81AR4BRYYIF282eUz/gIpraF//EOwQHd8pjL4PGm95K/iCr0FHH6eNZdWVb+6B1ZEwBbbkiFu
	vV4VUuOMlqyVXdD
X-Received: by 2002:a17:90a:e7c9:b0:39e:6c69:7771 with SMTP id 98e67ed59e1d1-39e6c69794bmr2720506a91.26.1789790038175;
        Fri, 18 Sep 2026 20:53:58 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:814e:e9d3:767e:9a2a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb3607csm2287560a91.16.2026.09.18.20.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:53:57 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	Rafal Krypa <r.krypa@samsung.com>,
	Zbigniew Jasinski <z.jasinski@samsung.com>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+fa63184795283ac3f842@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] smack: reject relabel-self writes from io_uring workers
Date: Sat, 19 Sep 2026 10:53:51 +0700
Message-ID: <20260919035351.88453-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smk_write_relabel_self() calls commit_creds() on current. When the write
is issued through io_uring it runs on an io-wq worker, and io_uring
override_creds()es the submitter's creds when they differ from the
worker's. commit_creds() then trips BUG_ON(task->cred != task->real_cred):

  kernel BUG at kernel/cred.c:376!
  commit_creds
  smk_write_relabel_self
  loop_rw_iter
  io_write
  io_wq_submit_work
  io_worker_handle_work
  io_wq_worker

Even without the override, committing creds on a worker would relabel
the worker rather than the submitting task. Refuse the write from
PF_IO_WORKER context.

Fixes: 38416e53936e ("Smack: limited capability for changing process label")
Reported-by: syzbot+fa63184795283ac3f842@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fa63184795283ac3f842
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Reproduced under QEMU (x86, v7.3-rc3 + 00834fcb20d0) with a small io_uring
program: async IORING_OP_WRITE to /sys/fs/smackfs/relabel-self to spawn
the worker, a direct write() to change the submitter's creds, then a
second async write. Before: BUG at kernel/cred.c:376. After: the write
fails with -EOPNOTSUPP and the program completes.

 security/smack/smackfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index a72bc7fabea9..0061220e2d00 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -2678,6 +2678,10 @@ static ssize_t smk_write_relabel_self(struct file *file, const char __user *buf,
 	if (!smack_privileged(CAP_MAC_ADMIN))
 		return -EPERM;
 
+	/* commit_creds() must act on the caller, not an io_uring worker. */
+	if (current->flags & PF_IO_WORKER)
+		return -EOPNOTSUPP;
+
 	/*
 	 * No partial write.
 	 * Enough data must be present.
-- 
2.43.0

