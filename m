Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793297422;
	b=XtPvEFEilBgSSvMV5apuwH9/R6qvS9SKbcD3Wt+tVYaFtnaBa1ijrabEbS91e1CbBapE
	 5r8k/azNJ/ay9lkig/yMO7QKTYaIh1iUmYPm2YVyopY5cv9JiGsvEJHIUUbnI4gT23JeR
	 5y5ZD+q7YvpzO4ACn5q1QCJ4XYAii+VqOMNhYz1JDoQbxV7IywNLXhZUgGZeef2veU6YS
	 ZSvg6RSiXfwkXc5sL1CyzVMcQsAqSwbEvNu53bUMsKXikALtnU1pbyg9ly/HOO7VZJGm2
	 diYfuo3a9t4PN3o/CPr9KrKsf40ZmJke116K2KKWScx3kqGPlWjy8u6SSGMuU4hF5Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EGTY/uQ+UTmLe+oR99zarlRNM/ZZQqy4vu68uMqnYps=;
	b=By1YmRB4Jx3wSL9qc6zr9nqRzzKtRMvtENCddDSIVKl5Oz9DTzGdEn68AOjmRmbvRClH
	 KZ6Pz123X/mDEQKvljF7IQuFlHkRXSzD+tm5H/tC88QR3xf6iS1acDSfwX/frWD0y188m
	 EjDT5JXb9rxOMHg5GNkR1/d8nLmw/q/kGiQaYX1d5kn9nAGREEnrB7hEdYwsswvbuJCqc
	 ONOsH+u/CbAwPq/5/I99JMCUyxrErziLl55wjFlKRw34r2j6WZLaRhDtHAiWkKtWymn1S
	 S03o79pz+0awvgsGZ75kJXc6yzvGmoS3xs21yGMZH03yJD8sTuQ8vToYZBHbTTuqe2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HEyzv5yK;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFE5606AB5F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFE5606AB5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HEyzv5yK
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91b52ba422cso31550996d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297421; x=1793902221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EGTY/uQ+UTmLe+oR99zarlRNM/ZZQqy4vu68uMqnYps=;
        b=HEyzv5yKUc+ILSupxzbFPXWI0K0JGjBSo21KDgxT33fJKSQHZCPzVyYksLSTP81YHL
         7sdyBlhCkN0yNt+7zRGjklaq7bn8Hmca4w+ynjGlnG051d7a7YqkX222TPb80hTI6gNT
         Nx6Miy9BMFxw1b/yOEII62+mlbPE9uuz9cBo+79MNeOkG/duCE80Ztxcw341G5k1muBm
         8Z4lM5L7HVtf8vP6QqvCKhk7NeuH+Cs0aIFOyyk+OnwqpUW/2HFzgNg/9fbzpRjz6NUT
         uplwc+8OwTTyYLHUOWxlFjWwlDIkvjNvfsykkyNf1tUIvBWncMVRT7qIYlVzWagew2xl
         dx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297421; x=1793902221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EGTY/uQ+UTmLe+oR99zarlRNM/ZZQqy4vu68uMqnYps=;
        b=aqFCsxnyutG0MRCR4cAFSf6c+odWL5jsNkPC0xxD5p1es8mKQ36t9uTxC9WEwRp47K
         hhXHOoBwZCd05JJKzA2knOE2aBDrcW2Xuds18krLtjinAdMdPzk8GAmCxKdtulod/iKt
         61yPDyvnnCk9VI1jy731IP8ezlqvwqyHGCiO5vjDrkllwUXIRVsCKk8ttzouSsxGC8gq
         V34Wkyf4K9BmIjyAq/mWMTivB68DBeqJeWCkcTFOpZt//gdUSqOXERbqhin+6Ho1DYq1
         4+r69M/f8gFUtjQkjzvFeQiGhUhtWei2vaSVjldqp/T+iZxlwsOlh6RKGRemWaF8P8ZJ
         P0CQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaRK1nKb9ML3j+r7+Lu4jrRWLqqhLvonb/xzZSBZMvy6WJDFApcJRFBIz1KT0ECz9A3ZU4pFQqOZblYUE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg/qDUHF/btfP8xAYKmdlBw75J1avvVI0JTXOrTzP9TF/KtjkO
	ati4s4o3W2Ou7RFSfggDDjwifqIYSPhsdvqi6lEktu0RAN9GujhHBr++
X-Gm-Gg: AYBFou3II3fb+HMjQi9AVznPvuHA6WvWC/Ex4WGRTGOwKk09XHU2Kn6KIGK2mLWQM3h
	/qRRoAuLWpmwRJ2eRawT1o/zWCz9reL+q7m2cIp0jLH//UrABus5jdwjPSSCy+AiC8zY6+kEDMF
	5akizbjOWqpIPVRDvdVTSJn1tNRH5LOONjcwsuBMwXzY/zL+QdnHA4QoxMEEao+ZncRoiXut3m0
	TInlI/mfAwmVeDE6aGS15Zgk7ISYJCbOagV0YKC6K0EMnM95togJL0PDd6SipDfA/wPIJruHlH/
	hiwD1/oqvyNLFi1ck03K/CvbvBWNWlrcYVrN8iYdkN0NBzBCPPNkrNMGpFAxjn+lWOqKdI0uYpr
	tVXGbWToL8o8F8b4encLbR6avfUUldAmz7wypzM29s/mM0BLeRH9/9HNh6g8Hyj/4pgIrfAmPV3
	76bFjI5y7hBHMu9rhoaD4C0dwJx5LT8tqMa/2ZkDC2ggg+M3BHJjd8JoU+IEXlO2T+1qcitBK7c
	bx8ozP64FSEEG0YO9a7YZONf/Rt6+gZYiOjrhWC70xVbCx7m0AjoNOdCH0pPxt+wJLDVDRwxLD2
	4/fiQwfxXmi/aG1zbfIGrusdmU+hrCnel4DGkUbZPt+LRSgSZusp6Smf+zI=
X-Received: by 2002:a05:620a:6886:b0:93e:60e8:c9ad with SMTP id af79cd13be357-94421588089mr2508085a.12.1793297420516;
        Thu, 29 Oct 2026 11:10:20 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94421252364sm6295285a.28.2026.10.29.11.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:10:19 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Cc: NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] nfsd: pin the module while a server exists
Date: Thu, 29 Oct 2026 14:10:05 -0400
Message-ID: <20261029181006.1305530-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026235626.649844-1-shuangpeng.kernel@gmail.com>
References: <20261026235626.649844-1-shuangpeng.kernel@gmail.com>
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

Since commit 924f4fb003ba ("NFSD: convert write_threads to netlink
command") the server can be started over netlink without mounting the
nfsd filesystem. But that mount was the only thing pinning the module
while a server exists (commit f49169c97fce ("NFSD: Remove
svc_serv_ops::svo_module") removed the per-thread reference).

So when the server has been started via netlink, a plain "rmmod nfsd"
succeeds while the threads are still running. exit_nfsd() then frees
struct nfsd_net in unregister_pernet_subsys(), destroys the DRC slab
and finally unmaps the module text underneath the running threads:

  BUG: KASAN: slab-use-after-free in nfsd_file_net_dispose (fs/nfsd/filecache.c:483) nfsd
  Read of size 8 at addr ffff888109fe92d0 by task nfsd/300
  Call Trace:
   nfsd_file_net_dispose (fs/nfsd/filecache.c:483) nfsd
   nfsd (fs/nfsd/nfssvc.c:957) nfsd
   kthread (kernel/kthread.c:436)
   ret_from_fork (arch/x86/kernel/process.c:158)
  Freed by task 311:
   kfree (mm/slub.c:6802)
   ops_undo_list (net/core/net_namespace.c:257)
   unregister_pernet_operations (net/core/net_namespace.c:1412)
   unregister_pernet_subsys (net/core/net_namespace.c:1459)
   cleanup_module nfsd
   __se_sys_delete_module (kernel/module/main.c:804)

followed by a general protection fault in nfsd_cache_lookup() as soon
as a thread allocates from the destroyed drc_slab.

Take a module reference in nfsd_create_serv() and drop it in
nfsd_destroy_serv(), so that "rmmod nfsd" fails with EBUSY while a
server exists, just as it does while the nfsd filesystem is mounted.

Use try_module_get() rather than __module_get(): a netlink command
runs without a reference on the nfsd module, and exit_nfsd() only
waits for it in genl_unregister_family(). A THREADS_SET or
LISTENER_SET request that is already running when "rmmod nfsd" starts
would otherwise still create a server after module unload has begun.
With try_module_get() that request fails with ENODEV instead.

Pinning the module also keeps the assumption behind the
__module_get() calls in fs/locks.c (via lm_mod_owner) and in
nfs_common/nfslocalio.c valid: they rely on an active server keeping
the module alive.

To reproduce: start the server with nfsdctl (or any other netlink
client) without mounting the nfsd filesystem, then run "rmmod nfsd".

Fixes: 924f4fb003ba ("NFSD: convert write_threads to netlink command")
Cc: stable@vger.kernel.org # v6.10+
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
Changes since v1:
- Pin the module while a server exists instead of shutting the server
  down in nfsd_net_exit(). As the sashiko review pointed out, shutting
  it down from exit_nfsd() still lets every __module_get(THIS_MODULE)
  taken during module exit (fs/locks.c via lm_mod_owner, nfslocalio)
  outlive free_module(). With the reference held, exit_nfsd() never
  runs while a server exists, so the laundry_wq / cld notifier ordering
  changes from v1 are not needed either.
- Take the reference with try_module_get(). A netlink command holds no
  reference on nfsd, so with __module_get() a LISTENER_SET/THREADS_SET
  that was already running when "rmmod nfsd" started could still bring
  up a server, and its threads then ran on the freed module text.
- Not changed: an exiting nfsd thread still executes a few instructions
  of module code after svc_stop_kthreads() has been woken up. That
  window exists on the umount path as well and is independent of this
  fix.

v1: https://lore.kernel.org/linux-nfs/20261026235626.649844-1-shuangpeng.kernel@gmail.com/

Tested on top of 7.3-rc7 with KASAN: with the server started over
netlink, "rmmod nfsd" now fails with EBUSY, also while a request is in
flight and with only a listener configured; after setting the thread
count to 0 the module unloads cleanly; starting and stopping the server
through the nfsd filesystem is unchanged. With a delay injected at the
top of nfsd_create_serv() to hold a netlink start open across "rmmod
nfsd", the start now fails with ENODEV and the module unloads cleanly
(with __module_get() the threads came up and oopsed in freed module
text).
 fs/nfsd/nfssvc.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/fs/nfsd/nfssvc.c b/fs/nfsd/nfssvc.c
index 067543da3ca0..6ae040c50987 100644
--- a/fs/nfsd/nfssvc.c
+++ b/fs/nfsd/nfssvc.c
@@ -579,6 +579,7 @@ void nfsd_destroy_serv(struct net *net)
 	svc_xprt_destroy_all(serv, net, true);
 	nfsd_shutdown_net(net);
 	svc_destroy(&serv);
+	module_put(THIS_MODULE);
 }
 
 void nfsd_reset_versions(struct nfsd_net *nn)
@@ -662,10 +663,18 @@ int nfsd_create_serv(struct net *net, bool no_rpcbind)
 	if (nn->nfsd_serv)
 		return 0;
 
+	/*
+	 * Keep the module loaded while the server exists, as a mounted
+	 * nfsd filesystem does. A netlink caller holds no module
+	 * reference, so this fails if module unload has already begun.
+	 */
+	if (!try_module_get(THIS_MODULE))
+		return -ENODEV;
+
 	error = percpu_ref_init(&nn->nfsd_net_ref, nfsd_net_free,
 				0, GFP_KERNEL);
 	if (error)
-		return error;
+		goto out_put;
 	init_completion(&nn->nfsd_net_free_done);
 	init_completion(&nn->nfsd_net_confirm_done);
 
@@ -677,7 +686,8 @@ int nfsd_create_serv(struct net *net, bool no_rpcbind)
 				 nn->max_blksize, nfsd);
 	if (serv == NULL) {
 		percpu_ref_exit(&nn->nfsd_net_ref);
-		return -ENOMEM;
+		error = -ENOMEM;
+		goto out_put;
 	}
 	serv->sv_tls = true;
 
@@ -688,7 +698,7 @@ int nfsd_create_serv(struct net *net, bool no_rpcbind)
 	if (error < 0) {
 		svc_destroy(&serv);
 		percpu_ref_exit(&nn->nfsd_net_ref);
-		return error;
+		goto out_put;
 	}
 	/*
 	 * Register before publishing nn->nfsd_serv.  Namespaces are only
@@ -704,6 +714,10 @@ int nfsd_create_serv(struct net *net, bool no_rpcbind)
 
 	nfsd_reset_write_verifier(nn);
 	return 0;
+
+out_put:
+	module_put(THIS_MODULE);
+	return error;
 }
 
 int nfsd_nrpools(struct net *net)
-- 
2.43.0

