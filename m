Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0733A16AB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365578; cv=none; b=AIq1xRdtwCyRuGNwh2xzPtGZ+SgucJrrgWjEVzHe1WLSfK7BaTgtAhd5Ca7RJmHd4Z2E0Nl8dqf+IGhKfUM5KcLSdFN3i7DcYP9I8yx3sBH7JCqhNXsBbN7qQ67WJWbmSUcBKEk+px7QKAMfs/y3lpWLUOrYwsVsVQZPFNH5TFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365578; c=relaxed/simple;
	bh=lcbWyDAe9iP9Y9CGMUNym1joCiuQtEP4YIZc6Fni22o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XRyyPV1LMVyfFRDFrIdnD9ZDN+a5TAJI/c7yls6NGfhSWkt43qMcFV2CpBwLnQXB6Z3mo2dgO/dBKx5mJBizf7V2K84WFoSpxrmYKtFdZubhTqdwSmrnKW/Nq/LV2kya8JdjIyBIg5L87y0+/o64PfydpvFP+Q5C1JV7ifTDmtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=M4Ejwxnz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NX1hLz07; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="M4Ejwxnz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NX1hLz07"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B42887A01E3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:32:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 07 Oct 2026 05:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1791365560; x=1791451960; bh=/l1GvRN23i
	5VUkYIwF318Sw6dHrqI0/aKjTQBXRh3UU=; b=M4Ejwxnz5lttqtK7ZZTKqaCQuG
	T9hLv3f++2LtOiO31zigjnAjGl+A3r1qPNSALU4UsCqqg4lJdnlzQ+NMYs6F/Dbk
	9asUkMOa5Jq/bRhwDAlJo1paTB4II0dpDeHOQvbZjZA+vfr96evb8U3Bw8lsbpda
	sXh7BYC7iqJPqjv4lkhIxLEsPvcCU5ed9dM/XoPmSFhvskp8VI/Thj0akdCfNXvg
	DMcMVLggAgyz/RUzDeLKMPhQcXNq+PssCSHU4E0jkY+ksDDjGXIkcTGWPoi3ysox
	KSm9zYX3sZ1cKp349YAfp9qxjcgPAAgvOJVtuden9HmSckbO3CtIa7vbR1LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791365560; x=1791451960; bh=/l1GvRN23i5VUkYIwF318Sw6dHrqI0/aKjT
	QBXRh3UU=; b=NX1hLz07v/NNbYkv7wP9HfYBrlBuIC7Hz3jU3zveGcCo4rUBkmB
	/+2Er0Ti2CUhWQ5vE9YbeY70lgitnHQsKQoNCXNXR84p0Uq98fadNByCE9umhuVL
	wyL1ODv9GagGwVjoMpffsPC1K1nGTyLfxuozMF0rSUd4rdSN8cHsFX1vPRimIt4S
	Ml+tBWN+WWlqsEgzCBt62DNWLwCs0fKpoHn1kpZoZP+cub/MTd/lEFnelYKqO14L
	v9VYl+U4IJQx+kXgI3aVTARO7ziORnVED6j6U33h/SDRc8AFaCVGNDJrq8CrSC9q
	saKM+AcYGAfpy/es6tOFYEwiXefl9BtjOhw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791365560; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:jdYbGHQEgAG+PLl952Tk7wI3yoXolmiXpbPX/xqfwn0dOQg
	oL+E6nZpsN5gb7E72YzM+7XAFAoD2BId28MZFD4u8a5CR3dr1xgh1VXSyiXG6r7x
	TjwPyzoGM7J+rWjkRbhHLd8BRmKdfFYudA+gEHXUEuFYw1ukie+hF7Aa7IDnq6Up
	OmLTWTBhsfpNyW2AdUB7XgS2ILfT/M/5gYj2JmGpqeU9srZDLUmugHnP2RHTKg2M
	c0p/0BUuK3KhkSr4IR0s+ZyRDqL0nLU6nkFTaypDws4h+mOdKW2Mkbp6JfghmfXJ
	t1JOS8jSkBrdpSjkhMyLhrB/+wBX9lzDvweDRgA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:SHjrwR1ym3HQY5b2B/TjVmepCgjNsO0LrwR5rb6gRzA=:lcbWyDAe9iP9Y9CGMUNym1joCiuQtEP4YIZc6Fni22o=;
X-ME-Sender: <xms:uBHGakzZeTMWgeWt7I51lIKRkO0SjQBk5uTQQmkue36nERUAMbugKw>
    <xme:uBHGamMWBsaDtnNxOXF1tElYFEw6SZXtjRbakAvvcMXHSUo5T-ICbItp3wcSvPJFa
    Mbd8epk-1usQjXI-C7LjdSg5-z4G_VQC9OYtKFLAo3TR5uzcDI_xFI>
X-ME-Received: <xmr:uBHGat73vi-GxT-Uf8g428cCyeZd4AuUhEishYnmU_VW2E14vr7iPPGzTqI_Z0UUZHC_vLKo-EZRZ8tfmiSzr_umoxdikIiGTcdRwqTT6p02ZA>
X-ME-Proxy-Cause: dmFkZTFrMVR84d3wBIpVnW21dA9q0LIB8pzMYGfHAA8X3+7ilOED4wUVJ/xD2bfECAQFPy
    nmeT2EKcgGAEszgBhNIzduaW696QR9WUEWlQ/LgsXfRwsnECeLflsFTSGwAXkP1tSJoFol
    f2Aqt3e6j/Ye8zNdVfbymXqSHyc0WY0rEH0NEwcoHHYw+8CKy3hVMwT+OxmG3L5SHp4CWn
    1TcAlTYIEmU2WIqhuHb559YRzkSJZ/IfJ3QcmMAFTqI24IFcN0xdI07ZoiQNPwl/ZCNx3K
    GmAEToOaAYG9ViRsF4kNRCu6ZHoEMiqMZS5VidQlXb3kdUoRKI9N3tFH0zRpVo/rmarxGw
    topbeErnBvPqjqqo7BsSLOx280yQrHItycll080KE9CzFtD2+zWl8JE/WMrk8S+faZgDUT
    m2vxEqaHHf0CaStprAg3sWXvh7EMieYfl5wiIkSOD496R258OGzugP3FZthX1pI5uWZga3
    ClK2qnoEJlaltpi4JSa6u1VbnQVwTh0Lhej1W5unRL+oaDxGF3wtPeZMsS/S7jLPb+JaaQ
    Sexi1ZfI+8Uakf7z4a8c9h8ZVAaMDSXgEw2bXUMyx4vfzidlyWBh3W2M8Lo0FQ8TudlIJ2
    J+mrWB6KLuA8W0vifTbJCzHpR+Oiw+Fu6HjhXncepdWOzpsk+eE2TAQ9pTXw
X-ME-Proxy: <xmx:uBHGavPoQInDlf1ATFodby4ZBR3bYMWX0Uh9MT2rkotlui6XhP-UeA>
    <xmx:uBHGajk0hheSI478xdaIGVMZfVFYi7-8YIvOS-zSqSagtOOHTJQeBg>
    <xmx:uBHGauRpbds2P5ZRHp2Pq4Fq0KER8k0G7gYm_TK_A2728UwLUKmM_g>
    <xmx:uBHGanD2ZkU9MTkDTm_hO5q_XcDjSZBwM9DVlf_OsJc-gBEufTNL6Q>
    <xmx:uBHGakktm0AWluiNjAO6nodPl7LFNW6ttvyid0uOhqsmVq38LoMQf2xy>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Oct 2026 05:32:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] firewire: core/ohci: defer cancellation callbacks to workqueue
Date: Wed,  7 Oct 2026 18:32:30 +0900
Message-ID: <20261007093235.175742-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series is take 2 of the previous one[1].

The current implementation invokes both packet and transaction callbacks
from a workqueue when they complete normally[2][3]. In contrast, the
cancellation paths invoke the callbacks synchronously while cancelling
them.

Although the cancellation paths are guaranteed to run in process context,
invoking the callbacks synchronously is undesirable because it makes
callback execution depends on the context in which cancellation is
executed.

This series defers the callbacks to a workqueue when cancelling the
packets and transactions, so that callbacks are invoked from a workqueue
in both normal completion and cancellation paths.

This also allows local AT packets to be cancelled. Local packets currently
use a separate path and cannot be cancelled once queued. Make them use
the same cancellation mechanism as remote packets.

Changes from v1:
* Use prefixed local variable in the issued macro

[1] [PATCH 0/5] firewire: core/ohci: defer cancellation callbacks to workqueue
https://lore.kernel.org/lkml/20261005112544.240552-1-o-takashi@sakamocchi.jp/
[2] [PATCH 0/5] firewire: ohci: invoke all AT packet callbacks from a workqueue
https://lore.kernel.org/lkml/20260919115017.859169-1-o-takashi@sakamocchi.jp/
[3] [PATCH 0/3] firewire: core: invoke transaction callbacks in process context
https://lore.kernel.org/lkml/20260921031931.287429-1-o-takashi@sakamocchi.jp/

Takashi Sakamoto (5):
  firewire: core: expand close_transaction() into its callers and remove
    it
  firewire: ohci: schedule callback on workqueue when cancelling AT
    request packet
  firewire: ohci: allow AT local packet cancellation
  firewire: core: schedule callback when cancelling pending transactions
  firewire: core: fulfill kerneldoc for fw_cancel_transaction()

 drivers/firewire/core-transaction.c | 101 ++++++++++++++--------------
 drivers/firewire/ohci.c             |  57 ++++++++++++----
 2 files changed, 93 insertions(+), 65 deletions(-)


base-commit: a6e7c3836b81235df08814bd409f7a23efcfb34d
-- 
2.53.0

