Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947256;
	b=i8VnVF5ICuXIrLi1vduyAwVnaPcrmQ83gOTshpwa4GszjHY+hmddmjRMr07SGIgUSiNL
	 ubxkG5DVdP3RmAABZffwNrAI4EaI85ONLxyZCaKzEiM0iKrSFFFq0j2XuZQqcYV+dXYhE
	 0smmznymlWHtnCmKDSSs5YxAjtJrhRdMkYtasA8bb1x2DiQC9QR72x8tS2X5kgULS5Uk2
	 XLd7TnObo5RN+Ds3HJ4/+wkl/6sVNHKn+fqvQnLgK5wACEcRwdEPcJkXzhbdvB+ugpgfA
	 C8DIy2/7XJlejE6R/3Dqruo9jcTqQCzugu/KKfJJ228xmmZtxLo6aQIFwwE6TUHUIYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947256;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=y9kHH79sXvLdJ8c1WHqBXC13L6ROL+nCnwolQUHTp5s=;
	b=vQVWrEWq2GJtuf7nY+bwtO6U14l842QJUqla83DJWw0dB5GnFtHDQDNlA0xWhlL9jWaT
	 NmrGhnGqVFValEr2Kn5gt3uRVE7URLq5rA6CLkvzYLwTuqTQCmdSVveqKd8BG9tTzW350
	 ObZzHGM3m2OdrMWODcG2D8y9Dhj4aIT2oz8auicK2nfOjvsU9oE1tKS/nwzGncUJIVSLz
	 e4Ce7U3x5/V0/jzYS7/a5wHtZgHRgQ2Q/c9A9mbFN6o/soohQclQEnqG6Y1a+SWbcst6f
	 2/3sO2GmqRs09LrPt5kpdg2i+GYWYw3kMrWUQ29UYdZGq31QqAImegSKudDI40mo9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203B5606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 203B5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=TCdreGreS8IsLXGTPV5IjCPYFKnAKRAtSsCJnSw5EVTrvoFaaRM4z0uWdnBc8bnWV3iW4qRMIJZwd
	 QkUJlT3/qQsS7dGnsz2PpYnRbXFlg2AIhF77h0zR5z161a0/FUlk1onoKPo0HW7XRZ+iXR4/oSip1N
	 459O1WNLXYTF2iT0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96aed7672e49-b2e93;
	Fri, 06 Nov 2026 14:40:50 +0800 (CST)
X-RM-TRANSID:2ee96aed7672e49-b2e93
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from cmss.chinamobile.com (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26aed76712be-154d7;
	Fri, 06 Nov 2026 14:40:50 +0800 (CST)
X-RM-TRANSID:2ee26aed76712be-154d7
From: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
To: linux-nvme@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>, Maurizio Lombardi <mlombard@redhat.com>, Mohamed Khalfella <mkhalfella@purestorage.com>, Nitesh Shetty <nj.shetty@samsung.com>, Hannes Reinecke <hare@suse.de>, Randy Dunlap <rdunlap@infradead.org>, Aurelien Aptel <aaptel@nvidia.com>, Nilay Shroff <nilay@linux.ibm.com>, Jesse Taube <jtaubepe@redhat.com>, Rongzheng Wang <testwrzwrz@gmail.com>, Kees Cook <kees@kernel.org>, Rosen Penev <rosenp@gmail.com>, Guixin Liu <kanie@linux.alibaba.com>, Qing Zhang <diasyzhang@tencent.com>, Eric Biggers <ebiggers@kernel.org>, Julian Sun <sunjunchao@bytedance.com>, Yu Zhang <yuz08559@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] nvmet: clamp the last ANA group index against the real array size
Date: Fri, 06 Nov 2026 14:40:48 +0800
Message-ID: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

NVMET_MAX_ANAGRPS is the highest valid ANA group id, not the size of
nvmet_ana_group_enabled[]: the array has NVMET_MAX_ANAGRPS + 1 entries
and the controller advertises anagrpmax == NVMET_MAX_ANAGRPS.  Both
array_index_nospec() calls however pass NVMET_MAX_ANAGRPS as the size,
so for the last group the mask is 0 and the index quietly becomes 0:

 - nvmet_ana_groups_make_group() increments enabled[0] while the group
   keeps grpid == 128, so the later nvmet_ana_group_release() decrements
   enabled[128], which underflows to 0xffffffff.  The ANA log page then
   reports group 128 as inaccessible forever even though the configfs
   group no longer exists, and the increment on enabled[0] is never
   undone.

 - nvmet_ns_ana_grpid_store() accepts 128, stores 0 in ns->anagrpid and
   returns success, so the namespace silently stays in the default ANA
   group instead of the one the user asked for.

Both failures are silent, and they change what the target reports in its
ANA log page, which is what a host uses to select paths.

Pass the real array size in both calls, so the masking is kept but the
last group is no longer folded onto index 0.

Fixes: 20dc66f2d76b ("nvme: prevent potential spectre v1 gadget")
Cc: stable@vger.kernel.org
Signed-off-by: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
---
Verified with nvme-loop in QEMU/KVM on 7.3.0-next-20261027, with two
kernels built from the same tree and differing only in these two lines
(no instrumentation):

 - before the patch, a group created as ports/1/ana_groups/128 is absent
   from the ANA log page (ngrps=1) even though configfs accepted it, and
   it is reported as expected afterwards (ngrps=2, group 128 optimized);
 - 128 written to a namespace ana_grpid reads back as 0 before the patch
   and as 128 after it, and the namespace is accounted to group 128;
 - removing the group again adds a phantom group 128 (state inaccessible,
   0 namespaces) to the ANA log page before the patch, and leaves no
   trace after it, even when creating and removing it repeatedly.

 drivers/nvme/target/configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 8aea64d..48d3f68 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -701,7 +701,7 @@ static ssize_t nvmet_ns_ana_grpid_store(struct config_item *item,
 
 	down_write(&nvmet_ana_sem);
 	oldgrpid = ns->anagrpid;
-	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS);
+	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS + 1);
 	nvmet_ana_group_enabled[newgrpid]++;
 	ns->anagrpid = newgrpid;
 	nvmet_ana_group_enabled[oldgrpid]--;
@@ -2074,7 +2074,7 @@ static struct config_group *nvmet_ana_groups_make_group(
 	grp->grpid = grpid;
 
 	down_write(&nvmet_ana_sem);
-	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS);
+	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS + 1);
 	nvmet_ana_group_enabled[grpid]++;
 	up_write(&nvmet_ana_sem);
 
-- 
2.43.0


