Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9149502E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992259; cv=none; b=b7DMFTcvyJAGBHZ8uPOTprnsNJ7/tJNUyuDsTr49GGmAtuGGDmYTULZ1f/ZeKQPt53jzqm6xXrFSRLOIVbZEPb/ZeLodMc5Uw5V60QRUzNTa0hki1xLpe895wHNbYqYzI1HPeWuPR19n7nwl0EdWd+hnogIoOQ9+3LpNV6b2904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992259; c=relaxed/simple;
	bh=Bf7lnpatBnrELTKzKji4QXZEDlQRseSMldyYQqvcQN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgV+U1C7Qj1uTiY4TqeOI+IeIXS8VLwJENafcQeWJN24o3mFgodrnLNFM/oXG7R1+V0aessDqR9L6crzDwaMLb9tysspooG7F1zAAmof6if1UHdbdalhScaGGIUDqjEmFiPOI8LTct0sKDQtZTEsytvK8hZjXcRZ1sXEeV7fjj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUuo3itQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUuo3itQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so16931985e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789992255; x=1790597055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BJyN6hZEtJ7I+g39wMWDf70pybar89NGAUqAa4CiJnQ=;
        b=fUuo3itQwqKYDqxx9S3r66v74yDFNeQ5WOb+aSsEo2A7TchU1UGhWeWess0ZavjGVm
         k74XbJyTuq8LI5WwVIJk/hFGdNXsyzBTmDKvIIIJCPr5r3qxhf+i1JToUhI0Vl3p6VIx
         xbiCDnIxtlo2htBPWdHOQWz9SLlSnFIdz6i99ijam1KMLoaodFPKenXwGuCAnjrd99zS
         toi1+RR/Rg3dW/ykE4+03G8fxoKwqocxP3/TzUttn5rsqbW0xD9Nj2uESLnVcXJI9wnH
         FGdfhkN4ubOihiQ4caKeD2NeFXXJAUZ8mvpThzBOo5UmmQ1iOpnFwgqpeKHFv9SDTIcN
         /3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992255; x=1790597055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJyN6hZEtJ7I+g39wMWDf70pybar89NGAUqAa4CiJnQ=;
        b=0EwMrv7YBWBVAfZRE/Swq7yDhZ6H9H1E1cQ8RXOSQrm1mo12bo+533Dy4swEl/jD2d
         yR3YOdQLQFmyOl2Vjgf0/wiekgPgP2dFqzuW0v6pPrktS/vY6u+D3q6EWgv8nDhbFhUk
         sVFJTQ4Mt7/ZN9nCMxbXWUdOTz7iQpx7dwZjtQ3nW+GADy/qkFy9WOU95z5vUfAP8ddW
         xGJsdS9tK+JMqHgDfnQeAruJ2C0uFDvXAvpZFwBR2/e9W4OR2pg6kootf315njqmBlYY
         c2QyAaBYZTQR0IL+Eo5bng16VXSwzuFOEk3p4zufV1nagRWe5lx5WYrJUKxurVa3Ebks
         CiBg==
X-Forwarded-Encrypted: i=1; AKwUvByJmKoZGAeXICeZDspxB5Cu9IKnHt1HDynijFE02jaSZbwDjxoMRFdh2LC/ORgoYKRY4OhmN28+r5dPwwA=@vger.kernel.org
X-Gm-Message-State: AFuF++npHiSZ+VhVj9q0m0bdwFvaMCgFcY9t/T/c6V01wRtwY1v2XkG2
	2NOVy34fpLRbnfrsQzQpInbCtffgnd14nS1B+2H+Wxpsi3lH3VlU+NYf
X-Gm-Gg: AYBFou2/HwOxpQKtrnImuykKJM+xiaFdrD/eZstptMDMO2XwjotTwpXCrnaHKhCW6UN
	rHs2WZ7caHUvbsVwfVJVNUkQae7/2oWsFzt88/kue3gXIUwQKwev1AWsJ3OebbBMe478ubFsWDX
	nwQwZQhPp+wMDq3piQ4x4hJCJk67xX3K5mxR0mchR4JJErDgB3ajMrZZotcVfNjW36q8XH6WLvN
	1Lw+D5e1gsqnxrjwH1mScXn1pdqof6bbAeQ0ZwIcjqaibrvMoNfFjetOOcsLvGQ8fw+MftIDxSe
	I3OAY3CYEAURZn8e+uxkAwpWtXDFKSW4TVvcWM0dysQMKbgFVwvt89F0KMNFGLiDsgxidQryzzU
	2eM6lO4XJarBXCX9kNKTz0eedlIooyuXlJ/xBi13ai2CTlP2IBY3keiFXwpN13qX7awEMfYUVPs
	BYtYKwCJPFJ2Qu3pcy5gvaavQwsEXnizpBZfGt3ZQYOeZOBVguweQBNvn/leFPPOJ/yO3GM1ZLM
	CeoxSt5DyaYQsxEQx4GLOWWDNY+IametstdE234YuBECWoNsZomkAUKTHTamVDnjQ==
X-Received: by 2002:a05:600c:3584:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49fc5722755mr188101715e9.13.1789992255201;
        Mon, 21 Sep 2026 05:04:15 -0700 (PDT)
Received: from C422HJQPQG-Fractile.local ([130.43.154.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244229e0sm21110408f8f.4.2026.09.21.05.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:04:14 -0700 (PDT)
Date: Mon, 21 Sep 2026 13:04:12 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, jack@suse.cz,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, willy@infradead.org, david@kernel.org,
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
	muchun.song@linux.dev, riel@surriel.com, shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH] mm: filemap: move lruvec accounting outside the xarray
 lock
Message-ID: <arEdPO5O-kz9nzX4@C422HJQPQG-Fractile.local>
References: <20260916125122.2696271-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916125122.2696271-1-usama.arif@linux.dev>

On Wed, Sep 16, 2026 at 05:51:22AM -0700, Usama Arif wrote:
> __filemap_add_folio() inserts a folio and updates mapping->nrpages
> while holding mapping->i_pages.xa_lock with interrupts disabled. The
> XArray insertion and nrpages update require the lock, but the lruvec
> statistic updates do not. With CONFIG_MEMCG, those calls also update
> per-CPU memcg and lruvec counters and notify cgroup rstat, extending the
> critical section.
> 
> Move the lruvec accounting after a successful XArray insertion and
> after xas_unlock_irq(). The page-cache references pin the folio, while
> the folio lock keeps folio->mapping stable and prevents removal until
> accounting is complete. This moves one lruvec update for ordinary folios
> and a second for PMD-mappable folios out of the serialized section.
> 
> In a 30-second system-wide perf lock contention -ab capture on a
> production host, the hottest caller-stack record attributed to
> __filemap_add_folio() had 20,867 contentions and 557.930 ms total wait.
> That was 14% of the 3.998 seconds of aggregate lock wait in the
> capture. Moving lruvec accuting outside of critical section should
> help optimize it.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
