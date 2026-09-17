Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD6932E13B;
	Thu, 17 Sep 2026 06:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626530; cv=none; b=M86WOT9vdcDg1nxyN6S4/TYyJXWcOanPSLJplcJAKm/7210ltHwp4nwKPqNC8yPxtQ0g7R4TMSXZBPaNE960k5wp90Y56wxMX4OpPeMeVpfyo6ARiYCgakOYOSwAboXcbCUF0Gv9Azz/QgZL2lpI5PeIiWIwCwn0+Wj2ZImJoV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626530; c=relaxed/simple;
	bh=0Za2lkAnzkGqgRO9rTZ+jPl7p2hJOwl9Twhs0pOpREU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=UG2ylHg5X/7pqcW9wHF6Gk6IYbsn195cabRPLjvDZF+zi08yeJGjbPZVN3oC5TK7c7xECbjjCykIAGK+6352bnFz+YtRMfWwbydDzORNOzpACWDXUbwASxZf54FpvE4PyYrgbmyTVFJGlGsxTeZryhtoO3yT2H9DFUPez5dFtx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=AOrPr1S6; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="AOrPr1S6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789626520; bh=/Gw4qlBm6AwOO9f3v1AjzWTUa+PP0TWvSh7qf0BcJ+o=;
	h=From:To:Cc:Subject:Date;
	b=AOrPr1S6/XFGinHAFtq1ZWS9WV0UXdM9id+T7ma1Oc+QkxJrLTj9JOEnUVVKRKWw5
	 HqFULowdf5+mnp1XEI+MKdZWgH6brc/yopIiKOHvc+iV3tMOt331iw0oZzuzcR956I
	 W+ICxQivo4bOPPx6sjk1hrSH61iTu/mE9NO3fgdI=
Received: from XJSH01426.meizu.com ([61.169.203.203])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 7262065D; Thu, 17 Sep 2026 14:28:38 +0800
X-QQ-mid: xmsmtpt1789626518txizzw6w1
Message-ID: <tencent_58B1FA551DFC2B191C9848D394F023D21207@qq.com>
X-QQ-XMAILINFO: OFpInORavztRqXCEYNPeakpr8caGsKLvz5H0bXL9VWPPRWspPg0PjzXOJycRTW
	 tom9B1yOKuvJG1bepJLOJi/dbjG+U8ZkkoET0RC3ZXKfoPBy3ZJ454PgcBeN5Wb7DCyqQFaD3YWb
	 0sTOYXSO5XVNED9NiezGuO53gqNZZJnGoMoj6fEgvAGAaxX9kqFgMsunYLjPXhhWqOX7GIR8pygb
	 5zpFxVierwida5BEiKAix2pJIdHllTPW1O+VMUNACzeRc2r8RsgAP5xL+ZhLMH/MSdU5xKGX5n/9
	 PI+twR7TGZ1jjP31/WU7G3lmksMvbFAF/tqF8QT8X9xsykbEcmjSq2fhyzfZMsn2ph5dSyaLwD0O
	 CqzKtZNrQEfNlV5abojLjjgZT6ghY4wTZCu9Sl8I9UwfvRc66rNdv+7BwOqtj6gDOG0PuwqLRd8F
	 5pd/fWO5ZXazqcPJIDBHUSFUQrC/eoD7nEo33zwIu+okBN9S2ICJVEdL24WgLlRYS1XQuIFn3Erp
	 mXjmEAGIgQZxCpuSCH0AX2/vusQHV9qyDnpxhhmSM1nBHwZb8idcJpvwxgvVfiLowAigIDUezaxE
	 MUiS+y6Czlar3t7LK4KNCP/SZ/OcWUymi1fMHe7I0e0x0YbVZgsMiEWThmMNdmVQKIRTONlOBhOi
	 pd3iPQa4pY4pUOQacziiHv8DlsYvqEUxTr3He1+CPm3dU7pGFX59sL1U4VwkOAOEreDtOvvhB/qF
	 w/SDmNob1Mi0SUhIDE9V1Sic6Um/n5vW6x/ib5JjSpRUVh97S7et0zkiIWfTsT0cSZBJN3lCqqKp
	 onOhY3qJkWu85RYlr6zoutcNtk6YdPz+hTv7IOwic0j8DLU+rGAMpZ/NQ7QgCBapqQdcHoRf6q20
	 KyxsR262Tobm0kfr7DJjpUKUWYSu89dKBWv60WxIygdDF3CMN+8fA3cql1mPaL56LOVwbx4l2TrG
	 hH42oSzkc/Vo/Z0+QEZOux3w/KcVNRAGmYk+Spo3U0sT+zeTopaKHEIk+AZfnheWLWWnbIWoTTnq
	 d1LdBE+ZqXr3vg+rWXgnZqSbWMk+be5eE2okJwYuDb4ZQux/66HikpGfV99Ni8FQdPBNveRcq19K
	 hAzAG94CxTDGjFQK4nvc1HurtQh9IMeapZ+9CY
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zhenghui Hao <zhenghui.hao@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] init, hugetlb: fix early parameter ordering
Date: Thu, 17 Sep 2026 14:28:35 +0800
X-OQ-MSGID: <20260917062837.558251-1-zhenghui.hao@qq.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hugetlb records its command line parameters from early_param()
handlers and consumes them later from hugetlb_bootmem_alloc().

Commit d49004c5f0c1 ("arch, mm: consolidate initialization of nodes,
zones and memory map") moved that consumer into mm_core_init_early(),
which runs before the generic parse_early_param() call in
start_kernel().  Architectures that call parse_early_param() from
setup_arch() are not affected, but on parisc the parameters are then
recorded after they have already been consumed and are silently
dropped.

Patch 1/2 moves parse_early_param() before mm_core_init_early(),
together with jump_label_init() and static_call_init() so that the
"parameters may set static keys" guarantee still holds.

Patch 2/2 makes this class of ordering problem non-silent.  It cannot
fire once 1/2 is applied; if you would rather take only the fix,
please drop 2/2.

Not tested on parisc hardware.

Zhenghui Hao (2):
  init: parse early parameters before memory initialization
  hugetlb: report cmdline parameters recorded too late

 init/main.c  |  8 ++++----
 mm/hugetlb.c | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)


base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
-- 
2.53.0

