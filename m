Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832163;
	b=nFb5WM3qyx/TPKfZvw1i/Emgt4+039YA84EzfD1bFmqN09fsOA58/8lO1QalKT/ZhRdR
	 gLn8CmEOv/dBqQpey6NJxcorUvGnfMF4TgUZHPOMvDvL/kmHhTAUjWcbKQLBaDj1nDLTm
	 LFC5dfYGQsIq64cnZYUNCL6LkhGui47HzWng39p1JH/gP1WJsM3adf3uj7tjsZy1hS/Hq
	 pBau8IpWyhNM2i/050BhxUouBXXW1/nV9Su1ZW0fImZb8nWAvZ2KGTNQRSm9oZ+3DaiCd
	 gaE3YvYJqGTK2MlLA70E2/9OO+toN7QmZu+xnoYNgRPa5jSPOFIqlKOPlXRh4tAwIKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=76+aUQcUn4RSh9/vkGb8GrJJ6hK0vTzaCEd5JGs9ODc=;
	b=dt7M/Ms2IuUTthKpchi+Dj4qGogTPfRDaTgAEwhazAwFESPkCk9Yjj/YasHadglUc9mq
	 gHJeKNB9ljfdhANVPnYQUtHpWYMo09FAuN5ro9JfN0uJPsCwoP7dpll0oNxTsASD5M5Dl
	 H3RtxwKtQ0mbg+LK750Si8UL0FHlgads89E8/JMoglVGR10/fv9lNpiAyXr22QCLgYxoI
	 M6ColRV3e+Goqs4W1nTWU58dgcVNVkwAOWurus5vzL3QDZH5QuXi56MD6kX83f6muvI67
	 UYY3ATUi2SEZ/TRq9QwEC+A74EtHK2QJUZkJRtzbnCsG5i7wTlSlUCNWlgiY/nM2HDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc5gIK1r;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6FE606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6FE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bc5gIK1r
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so951503b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793832162; x=1794436962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=76+aUQcUn4RSh9/vkGb8GrJJ6hK0vTzaCEd5JGs9ODc=;
        b=bc5gIK1rOiKNTqR/V1GB9jM18i60T1SwBhl4NZlMaTtld9M5yRZjVbNgJ/8+MuJ1Rb
         R+UGittyyjUWptyfq3fLhJGu9SrfDQnETn96wqGM94k8RieKsyWvw01K/CN4L4D+OQG3
         uTS1hAKLQrYdIf0uyXwqRxGXKTSwQFd154CH81ZeZj81l2trnkwT21X3EHognDxg4A/4
         ZsAjip1IRND8yVoiiAUXMGNxi2weotMDj7SpnTjV1OF5BGf+zG3NQYqHSp2rzaKjMwCS
         4qMmfVgchGfSMdZxR3/T+LknVr1db/rhVccT1Xz0P95cQr0wwhUoWgo8WXHpESeoVajc
         lSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832162; x=1794436962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76+aUQcUn4RSh9/vkGb8GrJJ6hK0vTzaCEd5JGs9ODc=;
        b=fraP7y3WRnklnjECNd4OTaYszs39JgoJTUhXT4PKXnMwW036jXjjRKwILy5WeI/tFb
         87VH47VZsKWrq0Z14G+ydi5q0EVtG9Eh3ecfz1C9Z5DNsEu65lkdeLCm0ca9BU3QSigs
         sjlvG87JM2h/uFYJZMJHQloAU7D/tsvAELDFpJJZU8iX/aeclIZWaK/CxsW4cYRF89KM
         ZUxfetbvfToTCWkgIEs5ENkNbg5TGxAz0eudoejh0iHCjiSwFrjhVR4/GADoK/e6jsVE
         CglvVoy6giNWFmHCxv2hDC/G+v4NmE0IrIdE6Qhd12ZByZmAEO3wE3yQsGvfJc0PYJTf
         LIDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsT3fzhdWaUwKd9osgHEXezYv3bCbByk5uSK8YUVAxuOiWcsv99+Jy6hnAGLVNWzbWQLGnRe60eCmi3GE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RFahk/NZzBgnIFAkXhAtPgI93UWMGT3XY9BfNyzXjyuIpPBTN
	Gy+x6asxjJ5JeWGID1z9AViCVUwYxhavCMB7w8O5iH4pyDHBKIzJV5Mn1GVQEfksCQ==
X-Gm-Gg: AYBFou34o43IfxoWtKndz7aLCoiCJLhDQE/lifnkc3IblCkhGwEg4G2qjwa3dSRpEaa
	PJppbGWe1U2K1+yI7EBCCf2tv+aiIwXaGO62v2NSqkNrd1djfwg3C6mi9ga7C3tzCieBJuP+kKm
	tA1nqSQoIBczvnepAiL0g7k5I+I5xw7pnYIaNkWgLbO1voM0OvJDR75IFppm90rn1ZqZEIkjhJx
	Vreujjh5kAsW21fQqCB9dFRqWHcP9D2jyF7dIU4MlZ0OqjRAPrGpjcBZ7JT0XdiJfDjtaSD2T58
	AzC82+08J9gA5sN7L4ihvNB3iBzJXQgOds1RrtgXwe8U8lAbkyi9MPpU6eWfI73CNH+D2iL8e+X
	0hm3trpYS1ZgjNe0SG1HN5idLVYGqiwtiL4KPrTj4KojyA8RNDdSNwN2Rahw+tJKpQCHQ06sthC
	4KjK5Ou18/KKWVyjbwIDm7gP1BEx1Yb3WVsfTwrWJwEMGdyPF7hz5mLlHUKZH/+pdm7QFj5l6iV
	1p+p7vY+SCdpE+26hHGqbs397BQuY5YHkYyPSaSeAI9G48xyOooigKKscd84vL0fnqKgTt3OY6l
	JGYgILRV76GSofpYI4LylzPTbYL3Fbhd2/MNLiZjlivTGc01inY42EdkE6sv97m+
X-Received: by 2002:a05:6a00:32c5:b0:878:34d7:697c with SMTP id d2e1a72fcca58-8a9bf811624mr14694461b3a.42.1793832161677;
        Wed, 04 Nov 2026 14:42:41 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b1209b473dsm1079338b3a.36.2026.11.04.14.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:42:39 -0800 (PST)
Date: Wed, 4 Nov 2026 22:42:35 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 10/10] selftests/liveupdate: Add a test for preserving
 tmpfs files
Message-ID: <auu02-iDbVaEL-4v@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-11-dmatlack@google.com>
 <2vxz1p90jzx4.fsf@kernel.org>
 <auuJM8c-bE43NP54@google.com>
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
In-Reply-To: <auuJM8c-bE43NP54@google.com>

On 2026-11-04 02:37 PM, Pasha Tatashin wrote:
> On 11-04 17:59, Pratyush Yadav wrote:
> > On Tue, Nov 03 2026, David Matlack wrote:
> > [...]
> > 
> > Umm, no way I am reading all this...
> > 
> > LLMs are great at generating tests, and I'm not saying there is no value
> > in this. It is just that this massive code dump is unreviewable by
> > humans. It is also unfair to the human reviewer because it took many
> > orders of magnitude less effort to _write_ them with an LLM.
> > 
> > What do you all reckon we should do about this? Trust the LLM to get the
> > testing right? Do we give up human maintenance of tests entirely? Do we
> > do fault injection to test the tests themselves?
> > 
> > Or do we make the tests smaller and more human reviewable?
> 
> We need good test coverage, but I believe we can break this patch down 
> into smaller changes where tested features are incrementally added.

Agreed that it needs to be easier to review, but I'd like to keep the
coverage. Here's what I have in mind for v4:

 - Move the preserve-side checks that don't need a kexec into
   liveupdate.c, like Pasha suggested in his earlier reply: which files
   can be preserved (permissions, read-only and append-only files), the
   frozen size while preserved, and unpreserve. Those then run with the
   regular kselftests instead of only in vmtest.sh.

 - Split the rest of luo_tmpfs into several smaller commits that add the
   tested features incrementally, e.g. one for the test infrastructure
   and basic retrieve, one for the open() flags and creation checks, and
   one for block accounting. That makes the series longer, but each
   commit is a few hundred lines and can be reviewed on its own.

It will still be long, but I think having the test coverage is worth it.

Does that sound reasonable?
