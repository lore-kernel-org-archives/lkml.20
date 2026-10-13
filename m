Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE124EE874
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903198; cv=pass; b=WPvVCdsTC8vXidRwTe1tHM7k6PfNJrlNXHFeNkGpNYTZtXs/QoFuQdoJ3q2MpdPyqfDsICjQfObd4Szu9Zo17rGePKXdxyhyZWJFkKwfUybb6478YWNg8oHxRFT4Vgc1G/RFJfIClCyWlZY4s67wA6GXoh+f8VNIIj7vQ7eqN8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903198; c=relaxed/simple;
	bh=iFViJktZMCn7G/oCsF+rJrQa2WXHROK83R5LHGg8yrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzInuQFZA6N/FMtc7Zv3KxsYLwg+qMEMyFb/u8Whg/m+8UvMFlLUhISb4UwJ9kXI4dqyrPXP1XXh/S579lH4A6LhNFTFAkefm7DdMay2zFH3KkLYyBY1g4lAX9qBNzJLr4to86JUm85xQBET4H252QatFqmt2SFGDk0W4vOyJ2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o5BSaVPN; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o5BSaVPN"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ba3adf78f5so2600345e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791903195; cv=none;
        d=google.com; s=arc-20260327;
        b=qKpK5aF9SLKkXZtLX14sGwjh9rSQrdEYetGfIn23QV1AfvYqCA+sxCHWtpnC8GZGTo
         7s8cMJPIzhf4tYRtyXEg6LvtvFex4yFjjnBWr1zyU/u3Gs/bsB02uDEGROCVLogsMYxj
         8rHxv1H/3m4Wx/bJhrJTyAMLXIK1EHryX/FLtVJc/iAMn9nmZRy0AnqVLVG9NwNM0iA2
         Lc7eHhy/H6mHQvGvBfUVwH1FOjOWL2/UcLz3B+dRGoRd+Bef1A7KIpbcka7CPca9f/d9
         8dypFaw14mo8mqgJd9Cc4Jy4tT/HZK8QNAPHdIIDy+JvBEGOY3x6nX7NbtYG+V4z+FhE
         xMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iFViJktZMCn7G/oCsF+rJrQa2WXHROK83R5LHGg8yrM=;
        fh=j88fOaLYOSd2N5D2Nui06WlDwIJPF8KLOADq0O4KKAc=;
        b=NAggD0ZEU0Aw2y+4aIpKBCnkEVc1FIy2MaSOFs1533fDpu0oZlhuPCI8XyO7r0jHdR
         5GquKIKkeSLkvVMuyOZo2dQ3DHXpw6bZq73ZcbEzarQYeEU3ahFaIa42fHR+stMK17Ew
         ICsrISA5Fph3uop0+xW8EkRxR3szgwRMN4MyMzN1zNkpjaA3OAH0gN3lbwtzw3zgSOlu
         XD+nSZhvhvcvyjITXUl4vxFpJm5ZAQ52gUTg+STyIeNXqxwmdckRqJBzd3xG9HVKSlVf
         nlClcER6XvSq7ljvrPPsQxF9LdcuXe5hI36zrGbB4xJHMLa3izHpJGXJ1CEwPCW5qSih
         fsrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903195; x=1792507995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFViJktZMCn7G/oCsF+rJrQa2WXHROK83R5LHGg8yrM=;
        b=o5BSaVPNB2XJegJBOjGigjahUetxhZOujsmajvwDofD8Hjjg2CUv4DLTPkmpMBNU1W
         EzMOGz0E+WkieoUZQ1hAbLf/hjoeRvlyy8JHh5vpiNGvhtrkRAnPmu+6ozahyUY8zQ70
         2juryiG24njxdPyj20pTP/CxhnowktV2XbjS25i12/MEZIUJfPm/8Lr77MAeLpEV5aAA
         XUGhHscndr4oi5pkDNBi3UwCyeNETj4wxA8NGElJX76e5bTm3yxGkwDO97jvyi7aKEpJ
         YqZktRkuadTnaKLMaB/j9gzty5umMUG/auOfe8yqEWINocMRJRlpqoqq/yiR5KsBu/8L
         tCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903195; x=1792507995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iFViJktZMCn7G/oCsF+rJrQa2WXHROK83R5LHGg8yrM=;
        b=GKF4NaNWlK379/87GZqZNmIcHog+BVpdDa7Hc5WLpm6FJi1agkCwWvdLPBL3UbWl+h
         lwHNR+Vv8VUacjMfacY2VQDA/Nb5c+0o//8ksNRUG74E//C7/AXI9cPZojIXGbetGX/6
         lkhdqpRJfgx1RAB8NDv9TWhY7FTfHd1rmXhlX/BvIlSYZQpJTeoO/uouaBN2qtvPQl76
         9M1ORIZhgKj8H6OYd9+LHbkTlIhlSbT4Uy20HkdbvREsiwW4tBUx576211qHLbw3Y/FG
         PJ5XjDc+2sDSG2MG4Frcq8z9DcFcxKqpGOzIh58TOququkGz7xdmhp7QlICflrw+v4P1
         UZ6A==
X-Forwarded-Encrypted: i=1; AKwUvBwsKYjJqQlmPkGMgc7IRBrlzXkB6qJnzvDzqXVczjJrZBEmmOvOhPSjxqU2EHTWuMDISBXpHwCfCBVZGk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIN1iP+chU6R6jJIEvXnuFPeOld5SWrm6x6EA5Mh/fNpYwPMPY
	LRDbVIz8ubXzhE6bVTEJkzoBIq9/IZYrq+VZ/d/emIRbfZO7wwvzzQIEUL4dV8H7S62R7yYaXPP
	jJxN5bG21l5mC3ljIlWAYIo2h8Yd7ptM=
X-Gm-Gg: AYBFou011yLNA/9EaQ/wMWvFoPNu6smbsLci0U3JfnV2leJrODOEIvSYDAUzrH6VUs7
	7Gj4Gh9QMH9eqjy4rOYRh+qzp39qnudNG5YZy9XRIjTqhmtk2qxt6PGdsPrqWXBQiIrwOOkdzjn
	QzCYDb3qt3MPQF6IkcsYZDFHH6saekBsest6A9VXw6MPqSKw13QySmwF1ud3sVpSrfnsIDs1y/c
	srDKwsHLVb4SAZS6xluG4t6Satpi4C1yxMPicyqFXJn6lDvtUGvOA6pQAZSKTd51JbUPxMkUX2W
	eOL1BJacGXvSFBKgwrqxYRqTvC7qWr4vanU3y2Jl5D2x+/RfiZhLanVQwCiLCuvX2Wq4fpQvvSu
	EjCT0fJ+Vk5ejkc/FpxU71f1m08Y+lbYUm6nhXnhKk8CzTj3V95iHPmBt+g==
X-Received: by 2002:a05:6512:3091:b0:5b6:1a7c:aa0d with SMTP id
 2adb3069b0e04-5bcde8c1693mr3692464e87.37.1791903194698; Tue, 13 Oct 2026
 07:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANGjgdnO3HXAxA33cT_rv=on6Qwyf95jgicj6cZKA86Q6tv0Sg@mail.gmail.com>
 <20261012105953.GR4121339@noisy.programming.kicks-ass.net>
 <CANGjgdnmcm101FneQse==f-YQhKyoARzt20AMyWz21HLQLEFew@mail.gmail.com> <20261013113144.GH2009045@noisy.programming.kicks-ass.net>
In-Reply-To: <20261013113144.GH2009045@noisy.programming.kicks-ass.net>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Tue, 13 Oct 2026 22:53:01 +0800
X-Gm-Features: AclHuK9uQWWs7SsF3tx1mRb8vxqVTe_cxeJoQWZs29IPIEbZtiCXgBPE7i4NLD0
Message-ID: <CANGjgdkba0rK+w-==O2Cx8h_n79UGr-a-hK=xz8e_JWEbW+Wvg@mail.gmail.com>
Subject: Re: [RFC] sched/fair: avoid redundant updates for unchanged default slices
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thanks for reviewing. Would you like me to send this as a formal patch?

Thanks,
Chengfeng



On Tue, 13 Oct 2026 13:31:44 +0200, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Oct 13, 2026 at 05:58:17PM +0800, Chengfeng Lin wrote:
>
> > The attached default-slice-peter-v4.patch is the revision tested here,
> > against unmodified v7.2. Does this look like a reasonable way to keep
> > the unchanged-parameter fast path while handling these cases?
>
> Yes, this looks reasonable.
