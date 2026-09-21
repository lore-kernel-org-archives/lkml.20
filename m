Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3A64A0939
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999035; cv=none; b=dRIXF/wY5ey2d1NdOjHwb1h1C9bDu+kncsax40TSpgnkg6QKwb9jVKq+O1iZubR+MMa157N5HeXh0RrMs2+G6mFh1xjCv+nF7SJp0eOq8qDH4dB8QYkmIdxBpJoiLSw16kqVsf1DhFOz37xBLGxag1pa/ptGMk/L29VMVu/6Ikc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999035; c=relaxed/simple;
	bh=db1xDHOeml/GHbwoQsGNmNzeirBZrEB4sn0iQBaVmsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVMmyIA8mLh9az3hxQ4YY/sE1UAWgFPb2TG77Ciwh3Ieqd9BgHR8O3JzOqrl02+f+7vQ/pk//8Ah87Ws1ZqKSx2tsBD8KEpLBs86OVY+vxUwFAp8h2G5TwYB5GkDj+h7wHRndlArVCWfjgoSyU0+sLnLQUG9xUVUa2/UvlTO+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AjpirGZa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AjpirGZa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2872419F6;
	Mon, 21 Sep 2026 06:57:08 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD74B3F528;
	Mon, 21 Sep 2026 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999031; bh=db1xDHOeml/GHbwoQsGNmNzeirBZrEB4sn0iQBaVmsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AjpirGZaoYD6X4hB/dU7ImNd1rfebvb2HYJfjpY467tCVRlQl6qi0q2EL6OZyu6D0
	 bbaLShkjKN2lq/PY48Z+uI+IcvUEQpzK2BCVUtioXF1aOjz2WNVkG2mzbkPrTYslNb
	 k2mbRvdigiWPmAP9oDhk9zpOHd8w21VrZhwGmBQo=
From: Ben Horgan <ben.horgan@arm.com>
To: reinette.chatre@intel.com
Cc: Dave.Martin@arm.com,
	babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	fenghuay@nvidia.com,
	fustini@kernel.org,
	james.morse@arm.com,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	tglx@linutronix.de,
	tony.luck@intel.com,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: [RFC PATCH 0/3] Suggestions for cache scalar controls
Date: Mon, 21 Sep 2026 14:56:59 +0100
Message-ID: <20260921135702.2874931-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Reinette,

I'm posting as a reply to your series to try and keep things together.
These patches should just be taken as suggestions. The first two
patches make the printing of the schema name simpler while keeping it
out of the arch code. The last add support for scalar cache controls
in the size file. I found these sufficient to add support for CMIN/CMAX
on top of MPAM. I'll post these separately but if makes sense to you
feel free to incorporate them in your PoC.

Thanks,

Ben

Ben Horgan (3):
  fs/resctrl: Add schema_name to struct resctrl_ctrl
  fs/resctrl: Use correct schema name in bw_validate() last_cmd_status
    messages
  fs/resctrl: display size for scalar cache controls

 fs/resctrl/ctrlmondata.c |  59 ++++++---------------
 fs/resctrl/internal.h    |   4 +-
 fs/resctrl/pseudo_lock.c |   2 +-
 fs/resctrl/rdtgroup.c    | 110 +++++++++++++++++++++++++--------------
 include/linux/resctrl.h  |   1 +
 5 files changed, 91 insertions(+), 85 deletions(-)

-- 
2.43.0

