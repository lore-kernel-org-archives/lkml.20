Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B3599A52
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173314; cv=none; b=Oi5F7m55hbqtO5549mK2jdMnc9B5oRfpiA0W9oKoFBYwPXlPEmOJ2epfOEEExUEOCw7NFQSe0Z+rM4kg+WXwMXy/IC9POwNUUka2AE90/mKQElCvN2jdFbMsecKBCpl+2kge1dFNthtw308yJWZsb+LnymlwXVLLE0frAwhidTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173314; c=relaxed/simple;
	bh=mPAPoWpMnWCgERM6/03DlQ93cyR83ZzdetBkwnMCxoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LD38gGDH/XzykoC+LR1WAOg/9xQPutdFM1UBQiTMaEz9lknswLga87iBVekN9gyX+IjdyPgBtSi3+5lH39KbrOZWPEDgfR27f+f6+4ip8R5jRvJL7D9qqSA5Q/7sJNqkrX00cEkuO3FsFIdfXP/d8+LztIIG8drBOt4WBggTu6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1+96Y+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1+96Y+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE6D1F000C4;
	Fri, 16 Oct 2026 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792173313;
	bh=mPAPoWpMnWCgERM6/03DlQ93cyR83ZzdetBkwnMCxoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T1+96Y+Mqeok+XmzPCMqvuWtVWUenQmiTw+1ry/2++I2V3Vra9Dgi+RKvemBYDXsV
	 NKRfwBfUycnt/D2MqENH9ZEEOI7/zy/X7JapPxITQ/SkT2973yajxBa62hGFFcgpOE
	 qZX81q4jMv6jKKfFbRXnwrX1v9Qj/rcqhPzKQlD1ufpsk9VANorhbrGKmqSBJZNj9w
	 GjXi1WsbHw5zRNWNybKjeLMk3W5lmA1VvbYlbhjExpbQZk1RJRblmgJgT/ice6gmW7
	 QKoEmAFldQm9+lVOqPMDCqOzyuhmY/B9M6xg71JIXr5Md3WOin1S+rQUpVQRvPBOHn
	 scoEgzZ+9AxQg==
Date: Fri, 16 Oct 2026 11:55:11 -0600
From: Keith Busch <kbusch@kernel.org>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: linux-nvme@lists.infradead.org, axboe@kernel.dk, hch@lst.de,
	sagi@grimberg.me, linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
Message-ID: <atJk_2FmzjUZYO_Z@kbusch-mbp>
References: <20261016141208.2641974-1-e.velu@criteo.com>
 <atJXYHJa4jkUWJmP@kbusch-mbp>
 <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>
 <atJeazM_rJ0uj3vt@kbusch-mbp>
 <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com>

On Fri, Oct 16, 2026 at 07:43:24PM +0200, Erwan Velu wrote:
> This disk is configured by default with VWC_PRESENT enabled, but the
> Volatile Write Cache is disabled (NVME_FEAT_VWC_ENABLE=0), so the
> device has a Volatile Write Cache, but it's disabled.

...

> In this table, with my patch, I've enabled and disabled the volatile
> write cache using nvme set-feature -f 6; this only affects
> NVME_FEAT_VWC_ENABLE, and VWC_PRESENT is still reported as present.

...

> Hope that's make it more clear,

Unfortunately, no: there are contradicting statements here.
