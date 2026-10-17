Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD082139C9
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792244427; cv=none; b=fYHO7yH8lvwSsfYfi/KrkbGfptWq4N41S4g+BKnW9CzM8deYjUz4qjVMN6d8BxYniMuxLmn+um0l6N1i5xEoUgN3SQbZi2CoWXTS/eWfh3NkfhC/8N70ABL9XqO9DlaPevSIEY32qBVv/eR5dwKCPbKFePN6BCJLaHWZQpDF0ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792244427; c=relaxed/simple;
	bh=L0SvlG0HgqpzEKFEwHq7wDfZkYZ0WTBPvieUdovJWzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PqIfRaPpJCuCqgoilbqVvs0Hl4i5Gbj8KoeslLANH6ljvngxLjDWn2971y7CtWZdWPiC3ndvtyJTch6UMVCrgxcPjR6yMLkpMo6GO+gCvTiuRoA1P52fTc7TVoPK39oaLtFCJqbjtoHe7oY2/FlNyBoJHGpI+JVcQJC6f6p6aV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NVWi+qVi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XyUnlntv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NVWi+qVi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XyUnlntv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792244425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ycK1hfInrWAuob/OJzi5liuKRYAR110GQUd0Dl9JT4=;
	b=NVWi+qVi2G4ksjPapzfnA0sBP7SZDLW/Ovw4HYzxC7y+b6pLtmJ6Xz51Wokfk/UepZ283w
	FySd6rNa5ywsTzMmneXolEOkuUyx+FGSdyUBfYJNcEr+a42nW2e3XTYVjOmeTl0wTqf+Sq
	kPWN5NnrTESOa/V3ADVEfpU7LZSngkw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-K90fKlFwN_q3Ry6ZXYNgLQ-1; Sat, 17 Oct 2026 13:40:24 +0000
X-MC-Unique: K90fKlFwN_q3Ry6ZXYNgLQ-1
X-Mimecast-MFC-AGG-ID: K90fKlFwN_q3Ry6ZXYNgLQ_1792244423
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a9b7e63963so890364a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792244423; x=1792849223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ycK1hfInrWAuob/OJzi5liuKRYAR110GQUd0Dl9JT4=;
        b=XyUnlntvGLhTtVa4SSV6jfIrrEH2T1kOCiZ3wT3IlETiOOhk3wMCf6pndZWwVcXrJd
         cv5/9zwXe9pTYBBtOQYgVlGbbXcAb23Ihi3wkl9qfNttUZTcBqXjiepBFH5gELPHf63H
         WNxBHxGHRg6RgZAyxtFS/bSD96wOr4NcZlowC/R2RSKAHSAqtiICq01pJKHdSB9VN/EW
         S8h77T/bECy+zN35uDrVPW/ADn9y10FsPXYbMu+EQ8jESJ6TX3ZIJFt8DfsgJkx3JAuX
         YpRlu/DOCgjAWqF8q4cQmrhdUZKpZAPHRD0OrGg9WbkIhbAZFzZL7fTINM782+U0BLGm
         ZpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792244423; x=1792849223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ycK1hfInrWAuob/OJzi5liuKRYAR110GQUd0Dl9JT4=;
        b=Y7QjZ7ZVtYMTebIw8hsJHBg+3lT3aP1xZnEbCt+rik+3qw/vlfbzusFnqoS7qDav8P
         FiZNtx4WxS5jmhxwkmVaqqXdsbH6e/iFWgp11egpCKc6S4JdKKZc1S6BYp4z7O0rmlYN
         gJYvdQ3covXEiUyTLMlA55wma0+gUX+Nl+aNSYknlPJZb986m/DzNfNugUBocoDWTt2o
         0dht48yBSYa9cCiDDNLU/BUiPtKhXvXIuXEWIt6kZclaJCD1/JyYReBdkhP9O14YrYJ/
         dtn3frvZxNsCYhQ3wR3QI+GaVYmQISxkYhRLid9RiqbUqtz42dIfl91Og+mArRRvVOwd
         XROA==
X-Forwarded-Encrypted: i=1; AKwUvBxP9/B9qsxYuOW8qOa58L28fLkLquIdVR8tnDcNeRnI6ybcaEfQCTzv/czuuyO6vsDKcaHoW+m2bgX2mSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkf2ciGDUFKQkFBsR+I7zwZ/HZ8zVtCqEWfDOVsSyaIIq3sd0x
	EM5HClr4utlONS5CjzEqrYbF1TRuRI52UaGlXUUcJcwARM6vry0GFLUpOB///8bv3sx09wxtpwI
	BavOFvKvmEOHMTKtczoIzUeaQTNO0AEQsaek490NDmbyrFe6NJCYu9lDHhGkx0FqWMQ==
X-Gm-Gg: AYBFou3ki2gB5aIBLPhmYZIfAkCK+O+YtXHAEKZrGBDtg8Y7DTEs6IFhWHnW7H39mSC
	jLYu73vifeiY/QF0TOTRgdYpZdFrRRXc753SJvvgHXoHcDk/rk2vJd54lw6aAzyFA3K60DyqYqH
	ZprHAri1YRn+zMHar7gKqK/dZeyllXoi4Wc/kcw7Xi++3rRVEVQf84B+GK14iOIm3wAvw+rs5C7
	CK9S+LXLVyHpYwVUHPBRcZgckO1AfBgNnhLaENIAnL3+9YMNWU2BM5zAQ0ai1jNP+kE8R9Akf+A
	0rLI2rXerkH0deu6Nsno3cQbq5b3eR/KFz4xtip3BRFdRioUv4sZ8iumfRPIFhdCvCPhkRTTL0Y
	1vCwIoCdkNP0kVRZBxBAsEJQHvUeYVXldUw6CbwDlgbSPT6tAwYVWfwQRxjPlLOXYxQAxsPCnLR
	gDbs71Tq/g+DNiUCoAdJY8Z0FndYk/cWDGGSmuRAFZWNEnPlMSfoND88nPquL3MJcRiBZut1zSI
	8I=
X-Received: by 2002:a05:6402:4510:b0:6b1:ac0d:6f77 with SMTP id 4fb4d7f45d1cf-6b3a80cea6fmr1729581a12.5.1792244422883;
        Sat, 17 Oct 2026 06:40:22 -0700 (PDT)
X-Received: by 2002:a05:6402:4510:b0:6b1:ac0d:6f77 with SMTP id 4fb4d7f45d1cf-6b3a80cea6fmr1729571a12.5.1792244422538;
        Sat, 17 Oct 2026 06:40:22 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm1913032a12.10.2026.10.17.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:40:22 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: Alex Markuze <amarkuze@redhat.com>,
	idryomov@gmail.com,
	xiubo.li@clyso.com,
	slava@dubeyko.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 1/4] dcache: export d_find_alias_rcu() for modular filesystems
Date: Sat, 17 Oct 2026 13:40:13 +0000
Message-Id: <f93b4a902ed00af44019ca88eeffbf686d920e2c.1792241577.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792241577.git.amarkuze@redhat.com>
References: <cover.1792074165.git.amarkuze@redhat.com> <cover.1792241577.git.amarkuze@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ceph subvolume quarantine ancestry walk needs to find a dentry
alias under RCU without taking a reference. d_find_alias_rcu() provides
these semantics, but it is not exported, so a modular Ceph client fails
at modpost with an undefined reference to the helper.

Export d_find_alias_rcu() to GPL modules so filesystem modules can use
the existing RCU lookup without changing its lifetime rules.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610171220.i77KPiw5-lkp@intel.com/
Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 fs/dcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 1b1a81f10da6..13ba553081b3 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1248,6 +1248,7 @@ struct dentry *d_find_alias_rcu(struct inode *inode)
 	spin_unlock(&inode->i_lock);
 	return de;
 }
+EXPORT_SYMBOL_GPL(d_find_alias_rcu);
 
 /*
  *	Try to kill dentries associated with this inode.
-- 
2.34.1

