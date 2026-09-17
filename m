Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4CC4C0409
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640161; cv=none; b=PKyMWpkQdO+1F0GMF/3k7L8acCkmB5dvQUn8Zq2qMbYQ4CLC7ydMdTmSjbNIfiHCgka07AkRurfHeidAJHTq+mEjW8l//fhBdS08LjZijy5L9eCi/Vzu4qfLfqnzzuTHJhYxfZmsYhCYzAa66xxFp6HZSRiNt0PLqVU38xsXMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640161; c=relaxed/simple;
	bh=NF4IaQxU8TH5yNIanIJmaEsCYBVJctLNQBjW4QIHA8g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QpllOb9UJ1go8hg8UbD6ncNI9fsM36kx69HoOYBSmz6qnwkqdxf5y8OjBXVy0TAkP6HA08H3mpRCFe3KLNtLPcJjzyHUFL37Eny378SO5/YJnm1HwU+Y87fF9eJpGPaoTZriSYSTuBEDgxD/dCjgs6JPvKf9nrF9voAZo+RpguI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=cmmcxxUC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q8FPGS+H; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cmmcxxUC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q8FPGS+H"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 75DFAEC016F;
	Thu, 17 Sep 2026 06:15:48 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 17 Sep 2026 06:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789640147;
	 x=1789726547; bh=63zrAy46gSsb3p8yj1mhK5xaAA+erR8iZLYTbk/Bg7g=; b=
	cmmcxxUC4Yi8AtHYQy91rc8pGq6Xpn4y7Yp26rffQNYtBaHR6QAFPWSfLW/Ivfb3
	6LWSteiLaz3xcojERQcbjvCmtQVLAPKBuwJW2VciWjTnACI4gQzZ1/O7W5f2sTda
	K/+abxzeWBdw5WMTd97MC4QfA+CUdSVUWYS4ql6ClDTDBF3xjdcOgY2J02Sdfwqw
	JFcNSeP9KyNPHMy4eMBmu2LLLyRD2BGNanGT5tBWfKTAKhHVsZ1/YluxzBbZDowO
	rrIrJw7XBGU4fN5R7Dpe10KzUBd6ife0h69ksaA5tGxt1n2rmRv9rFDnwSBK9K6S
	PJX0bvP+iVUE0x8cwTGyXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789640147; x=
	1789726547; bh=63zrAy46gSsb3p8yj1mhK5xaAA+erR8iZLYTbk/Bg7g=; b=Q
	8FPGS+HRS1XIEdvfZ0cy9o50f7DsczXNCvv+ICNQX1R02obIkacTU/NuUtA3FAgb
	jJgLTi1+1DGL42eoJA1PTf3MDIn4uiZQtLNJ/eieN3CW3dNuSQsWq+BgU9ZY3TZU
	H/m7tZIiDiVnHrxxF7H3eHfe2xlv2F3L7O1jbnawl0CV9vY9t+KYVwvHGYXePMOX
	PZOPYLy9xYhh/C5RHyTgr6ktBVJPWubyIurApnWt4aHac3OfgnTQB65GoybkHSdm
	HyjsH/AiKxjNubkKOij0hvdpVd/dZoautdrlVd+zZOq8r3ibKb9bbu9BhtWR7pCV
	i+EYyRd0Msg2OAIJ5trhQ==
X-ME-Sender: <xms:zL2rau8fojYY1T7ifVW8MYSwQJGUi5wdVbPFkcvf9kS5aOiirAO7Ew>
    <xme:zL2rapgmm3mHHb5y3DZgcOhualtkMgt2pR4JyldCVLDl3bebCBXStWH0yp1DKzi8N
    -F_w0cCjc04GWLh9-tTRyp0CV6IXnjEzjxqwbjq5MIiwYdeH5WSz2w>
X-ME-Proxy-Cause: dmFkZTGObiLov0ZhD65vCMEDs7FyeO+N6gOc227aZ2EcrWzGLk1cuphQJxG6jEp+lPjKa8
    dTdXUGAKPunOpPiE/cTsQtkTFTW7xc9M+3DHGqvYZkk8VUwTrXJ9n400/RbHDBkmYPUAPS
    hNq0mR03tMRt3tMGmmdAn2WVC6m8+G/vEOzoMK6dwHdpQO/5F1OBLh1sjweUYPmCh2ELL7
    B9F4gGnChXUf0SadPnzjhGR9l8+TJVxJwQwRoeYRsU57cdyC7Sa8p2t1CgG2+E/O7RlThr
    fBboBI98bf2eB4h3KhE+Hhb+D2fTyYa2bhswd2XaFShan9En180bV3glzF9myTMzGgpBmD
    vc31QPMpol3Sm6ZVgUy8nzj/n30k9T7AeTKdQuar5/6BYWyfLWmVbtYTuoBHBgDFSGqzjW
    o3SrbCeDRQ76JQ+kKfALY6W9ggzHGssCBafTz3YLPhAMZwB4S4CX79LR13sSk3702n043Q
    LZWatXQ58f6FFIZIJmso5mpi5qdfMbobFukWp0o/Q7PzOpRDDY0ZFwdDqra4QpyqVcPUo4
    j+Oi6OnqikXwUxQQ/Bge00wrpu4p+HVXs3dQkgH5E3XbOMx9XCaQ8Rx+HcMHqicGrkAi3r
    j39SGU/OhSpfiU076jcDU1SgRaHiSLYKGzR4AMPkYalflphI7KJX5sWIva/w
X-ME-Proxy: <xmx:z72ral1a3RUM5nYAjM03H8uzFlvvRc9InpOucU09R-fKDSkRVXYQog>
    <xmx:z72ramzg0ET3x2TBkBsJjAb4zRQbfXYUIcMw1Uk7KSsazpMzgBG2Vw>
    <xmx:z72rashI4I64YgMFKEShgvbjjop6axEMGsyqMdoeht8Vb1IH_O-D7w>
    <xmx:z72ratxIa3zN7AKNzH4GgwK7DabzDbSXJQlcxN6AsFW1SZpSaapWCQ>
    <xmx:072rasUZzw3xiVye1Gv2_hKwH9obB2pTZJyF01cUIWJ7zoF6_LbwYr5r>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C695632A0084; Thu, 17 Sep 2026 06:15:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ACGBcqtoOIMw
Date: Thu, 17 Sep 2026 12:15:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Johannes Weiner" <hannes@cmpxchg.org>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Michal Hocko" <mhocko@kernel.org>, "Qi Zheng" <qi.zheng@linux.dev>,
 "Shakeel Butt" <shakeel.butt@linux.dev>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Kairui Song" <kasong@tencent.com>, "Barry Song" <baohua@kernel.org>,
 "Axel Rasmussen" <axelrasmussen@google.com>,
 "Yuanchu Xie" <yuanchu@google.com>, "Wei Xu" <weixugc@google.com>,
 "Baoquan He" <baoquan.he@linux.dev>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Ridong Chen" <chenridong@xiaomi.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Message-Id: <d832c2d1-d691-4583-852a-f05d4335e9ce@app.fastmail.com>
In-Reply-To: <20260916230330.f0923cdb679de0b39d1c5d3a@linux-foundation.org>
References: <20260916083456.4136132-1-arnd@kernel.org>
 <20260916162816.39f0f33f6a48d30a71be3575@linux-foundation.org>
 <20260916163044.3daa3811d9b2bf7d958f1f27@linux-foundation.org>
 <75939625-482c-464f-83fb-fa12d3e1d79c@app.fastmail.com>
 <20260916230330.f0923cdb679de0b39d1c5d3a@linux-foundation.org>
Subject: Re: [PATCH] mm/vmscan: avoid false-positive -Wuninitialized warning, again
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 17, 2026, at 08:03, Andrew Morton wrote:
> On Thu, 17 Sep 2026 07:50:43 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:
>> On Thu, Sep 17, 2026, at 01:30, Andrew Morton wrote:
>> What I found now is that the __noipa is only needed on top of 
>> "mm/mglru: use explicit tier range in read_ctrl_pos()", which was
>> in next-20260915 but disappeared in next-20260916. This patch
>> also removed the min().
>
> So we don't need cc:stable?

Correct

>> I think the reason why __noipa causes the warning about min() is
>> that it prevents the constant propagation into read_ctrl_pos() and
>> in turn the hack that suppresses warning about mixed types in
>> minmax.h when both sides are constant.
>> 
>> Is the mglru series currently expected to make it into 7.4?
>
> Yes, "mm/mglru: use explicit tier range in read_ctrl_pos()" is in
> mm-unstable at present.
>
>> If not, I would withdraw my __noipa and hope that the next
>> round of changes to read_ctrl_pos() does not run into this
>> problem again.
>
> OK, I'll drop "mm/vmscan.c: fix min() signedness mismatch" and shall
> rely on "mm/mglru: use explicit tier range in read_ctrl_pos()" to fix
> the min() thing.

Ok

> And I'll stage "mm/vmscan: avoid false-positive -Wuninitialized
> warning, again".  ahead of "mm/mglru: use explicit tier range in
> read_ctrl_pos()" to fix the build glitch wihout a bisection hole.
>
> Does that sound sane?

I think the "mm/mglru: use explicit tier range in read_ctrl_pos()"
patch should come first because the -Wuninitialized warning only
happens in some randconfig builds with that, while the  "mm/vmscan:
avoid false-positive -Wuninitialized warning, again" patch on
its own would always warn about the min().

Somehow I fear this is not the last we've heard of this bug, and
I wonder reworking read_ctrl_pos() would be better. I tried that
in my original suggestion before adding the initialization, but
that had other problems:
https://lore.kernel.org/all/20260213123902.3466040-1-arnd@kernel.org/

I have checked the latest gcc-17 snapshot and see that this still
produces the warning.

I also managed to create a reduced test case, see
https://godbolt.org/z/xofecssz4 but this still doesn't make sense
to me. I do see that gcc creates a both an out-of-line version
of read_ctrl_pos() and also inlines it. Marking it either
__always_inline or noinline avoids the warning.

      Arnd
