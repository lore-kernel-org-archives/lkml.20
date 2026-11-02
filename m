Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640586;
	b=z/xPKKokMhtOjbfTEWd4p3an603XFmlq1Ke0WnGfYJDAccjSGdHAZAtkKz6Rmd/2TVWA
	 v0GxEDoSppKK0rga48V590kzjvaqsQmN8KIBlttJZmoNusfCW9G56+V0ntH5cMbPyZdIv
	 A+Td0G3drOig6ocrmrQdgVwUr/jVRhP/SXC3c+oFsqXVYxSbHuWFRZvhm+7ScO7q+JWeZ
	 gJis/bl16+j221XfNNJIa3nnOdPpEo+q1XKkQCfVLW9FmEr/jriRIviMeMuznkflk/Xxp
	 HKG0GJclJjgl5bOf4Z5rxPTPJAmI66OkQhEtzceG7T6q+1h5KLeBnKhQ78YGr1boDKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=lBnwm37qIsrm7xDbTxm53J3mLY9DT6w/4rBjRvoMZdE=;
	b=yHH7hVrU4lR4raVCuTMkYXBwajV4XXwDQT9DTTnwy6o0mgB7wPQtGu/Vq9FPxMzmBBM+
	 gY2NXCqPsXCpFlJjtQYCjiEZRQnKMpNDIpDw7J3MgVAGxUTMt+pxx2MGl8IwYwNKrBsL3
	 EXvZb1QMBPrtpZdRxr9Je8s2l+jSpCtjI9Nhyw0OH0Q06+AWR8TblGC3tpyTauIf+xUKf
	 I/rebx5XrZpGjQ3dDLzFNNwEQMsZRJnJ44zbLZQFDnw16oPgb8BeF3hvybUG4ZKrxh6YQ
	 6nqLmP+p2ATMQ+/JdRNfE8P9vefG/WgJt8QoZn5QZLuJvhHZotRNHZL2TLJg2W9zWkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VljADhIU;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3704606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3704606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VljADhIU
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2007474f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793640584; x=1794245384; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBnwm37qIsrm7xDbTxm53J3mLY9DT6w/4rBjRvoMZdE=;
        b=VljADhIULemmV8tvaeTQVmfqUsL+izWnCkC5oYi4KOzrHim9grJRjRxHOcWm2EPF3r
         Wclx8JcLDz+igdrUFF4fi6Zdm9tcyYE1BaFTCMpYiJWRLBBXP+QCxoytS3PgZqsHJPGW
         +bDUd9LIjDcG065kFmpe0R8+P+kDeXGL49AQnYz/AOxMW1kaMhpEpy+QXQk/8bo+5loi
         wm5PMfz+1kRz6N2L26srC31WaEOZi5zsud25l0uiivStl0eIf8TeDxVcXrisI0bff9lh
         8mzV3C7fc7D2F+ROsUuvar2jSoEJA0as2si4RkMu89NHk5jwkTbNNOEzjfZNZCv3Lf0s
         2NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640584; x=1794245384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lBnwm37qIsrm7xDbTxm53J3mLY9DT6w/4rBjRvoMZdE=;
        b=UnPIhaI2/ArF6QcFRjQAme6NknWLC1b+DGBOzAb5R+EcrSJwrVkHQN4vOzE7wXBIaP
         gZI/9ptGdHiFbOOq9UFL/ygrxy7gaRwFUFjBs6TVExhcPuFMhIvzilePmbjWt3SPXAFK
         bjGLzWkrrrcV0RKUnTge68nkvqosMl2LoE1yxZNLpFE4OpWh5SV202KqAFjGYmjSDNSv
         BjR1JqKqctU4iIV+KW3lsYPSLehK57QB79khBwPm/Rywk17FVn+Y8J/XZ10sg+SRCdpg
         dhrCQkwjRKtswzCNim/lwVc8IaKk15ZBeLQViXlCei/RNqsy/V2bksnz22glEnyMx9lG
         b9bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaoqfdATD+m+hQRN+LCAFYEoTdT7OdlrS5TrnqzOOP9irmLdwFTUQBjpHcvmemc+NU9xL0aqTollrth7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pdOk8FfxuvKrmk4sm8zBSh3HMFYr6GdBT046Lnjx5MNKgKbKQ
	lOP7l4+ddwvkO5C3hiv0aAxqlr44n97cZrNyjYShiMPdxyY0wE9cL60SOqSI2/fW0Dg=
X-Gm-Gg: AYBFou01yn7kh+sfx/Yr7p//7hM0POBt056q2OSt9rxkxMYu9hlAdWihDuTcF6hbX7h
	6EvrhhxfxBZZDDTIgmf7gb1oK65QfERtYkMDPuXTVCLCyjmWF3DhGv3SxZt/ABGtoZdgNOWz7Xf
	R/+Ll2y79pUizcE2/aUogmCev+Ag/Y5MZErsVii6BZ00Bh/y0totpxjRUq+f2E2eUc4qGnl01Ep
	+ZA/MosQuu4K7jWb4/X5mZZnbOZQNoTMLq8ZnodpZ91U6oPISd2q8g5Q1eIZkhxLDudUO9c6XtN
	YODeuNa3WZwYPrYr8D3POtT+5dvSaIUuNrgsF8PDO+Fnd9vCp8r0EhaNMKf7L9yTTpdhM9Lca+u
	GPEq/cpAwAX+Pfw8rrLwlPL731lqFl1nq7U9/3AMOKKF49+R484Gx1kaKiRNkO9UYZQY41GXvGy
	1aPgjqPS8hZa3Gj0i1cBza6FNEOUeXsa64tbvPSkFcBZQ0Zme6CpErEckfqQi8UpD8Tay8kRQXR
	Kx6MNubUpuC2gXFWjeVFBfKb5qNer/T7eOXej+MJa2IGaJ0Vi1UGp+OvxiHfetgdqTP4owaQpWq
	KYzTKCWlwwzAGyc+8D3INOW5bRF7iZRA31t2k6Q=
X-Received: by 2002:a05:6000:4b04:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-48e6e4f8ae4mr26540418f8f.42.1793640584164;
        Mon, 02 Nov 2026 09:29:44 -0800 (PST)
Received: from localhost (109-81-32-81.rct.o2.cz. [109.81.32.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80306sm22600959f8f.33.2026.11.02.09.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:29:43 -0800 (PST)
Date: Mon, 2 Nov 2026 18:29:42 +0100
From: Michal Hocko <mhocko@suse.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Tao Cui <cui.tao@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>, muchun.song@linux.dev,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Tao Cui <cuitao@kylinos.cn>
Subject: Re: [RFC PATCH 0/3] mm, memcg: isolate deprecated v1 state from
 struct mem_cgroup
Message-ID: <aujIhsampHnzcl_5@tiehlicka>
References: <b36ab4a7-b692-49e8-92b5-1dc4d76dee00@linux.dev>
 <0BEF7489-16EC-44EE-847B-A6AA380BE11F@linux.dev>
 <32e80536-64e4-4ae3-a7da-4a37ed415f0a@linux.dev>
 <7ia41p9341lv.fsf@castle.c.googlers.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ia41p9341lv.fsf@castle.c.googlers.com>

On Mon 02-11-26 16:52:44, Roman Gushchin wrote:
> Tao Cui <cui.tao@linux.dev> writes:
> 
> > Hi Roman,
> >
> > 在 2026/10/30 14:05, Roman Gushchin 写道:
> >> I believe we want to delete this code sooner than later, why would we rewrite it before that?
> >> 
> >
> > My assumption was that v1 would still be maintained for some time
> > before its eventual removal, and the goal was to reduce the coupling
> > between the remaining v1 code and the shared core structures during
> > that period, rather than to rewrite the implementation for its own
> > sake.
> 
> I understand. But personally I don't see big issues with the current
> code caused by the v1 stuff. Maybe I miss something...
> 
> The proposed changes on the other hand create difficulties for those
> who use v1 and maintain some local changes or simple backport upstream
> fixes. Of course, it's not a reason to not change the upstream code if
> it's justified, but in this case I'm hardly convinced.
> 
> > If the expectation is that the remaining v1 implementation will be
> > removed in the near future, then I agree this work becomes much harder
> > to justify.
> >
> > Am I being too optimistic about how long the remaining v1 code is
> > expected to stay around?
> 
> Well, Idk, it was considered deprecated for quite some time already,
> so maybe announcing that it will be deleted in a year is reasonable?
> 
> Shakeel, Johannes, Michal, wdyt?

As I've said up in the thread I am not really convinced this is
something we should merge.

-- 
Michal Hocko
SUSE Labs
