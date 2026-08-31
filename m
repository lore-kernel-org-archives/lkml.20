Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FCD356754;
	Mon, 31 Aug 2026 02:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788142599; cv=none; b=G1WIL5WccBByU/wF5Z51eyfL/PXYkeRQik4b1FyiPok7YS3m7JU3xqA+HbJf8shJ1ilAtFuzlr2BS5ACIGvBLpfucU6I6V/DcytphzXE0w9UNBwHHedwoPKpAUaPUQ7UnDTrEJ7I/HAIGFggluF8sgalhdamquOdawMpvRH8t7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788142599; c=relaxed/simple;
	bh=FUH94NwmwlnutFDMD5htQYc2fboKB+lxmllicBf1Vto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i4FIsKJnrQ/L/jg8UropERLVdVJoY7n2hDdbzLkrqzjY9S0glcozdr/ZtggwI/hKBCgjQrAfGk+eEjb64uncu5kn3yJ2CTKNqAXz4yfzp1ku3Pd9UyRMBwzw65FJcVgPdSQT5Hf+Xy6fR7v5YdbbG5EQ/iJw3COi/7QVMxfnufo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ukubjon1; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ukubjon1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788142587; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=b65atCeqRmyp6gckV4T+CsR2JdFsS1TQtr21uHemmiY=;
	b=ukubjon1VIMbuZuBo7mBZFpLEDtrYBO5XJ9UghETOg5QbbDnvszKuaeq1KZgxETm+lInUzpyzllmU/bfb2zIxyWCyUtjpwlH0qpfRks8rcC8SWy4ogIcrY1UiHOTrtD5BvaJbrJReKWxtZ7EdLDGIesJVsYVBB/iJhtg4YO+w7o=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X9rz36c_1788142580;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0X9rz36c_1788142580 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Aug 2026 10:16:25 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	devicetree@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via capacity block mask
Date: Mon, 31 Aug 2026 10:16:16 +0800
Message-ID: <20260831100216.reply.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729-dfustini-atl-sc-cbqri-dt-v6-5-7c22b05d461b@kernel.org>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org> <20260729-dfustini-atl-sc-cbqri-dt-v6-5-7c22b05d461b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Drew,

Thanks for keeping this series alive. While testing v6 on a RISC-V
platform with a CBQRI capacity controller (8 capacity blocks backing
one L3, Ssqosid + CBQRI exposed via DT), I hit a problem that traces
back to this patch; findings and a suggested fix below.

Symptom
-------
With the series applied, the resctrl interface reports an empty
capacity mask everywhere:

  # cat /sys/fs/resctrl/info/L3/cbm_mask
  0
  # cat /sys/fs/resctrl/schemata
  L3:0=0
  # cat /sys/fs/resctrl/size
  L3:0=0

while the hardware reports NCBLKS=8 in the CC capabilities register
(bits[23:8] of cc_capabilities, per CBQRI v1.0 §3.5), i.e. the
expected values are cbm_mask=ff / L3:0=ff.

Root cause
----------
cbqri_resctrl_control_init() fills cbm_len/shareable_bits/min_cbm_bits
but never initializes res->default_ctrl, which therefore stays 0
(static storage):

> +static int cbqri_resctrl_control_init(struct cbqri_cache *ctrl,
> +				      struct rdt_resource *res)
> +{
> +	res->name = kasprintf(...);
> +	res->cache.cbm_len = ctrl->cc.ncblks;
> +	res->cache.shareable_bits = 0;
> +	...

Two visible consequences, both matching the symptom exactly:

1. info/L3/cbm_mask is a direct view of r->default_ctrl
   (rdt_default_ctrl_show()), hence 0.
2. cbqri_init_domain_ctrlval() seeds every RCID's CONFIG_LIMIT from
   resctrl_get_default_ctrl(), i.e. it programs a zero capacity mask
   for all RCIDs (including RCID 0 used by all harts by default); the
   hardware then reads back 0, hence schemata/size show L3:0=0.

For comparison, the x86 resctrl code initializes the default to the
full mask (arch/x86/kernel/cpu/resctrl/core.c: r->default_ctrl =
max_cbm), and an earlier out-of-tree RISC-V CBQRI implementation did
the equivalent (res->default_ctrl = BIT_MASK(ncblks) - 1). It looks
like that initialization was lost in the rework.

Suggested fix
-------------
Initialize the default control to the full capacity mask in
cbqri_resctrl_control_init(), e.g.:

	res->default_ctrl = BIT_MASK(ctrl->cc.ncblks) - 1;

right after res->cache.cbm_len is set. With this one line, cbm_mask
shows ff, schemata/size show L3:0=ff, and writing schemata round-trips
correctly.

Best regards,
Pei
