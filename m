Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7EC1ACEDE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790566548; cv=none; b=S44BIRX/oK+/JnDSIOJa00cXu52Vb3FxhJoQL5JbGu1N/4VqVp5gH937NZo74l50iDZ6wx2J3QjiIKTtD1hpNlvFCswz1aw7cUsgL01Gi/rSvWZQhwWMQ8aqM9qLqn9kaT2ptVqGxSe1w6PaFpsIv/pUzSM1ubjUKsethMZx8QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790566548; c=relaxed/simple;
	bh=ruFJEVM0YwmekxHUxrfGsDtW7WoZIuxmdnUAlx0QaEw=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=d7F5cPaz9lrYFkglrmOIwaXPQXNzKVq4ETLDRpck37zgcwRxhjc6a+NnmSsRllIkgk1ApBqUMAWkf1Z+grp10lrkrbTxAoFkfBc7nBxvlzbIa6WOiFP0XtVrUH0SPKEOWiyi0AhdPTO+XM70Ya9vxZfP0vbKp73D7BLi8ME8IsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4htRlr6pbFz5B0wt
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:35:36 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4htRlZ30KZz58fdG;
	Mon, 28 Sep 2026 11:35:22 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 68S3ZHeT002821;
	Mon, 28 Sep 2026 11:35:17 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 28 Sep 2026 11:35:18 +0800 (CST)
X-Zmail-TransId: 2af96ab9e076ed4-cce08
X-Mailer: Zmail v1.0
Message-ID: <20260928113518331HR61sfVYm8Lrb44vgAEuk@zte.com.cn>
In-Reply-To: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
References: 20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn
Date: Mon, 28 Sep 2026 11:35:18 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <pjw@kernel.org>
Cc: <mikey@neuling.org>, <jiangfeng@kylinos.cn>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <zhang.yue5@zte.com.cn>, <david.laight.linux@gmail.com>,
        <qingfang.deng@linux.dev>, <aurelien@aurel32.net>,
        <troy.mitchell@linux.dev>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2NF0gcmlzY3Y6IGxpYjogRml4IFpCQiBzdHJubGVuIHdyYXAtYXJvdW5kIHJlZ3Jlc3Npb24gb27CoGh1Z2UgY291bnRz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68S3ZHeT002821
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 192.168.251.13 unknown Mon, 28 Sep 2026 11:35:36 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AB9E088.001/4htRlr6pbFz5B0wt

Hi Paul,

Gentle ping on this one - it has picked up more tags since posting, and
should be ready to be picked up:

  Acked-by:     Michael Neuling <mikey@neuling.org>
  Reviewed-by:  Aurelien Jarno <aurelien@aurel32.net>
  Tested-by:    Troy Mitchell <troy.mitchell@linux.dev>
  Suggested-by: David Laight <david.laight.linux@gmail.com>
  Suggested-by: Qingfang Deng <qingfang.deng@linux.dev>

It stays a minimal fix: only the two boundary-computation instructions
in the ZBB path are replaced (18 insertions, 2 deletions, no new
registers), so the scanning loop itself is unchanged.

This one matters for stable - the regression is in v7.1.10+ and v7.2:
strnlen(s, SIZE_MAX) returns 8 for any 8+-byte aligned string and
truncates names built through FORTIFY strcat/strlcat (device-mapper's
sysfs name "live-base" becomes "live-bas"), which broke blivet/anaconda
installs and LVM on RISC-V systems.  It has since been reproduced
independently on a Fedora 45 riscv64 image with ZBB enabled, where the
fix restores correct behaviour.

Cc: stable is set, and the minimal form should backport cleanly to
7.1.y.  Happy to rebase onto riscv/fixes or adjust anything if needed.

Thanks,
Shao Mingyin
