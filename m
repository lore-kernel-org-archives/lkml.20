Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871355;
	b=5OnGaBGehakLD0QkqZu6Pc0DQ0OwqY/2taZtd+g16/+MbU+xzAws2w0rSJySjCL5fS8/
	 lq1BDZd8TjzvY05KifMyG2p9Z2TJCMFOuLBOeVYK2DxxRyB0C7lK2F+rFclRNAd1enV5l
	 2aD3+of1JefYuaT54ipG/ICZhC8JOV/XCP5rDZQ0oa0qzoMmM1krd71JMzaMCkDESqnxQ
	 SAcjHDCCfZNoFXMSnLWtoythIsZwlWU0kmnW/O6ehAIm4HLp3YA37L3jF1fuOyqL0/eey
	 iiPLDHMdnkzuN0PAyuMlyV5F3y8197r14tqw7LFnDc3UqoherF8z05xhFEwJ/WH/pKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871355;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Rn4PUmQlghV6bDqelAkHDxWUrP063U3OOv3SoBPx5ys=;
	b=W0YXDEmLiUIZwYewyIa0/oXDrEZmY3yBpmXJdU96mb3tmsPSCTxXjlPbY+YGyEnJCsu9
	 66d1iTtKriUn2UIcdwkkwq7FC0zNq7I8KumqO6XL3I+HJY85SjZxu7v0zfmZRcx/6zwdQ
	 ps4iE+PS+YbefwJ6TWrd90OdW5zt+8cod3O8S1HpYvWK2a/5dgsoYj1Q8rO0ORC4aB5PO
	 JD9EQ0fd2yq0+C88UKdJmgmNVwZxPjJ4LbHzbNVKhkzR4cYnCSwJwNaQWAqQQGlpAPSwJ
	 loqs8KXHmNuFDZm3BSyPfdFOyp9IcqInfUmt82VUnR1CkXuNKU2i+Z+1Yk9LC0A7myA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b="CVujYt/6";
	arc=none smtp.remote-ip=202.108.3.19
Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4BB606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4BB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=CVujYt/6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793871352;
	bh=Rn4PUmQlghV6bDqelAkHDxWUrP063U3OOv3SoBPx5ys=;
	h=From:Subject:Date:Message-ID;
	b=CVujYt/6Im+SZW7O/5EWHKAhAsicCYffaDYvS87rQZYd69v3IRTV+8dnZoPDxGh+y
	 UuSa+nbWnc7+ynYFzCVtfPT5PPEa/18y9n/hDiSEqBb+RHVq2PPfQFpLRsbEPKXyMX
	 LiN6zUbWJ7R/ndQ0Cg28ataedWZZ45KJKLB+qoJc=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AEC4DF20000355A; Thu, 5 Nov 2026 17:35:49 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 212874456816
X-SMAIL-UIID: A9199AE68AA0430E97AE7DDE3DE72AD8-20261105-173549-1
From: Edward Adam Davis <eadavis@sina.com>
To: phasta@mailbox.org
Cc: media-ci@linuxtv.org,
	sashiko-reviews@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org,
	robin.clark@oss.qualcomm.com
Subject: [PATCH v2] dma-buf/sw_sync: Optimize the retrieval of fence reference counts
Date: Thu,  5 Nov 2026 17:35:46 +0800
Message-ID: <20261105093546.61098-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <75367a9a19c1e9a007422e0a1b8ed0acaca2492a.camel@mailbox.org>
References: <75367a9a19c1e9a007422e0a1b8ed0acaca2492a.camel@mailbox.org>
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

On Thu, 05 Nov 2026 08:49:49 +0100, Philipp Stanner wrote:
> > 
> >  drivers/dma-buf/sw_sync.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index 8df20b0218a9..261bc98b1ed6 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -221,7 +221,11 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
> >  		if (!timeline_fence_signaled(&pt->base))
> >  			break;
> >  
> > -		dma_fence_get(&pt->base);
> > +		if (!dma_fence_get_rcu(&pt->base)) {
> 
> You must hold the rcu_read_lock() while doing that, don't you?
dma_fence_get_rcu() is simply a wrapper around kref_get_unless_zero(),
it has nothing to do with RCU. For instance, the use of dma_fence_get_rcu()
within sync_pt_create(), as seen in the SW_SYNC_IOC_CREATE_FENCE code path
does not require an RCU lock.
> 
> This probably works "by coincidence" since the surrounding spinlock
> also disables preemption, like the rcu lock does.
> 
> That spinlock, why can't it guard the dma_fence reference? Doesn't obj-
> >pt_list hold its own reference?
This is neither a coincidence nor related to any outer spinlock.
The comments I included in my patch provide a complete explanation of
the fence's reference counting, from the moment of its creation to its
final destruction.

BR,
Edward
