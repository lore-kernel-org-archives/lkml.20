Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649374;
	b=K9ampdKidsxkEGrmb1Ms4VQMZXJiyXuMri5Pj8fO1Te+jEk0eo6nOczZJSt9d3UExvYO
	 XoJV3D2mYK63MMOXP84tvbFeqgB0XatCccMoUpMWVNAuZ/N+9ovGN2L0nqicyogJCyWFJ
	 ZZnlKIIXFlJPFwALFyemy6nZC+JNFRX3O4a461YAx6z4TfuX0RFqEZxAzIp14LE4LzUUJ
	 JcMTkYZF1r6TIIiGVCuJOp1Th/uvwamGNslsHln5hg3FDDa6aSqTYUTRRaAevbqBz5V4m
	 NpZjvZ5sjmwIaXZ2sJheHFAfQghwjR2YG2yt8IK8Ty9UKR5W2kgOUpqaLSge4AN9BLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649374;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=nt1uEavnKw9psabByYlGe9e6SCHLvz+7OsAHfwrAJJ4=;
	b=KZIy3hpbiW1nGF3Vmmby+usFargMcVB97KvqTatHnaPMtwZVjkU62R3hht93IFtfZDwt
	 q1w3t+/vUTZM4AvINV2lH48HP+mZbdT/AnVO5AcvrrDLy1NYf2KeKvUTKKqg0u8ewtO0t
	 Ie+vWRWZ75/OS3B0j0+3YxEmEUYwz+ag8Co5v70bk2K4eVqErUIL0BeHGnPM57sYnXJ33
	 NSH64knfwFo71N+wqI/K6ad3xO0EsOpoZUCtI9uJPFTVywp8rIvcRNYOIpugs2sBsDqHc
	 e6aZnGsPgah1a23MPFtnRFiiAE1T8YrEaOwHPS3SQdW3xnk7FQkZYc4a8VdAk7HiCBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm2 header.b=BWyPOxVo;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AEJZCVGI;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857F7606D825
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857F7606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm2 header.b=BWyPOxVo;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AEJZCVGI
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id C016BEC0589
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:56:12 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 02 Nov 2026 14:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793649372; x=
	1793735772; bh=nt1uEavnKw9psabByYlGe9e6SCHLvz+7OsAHfwrAJJ4=; b=B
	WyPOxVoB73oWl2NCWl/NVaUIsHrDg/9RexCuc0rkJmhto36Ovm/4kB1y209R2d0P
	S3gMrq3XFvCLY29gqZyXaOLBopBDuT5L83gEdMe0SoCpdFBhvtq0z+7zmIoV+FSp
	GRyoxjXc21xOiIg91kxL75x3ANt4iCuE3qsCsuE/sB9TlC6rneGdGKBnTo6m4zsa
	JBtdR9yGkj9unfroRtUJKfgec7/bbMlBPWjCtG7Fr74tut71mEAZt6/sLgNs2lNe
	M54jw2QTJJYiWYLlH4OGKALUcqAVAZUSSkx1EtgJrEDwD0IuC1GOT+HCxjamAdJs
	hkxh0PT0cnJolohhQ5q5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793649372; x=1793735772; bh=n
	t1uEavnKw9psabByYlGe9e6SCHLvz+7OsAHfwrAJJ4=; b=AEJZCVGIvcn0F0Xiy
	CzIU1SRqBNgwZcf63P6BzZerP3G5PB5cBX3kHGetYDEsPTwZog96e91HskoQIx3G
	JDZs2c3yPD81dVeJmnmubPXvZ4YW1KMS0zDuKER2LuKFuiX5IxZuKpMV6qNiZWt/
	snDNbm/cHT2utq59kEi4NNVoo+J8LjzN64Pbd88HzFSixmU9+hW6MTb3rH6RyvFU
	APG/MPx0a8PzqPZv5cdITYe2OO4/QLLSKZOAhY5zjxEMorR3na7cmYra+0zNh2R9
	mK4O7ZqnQNNs8gUgAdq/2rvcIuVwj/2lMzSIO5M423QWgojlVAELzTWjstLdoy14
	PXJ6w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793649372; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:E+tILiKu4hsYmHxp6F5YsML20gh8aGwSomDrZ2K3gZdQhhb
	jXbqC8MqeXqouly3UIAg5Gha4v9RR7NOOhR9N7GipEXfC24/z0GxQC2yBPQ6mzna
	dcTNVlb3kXovzMHmo2W3FERT1y7o4QK3qfohmTnhYS5WYOC3A+AootA/zKgx5PLs
	E+KcDd1vWopq2XoHWw15krq2Fax4yorettfRSfryZHxEXQWbomHxZr5zxwvb4G1M
	veQds9VWRJqoPCFSzogk1wx7CILrzVHwzYoSfx8lpHmeE3MOmDR415QCe+YWxlWf
	z4uheuXdnkaplap3GX4aEMhVAS0J1xYzKWAMZfA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:2Pqmkq2K1v7kdosw75qP3PSBnmpsC39owV29NkVo6AE=:nt1uEavnKw9psabByYlGe9e6SCHLvz+7OsAHfwrAJJ4=;
X-ME-Sender: <xms:3Oroag-_VYo9sOM2u_O0282VXoqNEU8GbRwIl_Skr7kPrNECXK2xQw>
    <xme:3OroalS6yYuKJuNZrU9WpRLKDxtnmC7ul2QsZLsPomHRAunrwtY2uub-s56c9_Nbt
    YEwmOR4vDAnZsNuZXNApM5yLDVh4Vryvr1X6COSMPsHuKCYUnICUXlU>
X-ME-Received: <xmr:3OroaqcGYtOsKge_VzWFa_3r0-VhGelu5BUBbQcVhIYzsPuPxMIrzYewncEnjIkl>
X-ME-Proxy-Cause: dmFkZTEl3OoJhsvttp1+3wDYnSBd+qeVWAsTNohixiFMXts+2OjJZZIbfvvRn+KaVHClwT
    TXn0DdYTVyMOY7hhqyrLIjTjKbyEF08BGwyYtuhc0Fm5YfvT0F5BKEye6XP4zkZ5zp+XIn
    fV7STQhBAMj9PR4oP9E0Ol7NIcKiDt6kLaWy6794CQwiX+XDSKroG4LaQaWnO7VTI/1kjK
    GKgCSiJQW15ybeIlbPFOnRaRRDLDXGodcWURbD0XjN7q6tHxQa1U9YePhGk9nIL7TwjnRR
    AmoWGEi80h0r48sHoPOWybmdc/OgfkAzdjvU1DtT1V7dZV1lrIEWzlze7dyEi7IPp9SXnE
    s7RknX0DJySgtaWKnWUlipCeyLVkAEBNb/dahv0DP+noeO/Wm8JhXn44iQi/CK6z/zUw+G
    c4keopWqF3uE+l6Cl0MmSAi98kbVpjLjCcng6TUk2+UUpVGNh2PJDrPP0ScrPMWRFJ2Qee
    4XrU5l+0TE66CP6BV11R5GrYfIrJ6/a4ET5znG35KJW9q26JpTqCEdPus1IGCsYeb87WrE
    hX9fgwkl8f0x2fejnPjTx5NUqeL2gSlJgs/IlnQaTQgJJMZOiWzR8gzy1n882p6HXjDHQM
    eee0f9HXzbZ/lm0lQAPooUvhBIqx6YZV7IeL9Jk2qB7skdZdnTJ2DuebMUXg
X-ME-Proxy: <xmx:3OroanTgHzde6jIbxoInEfygFeqMA5oTL0Ymb2pxCkbobN0gPjPJ2w>
    <xmx:3OroamKhSPt9z5BpMP3TJcFnxR5GUA7BcyPss0RKdEpRyBzHUh2RjQ>
    <xmx:3OroakI6RdqWvbgM06I21q8MnBdwL6ZxHoKDDYu07sxVedcHNGynag>
    <xmx:3OroahiDaaaQT-mtmX1FzmmX4Qb5KGfsxiyC8aPLJpQhA0O4WY-IIw>
    <xmx:3Oroak96_bIntyBjVydZclNPd9J5POPLSW6nVLtMVbkt06jRcmIxX8gx>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 14:56:11 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aamir Ahmed <elb12345@hotmail.co.uk>,
	stable@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: Re: [PATCH 2/2] ksmbd: grant a caller what its groups and OWNER RIGHTS ACEs allow
Date: Mon,  2 Nov 2026 13:55:59 -0600
Message-ID: <20261102195559.883967-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAKYAXd9Om3RcrgxAKbQZGT2Lxs7XSktm2bhLTUEJB96Oc0-iZg@mail.gmail.com>
References: <20261102061537.830714-1-icb@fastmail.org> <20261102061537.830714-3-icb@fastmail.org> <CAKYAXd9Om3RcrgxAKbQZGT2Lxs7XSktm2bhLTUEJB96Oc0-iZg@mail.gmail.com>
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

Hi Namjae,

Sashiko is right about access_bits. In v1, an explicit request could
gain rights from the ordered walk when the selected ACE had a type
the lookup does not handle. I've prepared v2, which clears access_bits
after that walk for explicit requests.

The other three findings describe limitations that also exist before
this patch.

For FILE_EXECUTE, the reported OWNER RIGHTS ACE grants generic read
without execute. MAXIMUM_ALLOWED|GENERIC_EXECUTE is refused before
and after the patch. The execute adjustment is not included in the
new OWNER RIGHTS-only path. A probe confirms this.

For Everyone and Authenticated Users, the existing lookup still lets
one of those ACEs decide the explicit request when no ACE names the
caller's own SID. Group and OWNER RIGHTS ACEs are ignored in that
case. This patch changes only requests that the lookup and POSIX ACL
fallback would otherwise refuse.

For the maximal access context, a non-owner relying solely on group
grants still fails the MAXIMUM_ALLOWED check. An explicit open can
therefore succeed without MxAc and fail with it. The probe confirms
this, and the v2 message now documents it. Counting groups in
MAXIMUM_ALLOWED also needs changes in smb2_open().

Thanks,
Ian
