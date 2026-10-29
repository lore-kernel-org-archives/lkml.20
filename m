Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237561;
	b=lNFNw3HpNbepRnK9rB4hJ/IE9iGUA447Dg4jeC4HTLVmXo1ySA4pzttdght8s6uioFIc
	 qpjITkI4cWBspgxI+ElBkBi8D6a2342oe8CWKXhANUTPjQgesnstFGs15V1GF7AK/p7LH
	 tic9LoH6mw7HqY1YABx0UoS21xP2y8fWzXGJEBxiWn6hzqE9aXO+0hmvNpSdeVRJLtIKp
	 T4jMpzCtKLsKSP6j7DKt/1Ye5QaqC8JYEOfaJc6HJ7Ibfgnod8q67pxhQ9EPswjOioAnA
	 fxtnB7C6+V9q/8l7NZLE+OL3+VTkjM8pGPD9nNrqZH+A+fDmgUCxninnu8sGoAsNPxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237561;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hz8ZSO29ymk2Pxs2l0BF7OAQ9+ikMPxW1OzAHC82fFA=;
	b=v7YZakJwxlDEjimQjMDcmBA0gfSZLlpX+xTWa0bdEYNz3mtmQEpVYFxC7oFf1EAyTZkU
	 YDoMsOLNHt9bHG+zxrAp/qKG2HFIGWteC56umBV1ycRTa5nBoFpeykS19PFBI1d4l6XSX
	 ebHV1MvdHHw/xQQPsgLWHsxuq82xpjI9N7IEfO/oSrx0ZAXsu0fCuwZZWIfFzaCkP2hen
	 CGgVzN3Cew+HXhbDhe2XdINgZqBduVFK4PLwT2Mj8cCfJWnk9Re3SKM73szM6i4W3wnXw
	 Y32GgH07z9Aks5L6CIFYsAylKZAt/u5V88WUW5k3CBSRmwe52aLtbGqKJSbdYkdCc4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9UJdwEz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46269606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f9UJdwEz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C8D1F01828;
	Thu, 29 Oct 2026 01:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237560;
	bh=hz8ZSO29ymk2Pxs2l0BF7OAQ9+ikMPxW1OzAHC82fFA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=f9UJdwEzaYCSo616Gb1fRD/zS5YtKiRzyV4UgJx/z8Dyc7xKG8cewsfSgRJX+egA2
	 iP5L/GTAatEdVmlbyHf0sBrPRbbZj+NHD/DgdEjUz6VFS/Nhcw1DaDlpIMDG+lThxf
	 48R6/g7rpAgbSVvxGWAXA2iNJ7D8tGiRaWDQp5DKEZS1iiVxluFO8hD7jAZQ9RzYuR
	 zfNdApHNmUorkfuiiM3IxKuv9bvBphmFTnyLhJP6G9zYSKOA8xHOzVeYC+MXw1Lsro
	 WeJsg176zDJE+4SgpCSobSnoJ6yb6iHdT5i/QdSsRy1Hs9vv1uTA8IopJL09B+QCjJ
	 F2u9G1o7dfESg==
Message-ID: <dede484b-8f07-4ccb-86c3-b80466e49717@kernel.org>
Date: Thu, 29 Oct 2026 09:32:37 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v8 07/15] f2fs: prepare mmap write faults for large folios
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-8-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-8-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:43, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> Now write protect `mmap` also need to support large folio,
> Change `f2fs_vm_page_mkwrite` to achieve that.
> 
> Note it currently marks the whole large folio dirty
> to avoid data loss which causes write amplification.
> Further optimization is welcome.
> 
> The folio_zero_segment() in mkwrite is extended to zero the
> post-EOF part of the faulted folio for both order-0 and large
> folios, so the f2fs_zero_post_eof_page() call that was added
> to cover the removed shortcut is no longer needed.
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
