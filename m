Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345183;
	b=s+v8FStTtj3fKtPEu3rafyI8Hsk3ia6kgupCr76aO5oqyZ/2o7of5NdoyAd06PxNTqhw
	 mlpM45VzqBfUd/C+V1ascceix5+6Z/bBUFWEBp3heFsbcxr0L3b8qb5K86nfUkpPERFuL
	 GoO3wFxyHqEWR7iuugitldqlbneFFAnr0QWHBsLcnZrsnOv9fdCtT96SS9oroPDcR12lM
	 qBs5TVtMTYOpZWbRwIBIeEPOyu5+3hqshKFEQ8+VYBz5SSuf1AENtPXkecrucAmrlRrmB
	 LG+19rlx/ut9SqIaExn0oOavXEFqZSwbCaFrBG36tJzhRsyKUZfyuAbXsJY7B6207lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345183;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=NyT4TGT6hgIR8kPb90iUAjfgRkiqKdm9uwcXklqZWrs=;
	b=a/mExMfybju36HwgTR4GQ8/drhopIzesEHYSoggEqVGjFdhfGZwmFdzu1oW4/vhSnBLY
	 6HHcIzX6YvcG8silnZmNzYaRD3WFjPswBUn9SfDT8w3lvxFfEg/qFfakLuqb51LL/olMj
	 Jrt0lk5HWFsBHAZeh6J94cBy9bp0rfysown25JnKLIH3PoGAZ1gZkuqY5hx1FZqi3du3/
	 WzmN+akNkGVrcZB3zDHsQ8BBMR/cnI2BdxCUlq0ZjmuZNwiAMQp/hmP+h+eYFhGqXJ3wE
	 saRPPdWmPjJWEklagc3iom4vdzv9vDKSTLIQxlfH0tYeQBpI0IxCKroQnbQszqwMKWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Wne11m5w;
	arc=none smtp.remote-ip=91.218.175.52
Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71518606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71518606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Wne11m5w
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o1OkAFsPF7Db+QblpcO5qVWk9d0XdGrhsF15SUMl9TM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793345179; v=1; x=1793949979;
 b=Wne11m5w8ibnL/tbl4S/kdc+uich8+U+kfITNaoD4FsK/4eMwQJaCUMHwwqHPOijy7nf+vbV
 YpSGTLuKHu+tAubORY8F/X981+YI8h5iG/SC8cB8QKQ2o4Fq082z8P2Ns3R6/LOMyuEtx2/MnAa
 IHocC8lvDB9StmEMKkLTWFlo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id e84fa612ede8427d;
	Fri, 30 Oct 2026 07:26:18 +0000
X-Mizu-Trace-ID: e84fa612ede8427d
X-Migadu-Flow: FLOW_OUT
Date: Fri, 30 Oct 2026 15:26:04 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Mina Almasry <almasrymina@google.com>
Cc: =?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Joas Antonio dos Santos <joasantonio108@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	syzbot+88435e204734072bf39a@syzkaller.appspotmail.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] netdevsim: reject port addition and clean up
 ports after a failed reload
Message-ID: <auRGjKzYwpK6WRqU@bogon>
References: <20261030001444.289973-1-omermetekaya0@gmail.com>
 <auP7VyY3MGqOphL-@bogon>
 <20261030064245.4118081-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030064245.4118081-1-almasrymina@google.com>

On Fri, Oct 30, 2026 at 06:42:45AM +0000, Mina Almasry wrote:
> On Fri, Oct 30, 2026 at 2:05 AM Hangbin Liu <hangbin.liu@linux.dev> wrote:
> >
> > Looks Joas has a same issue fix with yours a few hour earlier.
> >
> > https://lore.kernel.org/netdev/179324296598.34505.11070163314749859668@gmail.com/
> >
> > > ---
> > > Tested with syzbot C reproducer.
> > > v2: drop Cc:stable and target net-next.
> ...
> > But yours have an extra guard in nsim_drv_port_add...
> >
> > Leave this to Jakub decide...
> 
> I prefer Ömer's version. Once reload_down has torn down the device and
> reload_up has failed, the device is in an uninitialized state, so
> rejecting new_port in nsim_drv_port_add() makes more sense than
> allowing ports/netdevs to be registered on a half-torn-down nsim_dev
> and only cleaning them up later.

+1

Thanks
Hangbin
