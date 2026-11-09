Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192989;
	b=NcJqx2EOneAq7KBA8WjYbqzZ9PWop2zSZhEL/dlBp00YIfnH4D6jm8BPqyzIo9+1WnBy
	 trAdTXZ2gad0RRiaQVcSgWQ4vU/BPpGukkgdHH1LkVrLvrixdNSsLjyF2VBnikGeZaoDR
	 JIZQCLb0HC7Pzd1CnrYOOs/GQ5sqq5JjWxMxD1HNzptcZCqnia5RU+jR3ugg9z9uhJVhF
	 qLZq53NCAI8MdPvR7oxQXBj8L4b9YNfWbMZ/spm6IYJ4/yDFZXIr1/Xm7I2qkXQpWofog
	 HTwqcjXUXqgTg4AqKQ6wPi/nvVRh2j4OoKrRXJA6N1IpOSrP2QaSfu1Fz+jem0VK9DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192989;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=n+4TwEwtUO3KwUkahtVVwASlPtdRGoMNVNlYwVFyhNM=;
	b=JWw7xLxWqvycWRs8ebQujrJdlU2uyRwKa55UEklBr41vZQEZdF08slUGAn6eIQC+RQKl
	 jds0rHHQKB2y4f1uO3f8U9HzNlBFX9HhPQiwmM8Cv/HjgtFZCHNT3m7wQqR/aR4UdQpRI
	 DPqMOp436FNpw64i3N2DsHeFW2NICP2PTSYtzRVN0CBLPCtfLtj2vjJDqV31zB+FgrfoJ
	 MgU5s+gB60e+Vt9QhzGs1DQYyd64PXxx4iZWkEnbSFpkomk9U8WUKjLhspgjQxU4gRkBy
	 cK/eajCmj+8l68n3kdNqvt/zyFPBvO/71R/9XhS7n1m7yWaP6H4djiJkiUtKoMMvRWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ony5awTA;
	arc=none smtp.remote-ip=91.218.175.74
Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9768606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9768606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ony5awTA
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E6nbi2q9BWguhq7sUJJq5GhBbCo7Z1GUqwFoBaxZTl4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794192986; v=1; x=1794797786;
 b=Ony5awTAgbmLsrGgFLGN+cLVk7IZWAP3tmpT1qrRBuK7dNO0hugdBuUGWBeLt4XIjNOYMq3f
 7ufDpZOF7Pzol6jvJvfzNo6qsYak2JTaZ021ZasCg8mEm4DH8yyv7OPSEEEHd98kmkqwqbmAG44
 vNDNkSGgDm4jSgrI5mi+O+yI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f9c8e6b6d36b6895;
	Mon, 09 Nov 2026 02:56:26 +0000
X-Mizu-Trace-ID: f9c8e6b6d36b6895
X-Migadu-Flow: FLOW_OUT
Message-ID: <f7f034f6-cc88-4f54-a37f-9e9fd2dbb62f@linux.dev>
Date: Mon, 9 Nov 2026 10:56:11 +0800
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
Subject: Re: [RFC 5/6] iomap: refuse dmabuf iterators on contents-encrypted
 inodes
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Dan Williams <djbw@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo
 <ojaswin@linux.ibm.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Zhang Yi <yi.zhang@huawei.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, asml.silence@gmail.com,
 Anuj Gupta <anuj1072538@gmail.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, Li Wang <liwang@kylinos.cn>
References: <20261105065847.196540-1-mengmeng.zhao@linux.dev>
 <20261105065847.196540-6-mengmeng.zhao@linux.dev>
 <20261106104403.GC5668@lst.de>
From: Mengmeng Zhao <mengmeng.zhao@linux.dev>
In-Reply-To: <20261106104403.GC5668@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/6/26 18:44, Christoph Hellwig wrote:
> I think contents-encrypted should be content-encrypted.
> 
> But we really need to find a way to make these checks more
> systematic instead of sprinkling them everywhere.  E.g. have a flag
> in file->f_mode to allow it, which then only leaves the direct I/O
> to buffered I/O fallback as a special case.
> 

Agreed, adding the check to every file system is quite tedious.
We'll look into redesigning the implementation based on your
suggestion. Thanks for your time!
