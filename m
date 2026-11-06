Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.252
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946332;
	b=aoYYuQpLEv2IbGJKbwFeyJJ17w0ZAkqx2Wr7nL0OreWWesQ1KfzPSRYtvdqNwBYPUI7L
	 oye80XJ8M++ZiHcz0mYczPtgGcE5bvFbrCMdlGMiUPtxvbrVypiDeJV+KcyoP2Ep3e7yp
	 PjKX/UFoI+4VJY/+lOqfJ1iftSW217wm7Nj4VRO4bHN/5DMW5HFrYGpJTellnuyCZ+fD0
	 NMn5DHymNYW4XzXRQExQq01elKy6woZA7HdzOnfMvvhL7LbU45jZ+zkaeoHKgIIZH8Am0
	 sUHpFLYfYazY5303xW+Z8dba+XM0508q1OJJWwZBC5jH5x8ZRNTNPWXNt2aqoEc1nnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946332;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9nbHrpdZ+FKysVhhp4Y+Wfae1ZVEWqntwWaQsXRxDi0=;
	b=GScocB9j4a1nIelhDFk1vNBIit4822e5N0V6yfWejnD86PvQMbSELrUI8GsbT0W6655M
	 cba47drHXVAA8x1NbEc0GiwHGuQrVczJ/Y23K8vqRbTuFo4O9GjbnMkydlbB85iCGFiiv
	 SqVaSD+IhtoX3gzpml6Xe6p2rvpRo4RB+vIrs0nUordL7iqfa3CzzIfmBEfZu9u/hRIVa
	 OxzsRzcbcIJgEqiUuwH8qBh9Rnhr+i+8oBVtQUBEAC94by4vIsAdEBZ0FqX/6OCTJT6pg
	 eBKT7csqOKfUVyU415BeZfP5r+6Y9qYf6w7jrj+ZECxyUvJvHEpXYej9JWNpr/Dbkfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=UPH8NmHx;
	arc=none smtp.remote-ip=162.62.57.252
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F63606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F63606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=UPH8NmHx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793946319; bh=9nbHrpdZ+FKysVhhp4Y+Wfae1ZVEWqntwWaQsXRxDi0=;
	h=From:To:Cc:Subject:Date;
	b=UPH8NmHxDd+JGIHrooY+1eyw51nRdUZNFJl5oMGo7no9fniTFyGqoC+FUgSLoh64u
	 4MAZh4QRFsqIlGJGQmQ25uXZd3UgxENUafs5nV/tBMVgY81A+2pVXGwBntMJjqYTIa
	 X/d+vIfl0FxSP2SgBs5hBvCnOb6CjUwzbvPevlys=
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:7ec2:9796:1e6d:4c54])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 6511921F; Fri, 06 Nov 2026 14:25:17 +0800
X-QQ-mid: xmsmtpt1793946317topchmmih
Message-ID: <tencent_1B8D08FB52E404EC3FE4933548D6CACB7305@qq.com>
X-QQ-XMAILINFO: OJNvdD+rp7v+p0jSwX4jP4ypq+9pDOsbzA0E3p+o7ZdCyeEBKIMNOwlHDMM+CB
	 sai2xsZHlqr2kgETm5LwPNnrSds/srsKZB81TTn23zV9kIJ36lAZNO2rVjtdthreRxJ4H2BL/sd1
	 Bd6brMg1ata8nItHJtkjgWYKpqkcPsqIrizK6MyqX3/AgcwJ0UETI7nSgmBh3lkpwrg/ApwFdD3i
	 cT57vp+CzpGLQSWOIPwAZMZU7umKhl4VD3ixgMbmaRqaDcOVKQFppoTUw6wMQePh2ndEWTU1fYXw
	 moZoSUeZYpepAOlbKo8FANphkWJquc4pidPy8znbwguykrLoeR/E1J8385ekR/BnX8Pfd1ZA4ZJy
	 /Ss6rT6WI9IHayfdBDVOfLgdY/OmqMiP9MSoaAj+KgDUwcLHWsOvgw4X2UHAP0AuLNpLeBxx5dpe
	 kQ8qzDGo1X7T176b1usztx+5k9XDS/uq5c9LcNFaf+8OIYjyFIgE+ETt2gwMi4H8R01MjYq8arrp
	 jWFdKSr43kBTcy5QQpcfdfJ7+RHco4VCFIIMDqJfObiiQazXZHWfBH8XibKi5C/yEhktFZPxDizI
	 nvGXyy5zquC49jTLCj0k+Hv1pCZCYMAD8ASu8CmpE+1uYdHx14DM4lCHTnawa1X08nSGUzcWt7u5
	 7vOrE4VJELv4K6i8Nbd0YpieXSD7h9RaJmx3P94HIioht2EF9KWmxTBf9Lio7P+j3JhrTG9FV5R8
	 TFnBOyTUhK+VLMxuboM0zk8ggl+xwvAUWwjJUNGkzsZDF6H+p7Zho9WfVuUwVRDam82EYBPvls1k
	 74ZNeeskV+z7djG9uoSPQVMrpEadHqSjGXevFnWqkEdrcm52q/mEokoVvLwKFFCvyoJ/yf+25rrI
	 Dtpkb/hsaA7z3rB4JSzS132duLwSldrRwn4MTBajlTQKk70/WDp61cpZ0OULKlPiMMe0mEdr0uls
	 vyTY7OAYBhT4ph8wa1hxsbC5zwOK9otVftQbzgVOmEVAguAhbpAjuYpIOhmePKLAIwyxNLr4eiMh
	 VoQzgt0LlQWUx7pABQWJ6LI3Os51tuSneWDZ4FeHvujyewrB5KacI1p9j28mI=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yingjie Wang <1075151112@qq.com>
To: linux-nvme@lists.infradead.org
Cc: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Marc Olson <marcolso@amazon.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvme: avoid wrapping admin_timeout and io_timeout
Date: Fri,  6 Nov 2026 14:25:16 +0800
X-OQ-MSGID: <a09cbe79b8adb7d5317f2630d4ac604a3708a97c.1793946310.git.1075151112@qq.com>
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
Content-Transfer-Encoding: 7bit

NVME_ADMIN_TIMEOUT and NVME_IO_TIMEOUT multiply the admin_timeout and
io_timeout module parameters by HZ in unsigned int arithmetic, and
nvme_fw_act_work() does the same through secs_to_jiffies(). The parameters
accept any unsigned int, so values above UINT_MAX / HZ wrap. With HZ=1000,
io_timeout=4294968 becomes 704 jiffies, and a controller created afterwards
times out I/O after 0.7 seconds instead of about 49.7 days. On 32-bit
systems, results above MAX_JIFFY_OFFSET are also unsafe relative delays and
can be treated as already expired.

These large values are used in practice. AWS documents
nvme_core.io_timeout=4294967295 for EBS volumes and says Amazon Linux uses
it by default. With HZ=1000, the current code happens to wrap this setting
to 4294966296 jiffies, which still behaves as a long timeout on 64-bit
systems.

Add nvme_timeout_to_jiffies(), which caps the seconds value so that the
result fits the u32 timeout fields and stays within MAX_JIFFY_OFFSET for
32-bit timers, and use it for both macros and for the firmware
activation wait. On 64-bit kernels every timeout that did not wrap is
unchanged. Larger values saturate instead of being rejected so that the
documented setting keeps a long timeout.

Fixes: 8ae4e4477d8f ("nvme: update timeout module parameter type")
Cc: stable@vger.kernel.org
Signed-off-by: Yingjie Wang <1075151112@qq.com>
---

Notes:
    Unlike the recent tls_handshake_timeout fix, which rejects out-of-range
    values, this saturates so the documented io_timeout=4294967295 setting
    remains accepted as a long timeout.
    
    AWS documentation referenced above:
    https://docs.aws.amazon.com/ebs/latest/userguide/timeout-nvme-ebs-volumes.html
    
    Tested on nvme-7.4 f33c8bc78540, x86-64 (HZ=1000) in QEMU. With a
    3-second dm-delay read, io_timeout=4294968 timed out after 704 ms and
    failed with EIO on the base kernel; with this patch the read completed
    after 3 seconds with no timeout. The 4294967 boundary and a 1-second
    control behaved the same on both kernels. admin_timeout and io_timeout
    readback also matched the expected boundaries over nvme-loop.
    
    The affected objects built with W=1 for x86-64 allmodconfig and i386
    HZ=1000; the i386 objects had no 64-bit division helper dependency.

 drivers/nvme/host/core.c |  2 +-
 drivers/nvme/host/nvme.h | 13 +++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 03671bba1754..af8ccbc11c53 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4891,7 +4891,7 @@ static void nvme_fw_act_work(struct work_struct *work)
 	if (ctrl->mtfa)
 		fw_act_timeout = jiffies + msecs_to_jiffies(ctrl->mtfa * 100);
 	else
-		fw_act_timeout = jiffies + secs_to_jiffies(admin_timeout);
+		fw_act_timeout = jiffies + NVME_ADMIN_TIMEOUT;
 
 	nvme_quiesce_io_queues(ctrl);
 	while (nvme_ctrl_pp_status(ctrl)) {
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 82cdc7d32b22..8305fd82038b 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -22,11 +22,20 @@
 
 extern const struct pr_ops nvme_pr_ops;
 
+/* Seconds to jiffies, capped for the u32 timeouts and timer delays */
+static inline unsigned int nvme_timeout_to_jiffies(unsigned int timeout)
+{
+	unsigned long max_secs;
+
+	max_secs = min_t(unsigned long, UINT_MAX, MAX_JIFFY_OFFSET) / HZ;
+	return min_t(unsigned long, timeout, max_secs) * HZ;
+}
+
 extern unsigned int nvme_io_timeout;
-#define NVME_IO_TIMEOUT	(nvme_io_timeout * HZ)
+#define NVME_IO_TIMEOUT	nvme_timeout_to_jiffies(nvme_io_timeout)
 
 extern unsigned int admin_timeout;
-#define NVME_ADMIN_TIMEOUT	(admin_timeout * HZ)
+#define NVME_ADMIN_TIMEOUT	nvme_timeout_to_jiffies(admin_timeout)
 
 #define NVME_DEFAULT_KATO	5
 

base-commit: f33c8bc785401669b29229bcf3d0086ba9f5b87c
-- 
2.43.0

