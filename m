Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815607;
	b=r+3HHJowKs7gUb3YV+ppETHixD2++dBHoCQ+XFChYZlpNxe4xnI7p9Kt7+6rjWJIV290
	 xuIhydFdHzsvluoajZ4O11rzH8qIiz+9hdrH3KNTUKD5lSBJuE/J+YPblzDj8rTtu3xgh
	 PZ42QLQFs2nN9EY4mDRPgyPRIgrVfA42GmOTXCmraOd9d8o8CvszuyDGtmmNEwz9l6xRo
	 TQ1JlFRBQQaUneqdlq8pbfZljcyI+c972+tm2dn0cW1QfF87KgxQeRAr+oH4158mXq9jS
	 3Q8bSxvDjXNOjg6aw2G+yJbT9+8gMflenY1up9IR1xstDyQfhtVl2fPzWaMDiR+bp9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815607;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rP/ytoIFxyKaHItDHLsWZVp8ErKS2pDSrb2VxTCxhyc=;
	b=2Lm+zC2IbhgwkvHUqbkYc/BPabRo8FhvPu4yXrYKWfn2MTwsQ/imfN85gK0f4BLjggL9
	 0La5Y/5dfVa48RO/JsBlUS4vNYsREqqcSek4DfacLjOiBkUYL/l0KynKjZOPI/pJM+TC1
	 5Wjcz15WaCIe/03JxFdVKTvPnKEi7peE41/y8ChCRr9dMrz7ijZMTclyxpH6rFYl5ONlS
	 zRoE9p0sgJN7s+XvWTfpZYv7qBcd0yJDecm6AuOEaahZQ6c0UiuQqmWtZboaiwVm3Y9sV
	 iFyRet1QkOUWnedviR/pLoGrdspfBfhJrezsziiQA935+KjLS6NDDSI//iFSwLRqHwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=becholey.ch;
	spf=pass smtp.mailfrom=becholey.ch;
	dkim=pass header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=WcX4Hlo+;
	arc=none smtp.remote-ip=109.224.244.117
Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A706C606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A706C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=becholey.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becholey.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail header.b=WcX4Hlo+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail; t=1794815604; x=1795074804;
	bh=rP/ytoIFxyKaHItDHLsWZVp8ErKS2pDSrb2VxTCxhyc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WcX4Hlo+CMtecklcVq0IZ6zuLXBSRm4zAZyRotrYQ30C6bIPvqtE6HyYN7I1cHaHt
	 xue77m+ZgPZ/sGwbCZEJuvt8mHQDotgO3g1j82UjKlV8ULFLlaDVPvJZGaHxT1Otgy
	 4e/+U6v0L7VlBtrqHM7tOSxlP5EfCenmQlXvlnIlZMdEbSv/xMwr9WVj9EWjRUQkqG
	 /OQPI+pbDjgFnfBJFKAXOg9d1OAndj+wjEpWvGAcG8iA5VEh7DpD3HO0TAl6WcLk29
	 5UdaOZf8n8hxK0K/q9eyFisotdWNDVXHxtu5bTJySO8qihPl1z21YprRW4rKF1A/wW
	 AuJ+D149/i7Dw==
Date: Mon, 16 Nov 2026 07:53:18 +0000
To: linux-wireless@vger.kernel.org
From: Alexandre Becholey <alex@becholey.ch>
Cc: Jeff Johnson <jjohnson@kernel.org>, Weiming Shi <bestswngs@gmail.com>, Pontus Fuchs <pontus.fuchs@gmail.com>, "John W. Linville" <linville@tuxdriver.com>, linux-kernel@vger.kernel.org, Alexandre Becholey <alex@becholey.ch>
Subject: [PATCH 0/3] wifi: ar5523: fix three command path bugs
Message-ID: <20261116075305.234240-1-alex@becholey.ch>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: f24f7eb8c3148cd6fdcc695c66627d156e38ade5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Three bugs in the ar5523 command path, all reachable from a USB device
that presents itself as an AR5523, and all reproduced with an emulated
device (raw-gadget/dummy_hcd and QEMU's xHCI) under KASAN on
torvalds/master (v7.4-rc2-141-g9d66f26fefac) and on v7.3.1:

 1/3 ar5523_read_reply() hits WARN_ON(1) on a short reply: a header
     length below the header size (or with bit 31 set) makes the
     payload length negative. The device triggers it during probe by
     answering the first read command (WDCMSG_HOST_AVAILABLE) with such
     a reply, or later with an unsolicited one. The command also
     completes with the result of the previous command.
 2/3 ar5523_cmd() returns while the command TX URB is still in flight
     when the device sends the reply without taking the command on its
     bulk OUT endpoint. If that reply fails the command, probe unwinds
     and frees the command buffer and struct ar5523 under the queued
     URB; when the URB completes later (the device takes the command,
     or is unplugged), the host controller and ar5523_cmd_tx_cb() use
     the freed memory (use-after-free). The device does this on its own
     at plug-in.
 3/3 ar5523_cmd() leaves the caller's reply buffer in tx_cmd.odata
     when a command fails. If WDCMSG_TARGET_START fails while the
     interface is being brought up (the device halts its command
     endpoint), the pointer keeps referring to a variable on the stack
     of the task that brought the interface up, and a later
     WDCMSG_TARGET_START message from the device writes 4 bytes of its
     choice into that dead stack frame. Bringing the interface up is
     the only local action needed.

3/3 is written on top of 2/3 (it changes the branch that 2/3 adds after
the wait), so please apply the series in order. The series is based on
v7.4-rc2-141-g9d66f26fefac (base-commit below); ar5523.c is identical
in v7.3.1 and the patches apply there unchanged. Each patch has its
trigger, a decoded trace from that commit and its testing notes below
its '---' line; the testing of the whole series is in the notes of 2/3.
The notes of 1/3 explain how the series interacts with Weiming Shi's
pending "wifi: ar5523: reject negative reply lengths" patch.

How we found it: the bugs were found, and the reproducers and these
patches were written, by AI agents (Claude Mythos and Claude Opus
models), in QEMU with an emulated USB device.
A human reviewed the analysis and the patches. The reproducers are
available to maintainers on request.

Thanks,
Alexandre Becholey

Alexandre Becholey (3):
  wifi: ar5523: don't WARN on a short command reply
  wifi: ar5523: don't leave the command TX URB in flight
  wifi: ar5523: don't leave a stale reply buffer behind in ar5523_cmd()

 drivers/net/wireless/ath/ar5523/ar5523.c | 43 ++++++++++++++++++++++++++++=
+---
 drivers/net/wireless/ath/ar5523/ar5523.h |  1 +
 2 files changed, 40 insertions(+), 4 deletions(-)

base-commit: 9d66f26fefacebfeed15de31c1123451a17ff119

