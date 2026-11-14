Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794636852;
	b=XrOKWa+hrWavMd2H6XlCppnRNQsecaLmLLuVS5CQZtTB8FKGa1PgxD5fFaoAXCx4S/aO
	 hVDubDKrASee1CPx39iWz100NZF/5ZLFx3bGwiSCUUrp0Qts4EVP04z2lAZDExdaIufkL
	 zLAX1AqVFwT425pmZZeIIC/B4DGF0dOorTrIa0Pg08fbWWwqRkCR19+SWASLQBDd3wHK5
	 Pkwvvk/eWcTyS7GCJnmKKcU8XjHI9zUvzR63Tw779286BocmhKGEhoowQtmtHVw9yVa7c
	 1Mh5AzPHMddCuEyvbGB74qTyOy6fKpO4Nd2vC5fAR4/v76ijqNp53pAdXdaNbq9lUNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636852;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=a32t0mX2kC2v2uk20RCPBHvYfdu/VxDInh2ddlw2N68=;
	b=Urpvpn87XdvW5dWKR9XjMApUIWZJwvRf0lZ3PSKJFgxoPSm4XO4HWvyVRu5+hcEFFY/g
	 faw5hLMVPDqra71ZUa2Ex3xRJmVkQmMsP7nPAJFbCMr91U3fcL26PuvWxiPfybbiOwBef
	 UwvrUupa472xvE2ry9C7n2FfIt43s5865tDfH+4Yf1MHQrV6vcClmUB7tgDfEhMw4OTab
	 1IZCzwGBVgtoDwsP77TmG5v1s+oo/yuw7wu+oeRfwkfJ8G/tuJid7Eh0UmUbjOJZXC/h0
	 4sBi0xGd+gvOPf95+z6xjZ2FBGGtL2nkSAOx11Rv7PZtL8EgStISfQZic+KD4GDQeMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXfkPs5G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F7606A323;
	Sat, 14 Nov 2026 06:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QXfkPs5G
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794636852;
	b=0W7HyEIqgJ4GIdX+H3TALIVhfxerRUogUMq4LShtpHaz+rr4ECRw5BAKSaFDGYeDv6+M
	 mENj5lCArWsAyOvKc8+9JFmfA1O9QfAMDGFIN1n4RzJb881fRoDh/e4kz3jCZxtoPCGeC
	 QRbAFZx/Tgm9atgMavYyBCDI68yo+mQQEFb03xBqoNj+yJf6QJGfhdQpXHxm/HQWAJMfT
	 VJ4VzE8/cqmOp6/vADQmqm6QlJN3FfsHAL9lUNxPEcDcpe4Z9S1pCFDqsqFnsfOllyTLq
	 Zd8dmJsMuUIs/V+i1p43/OpKFEKMnKrgv2nKMaoStw6SyIkkDiKsuDPqaUFCI2PTD5g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794636852;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=a32t0mX2kC2v2uk20RCPBHvYfdu/VxDInh2ddlw2N68=;
	b=trqX/JziN4GeMWBRDEh7kIxOzxSsKtalgdbRJF8CTPqYXa+tKBP6F+H22tCQE9aZrpON
	 kMuERdY2wIb8FVx+EqDTSp4YzXCGoAOakCO7sMA0j7Ec1dH3FHzB+0dlovLrxJrxXpcQn
	 G2pNDtovug/jk8Dy2jRD4t2ewYipDhZxL5WK65C/Cxxi3HzglsN8ABK1LreP0WtfliUVY
	 g0OUU4viICQY37W3hf/p7KZs/5AN6Sl77kFupqtjQvrQNg0h6JCtu95rOlAuQjPtZp7So
	 +xvklB6cSXYdG0cWLRgCpdGHb0hMk+PP3vEzrC+XaG1Tek77r8+GjI/OYLzYEqnqgTw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB8F61F000C5;
	Sat, 14 Nov 2026 06:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794636852;
	bh=a32t0mX2kC2v2uk20RCPBHvYfdu/VxDInh2ddlw2N68=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=QXfkPs5GKtce6TEq97tOduVeMkwNHVDmrtXxL0OosJV9PUpPKWBda0TSt5HrCzjn5
	 QWRBxoF8YtVTxfyscjlLwYgLml1yFuz5+bufZOEnJHI0pEynvezUqvrFm2yybdcbjT
	 TdjECDaFvhvSug0SQmlQX7zhvAPC99HQGwRzXZ7cEQ/Erm5khFyhKL3dhbE9MdmNIG
	 +TUKnn3nJ1mrXxnhpaFRlFEPQyfDPV7h/MTLQ8dt39L4AdlDIqS3upWDHMZjO3Ogp5
	 Hsi2k6uxl6+FdBuAVvBueMfC1V59bkZD0ZIfTo+gHZCJNMHNQTnlpzpMc5OUd1yRTb
	 JKneIDwTCxeRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1F7C349CBD;
	Sat, 14 Nov 2026 06:14:11 +0000 (UTC)
From: Prateekshit Jaiswal via B4 Relay <devnull+prateekshitjaiswal73.gmail.com@kernel.org>
Subject: [PATCH 0/2] docs: kdoc: print each warning once, and only for
 selected symbols
Date: Sat, 14 Nov 2026 11:44:07 +0530
Message-Id: <20261114-kdoc-dup-warnings-v1-0-265f89bc3f9c@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBtQqZSuEi0sJxsCC6UfkO6et
 PwW72VIFJkS9FWGSBcn3kOBrCuYVxs8IbtiUEJ1UsoGN7fP6M4DbxsDB59Qm3ZprFaTER2U7oi
 08PM/h/F9P+AheKtjAAAA
X-Change-ID: 20261114-kdoc-dup-warnings-785f4a72b806
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794636849; l=2326;
 i=prateekshitjaiswal73@gmail.com; s=20261107; h=from:subject:message-id;
 bh=C0QJf4U5Htgu11IVU42m2nZfMKlhIuaCFFa1KyLlrkk=;
 b=IawUYJmxMUmFL3JoQP20+VPu0XF5cLr4LaidJlb4FNZAigCaq9QPv4XYldITNpYc2fVzFh2ii
 oBkzQ8YlqqlDp1cZM2DendDpjBwigGFpn8l/+2G3WzMkxbvawPCMa+W
X-Developer-Key: i=prateekshitjaiswal73@gmail.com; a=ed25519;
 pk=Z9QqjsqOUk3AvD5zQ8B+Kufufuvk9wEO7eT9m1nMJdo=
X-Endpoint-Received: by B4 Relay for
 prateekshitjaiswal73@gmail.com/20261107 with auth_id=1445
X-Original-From: Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>
Reply-To: prateekshitjaiswal73@gmail.com

kernel-doc currently prints every documented symbol's warnings twice.
With -function or -export it also warns about symbols that were not
asked for. Both come from the parser flushing warnings of entries it
mistakenly treats as discarded; patch 2 stops that.

Doing only that would uncover an older bug: the output step never
prints warnings for symbols selected with -function or -export.
Patch 1 restores those first, so nothing is lost at any point in the
series.

Testing:
- tools/unittests/run.py passes after each patch. Without patch 1,
  the new OutputFilterWarnings tests for selected and exported symbols
  fail; without patch 2, test_stored_entry fails.
- Warnings printed for intel_dkl_phy.c, before and after the series:
  -Wall: 2 and 1; -function intel_dkl_phy_read: 1 and 1;
  -function intel_dkl_phy_write: 1 and 0;
  -nosymbol intel_dkl_phy_read: 1 and 0.
- kernel-doc -none -Wall over the 10320 .c and .h files with kernel-doc
  comments: 87900 and 49625 output lines, with the same 48026 distinct
  lines.
- The two "Excess struct member" warnings for page_pool_params, which
  Documentation/networking/page_pool.rst pulls in with :identifiers:,
  are still printed, once each.

Notes:
- The new tests patch config.warning directly. MockKdocConfig.warning()
  is never called, because KdocConfig.__init__() sets self.warning as
  an instance attribute that shadows it, so the MockLogging handler
  does not see config.warning() messages. I can send a separate fix for
  that.
- Plain --yaml output never printed warnings itself, so with patch 2
  it no longer shows the warnings of stored entries. With -rst or -man
  they are still printed, once, by the embedded output formats.

---
Prateekshit Jaiswal (2):
      docs: kdoc: emit warnings for symbols selected with -function/-export
      docs: kdoc: don't print warnings of stored entries twice

 tools/lib/python/kdoc/kdoc_output.py |   1 +
 tools/lib/python/kdoc/kdoc_parser.py |   4 +-
 tools/unittests/test_kdoc_parser.py  | 126 +++++++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+), 1 deletion(-)
---
base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606
change-id: 20261114-kdoc-dup-warnings-785f4a72b806

Best regards,
-- 
Prateekshit Jaiswal <prateekshitjaiswal73@gmail.com>


