Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEE33C108F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160061; cv=none; b=U5ZtcB/FBX3Vb3Py3o5Zs/7JZIaaJNT5LeIPLfWh8Tkq9Z0kx0sNrOJnVN2eVdO899gAzNsRza0OTyzNVFymCyNsOEsT7TBZaxnilSJBo/fDUcbVrRwBt3qHecb8rrj6+h1X246vliEKxoEkTE91mb6VdaL8EBUUiB6Dwo5bec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160061; c=relaxed/simple;
	bh=esbIos4FzMUTWczRJGd0umC9i2InihGrrhYbcAe6Xz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=biZhV+kNc8IbyLDlgbPO/Hjoc5Bc1XONO8BqkZ9SWaQBd8+6gJ+d99p24dy/ltjwzTx8b3rI6VwefPsXZtUWQeOXVdp0JD6BMb4KjIpeXbLPLJDaG+Pcy1BC6XaV/udV0Ey0vpWjkno9XlBZ1ZyfhqzRTJO91ucGQBVluOiKpY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gBIsAIJs; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gBIsAIJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1788159988;
	bh=bVN6+vAPEntPcr/oEsNmeIHM3CBsQ+uoFdKHsFRDluE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gBIsAIJsRzcWlcR+bNVe406HJ9U5Qm1xMcrznfZ5w0KWX06daLtV90PZlyCfYKgbo
	 itgdSutcrppor/EvPBeisg1cyzIfYMXntdLP8AJPknhs81zBOQzwge58XusISekNd2
	 tkvEQ1z9Ld5uawBFH4hoPVOzLdIFkL88fHro7Tsc=
X-QQ-mid: zesmtpgz5t1788159971t0d1b109f
X-QQ-Originating-IP: XkutmRoJ6ENtaICfmLISyhILV8ElYC4xMS9UAx5bXKk=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 31 Aug 2026 15:06:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8175077080020183118
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: kbusch@kernel.org
Cc: axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH nvme-7.3 v3 0/4] nvme-fabrics: localize string option parsing
Date: Mon, 31 Aug 2026 15:05:56 +0800
Message-ID: <B1A2864319EA3B6C+20260831070557.631487-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Ma+A2HZKKIKo5WBb2lDidWRimF1cdzMO7A1IVG+udjj5slPpPg1hjask
	wEmNRnKI+XgFlPNphFhn0SymH2fXONowfadbwUPd1cbT1VlGAMfHfnmMmNwqTiSVlcNjagO
	BjoA1hPp2lksnV4ibJ1LQzGKKPgwpVaxNECBMWxiNbVzU0drEvn+yZX6Bip2u41t68imXuY
	rSzB7tA10aurcxi8V8mmQIac0ROEwpEhmIi3MU5qQ7e8DGtEOcKCv+sVJcoD7w1YPS28M7p
	A1Dc5LB4ov57JhJ0JEU38BQ+OZGMh4wEEJO35bSE3d2FfHfOo1A2D122iyRUvTRwHjQ4WZ0
	7LjRS11zAGgMR+q02ZWoBOySkzdwdsjAs9/dov2eRImVJNJF01+b+OYtq6Id30r3FGAeYir
	O6N3btDt6THDAsmaDW8rLVGUAkXm+k/QIcpJlKaPv6A32ETleaRCNszd7KvPfAPsgIeCJTj
	aCxc87SYar/bzs1AKZ0hUbcKye40j2Q6mdpFmt5jCH2xCuf525iDq5ldNUKpTtifJPUWHWn
	bFja23tNzyaFe9QaOFZw/+k5QEpU3LLTJltyDQk3DnXBFx51cjxTfezOcZPwXg9cZbHS+J/
	TvmHV1Ex1jNSanBUoyb7Ih9SfS/xPS+GGWTa6V4igKSqSAm6ujz6+UVxPIdyJM0zM7A+1TP
	4P2H2avSGLyN4WmxAvC1pIVim2EW5NWuqaxEg2Z5X/CdZwLHO3OAh/DpyNOFDdHKwadKyyt
	xbNGgjpa24vFffH43nbF0eLV1Wf2HMThApJYEt+Cdh259H9sHsZ+pRXPNt/gwC1/gGIJtio
	39HDzYClMUyxs1t9Cv7jZ3p73jKQxtNLyyKMDrceoZZswyRZxsZfUPkIUK9l/VnEoFkZiMQ
	RqHwcK73Gy0/1cfNlgcPYs3L4Ybd94XF7COokTE8IMmVxnTDudz0tQfViZp0GhZpuUCU71k
	94OM8I2GcQxGlY6QsJ41LxDjvECQCvzmCXsDAu4IirmfXMExoC5rCKQaTKqyRL4faFunc6S
	VHkKPnpF3sVAY3Cs89PSC20JYsvBKDrU6qQDbJ3w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

nvmf_parse_options() currently uses the same temporary pointer for option
tokenization and for strings returned by match_strdup().  It also contains
several copies of the same string replacement and DH-CHAP parsing logic.

This series keeps the changes deliberately small.  It separates the option
tokenizer pointer from allocated strings, factors only parsing operations
that are actually shared, and otherwise leaves option-specific code in
place.

The series is split as follows:

  1/4 separates the option tokenizer pointer from the temporary pointer
      used for match_strdup() results.

  2/4 adds nvmf_parse_string_option() for the five direct owned-string
      replacements: transport, traddr, trsvcid, host_traddr and host_iface.

  3/4 reuses that helper for the subsystem NQN replacement only.  The
      existing NQN length check and discovery-NQN update are left
      unchanged, and hostnqn and hostid are not modified.

  4/4 adds nvmf_parse_dhchap_secret() for dhchap_secret and
      dhchap_ctrl_secret.  It reuses nvmf_parse_string_option() for the
      common replacement step and keeps only DHHC-1 validation and
      sensitive rejection cleanup in the DH-CHAP helper.

This series is based on nvme-7.3 after the accepted
"nvme-fabrics: fix DHCHAP secret leak on parse failure" change.

Changes in v3:
  - Rework 4/4 in response to Sagi's feedback.  Reuse
    nvmf_parse_string_option() for the common allocation and ownership
    transfer in nvmf_parse_dhchap_secret().
  - On DH-CHAP validation failure, free the installed value with
    kfree_sensitive() and clear the pointer before returning an error so
    normal option cleanup can run safely.
  - Keep Sagi's Reviewed-by tags on 1/4, 2/4 and 3/4.  Do not carry the
    old 4/4 Reviewed-by because the helper implementation changed.

Changes in v2:
  - Rework 3/4 in response to Sagi's feedback.  Drop the dedicated
    identity helpers and limit the patch to reusing
    nvmf_parse_string_option() for the subsystem NQN replacement.
  - Leave hostnqn, hostid, nqnlen and the discovery-NQN code unchanged.
  - Keep p for the remaining option-specific match_strdup() users.
  - Keep the reviewed DH-CHAP helper logic unchanged; p remains declared
    because hostnqn and hostid still use it.
  - Add Sagi's Reviewed-by tags to 2/4 and 4/4.

Xu Rao (4):
  nvme-fabrics: separate option tokenizer pointer
  nvme-fabrics: add helper for owned string options
  nvme-fabrics: reuse string helper for subsystem NQN
  nvme-fabrics: add helper for DH-CHAP secret options

 drivers/nvme/host/fabrics.c | 118 ++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 65 deletions(-)

-- 
2.50.1
