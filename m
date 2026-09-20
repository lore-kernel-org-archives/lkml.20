Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0962F8E8F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893426; cv=none; b=Rr8I+Kao2tjOJhBV72Tzvac7tcnQY170+AB+ObIn4JMsmv7PNBNuBZGstmu+8So1IUB8RyAvUac1x6C58YbeCVTvyWCFiSwPgosKGTvmu3fuyl2EygC4LE24jrgrxoVDoSugP+5ky9LHi4xaQRmwYzD1eocqXKit02B4LtZKHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893426; c=relaxed/simple;
	bh=vjC5LtYT9wDmu1/+98sIUs9uPCexQtzUHyv9D5bZU5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ueOxS+vKLLXgL2g88ncJOY9Mrk6/G8J++qKuCqHHbUF045HAWxGa18pMhV0NY2neeLcnctRQc8ZsHMsVSW3mWuZkW0pHgOho8zG8GzoET0iJBVthr8eJjC1XnZRd4QXp4mRyKpACDxfvJyhGI0C4PbkG1V7ie8rq6j9TIBZYJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Wn3/Odu4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=r1gSvqAM; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Wn3/Odu4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r1gSvqAM"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7531E7A00DE;
	Sun, 20 Sep 2026 04:37:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 20 Sep 2026 04:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1789893423; x=1789979823; bh=cmimA1n3Dt
	GzoHhkoTt0EWmtsgeTcrTsug6b/nm/h5E=; b=Wn3/Odu4B7ZKZZ83p71nflXepX
	BBvJGllUwkvgsIwM9+1tVMYonY6DspaYRD/1+/11T4BYlUGSaWZ0xMM3TMm3JtYo
	qqpBUpUr25HL9/jlupn63jOWDxQ+W6vCdrtCq5CSqkQoO/mtt1DVP8Ep5HZUPdMB
	j5YgradzvSZTzxzfh+tXoweM6zFapBGFI6hFehJWj2LLMlyDrmc7i8guZCnmno5l
	nKgFX18p4XecW4WjRYjGHo1GqFO5zRfTyiJNc0OsCGqAJwvFrGWwlKPEWKEKWdrS
	pcDh/F9skcWiyppBJZMOrbqJW+7MHCp+HsLihQVFXktnfAG6BmrvxIUs/32w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789893423; x=1789979823; bh=cmimA1n3DtGzoHhkoTt0EWmtsgeTcrTsug6
	b/nm/h5E=; b=r1gSvqAMbxjJPD0jEpNHaznOKUHfXOvod+ribG3+lx5qzWFLOuS
	P35S/GFHW+9nm9ioPyhNcbWQN6ySVkmttET3O826e2GYZpDPg97/pam/AiB8nDul
	OOoZ8G6PY4x3/XRtXc3wwXbmusblTJhSFh0+ZNevxWRYXoW5lmqFWi/JgMhJiukT
	zoJzpTWoS6S6UqDetjgRBzGvGTQs/+J9STg3m1R9DRV4MNQ15A49c3w72KV/A9sE
	G9prNNhnYsdVTv90Wvuf0Kdnq61Uuj3qtFjPgeWit7o9f2BGI7Lp8nSLVw0MWTU/
	88USahu4ymlITUjUHYk/v0qsXqf9bRom1Ng==
X-ME-Sender: <xms:L5uvaiNQUO9Lmq7B4VmBlRWkD0tP6MqDhDjH-kRDePaoUblEVTyYUQ>
    <xme:L5uvau7ZT2_-tM9ae5ZtczJ5Ij9xtLzmWEWaNcoeJBIhHqjgoyVI9oCIk0g9XvHKZ
    HJMRGKXoXHzBt9-UrI95DXEghYgD0P0o4ci5hb3PsZQQXBKDHYt07z1IQ>
X-ME-Received: <xmr:L5uvag0c-ldRsyR5oA6o4X23KPQSSJuDI8xuzqigxAywaWps7cJwDaMWvy3CzMCJm2E_RuUUdewmTQ-cq8zaHS0GTVI5z_VeA9xyhoMWNxqzJA>
X-ME-Proxy-Cause: dmFkZTF8KCZK87rYgbjbdq7oVVH8+lz6toepu+qhygOx112HaXHF9pFl/dm772Yy0tSV+B
    c3blnu7UVGtCDnoEa3xWiWDdxjiYDKoIgHdzRs901HAbayUOrPBLCv+CvZrg2J9b+zOcAX
    dJu7KiI+bwpL2/pK37aSbeWnMUX1XFjCo7TpTHDKMBeoIz3Wp5Ck38YyHCG9eNpej68LRW
    9n/ZQqw0jUHi0cjDxYV2jW684ApK8KFybOWBsYCR58ilCmZj9aRtX1YHaBcVDI6KEJk9zf
    RIQ+HTTfuKDx0x1LFoLiVGnZ4SizoDG5OezqIJ2Wfhtn44h7MljkCqIg4gv0JzU4HtYYFH
    O4PD2kaLJ8lV2ipIJTui4Pz3KZw7x3W7D+oirgfCoblB/ysIqAAYnhfGwMlE5hcuJ6nTw9
    swJRZ60Y8WGzQoVT3DK+kYv12dZpyUGzBWHFfe5Czr6xyIbvY1yikfPNFf5ZcUzDHixdQM
    eQZYwgtc8lI+dQMjtah/+4PciezxLL4GQZptUYGPy64nR5zdxr/tXOzgKZPdfrzkCU54no
    FDWS4q8Hy3gcrNWJzhrJY+2SJAEAL4tK+pRo+Nlx98MbvM3tQFUgOt6wG0Ble3bGQaBA0u
    LLYXsY5OMb9PtREqowGibCLpQSz10yrWF7yklsughhN+Tr+T9fdjypkCVGzw
X-ME-Proxy: <xmx:L5uvavaKReq3m9oZmLu7qbNcP_JpZPQdqrBJ1F5KpsBeMt9Cf3J0OA>
    <xmx:L5uvaoDh0YRyqIQ3CRINUfmTH5C1fIMiWqVZJ_5D9LQjY50VIlo3NA>
    <xmx:L5uvah_7x7E-lygagzl8Scu3Hy_CfHuJaCEk2h0Qud5upt-e5Ai5iA>
    <xmx:L5uvao_O1fQ8CCzDvl6KHGjv7NTgNwPeFKWHq7b1M4eMGMGYY9qk_w>
    <xmx:L5uvahjq9_pi1dms6QIoAuRoefg5kJ2yox7HhgJ50-lSU55toWkyr4X8>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 04:37:02 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] firewire: cdev: refactor packet callbacks in process context
Date: Sun, 20 Sep 2026 17:36:54 +0900
Message-ID: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The address handlers in the cdev layer are now invoked in process context,
following the change to use a workqueue for all packet callbacks in the
1394 OHCI driver[1]. This allows the cdev layer to use GFP_KERNEL for
memory allocation and replace a spinlock with a mutex where appropriate.

This series first updates the kerneldoc for the address handler, and then
refactors the cdev layer accordingly.

[1] https://lore.kernel.org/lkml/20260919115017.859169-1-o-takashi@sakamocchi.jp/


Takashi Sakamoto (5):
  firewire: core: fulfill kerneldoc for address handler
  firewire: cdev: use mutex for phy receiver list
  firewire: cdev: use GFP_KERNEL in address handler
  firewire: cdev: refactor add_client_resource() to drop GFP flags
    argument
  firewire: cdev: refactor add_client_resource() to have release
    callback function

 drivers/firewire/core-cdev.c        | 50 +++++++++--------------------
 drivers/firewire/core-transaction.c |  8 ++---
 include/linux/firewire.h            | 22 +++++++++----
 3 files changed, 34 insertions(+), 46 deletions(-)


base-commit: d34653cbe03fb090325a61566348cabc2d9c83df
-- 
2.53.0

