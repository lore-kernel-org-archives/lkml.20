Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942954;
	b=LkPW9SFXHlHdnCulVCM47yYzKD/sgQyA34Gmm5CSDSDeXDAzSzzLquK+3A5+3mGdRPOR
	 g0bGecT1/v6ZCEZRfkTyhAlqIozTqt9YWXRYyMyFyokOrsTWCZL4YVvAfnlDw9kXPgPf+
	 hFEeNgswvwx0ZMzd1yBzcW3DzXnFFQqFk7BoS/AIOrtlqKPNYrkzzfRmDHnHeAV64mj36
	 BIfbKqy0Ilqk6wfwS+zxufO2vUNKXu36tyEvHzvfNdwtbY1R70G7qW/SXi15of8H47W6d
	 eNxbg1mypQ0nfzpNNuDyLReUTsQ6O29Z0gfRLIkoTO1ZTxbzfHEhMm016a9gpawuf1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942954;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=5rBCPsnT9vys9MfWZPdXnyc93qztMMp63LCVlLl8nnk=;
	b=yNnjsRDHWF8nZXY2Y41XzDGDSmoxsGQqJcQN4yemYCAQ7cz+SPu/bcnSTEo5E+W2N/uH
	 gOharwmjxTLSwmLtSnFhna59rr9wMB/PFrWVyAD/jT2q2g2u0L9qzW+j97NzCqzMtQiTR
	 w9NbzOGSaKWAGJxZeS88zxCev2vmSHM6ez3hGmI4vO85ddAnT+PAMrF+d4dOTu1yQ0mFH
	 RCBQwUn5mHDcnkqePY6QKPwzdDQMFMC/QMhYhPD2xjYkBLNNtf3wNSIYHWfS0LGwZaEyb
	 P0cRrnUldYaTMzqi7H4U9ObUrNugr5gJRleZg0eH6Nncn3XCMe3nwsB5/okmOl0cJLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oh1WUifr;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42676606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42676606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oh1WUifr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793942952; x=1825478952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w+0WC+LRb1srNFS4rQ5m5791sS62cyuQd92x1Y3ZVEo=;
  b=Oh1WUifrCjeKSD3V+oV+LG3SkDOn0PpGDEqEAxVPs9ttiueJWpIuzX7d
   CcwNUPrbg3prL3Lr7ivOU7s01/dWV2NpD7wK13e9E8H0vamv7jPG20v/7
   +VWYlKpu6diii1rev/tVudndZkhkJKq7nk5uIKmsFPFNze+H1sRMR26CS
   9R203CmrdjdEsbwHm5KnMr883h8O8WfmCBC45HzmkK/QIaVnT35ZmWgx1
   7J5SZKYxqwS/jgxoy3eECeMODODt0MfnoWH5341tVcpoa/hRHid3WeE3O
   kXAZCGN+z0xqTFyYFARWL2Hqr/SOz/tT2NFff7ar6cC+rf4n56cnklfQE
   Q==;
X-CSE-ConnectionGUID: yZDFPcVxQgm0xAb5dH6Vzg==
X-CSE-MsgGUID: 382Il4UQRJ2O53VeN0yN2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2789103"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2789103"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 21:29:11 -0800
X-CSE-ConnectionGUID: utXC/fR6RMGr6iOPsY9+9A==
X-CSE-MsgGUID: dWZS+NHRQRe0Ue3TXhMhGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7534559"
Received: from yufei-super-server.sh.intel.com ([10.239.92.104])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 21:29:08 -0800
From: "Yu, Fei" <fei.yu@intel.com>
To: christian.koenig@amd.com
Cc: airlied@gmail.com,
	dri-devel@lists.freedesktop.org,
	fei.yu@intel.com,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	madhurkumar004@gmail.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	syzbot+95416f957d84e858b377@syzkaller.appspotmail.com,
	tursulin@ursulin.net,
	tzimmermann@suse.de
Subject: Re: [PATCH v2] drm/syncobj: Limit the number of handles and use kvmalloc for user-sized arrays
Date: Fri,  6 Nov 2026 13:35:03 +0800
Message-ID: <20261106053503.1437526-1-fei.yu@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <a6a2ca76-94dc-4616-8160-d756713e22b9@amd.com>
References: <a6a2ca76-94dc-4616-8160-d756713e22b9@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Fei Yu <fei.yu@intel.com>

On 11/5/26, Christian König wrote:
> On 11/5/26 10:12, Tvrtko Ursulin wrote:
>> On 05/11/2026 08:18, Yu, Fei wrote:
>>>  - The value is derived from the size of a kernel internal struct and
>>>    from the kvmalloc() size limit, so it is not the same on 32-bit and
>>>    64-bit.
>
> Oh that is a really good point, but most certainly a bad idea.
>
> This means that code working on 32bit then suddenly fails on 64bit, not
> something we should do.

Agreed, a fixed number is better.

> I think I prefer a fixed number here. Something reasonable large enough,
> like 64k or similar, should do for backporting.

One concern with 64K: today only wait and timeline_wait break above
~64K handles, because of the 64-byte wait entries. The other ioctls
only allocate 4-8 bytes per handle, so on x86_64 reset, signal, query
and timeline_signal currently work up to ~512K handles. In my v2
testing, reset, signal and timeline_signal on 200000 handles succeed on
the base kernel. With a 64K limit they would start returning -EINVAL
after this fix, which I would rather avoid in a stable backport.

So I would suggest SZ_1M instead:

 - it is above what any of these ioctls can handle today, so nothing
   that works now starts failing;
 - 1M wait entries are 64 MiB, far below the kvmalloc() INT_MAX limit;
 - it is the same on 32-bit and 64-bit.

If you still prefer 64K, I'll go with that.

> But I would still use a fixed number and maybe a static assert that we
> don't hit the kvmalloc limit when we allocate that fixed number of
> structures.

Will do. Something like:

  #define DRM_SYNCOBJ_MAX_HANDLES	SZ_1M
  static_assert(DRM_SYNCOBJ_MAX_HANDLES <=
                INT_MAX / sizeof(struct syncobj_wait_entry));

Plan for v3, for -fixes:

 - fixed DRM_SYNCOBJ_MAX_HANDLES plus the static_assert, define kept in
   drm_syncobj.c;
 - keep the kvmalloc() conversion;
 - update the commit message accordingly.

The uAPI documentation of the limit will be a separate patch for -next
once this has landed.

Regards,
Fei
