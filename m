Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340592;
	b=tXmv1K26JhviCDFB94YW8GaD+841IC0XsMc9aKTv+o7367fZlCz00Don6OGDTHzbzqpI
	 8z9HqchyLxEgmT/bfKOjb7Z57mx+4CWaFhPX7OumP6NVh+mDbtD4TI8aCg3K9TesoKqim
	 zti2j9Zy1qsH5XvJL/8j/5JUN6qzub6zgwbNmnsv4bISHgAm178PXY1o+btivpAc3gIZJ
	 r90I5SQlz1HVPTUEr5pGubUYwRPHYnCvtj5Vk4V1mzyGjKJ/UevmDvc5/C6wjEN11WaKr
	 5ywxLKRW2AkCTcH4VoPan5QcwkhLNri/VwV+qneig3BvNPLjGhZ8rAtsfTDOkxSRwfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340592;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=/WXnfO1pguHO5Uh5/HzEIL5sCV/yT5Wbg4U4qsYfw8E=;
	b=frzDfeRkUGp4IXsAQSz2wNmHWV9YT6Rge9f8UdCpmYgRlo9xqHnSw0T9f3qR2PLumzmp
	 n9RuL7R6sfmwityD158GeT7IsvWralXkQ98VFdGqRbcAsTeD32FEr/NF5XekFsAkfKj/y
	 +e2CnILkXImenDpiUYFXauzXyAZdrTHhgCWRKNyR3ft398e3SLf7Jbe2oKOwqVVUQzj5W
	 n2ZlHeRB4CJp1kWztvuQ/SBvyXuscqKmWSBPxuzAMxOweznFT/q3HiZNmDoGatFIiQTw5
	 bxmtZEUcplg+fn7Q6gAnxOE6eysDxpRbpz+tpXV3K4g9djHJxFmum0RTO2ItUvw5pnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=OqX8fuhl;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IJ8zYCo7;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CB2606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CB2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=OqX8fuhl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IJ8zYCo7
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 972677A026C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:56:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 10 Nov 2026 14:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1794340590; x=
	1794426990; bh=/WXnfO1pguHO5Uh5/HzEIL5sCV/yT5Wbg4U4qsYfw8E=; b=O
	qX8fuhlfxrJcJj/mxoG8xkMB3mRHj6trNGTNYOT3QMmW3BYmtOV4tg+AY2rXZRBG
	3Mfsq2TKnonwY2MK+t/aRddyLAfz/g99/YlqPoYzLD6P++whB7Tkx+wuWy/N+EB5
	42eQPNMHsm6HAhDD1SmP9J+HPZ765XONH6eE3ttlMzuwBMm1Z25O/aZJFAwvgI1l
	fmrcpG0nqXXQbtgCDmvaGTT9SZ25JEMW1R048YfGocxcxGjN3bPJA8gcYLqBqNSo
	tGEArOlyZ9gL0rsiRnrq5n6E/6OyWuqzYh5M85JPc7kYB0QAvpH4Z7KhLetEYZrb
	ZR54xGGfz1ASNKs4l46Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794340590; x=1794426990; bh=/
	WXnfO1pguHO5Uh5/HzEIL5sCV/yT5Wbg4U4qsYfw8E=; b=IJ8zYCo733yjnnVw4
	OMxLfkWi1ucrqKYQ595LM6iYl6sFO8zc+GrBLYmxXsf9Gc62oA4tKjJ7QeBJrTLF
	Cm6US42trBh0tycS2GNxJcTDNLGCfYTEuQc/UiXNunGzI6e+vthL7mwnu5GWLNwh
	/lEOING50/+7FRb7pdHePlKoNZ2FBJnZpylx5E10g2e1vBfCwPjsJ0FYJRg7Kien
	/h3f/fwoQu2z7qtTnPbZ3BPFZCxaw8+HpdJ9A8KfsX4OBYVujz86/yImxcZ0nhr+
	BjIBgcXbu0CPtxX2oqk5VGBoYVk1uWzEzR+NLGbP0C9c6f8IHxT1mR0cgcRk725y
	J6tnA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794340590; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:skcZCtRrHcWyfrGdDhTRk5TO32JlGPtWbi8WgGFbnQkaby5
	LUz/vXl+DeZd9r5vMttyQ4JdeiYAQS8+8n5LzCzu/rcZxNNIrHK2dz7AQ7hQWS+V
	2hcxOf7Tawxw4HknLLUaQfXhctqELF06exVRT4osDNEINCoSIQX8qqI68zCIWOq9
	pOrrO3296NCEDh0j/y/cbAu9nnN3qk2pHwSi7WUDxrphHP9PhVVEzFdsbgWSwmbf
	tcrlglhhqTccjO8E1XY9apPfQYcy8BUOyccHRBae4IxHfOxtSGxAOoISWm1q0TKf
	3FWHJ4mkvC2vm/UiMODT/Lu+WneWVNhlEig4Uig==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:3mJlawYgtIESowWFbXWw49mEgN/OyySXD9UQ+0QQ77U=:/WXnfO1pguHO5Uh5/HzEIL5sCV/yT5Wbg4U4qsYfw8E=;
X-ME-Sender: <xms:7XbzaoJ7Qex_Dqwc53EVljjGHBy8o2d7LUXxHUhe2z6cyzcPwiehaw>
    <xme:7XbzaiySMIbxm4qFP9FwfIFM_tAJZAuwZ9wDwOFwJpNIKGBlqo1AYZmH5FNHjIWea
    lnVs3k5Qx43ASxoQWLhNQ6SJI0rW3K5HzBYpMz3q5YjII73GP9lbeKD>
X-ME-Received: <xmr:7Xbzaut6M8ANgc_plyTEFk4GkKGYxlFKaZ2EV4IjWCS4FCXxqFjkzMTB_Yslkfqy>
X-ME-Proxy-Cause: dmFkZTGG8uV2SYVEMc1ZbCZHj9D26sfpiWG3Wl6apS7UurKAUsTHjS2YUGO+lnEIA8JdFH
    UN/9kUPmq9I/XVRHWxOysla8Y2V6ydnhLX3VHjN4SGRgghXSI3fwc5vkhNOXrXTClOp1xX
    2wT7XUovMsdtI5V+T3O/Fwr3x52Edt7n7V12L4koDNzkM1qtYkOvaku2AlM2omQaycwZcY
    GEGZ1Frtx2Fa9WiaUfIhuU2uNOOPIJIQS/SXOWSWJmspQeFeFvBp8zsioaWhurhsly9jv1
    D663yu29rv9f0ldoVmrpnz2Fb1uguRjOLypmUwH3drIyGjgU8vU6kCU/TMruDFGMgtwftB
    jtudH+jxAUurUiOTlKze46XMtyjK8M2sCUZ/B2i0ckmhPG2w6h+qiXcMDIXNYAgv16U/b4
    Q7SqArSRvJCwJMtoIEIi3afULxaJFaMOnE2byoSZpGvL4nkV77tBCmzBDBjGZyj7N3XAAN
    ZoLUr0Vgqo4AhZU/1XGz2xvBgHpnP56tZ4Riw7Vh7GDMns3AREE4Ln9sB8c7CGJEzSLJBW
    estotEXZOLZbBbHXCC+qEORYf8jEUvNsoHqMXZmR1kiWDfpttQ56a9ByWu2gAYKvcs+5gg
    g7yoVgUcBOUC5T70k0NDvd6U2VIzvtf9QG2Tl5B/Jz4B9Nt6CxI4f9J0JUsQ
X-ME-Proxy: <xmx:7XbzalB0BfrvjR_MZBx6Y0_T3adsaAkup0m2ADn99FGN9K9cei_YjQ>
    <xmx:7XbzagFNXmzSevAhqSKB-JkYz9deC7VaEuicclt1zLypwsbKb6hGgA>
    <xmx:7XbzalDo5ytD6tOj21mjrKpFI0VU_4uynGwrBbcp_QaKVIBSgI_0PA>
    <xmx:7XbzamnLqsZ5XuvPCVVNJiIT31hd_usck_pXYhSPDn4VI1bYGVXoyw>
    <xmx:7nbzatJOLgHlk5ds-KHdO_A6ned5PtGMJU3vj_SKQTS71Q6QTz90gHSb>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 14:56:28 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: koray.fra@gmail.com
Cc: linkinjeon@kernel.org,
	senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	mmakassikis@freebox.fr,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: Re: [PATCH] ksmbd: set create_time to btime in ksmbd_vfs_fill_dentry_attrs()
Date: Tue, 10 Nov 2026 13:56:25 -0600
Message-ID: <20261110195625.3211657-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110161659.481208-1-koray.fra@gmail.com>
References: <20261110161659.481208-1-koray.fra@gmail.com>
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

Hi,

On Tue, Nov 10, 2026 at 05:16:59PM +0100, koraynilay wrote:
> ksmbd_vfs_fill_dentry_attrs() queries vfs_getattr() with STATX_BTIME,
> but discards ksmbd_kstat->kstat->btime and unconditionally initializes
> ksmbd_kstat->create_time to ksmbd_kstat->kstat->ctime.

I tested this on a kernel whose fs/smb/server matches ksmbd-for-next,
with files and a directory created on the server, so without the DOS
attribute xattr. Before the patch, a directory listing reported their
ctime as the creation time, while a query on the open file reported
the btime. With the patch, both report the btime. A file created over
SMB keeps its stored creation time in both. smbtorture gives the same
results as without the patch, and KASAN reports nothing.

Reviewed-by: Ian Bridges <icb@fastmail.org>
Tested-by: Ian Bridges <icb@fastmail.org>
