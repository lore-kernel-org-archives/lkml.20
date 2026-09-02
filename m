Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08B435E1AF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314764; cv=none; b=ctm5bKLMW8G5GmYYFoo8SEqGO1/nW37ko9IgA4H961ayxk0ddSbctTd7JagpXZef5hmkPn9MklSAhFTFaiIa+IKkptpPUstFwYC46/alzMFumnQ86fAWOIc/+ZoiB1rVM35rCQ2ZK1pLL1GgulC6KC2e1v9B3u3MSuSw/RN4JgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314764; c=relaxed/simple;
	bh=KzB8SvtJKYDJkCMkE4z8SGagC+3bi7pXbxHhhkcgcRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mrQKHIgfcgSqtbK1BNAn9ZNaH5FPTO3pmM6LQxT8pAmwLRjuczpTNFSz6gghIjOvz7Px/TPhn8rFcuC9FG3ZS9/maRSwYhz6Yj+r5ajqiXlhwGWZftKJroAbsw+L2KpZdOAOpQ4IGTzPCqgQGuzUy5+9NlSNkObKyQnqyBzZauc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=fEPA2HZb; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="fEPA2HZb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788314755; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=KzB8SvtJKYDJkCMkE4z8SGagC+3bi7pXbxHhhkcgcRE=;
	b=fEPA2HZbTabcM0NdbKdK3QxIcDFqWPcQGYWYDUk8JUi/ytcLPw5QxEOF49aAaEeTGrSvkuz8/PlksiazWtZA/JM7lY6E18n2O3iI87JLw8Dq2eilu0O71nPjqAaU2/ZwEDvtyvrqWdaMQUndgeCvqCig/nwEvUEolQ8ba0eZJvY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0XAArS-Z_1788314749;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XAArS-Z_1788314749 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Sep 2026 10:05:54 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/8] riscv_cbqri: resctrl: Add cache allocation via capacity block mask
Date: Wed,  2 Sep 2026 10:05:47 +0800
Message-ID: <20260902095109.reply2.cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <apdMvKYegtdEWntp@gen8>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org> <20260831100216.reply.cp0613@linux.alibaba.com> <apdMvKYegtdEWntp@gen8>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Drew,

Thanks for the quick pointer.

To clarify our report: we were not testing the series on a new core. We
backported v6 onto a 6.6 LTS tree, whose resctrl core still predates
dbc58f7eec40 ("x86/resctrl: Generate default_ctrl instead of sharing
it"): struct rdt_resource still carries a default_ctrl member there and
resctrl_get_default_ctrl() merely returns that stored value, so an
uninitialized default_ctrl shows up as cbm_mask=0 / L3:0=0 exactly as
we observed.

> I think you may be looking at an older version. The function in this
> patch is:
>
> static void cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_res)
>
> struct rdt_resource no longer has a default_ctrl member. Commit
> dbc58f7eec40 ("x86/resctrl: Generate default_ctrl instead of sharing
> it") removed it and derives the value instead.

Right - on the new core the value is derived, so the series needs no
initialization. Our report came from a backport of v6 onto a 6.6 LTS
tree, whose older resctrl core still requires the driver to initialize
default_ctrl; that is a porting issue on our side and has been handled
in our tree. Sorry for the noise.

> I will send v7 today as I have now rebased on v7.3-rc1. It is already
> available as a branch [2]. Please give that a try and let me know of
> any problems.

We will give the v7 branch a try on our QEMU and on the FPGA board,
and report back with results. Thanks again for maintaining this series.

Best regards,
Pei
