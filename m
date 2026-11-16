Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822050;
	b=lCYmL0Mrl/J48dURt6pYg2RxG1L6DkGRAImFZK1eG18zvWkXelIDToTy6oYLRmEB//Eo
	 eoRqb955CJv3/WBfTOKMD++oppsWtmrsl65s/SzOyuqqb7sGQWU1cSn8UawTrTWrhTSBV
	 9j2ozWHggI/EbaDWpg3AhGBppl63aQHQmYPlOXJJhDni8BUMMaO+H6FQ0l3M2G3qT1AMa
	 U1HCBx5DpvJ46kgrMzCIfYIX4o6Wj/hhCWJv2mWUapSBlzwkXnSTwKL5HwE1khv3UQEtY
	 4ur6p4IvPJcG8IQr+w5qyEgCm+Cas4qxmacudEv3o0j7DiuGnX247F+E6DV+n9iVrxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822050;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vGWc8gZcuBkCG2f26guXLgKofivZZ/7eQ0PnuhIv28w=;
	b=o3CPiD55Pmx13IgS89eE1igctQdgr2L+lfJtjm2PpFm+RJdVicFQCHb9Kaw3UlAxvzcD
	 SibxwDwKblb6vooc1vJc2trBaHJBzAg0Yu+9DTt78xDWyGzEICXyDjUvE3/l2UqoBbP+h
	 37345dIkDFBjjEK4Vlo+oObOVJyzPikGsDtKgaL6S9V0vRVfGD7erwsYJavUD8X1GbT4D
	 73A6dg5QcGyCHdDtfLNuLNDMoB9NbZ0wkE3PY+jYe63bJAz+ZNrrS6g6Jz2TyerS90QT2
	 1+NxqQapJcCLIY3vc2Ms61F3Z/iPBG0QCIIASGwjPckoDmKJdeM1CnT0/OMGVA/VG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=hsuzgQxO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E48606A323;
	Mon, 16 Nov 2026 09:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=hsuzgQxO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2911F000C4;
	Mon, 16 Nov 2026 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794822050;
	bh=vGWc8gZcuBkCG2f26guXLgKofivZZ/7eQ0PnuhIv28w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hsuzgQxOEDangOny7xBcoqs80X+Ep7Bpz3AB9ggVCmFCBzbnJL6K8HpmDtmL8FKg9
	 tjiyUsOkqn/zzppcBDA3vCKgZo9qkuvyuq/9k6PVqQ6JHTN04k7fmFiyiXf6yqHMcE
	 gBjJDxQgbBBPD4NATcqj0JbejEc640wL+TtcsBNQ=
Date: Mon, 16 Nov 2026 10:40:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Priyanshu Singh <singhpriyanshu9838@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>,
	Oscar Alejandro =?iso-8859-1?Q?S=E1nchez?= Lucero <aleszlucero@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: octeon: fix asymmetric output buffer pool
 accounting
Message-ID: <2026111624-amendment-bulge-7a08@gregkh>
References: <20261116065730.472784-1-singhpriyanshu9838@gmail.com>
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
In-Reply-To: <20261116065730.472784-1-singhpriyanshu9838@gmail.com>

On Mon, Nov 16, 2026 at 06:57:30AM +0000, Priyanshu Singh wrote:
> In cvm_oct_configure_common_hw(), when CVMX_FPA_OUTPUT_BUFFER_POOL differs
> from CVMX_FPA_PACKET_POOL, 1024 output buffers are allocated and added to
> the hardware Free Pool Allocator (FPA) pool. However, in cvm_oct_probe()
> (err_tx:) and in cvm_oct_remove(), cvm_oct_mem_empty_fpa() is called with
> 128 instead of 1024 as the expected buffer count.
> 
> This asymmetric accounting causes cvm_oct_free_hw_memory() to report a
> false warning ("Freeing of pool 2 had too many buffers (-896)") upon
> draining the pool.
> 
> Define CVM_OCT_NUM_OUTPUT_BUFFERS in ethernet-defines.h and use this
> constant across cvm_oct_configure_common_hw(),
> cvm_oct_probe(), and cvm_oct_remove() to ensure symmetric allocation
> and deallocation.
> 
> This was found via manual code inspection and is compile-tested only.

Please test this on real hardware in order for us to be able to accept
it.

thanks,

greg k-h
