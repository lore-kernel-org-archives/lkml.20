Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56FD48BD56
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431627; cv=none; b=W218Ai54AwBeVs2XMAlgUEHTlWd+3pkXcK6arhaZB+4q19zvtyPIFwO1vkyYAkGN9V6oJRMpWbBSm4gYuzYf+W2HU1ADAxeiOX7cONkg72eVrW7vaeKi/zhYgKy8ARSPPiXtfX/fBZfKE0pUmZ44mvY+Yry7WK4Ik4PUCoFrSJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431627; c=relaxed/simple;
	bh=INC/gMQ52XGV0tXzKdQk+QdM6fsrXDjrQLn6+41iXMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjIopFPKbIcRpkj+qCeyfL7gNY8iyO5kyita1hexFzUkjGQwnnoKvA1faqezZjrN0LsElM/+y1VeW9tTCcE0HTJ6H0VvRZlP89Rvsd07k5HM203BJ30xEMergoixvjqcpxW5D54+cSjlfLHiQ3feolk/xXkCndc9CocTqNFijHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NRVRxRnk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gyuDZD9Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRVRxRnk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gyuDZD9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788431611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CJZUMdrfC+SOHHgYZ50yWaWhgHW7YjmLUKRHwooHUww=;
	b=NRVRxRnkiNBJjJn84rIpx7C6bVgCR6UHZC2jalo1KkRR48TV67NCJ52v5sxK8WR4ajOHqH
	bZk9Wvp3I7qf2QSLbGk9NUke8bskLB0sMl427smwzql78a5nq9TSQ7RADJ7EfndZbr38yt
	sBGgXe/tC50bs92DCcwP9wgBcqKTIAQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-tnTEqKS6PKaLjM8kWjApRg-1; Thu, 03 Sep 2026 06:33:28 -0400
X-MC-Unique: tnTEqKS6PKaLjM8kWjApRg-1
X-Mimecast-MFC-AGG-ID: tnTEqKS6PKaLjM8kWjApRg_1788431607
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c24ae1a510cso217349466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788431607; x=1789036407; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJZUMdrfC+SOHHgYZ50yWaWhgHW7YjmLUKRHwooHUww=;
        b=gyuDZD9YPkC0tx/a0gdvuXXQOEfFnzbLBB+kFvCG8Lpbvm7gntq1Mwiu1pM/ovE/Uk
         OnDA5sP6+5wBW3w2Cdy1GKTGcFxPl7N98yIpEX5zqmjymjmy5q83xPN0TjTKI4+1wfQM
         8ELBokR9UnSP54MhNGFWJbNp228OSIgZciG9f6LlQmLJy80MWwZO+AXemyO9Tdv3QqUb
         4QCbhCrNeTRfGUo9cV3SrOKyro3JTamWob8Wpzhz3UdPVE33qxRYeRx8vUZkHP8m/02e
         TB5SnuaEj3tq92A4NNAMlLbdADFc16nMrwiS1EgTdEaHlVhDne58tPngodi9kHsaMg30
         otuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431607; x=1789036407;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CJZUMdrfC+SOHHgYZ50yWaWhgHW7YjmLUKRHwooHUww=;
        b=PwyWZFKCpJw3RJByC0No98BQEjeiloqrS2UeEFAHNVy65L14sm3/xyWsHcC9ymWZUp
         DjZVHKiG6/eeDT8Q8cuiYNiOpdlnXcgFqktuDN4iziREWyyhjFnF1oxem5zwsun6/Szq
         QIIIr0ccXUGqHBIGIJWGvgM39CbypqK4h3nD8Ub11vUgYY/QsfbsIDElRbp6mLZMFASz
         KXGEX5koQe811LYSJKNTifLala4lbBH470OMZ5U0w2S/SIEvS4Xv+kcoaoITKak/o2Uo
         dY2MEP0r8lBcErslI2Xfb1ep+Zoxd3f90v5Nc/vW5xYGm7XsqJROnbwVuktzs/62NCZb
         4HzA==
X-Forwarded-Encrypted: i=1; AKwUvBxySvZytOFMUJon157Hq17MTbMx9TDx/6/+if+9gc+Fwdyfctbim07/WN+cnFhV0vJ7kmQUqbVcvYMksoM=@vger.kernel.org
X-Gm-Message-State: AFuF++nA1cSUKRNbrEeCtXyBiuXn8yT9OR9lRx1OQEyHz40V49Nuqdpa
	SUxrGpKpl8uEevLALnGax7XfMpCXUSlaIhjSV16QLAXhyeJMAGmQsZZqbk0eY+ga29T2k8joKsb
	YjoE8jaTG4qQd4SG5/AC0I5BZVQ/F6gfqs9+1vMHuo6uan8KaWWHUxhpJZNUv6Jz+eg==
X-Gm-Gg: AYBFou3RcPT6Gpyr0bFJ+1dtLVw9L1OVcGm7Su3y8tASQYNVBLXWEqN9Stay36JpIDl
	APClJ2Xd9+wdW/YP4nNmywKlSYGU0QJdb4fmtvdNEAoR9v+7VLTXYDrhVRYaQKFuYfyD0p2ZRwH
	RUSVIXNebEjSei7IUROeLp16CMj76K3EAvBaZ+QlsZtwYT/d/t2Dh6lU8CAJwhjcJr1HCjs8AUl
	5MSgM5ODISrVD0+nvFJ8T362jSxTTxzx1wYeynMCroQU6xAv1C7j/6AlP2HDV1L6TTGbYWZKXjW
	ZDawj4uB99fgmcHt8Y1XdpVxGaTWHNPT8HjrX8eYv8LjtCmG8mRhbFwqgii/mD3RTe3JZLeX+L0
	PSYnfhp2mS582Sq6SxG1VZAG1NYDFtQsX+4qgckFdJr5Qt6mv
X-Received: by 2002:a17:907:198a:b0:c21:8c6a:c680 with SMTP id a640c23a62f3a-c25d563b583mr789071966b.22.1788431607056;
        Thu, 03 Sep 2026 03:33:27 -0700 (PDT)
X-Received: by 2002:a17:907:198a:b0:c21:8c6a:c680 with SMTP id a640c23a62f3a-c25d563b583mr789070066b.22.1788431606639;
        Thu, 03 Sep 2026 03:33:26 -0700 (PDT)
Received: from [172.16.2.95] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eed0a9sm82869766b.1.2026.09.03.03.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:33:26 -0700 (PDT)
From: Eelco Chaudron <echaudro@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, Aaron Conole <aconole@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, dev@openvswitch.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: openvswitch: don't schedule rebalancing if
 there are no datapaths
Date: Thu, 03 Sep 2026 12:33:24 +0200
X-Mailer: MailMate (3.0r7028)
Message-ID: <61F294D1-5DEC-4DF7-999A-3E3DC8984897@redhat.com>
In-Reply-To: <20260902203200.1416026-1-i.maximets@ovn.org>
References: <20260902203200.1416026-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Reactions: disallow



On 2 Sep 2026, at 22:30, Ilya Maximets wrote:

> During namespace initialization the masks rebalancing work is
> scheduled and automatically re-scheduled every 4 seconds afterwards.
> This is happening in every namespace.  On a large kubernetes node with
> 500 pods, i.e., 500+ namespaces, this creates a decent amount of
> unnecessary churn scheduling 500 jobs every 4 seconds that take the
> mutex, check that there are no datapaths in their namespace, release
> the mutex, re-schedule themselves and exit.  These 500 unnecessary
> mutex locks may hold off operations in a single namespace that
> actually has a datapath configured and has real user requests to
> handle under this lock.  They can also add delay to removal of other
> namespaces as ovs_exit_net() needs to take that lock as well and
> synchronously waits for the work to be cancelled.
>
> Let's only fire the job when the first datapath is actually created
> and not re-arm it if there are no more datapaths configured in the
> namespace.
>
> Another approach would be to make ovs_mutex per-namespace, but it's
> a much larger change that should be handled separately, and the
> unnecessary work scheduling feels like a waste regardless.
>
> It's safe to check and re-arm outside of the mutex as DP_CMD_NEW
> handler will re-arm if the new datapath appears.  The scheduling
> attempt also doesn't change the work or delay if it is already queued,
> so it's also safe to call multiple times.
>
> Skipping the re-arming is more elegant than canceling on removal of
> the last datapath as it allows us to not think about potential race
> conditions at a negligible cost of potentially one extra re-scheduling.
>
> msecs_to_jiffies() moved to the macro to save on line length.
>
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>

Thanks for looking into this. The approach seems right to me.
I did some basic testing, and it looks fine to me.

Acked-by: Eelco Chaudron <echaudro@redhat.com>

