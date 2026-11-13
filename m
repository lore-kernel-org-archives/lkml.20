Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569546;
	b=rWB8sLmqO6IovvinaBsIOS8LtQo3Lx4LIVR4+UbZ6g4nKy9UA5QQWySNrTecPru3r2rx
	 LH7wRk8K+pg+lEo1LqIWRvNsDouPFIwxWKnBwmV0SJ4EPJM8VD5KvZ4WAwdElcny5Fn2M
	 ep+HD3EJnavvDceA/RKkg2VICpXIvgMNKqtf2aaHuRI1RUibxgxv7ngcf0kR3LODLEjgZ
	 BGKJw1yvLUdCM6D44wzYEm7PSfnkumyQhgRjNSqOIZ+lI5iYBCSZIem8f+KhQ2nnFBmxb
	 iuGR83wukvx0XzuDu+FzXDiIM45K5CYChlQ99ZQsS1wPtf5uoqdM4+pzY92K8B0qLyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569546;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uzA3MENZJw95oAYhojQzQSabGxwnoUjmU7H8k5jT734=;
	b=YEg+FciooJLnCq0Ogip7R01vbVaQQlWx57qz00s3Owp1jUk0md4DiGjntBx5j4XSRENt
	 64dRe6SvSSAhJMRDpMd+YHYfBDegLvbqfcRsk5vMgr22DIcAU5ERmzgMSFGznX9BloDLS
	 Nja5zO7y3IbcJt5LRbyZ/D0Dxk26wrJ9TLQkTXhLpXsxPykiBp+aR5FIue6eUpcrV/Uys
	 pPhOIH5zUoFaMBQaErUm5fvB1JSYBiTzFaCxugbBDGsoRHyWb3Da/YqHlodlO1vuy9Bsz
	 MKtKuxaMz2El9TCDACGUBup6irdye+NRI7LqOsQSyM6D0nKk1AYOZCoMWaZRH2ryJjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CXbfAMtD;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12383606A336;
	Fri, 13 Nov 2026 11:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12383606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CXbfAMtD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569546; x=1826105546;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LaoNUxqI96CmS6SoTCD3oqwo0ucIbsbw9waMtABGbF8=;
  b=CXbfAMtDs9q+ymPOP+K0RRTn9ytZ/tkJnLxDvVQf3kPUD5UutlviTKTl
   gAwejX/hRu2rxGdq2kSk+bSAO0wXZMW9hAbcEqtvrPxiiK0s0V6RmDhhv
   dULqbSnjPAcC/rxEtT0by/Cictvj0dMcnetCrChnx4sgEQI+i03dCEQ2E
   8X4yprS7wI+GJyns9Qhi5lxlxMEispqfTtpwyu17lrZs68Tf3UhqkvI+g
   JezTtjQQV4Yo5WwjXUjkXMc0cU9FtrSxdLLcYUyjw+hC5kserT7oh7/Lf
   z7xC3NskwFUXUH0j6w8RoP7+LWkajN0GyqlwjKQVYSJp3ihjjaeybr7vw
   g==;
X-CSE-ConnectionGUID: wGOazeEiQdup+14tatjwRA==
X-CSE-MsgGUID: 2LdsUN6zTi6iWUO5HG/ufQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3246897"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3246897"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:31:24 -0800
X-CSE-ConnectionGUID: 2aYNxMUHQV6LZS2C1K4Yqw==
X-CSE-MsgGUID: 5gYWTfuMQxG0jST9d7Dw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9235573"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2026 03:31:22 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/11] ASoC: Intel: avs: Do not skip error reporting when an IPC timeouts
Date: Fri, 13 Nov 2026 12:38:30 +0100
Message-Id: <20261113113840.3067489-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113113840.3067489-1-cezary.rojewski@intel.com>
References: <20261113113840.3067489-1-cezary.rojewski@intel.com>
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

If an IPC timeouts nothing is printed as avs_dsp_do_send_msg() exits
early. This makes it harder to assess and debug IPC failures. Have a
variable to separate "should copy reply?" subject from debug printing
one.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 5010b0f5be47..0747899c81a7 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -393,6 +393,7 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 			       struct avs_ipc_msg *reply, int timeout, const char *name)
 {
 	struct avs_ipc *ipc = adev->ipc;
+	bool copy_reply = true;
 	int ret;
 
 	guard(mutex)(&ipc->msg_mutex);
@@ -413,10 +414,11 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 			/* Same treatment as on exception, just stack_dump=0. */
 			avs_dsp_exception_caught(adev, &msg);
 		}
-		return ret;
+		copy_reply = false;
+	} else {
+		ret = ipc->rx.rsp.status;
 	}
 
-	ret = ipc->rx.rsp.status;
 	/*
 	 * If IPC channel is blocked e.g.: due to ongoing recovery,
 	 * -EPERM error code is expected and thus it's not an actual error.
@@ -430,7 +432,7 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 		dev_err(adev->dev, "%s (0x%08x 0x%08x) failed: %d\n",
 			name, request->glb.primary, request->glb.ext.val, ret);
 
-	if (reply) {
+	if (copy_reply && reply) {
 		reply->header = ipc->rx.header;
 		reply->size = ipc->rx.size;
 		if (reply->data && ipc->rx.size)
-- 
2.34.1

