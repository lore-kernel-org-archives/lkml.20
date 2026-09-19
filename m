Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918BC483821
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818626; cv=none; b=J6os02mEs6FsDMWb23l4Q1sn76sRAUORAhHEvfJ2CUwFUFriqpnFSqdXF7yWSsb0c811/blxB3nlHFFGLuJDQ1xHJuSNz3NgVEMaaY3mgOl4StTdOnOAOtRSFvwOAt91Y1v6ljF5tqbybw+ycbqnhS/EiNdHezH2YrzcxiunlDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818626; c=relaxed/simple;
	bh=7Ig4x4NPKyHgm2U6YE2eIQC4EizJU/vAmnkagKJ4LFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4NppiuUMWh/3Uuly5KI757bf4ObMrbBbve/6Imv9e8Zit9/H6jOmNAO8WxzVj1tSHCO9z0zYIPcENzr/Oi3tmeN9hrEsy4VHqqX2EVlSaGCvmkbPcLy6QQTPDJTm3bfB8LGN1+tGZfCsEQHsbutLMhatlcUHpdPdGIzuEftOk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=WtlGL0S9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YtEQqCAK; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="WtlGL0S9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YtEQqCAK"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 344341D000DD;
	Sat, 19 Sep 2026 07:50:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 19 Sep 2026 07:50:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1789818622; x=1789905022; bh=3fVi1UlsmK
	GwUmnaqTGLNQR2uk8qjcwsJFYjukx/A8Y=; b=WtlGL0S93iJHKroch5rhIlnVWl
	2ZA+64MiTz2tPQaLKN2A5wLW0G/lvnR7ks+nou69r9lOaqCn6GEwt412N9DYphAq
	PP2guvlOdSDl5+KgReUDDLM/Ws0QbRgNKwuF/xKjvUXtdAR+S+no4LESQZ7bTs8p
	AQIwnZyboUU9zni1HMB85SDdQlx2WYvR9w5FANUlU5iTW6kkSiZdeDyos2RidzN2
	/tWJ7fYE+nC0j53ppcmnTntrP3QZNKKXWquA9Ycdb6iCt9LWhGOTq/6ikogM800u
	5yP6hSHwWIUBYeWWxC8mMS1xAjp2uamc109MvTOKe+El8k48Ea3RzQdB6/GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789818622; x=1789905022; bh=3fVi1UlsmKGwUmnaqTGLNQR2uk8qjcwsJFY
	jukx/A8Y=; b=YtEQqCAKR6TSCP4SPVLN9Ya27nvATivRfmAjwgtnZixaU8zb09e
	pHzPKs4NtCcYv32q5n4GN5/1uwW+CfXz1JlsxfkHVErqfHr87Y/NMC1n9vKyNOLS
	LeeUNQGdao1AKbFJrYuVQPdxk5nMWEJKvlzuy3WqrOMgoEuZqduv1qyfhNdUiCm4
	1QOJYLNeaAAqDHYqr5pwuizNi3K/cZql6nQrYTfPX8uz5KEQn3kD+naqo5e8ifys
	rwQBRgeNuk05XGkSb7vCVU0ro887NM2MiHHAu/baxRVIiyU9ViRISxfycdTgujwI
	C7u04FFP/vTG2Rv3K5AJjj8VGV0R85nmAcg==
X-ME-Sender: <xms:_XauauzeZI56ZHYuRjbIdASubcELfGhUvkahC_MgYsHwTG9IyszanA>
    <xme:_XauaoM7pZI7fm0okrI1coyNuYWuvZDEiWBZt-YLMUeDKX6DIEsCBcPsdPQScabiv
    K6bpGM0iSxknJP4r_F2oUEp-7qBf0DtZ-Bgku8id9aXotOKG912cIQ>
X-ME-Received: <xmr:_Xauan6GXERe0Nx8vXcjn9PGLQ6t0F3CKIgDC3VwzGMXJ7_WyXOlyi71lp0Vl3kpeSdLWAFFNg81DJaqzofrz27dqU9566cNjibULmRaB4AX3Q>
X-ME-Proxy-Cause: dmFkZTEq1A411Ov5P5ygJBGaXbyhHLjfHev9FTqwcxBWNMllwr54QTgdFJxPRkmz0Tw/SB
    YDlS7Bs0qUcQT7PVChtWuxGp2dQPhhhEu3JtE1O7tesSDy6JwItTj7dkoFS5fiLV3FsKFn
    y/Ija/o94Sggjbq6efYhAxDeJSsfgSiMQeVJ9i7LCO8F+GgkekO/Yj96z73SC8BR2KfW0v
    mJ2zL3DtpTqn22W56DLOsPSrIoXrcFybG4EAMEmV8sWIHQKatjhccC0OwEJJm5LjU2RiXH
    yzlkVr/o3fabHZ96Or8KpU5SqioiC7flaKtRzzew812nuC3tIns7rHy1TU0y1tJraRXBQB
    yVzZY4tSJcXz1NlPtwD5C15yCYfRo9hGhBSNX9V7d2R2vtoisV55GWMbYkS20Whiq9fxzj
    UmMkANlQuasSRmZ7BQ+dqv80bOwVLtENntP6SwisPMMbtmm9mdbGCa5KmuG6gUTUDAPuq1
    vosQ8TzuwIXHUIL9KNEeWkLNQDKrAakPEFR2lLR6XFfkvf6dkNexe/e96Zs0wp9OLfMxg+
    QapWb06O3STMkqX2jtdpABf5lWMCPVGGzfJs7dXoO1yAq+lUzcdcwK4Yd1+LfWQq9AyQBJ
    JlOCTvKgV5gq4xJjRMJzZZqLlDVx+vVVxsGzwUSjvhXMCDc478szL2hmafZQ
X-ME-Proxy: <xmx:_XauahNj-hlc27R09PKZTHr3P1CyQ1pK9wToeWEktHeCfaNR1vgRpw>
    <xmx:_Xauatnzt6-GyBScbZgz9JxZypSMK5ONHTYMQBSBmCt4Hf4PEc7knQ>
    <xmx:_XauagTBRcL_oaOMbe7J3gc_UQMkqXmXecagJOXoC3H76GtJdbGYwg>
    <xmx:_XauahDPSv_ZYgQQHhzmAGvTLQtmCHQ1zJjsedCbdvx8PkJyoUogug>
    <xmx:_nauaunX1TywRF7o6atK4M7O4_ucdcB4ZmrHifxXw4Mx6BM5Y2gDR6_B>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Sep 2026 07:50:20 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] firewire: ohci: invoke all AT packet callbacks from a workqueue
Date: Sat, 19 Sep 2026 20:50:12 +0900
Message-ID: <20260919115017.859169-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

For local-to-local asynchronous transactions, a shortcut is implemented to
handle the relevant packets in the request initiator's context instead of
queueing them to the hardware. This may seem beneficial since the
transaction completes immediately within the software stack.

However, this has the drawback that the context in which the callback
handler is invoked is unspecified, as it runs in the initiator's context.
This makes it difficult to implement the callback handlers, especially
address handlers.

This patchset addresses this issue by using a workqueue. All packet
callbacks are now invoked in process context.

Takashi Sakamoto (5):
  firewire: ohci: use workqueue to handle error case of AT
    request/response packet queueing
  firewire: ohci: use workqueue to handle local AT request/response
    packets
  firewire: ohci: refactor branches in at_context_transmit()
  firewire: core: use spinlock without irqsave for card split_timeout
    member
  firewire: core: use spinlock without irqsave for card topology_map
    member

 drivers/firewire/core-card.c        |   7 +-
 drivers/firewire/core-transaction.c |  22 ++---
 drivers/firewire/ohci.c             | 119 ++++++++++++++++++++++------
 include/linux/firewire.h            |   5 +-
 4 files changed, 107 insertions(+), 46 deletions(-)


base-commit: a20545fbf9226591017fc371bdfb1bfd490b0e0b
-- 
2.53.0

