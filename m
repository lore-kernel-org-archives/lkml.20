Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756682;
	b=gL7cG7j8fvhJ4OiAIrMLxL9J4V60zyBZMMGVpeHrizyl965EXEON/ax5vm8Tcp4175Dc
	 sGvn7vZtqEOnrG3uLU7LJEpYTOmeF6K98/czpAYT86NG/69VSAey0+mYz7fIfZ7ZRCdb6
	 xiJrPccIKdQYSt6jRD69/wiHXOXNdJC3/9iI8996BJ2Cl6fyxTQTrr+nXKq//hA5F7BOA
	 Lzm/6KviEcVS0ZgT3kQaPoLU11UPCGReoHNSyOfTk6VaeD0CYqQdeajmELJLRrur+AiNC
	 HKS5z4+l7vMopNvay6zMsR2eSg/NYe4scDcwsIFsKC+X1f3XB/TnmJK/AKOJMkQ63Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756682;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ouHno9MQwl9g9I7VXxGGEQRMBGY89m3oWexuYnMaLYg=;
	b=v2sb/0qnusUCJxygVsSWWJT+3Smzzcs8J6JWvSkjId+K7RQGwaEM4Lh2deLPPgwxNMzo
	 1J3CXOW5PYdXc0le+a3aCSRYuMXrUiFbewsSGU9CbquJVafp+EMPSCRk9sSxNUHITAG97
	 xleFcMhWOgvjqoaVzi6LgxuO7tnnoI8++UOMb/GM6idM9HUBbSiBY7kN2pnMrS8XTk68z
	 33WAc3VxLPORSwM/x8N6wtknghYp8rVPg+5TYPLzzahQDG/Cg3W9BcvRzTrRY2ZlLZcek
	 V0GBDn1M4N4FFQhcXKCob8bgKida8zrApkJ+NjWZFPeG/wEi8gOwCJVqDp1Ph3Ovw4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NfrNZSom;
	arc=none smtp.remote-ip=95.215.58.125
Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957F6606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 957F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NfrNZSom
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZidFtH1/LnObjsGNvMsrIN8j2jFRHd//7zJzoyuXcVg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792756678; v=1; x=1793361478;
 b=NfrNZSomapIGotMnzKQ141Ht8EqMJ7W3EZbPfPMNMiYjh/9bM26MPmLPaOm8MmwQClF71wJf
 MkBDifIoWcI80GYDyDYMxQYFiEBoNboJKcJBvTeZkfeKrkkQEpIKojg1R4Z+hS9N3OdZq3VqK2k
 ITnxZTYLpTFNFUlilk3r0uhU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8a40efd914636a4c;
	Fri, 23 Oct 2026 11:57:58 +0000
X-Mizu-Trace-ID: 8a40efd914636a4c
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	tjytimi@163.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@linux.dev,
	pbonzini@redhat.com,
	seanjc@google.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on host-writable leaves
Date: Fri, 23 Oct 2026 19:57:47 +0800
Message-ID: <20261023115747.2545223-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017030927.345454-1-suunj1331@gmail.com>
References: <20261017030927.345454-1-suunj1331@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 17, 2026 at 12:09:26PM +0900, SeungJu Cheon wrote:
> +		/* Let the slow path handle host-side write protection and CoW. */
> +		if (!(pte_val(old_pte) & KVM_GSTAGE_PTE_HOST_WRITABLE)) {
> +			ret = false;
> +			break;
> +		}

Thanks for fixing this.
Tested on QEMU 10.2.1 with a private memfd mapping and dirty logging.
A guest read followed by a write corrupts the shared backing without
this fix; and with it, CoW occurs and the backing stays unchanged.

Reviewed-by: Jinyu Tang <jinyu.tang@linux.dev>

Thanks,
Jinyu
