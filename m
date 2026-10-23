Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792720378;
	b=u7sWJhxO3VGh4sE8tfFjBYpdZ54JBE7LydDKWEOoHqu772T84qpj+h6wwdOb70xoLuBu
	 dWGgezCL+B5K9l4CCs9w29QUTfRvW7DJcqBHH3wrWZpbGAFSm8Res1AzBq+qEgeM36O5c
	 O6VSafACJRTqYIK+MUlK3T9DHjDLifYhI24dY/UK1IZaIjyc/Dw6mtUrcToTupZ5d0LQz
	 WWVYWh24mK+fWZ/PCWAjmd1w+eXHuNfRYMIrtbIhoxEANvjpujTsMD+zoco2ElYa5IKAx
	 3e5f9CUjrUyAIYn6+b/8jgf8IvnTZpNuIEeruztRRInr1nlc7U0+rqSsw5qwoSxvL5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720378;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:Reply-To:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cD6ambGXB73ssJDqyApt39o6A0cgIPa1xebyQdqUuRM=;
	b=rLcYT+PrYIycbqcUSmq58eZWFG2DdeFAEpBPqIwLwsa9YlbfcfgUPHfy0pIyntt8Njsz
	 UwDJeDKJnbvQEskjcXOKX4U3F1c6Vsc+MvdeeFDKYDxO2EDZclanccCNGTmkvb/TKReKo
	 CKyTl9hAXnclTuQLdCLnl2MN8tAqJ0YRQblSUlFkZ/Y6N/wd1/hVf0CEA3dRVoL4Lvkae
	 YsHtQu8uIDfZJdY8mWHHcAOOALG6+icmPHAVIeEKqsqEzmqLKLlv34ee87tK4gBP/nljU
	 95wHSr1xbiVNFgaf/3Jg7ieFzMtGoVnTfUxUAEyOmGY2nWokYIMVQD8YeHvjMIgLE0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=QpP9QY6M;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="eFjE7Ys/";
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB60606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB60606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=QpP9QY6M;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=eFjE7Ys/
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DA30E7A01DF
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:52:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 22 Oct 2026 21:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:reply-to:subject
	:subject:to:to; s=fm2; t=1792720377; x=1792806777; bh=cD6ambGXB7
	3ssJDqyApt39o6A0cgIPa1xebyQdqUuRM=; b=QpP9QY6MAbuqUjvJ+DIH9BS3/u
	iW14dS+f+LnhSrqZ0oD67fW5hdjoPEcfmO9FLmi/qqs5asSsSqDWvjUCZlWevqa/
	wAEcrRh5eevv5TMJGW3HE1QnO5EAs1Ru/60dxdHQopd+HbQdMsZH1cyV3Hbe4GIg
	LDlKNTDcmIdDqXROjJu2fODCM+vHI4HV52+OmNF+zY9ThAsjbPX4YPdo1QPpc7lI
	qz+LCaI8PuA33J/CPtQ23TT3akQTUroWo83xc97i1tfCHOmxETABtxLGJU3IT3NV
	/i6eE2RxwlQLBZW4kjbj/i4zorDD8ca2WYoE+KgD7Wc7uftjbgEp9fLAAR0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792720377; x=1792806777; bh=cD6ambGXB73ssJDqyApt39o6A0cg
	IPa1xebyQdqUuRM=; b=eFjE7Ys/awcQQ2GanV7ZgDGv1OSyoMkpdosheOsW3pPn
	Fh7BSvWjtFwVdxhG7ThkktCWk90XFeR2kg5RlV3XtN4Iw3bLAK5QhpWNNKMXC5Tm
	yxIDMyNcOpiNSoGZxeeKkEh720q7v/4yTVLazvmG6bXwuv24jf8fTQKjbL6RciVQ
	o7E3n5Wrww8VXDaWMYYabcmyLLF1P62fZKyEgGu/m4HdRL+sFq2IDoglpWbKBfpY
	FHNvDoBI3PN/gzIScGH0OXQfXQAZIh79VTCtJToVsuYH2Zl/7LJhh4RU+fosDA6p
	s29dadf54kIlbzreQD1PGUFTfbojbHzdw4+HpkxJHQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792720377; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:CPwwSrzfaU7aGnrCmODJ/Q9PEe8zQoorbtr+UR+woV0HYG2
	vr4eDIC5wPcxWqCHR5b0XZh4nOlpXXgvxzyRBf2yWgax7chFP5SsEmU7plmb+Uex
	+XF+N37kWTOciOArdiOQb7hAc3H6vhu8FpvKqAqo2DUi0BGWmgX2cQ+7Rur0bGy7
	2ngsXY9Bww0J81IpplXGZ+MJ6F5MptNRKKuyBz8JRxlWMeqnD2+LI9GqX+bZzPNQ
	Aht4HL8RQxwz8AyWGuDoPRekRjtYJYbzmq7XgHunQmNmT1hc9JqD/4RwPFngJmuA
	PUdzKiAqbJSXHC+9eDoXqtZVWxRGRj5Sgq5vBKQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,reply-to,subject,to;
Message-Instance: m=1; h=sha256:4JF+ZIJSDd7a16bsXCTNVhi2lGpaY06Nq339RHB4eWw=:cD6ambGXB73ssJDqyApt39o6A0cgIPa1xebyQdqUuRM=;
X-ME-Sender: <xms:-b3aako_IvVolgK7BOrImE92ONp8rTF8UChink8JxqgFNTOb48_9qw>
    <xme:-b3aattvHtkJwSRSA_tZjkAkDVxEIu06IKVAxf3DRTZv1UcHsO-bov3-A7MJcENzj
    Jmj4DAxtQiu5SE2R7zL0dv97Am98eJdgge-21xwhV7neoSV>
X-ME-Received: <xmr:-b3aaj06di6yjiga3y5hSaCvWMoF7VUgF1ebajmGzx_CmdwwRC0wfJERqj-PQVNg-6Gjh5jlpzcRRm87jFxE9iswshOus7s>
X-ME-Proxy-Cause: dmFkZTERkwtIMOGUZMHMdY1kHqHFpz+WwWYtGMcExDBZbCYs2pEUua7f29LsxCZoqkDSTD
    +/WHgNys0etvqLuX1rIqICejHIe8wtKISjKnDpOKPWqIYxCsE1Rs4ylY4TB3oGDg6uRMjn
    RRoz6QE810emuHDqMQ+daw1Y0EPY+pSTFZ4Yff8B9SHUx8PzjZPrkGWAO7+EMrqIrTEefc
    +LvVZnRNXDwa3M6fndQBYDQg5o9Cm+VCU2BUbxKZ2p8KVygcMh9wyz2MytjXxl9Uf9DNMb
    bDq2L55Xs1KIYaMXH4T/8nRgCKwadPwL+U9v2OqNqlsG+87a59trm+c4CjTQmLC+UIAfSj
    jHTEZjx6UxObjglHaHBnSyP3d/SyEAO3NzIGpc11ct0TF8r9W+N7F/oAdLgT5TaNpIwkHY
    wRmEqf3r74XvLq9yKj4Ncs0y+yZEZGRYNeT4UPULxL6q6mduEnhu5K2veewu1qrI+iPx05
    KAY+/tMT8JFl+lgWx+IIJGBNAvn97Lacvh7IYAFhhXvXccAwc9QwjjE4L7PNTCO4FwBxIr
    axn+0Q4m0ZYI5XMCXbALPo5pR5kBqv0+hnmVZZ+RTFuraIH/C9La5myOc3bhYO+QTkKkTV
    qOaEDVMKNtx5qXTWY0BNXHaZ9C6NjQfyn4WVtpGENVaeL/tI5Rv8jxAP3FBQ
X-ME-Proxy: <xmx:-b3aaoER6G_myrOJoMPPjqIsT-WHWUI6Wx4Zx_K1Y7jVqHybOWIRJg>
    <xmx:-b3aauvCNbq6nzn0CUX_xhFjjrt4pXAJZQslhIsf6HE_MgsnvrxUvA>
    <xmx:-b3aarowGdPVwT0_cQN-nMebut41GL-e20-NE1xFsPVWK-7YX4P6QQ>
    <xmx:-b3aalWdc0QZr8rEaLtXW7HrSkvVctuvZWSfipJGaMrrBUsY00LHNw>
    <xmx:-b3aakjjWEFaFPLo_VVEo-RM8WuE2nKh3k8xDoB5JPfD0ZQP0PjPWMV1>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 21:52:54 -0400 (EDT)
From: NeilBrown <neilb@ownmail.net>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] nfs: prepare for locking changes.
Date: Fri, 23 Oct 2026 12:50:10 +1100
Message-ID: <20261023015239.2163480-1-neilb@ownmail.net>
X-Mailer: git-send-email 2.50.0.107.gf914562f5916.dirty
Reply-To: NeilBrown <neil@brown.name>
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

This v3 adds Anna's Acked-by and fixes three bugs found by Sashiko - all
error-path related.

1/ patch 5 - make sure d_drop() gets called in all error cases
2/ patch 8 - dput() sdentry on all error paths
3/ patch 9 - check error return from d_duplicate() correctly.

Thanks,
NeilBrown


 [PATCH v3 1/9] nfs: fix open-blocking with d_fsdata
 [PATCH v3 2/9] nfs: fix nfs_call_unlink()
 [PATCH v3 3/9] nfs: remove d_drop()/d_alloc_parallel() from
 [PATCH v3 4/9] nfs: use d_splice_alias() in nfs_link()
 [PATCH v3 5/9] nfs: don't d_drop() before d_splice_alias()
 [PATCH v3 6/9] nfs: don't d_drop() before d_splice_alias() in
 [PATCH v3 7/9] nfs: Use d_alloc_trylock() in nfs_prime_dcache()
 [PATCH v3 8/9] nfs: use d_alloc_trylock() in silly-rename
 [PATCH v3 9/9] nfs: use d_duplicate()
