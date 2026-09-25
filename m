Received: from mta1.migadu.com (out-33.mta1.migadu.com [95.215.58.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC9F49CF21
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347367; cv=none; b=uDt6fGEP0D6dz28mkbSQa56OPNSZnVM6ZAIOxyETpNjCGgoWjdj3SwNaOvnjOXTy1sAopzRcfM5fZTmVE6KCEnQ2BV25XJytlhXQIBG5GQcfCmLIbwLC1AqQDUD132UKz8AwfGwYcNbPyqmMv1tjIVpYAN0aMQMR8EO/ujcprXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347367; c=relaxed/simple;
	bh=vLIxBYeOqAFQYwmH2ARXwbLZ46/KvBZ6tt9CmwkqlgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n/vV4L2Tca4ayeHyNXjiHQwByFTvqzPtALUz+rETLZ9Hi6p/qOjE3Iw0bJzu8wqU+qjONm5t23OSO5zS/BnfMxD+Z85+1kggYMdfP32Aa4oisFQwHrRbc+yvGhXde5P4sFuXH/P/ZJGEotoA2oBS/hn+H0A1u1Kz7yuci1t21w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=erP8t3gB; arc=none smtp.client-ip=95.215.58.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="erP8t3gB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vLIxBYeOqAFQYwmH2ARXwbLZ46/KvBZ6tt9CmwkqlgE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790347351; v=1; x=1790952151;
 b=erP8t3gBLGgTV8SzgpAQYOW8/KYShZPWvEnf2ZOi1FlFbx7qrW15ZgJafG9FCbFdv3mVOT+q
 OwjEbtxZqRNBFTTJUjgevueFrucEWxTG0T/FDHB/UMp6oj+Nz49492CqAghfl4F6JtT0/svelN2
 8BvIuzoa8FK2x7M6+1SZ1mQw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2a1308a2113d4eee;
	Fri, 25 Sep 2026 14:42:31 +0000
X-Mizu-Trace-ID: 2a1308a2113d4eee
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hansg@kernel.org>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke Jones" <luke@ljones.dev>,
	"busybox11" <busybox11th@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 0/4] platform/x86: asus-armoury: reorganize visibility and extend dgpu_disable
Date: Fri, 25 Sep 2026 14:42:24 +0000
Message-ID: <20260925144229.3693-1-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

This patchset reorganizes the visibility of attribute groups in the Asus
Armoury driver and extends the dGPU disable functionality with a fallback
DEVID for the ProArt H7606 series.

This good idea comes from Ilpo and this patchset is the result of our
productive exchange (link below).

The original author of the patch has stated that he/she wants to remain
anonymous, and asked me to respect that, therefore I will only reuse
the DEVID information from that patch and the commit text as everything
else has become irrelevant anyway after the reorganization of the driver.

Link: https://lore.kernel.org/all/20260810-asus_armoury_dgpu_new_devid-v1-1-0a5c845414e4@gmail.com/

Changelog:

Link v1: https://lore.kernel.org/all/20260916154210.181441-1-denis.benato@linux.dev/
Link v2: https://lore.kernel.org/all/20260923004706.41256-1-denis.benato@linux.dev/

- v2
  - platform/x86: asus-armoury: let attribute groups decide their own visibility
    - simplify the .c source of the driver making extensive use of .is_visible

- v3:
  - platform/x86: asus-armoury: let attribute groups decide their own visibility
    - move the moving of a function in its own patch
  - platform/x86: asus-armoury: use sysfs_create_groups()
    - replace individual sysfs_create_file() calls with sysfs_create_groups()

Cc: busybox11 <busybox11th@gmail.com>

Denis Benato (4):
  platform/x86: asus-armoury: move has_valid_limit() above the attribute
    declarations
  platform/x86: asus-armoury: let attribute groups decide their own
    visibility
  platform/x86: asus-armoury: add dGPU disable fallback DEVID for ProArt
    H7606 series
  platform/x86: asus-armoury: use sysfs_create_groups() and
    sysfs_remove_groups()

 drivers/platform/x86/asus-armoury.c        | 284 ++++++++-------------
 drivers/platform/x86/asus-armoury.h        | 124 +++++++--
 include/linux/platform_data/x86/asus-wmi.h |   3 +
 3 files changed, 215 insertions(+), 196 deletions(-)

-- 
2.47.3

