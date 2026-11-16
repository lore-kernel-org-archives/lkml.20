Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795963;
	b=HZdOTyy8fJVUTVrATRjfrXqqhgCP4DoajOaU/x1H+BGERGl6BnA75x9xS/htpbb1GVUm
	 uuOovTPN0pvV1LBsk3SeqRaVRndOVDUnq+M+cex5U1X3O9OmEtCBoouR1bzhNQOVLfLhm
	 dL7SkeiKDRqfG3DIjL3hUrE/0csqhqcCFp2DYQLhFNxAK1Xfb8KBC8878ccmlBR2uj53Y
	 E/u5oU65Nrq3A330cRI0zYoJBC0umnaguEeKB4n0v/1f8y9Rx7Ni6wr5oKCsvJcL7xf6g
	 /Lph3yEpBqeVkfVTwhSueZcYrHf2wldauvnP0oHZAOyPo4MdwHW1L66cv2X3n4EjCSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=60NXe0aph5ZMdSm2+R+aQQFvNAI/XZMFjJbvfurWO3U=;
	b=PPYsBvYtTLfvr4xkCYUV5dlv86a6ec+OcEBbw071xc8j4ZZn28oNIY+5qAZCPMaRUK1i
	 KSbBpYA1cTt7B7cJnu7de6ksXDFwYRLv+qP/upl5vXPy5j2e/bFUFXLSJuq2EYVVDovkH
	 i54C/NqmpbYlwIPhI2z20EFgAfHe24g1FzXOuoyVe39jdHCiHviJlPtxaFJEPF12av+eq
	 M3ItTGKugdBLUiDCs2Z757jFpPpZWrjU1asRCsLpoYDDqgI8uavZnZXQUmsjC5GQR//ev
	 kgczZJ2Z2+8ZmllRTEeTGGTlMBi03kMc9rqvaxSLffJtyBK1uqUaGnQfNDrNQqc456A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USLvXQ7y;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE147606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE147606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USLvXQ7y
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55d2f5f1e26so10667021cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795962; x=1795400762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=60NXe0aph5ZMdSm2+R+aQQFvNAI/XZMFjJbvfurWO3U=;
        b=USLvXQ7yslUy3kKAnPIHDIwjgyAd6GE5uuPzlyJX3LLahr9NOEP4f5imYOZQvrIP3G
         wbUWIY4GMLQqmUWsoawpQEj2Zt2wG3jFaSMoM1APIXBNDVPXZXxuyWoq/ktqhcirdeEk
         eYJieKLQjFkmx77ONkqcfQFI6dJfq4j6x5oJa4Xreo/joXvhJHqJF8cgRS+WCTOBKXsS
         sYusybscVG6rmMqWOljT6131sPI00s09swJxTh6HaXF+FT++Lk/7gV+rvlmBeUHvNaRI
         gkubWO0tkCZqLg0PhNLQJYGmah6A0y2HGEaZijyjp0DdiwS7HTUI2XGli9FWB/HLrfDK
         Jh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795962; x=1795400762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60NXe0aph5ZMdSm2+R+aQQFvNAI/XZMFjJbvfurWO3U=;
        b=m3ZHdRJS4GAFLf+nHKSErnLa+YU6ntYJ9N8M1JMGldxjTepuhAXA/y7KlE5BV3rQIH
         N1OrH2fmqQyRig2StXBSrG0rQ5DxW9hfr/3ZodWaDh1zGIT+nIV1nNOP9/b2PC7uWC/p
         f3Ne/3MxKmjUpO1lEJsfPrPEydH395uNIq8CwF6iF9qLc7eQyK/b4BO0II5OhAO/QHRd
         rBfy/ie+4h3kAVtIcLULL4vwZ8Eif3mWTdEHV1/CQNAywn93yntUFNC84Yzg0MAN2GJc
         6xAIYlyRIoq69C/Sis2v//4oOL1cYkpsKaEXfP3LjxDxNYkK/iOEchJM7oHXKBTBCyaq
         rCvw==
X-Forwarded-Encrypted: i=1; AL+hErFX0+w9J8zzf27kyQZ54Z7rzf+ppBIYFGiQxg51GPOwF0aFDFpv3qNSZRoeyDI+wBhIHZ/TcYulOEZKx+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yBMCtpYD1+DKrYgpOYpKb4Jky97OuWjzODKYKgtnjYZDm6zga
	tGgbcpRXcoov8p18ZqjpIkCvmmBr/Ju0ljYvHDR8QVzK3vfCVZOo3CFE
X-Gm-Gg: AYBFou3gGN2zE1fqQ10MV2i8fq1DlUnwOZp5Wn03r+EjDpn13ffpgQUtTPhoEHgOk3T
	gDhenE3LUkkG8ShV0SjBf/V7tbwPOTTsT6Iuk84wDJsfwifvx29lN25DvAwawya6yY+1DXmo5n3
	Np5lBH6pnpZUfc6djMScDGl75Qe1oor21i4oiKh71Y2KGzwLflvjqTfzytj72TddVQRIqYBEWQd
	bVCAZxiwFty9jN3kFotyRA2YmWxXRN0hzALPukZouvcUF1NaM70iqBr1Uk6eFDUhYPfLulrkn7A
	iVAeWvu5G+fRRsZ9uJJBra6xs0jxph0lwdk8KdTxbCQSVf6ovx2avXi/mejYEnQnxSec4yjIPb3
	stmFlgT+FnUlq9sThUgr9rMJpVQVQiAD5rICWjLplKCioWbWJ6XMQ1eyx9iKNIm1/RaBjXYGck9
	3yAOrkU+Scm3PvzN6o/VDZVOhNX+EuhvfborTIVQQBZ+QMPpaZzPX/0XXlsGJuvVphq0xbKFo/9
	JedhZQOtipYvgpXUklQenRSlkT2/hrNjkMhDY35fG1MVIfjAhd5f9JtjnvRoaph896YyU4V/54S
	wxPP+F0HDTI5Sxlr3MAQWkqw+djfAc6BX3OeRfhR8ewVkQ0BAr+omeJVIvLz/8Z6rCeSCwnYUhE
	=
X-Received: by 2002:a05:622a:5793:b0:54f:863d:92c7 with SMTP id d75a77b69052e-55ac786019emr156129861cf.41.1794795961766;
        Sun, 15 Nov 2026 18:26:01 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34f869dfsm21962901cf.6.2026.11.15.18.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:26:01 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Logan Gunthorpe <logang@deltatee.com>,
	Stephen Bates <sbates@raithlin.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] nvmet: look up the P2P device under rcu_read_lock()
Date: Sun, 15 Nov 2026 21:25:58 -0500
Message-ID: <20261116022558.560013-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

nvmet_req_find_p2p_dev() looks up ctrl->p2p_ns_map in the I/O path
without subsys->lock and outside an RCU read-side critical section.
nvmet_ns_disable() can meanwhile delete an entry from the same radix
tree, and radix_tree_delete() frees the nodes that become empty with
call_rcu(). With preemptible RCU, the grace period can end while the
lookup still walks such a node, and the lookup reads freed memory.

radix_tree_lookup() without the tree lock must be called under
rcu_read_lock(). Take it around the lookup.

Fixes: c6925093d0b2 ("nvmet: Optionally use PCI P2P memory")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus NVME_TARGET_RDMA,
PCI_P2PDMA and W=1.

 drivers/nvme/target/core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index e31d65228c11..1b34fc5549f6 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -1341,10 +1341,17 @@ static int nvmet_req_alloc_p2pmem_sgls(struct pci_dev *p2p_dev,
 
 static struct pci_dev *nvmet_req_find_p2p_dev(struct nvmet_req *req)
 {
+	struct pci_dev *p2p_dev;
+
 	if (!IS_ENABLED(CONFIG_PCI_P2PDMA) ||
 	    !req->sq->ctrl || !req->sq->qid || !req->ns)
 		return NULL;
-	return radix_tree_lookup(&req->sq->ctrl->p2p_ns_map, req->ns->nsid);
+
+	rcu_read_lock();
+	p2p_dev = radix_tree_lookup(&req->sq->ctrl->p2p_ns_map, req->ns->nsid);
+	rcu_read_unlock();
+
+	return p2p_dev;
 }
 
 int nvmet_req_alloc_sgls(struct nvmet_req *req)

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

