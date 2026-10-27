Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136605;
	b=D8ftZPJFdP9YSkA1R87H3cQ0ND5sjknZq9yUR+CArSEAeAUUYt55hk4FUaJZzt/0JfP/
	 niWayYsOh7mBzv/JMrYVDQafyi9txNNYEtEwZiiUatd1ajPnQhRs1fLDvvZ0sXYv65BZv
	 uDlH5qQiikDYVYFu6OZxskI8jXOd8cWR0H/C2K8GJevCRrhPsTFaje2uzSEWWOSJfW1qn
	 iEOl1KngDo7+nsVjDt68ABJZ7aGvtyKTgrapvegwYg7dY61M33ObmEwnSNCdPfhBsmrPW
	 KJ09ON2fOlrZlMU2BnFsNrScQrQLWFN3mRFn2XtI7h8VaQJnot0J5xDqH1h6uM7XnGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136605;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=h62RQbHCN4jYYnI4HCsDoNJhT/SvAu6VniCIwMUQi1c=;
	b=En/5iy88RzQfHQeML6oAfWeEkjyx12zK7Pg/sIdygjcmeTA1Ynrb4lyouNm1hDWKpQ/B
	 qRE2xwwo1R0bMPeYEGu01qNLlgie6+TPsfbPnYOtLntpXk+wg78bdYZKLXF1WO5xpek1g
	 RIOSZbmbMrXeMdDXx9y3Pa+PUYt3DtpEXeJTY1p7A3swYp0mPmlWHfbx0Gs0vZ7i+xipp
	 Z/epqJpn5slS9KSAC7oEbCeS4HY7DlF1i35Xlx6AzzxRXckZUdJgaIIadwuPkEjjBD9yB
	 iaEtal+Ro0pAgN9iLI/rKoSdBLG/T7iDt8V5D/XvXM6fHOKHNcCLGquKejTZnNX33Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uj6KvyLd;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8C8606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D8C8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Uj6KvyLd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793136604; x=1824672604;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Erwsend1mndK0SW1NuLrrKcjtadjWzVZXkakCqhyDRI=;
  b=Uj6KvyLd1xQtOV1PUnlOISDTaMODe25JIdVMV1qakxFHaBiJQoo9aHBx
   j6fjgYGppEDRLryE8cs7hWV1p/fNrFuDzb+m8jUYbonmeHAt4rGQBGflm
   R3lfhbsMSTa1x3gZXm1zaDA4JtYHL66wwbFOX3RPnAckGSB+VhdmXA5rl
   yqacvSFcYuo/I+DTo2aMxjX94iBpn2P9Gew+UB22SBSoFd+S2dpq9/na/
   KbTXHF8xCfbIr5YdORYnCMdVF44E2qtnZ9sxDYSnQXPO5dabVeQXZTZK4
   ovrRqgEHiKGp0psbX3PgyU5gHLiGK0rWA8P4GAJMqMrB5gf9KrVuTGCKj
   Q==;
X-CSE-ConnectionGUID: pTdDEoeYSmaCmI2JfgYIAg==
X-CSE-MsgGUID: yWNcpZ39QYKBsewMXgaVCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1881252"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1881252"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 14:30:03 -0700
X-CSE-ConnectionGUID: zA0JgX2tQuy+3qz4O3YUeA==
X-CSE-MsgGUID: EeGVrouuSUaELzegzYgTfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4651688"
Received: from unknown (HELO [10.241.242.209]) ([10.241.242.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 14:30:04 -0700
Message-ID: <361569b659ccb6aae7c0d9935f65e16f472eb2b6.camel@linux.intel.com>
Subject: Re: [PATCH] shmem: clamp negative used-block samples in statfs
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Hungyu Lin <dennylin0707@gmail.com>, hughd@google.com
Cc: baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2026 14:30:03 -0700
In-Reply-To: <20261027163653.82661-1-dennylin0707@gmail.com>
References: <20261027163653.82661-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-27 at 16:36 +0000, Hungyu Lin wrote:
> percpu_counter_sum() holds the counter lock while scanning the per-CPU
> values, but local updates can still proceed. Concurrent allocation and
> freeing on different CPUs can therefore produce a negative sample even
> though the number of used tmpfs blocks cannot be negative.
>=20
> shmem_statfs() subtracts this sample from max_blocks, reporting more free
> blocks than the filesystem's total. With a one-page file being written
> and truncated on separate CPUs, GNU df reports negative used space, for
> example 67108864 total bytes, -28672 used and 67137536 available.
>=20
> Use percpu_counter_sum_positive() to clamp a negative sample to zero.
> This retains the approximate accounting and does not change allocation

Nit: I wouldn't call this "approximate". percpu_counter_sum() is the
best-effort accurate variant: it adds up fbc->count and all the per-CPU
deltas under fbc->lock. The lock only excludes batch folds, though, not
the lockless local updates, so a free on one CPU racing with the scan
can make the sum briefly dip below zero. If an approximate value were
fine, percpu_counter_read() would have been used instead.

Maybe something like:

    This keeps the existing best-effort accounting in statfs and does not
    change allocation or limit enforcement.

Otherwise the change looks good to me.

Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>

Tim

> or limit enforcement.
>=20
> Fixes: 7e496299d4d2 ("tmpfs: make tmpfs scalable with percpu_counter for =
used blocks")
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  mm/shmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/shmem.c b/mm/shmem.c
> index d97fc32e7c94..092bb45a076c 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -4005,7 +4005,7 @@ static int shmem_statfs(struct dentry *dentry, stru=
ct kstatfs *buf)
>  		buf->f_blocks =3D sbinfo->max_blocks;
>  		buf->f_bavail =3D
>  		buf->f_bfree  =3D sbinfo->max_blocks -
> -				percpu_counter_sum(&sbinfo->used_blocks);
> +				percpu_counter_sum_positive(&sbinfo->used_blocks);
>  	}
>  	if (sbinfo->max_inodes) {
>  		buf->f_files =3D sbinfo->max_inodes;
