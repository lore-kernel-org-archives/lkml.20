Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793059034;
	b=BSlWyqmjl9QD0ZXM/jm9CTJay5mCaXpREzcF5L+lMwcmnctBAcWHkgC2Ev9JmYzfHltl
	 7TcKbDtmeh6qR69scDX+JnAogUqkIfF5Tl/uG9RKxK9Qo9N9fgASVbaowtl9l9gIdF21R
	 uXzHUdCnnO0BAsevcD2weqKXCkzeEbSWCvlZ6V1ky6ToCrM7uF9pAEKzEY4GaIWOb4Yo8
	 /+t2GnoBUzq1kjIyl+Ox8OrzBWD790SNC3Gp7JbKqP9+rNH9djzPk+uy8V5ytgw/1BKK4
	 52WldJBe+r4YKLG/EFAAVTVTNbBRtrGfrlHdRDST5QcMqmWAxBIU4XMDq74DP4APr6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793059034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qDIKx2Op6aSLUbez/797DuVnzQCw0y2by19BWYigguE=;
	b=d8Gm4J2X01zxh5b7l+RG5+PwmyNbYq3j8gaKqWhrW9vJPJP7xKZF4L+4vZ4juYfBM6hD
	 a8V2RB0JYx12jUfMauLS0T0NZ392wqT/6rgQcRpbtVDeO9c9XRdnrDbg4kc49SGh/JkWj
	 hNiLibPmv8XbgqTRwT/qNoVrUTMMJaDl3L5eh4mD018knJXSLlsUf3CvY7mB3+zamPpra
	 QlpjR+533LrzBLlYwr/lWJMGYPFY3CMgsM5ZyAsQyTOB5NpK35aZLCro98WCSufs8YdJP
	 nEgdVbqPO95rEvivufsRRAHy81YPPNNztLp2KYAEqs2efP+UhKUFk4PYcKcfVEGPeJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Iak8vfcQ;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD13606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD13606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Iak8vfcQ
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91791ec1b83so28567936d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793059033; x=1793663833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qDIKx2Op6aSLUbez/797DuVnzQCw0y2by19BWYigguE=;
        b=Iak8vfcQjHrDPwgQ6ujDpPm2w85Fejjtj5b68bZf8Kj1152YR6lk8u/qfNFnfWa6aT
         r+KT97wPb8ErZD8+MYStSX8iWx4LCW6/GOfeSYoMfmKwaHjQGn2ZsFkzrRT6eQJITsxM
         I2wFhWIjq1sDrASOUfFNtqJ2ygtqju0UOC/O1xL9jSehAaSGhF/ZYlPIJHAJ0Qy7OFtO
         CNIM0kcfjWR1bozkvCAuFFVZbphBqYsgt6PtXAKune2U1c4VYL9b33DTFsYCgQWlHbpF
         ytPxeNguoQVhpDQa4DuXvUfLHku/wL2Q3yWLpz+44dbreFarrSkFZV58Ulj2jbKPaPkS
         TYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793059033; x=1793663833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDIKx2Op6aSLUbez/797DuVnzQCw0y2by19BWYigguE=;
        b=LPQdeldyxoNRYSix/kKs3MBOa26uhTKR45o7y/7wpQ14k3JV2aD1H4W5JzqFhj8nbU
         fl8W8OgK8TAv/74iRTgePrMV0eVyF/FmgRJqWNfgO63nyq7G7hi+XdAb+FSNhDuVLaxk
         xv7kIdJdDvHyAZ7YNBqjr2D+Gn4FLdQK2qlpbqkVkLAG+1KVUhISbxmddmTXU97KSKEL
         gj7BC2GJUBRKFuyvbN4YXyWguPbNOqehjti/igWBb94I4CXjlQPqANzVMdsnmuA05f6q
         U++BTYlKvd8u+Oo/zHcTmWhnhCTi40GiIU1HSz5xmTfYfOGjyie1Jci7nv7tjmoeeIH+
         73lA==
X-Forwarded-Encrypted: i=1; AKwUvBwi104UV0IYInMR//eh938m0gquIVxOR7//oI03gI4FfBPDWv8v7WiHAZ3vg0yIY7/Mi5AG0vhckcMKQ7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvnHfYRtkkPEeJdFBAMzEcdn6ppEhxsg9StcKeLNNLilfZcFnX
	auqtLiuZY/nwydjhl+jA5jn198ZuM4+AdPArHSUs/Bayw+9AsO9SIrzDB6lmPmf8
X-Gm-Gg: AYBFou3zTtSFwDr8DE0x0HFYE67ggBlcE3qD6Z7LKihXw/fhCeQsida4oSydYMY6Ne+
	ICiRqRj9QtQkKog32Oib3bc7Srsc2rDs2pgugioby3abt6ICQJH8p52iqmjudNr39Gl+V0QS1eP
	nAxDbLWQQcf5TIK8RbKKoZRTz2eux3vDcWN2Z/PpVoxzhIhBUXMpI20A4l8GRfINzbklO29bcq+
	GFU1tMPeNgN5Wblr8negFaapuMGxIBNl5Hva4EgrLPplynZFXCXUvdp6CKaDM/9mNFRNtVHc5n2
	k2Ati3mSHKxlOOw+qVA5FhDkSza4XS69L2jERrzAJQdqYiKB3yVF1xJ8SemDPB10ix8Nz04tt14
	5HSt9u7d/m6c/GK5NqLnjZREEY6KtiiNVSzpSbnBmNsvGNrCxIeL3UXs1xXAhpuvtgGfMOzkw4m
	9dcrTwVFgHgH0KUlEhoPvhlzjrrFfW6YcmamBAD+aU0VZP90cbXm+BWSHxJsnpuW4PqnxT3SJA6
	ACmnItYy1d3fMhFE1gSDMWtjoMO4i+qA7BWmc/mu8clOV/vC+hag0SW6yv7wee6HI039J3Ll0G7
	T2pG8EY6FMhgts549qwpGEMyGhxnRno=
X-Received: by 2002:a05:620a:8702:20b0:940:f224:5a63 with SMTP id af79cd13be357-940f2245db0mr872745185a.64.1793059032925;
        Mon, 26 Oct 2026 16:57:12 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787f33sm823849485a.25.2026.10.26.16.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:57:11 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Cc: NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] nfsd: shut down running servers in nfsd_net_exit()
Date: Mon, 26 Oct 2026 19:56:26 -0400
Message-ID: <20261026235626.649844-1-shuangpeng.kernel@gmail.com>
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

Since commit 924f4fb003ba ("NFSD: convert write_threads to netlink
command") the server can be started over netlink without mounting the
nfsd filesystem. But that mount was the only thing pinning the module
while threads run (commit f49169c97fce ("NFSD: Remove
svc_serv_ops::svo_module") removed the per-thread reference), and
nfsd_umount() is the only caller of nfsd_shutdown_threads().

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

Shut down a server that is still running for a net namespace in
nfsd_net_exit(), which is invoked for every net namespace when the
module is unloaded. nfsd_shutdown_threads() is a no-op when no server
exists, so nothing changes for the common case. As the laundromat
work is queued on laundry_wq until the server is shut down, destroy
that workqueue after unregister_pernet_subsys().

To reproduce: start the server with nfsdctl (or any other netlink
client) without mounting the nfsd filesystem, then run "rmmod nfsd".

Fixes: 924f4fb003ba ("NFSD: convert write_threads to netlink command")
Cc: stable@vger.kernel.org # v6.10+
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
Tested on top of 7.3-rc7 with KASAN and with PROVE_LOCKING: with the
server started over netlink and an NFSv3 request in flight, "rmmod nfsd"
now waits for the request to complete and unloads cleanly; starting and
stopping the server via netlink and via the nfsd filesystem still works.

An alternative would be to take a module reference while a server
exists so that rmmod fails with EBUSY, as it does while the nfsd
filesystem is mounted. Stopping the server in nfsd_net_exit() seemed
simpler and mirrors what nfsd_umount() does, but I am happy to rework
it if the other behaviour is preferred.
 fs/nfsd/nfsctl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
index f32311f2d7cf..0a9679114b58 100644
--- a/fs/nfsd/nfsctl.c
+++ b/fs/nfsd/nfsctl.c
@@ -3113,6 +3113,7 @@ static __net_exit void nfsd_net_exit(struct net *net)
 {
 	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
 
+	nfsd_shutdown_threads(net);
 	kfree_sensitive(nn->fh_key);
 	nfsd_net_cb_shutdown(nn);
 	nfsd_proc_stat_shutdown(net);
@@ -3200,9 +3201,9 @@ static void __exit exit_nfsd(void)
 	remove_proc_entry("fs/nfs", NULL);
 	genl_unregister_family(&nfsd_nl_family);
 	unregister_filesystem(&nfsd_fs_type);
-	nfsd4_destroy_laundry_wq();
 	unregister_cld_notifier();
 	unregister_pernet_subsys(&nfsd_net_ops);
+	nfsd4_destroy_laundry_wq();
 	nfsd_drc_slab_free();
 	nfsd_lockd_shutdown();
 	nfsd4_exit_pnfs();
-- 
2.43.0

