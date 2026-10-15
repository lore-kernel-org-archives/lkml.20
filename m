Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927943ED11F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080747; cv=none; b=IA/xjzTSgDYgW8Zy3qBwOu0ghWFgid+jyvIn8msikpQ9BLecMDncJn70HUDy3wGbHvKZ/tCiIvj+3/vK4NS9zxheQjF9YS3cao2dCUwX3QTHMnQE/9jgSJRBw1EaQjofsm75IGfM3sweyqeBGL1KvxHS0rZOVzQICJG+tNr5eO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080747; c=relaxed/simple;
	bh=pwOQdieYZCRLGlhC7xNMLdBqVcBUb45jf4HriGAEWns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L3PX2MUl9MhkjJl0koywNhGubq+4ev13CA0CgSM/tSTWGeX9/4tLUJ0U5DfTZp7+8FQL7wdIRIhN37ow7Z6KbAD50Iz0xuT66ZxxGFtlXb3mAGhulI7rQPIt0HuBPEPxndSLyRDIywlF2oa+9Got1I16z/k53f3J/QGIH3MUCz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XofJitJR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nn68ss9u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XofJitJR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nn68ss9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792080735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=naqyP/7sa0WIDSkQeO1oWhp4/Qc8hwdzJAyRvlL0fCA=;
	b=XofJitJRUOiIdouDtQodhWD/DNHwLE6xpmuUhttIWI5i271dFpzq06Crp2AMPtY3NSTynv
	rcUWvhbB6F8Piwi3hV3YPR4r+56ku5bTMxgPXSACdV6fhNbSaCGAdzW9ovWK2nm6kJe0kH
	em4KgV7et4dNsAbV3F87LaYweCbyf1U=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-_OkF-garMCaRnFMgKJO4HA-1; Thu, 15 Oct 2026 16:12:14 +0000
X-MC-Unique: _OkF-garMCaRnFMgKJO4HA-1
X-Mimecast-MFC-AGG-ID: _OkF-garMCaRnFMgKJO4HA_1792080733
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso14128289eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792080733; x=1792685533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=naqyP/7sa0WIDSkQeO1oWhp4/Qc8hwdzJAyRvlL0fCA=;
        b=Nn68ss9uic/SKljK9uK/Ever5SBFSCf4qnC/pYGUg9voO8f/35PcpYNAvxJJM90eZl
         r2fLvTdscKGlML1MqZ4tyfShuLm1jGN/n8JIHwsiCy6LczUNOa89y3sp324vsiMTsx/n
         Wm93eYr3+Pwy4lEh3Zz7+nIRfhbLu1D5kPmI7WLo2fOMKBgMY7YVKceYJ+NHHv/TvkVm
         qW5vHBCyiZyzeSmdbxh9K4JMbh9gmDMsRxoYxdBLR/iHxvoNCID2Z4NVgQWBqhUa5NQz
         AK12yB3x4z6nZ6a2MPuIPAkvRA5cIx8zuAVaLUKijFh0CJ9X+niohkLSO79P9A0Z7U4f
         ou1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080733; x=1792685533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=naqyP/7sa0WIDSkQeO1oWhp4/Qc8hwdzJAyRvlL0fCA=;
        b=CdkkkscTjaEcnrX4MwRw/zrsKrpgxN+/tYbzIPANNELMutUy32tnGwgo5aOcG2pSr8
         t50cDL2hhcnq5wBfgrqcpxFU5t3vMoDGrvwIZ8qdsZ203ac1RFO6H0rkJtNqjK1NcyFX
         oUQ8zcuTN5+VKT3bvS29JnkFCIQYd1sy680CQbieslEtseZgmW6Y2TIGTmGcLIDqELT+
         nOSWfeMSxpQ3IWWZTHHkxb2SGA2c3VDZbLoNULZlSnK00JGUBoVy9Wgiw1nYsXk4iEV5
         gJzcGpimuOxU1161oNk9bXdzQcWLMn/4oRRzzwAZbtETX7q8CiIv+IBKPVIbbTNpwBj8
         /Mlg==
X-Forwarded-Encrypted: i=1; AKwUvBzruUFtFwFgPFGjb776wEwSppz1ON0cE1FdPSYfTp82fxtRLgV3tg4UFSruXe+fwcPy9h6F6nJ+AJ1nLiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYfE8yFN54kMx7bAvSUcGi/XYaGvx3KGKG+C25wmU6sWJ7Kdzx
	1bMK1UIAvLmEgoExzwHQNtQBTFEu39FnmNh03RCFTd4JnvTbJf2vamoDKzdDbJXPyZGfJuInWvn
	Ep7R2/wbDw2mgWKnE50ZJQKYiqwjasDSTdEoVb/22iKcZrtiFDbgh7LgwhY1DFjP0eA==
X-Gm-Gg: AYBFou1zXNb1Rc2B0ZxqgiIVGW1hl8xCLMrs0lvQ4FuBp2fgI3oZu5h41dylw2kq/36
	oNy96l8wAaX/qk9OFlJ6+6/uD0dgZf1/N9iRgSQVBDwa5PQy8m1Og/az73w1cAQLUMVndqMCx1k
	1HdyLDXYzmH7WiyrZ/5SPCb2KVV5JBJPmitefD2917jrZITt2PWmxtV0OSwHO3KO+BvMHFW76Iw
	7n/hki/4CeLfJd+XkQ1k543n3Gs5KLszH1WneC+zTEbCn+U/ZaGIKy6K9vUogHKCojosV434UIe
	MU4fhqeifr1oTtNQKcDm9sW8VJeY0bk2rKoNxxIC6WbKsxHQPA0CtXBDi1xMG9IEw0lnXpp04AF
	+ujAiKkPj1OZ/Ot3H6Dx5ZDAM/vhqRMDgsM8/cqxuzgcViie/6CuzP14obiEtyKLRy7JKEfBY7p
	hTX51DOj3o9Cidzw==
X-Received: by 2002:a05:7300:d18a:b0:35f:a2ad:5ef with SMTP id 5a478bee46e88-35fa2ad064fmr1830957eec.10.1792080732566;
        Thu, 15 Oct 2026 09:12:12 -0700 (PDT)
X-Received: by 2002:a05:7300:d18a:b0:35f:a2ad:5ef with SMTP id 5a478bee46e88-35fa2ad064fmr1830896eec.10.1792080731456;
        Thu, 15 Oct 2026 09:12:11 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm49961933eec.11.2026.10.15.09.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:12:11 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: Alex Markuze <amarkuze@redhat.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Xiubo Li <xiubo.li@clyso.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] ceph: add subvolume quarantine wire definitions
Date: Thu, 15 Oct 2026 16:12:02 +0000
Message-Id: <16cfdee842339f09eb5c16c24d7e288d86f0b274.1792074165.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792074165.git.amarkuze@redhat.com>
References: <cover.1792074165.git.amarkuze@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MDS revokes a quarantined subvolume's caps to PIN and reports
-CEPH_EQUARANTINED in MClientCaps v14. This wire errno is 1000 and
must be translated to EACCES before returning it to applications.
When quarantine is lifted, MQuarantineDisable identifies the inode
whose local mark can be cleared.

Add the errno, message type and packed disable payload, and teach
ceph_msg_type_name() the message name. Advertise the session feature
only after the client can enforce quarantine on cached access.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 include/linux/ceph/ceph_fs.h | 13 +++++++++++++
 net/ceph/ceph_common.c       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/ceph/ceph_fs.h b/include/linux/ceph/ceph_fs.h
index d70bbce1a1b2..5afccfa891cb 100644
--- a/include/linux/ceph/ceph_fs.h
+++ b/include/linux/ceph/ceph_fs.h
@@ -154,6 +154,7 @@ const char *ceph_con_mode_name(int mode);
 #define CEPH_MSG_CLIENT_SNAP            0x312
 #define CEPH_MSG_CLIENT_CAPRELEASE      0x313
 #define CEPH_MSG_CLIENT_QUOTA           0x314
+#define CEPH_MSG_CLIENT_QUARANTINE_DISABLE 0x315
 
 /* pool ops */
 #define CEPH_MSG_POOLOP_REPLY           48
@@ -921,4 +922,16 @@ struct ceph_mds_quota {
 	__le64 max_files;	/* quota max. files */
 } __attribute__ ((packed));
 
+/*
+ * Cap oserrno used by the MDS when a subvolume is quarantined.
+ * This is not a VFS errno; applications see -EACCES.
+ */
+#define CEPH_EQUARANTINED	1000
+
+/* MDS -> client: quarantine lifted for one inode (ino, oserrno). */
+struct ceph_mds_quarantine_disable {
+	__le64 ino;
+	__le32 oserrno;
+} __packed;
+
 #endif
diff --git a/net/ceph/ceph_common.c b/net/ceph/ceph_common.c
index 67e88f30409d..cc3d21fd7d5b 100644
--- a/net/ceph/ceph_common.c
+++ b/net/ceph/ceph_common.c
@@ -83,6 +83,8 @@ const char *ceph_msg_type_name(int type)
 	case CEPH_MSG_CLIENT_CAPS: return "client_caps";
 	case CEPH_MSG_CLIENT_CAPRELEASE: return "client_cap_release";
 	case CEPH_MSG_CLIENT_QUOTA: return "client_quota";
+	case CEPH_MSG_CLIENT_QUARANTINE_DISABLE:
+		return "client_quarantine_disable";
 	case CEPH_MSG_CLIENT_SNAP: return "client_snap";
 	case CEPH_MSG_CLIENT_LEASE: return "client_lease";
 	case CEPH_MSG_POOLOP_REPLY: return "poolop_reply";
-- 
2.34.1

