Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258533;
	b=nlpZEHX/Ggb0UQcL8c0Bg6H9K2fSA4XtdBYi+HXjwkXSJO59pYwSHEHjXkzVMLXgaOzc
	 CiCs2LlUA8FcSkWWHLjyXZtXxyvLNjmazC5YJqoWh1tdCzJ772K6w1niNAzGg6WlacFDW
	 KrWjfiOACHBeUfgea3SU/Lhk66va+xZVL/AtjymlJFwLFzEQAtEQaf4d9i2kkdAbQqyDl
	 L5QgNWWRKKpkU2fkDH77ST0FKeqktIGwIz3q0vtPPWzajqsOuVziv0NuO8+wj3SbcyW8U
	 6YSrmrhAb9vo7pqgRq5IilyiqHuV9diPBsGA12T0DPxZ2oNdelmDur0Yg+P72/HIP7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258533;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TsAQS4rA4H1iNqLsq84hKblFTfrWhP+kWPfdX+CCGew=;
	b=NB04CamW1+cUfiadld/AvRVe3lMFqLxSTlwlh7aJJ15enlTZvZHQAxyMxjs8x5VWMNDl
	 HFegyAaBASdC6H+o3anWTZ+BnkOeUjKA9CWk57bTkCklVNwmn9ZYifDW7HHSaAw8cTiBp
	 mhHGuae0s6ScSmCpaHzZY+RPO8Knr0KGfW1qT9UUPljtQtQF85a5TB0u0t7hjczsTDtfB
	 n/Hq/0ExmF3oG0dv+WAGkuJkro+pSUkICdtCfMZZr/5uXCKG/pXp6fpRoE5nTscYOIlIL
	 FHBjrIrujwuI7SK/Rg4XREc0vNIJMunJ1iFjExDa4b2Zwwq4zt0W4IXbAfF54KFfiwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h3nLwMmr;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bkhC7wkX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C861606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C861606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h3nLwMmr;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bkhC7wkX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793258532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsAQS4rA4H1iNqLsq84hKblFTfrWhP+kWPfdX+CCGew=;
	b=h3nLwMmrpaKBunfv6J9qj8Mygc+YphlZjqN7N7KR8jR0YGYdb3HGDiZdNYh9KOJ/4qmddq
	RRNQQyJR+L9z3P45u+ls8clcYTthLAPRBQzbL+S0FtIEyCj7Zyo93OrTURPponA7VvqLks
	C/t6yGNVc4bqVyjv10uFS1YdSs5O7l4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-FTpMHe7YNH-_sRHGbnYQGw-1; Thu, 29 Oct 2026 03:22:10 -0400
X-MC-Unique: FTpMHe7YNH-_sRHGbnYQGw-1
X-Mimecast-MFC-AGG-ID: FTpMHe7YNH-_sRHGbnYQGw_1793258530
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso12103485e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793258529; x=1793863329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TsAQS4rA4H1iNqLsq84hKblFTfrWhP+kWPfdX+CCGew=;
        b=bkhC7wkX80TDMr0jrySIenQ9LIPQkMEWscjm3Nm+nMoLwgMgpJH0BntBG4pfwxmbBz
         OJwQkC0P3UQNU2hXtETahje3JM12DZddx+qi/bT+XEIkZNSEBgs+xvtB1xE9R9mKZgb1
         t2U1rV/PN9Jlx5DwHWFTZxsIF95/r+lh7nZciqdsb6cO048f4VYP0Xd65iRPR2RWN2ll
         bT27LzKkM2+YIHSNKugU/rYeQpLSPe2JHaReH0pcjmx4gV2lj+vPyGElk7nD6vMuuVrY
         yiSC3T2TVmo+1VLlV7HvwG4S6Tf0TO55c9QM9/i4V9NlW8ouKYURZjhuuvWjIwq3byX0
         APmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258529; x=1793863329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsAQS4rA4H1iNqLsq84hKblFTfrWhP+kWPfdX+CCGew=;
        b=eccPEOni+0pKjB9QRnpUL3MCFl5H7sgthaTnIgxFPPFS8+4+Q75J9ltKAQmCv1EaDu
         V4UUyWt5bqCJQCxqHnzSee2Q0tLRyT29y5WXqR5cWFx1SI0KJ7V5nSkuK6sGSFrmVfN9
         WJFro6mNVvSo6rC1JGkU7bKWkb0vuTBOT18tOa5vMx4cXuOu5ojPYPHwGes2gPymdTpp
         1lC6DVaSU1wNYNaVfKvC1tZp47i0ARuKNjcpS2WlXVmSF5NcQbWbn3BPQFcg7LWWhfrq
         2MFfaJXmuMCg9LtKLwNvEwUUpU7nMAMKa2unBpqxC1hBw++iQd5Sb24hMeJq/0Q6ULEj
         ltyQ==
X-Gm-Message-State: AFq9FYLcT6HgzjYi6QbgXi0BJGeWKg18mjFaNy50U7F9jh8NB2XqtAvs
	tVInKTz/wEoHV9uLmKHKE+tyfFhagYCIZvOCG+MpgvacSaDvoH7mTEDuvWO6akjjr6fZEpIETOn
	yMMuZryl8iW0Ex13bkI4isR9Lmx+cDz1kH3J8HYNSkKxqwhB1GfKCgbc6X4Xnfx1ZEg==
X-Gm-Gg: AYBFou1ko/oqDBflABAMUF1FC7VC3fhysx9GMZOZA/cTbCMlxlBaARiHQNkFL3ES4hT
	h9WBXZX/USPzPaIfZ2QbqpHLyM56pjHRJKwhYXvnHJT7V46RoZJNBqcM5vlCEmSYoVXEYRM+owp
	jSmIt+ClXdTVVvpHy/hdCNNu+LK8rMaj/sT/wopOiOyI8LGVMT8exSnpWjFvfA2moUY5IeZnuKu
	NS9ZhjiL8xTYwdK8y07CT75TcUmkQ+OT+/aReSFiPH2sYlVkge1L6N0EZ5vulPksGLUvUMxKGX7
	pN3kZLUM94xGFDstVt2q0JFuzizEU98kUH8yxwAN1A2OBUZ0OghFji+nPunJIe5WzRav2E9TkVO
	gB3Kd2O3UBeaODbs/uN//FLAvwqmrRVa96zCCdJHVLs8=
X-Received: by 2002:a05:600c:811b:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4a967d96eebmr99427665e9.32.1793258529395;
        Thu, 29 Oct 2026 00:22:09 -0700 (PDT)
X-Received: by 2002:a05:600c:811b:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4a967d96eebmr99427315e9.32.1793258528864;
        Thu, 29 Oct 2026 00:22:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm31993080f8f.59.2026.10.29.00.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:22:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 03:22:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Chris Arges <carges@cloudflare.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Phil Sutter <phil@nwl.cc>, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH net v6 0/5] more virtio-net csum hardening
Message-ID: <20261029030932-mutt-send-email-mst@kernel.org>
References: <cover.1792768096.git.mst@redhat.com>
 <20261025094449-mutt-send-email-mst@kernel.org>
 <20261028154315.4b9f3077@kernel.org>
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
In-Reply-To: <20261028154315.4b9f3077@kernel.org>

On Wed, Oct 28, 2026 at 03:43:15PM -0700, Jakub Kicinski wrote:
> On Sun, 25 Oct 2026 09:50:24 -0400 Michael S. Tsirkin wrote:
> > > Apologies for reposting so frequently, I know netdev bot will be unhappy
> > > with that.  But Paulos's report made a lot of publicity, there is a lot
> > > of people looking into this, so I feel there's value in defending
> > > against all this class of issues sooner rather than later.
> > > 
> > > The issues were mostly found by code inspection, but all reproduced by
> > > me in a VM.  
> > 
> > Ok, I looked at netdev bot review, and there's another issue.
> > 
> > If a tunnel inner packet happens to have a valid header at
> > inner_nh_offset, it will pass all checks, but the transport header can
> > in fact overlap e.g. the real TCP header and checksum will overwrite
> > that.
> 
> Sorry for boring process stuff but FWIW the last patch also does not
> apply?
> -- 
> pw-bot: cr

I guess I need to rebase. Still don't have an idea what to do though.

-- 
MST

