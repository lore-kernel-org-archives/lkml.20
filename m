Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289039;
	b=q+Wz42o+pHexGAkWC5p1aAZ6/igocKITh6P2iZiBaC0pE791m7aJd9PFqb8XwFpQ9gCs
	 FRSSnaHyjvFS2V8y4ZNHA1opGw0Z2DIC63yZPCOkq2jXiaFQnxMMfx33Dg2HM1EmuorhN
	 fFe9LSUVG6x6CHDfBT3PHQzabC9kYr2yxM/Z2mbDhQn1aEDj1o0YIPefXYbxJVNXEkWC8
	 jim1Qd/ierLWVD4385qCVs20fSNsIsyRJl0thhrXeJ3DpccbzPAnq+1YudhuUUfoF4FWV
	 kDcYr4EDk3G4frwkZMiWKXEoDg2JeRPj6Jsr4qC4ZwfBRiZFxSa3608HQYKd29lOvdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289039;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XTXAk3xXPUgSSlYSBEKFxO0EtkwpuyrpEnArRai3PhQ=;
	b=zrZvgTIBthE+ic9rIJBKr0E3R52MitPw+mKr44kvLLd9P1+360InMSHkhSJM7X4U6Hck
	 vX8oYbewEQfN/zb7LHUzwhw5Rt4lSxXbt4R7nHlGGxm0g8Z3q1hxXw5uqUqDT3+lEl8WQ
	 YeXSnfHiNf/eVJWPDLRHyr80r4tG1ppBil03axmvHQ+rwMyFG5FscgiQ/19n5G4fVTQUu
	 mfhREXGbdQFZcXvT0OFRmqtYHiw/bvNp29UFNHB1jgi6YHe487MEtSU3Tm/uyL8o3NJNc
	 B/qRrB+f9quRLS7wkj9nz4/7X662YCsRMxs5HCnZCDftqMmXsYWbQQtOlm2VGIhQLzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c6ShX5G1;
	arc=none smtp.remote-ip=91.218.175.176
Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB93D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB93D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c6ShX5G1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B9FHC8KG/+vE+zt6AKqt5Y1CXop9kLlRG+4oSR7pzX4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793289037; v=1; x=1793893837;
 b=c6ShX5G12BHdk4iC+1Q8QmcPf9oJqbJSJDKyV5CbMmsgHQGjOzHc+mqwVSuYFbbeStQbmcyK
 IhH6VHnoEUG5xvF+8qdGtjEss9H6L+cZ4Xr7bD9bHFtA8euD/SHoQNWJ5WZypU9KpMw9P3/u/Wd
 wwVjKVzc9nDBuebRosBXu4rc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 112fd546f967c449;
	Thu, 29 Oct 2026 15:50:28 +0000
X-Mizu-Trace-ID: 112fd546f967c449
X-Migadu-Flow: FLOW_OUT
Message-ID: <174fe1ca-7b5a-466c-b20f-fccbccff6eff@linux.dev>
Date: Thu, 29 Oct 2026 23:50:24 +0800
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
Subject: Re: [RFC PATCH 4/4] ksmbd: send READ payloads with MSG_SPLICE_PAGES
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org, senozhatsky@chromium.org, tom@talpey.com,
 chenxiaosong@chenxiaosong.com, tj@kernel.org, linux-kernel@vger.kernel.org
References: <20261022092514.2590010-1-huiwen.he@linux.dev>
 <20261022092514.2590010-5-huiwen.he@linux.dev>
 <CAKYAXd9SW_D1gwMhD8gVjVJAcPoxiXvHB0TvDLqnjw8TpGCKRw@mail.gmail.com>
Content-Language: en-US
From: hehuiwen <huiwen.he@linux.dev>
In-Reply-To: <CAKYAXd9SW_D1gwMhD8gVjVJAcPoxiXvHB0TvDLqnjw8TpGCKRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/24 12:44, Namjae Jeon 写道:
> Order-8 and order-10 allocations can easily fail when memory is
> fragmented. Since MSG_SPLICE_PAGES does not require physically
> contiguous pages, could we allocate individual pages and use a bvec
> iterator instead? Please see drivers/nvme/host/tcp.c as an example.

Yeah, I agree with this. But I tried individual pages with a bvec 
iterator. It was about 9% slower than the high-order page version.
Anyway, it still faster than the original copy-based implementation.

Thanks,
Huiwen
