Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362384;
	b=fNH2PdIR9vP8SIyJk7qj4xL0oiZnJ7txliFCuoM3AmvTUs9ulPgKAGnbE953yD/Idix7
	 gHdo0kHaveaftt2t5c9IqT+VDt2DTOP633IqXVsAfhCDTWrjh6qPSZh9N1MopUmgPbPJ7
	 fK6lvk3CN32s7ZqDju7AIoGe5KI8nJBhIUgdJimHGj8px8ScuaPWgfRqzAXanSspb4kAd
	 b/z1Y20JRPpKPpHcLW8BBsaYfijsoeXGCxyh3suD3l2M9wK3JrzWD0hGzGyzwwMTzSxbQ
	 hSD2Rro8zP5SxFvjTc0Jgg6nyXlaHrzJcHLqQWnH8cxD3Hwz2CJrs5GJJYrC9jY70kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bZKAADSfZoWv8xOE7quCSCjhwlCNy+kog5o59siXEHg=;
	b=PwzpWavuEdIYEdhWeV8Ov+GTBb6IH0U0OpuoVA2TTi/m7yuRlJXulCiK7YDp/R0Y31DJ
	 wU5sFT4Z5DxDEathA67PD8LQ1cY/4SS5WjIhKjnmmlY9KDe1Ej07V6XhEJZIFoTtMG/3r
	 OM8MyZOseIvfvL68U5MoDAdpzh4BA5s2pCAvhYHIcpvmOZUEWGM+vrUUqMl5ldWO+D7ze
	 rjD1+EfwNzLtU3oKF0RW89swIjnSWyQZgmUUPIjxh7COht43bH3Qbmz/taRLsW3zHsaZw
	 TR0E2UXtd1TrilEsP5sHMeZe2dbqIlyd7fsfaxaFbZFkK7+pBP3x48IJbREtKOwEBRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=D9IrWoMl;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76106606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76106606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=D9IrWoMl
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c7a0c1617so10473726d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793362383; x=1793967183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZKAADSfZoWv8xOE7quCSCjhwlCNy+kog5o59siXEHg=;
        b=D9IrWoMliC4j7FfiOXtcVKJm+6NPKZ6oksqPyUCd5D5T1WgTVWDBvDlmo2f1Z3q3MO
         j1Vc4thT9XcOp6QH+0T2vP9E6ph+l5bTz5lHCAeq7+R1INkmfUuZXpPRY2FpJQ3AhD2S
         QTL1r2v3tqmelcOR9L3xvqtEXpZAdtFGtgQpfER/CI9AknxmZuBRpWcMc/ukm75y5+ZC
         r5GskGgMpUVtHzeigCwLg23KbIb2nAU3pAJ1eKUEPQii/uM+pbTyNkkCWvBSaDAAxlH9
         izMaevRfvvVccHb1YxdklPrs/GIL2ua+YzeTEr1O+BYLatProI3m7/ReKdzkz8XjT78o
         OwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362383; x=1793967183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZKAADSfZoWv8xOE7quCSCjhwlCNy+kog5o59siXEHg=;
        b=fPMMaxXz0Q9YDIyBUdRQh/MuUDbpLG3TllZbtC74paAXRKipIK6DPB1MnkwlNkyRQ7
         h/+kfyQNch4ftrh3LYWBXMVFK+2KR4Dxg8w463TiUxddcB5JLlT11jHwmQ/DbkNDY+Pw
         4TAhxWRUVilCQXkemCWcjDrUJ3DVMXi5PJJv4+14NhrvIe5rzU3fPtiMraMKu2QakN+i
         02GfoO5TGv/1W9Xq6gknYOUKcVX6lk03QWoKArTSHZY6/oZyVkWCR0/8XHtFC7drh4CJ
         DAB//JD1+sHledJsf4Y5TOyz7Odr0gq/wLXnd6VNATNCuN5PxPCrKX+b/T+RHHX9Yuz0
         /qdA==
X-Forwarded-Encrypted: i=1; AKwUvBwPEmIRQdGHfUtMBq9dRpwtdIv3IxidMgwEzFC0Xhfi58ZgSsojCd/lrczihmVvm2oS4eyVJDgkxUlxcLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaU9ePSU0oAxGeNu9NGtc4vBeiMC/AEalgV/g60yQaPFhSbU75
	rfA6QWbyMFuhuFrQ3npEPEjiHkG4lf5PswInD/C2yiJpoFqWDf3DkXB8Q9wc1wVc+pM=
X-Gm-Gg: AYBFou2VXgvyWq2EHELpX7QHSUJqAhl+Ioo1Oyq7aT0D7Zb7aHrs96P3K1UU7kOR1fn
	S2BOh//Z7RWQhYWqKUNoppuLhlnDoCtf+kw2adGJbENZGbrZb6euKEx+I4NALNBrRunpKl91N2o
	L1Mr6cTZ1oCvw4JMamcApqjZnULyrqWeAhRIBDtqBg0b4K+xg4pl+Fz4JDLNOXGM3eFsEuESj7L
	5wutlJfj18U0aUlPrfySHdkIxpSthe7H97qu08rS5GMhDh8ZNr1zKN6O39D/kbRoAERfKMD/38D
	DjgmxEuf8xLWg1KpfkePCe6LK5GXk5b2Bz46CZJQOXxyqBuAf1euTcjrD4wIcqzKgp0aasSxb/d
	4CA5K2rmUDHG5RwkSx58jHzoG120tSvd+GbUDqAgokh4A1cfv0UXnbYXGuoO+C1Ku4TP3cAFScQ
	RU9QyA7Ycjd0CWy0cI3hOqL81MP92vp04mwQg3YapFhNsT0T6fo0Kp/Tx3A9DRugB2mDG/WP+vL
	by/a/qqFAoL6N1E+dg+bfx/HRcBsHd4A4faDouT8N8rr6DL9FfqoYTy2bvbFE+Ixyf3KEVFB+ka
	Ovp6smw1bqjhxblymnb2RhacIfCTusx5agdl2tNWHObDGEznBBu8nFOcYD2AJQRBSxq6BFDZQzD
	CvSNL7hSZySa4ENxYat0in6SHOf5Pc3PM
X-Received: by 2002:a05:6214:1252:b0:917:7d92:6486 with SMTP id 6a1803df08f44-91ca4a0c511mr31768696d6.6.1793362383132;
        Fri, 30 Oct 2026 05:13:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7e24001sm13957666d6.3.2026.10.30.05.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:13:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMlTf-00000000Zek-2qdZ;
	Fri, 30 Oct 2026 09:12:59 -0300
Date: Fri, 30 Oct 2026 09:12:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Samiullah Khawaja <skhawaja@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>,
	Alexander Aring <alex.aring@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>,
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org,
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <20261030121259.GC3889730@ziepe.ca>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <CALCETrXNEWQNPjtuHnTfVFOafeJ7APXq288Cq16Q5adDNYx9+A@mail.gmail.com>
 <auEksxfAi9lHFXmT@google.com>
 <CALCETrXDY2e8x2kdr-FQvFLs-Y7FwNozXGDvqqM6yvVA7QLV3g@mail.gmail.com>
 <auPKfqh_YjRU9Ui3@google.com>
 <CALCETrUEyfvaEGxMHo=c0ia3CDgSxg-YW0_=Z7T31Ou+pvicuQ@mail.gmail.com>
 <CALCETrVpEP=HxVqdSP_AgA=U7ignwAgjz5Vi9+Z9dZsX5DXeLw@mail.gmail.com>
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
In-Reply-To: <CALCETrVpEP=HxVqdSP_AgA=U7ignwAgjz5Vi9+Z9dZsX5DXeLw@mail.gmail.com>

On Thu, Oct 29, 2026 at 07:11:25PM -0700, Andy Lutomirski wrote:

> I can't shake the feeling that the problem here isn't so much that KHO
> + iommofd doesn't like this but that the behavior in question is
> nonsensical.

It has been this way for ages, like David says if userspace shoot
itself in the foot it should not be surprised by this illogical
behavior..

You can get the same nonsenscial thing with just mmap too, you don't
even need a memfd.

Jason
