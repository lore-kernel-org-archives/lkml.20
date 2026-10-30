Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362278;
	b=YhC54qzTP5+ER7/g4skH+ljfAGb+VkI1xZ35vSv88kxWJSgl8HRURIvqujoZoYYY0zBG
	 uGkE7qMQJLsNy6tQkxBWPtATQsNoLy1NF5NDEAEsWrPseJk6KEAeViKBb1M56+4oq4Y4z
	 1iONdLii9tNRoa3U4JdH/nIKlTQKDBN+3Ypht+LeRVvx7WygdMa2ddwQoDL1cnJh7KcCi
	 Xg/41w9ReWEXtFmX5mSNVVHYXAsqSpbBzVntLjRIm5x40hL7XSqN/qV5yyjxq+NzhD01C
	 wpwni/hZLXKChzIJX/n1jmDetwuu39foGuo6pV9pluxBfvqzzpIW45BFvAKrJhkk8vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=G/h51dJLYeoxkjlU1HlBvF+u6DEcazEkF7G3j/5sadA=;
	b=cn5GlgEGbZmMCM7G4mNBoxTZsC0slKU/VU61jPTEb2JhZ2CSqvrpXOmsBOmfBYMJoSfH
	 2zC0sMtfWzxFqIgqomMXM7HOPSTG2sIIZ7d+IFkXb01/trF+25eXemVeeJVOETS76bCny
	 9A9qivb6E5WLEUF85h+PyvBZyIZy8GEuNBmEiyKjVhH1VZ4KodOGJyorcvVxXdqMuTvc7
	 hiQowDAirTQAn2q2roqBEuCBhIUJPchTmB4mFphaOYoV0s47+67zlkqgT0HkO2bj8+iNQ
	 l52i8uzy6xKZJlQog+COELD5bzHVdOnO4CKDyDT2MAQ9eMsvt1SJMIZsxwyjN5jj18g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oA0v8sIN;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4B2606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B4B2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oA0v8sIN
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91b8306b9f8so11478986d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793362277; x=1793967077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G/h51dJLYeoxkjlU1HlBvF+u6DEcazEkF7G3j/5sadA=;
        b=oA0v8sINgPPBKIONlsdYbjsJ87rAJ5i6eE5Q3YCIsLvFbiQJhGexz0GbyEDNCCZD6a
         p0MV5c3Uczdjv1XhsiIbQTtQi5Vp2z9yQeVX4ao9fyJVBycBF5kXx6/mTl70TjzMnCok
         G05SbrF0c9k6ZAJLXKzphYMVEDDK1GKw8OzgWBjmFyaaEHgwUvrNLYQr0skqHxH3T6Yc
         OVQx4BFegmIqmLOk6yQ05bXf4dIWwIB1X0cX+CWl48PDaxZ4x/cigd0Ch6rsN8lEPgGi
         dYcgWMLfovRlIlaP8ltfoaB26Jl6NCQ4kppLz5tTRxjKHm2+76osmnaM0MUb41a3+Q82
         f1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793362277; x=1793967077;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/h51dJLYeoxkjlU1HlBvF+u6DEcazEkF7G3j/5sadA=;
        b=iWO9D7bUgmlR24C/JKZyD70K8g9xbQx3gRix0Bhg8NmUsOqOLs1J0WmXV/R9zvI/Xp
         /FXGMp7BMSWXYnHY0Yg2T7/tUfirrXDTty6O9EAQwRo8po0/C7nt3l55hAuy4h4h86Gl
         2q0YhNNpIx6LBF23P6OHc1qxARXhX1tnu8lXEaOtWLxd6KuIIAs1poOrniCgWuGvx42+
         gCOYjd6WLL9abkpi6g34DCj9P8hV7phBBMlTXC17DWBQuSHKX3+E+sBc+eh/Cskg2/tF
         UfUi3v7IYDYI07ocZ+JEOOtOqVLmFNWhIsPz/hbnw2/5FtmESY0A8RFN3LUoCnqmfuyf
         nPTg==
X-Forwarded-Encrypted: i=1; AKwUvBxnB4IJ5/2t7Jz63IkAshAIJsKHxDjCtblISq1d6qPS1xGIe8LdCHgdWV2+uRPktVYFdJEN4Y0T4JUQnI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtdndU9ZRAjsofrLJrmEfGQ97Sll0lZfpITYtg6XPPgRaOm2Ob
	OFmOLuMw2CYakcuUEtKyrxRWLqaKo4M7o7/X2YBfYZHamHOMRlpqZBr4EXePur3YqCU=
X-Gm-Gg: AYBFou3WCr57Xp/BrGO0QhUyd6U4G8iZrqOgfoS074QlCZ725U6yoiyatfvaEDS1G0N
	ghLTO/zXc/Uub5tkrP15OEA0dCOq58gJLzRYRCsJhvdBD08KV/j0LVExUblYgZ+JO9mFYhJwpfS
	XQ1RTq0enBjZrxUVjt/EXtuMTGZs5E98OPOLsSkDPTvT1jnw7uf5s5z1xFI/5F81nCWmGyAqJPm
	NwHVwdwGbgXFDCD+WNgc1P8dZTFurGKMXrldivvlWtSD9oiHXZJ0pTuhpUhy5+NOljrJLrLJwfl
	wJqTNVuKaquY2zIcz7s882DaHXQg/mS0upQ4OyYzjNbv0GxoMtykz9YA8R/PfIgQn5aJYiS8ow0
	EQ6td7N2eQWrVNgME+oW/LPCAokqkNZnaFTVd9M2QK3Nl47cYrl0O2QORJ7Tky99nAIY/gan2J1
	mwt28Mstv9k67O/zL/ESA+bHd6efHESRLI3X9Qx58oV346EhJxWzoxBQVf90URymDRNmR+ftvaP
	oyNgqjj7+qJcZLWTbpypaPkLBrP9TnKCBfSi/vZPkGyAkMreM3e0JZ1Bdn8bUpBSUL40ZlNsy4H
	T0tngZVRmf6AbPyunDiNQ1jN+x+4+prv5q35dQ7/AStu60hHkUEKum8mTjUXhM/HK0PoMLAH8tA
	9+y1xI3ia60izyuKvwIFe1pz/NMRc+Ula
X-Received: by 2002:ad4:5aa5:0:b0:917:848a:43de with SMTP id 6a1803df08f44-91ca49e9300mr29477496d6.8.1793362277155;
        Fri, 30 Oct 2026 05:11:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca804ee76sm14028506d6.26.2026.10.30.05.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:11:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xMlRx-00000000ZRR-0Qze;
	Fri, 30 Oct 2026 09:11:13 -0300
Date: Fri, 30 Oct 2026 09:11:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Samiullah Khawaja <skhawaja@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
Message-ID: <20261030121113.GB3889730@ziepe.ca>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
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
In-Reply-To: <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>

On Fri, Oct 30, 2026 at 11:20:30AM +0100, David Hildenbrand (Arm) wrote:
> On 10/26/26 23:05, Samiullah Khawaja wrote:
> > This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prevents
> > holes from being punched into a shmem or hugetlbfs memfd while leaving
> > the file fully writable.
> > 
> > Background
> > ==========
> > 
> > Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
> > memfd_pin_folios() to pin the folios backing a memfd and hand them to a
> > device for DMA. Pinning keeps those folios allocated, but it does not
> > keep them in the file. If userspace later calls
> > fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range,
> > the folios are dropped from the page cache while the device continues
> > to use them. The pin holder is never notified, and from that point on
> > the device and the file silently diverge.
> 
> We have the exact same situation when userspace maps anonymous folios into vfio
> and then desides to MADV_DONTNEED the pages. Or any other memory backend that is
> used for such purposes.
> 
> User space must not zap/punch things that might be pinned elsewhere.
> 
> That's not specific to memfd, udmabuf, iommufd or anything else.
> 
> I don't see a reason to make userspace (that should not shoot itself into the
> foot) a kernel feature it must activate itself to not shoot itself into the foot.

The issue is live update doesn't preserve those background punched
folios and now we have created an UAF attack on the kernel across
kexec if you don't do something about it.

There was some notion here that with the right sealing flags we could
tell if everything was 'live update compatible' and then know that
these attacks are impossible.

Jason
