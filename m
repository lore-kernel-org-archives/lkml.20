Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C7261B9E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247884; cv=none; b=UvT/KpwAEG03Mgaq4Cox20ymxcjOe11joPkROmHFHN/wD0wkdxCtsRqFhMDoow5YDy5VAr4QwWLBM1Ig+H6MhwAoZw4/WsB72JNvDJaj6c7cmqmqEJzctVqlcl+2HIzVSNq3f1Q8bZ4+trIDC8a6trZtVk7+BVaT3T0WOn5oMBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247884; c=relaxed/simple;
	bh=DbE2ljPHR9RLBxRiQC0D1Il93+Qii2jUhAcHu4S2aWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kua7sjtAGr8drcLCQtEle/8Arv7Nly50fbcGq0kTOvaNDdqqQYk9upegqcLBHwi/YDPlGIHWhgq2rrXcX3A2SBUk75x6vrgiWtSPGkEGf1nFb10MhGYRpSB9PJOnt+4ZiHvIxJow9p1ZA5EE1736nXCDVd8PkT3aG/wsWCBQil4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=OxLZv8Tz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PM4JXWyL; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="OxLZv8Tz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PM4JXWyL"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id E9C341D00097
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:51:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 05 Oct 2026 20:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1791247880; x=1791334280; bh=tRmGBPddwRXIEIkuPN35f35fGROq9M41+zS
	XYOhRKVM=; b=OxLZv8TzQnJsApYqfcRLiFoDtaZz7z3fuC4g0PvVjV0PXoeUa37
	lGccsQdmpd/IrAb/8Cc8w0Oi5tG8NPPQQQdSrh2O/NexetpRZLGf/T4Ueg2+xlpa
	SesEjf48ilsGa5ggjjniRNq3boeJa8l803Ff5TTLnxoGNzRfRCsuGyFf2tGG30zM
	jUwsBjq5EXBGGzB2wTy2oBZfFc5UBd/XC1o0jug6LqjydDFWrSsgVJXSTytWPcoI
	IvTStnK/IVXJhXiiplee8uiu/70qj7bwqi/B/UrDrqHxkmWbBmeEakojZJn8z0m0
	Q+LvvUtr7rzdA3sZ5YPlyRxPKFrfIuJ53vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791247880; x=1791334280; bh=tRmGBPddwRXIEIkuPN35f35fGROq9M41+zS
	XYOhRKVM=; b=PM4JXWyLOgavv4Ys8VgoNmdCyNG8yv99fshlaCPDiDwsyPTzQqC
	TxwsqY8XkUUYYFrWYIDZ26nvhM5TD1dw2o2dd4zdNoGf6xZkr1f8RclAV+8Lyeqa
	rEH+5bbnw3Bb8/rpgqbn1ZkehX9JNonU67hPrRnSJXQytJORHjwc2m/SvVMk920e
	1rEl0CnPPufiV8CE47UUo6md9tHlJVbiB1YVVIrGizUlyjOJdKn7Nc+uHOr92IQh
	Uo5Wt62TEoJpHRGmw+8VphYrVZVV8qbOhldGNy6Q+CGmqXGsI9V0rZY+jYdci0m6
	4HTBiYHYx4/pNkQ2GJyRF8Hsnl3KY/1Eldw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791247880; d=invisiblethingslab.com;
	mf=PHZhbEBpbnZpc2libGV0aGluZ3NsYWIuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:So3m5pat1M53SmCIQVtFO/J/qByHSIsLNsBkqfLvlsyMU9q
	PiE8/zdvqLtYx657LK/vosBFSGpAdlOJ+aLmwLRcnEkNfrpdyddAC6er6Tg0xkJM
	Y1r19atzn2SOlod3Sm5zeHMMz3RzpFSbKBWaGHzYuh95Kvk0f3T1AdpE7r9dENTX
	W3oPNboq+2fFm43GFZrCUpAWYmP9G5tOBs/SCwzWy+GdwWk2fxL/mYKfFi52VceD
	zj+jCs5qf7i2pbJxXei6WQ/QwZCS4vZMjXAMXmGIFdEwOH4+gq8TWcpDuF3o6Urj
	/O1dpgATJvSgXXR1gFxg0JAg85ogm9NWYnP62fQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:2bupfxoc7c/W78shAkUTwaYLOwOELTJM7wttvyVs7wM=:DbE2ljPHR9RLBxRiQC0D1Il93+Qii2jUhAcHu4S2aWA=;
X-ME-Sender: <xms:B0bEauEqVdfeXFKs-e7g2ZZTYSriScAMcJyzvfpHWU-iWAAbb4tOMg>
    <xme:B0bEanh4p5sOf8R3qsLUSmoIShXj8yn2hqaYeI6ywrB3v4N3ZTuD0AG6z_Zl2CYtn
    pspJtAV2Xl4lUyHouNxKHmVXObB1-nIxO6OVfzm5ss8LnlmBvo>
X-ME-Received: <xmr:B0bEajvdpGScqynbwxTWB59fUXCdzLuViDx2h-uHl-HXS5iCkS7rDbs-D75_EjDzVpgHrqw22BAYuFwwLU_JRcqsCZ21RMA14uOQbHN6YnicziOgT8UYPyQrQdDKkw>
X-ME-Proxy-Cause: dmFkZTGDeGecfuOBqBR+BQhzcXn/vNYPPEmBB26O+qh7FZR7AUWqdQtYPjhC6dsLaDuBea
    IeTTQ8cmgK80NNnBDqKATqjtVF4/aX3CSonUXyU8NmWyhcyIhTs/9zvqYDF0sB+7+ZIQdM
    9BowT4dTsQLooVUdU9xViDIHD23gTeHkjfPMGpOvGX4nslU+OWiL1aI8E3CWpnfnx3JzSv
    2Mfm2NUZXTHi96BFZEOZzjtluW7L83Db8YedS+pGUpiqrYrNSUgOfmbo7kLzifDvFwePml
    3SyuoIORcUukCr/0RuDX7tj9pdkGzDL4n/3wFyh0IdxaaedWq8etqdwyR9PF8lKHDgYuP0
    JqX6/erQXDHZNY28l0+SxIWThsa633lKoUdWDbeHfliIx4PBhJX553VLMcZ6QjnySIWH9f
    MCctceavToVfBDwR80C7wEAbrqgadx4IShdfXGfXppcC7rsUE/caKhn8OD4fa7LLwMPKxV
    cPGtmqHqosDZw4eaBKVIjyYhxJE3YniwbA9HJcsZcOrUPwYph25aVe0K7qEDZzF4l2RoMP
    c/NMssbwZInDhFt38or4vj7DMByUMWp4m/lsO8flGPn8JAC+I7U/fcc/pF5zUqgJS5AnfK
    5bOV+BI5cxaEor1igM/TmaO5VNjIA61w/g2QIlboIVeR6vdR6cswUpgKyd0A
X-ME-Proxy: <xmx:B0bEaiu60XcoIr3amhSs1wBVqPsOwV5CYC8qOQLlWx5WK4EYc01q-g>
    <xmx:B0bEagEqgVLC9LGHWjWOsSaLJZbg7e_ka-dzkSP1qPS7nKUGQCAWXA>
    <xmx:B0bEalObjLpfT5Oo3e6Id77xmP9zZQUhaM2htVp07bN_osf6r5G74w>
    <xmx:B0bEanLPubuPUz9h6iTkBRPP4Q0IzP4ltDPuVkbvCuKE_s12tWf0Cw>
    <xmx:CEbEal7VrXbZHnEm8MDnRY7wWC0yzRqgQKL2ebMONKeDyx3ffT82Mg03>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Oct 2026 20:51:17 -0400 (EDT)
From: Val Packett <val@invisiblethingslab.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>
Cc: Val Packett <val@invisiblethingslab.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] udmabuf: Disable the list length limit by default
Date: Mon,  5 Oct 2026 21:48:53 -0300
Message-ID: <20261006005053.2245156-1-val@invisiblethingslab.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Shared memory buffers for software-rendered GUI applications are often
large and highly fragmented in memory. To get a shareable handle to such
a buffer from a guest VM, a virtio-gpu device backend can use the
UDMABUF_CREATE_LIST ioctl with the memfds backing guest RAM and the list
of guest physical pages sent by the guest driver. That list reaches 80K
entries for a maximized window on a 4K display!

Like 44e9eb5a7621 ("dma-buf/udmabuf: Disable the size limit by default")
did for the size limit, change the default to INT_MAX since the amount
of protection provided by this limit seems dubious.

Signed-off-by: Val Packett <val@invisiblethingslab.com>
---
 drivers/dma-buf/udmabuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index df6dd0046242..589031133588 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -16,9 +16,9 @@
 #include <linux/vmalloc.h>
 #include <linux/iosys-map.h>
 
-static int list_limit = 1024;
+static int list_limit = INT_MAX;
 module_param(list_limit, int, 0644);
-MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is 1024.");
+MODULE_PARM_DESC(list_limit, "udmabuf_create_list->count limit. Default is INT_MAX.");
 
 static int size_limit_mb = INT_MAX;
 module_param(size_limit_mb, int, 0644);
-- 
2.55.0

