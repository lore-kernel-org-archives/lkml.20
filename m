Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672228;
	b=Z+mYV6CcBfCrd5JDrDQ+VJKP9s6fQ4++YquERsOh+RLyMjNF0XBxIDUYe0zmPVTGJTud
	 GufRbhCeL7mPO44AOEKBfkivm6wgYKn5tL3rDxaq99A4iEUjh1kCeRgb4hjX3ql7r/r+h
	 OpElRzdTjCqkHysEovV95gXUkbuqkMsUYaM+PvfxatzqX4XNMZkf+e4Nfe1LAu8k0xnBV
	 y70qgOUhDixWmPuoxPJNTNpEg24cJrWkR+kDaKyc/0MsulQR7qalvCZw12CZf2aK6qxBD
	 IGa2GLqzQ5P3B55v8NSIwJklLrUs45X6bizeqniJ7BLiPnDgXz8ctW1JBPFm88BFbLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672228;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=3tpJcsMXc0aeqXRbj+s5vAgoDF+CaAtCa+UvaxeoDr4=;
	b=Jk/VrokAY9jOZcNNvPhdnXQLdETEYioBsv3kzWmb5uWgZlpmeQkjuiSWH9PlZXB2Py4R
	 ZZfRu6F7tQR6v29/ERMCAQmczNSm7NPcF8MuqiuM3Il+s+r8XSzWmR8cptJsF+Z7LigaT
	 sVE+F6Yy635e48jyyAf+Av0PFghwBna+sY3TDrOKe0N4LOU7qysDe2fjrzIB2AdK0KUFt
	 +NyiI0sLu1QavppSrKgICGC3myDU2TFoK1tF9am813YPSOq7DwSswSurb7SZ2TzvN86Hb
	 cnMkL6OGg1dO8ccaxuq0E8t8DEQJ4fs9sPbr8g0cwg9UrY7QhgIRGA9GH3bopthKngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=JAoWUZs+;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vzE15vAo;
	arc=none smtp.remote-ip=103.168.172.139
Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B7606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436B7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=JAoWUZs+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vzE15vAo
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 5C3491381C58
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:03:42 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 14 Nov 2026 11:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1794672222; x=
	1794679422; bh=3tpJcsMXc0aeqXRbj+s5vAgoDF+CaAtCa+UvaxeoDr4=; b=J
	AoWUZs+EtMCpd9pU2f+8hv2G7TF5z04QTgCCqWYXZrXeY36rZltQB/97T7EkW4P2
	szHdjmWTfqJtqoIw3ZiCuZsaAnBUsafkKcjROUTwmu+PUGfzRN46yRE7AeUPwl+o
	bMWFpuDI0TSwJvUFaAAhCtiO89CbocYnWgvjzlCEBtetCTTQkZUflukuYk2UnNEd
	t+RjmObEK+gLoNNeTE40p8wso9fcQpOdN2wbJsfq0iDPdzGtgFwyVzjYDGe+75AM
	b4VFxa6THY3JIBVtwvbd6mDGi65E9xHmRD7ut2mNvNK7bsqVw+0uqZx5uzT5szgl
	ncthACyjR2poV1qSTtDdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794672222; x=1794679422; bh=3
	tpJcsMXc0aeqXRbj+s5vAgoDF+CaAtCa+UvaxeoDr4=; b=vzE15vAodfT7OSCPQ
	y/Wj6YrrR2it8mqZQZ0jCTycbIAfx77U3krQG6N8GYeYwWL1lDEFiAn2yFO6Nkch
	UVXtPiwLvxxVmbSGKRgUPTo3KXZHjkBlQPhm9t51Xic1fK65LzhxuAJX3e3isKCq
	jYoKQQjTutoXCx6KW0bnmFtzUEQZgqXrBTvM6Em5YSXD53ug2IIqC0QhSFhn6525
	7hHidbtMG8auCIyPNGM0JqvJ5QeJFGcWLbdQ93Us3mNlF05176YVBqpLPZKO98uz
	vKcE/bLtbg/OHUH8sGWsg3IJf+SCithPP17mpFv7kFR5BsfoRP7RbKp/E6tBR8ok
	ELlIw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794672222; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:Mdil7eLEgfXpZXIJwtURpX82pRnv0oR/VtvOjPekIeSlNKl
	FW0zfod1BAyAywEeCzeN0fBk4AXajU04Y9ZF4GptudBSzuv4B0NXFgnMiEmL21yZ
	JUH9xj3ewKf/zY1hikt8dn+pbOyH+XRvDdd1zpNWxhhXGcFUEi65G2mGu42O6Glv
	sGIB6h9Acsd7OYtC7DgJWpqioWj9YkcXzXU9Ijt2XYT9INmVDN9bnkB1anDH0o3X
	y9kWuGU+x+3S95iYObTiZ2ya+SpvBsIrbz033bDzftTxgGs7X6Xfo2GgiLcWMED7
	ljUEtf3it/UAAaqTdB79a68Bb7wGz7nUETAoO+Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:G/p1ROslvOk1G9DKe1Y3rHUjedf/qSDUI+C1Sq7G1lo=:vi2diju4+RETOfW0Qo7eWLD38/CL9z0CN81jxOTskvE=;
X-ME-Sender: <xms:XYb4anIOS0NL6rYeMLuYINpw08xsao_IT9LCSmoCxtxPvJc0lJGN6Q>
    <xme:XYb4alzCh8QwKFTdNoEKTSS1aDn3qxjochIfAzteGhpzW1_JddavVVYurwVA8DKLa
    lAeJbBWMlo6iGjxRKvB49QOtcTJTY_n8qezsLrhcdSdGCea1QJIKEtx>
X-ME-Received: <xmr:XYb4alsf3qzl083ubC2EOBxlk3lkMbziknKxIYadc_kZfIJkUP0rAk4cEfoQ9QXn>
X-ME-Proxy-Cause: dmFkZTFnmOkQdukqetTLW/QnGIvHAj9CfHD6mbbJyREt0FBmSh0C9osZVwR0I5xCLJ/1ck
    fHUQB8vF6yiXmE9fWFkFBqCteutak/p6xTNeZfbB5wf4iOJGxTPsWX1nuxYrbeFHo03utX
    YX1/0WiwUFfw92uWByY2+XEgRpSuaiWectstkdwnpShfS0ckY0uTq/vyKMNtg6+ea6GPQg
    y42BqFa8DzQwRWHQAMSVBmzASdTli+2FyFBSxf0cQgeKGnqjNhnnMU/AnyGanY+jBBaS50
    ux5H/9mrMlShs8az++VTlMk6ekDKhxasS9gF2TAYc8I+NiwgAZl+tU1CpeAY8MuMcCwnbJ
    S/5iA4S5u/8bQ4/kkJlSzKgnur+sFBPo3nxqz2Z1Knxf2bNTOFY4z8WR8yHnoG7XgJVlz6
    PyKsz4jryU/hJ4k4GSmfJjNUt4ydJg1qLSTWBJfU6pv6dv9+VkSFNO/8nalx3+s4jQS7vC
    voXwC0J16YfogS8kSDhOU+pfh+M55Tj0Ata5e97n6asaYS+iwnsxpVxylYqhZRKvPMpSmX
    GOYHGCzZeQ1AMFdbIWljxO1AmaJdUnkB0Fd19e2Dn1lufnH6fbr3O9sgYYepscS+/R7uLA
    RwouDlhqn0GxeFz6ibKFI/ETWCHeznK+7cN3RCqmguOb8gV8aPtsQq0lNRIw
X-ME-Proxy: <xmx:XYb4agAYqsVqyfyJbXBcCq1FK1avMVeXkNu-mxhWrR1ZYFQEsWlZVA>
    <xmx:XYb4avEeyJLGMvmsGX_W-cmW-KfL_jr1mymd-bMTJjmKz12MVKA56g>
    <xmx:XYb4aoDr00JenlqvukKbUy4SRpJJzXnlP4jkqQ65JgHFwU1cAMeZEg>
    <xmx:XYb4atlGRSR1etsnAz7wiXL3-4j8oJTysUtXcDAUknXeEte-1IC_uw>
    <xmx:Xob4anuPFvjx_AwEWDgbi-lTOdFzrpzuZj_8V6augtKG7ZBWBjt8FIv6>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 11:03:40 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: koray.fra@gmail.com
Cc: linkinjeon@kernel.org,
	senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	hyc.lee@gmail.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: Re: [PATCH v2] ksmbd: decode and honor DOS attribute validity flags
Date: Sat, 14 Nov 2026 10:03:32 -0600
Message-ID: <20261114160332.2228435-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114012736.639171-1-koray.fra@gmail.com>
References: <20261114012736.639171-1-koray.fra@gmail.com>
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

There is an existing bug that matters when enabling these checks.

ksmbd stores DOS attributes and the client's creation time in
user.DOSATTRIB. The xattr also contains flags saying which fields
are valid. Currently, ndr_decode_dos_attr() reads the values but
discards those flags.

When the sparse or compression code updates an existing xattr,
it writes the creation time back but sets only
XATTR_DOSINFO_ATTRIB. The time is still on disk, but its validity
flag is missing. This has not affected the reported creation time
because ksmbd currently reads it without checking the flag.

Your patch preserves the flags on future updates. However, the new
read-side checks also apply to xattrs that ksmbd has already written.
Those files will stop reporting their stored creation time.

For example, with DOS attribute storage enabled:

1. On the unpatched server, create a file over SMB and set its
   creation time to a date different from its filesystem birth time.
2. Make the file sparse. Its xattr retains the requested time, but
   now has only XATTR_DOSINFO_ATTRIB set.
3. Upgrade to the patched server and reopen the file.

The server now reports the filesystem birth time instead of the
client's time. Directory listings change too. On a filesystem without
birth time support, the fallback is ctime.

The affected writers are fsctl_set_sparse() and
__ksmbd_vfs_set_compression(). Their existing-xattr path differs from
the no-xattr case in the commit message: it writes flags 0x01, not
0x51.

I am not sure whether handling these old xattrs belongs in this patch
or in a separate one. Namjae, what do you think?

Thanks,
Ian
