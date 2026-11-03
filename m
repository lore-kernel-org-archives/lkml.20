Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793667278;
	b=Cq4nT8jCcckkfIZA8emW2OUpgHTHdWwE8/nHilWwnvMQA56+1sRDSiiT/rrmfIrdbksF
	 wyO7YgU2BrVCatg4f4rEs6x4iLvlcpMMaGkhLZHGg49Vnn4J57T80ZF95b0BmaOvX5QQ7
	 mOEO++bE6w8yIwHp3WzDfoFdvRHyv59T0dTzTTRQ4115rlJglOw9mjobJoWEB4422Q/SL
	 KK5huZ8TvDDnLENtJHsOVvPb2RNANOi55l1Wtrv2mpuC2mBMXJXRtw8jyWfAhCquZQQGS
	 EHu/I+JVdWBOG2WzhTWfj+EW6WNfjETYZ8nh0g881Ff1feILa0F0YZB/YDLy+Ia8aVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793667278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4CRzR+sjBX6VsuFNx9eyTn0HYGGxNmmsAqwo1yu/UIs=;
	b=JVKHbl0mr5ivhcaQm1KNgsPWPp4xJ6Ex5i3gBRXIiQ2x9Khy7oFYEW+eVNHeXeQDX0Mg
	 0v+Ag1SuqR8uZ5jilvXA26OHlRFzgL0LS+xs1r+V3hLSpaxYRUtYLngtN+cV+IjnimLHn
	 pvagSeWxoKTCe9ZUVnjY8ZBZHNFkaAkpu3jogTG6cZQ66raXXOEgPpVD0Hz4xpx0js+3i
	 dLAqDi+m+k4NjXEn0eIVyw+JojApUG9yTXo9p5vmaWnGo3P03e40IEtXqSAh3R6lgD3mf
	 xff+WdnnqiEhPeuiKPFQY6vhaYjyZEdvsYDYMZBeCPcptdnIRG3yMVjt8dx2TtIB39Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KviEatYT;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D86A606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D86A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KviEatYT
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1463102a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793667278; x=1794272078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4CRzR+sjBX6VsuFNx9eyTn0HYGGxNmmsAqwo1yu/UIs=;
        b=KviEatYTCIe1F1JARjiYMmm0IkQvlTlh+vAksjy3ez66bujdFRZbGuoM22a/8Df7GQ
         dqAiaJJ/eSXd71fyyfygKa7D0On0JxLQ0AVk7/auMm8Nwv1MpiNehNqGFXkZm8/tg8H6
         NzKyLzB9UagV8slm6uiWZAs2IAvfv7bLeDFkqMz7BqxtLMFWHiGesb3XBkUkxlT75Cid
         pVxRQTB+8Wh3DjZjHfbsVFhcJfyd+h4aSCKeGkMOgLDxBWw4JGFYyyybHcOtIgNM9f8t
         zjEjQI0iouSAbFxd33BQhSTXw9isYjuyz1kwVKh1+TLV06gCTVYOSDoqZbT8YId59zo2
         gqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667278; x=1794272078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CRzR+sjBX6VsuFNx9eyTn0HYGGxNmmsAqwo1yu/UIs=;
        b=SiHUoV+9UWXJinkXPmahzYxz3njw29t71meEIwNEj2WkuDBTYrUUefzPShk3DmeU/n
         xw+VyUaYYnRwl23//8s0nTHtI0n3+BKoaO1g+9OTGY3GfKxE4VezS+q1+td1YT0hmFb4
         kHRWF68GLeRgSSEJyDWNdWgxacZcXxswOInWwyV7N68FL0ZTYk7whvUQnQMgwXJDKqNz
         iNPcymjh7XnhjgYdELgslhQXVPtnCAIxUjRcM1sJlrfncd/KxFkZxLxj3F+/bBIV+9nB
         D4VF4A965Ib4Kx3SPNMiC7F2IbGUbYfWV885G2lH8RbbNEjoKKLEx82TJvE0XCMKBflE
         im7Q==
X-Forwarded-Encrypted: i=1; AKwUvByQRZ5IROeYCcoIq94zhc1sxK/hfw7A9oqRMqXY5V5na8/N1nP+lloLrCvCD98Gf+Q9mHnHXilEuMXsLjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tZzgZpxENCovwBO8D/gK0PveCo4EBiKUh65m+aU83m6pWOm/q
	Afw+l1D9CgZ//Mj+Z+pshnha7U53ueZv05TY+C9/Wz+RUtYZYo0Sr//UyWuwuDAojA==
X-Gm-Gg: AYBFou2NYd0tu7IOAPOvsUl+IwDxSI3kpMY/PG8kd4qHE9WWZcf6oP8FnUUk2r9sKz2
	iK5X9/+0Pw6ekzNPlRLxMWG8Av5HSoHbcbftC0wtTH1NDpBU8ik7EdbdsZin2Z0Yga3YCQb175R
	ldTmAV0FPEfFnAMBQjiM1o9OanwmIqO2PsPWwJbD/26PyVLwS3QwYWfO0LuDgy4Wem4JX821xif
	sz737+4nPPUiQQ6tubyhmgQ4f95sfk4QyDg2Ng8rmo+C1MdGSkHJX94Iq7k15CeWFEtC1b9JOms
	BrqJwnRmBNfCeESGzu6/vEi/DXtIV3Iyvy6d4Tobmb9j+1404WYUGTVyDAQ1RPljts0q7mJE8/Q
	DnYZO5czMMvVY16HS3H0IrX+Xpol559RJ8vuRaitor+8pBd/fHP3dn5ZcETE6c77sJ4m8sri5mc
	oh5xBb0IEXOFaeYe73J0+cy/aWLVOVKGCa6PbWd1DrZj2/UKAErlkCMecwin3PF7zBclVKf1ZbB
	mi8MHixYfE6KI7iei8VKGrPCoTFU2Z41a/gj/YBQcYUgfhkHkpaB4w4trjQutpE/lvz1xOT8cQs
	4WH3JIxaYYFisouz29onqvVtZLszzzegCyZEeqvDUNRXTahBXHdGWjNzDzHub0GDkw==
X-Received: by 2002:a17:90b:590d:b0:3ad:1da4:2ddf with SMTP id 98e67ed59e1d1-3ae8980ed29mr8608648a91.51.1793667277032;
        Mon, 02 Nov 2026 16:54:37 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85cb1bfdsm10260602a91.0.2026.11.02.16.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 16:54:36 -0800 (PST)
Date: Tue, 3 Nov 2026 00:54:32 +0000
From: David Matlack <dmatlack@google.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Peter Xu <peterx@redhat.com>, Alex Williamson <alex@shazbot.org>,
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>,
	Matt Evans <matt@ozlabs.org>
Subject: Re: [PATCH v3 2/3] vfio: selftests: Add vfio_pci_find_mem_bar()
 helper
Message-ID: <aukwyHVkAXGEFI0E@google.com>
References: <20261102230445.3993629-1-almasrymina@google.com>
 <20261102230445.3993629-3-almasrymina@google.com>
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
In-Reply-To: <20261102230445.3993629-3-almasrymina@google.com>

On 2026-11-02 11:04 PM, Mina Almasry wrote:
> Add vfio_pci_find_mem_bar() to libvfio to locate a BAR (or range within
> a BAR) of at least min_size bytes that behaves like ordinary memory and
> can be safely read and written without device-specific side effects.
> 
> Detection is backed by a table of known devices, starting with QEMU's
> pci-testdev (1b36:0005) BAR 2 when configured with membar=<size> and
> membar-backed=on.
> 
> Suggested-by: David Matlack <dmatlack@google.com>
> Cc: David Matlack <dmatlack@google.com>
> Cc: Matt Evans <matt@ozlabs.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: David Matlack <dmatlack@google.com>
