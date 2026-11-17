Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910219;
	b=cn5UkOiyuKk95z9lnt+L6lVSw6HNHJDgUUpEhLnoTNdHuEz65EkW4xlTlHcpn9B3kIEG
	 m0NvUaW2ocDW1rCJDFixKtxTe6pSvqGGfiqS+oMRipyykONCcFNJ/vzFBhBKk7PzwS/eb
	 RkN5uhkMBa9DJQw4u1+3yRRePeKWWaiLzL8vpXFxHdRIJl2QR37OWUDoBCZvmYcpQ2r+t
	 G4+2ugOlsyVSix3GU7YujmkLxfYnvNnsznXpwfd9LOQLqhnzLjgQ1aqes+ORl8WFqRBIz
	 I9s9b5aLrVRaewlS+D7CyGafHDXLEMpoHzyzw8BEWJvIl+w9ICQ53sfssp2GUGqz1SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=xfBMXtQzr2JQHUojf4ewtSOsAqE+X7FzRw+q2BHepVo=;
	b=EzXWLinQJx7sGHarPlWcQ0gbGaJ4hWuzOcBMkmnA+whU5kr63LBCfsTxiQcEl/1EQrKd
	 4kfN4y/719VZQ9z98NlC0U4DZ3M23BnO781t+LGpTSKFWT7Q3hsRJTUnu/yTkDQDcWkBc
	 pIWDAsf3NghAG4Hs+Nfg3Hx8fnTIXniDqTao0SqyChIryUEpap+XqwX1YmEMgC6dRkjTH
	 RPOH1xNmpd1yGzaVH6mBS+llYS31/giyMkcCYJwskAS/p0N9aSKy1ulU7+mmk5uCxh6d8
	 S/kPC9xSZKfuM90GCoyYgyFM9CBI9u6zwqq28QnGVMhSQlgMnSvXl0xPaup8jROev8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O2Ey1g0P;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C484606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C484606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=O2Ey1g0P
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso4179807a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794910219; x=1795515019; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xfBMXtQzr2JQHUojf4ewtSOsAqE+X7FzRw+q2BHepVo=;
        b=O2Ey1g0PKEfr38weA+uVErvWnI7XwM86CVj+pPkNVdxZgM5wm7lhx4p4o7rZkDQeLY
         3rf0OgiMS59q/32Xlfjew23iJmrzGj5OXJiuDVTxXg4weJm8rX8j46tQs0lgR/C6Krir
         /MwDcW1DAcxSzrLbqe6/Si3sVy9Wyfy2YOEHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910219; x=1795515019;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfBMXtQzr2JQHUojf4ewtSOsAqE+X7FzRw+q2BHepVo=;
        b=PXtvS3jqOFxtSlDqirF1TPzxwJ2wPJarfMXRDoU8ZOtfSCwrObL8q6B8D4/DS6FUms
         e29/jchxrW0hE0l1ZkGaiMvUtrenO9B3+fwsa9lPRqHIfLBckSerJqE4RivjEoFbJfsk
         IHZz1EUwrE3bobwNjxtReamiphEKObQC2CExuk3075NrJlQ1B4ih0P+RqqGbV6WMNig3
         Pih/qUNpOh9O+Dh24KSa+PI1igiIeU1KdQ+So/URdkDrZO55KwjlHD3YmDRqQTYDKUMB
         Zd5D68rtMEq689GiDp7u9m1kit2QEBbV9SoQrIjCr3xRILhvLWqRqvqinroL3VGu83aj
         +56Q==
X-Forwarded-Encrypted: i=1; AL+hErETJBA1opDhswC2DjZAGdWuZqAe8tIXqj875np/sOn78kPp9N9nZpelCYEnh4ukxbv5Gf1F05EYGF7cn2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sfnL0QjFN011aulCqQvLVh3X45i3nv6414PEGXnybpWY1WsJ/
	1YRQxF+LTO/4yTYYESJJhS+3tGZhXWmCOyNYYEFCVFyODDKKQHD8wgVujgFZ6THNf40=
X-Gm-Gg: AZFdTZejRGVwH5EoT0tZQn3OUiQhCqqkc3/SXwBjAM/F6tDxnPrun6rqFL9mJhGCRh9
	TA80HgplTfN0jwTFy1O8R6b3iniLi46E39VWQw9WtqIpfjZ20MorFSv6Q3WzY88kf9wMd88Q+hA
	ZDxwJhLXu1GBvxlLeQhIvDlNcqYZUjRdA1+CFNxHzNdPC2hKnvqy2UeCaJvbdUYnKdsYzZb2ztx
	zAEhvZeXdVx1QnJ8XI40DiYRBhkfK0D5lMLjtTnVNl5XMbXoRODZDHd9H8H8UHrqhXyR7MHZp3c
	TAFgLgnmBo6A1rVsL4OD+gyL/h5lbtc4jwvmn5sP/T0y8Ll1+XLrBU9UTXXnrya2vSUMSJykbRz
	wGMJ+jq+4iZ1ywY56Eo5wGISOwGDQ7oY8DVs4Riun7jtm8U2JXB+cXbtqBikhwhn7D72Phu5jNa
	nU6eJZF/fnkfsNu8DRmgwhTClbNINjz5FWT3yhjSwdzWbzo9QsvEB7pKP/BpIlGq8+MLGryZsN9
	09XFGgVFoDUmRgZgi5x2tZIqQkbGbXeSx0HmbmHCGOp+d+a2KeI7EzNapbQvnohnCahiPQvKwPS
	bdgKmvW0EvIiULWG31HjX9QQpDh19Y2eUNogh/3Gz2qrrvD0yozkSYMYu/ANQ32W0yYkoiK9Eti
	kOZrOBxSx0UM4pRejyFBjG4kB4AyFMf3RMpCyAL0QIqn7aTKcRLKoYGMaNAi4W0uugQCfnoLzbn
	vy0pklP53zNVLfRJmSCk0N+ofu04ePzUOo49NcGXoXWT/NVMyP8V51dSJdA/YaKaUh
X-Received: by 2002:a17:90a:e7c6:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3b1b0d55ce6mr13140816a91.61.1794910218659;
        Tue, 17 Nov 2026 02:10:18 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad970sm3433447a91.4.2026.11.17.02.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:10:17 -0800 (PST)
Date: Tue, 17 Nov 2026 02:10:14 -0800
From: Chris Down <chris@chrisdown.name>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, Alexander Graf <graf@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>, Tarun Sahu <tarunsahu@google.com>,
	David Matlack <dmatlack@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] KHO map
In-Reply-To: <20261116134013.1636689-1-pratyush@kernel.org>
References: <20261116134013.1636689-1-pratyush@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avwoBj5ceKYjcS9G@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pratyush,

Pratyush Yadav writes:
>The main user of the map is memfd. Currently memfd uses a vmalloc buffer
>that has a pair of {index,pfn} to track the folios in the file. That
>uses 16 bytes per page. The KHO map uses only 8 bytes per page with some
>overhead. So for a 1 GiB memfd, it uses roughly half the memory.

That only holds for order-0 folios though. A leaf covers 512 indices, so
a populated memfd needs one leaf page for every 2M of file whatever the
folio size, while the array needs 16 bytes per folio. Per 2M of file,
that works out as:

     folio size   array    map     map/array
     4K (o0)      8K       4K      0.5x
     8K (o1)      4K       4K      1x
     16K (o2)     2K       4K      2x
     64K (o4)     512      4K      8x
     2M (o9)      16       4K      256x

>- Multi-index entry support: currently, while the map is very efficient
>  with 4k folios, it is horribly inefficient with 2M folios. Each folio
>  in the memfd takes up a full page to track. Multi-index entry support
>  can fix this by tracking entries that cover a whole page in the
>  previous level, similar to page tables.

Since patch 5 makes things worse for memfds with large folios, I agree
with Pasha that this needs fixing before memfd switches over. Storing
PMD-sized entries at L1 fixes the 2M case, but mTHP sizes between 4K and
2M would still take a full leaf for every 2M of file. Do you expect
mTHP-backed memfds to be preserved? If so, it's probably worth handling
them in the format before it becomes ABI.

Thanks!

Chris
