Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780EF4EB852
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890118; cv=none; b=cGFrm273HYK2lY+jcp+23coVst/G9iO5JhM4og07fbM18kYsWgNpe/tNjL5NM2tczNGg7QmVtejSjn4CgjUAOlOUdkMM4QDiyYbaUubdGN34gmjBQZpX/PX/lHU6fl45VH1KzZdf0h2U6xlh9ooLXdGuuX1heju8hbtNa/kHDEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890118; c=relaxed/simple;
	bh=hBYloVh/WO/8Qu3kGf5n4AVHAy44PY4CM56FanvckP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZ1WtiUpb9DvWEQupT+pAwdKxTZ70zIvbBpFA4zLUTjEdOtNV/atMLgHTooEXsqgKhP+Nr+g8iBIG7qToZV3DoTlhxT4Db7nSSr756bbdkpYTjm7WGZzbWYkVBf9+s/HmUJtcx0G7VbzQLHkFyNddATAGsDz+4UdbabuaFCzvOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=pE/4jxXc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AuYNyrqB; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="pE/4jxXc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AuYNyrqB"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 747B0140013A
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:15:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 13 Oct 2026 07:15:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1791890114; x=1791976514; bh=1m2E8L/80K
	mJcVk765wNS2fDel/ynQQC53DZYmbYtDo=; b=pE/4jxXczz9HW4L6s+S0VOONF8
	LqaZQqYrkcyJYEwaiA1wirpZcQUx1QnXn8Sg6jVNvCU1ENlywAyaJIfrj+Qn7VJO
	SuWSI99VE+0MnelPw6hLCcFI+N6UwGhMyjySJS2eWs+zzHbcVfIc8jNzD+zYZFCz
	EolUvo3fRNPcfm6+pu98QNIOeZ5P2xTT57DUCzMlC3/kret63YdLV6ioC2VitvNo
	RuErS36dJzbTYUq1E6tKHT0NoTCLnYeZmtEFToamEUt597X3zVLJFkH3R+2D4lt4
	cyeKIKC1eqO7PvmcPoU9loEB4Qd2Ef7RHCNOwfJ1WOpPJ4ckjPd402EvPTEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791890114; x=1791976514; bh=1m2E8L/80KmJcVk765wNS2fDel/ynQQC53D
	ZYmbYtDo=; b=AuYNyrqB07G5ejxyKjn95O4v7i7jhX4z4ZrlEtKuqok/ozmPtkC
	zxhaXnIng5y5cBP6R7aklzIntpfP4Ko8MunGBWi2jrD7OcFWHEn4iVoJwjaNDCeq
	1QEf5ZFLXdZvLCsEz3EF51F3RBNp7k0x1WzNxLgxVIQrQ4D1qE7vg+hKLYulXBXm
	2qSmK5FZbaXiUmDD8xRatgzHNirBsci5r2IELdOBJRE/0Zm/xZJl5oAKYdrb6QgC
	xO/PXvJdaoHxE9thqBXrBS/Hb3JezbZbQWgIjZxsWseXszzvszOQpcmfDisX/N4x
	Tk02mUW/fgCwgJLab9ftgerID+NhLm0yu6w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791890114; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:wS9SsiboG9UTp/fZgW8imAz8L2+NAZaJe4SvJpwT5Tg9lYH
	pejrkmQqU78gEcdKl+NNBJUBwpBwj/9V7q4DB1XX8nO8fm8UBb0oYehkypAX/Var
	kqVYLGWPtIFO2JVnG5ZlWSBh364irUeIcDlJElMLZ2nzaaIzN/h1LbFVIo2ZD62a
	9T96ImDC7dlUchy1b3UluEuFrHqxhwT3bvRnFoNjugcKYzRKK6brbcp1/BAv07rG
	l5rgCGRRUGqWfm5t3QxgUq3hCpyWxeGeccfjyQg+QBHPwQOFQ1S/6uwAuK1VxLMo
	qcY25bdhHqJnbGpABfNykwhH0cmglWyZZL31+mw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:NfiNHjZCcvOzZjL/wND8h9bzRFBl4cL/Jg+0u4uDdoM=:hBYloVh/WO/8Qu3kGf5n4AVHAy44PY4CM56FanvckP4=;
X-ME-Sender: <xms:whLOajK59kpx01YDIyuXyrfNki0IED1KAGZ8pRzvMX2wd0hIoLXQaA>
    <xme:whLOalEPYtNEIIe2vglfeTYSZ74tK6n7gze6P9OG0Sp004i2hNmvndVuMZCN2Ng3H
    4KUb47uGJzwq2AInPooojfkveZlu-SrGaas0HvOG3kCx1mZXarFdFYBjA>
X-ME-Received: <xmr:whLOajTJ9WBkMYA5dHZN4-hEbfRVQZ-Z7DxblNlTjstrd8I6UOxd5g5RYcr_e14HeB6qSX91c6PyTpNf_d2Hf4pTgC341yrAC11Kc93ujWLCXQ>
X-ME-Proxy-Cause: dmFkZTGnGUamnOoanpdN0BcOKxbj7b2cRU9VZN4duPohXMX62wfiH6k/vwmK1jJjWbcq+l
    Ed7YA3FY0FcG4lIYgzI+UUqCBi20jk8eKQRAT2of4vKHD88o6giGepFdgDiWX5zyIIXNnr
    nyHpsoqT77VL6dXejaTNIviVhP0kKFz1gZQ5zJHDxz/7tWWo7QikTwWNi1C8lyRp2PQ1Pk
    F9IymWXOqw/wIFgItsWqx+fbScN2Zfy+em0nacclyp474jyeRyvbJ83ftVvEy43WhQS5Sp
    RWjSdxIxG6yU0oFL+K49JH7RCScYKr1IzNIjcAy3NTcLeThXpq6DuJJIztGZgSB0GrTstY
    UoDgZMQ0bZKUAp4U3aKTY4pPR6CD7VjFN7klsq28eIPlV8z9BVN0bTU2FiOvMxc9q7lxhJ
    uE+6VQOXHHbYBL8CMkDsIdt0BAWrTAtxoM78YfOGiVnnBVXaW9OLETos5a2abO0bnkH/ud
    9PAqg9woux2yOS9m6qMAbEIXXq6Z6yR+pHvDd5teXRNqCWliumwlpfEU52KgoEi+W5lnxY
    k6uCq4emVeQ8YGgBS/vFcgjvOYLNg5cAFAhDtvCIn7s40Yn8ex2xtqXFhr7WoSnIctgNrC
    Kxmf1wiqMaDDNSYoVT4D9K4n9/kkDjeF0qlUXXc1HeBfIfVcDNTs+vdkof/g
X-ME-Proxy: <xmx:whLOapFO80weNs-QD1qzM3AJGycbsQ15pumAF1zo6zVPsKsjlpmhWg>
    <xmx:whLOan9sb2ObLYRigUJ_CX1wzA5sc1--bnQILxgwguxeT_UoBZUwuw>
    <xmx:whLOarJD0UqHEGg0kMFJMhJUap_z1yVxqHPve05G66-yZDHGsayWxA>
    <xmx:whLOaibHgdYHqUvtxOMrwgW_cdlEOsDcxgkG0j4iSSA0-FZYNFtMHg>
    <xmx:whLOat9EvLlQ3j20zAkLp_oGON2zRDwkVNui-0nDSMK_vjwfeYLPsQqR>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Oct 2026 07:15:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firewire: core: Add kerneldoc for transaction-related symbols
Date: Tue, 13 Oct 2026 20:15:07 +0900
Message-ID: <20261013111509.612518-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core provides helper functions and structures for handling outbound
and inbound asynchronous transactions, but some of the related symbols
lack sufficient kerneldoc comments.

Add kerneldoc comments for these symbols and document them in the FireWire
driver API documentation.

Takashi Sakamoto (2):
  firewire: core: add kerneldoc for outbound transaction-related symbols
  firewire: core: add kerneldoc for inbound transaction-related symbols

 Documentation/driver-api/firewire.rst |  5 ++
 drivers/firewire/core-transaction.c   | 39 +++++++-----
 include/linux/firewire.h              | 89 +++++++++++++++++++++++++--
 3 files changed, 113 insertions(+), 20 deletions(-)


base-commit: 74706ef1a0c26432ec4d19b540117f83e4b3d206
-- 
2.53.0

