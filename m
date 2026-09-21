Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E11A6811
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789959733; cv=none; b=gklZnyH3AeiwBhzJeidmpbX9/l1iu/pA1QzIYUlKZoKN4GN14eCBqua/RqPdktNRKLveTsBeZRlJ7Ut0XrKU1FC5wzqPhFpqoHHVlGLkIh49m4DJldHp+EVkBAK70Gd2qKb+ndsUY+CRojEV5RVc58dappOgHMdFab+wkLFvV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789959733; c=relaxed/simple;
	bh=iOXA07HB8HCaKIy41gNVHkMLFJBd+TbmJWua+BYy6os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCkN+VpH3UDfqeS/s9Px42gQzjKefHYvRzgm8G0JJvWit8/zLmilOYS5TgBuRhpbWIUQrOzjYbwTmSF1WbsPPw5LM8Cc37ixvUuESVscI2wjb75xDdYi0ZsswrV1DoFGuSr9P1xL5z7RGAwCNzLW/wiI52dT+bj7sGfpi5aIFlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=AumHS9yC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OHqEEKfx; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="AumHS9yC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OHqEEKfx"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 550AF140008A;
	Sun, 20 Sep 2026 23:02:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 20 Sep 2026 23:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789959731; x=
	1790046131; bh=+csptQK2hgjD0ELS7zoCXD7jNQrBF8MJ6VJhRf8bx0o=; b=A
	umHS9yCOz/SOa0YwpoSIlatJ4qV78orDtgq5rFxUtSRX35EWRTudu8WWadYW1jxi
	/NGdBuVxiTyBvd//DdGacN+aW4mqiuFxbLqLCC/JQMTSGPjrhuGZZ0lm84rs4tXa
	tsDz1gLqv0qWP6DqusUgc61xca+H0tU5r6rb05JqY5p1mFTRIu5xBwzHpPa5wYa8
	tIYdUKEYg+9tcJpXQ6C0s5CUDuqkUuk130KLfjC+mKfMJJFMI+KwCvYxKljN6wnX
	0ovRT3/bX6e2fgJQJDi20BPIPx27Np4iseqQXNprFzZMkF1QtUn7EusW4jJbUoCR
	sU7ZXjAYV4qexlKrMnjLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789959731; x=1790046131; bh=+csptQK2hgjD0ELS7zoCXD7jNQrBF8MJ6VJ
	hRf8bx0o=; b=OHqEEKfxEBYN28UxHw1CmfloFgwWAODKqqxYj6MY31lcOns4FTi
	aKOExlOi7jh6ZEnCC6nGkZb2wJa49M+kAXGTnFUtoZEnzXiD7wB5wJPYTLnL/5sF
	4boZ9fEuWeWVuvg0PFd+GorG7ytqvVHbZOfSERNizEkIXyzRS3/3TQ/WvCpACL4q
	IbD/VkDoj49waCjYOTGjEYtaniaJwRL8F9lwrRGxgPCiXFzL7qVdabE28QH8PreJ
	Rsz4U+9sDIJ/jSIcQiA2NWMwDGXUfETr3xm9+0kmAl/UTGHBEphblVidBXmNpv1K
	+uB8bo3xYeZOfYiCF/yuO7XRK9iLOofX7/Q==
X-ME-Sender: <xms:M56wakrDBlZo9ZDPDJ1BnBsnbA5w8zds4BB4oomUbYAacb0062IADw>
    <xme:M56waonrZxDd1BFr7ilepkQ625n4_qbcLU39GKLrL6Vu2anxZ0hggcksOUvwwwGeE
    SFHYttkerUjsoNS5Sk3tNr0Wnybli8MwYb6PXcV540V43vyaxggn8o>
X-ME-Received: <xmr:M56wagzd7jNIue-GfunGSUQdC2vxnPnkpSJ2zbaDPQxZu_KeSE3m_3Etr-XbxE961-n8ZBk3_BQBKjDeEo8KeYcSddapdg>
X-ME-Proxy-Cause: dmFkZTE1ZcS5JDXTa42AyETs79Of6Pdbhp5vJafMVjOKTWJK16a/mP/WIge8cSG3dCt/r6
    VGT7uF8R19wDaikXxbOMiEZR68ox3AlYrXtYBoMb/LbmRUB8HZUJLxVjvTm6gnIWo3pz8+
    sUQj10/p8uIBStw3JhMNIqVZr4/r0UzjMCiTvOv+ACbrC8WUHymVbgUz6Me+hqP3sTFG8F
    wgr8oF7byBH3AbNu6BxePWk7kzpJrT2c/UqFlxBPfjwoSIIFCiMqKz3rVIQ4PqvpbKDPRZ
    8HcwHdO/bm+7mYlKs+pbVeoieETr7VmvMR8TpXIEHs8mVsHWbyf19PmCHmGthmQD80SCR8
    h9dUn/1sCW08ntKm1345GXy8r9hjHjQtODpmvl4Eax7yMbUQIP2pd58nb6IzzKNm0R1x0T
    IpfSh4dHmV8LAA3yQtMFbeoSQzd9+jEUiNMTus0pr4CjzIiKHjwAIVtS1mHIbbrN6o42zw
    1TfLW/FQwdjRuugkLVY+MkM4dwrnpXcowC3TC9rGITFyhkd74sXb3AQ+BEzGD+4Rax8v9e
    NMUVicVgk3T3z0CM9YweT8JMzPTlod/kYT90E9C5R/7u6iB60hihEte5xA9Wm6SNL6+yNX
    lfVxAGmdd5J8ATgOzUtgr8r8hV+nok7Jjp5aSBEdG6BN3QN2a1J7ZTz7Jteg
X-ME-Proxy: <xmx:M56waonR9IOxOGIn1Wwgh7WROtiKl7QU1PnYZK0AaKnUAXo18DpLXA>
    <xmx:M56wahcAX_cV0nTRatcz5qWs-Awurmlch4pHB-Ram96OealrhQG1wA>
    <xmx:M56wamqrjWZUtEPKGUg_Ss1cPke6UrSfc-a7iCnNtQD9w_7gJMhN4g>
    <xmx:M56wan5AiRhcaz7mEpojfCTicTcB6mXcewmREhEz2sHj4TPD2_QKcA>
    <xmx:M56wardhXrZmgD9t8N3aT2w0fnmAJIQM6T3cSVMKK4tk8030AwgydpOS>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 23:02:10 -0400 (EDT)
Date: Mon, 21 Sep 2026 12:02:08 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: consolidate lock scopes for event
 waiting in dequeue function
Message-ID: <20260921030208.GB283306@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20260920104745.212753-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920104745.212753-1-o-takashi@sakamocchi.jp>

On Sun, Sep 20, 2026 at 07:47:45PM +0900, Takashi Sakamoto wrote:
> Current implementation uses the spinlock in the card structure to
> serialize accesses to the event list. The dequeue_event() function yields
> the CPU while waiting for the condition to become true, but checks the
> list without acquiring the spinlock. It acquires the spinlock when
> operating the list, however it assumes that the list has at least one
> entry.
> 
> This can cause problems when multiple threads execute read(2) system calls
> concurrently, since the list can become empty after rescheduling but before
> the list operation, depending on the scheduling order of the two threads.
> 
> Use a wait_event variant that reacquires the lock after being
> rescheduled, before checking the condition.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-cdev.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)

Applied to for-next branch.


Regards

Takashi Sakamoto
