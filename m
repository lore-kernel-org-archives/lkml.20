Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772856;
	b=fvHu87QXztQww8Gsy1C1sH7z/ldlezNhiWoIquBhZGG2uID8mcQtx2X8XYGvuujkdkaX
	 E0Nr0J4Sj4ATJJxIYgHEyGftNxSH2MKF0QPa7RudlN53qN425RPy6EAt9YYFNitFeDwQG
	 mgftUrwc2u4RXZzirtRXbkpV57d3ab6CuubvkgLJcxeBJxREe+vf6hpBMzcw+6tnpBT1i
	 p4rfbd+7ZbQv+VrXeb1HYGfuFEbMAFizU2dHf2pY+Hcam0UB/qfrCmfcL9g61gpiTm7J0
	 cbL/MUmW7Ukz7dRxFHmPUzcBaJynmzUymQ7bLEboXmmSFWeSh9FayA9GPDDq6ge3d2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772856;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=tAaVmzUGd7yfz+Y53F9/4k9F52nXT6HbnGx9q7bJDc8=;
	b=YX2SF8Dwr/JbN5nN39RTlCdVrYm0gKjgCUuKygdMVTDdWiq+d6Sl6qaTggVDcip9qYCh
	 rZ+FQHQY83848h9CPiBOqBltVFzd4UaDZloetWatYCuTiXl3R7Bj6mvmm2ayDliyNn3dD
	 irZMMOPyvPrZmt5jnYbj8tyhumX0hBzil0nTazJbmKlAfekUm3qxSc9kNRs/q8nTyetDM
	 ykr/mzgvKGXI24Khf111ebyfXAbUP148Jcic2UnSV1x0MBceOzZ9xikl+xeZ28fhSZnJC
	 lFBuH9K4BOZdrrH3iqnhowe9ZgoaZCXBdXrOlx1zj0w2cChyDhbhs0V842/EQYank3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=k1+FTmoa;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dnQsin22;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D69F606A323
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D69F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=k1+FTmoa;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=dnQsin22
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id D74B51D0010C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:27:34 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 23 Oct 2026 12:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792772851;
	 x=1792859251; bh=tAaVmzUGd7yfz+Y53F9/4k9F52nXT6HbnGx9q7bJDc8=; b=
	k1+FTmoaMyc6c0UxlJQv5ItJzjmcBf8p9uravKf7CWcqYPIY6VYuVcRQi1zfaS3p
	JTV7xNHXyuPBIg4M1Y3LIUo2PT4SW+1TS/sJlwKPNJv0YLOfJdujyMYDhKnLqigj
	a4WEgF9hT7/9VDGpH25Zbg6K2nXBdR2Lf6KrtKptc05TXoJU4NnDYT/FUM4KkKuk
	UAyTzCpIPLxRMFY0DwKMz+Xd/+LdWka84DhJR3Z5hEHVytvKYQGoRM4VE9H5af5d
	piFJLdQHqlrfvL14KRNrabuOuKsrXYvwb62NidZPfva2+5Gsr+3vMgaEY60Xnywu
	adgFr1W+nIsIORRMw2aktA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792772851; x=
	1792859251; bh=tAaVmzUGd7yfz+Y53F9/4k9F52nXT6HbnGx9q7bJDc8=; b=d
	nQsin22uZBwliP1AXOU3UkaJFKSP+MVYwuqk7E7KqIjid2XZeiDIT8VG5paoAGtg
	ZNet4zCrwgRwT2x4QVnmNPXMzgYr0PObNTG8O1ZUWp2AmnrIv3grjPdiz1Jy4juL
	fPU3iH9IOe0TivW+g3rKK93UlrVaXBpC7kyG2hdDY0Zhvp2yJaQpOxvhgLa8jCbu
	A/qQa3kKPB6mQxdhvd7w+XncnK2Hlgdm00fR3sMOcEY/MT3tJq58yTPcjQkjHvQo
	Ak8Fu0Zj+IgAZhSxPWT+R7uNGh/g2xta8311KFpIdMc7jC9/TcJCQO7+YD8jXJoI
	tM3XqatVt1NXOGST29jLQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792772851; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:c88uGVTXpRciiRFmg2JGq252GV8R8ohgJqZC0+DzgVTf5ou
	LXYaLGFLBGTdey33wLC7wKNShdxfanCthB+YSCdAi2+20LZ7n99qxpJnDcajDb6L
	tHtIllOdJUs5MU9iumuYtHJNlryd7wb47yyI+U+Z90FEX81/G2UTapiUpl9hvq2m
	rzz2s4fmQWL3Pbdy3Zi9S+ySAd5Jkr27jcvB++r60F9yMf9r6FU2MiX/C3rFzqbb
	fZmJ0rgc0ycb6/N7U4noEmvEIvNPjoao3J84QA2kxEG9rYC/FLJ8z6JqvAiRXDHM
	Q+lQi/jCYBriehBmvVvT1+gW6WaxP/7yivb2KLQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+e/Wk9rybGMCI5Gv34ketxCyX8V4ZGXFTpnw18SVErI=:tAaVmzUGd7yfz+Y53F9/4k9F52nXT6HbnGx9q7bJDc8=;
X-ME-Sender: <xms:8IrbarnhdCh0sEd31LJb3TjdtxrwVseMVJEc3dOhj7OSJ4JYqz6uUQ>
    <xme:8Irbapolq5wRAu9zEz0MAJsHFQrPBf4UWEBN8cbl-QvsXN_QaP6e4xUd4glmt_74f
    GoK48xd2D5gmlTGJUdD4JIPu3m72S9BpEk29JSSydp3b_rFxZj8CiL_sg>
X-ME-Proxy-Cause: dmFkZTF5nL+/XgICGqkob1XXU5PMKkrkGakQIyKKr7sF16M69IBIjyFoFlQKe+kGgPogiG
    yDAUyj2mlimIn92XnNIp50Ko9dajCgfEKcnn2yNvERVAODPqYoO56oa+aK0xgQ5eukbl6e
    M/NNMPIKEfXqv7Kj+mtrjZ1AIfj7ld2ptH17oz3tNF4JiSM05SBDS8fB6J49SOArm9tjKK
    1VDgF4rbmGlg7YrP4SrbqI73wDge2Ktz0j85iJLDf/mcra8fcEkmDJLV45kb5b69fYQA/K
    WdSFwdhUDJXiYz1AXW1+P3fn3j3B7XHCR90vnex6mc/KNGzlXF/4U/Ty18wt8+CsTlzRuD
    RWvPQT6hZOCJaQOB0vTz8Ux2hSjMUcKo/Y8KuPF0wZlLcfEE8r3QFMX2omI8d9DvkroTXg
    MI8wHEdhPXV6RtPPd53qYyc28mg9QxhWWS/PktaRcUuHwea49RZH9dP+/Mr7PTL+UUg6Ow
    1R8ytafKjjzL6v5MzvdwNTHxsiL+1HCdSs6v/fbNSx/KRPdBDi1nDIqixaCpPSE1R+kQYc
    lbQRjEeVDVfZOUQU3aCBsvhBMeF/Q/YnImc0bNX6Iru7tovjNBlfX4jBrGOYa/Fw3lUARG
    +782Sra5wfe8XixzhOpnfKEr9UkE8WgzK1H0mktmkuNdPj5ULLzRZlhEZ6pQ
X-ME-Proxy: <xmx:8Yrbah8gQ9MOkY9-FFK4aw-oMNvCWzlMQ9WqXbMgDvluFbyT65RQfw>
    <xmx:8Yrbamb1s0_g7z2ajAixn54wBIosYFz0LcQ3m3zo3NDSd9PtODl8Mw>
    <xmx:8YrbatP01ZMsq5BHWoWW5Od5SBuYIUu0o57f8F8vnPNSbAeuHEN9Fw>
    <xmx:8YrbaqAv4Cq6xH25m4AEXs3xSszcQbWdMQ5m79EkK3WLSf9j-2-vmg>
    <xmx:84rbaqCSCvbooSOxPkvS-MljeNmcpodl7MmvsLht1zHEB8yzfdxikeua>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 29C3F32A0097; Fri, 23 Oct 2026 12:27:28 -0400 (EDT)
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
X-ThreadId: AG7ML5kObmmw
Date: Fri, 23 Oct 2026 18:27:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hungyu Lin" <dennylin0707@gmail.com>, "Jens Axboe" <axboe@kernel.dk>
Cc: ben.hutchings@codethink.co.uk, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-Id: <0241d3be-82d3-4ad0-a055-3897e7dfc475@app.fastmail.com>
In-Reply-To: <20261023153645.37546-1-dennylin0707@gmail.com>
References: <20261023153645.37546-1-dennylin0707@gmail.com>
Subject: Re: [PATCH] block: Return the soft block size for compat BLKBSZGET
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 23, 2026, at 17:36, Hungyu Lin wrote:
> BLKBSZGET returns the block device's soft block size, while BLKSSZGET
> returns its logical sector size. The compat BLKBSZGET_32 handler uses
> bdev_logical_block_size(), so it returns the wrong value when these
> sizes differ.
>
> For example, on an x86_64 kernel a native query of a RAM or loop device
> with 512-byte logical sectors returns the initial soft block size of
> 4096 bytes, but an i386 process gets 512 bytes. This makes 32-bit
> blockdev --getbsz and the BSZ column of --report disagree with native
> queries, even without a preceding BLKBSZSET.
>
> Use block_size() as the native handler and the pre-regression compat
> handler do, and correct the case comment to describe the soft size.
>
> Fixes: 9b81648cb5e3 ("compat_ioctl: simplify up block/ioctl.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
