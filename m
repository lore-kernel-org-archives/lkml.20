Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793937233;
	b=HZvwSD5qwtgo7sd+9s6U/w/r+/zAdSnHhZ6W44THUhVm1ia7lqDsUfw5peiKMO4/tRK3
	 E1dDzQSXr5G2juauxdQ+Uap/O9AXkmJ5qEuO9zQVbABUk7fsFn7oUoLIbDiahIo+Z8HDq
	 4HdNYATDLKyxVZw71msz0NL334/BthWAbvyZvkqnE8s4pAF332tYOTRYo9OeK16kGNDGN
	 yvKcTPaRFPrZp851d7MnPT9h8vwBq5576bNsJNJlgU3ygJU3GFBU2fsSHWtL/9VOFU0sc
	 MnHwa97a8WDTKnleHz+cqJyK31z0OzRqeSlkuULqP5n4f65L38Z8rbqD0otHcldO8UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793937233;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iCrRXtFu864b4MVBFiZe70KJzA1i85H7fePu1ppoOh0=;
	b=5iAJsJBwCt8r7tAgIun6hKK0Z+CTQ8KhmbC71h1aGLg+ZEPsGL+hMPnvQTBO7okcb7Ne
	 u77TfobtKne8ZFCkIWgvH5O/3mnwbV7udkNfyDmRGtAHvHW3K99kRnByXj4sSu/30VsEC
	 EHapuApS+qTDG07iPBvNgOvuHbth04Ws9MvXWcCG8/mgRd8BM1Rf2oMEyA+FhJzqWKkj+
	 ya6+/9tgeaqNOga3T7U0CiXbsIPrKT7jN4QvbNkg1dePFODhGJPIt3EVYHnNcU0EaFEU5
	 rPfqCtUleCAzHzddJYzzJl1lrNXdzkTMLGIQ4o1t+H8WuFkax4l3dBvoMUZEiw2LfSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=GgafwaO2;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HwhaSk9g;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920B8606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920B8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=GgafwaO2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HwhaSk9g
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B09391400133
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:53:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 05 Nov 2026 22:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1793937231; x=1794023631; bh=iCrRXtFu864b4MVBFiZe7
	0KJzA1i85H7fePu1ppoOh0=; b=GgafwaO2tz4QtjgxBq0S/qlTngxcTF11yinFs
	C+frwnAXKO+5drqkYaIR6kSax3UsiFo44hdmB5BXrsdy/8164nmO9OkLyP6AoJ+j
	YaHnOXK3g2vs9YG2/cAKjzIN423QZAHH871dSBlVvHT2wpwXE7aHgHUhNL3U17kb
	XjPNb8Y/+d1JNJodhvXWtX8PzbM7aRKWSrRdhMsi9lJrxSdNzpZH3g4rEASn/f8I
	d8HEIyy60Lnv4cjJrlD6dB2UDnkV3esPHN/pIxgjUvPIGGXysEDLn/8+rm71UU5w
	D6h9GloeDeyVnzKItC+4llgA1YowiaPdwvSAlGTeV8DvmXczw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793937231; x=1794023631; bh=iCrRXtFu864b4MVBFiZe70KJzA1i85H7feP
	u1ppoOh0=; b=HwhaSk9gpZgBFgQwknaiTvQqo+1HDQbdFgQqeY57Wqauk6wYXKo
	5uQ9dIBJTBVLAzNVu6tyvYn2VUpWYsf+j/hVb4MNVMnBfWPNsNQvS09fovPqrnby
	R8DzsoBrtCDfFqCfAcrqQg2H5HS3CEv7wyMrORf4ya5Db0bnNyOY4KG8elMJzugx
	FJ5FkjtMTuZqVf3iih2G9yc2ujUwADkUfcTzVFZwQ4WTv1oGlHe+VXAVKek+6140
	FpOffvkcGpc9ShwwD7B3QcUsxPLE8w3uitMJYOjTg0AwzoYs9PqX0Q+jzk7Yro6z
	iip2Qo55+HPTUil74OntZBFytVeGZTVolYQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793937231; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:WrefCwgHgct5iR9ts16J6e2ENxJumcsYFHXS/2Kjy2v1fnO
	j9HyInjPc/LfrVvqSHzMi/FNqdWlRYv/emOoRLoHZsbG0GM90xqd3cPqTD4TjPVY
	2fQIOs9p6ji2+gz5/zO8MF7k+Rm4+6qFX6gZ5Zbk4HCxDXmBblYUeIKuBy9CIVyA
	J6Y1C+P8CchEsE7KJqEGHWl6B3KuMN92djzsESnIQElfat16dpw02v/RVlKsOfjF
	OhwZPe5HN26/WAbeBIEg2UcGPkcqiMRhuQNfPKFVe0qX648+W052dG5PbD1CVChF
	h71PU27a3cI7EvPc6mbY/5l/gFQ6dFXG5Sf0CxA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:hl4vkaF1BfqfxO2vw8BZCcpAC5qj3N5fswZ8HteUm/Q=:zZ5C+QLjjwQnJ4fR0LADgx4P6gvbyDK+qrtUFf8O+jM=;
X-ME-Sender: <xms:Tk_tajuURj4AGbsVoQQJCm_E5d-XNImeqlZWedGTvnyqmbpPNfkNHw>
    <xme:Tk_talKNTUyeDgTv4qHxjNCShH5o5K8nfrmXEgdBFMFiG4fAzY8YqoFyTxh09FeNe
    Vptc1oz2xbBdLbKVGtrrKJ_M8qrHyN4htwdKEQ_BNo55M_JyQlrbdE>
X-ME-Received: <xmr:Tk_tak-sSdW3Iisg4QZX_0W9t4_n13ywkvJCqbFwqD3F-vVoWRub5ReyRziJewOf>
X-ME-Proxy-Cause: dmFkZTE4T7gjfdVwdKvS0V82xicFfBN4ch7P0wfxstmEd2tnoXyTtuWBbNP+TGBxseifmE
    O/vfJ/VGCxNFNUg+5AJGTSPdEfcB+afSP1xLSVL8VPL+Q5GmF8bBx3MRsfwoe+SnZiqobC
    QzF1Gs4AURf7jkpxZn5bOtqXz2mlNxgKLZ1j46SIHfjdMiKS551bVPfoYhSXOvuuxFMKyb
    zJ4NZV3B3fSAURTKAT23OrBGJdF4tUDeIvOlegt8FpILRiyqH136kbVVKgGusufcRyA7Z7
    azJOtF3y8f5VQ/NdYzgEuBeXGYT83XuvBdwbzg4wnUnqh6iy7w/kAHRBFZKTHCfGwlntl1
    gwSc914vY7dfl1pINvZoqxvE23yQUwPn2sOTEzl139FRlwzkfdz4hbrZrBMJGsalafhUqe
    VvmuDPvcvJ+lGy4olmFPYcOSM17rJ4KoFhiK7t41IiZbKWbDB+rFjPLkEU+A5R0cyTzniy
    beVXAin+ftbmUvBwx1XFB1FrZ1pA6omAM03wdgP/eZsFekYiQEmQHO4Zl0t/CWENVF/UeJ
    kvrh6x9mk9lRlJ/V+oVUOyV8N5udNPpadAsQ4k3sKGxV7gYgCdz4KUrU2PgZQ16QfZ+vjK
    qZ/C4wYTGn5283Uwn+w1DFLajq6wqlNE1lBNhmObvcudmwXzhG//nUmUaCcQ
X-ME-Proxy: <xmx:Tk_tamy3Tq5iZ4NWos_Wj9rvy72Gfzzk0XOacoXCAHcw5hdzzr_cLw>
    <xmx:Tk_tap58uSNO99tXdJqHytJEAOttkMyCKQZqgBVeAWYRBkBzmcSWew>
    <xmx:Tk_tal_-AFCKLUM9pd3aO_Nbb0LDzfxyhXWCqnXO0DCZxdpcEzbObw>
    <xmx:Tk_tampmFmpsI0sn4wNtNbdNbtG4hDgSVhscdd9-msDgesGfqa9KGg>
    <xmx:T0_tavDSuDcGhscwveHUtWMfGySYS59V_Q04777Mfw7iNCW-2FOxF8F_>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 22:53:49 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: linkinjeon@kernel.org
Cc: senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: [PATCH v2 0/2] ksmbd: exclude metadata-only opens from sharing checks
Date: Thu,  5 Nov 2026 21:53:43 -0600
Message-ID: <20261106035345.728454-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ksmbd includes opens that hold no data, execute or delete access in
sharing checks. Such a metadata-only open without sharing can block
later reads, writes and deletes. A metadata-only stream open can also
block deleting the file.

Patch 1 fixes the general sharing check. Patch 2 fixes the stream delete
check added in v7.2. They are separate so patch 1 can be backported
without the stream helper. Patch 2 uses the helper patch 1 adds.

This series was developed with LLM assistance.

---
Changes in v2:
- Use disposition-implied access in both sharing checks. This covers
  Namjae's READ_CONTROL plus FILE_OVERWRITE case and named streams.
- Keep the requested access on the returned handle.
- Leave the attribute-only pairing rule and Time Machine AFP_AfpInfo
  synthesis unchanged.
- Treat FILE_SUPERSEDE as writing because ksmbd implements it by
  truncating, although MS-FSA grants DELETE.

This differs from my reply to v1, which proposed changing only the
truncate path and leaving patch 2 unchanged.

v1: https://lore.kernel.org/linux-cifs/20261104183702.192452-1-icb@fastmail.org/

Ian Bridges (2):
  ksmbd: skip metadata-only opens in sharing checks
  ksmbd: skip metadata-only stream opens in the delete check

 fs/smb/server/smb2pdu.c    | 30 ++++++++++++++++++++++--------
 fs/smb/server/smb_common.c | 34 +++++++++++++++++++++++++++++++++-
 fs/smb/server/smb_common.h |  5 +++++
 fs/smb/server/vfs_cache.c  |  7 ++++++-
 fs/smb/server/vfs_cache.h  |  2 ++
 5 files changed, 68 insertions(+), 10 deletions(-)


base-commit: 957772008502b579bc220aa2167629472f9aa696
-- 
2.47.3

