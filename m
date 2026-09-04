Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9D44E8E05
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788541667; cv=none; b=At+hlCo/gL6bLW4hiJvknCTwiSinTKmuGXUjjgpx3Qe9mA4mPAHQj9y9MvapsayjRlIC4and87aPCHQ9hPXJjQIbVLn5I59t8ZFYZ7tW0qj8lDTIdzPNjlmEaIlIYNwcfoKvhAipSQBn7xz8EBgmnytOZnHLvKS7y+4Qc8lZNS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788541667; c=relaxed/simple;
	bh=R2iMVpGxciRBsYsoGuCGIL3TC/C/mpSckDkgVumUDjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IW8OAGds6bTtKSi4wgjKkTXQPOplUCLICQAKBu5DJxYhDAOEUUQalEdeeZjCYreDz7zxUHOjBxWZ4OjUH9a86ZvTieyY+neBkZGBygnTCsZDKsex0soJQqCCNBjY3voSfEbV25ag8UBLfQA7hto8ifmgIPJ1/vl3bmqfB6crXEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OTrauTvi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oITMvOYS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OTrauTvi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oITMvOYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788541664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4p/TXWN5TTjU8Fhqa3oiMoIW3DoEVRHu2RLVaJn1QpY=;
	b=OTrauTvi/CtZgCzEEJNHxwYe0Zrn7tWhIk2L2eKZOvaHf/k6GlMqA0megAkPSMZ/cbk+I/
	rQPvMQHymAue66sS9SOBB8JVFje2AtLwd6Bg5qdAFhU/dDK4xrpuyoj7oK3HPY6mJ8NL7k
	eiEgFXmpEGsK/UZYEFZ8zu1gn4FuTYg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-DTM3OpnRNc-rh_mMvn9uQw-1; Fri, 04 Sep 2026 13:07:42 -0400
X-MC-Unique: DTM3OpnRNc-rh_mMvn9uQw-1
X-Mimecast-MFC-AGG-ID: DTM3OpnRNc-rh_mMvn9uQw_1788541662
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939694871aaso204136985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788541662; x=1789146462; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4p/TXWN5TTjU8Fhqa3oiMoIW3DoEVRHu2RLVaJn1QpY=;
        b=oITMvOYSXUzMkCruOCrcI4LM+IlcZZp3wTgOtG3d7nKx0DJ+TS7tMerrgSrL+VQlnS
         CD6mXzrOxPZbH9BFD6pwChf01vWvzYJtS0IbU8aG17bYV/66jVkwWC61gJAMNuzFQ6Ho
         ixjN8u0A/IIhZ422d2RwoL819Tow/TAQ0FuvTM9cijxZ2wFECyU799Jdn6Exct4wpQ8M
         RVH5/sT+WAuN1KGmmQ2oL1swJotj+DydWrh1oQ4fC96GOSxRAWRkl/hN/tQK8STV9n96
         FNL7WsDK7Fn6gxO3QgMO9kwt0NGRcVTP4B294cfpiUxntD16W2/fjur2tTrFtm+co7A6
         KRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788541662; x=1789146462;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4p/TXWN5TTjU8Fhqa3oiMoIW3DoEVRHu2RLVaJn1QpY=;
        b=ebaSn6FimR3DAroQCbLrLXZdfKMiMEROYMr21lyoDgW0TSyxLZUq/K8kFn8yhInaxS
         0NmABWYFoy/c2OCrtjmgdwBSNdhpRsOe2OiCnduYFk1bFao47ofeIPK4eKrlWZiRdxTM
         9CQ8EvV4dYaHdYIWy5hP5ecWZBFhUUKJgiSVNRf4CpIhA4XJ2ZL1lpLbwstEGhJCQAG4
         mwRxr4Lrr/bSMm2zF5F8oiZFKX/mPyUgmy8+CwsQJCjigLuuCYGgfEyrtH1td1qr2ZEl
         gws9mL29K0AON2hYpdBSwiqOBv8BIwLcNxE1oHpNp1QNhKyO2gd9LcP+mTkf6BdpVY5C
         B5zQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8KVLvFDBPBCCwr8AWe0E7xSA5MWA9MzB6y40StF3BbMSewvVQgzJXpua+4dEoUjcrtpB0MZUDNMM5RlE=@vger.kernel.org
X-Gm-Message-State: AFuF++l7W45YjEvFIHfSHYWqbYbLTPLHQNFpdCItpmo9TvnWcDnZrumQ
	nPzA3rDZ34Go8sRndQ0u5cJd4YEhpMMb+9vOesuk57zCldnBWEIQhc4wW7DTMnKDJAmf9ulIlGQ
	9HxdM2B8y31t8TjBpc/zWWdlqyj4XV5P+Z3Vtm8sh2RxRDK1iBVYn7/lQvtUA0vwzfgicmRp0He
	HIifszIyNgdsUxZAwh4LGIa/PRjh4IHHBupiSfWqHqhZyX7s2YUDE=
X-Gm-Gg: AYBFou32kurT89yE6acg0Y6wEMdNg4d2Sr5ShExAHZdGOdXCniEtBSvYDfANhvc99Kq
	eYfaho1aKUN/FCtHWY2sP2BbxcwL+Qzm6detMQjL0nZO3vwWdAMLRSpPjfKZO1S6D5DOuqygaLO
	R16DzGTMa4bdR8jBnkljH6NNr2I+2liYJwWXRNe5R93TUseiWxVuukWOVftYSWeFpYYvbAfSUY3
	MK/x63XPDOV6z1Zg9TSsOfyCyMHgHp8UIBOTGD5nzS1OEgfwCwgdTrVpyjDk//dZcH3PZqMxuWv
	/CkfnP3T8RsaJoI3kYmwuQNI6+9WcLP8Lyam2djeb+3mxI/B9+lPngThaZBa5yed6EQhTqdyJJO
	iGb+ijCy4P6kEEA4PHRJJ09rPoiTC
X-Received: by 2002:a05:620a:38ca:b0:939:72ae:e536 with SMTP id af79cd13be357-9398033d47fmr456395285a.13.1788541662103;
        Fri, 04 Sep 2026 10:07:42 -0700 (PDT)
X-Received: by 2002:a05:620a:38ca:b0:939:72ae:e536 with SMTP id af79cd13be357-9398033d47fmr456390385a.13.1788541661512;
        Fri, 04 Sep 2026 10:07:41 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbb70f1sm260910885a.40.2026.09.04.10.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:07:40 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org,  Eelco Chaudron <echaudro@redhat.com>,  "David
 S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,
  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,
  Simon Horman <horms@kernel.org>,  dev@openvswitch.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: openvswitch: don't schedule rebalancing
 if there are no datapaths
In-Reply-To: <20260902203200.1416026-1-i.maximets@ovn.org> (Ilya Maximets's
	message of "Wed, 2 Sep 2026 22:30:41 +0200")
References: <20260902203200.1416026-1-i.maximets@ovn.org>
Date: Fri, 04 Sep 2026 13:07:39 -0400
Message-ID: <f7ta4pxj678.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ilya Maximets <i.maximets@ovn.org> writes:

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
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

