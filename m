Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E94279DC2
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700314; cv=none; b=SgG6jhuTutVaI5osCQ5UKgBLBCgtj8+EK+hn2cmpRw1JK36xWKFxEVKVnstrbcs0NCeMXCW7Y4AQ+jlTfYiNTPYQo+JXyxgUNdqnFlzEyFUbOTJKfvVBI7aGv3Of9uyx0iY2RTK4e1CqwxZCR0W7XaLnu/tg03YNUGoVVzLMWx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700314; c=relaxed/simple;
	bh=86OCHy5U3LeAzbnx8BUgUFUM4FasrfSC60cJTjeR2Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4h4U27/sxxKTR0zkiUYIpta21WU4Ct8rUDBUONeFhHugMOVjb0QWghhP5jmbJTbk+GDIkJfCye2F2MZdztvsOJe5pJMLazuSFTQSJOOU78IL/E/uyJ7imbVn4beafFdjCNcjETK6myJwFgjh6Vw7ObRwUGsL5xF0YC4Cfxoqlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=ngGGd5St; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mZJQt1vf; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="ngGGd5St";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mZJQt1vf"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B543414000D4
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:31:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 11 Oct 2026 02:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1791700312; x=
	1791786712; bh=vWglLxoz3KsL3hEwlPBMk7apaTKh5kralqdMkpNabuo=; b=n
	gGGd5StmyNsnASVcX10Wiw1ZCBweeKuxWPdKQ/nbE4Fr6/a9npbE93x0QZTaz0Q6
	5e+VEGlN4oCAZ2FVvXhoCVlhwpCKGVIsIhb9y1k3RArmxUl4tYub0cPGL0VzSS1G
	LTGbBbCEHi076guOiIQWOvQ2xbtGnhcF5p8ZfKKdJv7ev5grsqhYGyD5BQYkxR1D
	fUfvL6Qepzn183h0bKhSY5+qIYtV8qWCemVlLs9aDzrUc/Ny4mdZIA+t364GjeXJ
	xGqE6wYeC7ju/TndQH6DJ7YfDCWEGLlwMScVefuNt3WgdWNN43KWuM167FgcrlZI
	5SDi8QBnJhuDr+0KdPHRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791700312; x=1791786712; bh=v
	WglLxoz3KsL3hEwlPBMk7apaTKh5kralqdMkpNabuo=; b=mZJQt1vfqgqvFHIuQ
	ebmB66s9ZaOhhn0u0LiLOPZ9q/bAJrDZyyUj4/9bk7LGszUH8Hp4UIw692yrUHqv
	H1FWxuLankmF0knDvp5Tu6YPPnAiO9OvqTolxHohSXcC+JtscXEEnxi0laXdd3de
	+cqKKDAkvgOednrgjSmB2VKSzLQanPFYudEacPc8SpDK+5+u2aWgNdWMZUIDnrna
	skNgHGBg54BcbU8X+peKUryGGikQY+P+Owz2m/aK2yh8lyd5WHwvd5xd+U7pfBV/
	uPwc5+vyatQ1+vaYtOWDvDLIhsQmOTR48i6zbnX+qqAv1w+awnUiT+wWUiCUQZkP
	pEhXQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791700312; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:jMHFawZdKU94+YRzw+UDHRMBMIuGkBBZGtxvQbHxJP2hdFh
	zCm+ScbajIAUnxNKkfyiTmRSL/wPgOXczM7m7XfWdGMGu6AOMmHhaWoPfjTife1j
	gjfh/8QfMevfJ0Q0xq9QEmRECSDXQJzRhDueuitWSZtQV5Qun4CpUouXf+K9v6Sk
	Q+JEZr0n3KWD5Hemvu8K7NPEnl8vg7y00dhMbSlfhrlTXLG0JZcflL7T8tVbqFa6
	FLINOj0cf0N5vChCH7pNxMxACcnU+/Sf6OQf5ns5yOhLHHzUS48FFheqMOnovuw4
	BdtzPrteW1qHacZY490s9gR7u11yrSoq5bAtcwA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xMZHjF8gdJAimjIutqs1SiNV9Bgk9FP8llq66MZj9cU=:86OCHy5U3LeAzbnx8BUgUFUM4FasrfSC60cJTjeR2Ng=;
X-ME-Sender: <xms:WC3LatWCoB9ksZxfugzvj0u_sLw-wdfx6tEtwGU_d2LwlzvqWxb64g>
    <xme:WC3LarhbGScazUY1R0R_l8spN6jDpe24WQZHod0rYnvv72t-U9uBgBruAmz3Vqlv3
    KmmJe0yyG79NpIUo0xuvloMMHC4ptrJShtGlA43LnCaYp1iLNC5PBZ8>
X-ME-Received: <xmr:WC3Lag_bmXUN170T5hY6CIZ2gaIGGAEPEGFS_pWON6auvvFy1P4b7UVaQ7L1EFW76ZWorTldIylqV6MJxEg-jBsWyfn4VlpJeX3pND3RwL8JhEA>
X-ME-Proxy-Cause: dmFkZTErquUrQVdJjR/SbHguF93gtTGh8C8GoykUk305k23yXhj4JpLOLWDIAEQldCVd4t
    BXJvDIObTmTdjV4xw951YRj/J7h3BNNjLFmhAyN+lN/m5ChBCbcOuhvsepGQoH3KP8awmG
    l7m0KMt/DoAPpKD8s2M808fsiy6DNare8q9SmMY8bXAnwCQlIXCLg+0IEeOD8X3yMb8sQm
    IKlrjQJKxKbCGpp32JTGc/kTdb2cH2rtMifChltcvDo6OnqtFBRE2yLVG+mhKHBeAxEKP8
    g8chzkfvjBrF+MblVgqed3eH3MF9+Am6CL4HWssPl8F2CJmU3gT935RCa1ldHQg/XZ/HY7
    WFueer2rskgrp9C5sPvKMndt3ZoFnyA1n6JLS3DK+FqhP3shR4VGwc79NwVjebQAqLnFnk
    Wo8eLC9VIljRC7mwwmxNPH77e5i0gU3KVoJh0UESjrJcNs1Uy3usl5FZFJAbgGffyIkyYD
    IT9DYoAJ/3a6bJFw9NECTriRbK4XBG3RgYQRA4MnCt5K4P1O6KMiX1d4xugS7Ep/6M/kGQ
    4RozYhHj9QR01TNte6dlzIjdcZxDq7HGLexd+RmPR+Z3K4m5OWn+SPQmwEc1mVbntuu4fj
    zDlmj9UpidFc2CeYRRv2UzelBZOuwfEMm6R717W51zEKeQ2AuGBrW1wlcB7Q
X-ME-Proxy: <xmx:WC3LatCqvd6c0xzBB7AYFESJ9Bd5oBpQY-B6hM-2RwFgkaSG755lpQ>
    <xmx:WC3LalJNjfH7NTnKSuDERn4OfbD9FGvVHLzfgIV7sg-FI4noRgo0Ow>
    <xmx:WC3LaomPC-Jlef_SxtfqZWy946lRwOpigLy-J5jlbRt9iq5mUIDs6g>
    <xmx:WC3LarE7q_ZI1dFeX8ypWjVPTncePCNcQRKyb5Ox6zHkJU3o4-JwEg>
    <xmx:WC3LatqbFYizodDBz2y6Wu8kjn41xwr4dgJcEg7Ph_BxA6MCpNK4Vtkt>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Oct 2026 02:31:51 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] firewire: core: enable context analysis for transaction layer
Date: Sun, 11 Oct 2026 15:31:42 +0900
Message-ID: <20261011063146.497455-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
References: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel is transitioning from Sparse-based context analysis to
compier-based context analysis, which requires LLVM/Clang 23 or later.
Individual compilation units can opt in to the analysis through their
Makefiles.

Enable context analysis for the transaction layer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firewire/Makefile b/drivers/firewire/Makefile
index 1ff550e93a8c..e27fca37b4b2 100644
--- a/drivers/firewire/Makefile
+++ b/drivers/firewire/Makefile
@@ -3,6 +3,8 @@
 # Makefile for the Linux IEEE 1394 implementation
 #
 
+CONTEXT_ANALYSIS_core-transaction.o := y
+
 firewire-core-y += core-trace.o core-card.o core-cdev.o core-device.o \
                    core-iso.o core-topology.o core-transaction.o
 firewire-ohci-y += ohci.o
-- 
2.53.0

