Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685187;
	b=uYmHp+dNzItp+gGmdgBAcfdPvdG0ZkZ3Am1dKx/eQRimkEWidqrzH0xcJTo5mA4UwXzB
	 oJJvcPwPkwf32VxGEQ0s2DYtOYU++luwioL04ou+cyFn+8+dosKEBrOnIcidOgg0XEBfO
	 7728a9kJJNJGE5ym4FObSrHUelN7qazx725qEOLHOg/6YM2Gf5OhqbO7qTCP30tibtaW3
	 EZCc8/DaMtOt8fs7/Kv2DmXAKNN2hMjUzqpLSxAfxkwqiNJrPUhvrclDXBA5cbFuyqj4I
	 mqLW+I0W0NvE7fu7iXhFu+G2SrIbu7JAiF8S/rYvxj6I+dSAYkqx8RmMhi9xu903KAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685187;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QExCyscQiBpYtGq9U5DYyILBNvVQzlq3lEvTCoEEpok=;
	b=Dvnkdyi1kpepFr9QAT7hLyIAYTBiBWrknwk4hrg9gFhtjOqTm6E6aLylnCC6FveL3/2L
	 8Nupku30VnQ+9J2I4EoW41jbWGGLLIk50sEDP92SLHKI0ujR/cXe8NMHeE4bANMe3AueU
	 3BC/vlV069Gs/6dl4DQTR64UBT1QGauIK9854TlVB8FqMWfo8fZI2JQvxsACdyCzuO3Ov
	 ITDpAWN6IAwJIxZIVtSxGLbP2X0IFe1MAEjQ5BuasiabMjIpmqltYIM5Q4JJEldLP88g+
	 ZDhRcpCRHnX4Zlqj/xXTImH81K+jnG4prEM2MFeFT06cLtJzx4AdqYRve6iho+g8/lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tyhicks.com;
	spf=pass smtp.mailfrom=tyhicks.com;
	dkim=pass header.d=tyhicks.com header.i=@tyhicks.com header.a=rsa-sha256 header.s=fm1 header.b=LIpYU3cd;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kr+hexmF;
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C64606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C64606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tyhicks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tyhicks.com header.i=@tyhicks.com header.a=rsa-sha256 header.s=fm1 header.b=LIpYU3cd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=kr+hexmF
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id EB4CBEC0114
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:06:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 22 Oct 2026 12:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tyhicks.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1792685185; x=1792771585; bh=QExCyscQiB
	pYtGq9U5DYyILBNvVQzlq3lEvTCoEEpok=; b=LIpYU3cdYPXrdQP9qOWT6MSrTS
	DBGH9VS6lZ6gwId2PYqnSLL3Sn52dLcqwrj4tU7EYiZW5w5zt5alRgaLBPyeSeld
	n1/o8OA+WrdNONkr7uklcALUoYNGufcw3iFuln3J0R5qflDCl7SP4ypaBqtR5o5k
	jWekeIig3cr2Q9InAyw8bH9QqBlI4Iz/Z0pwqHMAV1y+GOnXXrXVJdJTynGDvH3l
	sDnTvkgvQK2vvcdFDijucGMO1ahz7TWO0Oe+bSg1PW4QQWz9E8kM/ARhRc52jy/Z
	BTLcDOUcgQmgdDnSHZTzoQn0a27sKWyNltOXcwmXXa2h15KLVu8d8iI4030g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792685185; x=1792771585; bh=QExCyscQiBpYtGq9U5DYyILBNvVQzlq3lEv
	TCoEEpok=; b=kr+hexmFCFDuh5wufayRC5G8wCN9lAxGJFQYuRa74kyoa0YyNnq
	ZMILrw413wCZcsFOk4iKEwFJpYFZ9ckzwy7ehiMSlo6r+GjE7VozHxtWdVQiomqA
	yavoBoH0EFpW0cExtWafH491ouMXaAUUDFp6CtPgCH2wj+NdJbM54OOD/Hi4YVwm
	oEjtKPRBPDsYTY629kCT2/rsb1TPUlBc/UYupGpjKqd3Jhkp08B1Nw0Yy9spUn03
	ST8K6SMZVCIDLpmx8io4neqmVqpi31UHqdhusKYDSOu6i8sHZ6Hz8HfJ8eV/jWbT
	aR+MXYL0dV4fv+C00C3bt+G5EJsKnh9neOQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=tyhicks.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792685185; d=tyhicks.com;
	mf=PGNvZGVAdHloaWNrcy5jb20+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:YKI8uD6kYCmJiaH0OqPfH/1nVmzF5VJ69RUvK3FPpdLpHh5
	yVCPmtDH8bWztHUT/5PDsGHHTYFL4MITpDWirs67QzR0Ul05izESxzAmAY9iBg9s
	LrBlCz6nBy1GVGYyAhlsADgjcAxFesYuwYg032G7FBnlGah7CHnaX1WLv1EqXJhd
	fD0vm5XbZQQ5QCuHb6PfWiyEBXz/9ko1eG43ucIBE3bOgTsuR+c8Zy9fKyBNxpE1
	BJlhBe2yf7dB/ZBYX+P7kh/oSJ4Gw6vuxbWr3yN6niD5slhsfTniC5czSUb/m0c3
	We2CeiWlDIEh+2QvFUahM5xBi8TzOPhepG78i9Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tgn4ibvdS0EBVO0lJEKvIjwRQvUDlflCYNC+QTYihpk=:4h/Ps8qAn41v60iM2u0/HN41xSrwZY/BxA2bQXQb9I0=;
X-ME-Sender: <xms:gTTaam3MXosFyuCmqpHrms1NE922UXrQfM0j0Z_CGIeo2aztwYseeA>
    <xme:gTTaakhGGcwLxboCsWdospx_my9fcULecn6Vz_0UiXrRm9Xcdii0D3hu4XkdZzGwd
    zc_W9rZVFeX-r5LJbTQeVcUCuDkHOoQLLrXTmupM_5rSekC0ges_fAW>
X-ME-Received: <xmr:gTTaaiawMl7M-QMwriU37yv5Psrdl_1oEFi8MV3KU0l6-Xp4lSw1DQ>
X-ME-Proxy-Cause: dmFkZTFhdwpjuLQ6mcLNPFLTfHEZbMvTZWojMowugQkJdB7V9bzLxSS4OZz1ztMtRFGCft
    /tpMWrldycJwnvbda48/JoeGKk1XlRXivL/lZAOYcoumP8hXyk8umgYkCOKNlaSeoPQAfe
    OAIAAagpN+eHnrMxeNCIkDcH2fzbGIcQDtqFXv05OtN74sAD6piniZP+zmZ6Xw27HnsMXB
    tkSUVXBUQjm4d9YROLS8usf6UwfzGnOk4ybInha+kgr1BXsRhCC23hFzs9s41ZzMT5qqkX
    F6zW+8wSV5eexp3vLGnndiKZz5NePXjSDChEA5pGxH0N6yOkfySKdsH0U5+jTVnUTMCmiy
    hjB2Epka3ZnAhEYyLMXVqYK3d1yWwXdoD2WvuVVAtAXQtrcPeSI9OfihNyWQ1XGFyJG0CL
    /0uxrBquZiE1PKusSeDHwGENZrOsCqT0IwVHYC1AXvB31cdLzEcA6kgD2tiYXX3qUgudQu
    0hrwTErwnEn6BRQLoUUYurpcKnkQVAWKDHLMZLizqFh5V9FbsczWwLoR8J53j8ONk6sLQ/
    Fa64fQOBbJCJmMI2Omf/AHvE2yIZ9lpCgafjoG3Iua2mN33D0MiTNtgHGLwOvglzD/s+Z3
    ZcjYue8hepVjmv/vBF1oTIZB9k5eeEiyJDg3BprIH84grrPpvvFrYt5lrEoQ
X-ME-Proxy: <xmx:gTTaasQKDBiA_TQE0orsjLG_deH-FqCQWu7l8gyItqPYck5JLfGYfg>
    <xmx:gTTaalRAj5bTT5MHwgvAK1T9JrisyLydbz0LDHvKULq-es9hrJKeOg>
    <xmx:gTTaagQG23mHYMHun9GRZJvj9tFg0Hc-mgXXCPqRFPMiAX1cclU_8A>
    <xmx:gTTaaq7kbuLoLHNe6qFOeEPDX-m0-IDq9n9NyodrtbH0uR1VzPdSsg>
    <xmx:gTTaannVzjnVVErf_8kUZpxNi1drYcFW3rnaf9xyoqSiLi4-Ze8cNW8_>
Feedback-ID: i78e14604:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 12:06:25 -0400 (EDT)
Date: Thu, 22 Oct 2026 11:06:23 -0500
From: Tyler Hicks <code@tyhicks.com>
To: syzbot <syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in md5_block
Message-ID: <ato0f6AUVyixt40U@elm>
References: <6abebdfe.7503fbd6.2d3f6.0009.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6abebdfe.7503fbd6.2d3f6.0009.GAE@google.com>

On 2026-10-01 13:09:34, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    551c722f4080 Merge tag 'rtc-7.3-fixes' of git://git.kernel..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=15154035580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
> dashboard link: https://syzkaller.appspot.com/bug?extid=03c68e42ce4b33f7ce9b
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13154035580000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git next

