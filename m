Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B292F3EB11C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906967; cv=none; b=fLfRoO3jvpeFrbosJBi5pxtvJHup/dNBgJdZ1LmZ1SntfJH8DyTF1A9AlqMNPCoyskj+zcFQO4EAo/WLlHZ29yMmtNHD93LViDf5ktMqnge368AVxZq+9gW2BIwdpGBizSRPLvEBVU1J1T9rvoc3phORH/IkduXMrs1W65II0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906967; c=relaxed/simple;
	bh=+Jpp63Kx3Ff3vbZ4RUDR0tHVbyshcQTgmr9UfiVHQBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kN5Msc50PzTzPnWGLi04lEgzJ78jwejHSgdzQSUwuGP9+PFfSvMByWtpbPR2LWgLwxF/0t66cWSagiqPWI6NS8MDE5evQEAFVwD06kD2M7VDiVBLTDwjEWSKb6pP7D3m/3zRy6GMbh3unnKjALmUJO9qIkhLWB7HypfqrX7MssQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTsMaSDE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTsMaSDE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cedda2ce6fso5358785ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906959; x=1788511759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIiKWqsEvZY3nxwnWYCCnPlVmDAGc6W0S6TkgE1flFs=;
        b=cTsMaSDETNzIUrljoWCRNqfe6dLeoK5dNRadJMd3vERkr7ioCH/o60nbasF9fbRm9Q
         Sll9LLxqQ7aQ/SVVgc3HGcwnShkDO4+nBXwd28bp0jbT22bymMmVSEhQ+sKbU3vfKPUb
         4UzImiJ7oGYG93qVf/ki4JqWwfD+OitcKNfqt2FZp2Bv9JicJGIb6wLnuE6W4T33Ahhh
         +Ioj+ioXOzeHVWXgUIA4tyvD6UE4KB8khjHRV03fWt4AtafIlhXL1Jn/c+KQM/hIpWH7
         ClJXGDgFUcdrWiY0LleKVB7T5LTQCPcsbmbIDpMxPBliUoI98IokaFgTDPeHBHg+GMBP
         r2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906959; x=1788511759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIiKWqsEvZY3nxwnWYCCnPlVmDAGc6W0S6TkgE1flFs=;
        b=sEKMGz3kseL4k6vlBFU+fWm1OFze6J+JehyBPXt9YtxLVcTloR9AFiEfh03sc9W0lH
         4EJSrxnRZK2HWqFS4yYWEePik5Jzw+6DHiM5hq58vC+F8RCHCwKf+SRYkJvz5nWa3s5E
         cFeX6i6qrxDOeJSKfk3wph+1AKcGunzGCiUXvc9IMvnAkDie66CWk69/PEj+5EiMRPXZ
         LiYIbmZIJzHZ+15xhPWTAuMAw7295DLDbaUlwDtAXPTdrymSoDKbRWXugJY86viLgKcj
         Sh6UmESoPmys9YxZrJhcsk0kl2HT+4Xbi+5wqShX5cZbKXODgyLDRpTlxMkOAA8VyEl1
         grDA==
X-Forwarded-Encrypted: i=1; AHgh+RrkJxiIUMFQYKbgkfIypmVUdbtVMcI06MvARpkytk7hp0vlQTEUptB26CGDGUjVGS9SZNsY+fmScChCeZA=@vger.kernel.org
X-Gm-Message-State: AFuF++k7JRNO1OpGa3EaR369X8UA3eUs8yPpmiD/4T640s/IarE3LOuR
	FyuWm2ItM8jrh3hcZJKpyZ7ykcSaTwa/u47aomaJ+FHzVNS+txcSErcx
X-Gm-Gg: AR+sD10hfhMvWH/Hko0f5bxOOkXFTyv3QPqc5wAElH1dvfi/F965ceivSW+M9Rk6Op9
	H1L+Q+UHoqsJWQGpEMJOneuc4nndtDuT29y3LF4E4j7ZNzEKQwgtA5n+4+Bj5xPZSR7Y1GGLCAv
	OpYLCBqEx90sA5dV7duxg1G0mUOLghQwDiDlybM+cG3wmxDCTNbZD9b1p/QnqGacXJURHVKjoN4
	osRqVjUYLeiTGISkRHtZOtjOQd7SVjCcPpVDH0nN4DSDy25Z9moTvAMdo1n3DYNb8Cogokv+PXB
	klMkNWFrctFyHAC15fyfnAUHzHpohmdV77cd9q/JJtNhOvshIEUanzwS0sJpHeTcdmxfeHpNYIq
	1Q7cgMDP36adbsSbdqBwFdbktwVQL0pLBeEWRKx9IX91xPMEC9+4pNTXvrOe4wUxns7H+Q1HUfT
	SCMOM1uiXAv7gzTLkFxQ/nDlEuqapU6tTYQgQjtFufZpGsib41ivPzoGqITtCo
X-Received: by 2002:a17:90b:390e:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-396d0fe20a7mr10169834a91.16.1787906959279;
        Fri, 28 Aug 2026 01:49:19 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0de4d92sm3843670c88.13.2026.08.28.01.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:18 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 4/9] crash_dump: Free temporary dm-crypt keys_header buffer in kdump kernel
Date: Fri, 28 Aug 2026 16:48:50 +0800
Message-ID: <20260828084900.1496839-5-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828084900.1496839-1-coiby.xu@gmail.com>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although we expect the system to reboot immediately after vmcore dumping
is finished, it's still good to free the temporary keys_header buffer.

Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kernel")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 0b9e09c60745..91b7a5413b62 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -118,6 +118,7 @@ static int get_keys_from_kdump_reserved_memory(void)
 
 static int restore_dm_crypt_keys_to_thread_keyring(void)
 {
+	struct keys_header *keys_header __free(kfree_sensitive) = NULL;
 	struct dm_crypt_key *key;
 	size_t keys_header_size;
 	key_ref_t keyring_ref;
-- 
2.55.0

