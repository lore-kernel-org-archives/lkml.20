Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44A53F660D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176329; cv=none; b=lT3pW5Db35V+MDSAvBxTduUY631ApQKS0dpTRkATwZ3E22GFUXBFVcoM4G8ZFf0CQtYPNxN4cpmmms7AceBwY0VyPMAp1epws+xg1RICXOK7HT4z43vBCsr2YmZoIqrXYhaTKMVQK8xhguwhxFzywr6aLOLHBFHK/GLJCb19SS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176329; c=relaxed/simple;
	bh=0lqRixQx8HKxz8ZeamIlgys7DhhVCsN7PWVK8RrLMs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VYvAsDitLgrwosodST/wqov/AVrovHGuI7ioVTrRtb+K1HmdVOqehpNBWvn/yap7Irgns1AvzozhntUGVvrg7QgRTKqTeTc8wC/vgb9WqoelG0VC48saWUqbcJ8RnZWVQDdDGnfNqMQjeEjr/dOmlHJgPq1esHlOM9jThwXYUMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSV/tPMP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSV/tPMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788176328; x=1819712328;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=0lqRixQx8HKxz8ZeamIlgys7DhhVCsN7PWVK8RrLMs0=;
  b=GSV/tPMPASMsFb8Vr76hQaLA7pMfA7jXja/V3l6YwH37gQtA6XgWjzWf
   m/sCOysXtijVLNGbMjVxsZCXpCfGl4TVUyMVJ8zyEJwtrMxV0NJhI6ipR
   Hc7UNgegxFziR5L395On4NeHxv3mS5N+fSPHwJUV40bkacF+zkK4vhhvt
   sT7wIFGd4HbS66ua6SYGJ3HOSJwv4d3vDtfCB+n3F9R/mH8O5UCi+DoZ4
   SWAnMHA1Rc4LKAloVpokqY5BeJSsmFEFOoJhD+jnZ6D1Je+5ms+Qw5U55
   5gYT6H4QgDuaq3ABFsQl9m3CvP4YEhNMDqD35Matfv5hdblRLGVT4kkXa
   A==;
X-CSE-ConnectionGUID: uoEJDDnrSL6HpsYAGo2kqw==
X-CSE-MsgGUID: jp6kqYaFQqK56ucmEiWL0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="76129335"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="76129335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:48 -0700
X-CSE-ConnectionGUID: nyxNUT6RRZWsXWQVQ0T3+Q==
X-CSE-MsgGUID: et3ok5OHShSd4zoedJm6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262645118"
Received: from sannilnx-dsk.jer.intel.com (HELO [127.0.1.1]) ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 04:38:46 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
Date: Mon, 31 Aug 2026 14:38:34 +0300
Subject: [PATCH char-misc-next 4/4] mei: me: reduce active polling timeout
 to 20 ms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-cri_polling-v1-4-d927315e6598@intel.com>
References: <20260831-cri_polling-v1-0-d927315e6598@intel.com>
In-Reply-To: <20260831-cri_polling-v1-0-d927315e6598@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Menachem Adin <menachem.adin@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788176320; l=901;
 i=alexander.usyskin@intel.com; s=20260315; h=from:subject:message-id;
 bh=0lqRixQx8HKxz8ZeamIlgys7DhhVCsN7PWVK8RrLMs0=;
 b=PTSGJvp4oSy1G24GsqeaiqRpPq13GH6sA7qQbk5FvEbE901EG7tp8scgC2f6u4dktgT5nbsu0
 LOIdljOOa74DWamza2dWmuve/iXG1yNJGduJDujsI+Vz+gtr/lULjLK
X-Developer-Key: i=alexander.usyskin@intel.com; a=ed25519;
 pk=X+qoF/nFCdDOV04IForWSxnkyoCAbUE10egZi6PSfcU=

Improve performance of polling by reducing active timeout.
20 ms active timeout helps increase channel throughtput
and significately reduces data transfer times.

Our tests have prooved that timeout decrease does no ill effects
for core CPU utilization.

Reviewed-by: Menachem Adin <menachem.adin@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/hw-me.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
index f3d833be0e1a..1c3ab9eb8b1b 100644
--- a/drivers/misc/mei/hw-me.c
+++ b/drivers/misc/mei/hw-me.c
@@ -1419,7 +1419,7 @@ irqreturn_t mei_me_irq_thread_handler(int irq, void *dev_id)
 }
 EXPORT_SYMBOL_GPL(mei_me_irq_thread_handler);
 
-#define MEI_POLL_ACTIVE_MS 100
+#define MEI_POLL_ACTIVE_MS 20
 #define MEI_POLL_IDLE_MS   500
 
 /**

-- 
2.53.0

