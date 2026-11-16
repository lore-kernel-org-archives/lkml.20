Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819940;
	b=u5Fljo3kCsctFH8brxecnjAIbQrgVIZMZbOaqH+JqC+5D338mYNvW/iIN4dIAy8HovPf
	 2M29zRbijC3hvqPQZnuC41eVccCwdy9dd4se/wNkYSd4hBpqQ3+rmNAbPJAXIeLnELA6B
	 ckAR9j8MFwx1Uqq7w9vUCbeFvPOf3ZAPhHCPSmHw8sewaLp5k4mgwERZZpq03Gpeja8Ys
	 FyogS/Tf7wWSDjIiJUtwJECdvD48VCV9UdgoSdU7uX5E2cV50vCu/1eqXS4Jc06u+xgVh
	 zxuKl0szbmlctQRFZj54F+rJdEGYwuhthEjG6AFMU2rFKe6uDz2scShKvRfqFVVrLiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1zvuDxYaIx+wRq51z8Ba2c/DCwXwLVuqXqRa+7I8efo=;
	b=Ki3IasxDoSRTcwqCksAJpAdcSFWLTmPUjE/F2DAHrjrVrofdtM/iyBHcqkcIu+DCilPo
	 nH9G2jlWSWt2yb/VtQ/oAZdn6NOe9auoTLaRDg4427Jw6CAKu89Zk7TfY/lN//C30T/tW
	 GKbHQGEf2N7gL2HoKClzLL/jXkfYIletQ4QwkEx8jdet//1GvQFEjCaU8wr3v8l1cS7IC
	 GsdVrv1tgFfeab00rGGu7g/Clv5kNj64pzjuCnr6VUVnuGkToX0SDjfTzWXAy0r+xwpy8
	 HFeK957KEe5uWnmv9xdoCUiBFOSDIznP6i/LJCR4JWzRxVd/Z2shgSg5RI0/hHGs3Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Matny45j;
	arc=none smtp.remote-ip=74.125.82.195
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE7D606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE7D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Matny45j
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-37600b0db49so3747689eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819939; x=1795424739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zvuDxYaIx+wRq51z8Ba2c/DCwXwLVuqXqRa+7I8efo=;
        b=Matny45jJHPjIWXkekS7kOaHLqe+34gj0u7udcwy8lDdIpS68CDXZP5LGnCpltTdf+
         dzp/fnKOEMmaGI2fJlFpKanKtIdr7KPLjdLdrRYri4pE25TITMaUdT3FOmIATtX5fB2W
         nBBvWs1vdMfQTQ3F33nHPrTeDv2CfPsMiyqE88TtvyG0ze6XcceBvRd7KNPsvwIRkFip
         MpbN2yeEb0EOPLH8gMB2g2syFrjEUZigMpOrWF69szbJKNM04yRNSM47T9TsibtwPqcz
         sIXARK5Wf4QMMZrTGsCbgtNASTFpP02dceQrq9eYFBaw70YmcwWo8ApNHcYS0cBj4uVU
         y0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819939; x=1795424739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zvuDxYaIx+wRq51z8Ba2c/DCwXwLVuqXqRa+7I8efo=;
        b=saTvoofQHc8MJ95SP/YprGBf9reVRUFK32YfrMRobpRggcHMLldp2jQ3Br5CNOjd34
         5T+dSLEM6tfF5yLBH32n24CxHlbjTRhmg24HHwiLzLFP3UsbmpQCJ7RicjQBpgz2oEaY
         FmX4nnXkun9LMlFAhctWbpCStkQlN31oQUD0q1iwLssLN6y/2CgCes4MCP91DDUIeVfe
         I5Z47ehFQBxI67w87d2q6NAzLEv2uu2cuT6L0QV5nAyZ1u/TNyAe3FEBBD40vrNUPwYR
         pygGQLJGwCkAyisC0WipKn76PAYL+HgxPxYM5osw/MYaf9VK+LZG93MgqwQSTaTfHHbn
         jO+g==
X-Forwarded-Encrypted: i=1; AL+hErGAkxCJTBGMKcKJT2loCcIbfFWScIAi27ZWIXxXvQSHD0XKfPN4kBkTnoGLhKKaMr83VK/0OY23jv8LStk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2Q3Via7anPx1OQcl3lLBjQ0C2bv7LWMwPfZ2eqeXXYOQF9ih3
	9AQeHMHj4IaGUKWMq4yz0lIDjatBLIHIee0xV6MGu9qy/pSQlDEmFD+o
X-Gm-Gg: AZFdTZcSPiPO29xs6+Trs4L+vTenc/oue285MuAWpg/AZGNmfcXE6tb8dNxATBgxPjs
	94kDv2aRmg4rs3p0NZPe2vhxDdjFCiHfsOw0Z6SLP0+iVueXsef6dg3I7CeYQ9hjpSTk8abNu+B
	tGeCt8kURhvAdGWOAba67LGivcREvLbocc0OPFu35yuTvJr9YAfawEMDMRjX/p51cl/n/vMS4LK
	3lHUyKItTPwY69bI7nc0+3yO7BLsZxa+iyGjGPrbuV+bIFE2pZlWDyQ59y1xLOwjIFv7umURA5E
	nSvX+PAwVD1lfHT5cdzedfI+yg4Kleqzl46wO7Zwg/NYWVKiBeyn3aG7dMLYFvaOWkRkzUvHwAc
	TiRdUrvRIfVXF2YoqzJkK7P5u739VN0PQFbJZT2ubLvpGMMcTHdJpkeopqiMkfLcYuhmwIrvJZn
	Nn+FXMYyD5NT+MV1mA6sAR/tQQSmFbaqP6tXQeTxGxLBAQFFeVn6w21gajCU4IZDmBv590ZjiKK
	FsWfKN3gcY5bYZGuxU73AZNzeR5EoZggKU43ScIF/YiBMrly/tYukDnqyjOymDjm+cEtaONAYCT
	N5TqRLj4XqtyTPkdakVT8Df96p+zIV70yBV9X9R83V+2nVui5jlg8tY2dXCsKbQNZSPJvE64d6Q
	DSAc6w61mwbALYCdkKpp7jLS7ByJn6WiSekP3cg==
X-Received: by 2002:a05:693c:60d2:b0:362:2e2f:c261 with SMTP id 5a478bee46e88-377e1cebaffmr13409680eec.27.1794819938661;
        Mon, 16 Nov 2026 01:05:38 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm32581548eec.3.2026.11.16.01.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:05:38 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: axboe@kernel.dk
Cc: tj@kernel.org,
	josef@toxicpanda.com,
	bvanassche@acm.org,
	cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] blk-ioprio: check capabilities before promoting a cgroup to RT
Date: Mon, 16 Nov 2026 09:05:29 +0000
Message-ID: <20261116090529.69650-1-dennylin0707@gmail.com>
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

ioprio_set() and the per-request I/O priority of aio and io_uring only
hand out IOPRIO_CLASS_RT to tasks that have CAP_SYS_ADMIN or
CAP_SYS_NICE. The io.prio.class cgroup attribute has no such check.
Writing "promote-to-rt", or its alias "none-to-rt", to it changes the
requests of the cgroup to the RT class.

The attribute exists in every cgroup that has the io controller enabled
and it is not hierarchical. A user that got a cgroup delegated owns the
files of the child cgroups it creates there, so it can create a child
cgroup, move into it and write "promote-to-rt" to its io.prio.class.
Its requests are then issued with IOPRIO_CLASS_RT although ioprio_set()
fails with -EPERM for the same task, and mq-deadline dispatches them
before the best-effort requests of everybody else.

The delegation model in Documentation/admin-guide/cgroup-v2.rst expects
the settings of all resource controllers to be hierarchical, so that a
delegatee can only distribute further what it received from its parent.
This attribute lets it raise the priority class of its own requests
instead.

Require CAP_SYS_ADMIN or CAP_SYS_NICE for the two policies that raise
the priority class, like ioprio_check_cap() does. The other policies are
left alone.

Fixes: 556910e39249 ("block: Introduce the ioprio rq-qos policy")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 block/blk-ioprio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/blk-ioprio.c b/block/blk-ioprio.c
index 8fa8bca35062..ea32db727b16 100644
--- a/block/blk-ioprio.c
+++ b/block/blk-ioprio.c
@@ -14,6 +14,7 @@
 
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
+#include <linux/capability.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include "blk-cgroup.h"
@@ -91,6 +92,9 @@ static ssize_t ioprio_set_prio_policy(struct kernfs_open_file *of, char *buf,
 	ret = sysfs_match_string(policy_name, buf);
 	if (ret < 0)
 		return ret;
+	if ((ret == POLICY_PROMOTE_TO_RT || ret == POLICY_NONE_TO_RT) &&
+	    !capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_NICE))
+		return -EPERM;
 	blkcg->prio_policy = ret;
 	return nbytes;
 }
-- 
2.43.0

