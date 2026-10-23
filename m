Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798980;
	b=MqKmvUpfuQRbjmT+z7PtQjEwVQDYa2QHGKaPI0AmEkN4RCRG4aQRdWytTGP89iCvNStX
	 D5pAcViYC0autir6OIPakUyV+z6uC7jxiik4/1UR7bR5UOdXFJtsBHAJawB0Pcxw2MEYP
	 E+ajm0UpNQ7VouhvjpPJC7PBaTcIZOoHz2Gq7S2YH2xZx10IDZfCng/xI9p/L+BoOZMbv
	 qV06xr6xFtHSuv483m+8JBvPgOafs/nP0zbCFucDJrN91yU8O8+c34NjMHIpB4gBjIbfJ
	 a5ciU7Tb9mh2gyb3kDm5kbtj2dbljR7W3K7xRfXorICgj9i/S3WFAVfmotCX/F6coRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798980;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z9P74CI0r1RddvuUNcaySIOSlWLt4+nM23rKxRc7/y4=;
	b=xbj6KQKpeyVj39nbDcwazM5N6rljEq8pfVbO611j2QAxi2uj+l6ST1bB3kR9hM9oIBY0
	 nFdlzUedlaSaruIVj+LmTVnGROZYNOP1n1FsiEldjpnmBaulUmvfZRQpas/koa6JuWFEh
	 AeCf7r6fdbgwdm/JqcKm1cjl+NeWlO0xRv6V5rg+my32ejT2oM7yNnXGXvFJfjX4HAzFW
	 G16KxWaboULXtdqhLy0hoP+Mfi4SlN+jSwKNFJXvnRqQpY55SoTyce8zqg32vUCIxbEsN
	 5nyIB2K3B6V6O4sr+zxHhC6OHhpE84Ix8cHB6aYG5hyuKxCI1nRZ0H48dsBHYewRI5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pobox.com;
	spf=pass smtp.mailfrom=pobox.com;
	dkim=pass header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm1 header.b=awbqjPaQ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pkPNel4q;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD98606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD98606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pobox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pobox.com header.i=@pobox.com header.a=rsa-sha256 header.s=fm1 header.b=awbqjPaQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pkPNel4q
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 8E26F1D000D7
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:42:54 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
  by phl-compute-02.internal (MEProxy); Fri, 23 Oct 2026 19:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792798973;
	 x=1792885373; bh=Z9P74CI0r1RddvuUNcaySIOSlWLt4+nM23rKxRc7/y4=; b=
	awbqjPaQGh/daYR/oAq1DC5obfU5HxsZX81vOJ9w7sTVphlGdvYOzLWUl9dm/o4x
	uFiYAcgzkaCJP9Z6QZTLCoiPtCJuA/ug8/7ePfbBWmi+ixpDAHGLQB4/7h+T9NAW
	woBBBRfzEWasy1lnzFk/ewKGfNjepVVByjhSbnOv5sGitJozRIeG1TVfitljx2wt
	ihpyXNGFNUfbf2k+CXTSGf4A/XNnbEWL1YEtXk9T16X6xw5LfNPjfCuS4VG4weby
	E0OGPIYCe3R4RalkRpdRXoObJeXvqLpfpRScThR6h5+kEBFDyFMnGWtK3gSWRI4u
	BDTuMxDEP5HQKD2PbQFbkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792798973; x=
	1792885373; bh=Z9P74CI0r1RddvuUNcaySIOSlWLt4+nM23rKxRc7/y4=; b=p
	kPNel4q0CxPPk7dRjjYaBpGex+SeTRCS+TNmF7byY8wu8RFeNGP05TKThbt+8lS8
	PAvjPV7NXdIGDftAO+Bp4DrkFaK4bHiS742LPcwwTz88t61Wc120qv7YAHSAPLO5
	sOA2cCzbEff52Di2G9f61J1dXoBKe0wAEEIFQZGeRf+J8t7ksC9BIaWkO3PJmT6D
	CnLC0aIOuyz+uAz0DgC5r3tenO6O+W+vOB+b2Qt5Cb/gTKXWq2pIAo2TzpWzadOu
	+ms+AYTXlC33SIyanx2JDxoCnWAJY9NlIt1QOrVuL6govXRFo3XBt4hpDCdiwC0S
	MYikdEQgTvYzMTljcPsmQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pobox.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792798973; d=pobox.com;
	mf=PGJhcnJ5bkBwb2JveC5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:Atm4b1FnBdbSPv2nH2F2X6l35UpdpagQVm4Reqwc8Es5Ri3
	F12G+qVTiq1cJ8ccFwTxpSleFwQA5VxGvbDpP/1c7fhtjtGjcdt2cGfGCsTeWjJm
	u5p6VZ8PMORsl3QZrRFSiW5kLA/kB3M/UA+1AkfvB0vtcLMGfdTDRuzc08tQSE7W
	5lKLjgVVbXc3Rk6Lja7OWk+66u3AEgtNHhXEMj2QuABWwpft+cgJ9V9393BjYrrB
	n6ZykRIE6ztg4FoxettGPStSPJE2nQ4kNWeaf4nHOG+5jdp7epBf8wXX2hfBuuBt
	fJHoHZqSetu02806ZsmJthy4Vb8C5Ti85aPyV4Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:mpENlhJDLcrNLVWhxJQ8LMFCJakxNviL377s+zp5Th4=:B0xxg13vNGYZtNVdLB67EwJoOy1l46HtwNizRlqqpmI=;
X-ME-Sender: <xms:_PDbahJx67bZrz4t9bbI8joUjd8Pe9196gzv8gwutnerzTXSwYBu4w>
    <xme:_PDbatgEfAyv947-SkVsojdPC__su8NfBPz7C7zd4kz33zrNHuzLtpuXoUIAnKsNi
    P6I3YX_qWhG3P5wEFsNgEJL43sJzL23Xej33rzn5FkhlWX2euKbKZcmug>
X-ME-Received: <xmr:_PDbaq0tAgNV-JdolvtfjKVJl0AFrNQ-WYZrq5ubuJ9dJuWr9zcZ1hgSazc8BXDYUhpp8izoMUi1ARyuDTZHEWagSOLfBh5I>
X-ME-Proxy-Cause: dmFkZTGAMV6ryyi2zzDAeZTalQoh5YlTGHDdses31aRzp3bRBC9dX4FojypI65ul7r4nN9
    Zy/TyM76E6h3Rkowszr56d8pAmGb7qtMcSOxYpUWBn9mTm0ChqC/8S6Ci/gj/5r2HSiHK9
    69D0gSEGWqwYDPofdDpHbF+tSnltfZzV8Y8l70RnWBM7kDPCUym7J+Eep0wxVLs5LpTPDg
    oX46IjqvbFgu7VpNeStGxy3wU4OR9qkDQFyn7e85AxRvnjy3pfmXUogDzpdWenMQycERjw
    tzfD8CnrOOCnvwiLQb3em2YLiQh5zBsd1ZuV0Oo/0UGuchDyOHotYzMAaAHOQ80Pvhy6PC
    Lu6UthHbKHcYxCyUP2vZD+FDQShN3INDY0qVi/N8w5tI9RGRaHdSPNEWr853DnuWAnUOvh
    AxlKwYNTlqHFXLR4IOlu8IRqB2T8PodKAmgyhGWTV1dTxOQuIKAIKT4oaJyOLmml/ubwg6
    PhYZvmYy1ypx3+Tys/lNZvWxgNAVqYloURt0yDoC2EwOWqCwuzel+oNU6ZCDLw24k1vpAx
    lma/sm0mhvyZczDSYK8Hy3i7PivkADW0qhaqp26657D5jlCW8f42ITF5qAtDey7roml9np
    zlMqNJ/a6ETE+LQNAiUTb2388VX7wVWS9W3SN5+XX7FXmL55pcEbZTBVoQ8g
X-ME-Proxy: <xmx:_PDbauaRRPwVUmVEpXKgOJQeqIZUoESDIkzDohWt6cqYVUe_GJ9wCQ>
    <xmx:_PDbanjHfZP8_GPkGLwuebioiFsSSbzLEmoIX9SsQlVLMzmco00ijQ>
    <xmx:_PDbauhlH2tOsNmHoGD2MNjCMEZiI9y-zAKtZVcOYm87Pz0EgEBuSw>
    <xmx:_PDbakBx8jkwJGyVKGrb0us7k7PNoByACPjWEQMdFw0LwjTacbu_aQ>
    <xmx:_fDbair8B7bsgMCQEfZ55FFH4FDyTAEggOwDJLOyruv0fqDywRPtHQTI>
Feedback-ID: i6289494f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Oct 2026 19:42:50 -0400 (EDT)
Message-ID: <d2810142-fd45-485d-b325-f6d494690747@pobox.com>
Date: Fri, 23 Oct 2026 16:42:49 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7.2 000/242] 7.2.13-rc1 review
To: Florian Fainelli <f.fainelli@gmail.com>,
 Salvatore Bonaccorso <carnil@debian.org>, Pavel Machek <pavel@nabladev.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "stable # v4 . 9+" <stable@vger.kernel.org>
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
 lkft-triage@lists.linaro.org, jonathanh@nvidia.com,
 sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
 hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
 sr@sladewatkins.com
References: <20261023163713.816071858@linuxfoundation.org>
 <atvHKoRHHjKV4l8A@duo.ucw.cz> <atvS68GhCvmAphrQ@eldamar.lan>
 <7540e723-054e-43a2-859d-616010fc7bea@gmail.com>
Content-Language: en-US
From: "Barry K. Nathan" <barryn@pobox.com>
In-Reply-To: <7540e723-054e-43a2-859d-616010fc7bea@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 3:44 PM, Florian Fainelli wrote:
> Same here as well, bisected down to: a0c935bd1f76 ("fs: add umh argument to struct kernel_clone_args"), it looks like we need to cherry-pick 14adbd5341aa ("fs: stop sharing fs_struct between init_task and pid 1"), with that I can boot a kernel.

I'm experiencing the same problem as everyone else on 7.2.13-rc1, and
I can confirm that cherry-picking 14adbd5341aa fixes booting for me too
(tested on both amd64 and arm64).
-- 
-Barry K. Nathan  <barryn@pobox.com>
