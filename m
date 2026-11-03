Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680196;
	b=FAljumd6LS3tj5xck4Qnbq2pBsEm2V4GuyLXhqjGwz/FBk8E7AviO6IGsENreImeSBMF
	 5Dcq+KjRX45BzM0HGsB6dti2V9r7kKPL6IsYBna8ixt77Bt48SxYvXPT/dhuqy80vzuOt
	 BmIEZPEamltN18+LLCOUbfQTdbwPEwO7FWp+wBlk2IZKOmV2V0zK77SK2pGw2YNxlRqB6
	 f5oBsNbwV34DWWUnzm57KvJeXzsIq3hmePgbs6pW4KFOl1+xYnaw8q4yICa/D7StkaaKB
	 ZpU4bxBheRoSqB0W/rqnomBrkW/ZIeLHfR1VoOtkAKGULYi/tg9CD4B23lYyFrXqcIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680196;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=GcLCVP/byW9lB9utLT5Cp39Wp4fsLagjwzXlyTN7rY4=;
	b=y4yrZqIADsqJXGAKomJwe9NoSAkEmD8jcFihPj5QpRswueIUVU7ic8/dJgB4vdKKa+XC
	 DsXQTjcIbQGEPdyq+US/C5+4dMC1N9VEr9iM8rFt4juaRKOXyhp49r0vSq5RyToUs47NI
	 3ZiMRF6yluLKEiNe7cj9blCRkkr67EzlBy+KDih15+1L7YQ448rny+PBXIJHk39KuY14n
	 ddYFqXpUro5ag7H7UC+fK8W8QDTttAxZPCqdHkriXWb/6o2AHvPYq8iwXdi8zSkUTGPEr
	 xHho9F433yDqyenUnIu1zWTJB7TM5sWK0Hfynv+httLbVamFf9G3F7k3f2lSJLeQxGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=blXH0vET;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HSOc5rj6;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2B606D819
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E2B606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=blXH0vET;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HSOc5rj6
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3A5AF7A0184
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:29:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 02 Nov 2026 23:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793680194; x=
	1793766594; bh=GcLCVP/byW9lB9utLT5Cp39Wp4fsLagjwzXlyTN7rY4=; b=b
	lXH0vETefFEB1tHDBW/SA4D7uioMeb9DiKOLmsEZyCXs7aWUYmEDWvQQKPJTKFDU
	T2kBk8idaYalDoOlaCveIA1NJSCLWtjMWrJscDG32oM5Opa4EhbN0eZxTjuHUIT8
	rQJixqW1uPhWamZjFfnDaT0bwXl73GGbDyvJXl39bdXMP594fRZ7xs+xbXpIWRgv
	5Od5/OXJaNOx6eNii/QSCBoYfPLn227V0f0SitSskmuHvV+ME/8yqUU2cuYAkfIV
	H7XQ3yDILh6b11IzARXJHqJDkgBX2a6JRvh2zL1qd0NTWb0/byAYfDkwPEY5jCwz
	VSos2oiShsZ3KZNWIbrHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793680194; x=1793766594; bh=G
	cLCVP/byW9lB9utLT5Cp39Wp4fsLagjwzXlyTN7rY4=; b=HSOc5rj62Imn/hBe1
	ZjuTgTTG2gTfoUbIKFVsaDiq6xa/VnghkXj10c2wi4NUxNNVlxIRwFI0FEqWAkMp
	nodicPJEi9u17hXmOvYIM0ePesf4l3y2Zx5xigMkEzadYmkrJ99uzUqKWahm7wYW
	S8D+PNuzDc1OqZ4Vm9qff6s8kH1YNOvzQ7tQ+rRcJYYoWAs+8C3o0WSGGJsfcnh+
	xTddJZCDhCMp6zUkx9YcLvgr0hAHKsDeMrpkuE7RQgejIKDHlQParEYHt7IS3LNe
	/vcMXnL9pF6NM/oqcfHxJEEsgAYs2fIG7IaIvjQXPmcd+taVMUEwIzEZvEb2fSfc
	Nm58g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793680194; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:jjqtPiKcxXkhWCNRwc8eOdqyE+noVpJsrh/rhLlL6s0nA0/
	FAKAkKyTQb98Tr0KZEeoMwfFdPpuWsrO3mD7BPNp0gJJn+BCQ8Ge4rMuJoARLd1N
	eEf7Xe3Ht0FS2FsphXuHCv5USTUAeU24R0HwK6ctInUJQ2UG5fmGSWvcXPR41Blm
	RVI80IqqMbOp+bP7Wt34VVa2vmczRIBywuNgKipt2Kx+jgf2Y7ncNgj2qlFomw+Y
	AiXBzc0wuuz5vbAVYmcSOJ3OnFo7asIeMwnu2DOFa3St9LTngjgURirF4ZQdGFaE
	wRYoXJnbJ6KQrf2P2YPIfQVRUXCtOC+FYIWjA1Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:pTudm8hsLHVTcISK2F+x6l/cuIcQ/FrsAh1kfQjUBog=:44Fz+fDYgIgGfTki3TYnOkRd/t99zQxfpRu9/6hrkcY=;
X-ME-Sender: <xms:QmPpavajz8rIskKM7zhSxxndjlKdwdEO78w-r3MJnVF2HNehUxnknA>
    <xme:QmPpasUcWoox8HWK5TlGc3pZ6NCPTGFUOiXt_ihGzlpfdPbU3C5d8YEwhqug_ODcZ
    DmYofSMZgICHPX_RXkcnBW3Kgrojl6vbBM4-5E5oMiJu01YHya2xN1n>
X-ME-Received: <xmr:QmPpapi7mSP04M8buIOoXq9yj6t9qAfGGTX4bNPGUmEMUvZbPmzS4SSfw8p-eJXZOy5hdRzYYVcxYU9bBnAKVHwd0cgoQU6pR6JXw4m3l6Jl>
X-ME-Proxy-Cause: dmFkZTFW70MjVLWzZbbHLAwQl54RRy5yYW8ytyMsOVRlHTtvsFWtLwSy+C0GWMBc5uv7YC
    8nLvYKRLza+rEF+zC3+mV+Al1JHFpkZGypcOTMhRfR6RaWAjfNSujLusOZKhNhIfUsQ9TD
    JMBnBkXox2mIOygxg+vtmKWDEDcI9ck5vtxF7XLwSRslXyYBvd9YLOwEBBla1DF05GnG15
    Qh/Ycu7Nru32uqWqK3c8tiOrG/cjV9s3FR8k7y6YOQYM3dmo919DKaBdHOLNVxd5F1lFBw
    3VzSz85wcU8utGKIcvFD7/o5A0a7hcXWpTlj4cQdSYozydzGjhJirvXAQ9imqZRtSaCOLB
    P9gN4AWPWn0mpM4vQRWeZej0c5F2UkiVyQFSPrirWT+1fNbniwVd/0axpxccv7YktkAvFL
    uZDkd8gZUVwhCEG71Ja1h3bDJAaTD/smW6r8+V1ytvAdAx9VSWIJaZlTYiIWIv/YIBWGY5
    fwHwC7u+pzQ+7IJBmXbxQsYgSCkWAE4MCWdSlgWyduCmFWneqxKDhQkk4wWPEeDWtNXFI7
    fHzocgdM08D6NGmVjjTycZ6FAY/Q61BOvynOE6GLeLQtDtiNpXzs/pgITJePn7h7+zTafe
    sNeyzP1fzI0dG4Lj7sOIX4EecakamUak9iNR+x/fn2MN1LyXyj/PYfW+mY5Q
X-ME-Proxy: <xmx:QmPpaiVbt6Tdw4AO7ep_RF1wWKJeM8LjUMZQNKqOKIxa4ay9lygGcQ>
    <xmx:QmPpaoO_pdVkwvtqCZFMo0sjElWwWmEc48prZyafrNg9BR1jqAmdaw>
    <xmx:QmPpamY0OLqi6TkQImQAyxUcPCDmj2ZDAm26gojKqPzn8E9Ge2LcSw>
    <xmx:QmPpasr7h78DwNxq8VcYg6o_7Da9s1MhOBLEqq_LROEemXKwBzEVLg>
    <xmx:QmPpasMge4VXYt1Sot5n0TyhWmN-ti2Zz9KzgG23bglWqyefpCQuCBQm>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:29:53 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] firewire: cdev: enable compiler-based context analysis
Date: Tue,  3 Nov 2026 13:29:39 +0900
Message-ID: <20261103042939.1231773-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
 <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
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

The kernel is transitioning from Sparse-based context analysis to
compiler-based context analysis, which requires LLVM/Clang 23 or later.
Individual compilation units can opt in to this analysis through their
Makefiles.

Enable compiler-based context analysis for the cdev layer.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firewire/Makefile b/drivers/firewire/Makefile
index e27fca37b4b2..0e5e7027f22e 100644
--- a/drivers/firewire/Makefile
+++ b/drivers/firewire/Makefile
@@ -4,6 +4,7 @@
 #
 
 CONTEXT_ANALYSIS_core-transaction.o := y
+CONTEXT_ANALYSIS_core-cdev.o := y
 
 firewire-core-y += core-trace.o core-card.o core-cdev.o core-device.o \
                    core-iso.o core-topology.o core-transaction.o
-- 
2.53.0

