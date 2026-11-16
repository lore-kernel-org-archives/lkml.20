Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836963;
	b=UjttySOQv3P7oGGm70k9ZuH+cSbTtyfk4YD2RygJxmhO9DFzeFe38CuKSrvZh+Z9yJ2t
	 Hm1PnS15mAsb1JwJrWatPrFLluep8c/X+3T3vEB+QBX4q8l2O2OeCkeMRe6InNqNCCu1w
	 tQRfUQdBply8cXZL1pwyS7WMbvPn4d/cXb7qh4uwnQOQqRu1bce8ZCFCmzRoA5nV9mZOn
	 xPJuXY1EGKr9AiNbTpUFzihLK3VwO85K9i3ZmDXlqMXHsfhzRrJv3hbaX78iXBYzJHe7m
	 HtfWhwwPw/4uKMrA4IvzZ6XlVN5an0L8Q3yXqqKZGV+pGv62IL9RhdvjfCBhGGFhnJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HsBOAvHt4DPYJf9JK1qI+m0zGVz1UopZeMnslAsrQqc=;
	b=zIdCLxLqs9AH6X1ktoueAr9Phya2PiqaBflbajD2Xj+M0MOGd/Wr0ngKbueCEOJC63Kn
	 FDcXotE4AAR2jm4aI56yCzBGfviy1Rb2LsKlFCf/xo48dNt6ElcSzlDBVHqozZBisYR4m
	 WMvefIRgnrNKKH3mju7l9SaVxEwtPS6wtxJdUwEPWHuE9LWSVd9gaZ7gIzHAkFjX80z8X
	 Odmq9+9CHWXedOj71tcKdFsCXAIYNK1yBZBxgS6y755egCEr2NM0VbYX/C+DrzV4Wpm7B
	 t98/SCwFYyUvdcm7C11bH4p0I/5JUSOlR2wtgXZMXkKTWVphDyDAVcUY/EM/1DLQc5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=O3upmHsP;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A73606A898
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A73606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=O3upmHsP
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9496400270fso210365085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794836962; x=1795441762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsBOAvHt4DPYJf9JK1qI+m0zGVz1UopZeMnslAsrQqc=;
        b=O3upmHsPwNvkKSxtQnrME/cX2STCqM/diy/RcwXB6LzgKvEb+9NMhFAQ/E2egCzA5g
         Mg7c5CkTs1b1fuSWpVz2KDcNZ7Scj5FKyDFadQHLv1lJ78inJrgshxU9uJORXBiazJQm
         V1QWM7K325dojKmN+IzGBU22GRUgKqbxYUptJt4VYoyyvbW1amWzFCR62mY8AXggDzbO
         /efWueyAHRB+vJiWlhpVdzR+ybJbUZTJDD6+1ngGLno6AVI8/WWRaGdmaAl+BAps9XUA
         Ux9kb0M6GiHNOhTzSbtyiyZBUZmAIqPPZWUtlIq0iP8uQPK6jP44r44lS0tcM7F4QLzs
         mUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794836962; x=1795441762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsBOAvHt4DPYJf9JK1qI+m0zGVz1UopZeMnslAsrQqc=;
        b=KqypjtOYDFlB2fh2vmtq4g95pXyYfYaPcZ6EVjuTBJSqq58Uk/qJJJRvFTpEuCqSpH
         9wbJ4vVQjoG9afwQwRQNXPnagom0KliIMiMNa9QPeBpETg1MDK7Umm5DVcdTbCbkJH8g
         oRlz0ytxEKecgNKeRyKEsuD0KqY0Rcv0Eq6ffAeHmQLY3gSjEFLaSMynwZzk5UPUKDUt
         rqxnEDAscNUc3lACeDtZQAKIi8GP/d8clnhDdvyfJ7S1zG+pW0fMeIhTb4dvCHJWgVHx
         N6EyKKz7FACMtYKrbK2YTR5xo6zd53YFc2AwSQV/rXfdocweh4vB1WE3qXMNldwStrU4
         /RvA==
X-Forwarded-Encrypted: i=1; AL+hErFu3i5X0re3enqhJOcWX9E/y9RYuUo91CXTiv5djcY1DsSSr8kaDv1UZUBUd7tgfqosJ7O75gW+FZEfcPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cfMv9uqHz0zkb7B04Xw4SxIIfT7ATfHKcT3/8X63jMSWi/iCo
	lNncHTacEmSRIiESOsk9E1myhrCjzOX5bdNmSl7IwaEsHC45HvmayHB24EcVWDz7bLA=
X-Gm-Gg: AYBFou12CS0V2R+jFEIQDZiSE1rf+afpOH1GB0JFxFB3p8XD8FCNFkV2uRVgdVtzMG8
	gHuuHgdAvASfIvsKQ6Ws+m7qhGEKQYy1+w+Vv5tDN+55LesR+gfV8mU7vHVMD5raTJfLjsWh51h
	8mt8B5fxm7NCyNUKbi6Ykp4u1/wqwOba3rP7oFoVbkyX8tnGbgDEXkEb4N4JnaXCKvd4vrgLf7y
	EyHZq1/wKJBTfomkqLFyh2cOJ5t8YYdOwDU13CR2Dn7RmwWAcwyNNmIYG6AC+bsgbDo3NTdAnOP
	Ur3xFDXv6toOn2eSKyGxCJtNQKYOtsKNLmlGSXLsUDp5i78BSWlF/XjRauo5Hss3IBe2ZdVkeN+
	nB8DCd0solbyQIjZbl0qZEkCkx4F6H+K7J2IGSxE7tWBWpkvdgGvu2ETur0WvMM3Bw3I2DhrukX
	YnkaQ25s0Agx50aed+nmEWMkF5PUKfN+cKEPdcVGdsZouURGjwQUJjS70cUPkh7BRj/N1BLhQJH
	kFIP2hLrDAuZilHcZUvph1URCdG/THr1XjtGmow6PUdrWc7/vwP+sTidVtaAv7LuJKJTM75sqA+
	uDMrew==
X-Received: by 2002:a05:620a:4155:b0:947:7691:731c with SMTP id af79cd13be357-9494bccb8d1mr1678517685a.65.1794836961959;
        Mon, 16 Nov 2026 05:49:21 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9496bfb7fa0sm512919585a.34.2026.11.16.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:49:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSx5E-00000009OXj-2xNY;
	Mon, 16 Nov 2026 09:49:20 -0400
Date: Mon, 16 Nov 2026 09:49:20 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiahao Xu <xujiahao@cmss.chinamobile.com>
Cc: Kevin Tian <kevin.tian@intel.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	syzbot+7666ed2c3d42196bf7e3@syzkaller.appspotmail.com
Subject: Re: [PATCH] iommufd: reject mapping an iommufd file into an IOAS
Message-ID: <20261116134920.GK2532299@ziepe.ca>
References: <20261112105945.285526-1-xujiahao@cmss.chinamobile.com>
 <20261114004101.GE2532299@ziepe.ca>
 <20261116113808.560717-1-xujiahao@cmss.chinamobile.com>
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
In-Reply-To: <20261116113808.560717-1-xujiahao@cmss.chinamobile.com>

On Mon, Nov 16, 2026 at 11:38:08AM +0800, Jiahao Xu wrote:
> Agreed -- the blocklist is the wrong direction.  A vfio device fd bound to
> this iommufd holds an iommufd_ctx reference of its own, so it reaches the
> same cycle, and any other fd type that can own an iommufd_ctx would too.
> 
> The reversal looks doable with what mm already enforces.  memfd_pin_folios()
> accepts only these two kinds of file:
> 
> 	if (!shmem_file(memfd) && !is_file_hugepages(memfd))
> 		return -EINVAL;

And how do you let dmabuf go through?

Jason
