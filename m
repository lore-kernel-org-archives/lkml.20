Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EAC36BCD7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895848; cv=none; b=JMotkxoeTEuCVr7wk0VB8oG53/y9zxZyJYUSqjKVEIrXuqqhnqCU9+wj24L891d4aQKJwdlTm8bARFtPakJ4zVC5fhC/akWoQp+pU1oFX8MeyBsEg8kLglwGTIgF0HdtbGs8cD6X2p4zQ8vrl0/li8K9DocJlAPpqhLf5N2Qr4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895848; c=relaxed/simple;
	bh=fPZRNhyMCEnoyPiB/GgGqCsgkGR9z4NvEh4rI13gOAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewMvLPiEQrtSsXuAzakcTFoOTfgFXiN00S6yflVnPD29xr3y4TQ1MHp8CyvIYZKvB8J39m2mYn7OvXP6nn2lrqf3Z5WynD9ewLLDok44Ot3/JGbAzvBbVoepJD4ycA1oPwLsHrELAuODd4g3INVldEPFGYM0iKEKLMA2lq9s16s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=CGdW3sge; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="CGdW3sge"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91053c27a91so25088716d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788895845; x=1789500645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3WttAy6W0orVb3NoJtGLqG6U4/hKJf2+6iPVBiF/I+4=;
        b=CGdW3sgejiDOoMppwGOMrrJdtwf1NR6i249HyhRLeGxswuqzlinKXnoZZI3qmYfA3d
         A3RbUB1GSszahP15tjcy6wAOo1IyOz8ubpNOUGHhZSJhlsyB4N4Hv9hnJf/lSzqG+DGf
         vOBhL5LCXvXnuDkwxbKq7GprBSig7YMMYOp8aijyNuIuw6a+/OH1D5bSDvaw5IhvUdsm
         uSRuqoIj4Uxfhts9p66qzSqumA9Bif92p9+UPaJ0f/qH77Sv00dgCbxYwZf12htGJyb5
         e+xmvSo2IuVNg9k78TqW5nMpPaJqchTpKMQXLJeihd//JFKJAtJo862F9P3sssmQmq5U
         Hy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895845; x=1789500645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WttAy6W0orVb3NoJtGLqG6U4/hKJf2+6iPVBiF/I+4=;
        b=p8/uzfK8qsSUEzW8pcwZG/ti3lzs17+36QSWUyxJ3fJgNS+VO+u87N80NUMzTSJBLi
         5lLR9YBAoNFdqAvpR4hBGxVM4+2baQqm7UhBvvrRS3EqMAmXoI1/45LcL7Xe6KMLeN3r
         mn4ej7vwYpqarOUfbEgFGbUfdElSFcxA9MzKPLyBBtUWTgt4gBu19d0e13JYd/ewC0zR
         tjU+dlLCGWbBuFi5uXovykYBA8/G1UE+AeeTF33GzzL3NlY/rh7mOR6D1OgmPnWjC7PP
         B4s8p9kH3KzUnUXDm1htsWJz45ZlmG7eEJLiHv9wZgIzmSC4hUcIxvJba82ov9+5oQZw
         5RuA==
X-Forwarded-Encrypted: i=1; AKwUvByLrsKn/bb/859ivSUn7TJD/kuryIVvTLBJfOJ9ZdjWhJJScfoqwp9HPOXycGbDNVrVaGks637vCAsaSZ0=@vger.kernel.org
X-Gm-Message-State: AFuF++ksA6z4REi8PCtnJeYz15A0w8lxyYt+BfLqD+k/ygp/YCAGXihQ
	MBwsR/mclDjDFRKCo6kn9EiVdPGHgNu08aGU+lQbz0NYEMPmz+1/CgHps8H6Y2Bezj4=
X-Gm-Gg: AYBFou34vx/q0Fxq8+EVaMQFBN90oukFgT+mSU5qyRMEzfWbG3yp4AaPAgwTuVzJqwk
	1ynh1Oc8r+I35p3Ni0qUlAYBaglR/O8iBL+0xEzlrePZCkjNk0CB2ckvKh+ulJuZKoYjnPs0j9o
	ivyxprXCmALQO9zb8ot4GAyCCJVpmPE8WvNVzkBmiy2YbK+B6/zU/c44TzJ3ntK/9GKk3jt4FaC
	4i+W9EtGHAKzMICrtfTMo0DvOmhlAu797yUVRj3Hc7BhCIv52FENf2gR4dJLKdAgOqE/ki5E3ey
	ggcht1P3FI1KjmNqJzYC7uDCVr1NuPHZX5wi0sVpIT0n44q2ExLmWl80yY56dPYRIVsT/t4mrvJ
	6pXQW4ty1N0GoS2w0bKUWd+gBKigFpQLiKaDpv+jQLJx3WbNB6HIyIoGuJO/TJS6ZriUYN31FP3
	gSoNs1XcdEyLVYGSct+ehCsgxnNoGpiAWxxN2a7wqQFd9MEeDs/AX0G8tMYc4=
X-Received: by 2002:a05:6214:20a6:b0:8f2:5a3e:c619 with SMTP id 6a1803df08f44-9103efc8ccemr388761516d6.4.1788895831865;
        Tue, 08 Sep 2026 12:30:31 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910464bf898sm105133986d6.7.2026.09.08.12.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:30:30 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:30:30 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	Nimrod Oren <noren@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Hugh Dickins <hughd@google.com>, Nirmoy Das <nirmoyd@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Message-ID: <aqBiVp405v2srvSa@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@kernel.org>
 <DL9XL8T6UG93.1T1NSJMI8PISK@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL9XL8T6UG93.1T1NSJMI8PISK@nvidia.com>

On Tue, Sep 08, 2026 at 08:24:38AM -0400, Zi Yan wrote:
> On Tue Sep 8, 2026 at 7:54 AM EDT, Vlastimil Babka (SUSE) wrote:
> > Given neither of the patchset versions achieved universal acceptance, could
> > we try just disabling all the automatic (re)calculations of min_free_kbytes
> > the first moment the sysctl gets adjusted from userspace?
> 
> Sounds good to me. Johannes, WDYT?

+1 That sounds good to me as well.
