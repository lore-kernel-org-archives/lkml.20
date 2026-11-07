Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032568;
	b=ArtOYOKU18mEK5MSrY8d/osNnGVunrHkuk65RoK7RwCFPUKTDzkSTVXxEdeyvEE9ZHWn
	 ppWN+ijVBHC40vsLmpPXm1hx7ysHtfWxR89imsBWldMhtIw4fCMjytcxA6KZgl3InG/fU
	 w5jbe9BDOylQQkMK5SN80h4NKSA+Tju/Xt/RoUDLgtkITyG/zWpPA79MDyXIbmgKo7c7A
	 t2p3qUrWcli0kelD18IUAw7N7Q/1ZcEIioKLFmrtMVu8LxUKyPBIUuM6YHfU2d5Xw9xcw
	 MbhDcie9QqizDFgCbZBBJShUEh+b3y3Gg6EP79hicBd4wxR++zzHaihCCPWPaaQjPow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032568;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ofi57RQ1bcoqkW3j0CJqcpQE0GPYKEa3ABhrxyUCcKE=;
	b=mXEwcaxLw/benOzh+Ix8W9qtM4daMvOAMUaF3eETvNPZiCMe3tzDZn4f4eY8kEzx/Gq+
	 hdaWT4ifFcQ3pcqu6EgtWkMn0HRYQq9J/wwMGehivh6crCO5pYNNPjvPuieBEo1jYtE/b
	 2SpFAEjs4FyWsOx4p6ojSAkUzm+KyXyPi3dywQ0WAL4ek16gx/+XQSj9js93hwJvHA8IG
	 IWCLPqtus3K5ZqXotD8Ybgs4wwTRuC0inymPhmiCN8yIJp62hcYJAFybw7W/2yAdsLTWR
	 uCl3HtOKmHrTJNzdmC61dGlTuOGXxEhYq/NNDmKs5UFjBPBSvpaWfvW+wspHMvj7dEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=uy78BlR2;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="SQbhd/k7";
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338F606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B338F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=uy78BlR2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SQbhd/k7
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1E0D87A0181
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:22:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 07 Nov 2026 01:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1794032566; x=1794118966; bh=ofi57RQ1bcoqkW3j0CJqc
	pQE0GPYKEa3ABhrxyUCcKE=; b=uy78BlR2NVmre6PrgAEemINDp60ohVRryF042
	ecUHEx22oh2Cve5WpRuZKKAJkzcEfxQCxx3QHLrkLcVCwQaLy7ir2QXSsMW/Bbby
	YU7TyYa604APasK1C7cyrZTadQTnqi0OL/njz8DqWiaO4JdAIW6CTHIZqN7bHesl
	uwvAvXJRDPVXGVaIhAHSYLsKglKlmEdRfktRIg51AW4TdkpsTSiPAdlPCo0Ox60r
	dBkZb3b5mrjld/KNVBGmcOutnSn9jQR5UXDYR4AxKuTtIyI5G//NDxLkN4UQjiv7
	uK52sEGpbmDjktqPMiNxne8bYj/7WMjJMOen3w0tn0bO5q4qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794032566; x=1794118966; bh=ofi57RQ1bcoqkW3j0CJqcpQE0GPYKEa3ABh
	rxyUCcKE=; b=SQbhd/k7olaTgSiAtS0Q9yPOC48OMa/OZYMkosc57zojhTvpQ83
	HRf9hk/lDQ7oUNfPEmzk4pghDn3bnx5WC64dSgoLvyskD1YfLVq5QkR/orxILZfp
	ZG2xJ+kEwpRondh4JOdLuASPFABM3mp2ClBitdm+BHHim+gm3+HXJGzHrOnTEnqk
	mccTK0h/zULvOhFepNSCm9moAN6aPGpnO5EAKtCezj7j62JQqO4rKoJM1rvIq9BM
	fFxpkcG6gYPB6o/IyQ0Aq+K5DZWi1xCYjxMwCpGcIDoBUUhrHthbgFOuZ+hdbh9L
	i32LUB1/oySD+eX4AMwcsKcSR5cHB1AXasw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794032566; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:u3uWc6BH/y5OlDgnb3cajOnZ6lPBVx/YhC6Z5M9HAJIegso
	SW9er08yzCF1da1+OKMMxrYUsASbXxSw9VmUPsH5D/xw5NB0tFbzMvQhFGEBDC5u
	s2xMbBlO3IttRYammsMnzhzMEoMYZfjzQKFKyhr7u5cyCG/+GORLk+fd/MIoWEvY
	oP5PMBbidWGEX9hBWoCF2nO1mE2a98apnzhYv7GDYNSvNyS7sNav+9D4zyxWhYyu
	eoqFEjy5Tn7p6sHEpqMXNw5x0dYuMgmeB7lcNW30HM2aJzH9nryd2x6dR8aqM+Zz
	Zg+6NhntRj8tpXysbUkTyAc2nK8FCQmM6ap/AFg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:nuBleRLyt1td38AEP+mwnr4LhuH7+yBHIRlG/Y83zIo=:vCPpQaamTZU2QJPtnBPe5w8VyutgOgFHNVs/RDa1oUo=;
X-ME-Sender: <xms:tcPuahhGP_F1F7IrgM5fh5X7D_7DCLVpWrh-d6-nt7Dydi8xjUBtBQ>
    <xme:tcPuamvWuY3LVutnAV3Cd0poHiKeW4XHMTZ-L24DY7BILkymdvFbb1Ulinj1AeZzp
    OFqwtLrN46SVDz4Z4M2xNsBGzYSCFQXmQaEtxVKjBAcn8QpFtc42pOa>
X-ME-Received: <xmr:tcPuavRBHQv9JVmb4CRtmnkVa9YZIOyOTGuezhKiJGxWBmg5diY1P2L0WCpYSKgM>
X-ME-Proxy-Cause: dmFkZTE8xpIF/IdhGX8J2NcPaLbficpfA2j9chFtpxRQzPkFQ8FRP/Xg3r3cSnFLPsRTv7
    rbzRnaGKBybnfA87/l+Vc6ySXIANkNszzdIpm6DM1Pm7P886jAEdFX6MxopDgzuh/5Bxam
    Pm0Nje1FJ2NN4TVVFD4PXh1znH8kcsskLVvmcYMGf96C9clhYI5bgCjYF0dNZbt/emG0Ys
    eWIl0O5sNMDniWN99d9nhhpX559zx7o7pijqsZBWBLlnh8+Vkjwk0x7FvoiGhaU3d02PWY
    yTlv7RCmbUNyrtzQzFhjYQtlWVOnxNCm13jisrR5vuUUA/hiVRNQ2eCWq5iDtkTFXz4rSf
    BA10VYSXs5Zj8lMRXX7nJX1rrUByoOUsS06ynkuaiDfak232lbNGJtVv+TW0ik6r914HBP
    pYS+ieUaxlw9dI+iUNMN72ZiQeC2H0mK9dy51Dj2g7Knu5GwC8nSP0kE4/RsLVnle5wBx+
    mNwAGaxkQnvYwFQWRYdEG0hXDejPu9unOo14s+OeQigLaXfdZRZd3EEh3Vc7ZnX5WC3EuM
    n7FxShv3HJ5YdFIfe+EUqKl+P71NJgCx+sOXHO3gnPjPxTSxa3+Wk6QPccm6++qIJezNnw
    5GC2Uhe1GXS43/W1fJqqkCYwf8LKXrdYYnj5r1/NZCXv7vFbhyTfdgZ9dlxQ
X-ME-Proxy: <xmx:tcPuaq2s87u1620waQuTdw_EysaOWZzsEs-xtDANlzz2PLAejVQgHQ>
    <xmx:tcPuaktPOp1XioDApHYfFoponmaj2a9c0vsotLclORC0XtO5qb8zrQ>
    <xmx:tcPuagggngboZPAKuPRa7dMT01MzJ3_NbKFlV9zlkVB7iEkxUEpWnw>
    <xmx:tcPual-RB-3Jkb3_sisZmoyiww7SrGZNX7B7gG8NeQNPLkQ7rhcPjg>
    <xmx:tsPuat8JXYDQZYy-vP_0BSENIfTnw2skMkbjBnj-A5got4a1lKRU6-4e>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Nov 2026 01:22:45 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: linkinjeon@kernel.org
Cc: senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: [PATCH 0/2] ksmbd: fix explicit DACL checks and parent-derived rights
Date: Sat,  7 Nov 2026 00:22:31 -0600
Message-ID: <20261107062233.1579198-1-icb@fastmail.org>
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

For explicit access requests, smb_check_perm_dacl() uses one ACE: the
first for the caller or the last Everyone or Authenticated Users ACE.
When that ACE is a deny ACE, the function allows the complement of the
ACE's mask, so the deny grants every right it does not name. Deny ACEs
before that ACE are ignored. Guest and anonymous sessions also match
Authenticated Users. On acl_xattr shares, callers can therefore read
or write files that the DACL denies, and guest and anonymous sessions
can read files granted only to Authenticated Users.

The function also never checks the parent directory, whose
FILE_DELETE_CHILD grants DELETE on a file in it and whose
FILE_LIST_DIRECTORY grants FILE_READ_ATTRIBUTES. ksmbd can therefore
refuse the opens a caller needs to rename a file, set its delete
disposition or read its attributes, even when the parent grants those
rights.

- Patch 1 evaluates explicit requests in DACL order and fixes the
  Authenticated Users match.
- Patch 2 lets the parent's DACL grant DELETE and
  FILE_READ_ATTRIBUTES.

Patch 2 passes the authenticated argument that patch 1 adds to
smb_check_perm_dacl() on to the parent check. It also restores
parent-derived rights that patch 1 can remove from guests. Backport
both patches in order.

Older stable trees first need commit cc2f133e80eb ("ksmbd: fix maximum
allowed access checks") and the earlier DACL fixes through "ksmbd:
grant a caller what its groups and OWNER RIGHTS ACEs allow".

Each patch was tested with KASAN on ksmbd-for-next 6f42553e493d.
smbtorture gives the same results as on the base.

This series was developed with LLM assistance.

Ian Bridges (2):
  ksmbd: evaluate the DACL in order for explicit access requests
  ksmbd: let the parent's DACL grant DELETE and FILE_READ_ATTRIBUTES

 fs/smb/server/mgmt/user_config.h   |   5 ++
 fs/smb/server/smb2pdu.c            |  11 ++-
 fs/smb/server/smbacl.c             | 115 +++++++++++++++++++++++++----
 fs/smb/server/smbacl.h             |   2 +-
 fs/smb/server/tests/smbacl_kunit.c |   4 +-
 5 files changed, 115 insertions(+), 22 deletions(-)


base-commit: 6f42553e493d3f25059a215748ae241e525c865f
-- 
2.47.3

