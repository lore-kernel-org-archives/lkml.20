Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794856913;
	b=gMPENTJXw8yKsHs1dTjjLoMxDyklBkmDSsNYRo+j4gCv7+JYjWETNulPf8My9Zg0mZUS
	 cUyGNUvhBN1W8oAzNCqE7vV21KGwHSKLS2kIoG77/pSRVOreL8NVXuaReZdYQra2mVnWW
	 h0BrgYi4Z44MIzzRKqvu8HVyyLw4Kd6UEzUwtkBk7dr+5/XuioW58JyMsz3g8eA/G8UW2
	 03B4ySTXo3kbxH7wH9ja7/lWtd6j71l5HTmhMLJHBTHhukIM6YEXPHomQ5beawPOF2tpK
	 PSusOOpTLZkGhcITkFHeZzHSSShDX12Zbz1Uj99NYQ5cLadGWx3yjZuDpVh3bGoGfAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794856913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5h7q3+LXSxb7tMF5mvW6Ax5wQfXmLA8ND/986/f/Oi8=;
	b=bSSgj4HsbIe24IZg3DbpASp2wTmIweZRfwKogWbmAb17/oY6Mnixy2zF/LmnATt/rQ3d
	 iJoPmvbtWr28hsM4xh3jlck7vbba2K9K3FtB/9jxJpmMVTnPun+68kepjxx/vHShdJg+B
	 sVzVbmak4p8QcmLG5X8uNLV9DAHtSXXgA3PooXvcMajwQQ6YNV6rngPMQuyQstqKeDa3K
	 yNZGsfRUkwIB46GjK9a7Pht1ywzLrUkGOdfRPp/WcPWaWPUimtB5RbjzZueJy81x4ie8u
	 Q6PZ+Ge1TWF21smWDIVwHbzWaBuOs3OD0er/nHQmJ3taG0w0MEsWqo6fktZkRbfzw1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Z4nIUa35;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61AD606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A61AD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Z4nIUa35
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9495c633eb5so180276985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794856912; x=1795461712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5h7q3+LXSxb7tMF5mvW6Ax5wQfXmLA8ND/986/f/Oi8=;
        b=Z4nIUa358WVXUDxOfOfxrMKv2g27OVGfcrL7A0Wzk9+g2q0VIoeXzfvTKV5sRt4stt
         ywbZeGCzkD0J81IJdVhrV3M7uVEs8vCZRd8008PoH8lkUsM5vcX2SEe3P3cFWCYGiK8o
         E4YseK3VxyiFNvPot3pKiL4qL8cobj73ghTZExtbaOibp8cf8KFNlCF24paAPqgBcYYc
         QBlLEKcZ6SPwRQzCvJlWdX1zWW6WoX/Mx2KCDg0feOGBnmT0d8zdi/xbawZXE/PTJPbw
         xE6Zq3/2dGJJkiPesQ5WLtpqqK+xwelk+7ftccNgL8bj02dvPTVCtnYLG3Rpl5SvOyXp
         99bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794856912; x=1795461712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5h7q3+LXSxb7tMF5mvW6Ax5wQfXmLA8ND/986/f/Oi8=;
        b=v6np+rA18aS1/iVvLVoJ0z/YfO5uotJTn69HCF3MJmMeEW+fuAMkHPWWmp9Juq6RLa
         vF9J6h8gsER8bW8f0C+V1BLfGGAFEPY+CmLPkB4UJXgG9yB0AdZNaxPifRuZP3U4OfBm
         J5SlMebyVXqvVTCSkTgBlp0QsbJyMs/Izwi3SSXPqfhKPUFtvajrYiQD67P/SA3h+NHH
         5tmBKqxsHJSy29P3suZIdJDsjZWCx/LG9yCxAejGXgx64R8xfTZjcNDdgR82qR+fLqG7
         XgnUoGS3m99sCa1g2ginAJKM8iHtBah03Cdz0Kz/Jp0PhHor+VDW6/ovSF7+M6Tgfisx
         fxMw==
X-Forwarded-Encrypted: i=1; AL+hErFTenZYJHVuE0e3oisWd+59eK/oaBe92GAuLv2l1oJqOaGqoQ3iQPYySeyZP0p1SF9nKZa1X6NwJPnlXY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Co0vlYLQg2WeOkkkH5jYZz2euwXV9KTRFAWyLXo8boEeEPG8O
	8iOWDtH5qjCYnqn1WiodIn72Fsyw4QlJk3uW3CdeX8Zi6NNhenSC4TcBqZCmgR700Xo=
X-Gm-Gg: AYBFou3VdLv7MQBuPLOCvuek3/vvpNkLaFA1n+nMmNQy1MlGhW01qqys4uHlIlOr9yr
	WRfStZZkmPpMr9sNzM/XSQFDCWXLbeH9HSzdRez8odDVquttjZnCK6ojj7ep9gJCUvYeKt6VngA
	SH6dxTcaNUFxegWveXT8cA8FA3jkIthFrJCIu9JXocNjU1MRahrrtMUu+E4FeQNbMYQJoaBKm3A
	KVdxUDtrmmYSdNxQHKilTCJJCfHslGAJ5Z7kD0BqGetnVLbsWucoSpumvDXj4D/P8Q4X8tikaL6
	OvqyM3tDzT52es0KR5564O+otppCSUOUdAIT1aJitwJauqAVTrHSQrE1JxGZCzOmQHL9m97Lnha
	MW16J7J6hOdaPxDqruIze8zuDuH0AtuMIVqKHiksFYTob6/rWdb6aBI3F3k6oP2rm2mnIFnLHJ9
	EyxAgdoPmMK5aFX/MZrBcKZbr4Hj/LPAV82kyZDMYQ2gK58/mUukg97BSsGG4sIx1OzC2mYw+q8
	MzsuM8dmh+ErsfpXcNcbfj/+lQN/AJ/JJYrrpgJIgWza5m1ituayibb5g/t0ovDHJrGs0hfVPGo
	qcosqw==
X-Received: by 2002:a05:620a:688f:b0:93f:3482:e326 with SMTP id af79cd13be357-9494bbea448mr1869030085a.42.1794856911450;
        Mon, 16 Nov 2026 11:21:51 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949627520c1sm676973085a.10.2026.11.16.11.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:21:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2H0-0000000AIG8-0jqn;
	Mon, 16 Nov 2026 15:21:50 -0400
Date: Mon, 16 Nov 2026 15:21:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	joerg.roedel@amd.com, dan@reactivated.net, vasant.hegde@amd.com,
	kevin.tian@intel.com, Ankit.Soni@amd.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, guoren@kernel.org
Subject: Re: [PATCH v2] iommupt/kunit: Skip the page-table leak check on SMP
Message-ID: <20261116192150.GA2452510@ziepe.ca>
References: <20261031085536.18555-1-fangyu.yu@linux.alibaba.com>
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
In-Reply-To: <20261031085536.18555-1-fangyu.yu@linux.alibaba.com>

On Sat, Oct 31, 2026 at 04:55:36PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> NR_SECONDARY_PAGETABLE is batched per-CPU on SMP, so the global counter
> can change as pending updates are folded, even when a test has freed all
> its page tables. Comparing the global counter before and after a test
> can therefore report a false leak. A failed teardown assertion also
> aborts cleanup, causing subsequent tests to fail because the test driver
> is still registered.
> 
> Only perform the leak-check assertion on non-SMP configurations, where
> there are no per-CPU vmstat deltas. Keep the tests and resource cleanup
> enabled on SMP without accessing MM's internal vmstat data structures.
> 
> Fixes: bc5233c0904e ("iommupt: Add a kunit test for the IOMMU implementation")
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
> Changes in v2:
>   - Replace the hand-written vmstat snapshot with a non-SMP-only
>     assertion, as suggested by Jason.
> 
> Link to v1:
>   https://lore.kernel.org/linux-iommu/20261015132024.43998-1-fangyu.yu@linux.alibaba.com/
> ---
>  drivers/iommu/generic_pt/kunit_iommu_pt.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
