Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7771A442B39
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627898; cv=none; b=IIL9rwE+wbAtr7YXqG3LdLb4N9XSxemisKGhvtP4BV/kPzHaYvnBfMA7v2YW8ZRgCXDECYgyVsvpXIQSN8e6r+WSOOZ//tJqk1OeC2OszBl1tLDxSPpS2kRTb2xf6bS1NwJH8c9VzJe91CHFij6ai2YbSx0jgiFfwmp3OSxrmJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627898; c=relaxed/simple;
	bh=L4sdGfPRJNvoS+s5nqiUx4BvRY4eQD3g+eBW4eqgX+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kbhnr70HPQcClkZwexDKc81ZvE90FOqZXAcBu2fxt8zcIerSGInC6LRlYFruj0VGsc5LnrDnzD0+wkCEbPrue1OCi2Fv26tKOv7vX/xWqz1ysru9Ye5WGd3QfAiJI18h7wDD4gge9Ti8uyQ7t3+HR6Etujm1gtRA7cs3P4I4zpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=Cr6rWIw0; arc=none smtp.client-ip=207.54.90.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="Cr6rWIw0"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789627896; x=1821163896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L4sdGfPRJNvoS+s5nqiUx4BvRY4eQD3g+eBW4eqgX+g=;
  b=Cr6rWIw0hIPoZocXN6AbThvjeFlt7mSPlZVwuPMIgIqrM7I+ZDrbGdb9
   CdM3TbT7zQxVIglpPhIj1TLqdt+/KqNvp6DdgZ4KqlGb4h4DJTrYC4dK/
   IswblnYy8n1YpHe2Oj4UzYuftp/J6iSS8YHIk84j/Ibp+1CjewAtpXJ7n
   ZYwUaYacZfxqactPSTNZk3vMvLQJ4XwIYpNCwnSfppgk3fLhRP73hE+Ts
   iorbT20e2JuKcuWzH2DD1Q9H6fwXKpEJCy3KN7ytKAA3Ul/gw+ao5joIr
   YOjPHppgIKxZ1Xzj/06ZxVPRH75GKFYUS95HTr+bWdEqN9ZTF872P1dY/
   Q==;
X-CSE-ConnectionGUID: iuyA9egzSPOMjNqVzYPsqg==
X-CSE-MsgGUID: L6YxQLnyQC+hOOx39Jnz7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="255290699"
X-IronPort-AV: E=Sophos;i="6.27,103,1786978800"; 
   d="scan'208";a="255290699"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 15:51:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3A9D11C00647
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:51:29 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D30B31C00111
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:51:28 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id E35BA101E53D;
	Thu, 17 Sep 2026 06:51:22 +0000 (UTC)
Date: Thu, 17 Sep 2026 15:51:19 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v6 0/7] KVM: arm64: nv: Implement nested stage-2 reverse
 map
Message-ID: <aquN5ytDxt44uORD@sm-arm-grace07>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
 <aqm9hXB6X9IQ8wHz@sm-arm-grace07>
 <m6ldbr7hdafmoycx7xjcbsg62mblcakcu52ndowwzqgxdjb3q3@huv4i5bfxtza>
 <aqnUWp_VJXUCcJnQ@sm-arm-grace07>
 <86ld9165cr.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ld9165cr.wl-maz@kernel.org>

On Wed, Sep 16, 2026 at 08:08:20AM +0100, Marc Zyngier wrote:
> On Wed, 16 Sep 2026 00:27:22 +0100,
> Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
> > 
> > On Wed, Sep 16, 2026 at 12:22:30AM +0100, Wei-Lin Chang wrote:
> > > On Wed, Sep 16, 2026 at 06:49:57AM +0900, Itaru Kitayama wrote:
> > > > On Tue, Sep 15, 2026 at 04:42:58PM +0100, Wei-Lin Chang wrote:
> > > > > Hi,
> > > > > 
> > > > > This is v6 of optimizing the shadow s2 mmu unmapping during MMU
> > > > > notifiers.
> > > > > 
> > > > > This version fixes a few issues, and adds Marc's space optimization
> > > > > for kvm_guest_s2_mapping [1]. Please see the changelog for the details.
> > > > > 
> > > > > Tested by booting L3, and running in-kernel targetted tests described
> > > > > in [2]. v5 got some tested-by's from Itaru and Wang (thanks), I didn't
> > > > > carry them over since some bugs fixed in v6 are non-obvious. Some
> > > > > retest would be much appreciated!
> > > > 
> > > > How did you boot into L3, with KVM selftest or recrusively boot on HW?
> > > 
> > > I just recrusively booted VMs on hardware. :)
> > 
> > Good. Then I actually tried that on Grace CPUs, but letting L1 boot 
> > with nested mode did not print "VHE+NV2" KVM init log in dmesg, thus not
> > able to boot L3. Do I need to add other than kvm.arm-mode=nested to command line?
> 
> kvm-arm.mode=nested, as documented. That also puts in perspective your
> TB tag on the whole series...

Yes. Using kvmtool's --nested option did not bring vCPU with the VHE+NV2 boot
log. The Host kernel is Wei-Lin's version 6 booted on Grace CPUs, and
the guest kernel is today's kvmarm/fixes plus Wei-Lin's shadow stage 2 ptdump fix.

Thanks,
Itaru.

> 
> 	M.
> 
> 
> -- 
> Without deviation from the norm, progress is not possible.
