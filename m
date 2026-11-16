Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858737;
	b=JhI5MBr6qAyn+Z4UyY9iewbNtXZsV8jlhp7AaHwrmHWnDaEj16f6XOk1LhTxOB5w6+1p
	 WQs5ntI+7Ukca4yE9M5B3h6d84DCqYb0VoonIBPIgGfPkS/JKLtuTs7Wy8krxWKsS0Ss9
	 4TmtWo3EPjUbee9rwnvT7BGwpa0ZFB+BiiVqWmgwWbsuNopyKEOlxn/MNY1dNH46TdpSp
	 8OjmqQXzcOfgSfrEGS8Nt3oExafLGYRpoaarYL8pIp65zvzcDt2lOAYyY1csOt4jTyx8B
	 J1p4j4E+y7hpwg3sTn9scADrRfu04HVofVdI87W6bRc736M25UJSsT1liX+cRQ/7aUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jqnrRoTh5TcWr/Py+gEgzzX7wdMhzTlFxFkfLcpGuJM=;
	b=mTgyne0sCPn4Qc5mI9ucVPNOif6oBmmVc68sHuXnfkD7nCUNNTfGXTWZ46jRFF1bxDrF
	 mGds7clH31Ur3h0J/7YYCyvn2kvucPElkqHOwlRW9DSeBXICbZDKjsUavNZBjzs8MiOIY
	 e609eEvyof4cHdyzID0vc1d81M763dz1gDGvwPKJjLk46Km9nwnt0tMTqfPEK28/+5Rpq
	 Ek/aC4pOZVchL1Q+YKcKnfPM8wmrmNu04sdjY0cH3rCiGNzVdNLLh0noPSFPhXi1Ez2Po
	 ZEnMOyKUiaFa8/ftZ132LS8HBp5eQDGF7cyJE8hCob2mJ3JMYcDJSYH2yiN2E8tGqVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YcqWJI31;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AC5606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09AC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YcqWJI31
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5365f9a04c5so65776741cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794858735; x=1795463535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jqnrRoTh5TcWr/Py+gEgzzX7wdMhzTlFxFkfLcpGuJM=;
        b=YcqWJI31Q3We3zqNvL52aNkFr++cowdUSJ0aOSCLtCZgOyPTfxfZMV4aawKPfLKj7g
         4m2sGeUiA0CXGadMrFuMRIl89TE0lacup406nbrhvwqwPIX8FxoVlYidwE8/s7P7Wszm
         OrbfdLGk33YGmzpkBYmsq4F3Mxnt+4Lu+TymHPjdbgW2SfeAeQs52uRWqh/1XVhhLOxn
         GvpMlDfLIXvCkNJG/BKPMpLBeKmXfFzSUPrKKeUURMUv+fsornqCLKr9GiRTo2LK7Tab
         rlciZWXd7u0mEyCoyMVRbS74CtgQ2ZcTLr22IpH7H7u3DgVnSQkVWAwVkGPORAQHY8UQ
         R7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858735; x=1795463535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqnrRoTh5TcWr/Py+gEgzzX7wdMhzTlFxFkfLcpGuJM=;
        b=ckoF+bfdG/v3ESo+FBgdzqUF5z4vNxwYZqWHOSr991PibEL7ed1rh+xkUZaehseyL0
         iroaVoDVg/VYoQARZ2onXVx+LrFL3b6W+7pBFnrNxknYEJH+NyiI5TXBO8R8/fc4GzkZ
         wnXJoHvgtkj/fUG2HXHLNDugIVb3E0vNpj4gLpIqrajehlaCleKZpJdHbmczUrJn8cPQ
         Bbpq5tRK14a003g+CJPKgrusPRa+WNU2hVXIqMDEYf7ok1epQUld1pbb/9RUpo6UtY2F
         6uA5mzP0HdwubvaRyO3D0VqMMzDiBlDaCblCCrXP5nCE14XP11gmZcZ6vUB59RG6N80d
         G7CA==
X-Forwarded-Encrypted: i=1; AL+hErGGvN776XGuj7vd6m4pyknfvfdFggJwi5cFKtmQmu42mbxa9KV9MnWxmkVgQIAYAZeIZ65sIW1Js7r6Oxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ulccm2CmVnNatgRs3sczconcJDk3zaqlFGtIezK2onB/AKgc0
	YlXHZJydSPcHiILPSDdx+9ultJadkt73d+PXWbObIYfl6Cn5kQ3S7xzrFlok1CAzRfg=
X-Gm-Gg: AYBFou1iZbl+JuzYkn+aYLqyI/a8Bfx4e4/DrvCFF61vgn6CmsIV30crutccfRd+v8a
	7J9CPz46gzJBc1dtlJkXqTiERtt4nO1ZVv/ZREYH6tNNEhW2TC5QxPzW/8ygBVhec4zetfEivTi
	BD/YmECxBV5d4lQd5EVb/dqKivmQ381e0N2oAbHTYVlspJzzqIZFndJ20hrXRjegQxkeipao/d1
	ng3+EdJNVhdJaNiud0RXnW1hMsAB9C4zb6Gxhmyk8M17q5PNPO/O9TlB+DhMuwLcKqLu9esZF9a
	T3yb2fgFdC1K9ct64HvZwvJ2MF43Q6+3+UoxCVzSfjAehza8He1lCNJQf7zvuz8BQak2oD+zDie
	yXeHtp+RVg8E9URytO3TK8rUaium87bvot/J6CKiltyHwncxVb9WKCu/Kw5xZimHd7Jagn19F++
	N5620ECWqy2/WQU8n2lwvrrtUplutTJW3hno3DnrL7o4DNAfmHIPQHGCHNnFuFpeWrin6uqHQZP
	AlTZO9LtmzerUprQZlXuI1XdZOT0sZ94uAVRFhx9ZsJwrYsTfS6kd1h1wy6TB1u6wu44mToNQD8
	1MHx1g==
X-Received: by 2002:a05:622a:13c6:b0:55c:c7ab:4445 with SMTP id d75a77b69052e-55cc7ab469bmr121785021cf.29.1794858734926;
        Mon, 16 Nov 2026 11:52:14 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f8319d44bsm48973876d6.4.2026.11.16.11.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:52:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2kP-0000000ALbT-12cG;
	Mon, 16 Nov 2026 15:52:13 -0400
Date: Mon, 16 Nov 2026 15:52:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tao Cui <cui.tao@linux.dev>
Cc: akpm@linux-foundation.org, dgilbert@interlog.com, mkp@kernel.org,
	loberman@redhat.com, jmeneghi@redhat.com, kraxel@redhat.com,
	vivek.kasireddy@intel.com, mst@redhat.com, jasowangio@gmail.com,
	eperezma@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
	rostedt@goodmis.org, vdonnefort@google.com, mhiramat@kernel.org,
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org,
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org,
	christian.koenig@amd.com, phasta@kernel.org, joro@8bytes.org,
	will@kernel.org, linux-scsi@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
	iommu@lists.linux.dev, io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org, bobbyeshleman@meta.com,
	mathieu.desnoyers@efficios.com, robin.murphy@arm.com,
	mason@kernel.org, aesteve@redhat.com, tjmercier@google.com,
	harry@kernel.org, vbabka@suse.cz, cuitao@kylinos.cn
Subject: Re: [PATCH 5/7] iommufd: account the hw_queue page array to memcg
Message-ID: <20261116195213.GF2452510@ziepe.ca>
References: <20261106131829.3228926-1-cui.tao@linux.dev>
 <20261106131829.3228926-6-cui.tao@linux.dev>
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
In-Reply-To: <20261106131829.3228926-6-cui.tao@linux.dev>

On Fri, Nov 06, 2026 at 09:18:27PM +0800, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> IOMMUFD_CMD_HW_QUEUE_ALLOC pins up to max_npages pages just to check
> that a user supplied queue region is physically contiguous, and the
> page array for that check is plain GFP_KERNEL.  The size comes from
> cmd->length, a u64 that is only overflow checked, and the array is
> freed again as soon as the contiguity check fails, so the allocation
> can be repeated concurrently: a 1GB region costs about 2MB of
> uncharged memory per attempt.
> 
> Every other iommufd allocation that scales with user input is already
> charged, and the pinned pages charge the mapper at map time.  Charge
> this array like the rest.
> 
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>  drivers/iommu/iommufd/viommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
