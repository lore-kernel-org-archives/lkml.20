Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847444;
	b=tNZchD039zYjNVFNvExmLWAgfv0wiJZbiHyyk5dUIr7bE+I1Kv77QE3DeY9d+wGI3Au+
	 g5OPwVWPF/nlIK5j0aXYm0CEQMqajrYKXfEOUJ1nFbO152qa0gJuAVbRgRrRbbmw59VsG
	 3g4Lq/saERhmMOEJK3PeHjr1t03L+Rszs4QfsGrG0VzJ/Ycws9whKcPp9tD0y9o6UWGpw
	 kfZZ8/vhPiRuNGfOlwPmIfUnmV4BMVBTN79gfqIuR3JALuYhXrrAIRcZ2DBbT8sCtPezS
	 nCvLSOI+CvcECut1LLbkcNYxxMbHALr0OZB86ktlOjVtWjTRoJmW7AQSbsdGWYPvHng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847444;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KU++cqpk1/gvfox3WB9yLvTVWcxc/JeXC76YevdQC7s=;
	b=NK7CBxBj2rdLYr8+4MEf5Paf+YCsgsrqXm+EQxR7qHMNsYvPNCpXaHp/KwHLHGz7Hy+g
	 sk4VhhJ3npHmUc7pyhWBK1wGOwMSIpfNLQBq27IGwRmdN7Qo49Rp4A/9WZ55gsXOVB2+A
	 ywXV27O5hYc5e0FVxYYrqG7IqzjkccEhhLF+2bvBrWKli5U1/7QPkum6Z4NvUtItEZu9V
	 GyStig19MUX4Yk5iPy9kogWhOSgDNXzw27XLUW3C2E83/e10XuPCaeergxC6/w/FNIag1
	 tRaNXdB/ZBJog7AimibYt0Nnz1pIA89d2Xka/z/zRCo+SB/7YwbokNPld7WvATU8UbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rSKHiUh0;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED75606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED75606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rSKHiUh0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rSKHiUh0vMEtaKJSA3ZiM5JOB5uF0CUZMAZhMLi0TF+a/uMj3qNC1NVwgiDG6MedDO+BMt0SSqnI0
	 2d6hyKelC3K6/yk1DDEi5KbS3JS6sOJ4L7XmBa52xETdfcyHUFdJ9zq3FW5KW6kbEFvDJWeP4Ih/K7
	 iJPTJRMhUGwaN+S0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56aebf08f50c-9f79d;
	Thu, 05 Nov 2026 10:57:21 +0800 (CST)
X-RM-TRANSID:2ee56aebf08f50c-9f79d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100256 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26aebf08f787-37b5f;
	Thu, 05 Nov 2026 10:57:20 +0800 (CST)
X-RM-TRANSID:2ee26aebf08f787-37b5f
From: xujiahao <xujiahao@cmss.chinamobile.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	xujiahao <xujiahao@cmss.chinamobile.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clocksource/drivers/sh_mtu2: size the irq name buffer
Date: Thu,  5 Nov 2026 10:57:18 +0800
Message-ID: <20261105025718.524-1-xujiahao@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

sh_mtu2_setup_channel() formats the per-channel interrupt name into a
6-byte buffer:

	char name[6];
	sprintf(name, "tgi%ua", index);

which only has room for a single-digit index.  gcc reports with W=1:

  sh_mtu2.c:348:27: warning: '%u' directive writing between 1 and 10
  bytes into a region of size 3 [-Wformat-overflow=]

Callers pass indices below ARRAY_SIZE(sh_mtu2_channel_offsets), that is
at most 2, so the overflow is not reachable today.  Still, the buffer
size does not match what the format string allows, and the bound lives
in the caller rather than in this function.

Size the buffer for the widest possible unsigned int, which makes the
sprintf() correct for any index.

No functional change.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202501080036.LH3XAQK1-lkp@intel.com/

Signed-off-by: xujiahao <xujiahao@cmss.chinamobile.com>
---
 drivers/clocksource/sh_mtu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/sh_mtu2.c b/drivers/clocksource/sh_mtu2.c
index 3aca86d6a..f94167bed 100644
--- a/drivers/clocksource/sh_mtu2.c
+++ b/drivers/clocksource/sh_mtu2.c
@@ -339,7 +339,7 @@ static const unsigned int sh_mtu2_channel_offsets[] = {
 static int sh_mtu2_setup_channel(struct sh_mtu2_channel *ch, unsigned int index,
 				 struct sh_mtu2_device *mtu)
 {
-	char name[6];
+	char name[16];
 	int irq;
 	int ret;
 
-- 
2.43.0



