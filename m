Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792845834;
	b=zdW5wt5lV21KWATs3T9BnrQ43OrExslJ2MLVcMZGiszixCQpdgAfdqCDSICKrRm4V2bk
	 8vuA+YOj2/r33bVutic6irSeKhQgg8Ik68DEvUtcxk3TyQFRDsaPfwWjA8kNXsW0HavWZ
	 y9VCwF34Ozfb+bYLQo1HGF+5Ycg1aUzhqjm5D/mcFGODMtbOZSLg398jtbHJbWzyxU9Th
	 vhXR2zvzJYW6c55cwaB2rECO7N9DaZsAbTZzAO4ObGb3G9MxxinBEQrRx+49bTNAtu3OJ
	 y0PsgMnxolBKqDoXCUvM3f55Ni6GbfOKtFYAzmll7t4/KK3akb1xT1+zJUm7BnWxilQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792845834;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=ENhw4oZ7dkCvLtEmjtoon6DPAJB7hCjSjNl5XJyd9Oc=;
	b=w4u1GzZN1VUVYX3HJdY2amIlTNyudLT3xAsN5lZlKhHrjl4knTBIdrRoOI61Jvg7Lh2d
	 R/juoZunHFtKx3UVhwU8ciKBoVaH92tZhR8JYdmNLlBFaQUbIXsx+XYZ1GjjNTn24ULgd
	 rnNOamAj2x3vQHbEKEKPzEEA/u7+4f7ZqG52f6gS0/aAqgSFcK3RdaDSRJrbl4sAqtJhl
	 uglNAcQUe5W8ud+5d0VEhjzZ1Mb/HMKGARU2fpab3PXjcQ2NitmxFMzr1lY/fEdEGPInL
	 5M22uT7uCLz4jF2H1myYYVynSi3Mdc5sZqArOVh12cEMprf+6uqR2mCFPb7QYtEtjtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alepacheco.dev;
	spf=pass smtp.mailfrom=alepacheco.dev;
	dkim=pass header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=el6As6qC;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OHRQFyCF;
	arc=none smtp.remote-ip=202.12.124.143
Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620DF606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alepacheco.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=el6As6qC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OHRQFyCF
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id A76A01301A5B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:43:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 08:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1792845832; x=
	1792849432; bh=ENhw4oZ7dkCvLtEmjtoon6DPAJB7hCjSjNl5XJyd9Oc=; b=e
	l6As6qCTal9LLJ/htEX/Stn2qLwfpUxt64s1D5Hsedgca5n2rOcRpqUwTMUFZ0Wz
	c51yVL/raBGUF16P1D0GgDfIbvC01Dksfdv1ccCqcfMHYAxhU1w6fGg2QOJXdhfz
	cpAlbMktQEr2UqglTcbS9m2mySGT2WdQqB3YwSPI4Z81XQceBRGoyr65VwiUvqRa
	UsLEuN2NftrrofbaXctz8p8JibucqZ0mS9s4/lHzOaSoaUs0I9TnxjDt4MG1E53k
	ShCd3tbrtTeK+F9d2lGMpnsrBaOvn1fveKrfUj98nxRrd2xIW5HAIySyeNli/ApI
	wEvmIIdacwYH6aEdYoDzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792845832; x=1792849432; bh=ENhw4oZ7dkCvLtEmjtoon6DPAJB7
	hCjSjNl5XJyd9Oc=; b=OHRQFyCFcyylnJohh+i+FQgH/xttTDiYrJxJw7UpCumn
	TH8FUEed/2D3aoJRlqOBi3Hungvypi5KvKp89hwZgGTGB39WsKVs7BBdExTpQ3Tv
	jEwMraC9jnDNT6h+Hkf/XjKs70Z3uZLgbBkFHmZniMPE7yJFcJgVJi4/LwCGr6RX
	sGcb3tsugnId1XVKyguMa7laxx7XQ3SV1Z0SS6AugIhbUsxlmUJ2qVY5sr/XETgL
	uzq9irYlUJ7wIZG+A69vgjPyV3Wvq9TbWAyEMeM9dMPPnSp/J1+hle3m4h6pB5TU
	8Dfdti8OvefZGfjCiloDGcaYmB+QeLwjqK9HZB0Dew==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792845832; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:SFbe12wN0+ubah2K1yL9RnoRygwOvKa4P2HNmIVErkLMaxa
	CMtx2/TFI9GjbZj87CFM3DQeMJ9CpareyHr55VpiYmHcKn7/3tPfJcfOLb5t6h8E
	9bjM5TjAr9Je0cRhUCwT3eKws0HL+dA51ywVxgLMRsuvg66cnmSeTNmSgaJfPvYI
	o4Y9X3/n6SqnYz14CKd3+CSsI1m2V/s2f8Ukw8gr+o2Q5w7twLTdRPtF2j+CD0Kt
	EdF8Vu+NTw/QDIHE7N4w7Z8u6/mpSMhXaEgUKNdkcXwdRcgHjrzt14gea1lnMjWB
	pSHEYTmKNKvi+DNTGL3Q/Oq5kBvICW9YYqAQHcw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:q/20VQU3SVZJvTb9VFDJq2fqOsmMOSC23FicZ+FboCQ=:slF7uynnDrqUAcmaJgx1X4rd1EXSlyPTMvetHGJ2f+o=;
X-ME-Sender: <xms:CKjcaggvhXENat1fSCST6gbc7KXn-N7sRYMtBGiRQy2niX7OdFxsvw>
    <xme:CKjcaj0K5ST1e6yn5DHqHYvei9iLOlMC4h5Uzcea910TjJxX5E5342VpDefy3cGzD
    NCMwdkqgOxJvftcttLohWVsjOQU_fm2nmEiGCEE_TBPy7JEXGZDeI1w>
X-ME-Proxy-Cause: dmFkZTGV7SK1cWrGZthFWa8XkmJ66JuwGiPPOMutVIbcRSFR6MLAIUMYblUOqL5GWGSJ0v
    YNr6zpsE5vYSmbv8sRU7UrC841yllAbKXaUPKr7l9YuWZRbjqQX9I3w6jcRv454c67vyz9
    2a60rFrOourTzmy3lFCrhfX9+1aDyxRktApyboxLqofk2HrrViGBrOe9GVsm23VHzNT+Wn
    mZjNA1sVzeYLXW/mtccpkFnYIGe9rSQpHXRfVM5b3WU8QzV9lpXknZHoANHV4MlXo54zdn
    rQzTEfEVAF2NDPPBHzPa1b/5+h8UF9oedc1Kw7aYq9glpsBMbWhhqGNriuFjQ7fPRnifAz
    Afkb8+FKGKZy2RkUOQsw4UmEM/C5uFDuIHGvorP5GBLZtLZuAxtRLx1+72bqvYZyMSyK5a
    QbBT6QjiyHj1/YzKsZMmF8kx3pAJYxLDwIhQ1DuAwrIxcAAwXyhQcHypyRlyCh0Gsz02xo
    p2SPBhujUwUX5oAVYKc28NN/FgsD8wrBnID3zCsucudhld/By2R6xumFQc9iUzMRvvJGE6
    2oxvy+LK2qOJjJ8P9fXBfSwgL4Jc30KPpqWdEnKn7oSz1SCFwLd3defEZVmqE0uI5m7PsA
    zi90t8zzjZ2I/iOK7eUpl9mP9ADWqeAup6t1tk2MnLlnUnQTH4eZzHBD8LWw
X-ME-Proxy: <xmx:CKjcaqjur_KfSgA-rbKT36p9-2HyT13Xu5U1TzHZWXgLghgX8cSR_g>
    <xmx:CKjcal-sY6eRu0tPMz2Qr6SE-JW9tIo0yTvQuiDba2PFc7a9S26kXg>
    <xmx:CKjcahE16invgkQdG2MLZV59alYBnzbPSEKv-5a2ajJBlZleP0UqcA>
    <xmx:CKjcaoni3-z8nIh7rs4hnl3E_M886Do8MkyCvezhmaEP-OO8naZjjA>
    <xmx:CKjcavMDrHNI6gsx4SNhT8gaasu2roO7R1nmkuzYCUWfj1r0ZCblpjMb>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1A26A700065; Sat, 24 Oct 2026 08:43:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 08:43:51 -0400
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>
Cc: "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
Subject: [PATCH 0/2] ubi: Check two values read from the media at attach time
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Two values that UBI reads from the media when it attaches a device are
used as an index and as a length without being checked against the
device or the volume:

 - the PEB numbers of the free, used, scrub and erase lists of a
   fastmap, which ubi_wl_init() uses to index ubi->lookuptbl;

 - the data size of the last LEB of a static volume, which
   ubi_check_volume() reads into a buffer of vol->usable_leb_size bytes
   when the volume is first opened.

Patch 1 rejects a fastmap with an out-of-range PEB number, so that UBI
attaches by scanning instead; patch 2 makes check_av() reject a static
volume whose last LEB data size does not fit its usable LEB size. Both
need a crafted image: the fastmap and the VID headers carry CRCs.

Testing: UML (ARCH=um) with KASAN and KASAN_VMALLOC, a 64 MiB mtdram
device with 128 KiB eraseblocks, fastmap on, this base with and without
the series. Each boot formats the device, makes a dynamic volume and two
static volumes (the last LEB partly used and exactly full), writes them,
detaches, attaches from the fastmap UBI wrote and reads every volume
back; that passes with and without the series. It then attaches once
more with one value of the fastmap altered:

 - the first PEB number of the free list set to the PEB count (512):
   without the series KASAN reports a slab-out-of-bounds write in
   ubi_wl_init(); with it UBI logs "bad PEB 512 in fastmap free list",
   attaches by scanning, and the volumes read back;

 - the last LEB data size of the static volumes set to the LEB size
   + 1024: without the series the first read of the static volume
   fails the UBI assertions in ubi_eba_read_leb() and ubi_io_read() and
   does not return (the boot was stopped after 15 minutes); with it the
   attach fails with "bad attaching information, error 6".

The altered values were set by a test-only change in
ubi_attach_fastmap(), right after it reads them from the fastmap, not by
a crafted image. Not tested: the used, scrub and erase lists, negative
values, patch 2 on the scan path, and 32-bit kernels. W=1 builds of
drivers/mtd/ubi/ (x86_64) show no warnings with or without the series.

Alejandro Pacheco (2):
  ubi: fastmap: Check the PEB numbers in the fastmap lists
  ubi: Check the data size of the last LEB of static volumes

 drivers/mtd/ubi/fastmap.c | 40 +++++++++++++++++++++++++++++----------
 drivers/mtd/ubi/vtbl.c    |  6 ++++++
 2 files changed, 36 insertions(+), 10 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
