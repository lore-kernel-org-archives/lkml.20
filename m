Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675995;
	b=z/nRIdmmevmB+Y0ZrkEeTpGuQnGm1LSaSMLAojU1ly2JhfqbAX84zJT6YsXlvUSbNkuV
	 bPiSk+TRdo/hh4R5KA+jYU40sTf4q9N41hgQgAAWKmRzt94iN918V3ouhJGRKHhuo34e3
	 98L2Np37bzLaiSky3hnR9MNRPBJLqo0xgYP+dp+dnqK5JirQl9bC/yzWxHfjl4hKNpLZz
	 CEapkCPWRn8FfekVzrNnBGp4z29JFQZ4EAEaRLElDGLAlcUfTebDNCEykbY8vVeM8mqRg
	 zj1JaEYcgr+1IqieVe6hhfnklsYiA7oJaJ3Ua2iX4+zDNGbaksSIkY2I3O4HKYguiWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675995;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=I2mHcP1mwk6dUHtT8vIUdtDocr92q0IuVaHz+943o84=;
	b=huKZzkrCl00+4UGuXFLUtKLvNzd3kqSZx+zBSCh12Fh9ScirKxX1kOJQUGXnKGmzU4Rj
	 EZ7RfIb7tiaHZ//GgzzNO5Eiv0xiKtYHP/dFGON7AyW57UIrnkFcPtuOxXWQkvxh29Wuf
	 6QZ3+i3BpneJYSBUIPmIbAyBIWkEOkNR2jFC7PEBuwjliMaN4ROvzlHXAoQsK9pmKBVI+
	 umi8zxDNV9j38zqsA8Xz0KSabcbjxOCANAwnKuVgdYbL/AHTiL+IG2f5vx7khIjxJrWnr
	 4xO7NruAZlUHgM2ZyETQ8PRQYtWhixivjVIKJTQooI1dNe2y8AdN0DcfpKnBuLwSTUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=JCihaRIK;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63A606A331;
	Sat, 14 Nov 2026 17:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F63A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=JCihaRIK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	From:Reply-To; bh=I2mHcP1mwk6dUHtT8vIUdtDocr92q0IuVaHz+943o84=; t=1794675993;
	x=2110035993; b=JCihaRIKHFr9WNgPriGP5Msto+tUKCjXFE+5glKqOyOHWj/7qRYEytuabwoYc
	QpXCIDnFs0qMZzy60AS4k/Udha9dMVff36WziTzQYCqyEAlKcShMhqoNO8cfKe1zD5557kEnxRku3
	rBAkV/0WEDEoROmmiBuXGXxKnU8P8r2mNo9xkY1hpz5nASKZSdAznyIWIehVgNzCe3k01I92dGIwP
	PX0P/GtldPOqgW07pB/Q7pABwP0X7TN5UUVMLJGc7p3H05b83E2ccEm+3KSRxVckfHcHwL03FPGdx
	cUkN5IBMmuK4GuiBCOanO23byFqmTo6/TvPN5bzisxI5VljR3w==;
Received: from 179-125-72-1-dinamico.pombonet.net.br ([179.125.72.1] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xSHCp-00AeTs-64; Sat, 14 Nov 2026 18:06:23 +0100
Date: Sat, 14 Nov 2026 14:06:18 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org,
	Mauricio Faria de Oliveira <mfo@igalia.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Po-Hao Huang <phhuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
	kernel-dev@igalia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: rtw88: fix skb leak in hw_scan probe request
 length check
Message-ID: <aviVCqxRQfNvtl_g@quatroqueijos.cascardo.eti.br>
References: <20261113-rtw88-hw-scan-skb-leak-v1-1-3bd47562abf6@igalia.com>
 <9AF24DB9-D92E-479C-A678-0571B1557198@linux.dev>
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
In-Reply-To: <9AF24DB9-D92E-479C-A678-0571B1557198@linux.dev>

On Sat, Nov 14, 2026 at 02:40:24PM +0100, Luka Gejak wrote:
> On November 13, 2026 4:17:33 PM GMT+01:00, Mauricio Faria de Oliveira
> <mfo@igalia.com> wrote:
> >In _rtw_hw_scan_update_probe_req(), if the first loop fails (goto out;)
> >the
> >skb is leaked. It does not reach kfree_skb() at the end of the loop body
> >or
> >in the second loop (out:) since it is unlinked from probe_req_list.
> >
> >Fix the leak by calling kfree_skb() if the first loop fails.
> >
> >In /sys/kernel/debug/kmemleak, after simulating the failure:
> >
> >  unreferenced object 0xffff88810965a000 (size 232):
> >    comm "iw", pid 4729, jiffies 4345008185
> >    hex dump (first 32 bytes):
> >      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >    backtrace (crc 20f7de11):
> >      kmem_cache_alloc_node_noprof+0x302/0x380
> >      __alloc_skb+0x74/0x2f0
> >      skb_copy+0x57/0xe0
> >      rtw_hw_scan_update_probe_req+0xff/0x230
> >      rtw_hw_scan_prehandle+0x4e/0x180
> >      rtw_hw_scan_offload+0x186/0x1d0
> >      rtw_ops_hw_scan+0x61/0xb0
> >      drv_hw_scan+0x81/0x130
> >      __ieee80211_start_scan+0x2e0/0x760
> >      rdev_scan+0x42/0x100
> >      nl80211_trigger_scan+0x53b/0x730
> >      genl_family_rcv_msg_doit+0x103/0x160
> >      genl_rcv_msg+0x1b5/0x2c0
> >      netlink_rcv_skb+0x52/0x100
> >      genl_rcv+0x28/0x40
> >      netlink_unicast+0x26d/0x3b0
> >
> 
> Should this dump go under --- so it doesn't end up in commit message?
> 

I find stack traces particularly helpful in commit messages. The help find
out fixes for bugs one encounter, avoiding duplicate work, and they also
justify the commit.

Cascardo.

> >This leak exists in the first loop since the function was introduced, and
> >still happened with the addition of the second loop, in these two commits:
> >
> >Fixes: 10d162b2ed39 ("rtw88: 8822c: add ieee80211_ops::hw_scan")
> >Fixes: d95984b5580d ("rtw88: fix memory overrun and memory leak during hw_scan")
> 
> Should this perhaps cc stable?
> 
> >Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> >---
> 
> Either way I'm fine with the code, so just fix the commit message. Feel
> free to carry the tag for v2.
> 
> Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
> 
> Best regards,
> Luka Gejak
