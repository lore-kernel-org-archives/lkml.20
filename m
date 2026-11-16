Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840512;
	b=tfrcoH9jexN4hvHwnruWeoFhs7V95UZgHRFBF+8g1h3V7BqJrBOhaxoFR0wqXcvhPhq4
	 QiWWFjpSaizqfioBzsu8p4ggLQmKft4QtsfM6hOOhkvaqpSoQc9Eevr6xjqD1Xzwtr6Mf
	 GnjJXBDFSGQt94+5rw927quZsuq8xJwvW9+DBdoKte3SUvBoMbw0ne6jagGqFkH3JDrfr
	 6do7LREZCREWPMTUwLmMnDrqoeJ/rM9m5eYB2qwQsvNwvkhSPIC5+uJTuZ39eYzFSpvYL
	 itcR+SJsIblvaz3EIzYfIGAboMimncHCZsMSXcw1pr347/PFSDN8D7r84g74R2Z2X6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GAMK2IKmSQFM9lcd0nuhN/Aow9O/KJwswXygVZN7m9U=;
	b=E19gnXnjxbbpmIyxjdRcFNtGzkIfLx26CZvsEJuef0rhfB4Zt6WXFTEWPsIsqs13IPw1
	 FDb+dFRqFEWrPNmvJeYJGbjngsXwYGLAqcUKO9juBYh0PrzOBkOWYcNyyT+2z+U1AatWz
	 BlESG2HFqdK4zIVJHBU3x8KSUNxSPPdHhr3TQ0W0hevICCKxG5E/pUF2ZNOigZ/FNc/U2
	 fhjbiyrrP6OClwNuYRn3/HHxZbzJcLdQdKvTxlG5N1eXaqGc498y6TWXVsyYdAlEWGTLN
	 uRughki+z2EA4/VXWNmU+k259u6drgb2GCNT9ShDrT80KSXqnRlT7r3Aw1kAZAoT7aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AV28oKdl;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD7B606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD7B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AV28oKdl
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5366ae57896so42983801cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794840511; x=1795445311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GAMK2IKmSQFM9lcd0nuhN/Aow9O/KJwswXygVZN7m9U=;
        b=AV28oKdlXv05lYmzcPsRuahm9kiZ5E4rTL1sCib31eH1IpWzIPwxjWUnNdO3TxTTbF
         c1McWywJ5YR/ITdvCtz4fsW+Tkr1mxwkZUgewgS569StmuMmlBwQTYBeXPJxtchW0e3i
         1t4hTD0DIuq+/upZUQonqL5fwifm3eilNLGJgzh/kkUbOraJKZ9Q0dGwZzJLahkfZXiI
         WRhcRkwWfTTdg1XLz890ezCNWzxgbvq4pILm8Vgq59YrLrAW3MMdA0yeZnv8gp2pYLzz
         2LWMNT+vvLo/RQBmYLCXXKWjtidVelpbhcnE96AzoWmlwxzx4pHvzyOSOK5xkEEH7tAA
         7zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840511; x=1795445311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GAMK2IKmSQFM9lcd0nuhN/Aow9O/KJwswXygVZN7m9U=;
        b=jOSQYnQAbjzZSFmeScmokEXDnLWeDMVqTgjS8Sn0VkVXxmh7MdHtVzsJ5LD9WV6xUe
         KysnXqW5nES02cu4ohOtB4OfR16u4fmIV0P1Ed7NblQ4dGWf7FT9Thqfq12KFB1PnrKA
         McjOubt9x6f0QJxHYTVILxPZTrZcwXp5PQaojpDG0sFqhdVr7yUIaBY1smjuscmaA8fQ
         Ohm6JM+96qBIUEeiNgEEbNNaB/BBWA/WqWPMIgYgKxWsHlL5KzTCq+8xuRdvj6Epd975
         856ew0OZp4LOzmj3lzHC6caGaQK83p5XJOu7yuiebvz+UbfWguCc9wwZs0o6eQZ6B/67
         cgcg==
X-Forwarded-Encrypted: i=1; AL+hErGtyaVa7/UzTuDDZa3zFcoGCkUr1AUg7SqTrYjI1sgLjGkS2efvMM1WM0XCnSaaPsJF2j5x/7Kc6H9Lo90=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RxRMrh5pe+922AbAFBMTQkuPQL8LZ7zpUOE/CxfsoobkMuA1y
	ms+t1ZoENdVQF/68ezXqhRVWM6GyjbeaPPwA/ctQnllpEmn0Almk0pyh9oaQizQgJNY=
X-Gm-Gg: AYBFou28tR/wbHyavIiHIz62M7Ra05gFboovjkXaiW1Kem4Yb8Bmpm/LZqCakIXWXl8
	hfhRvQ/WdWuJ/K8evqxZ+Hz8xyUX+UO1pe+ZvYC5epcqyCdNl+BTBuNcYhKeBO5DuGBcxToTvdH
	R5VNaWylZMHEWcSG+ehJozsWH9HAhrHDvd0O44xXlgC4yMWgCDfkNMmD/EHX3kWiuUc+BRuuSL3
	69jqDe3u7XVODb3LDlq+u9nCVXxhOYp8BsaewC1wTNz5QK7vgPtJkn1QcwUw0Jm+V++EBIEudNC
	A1XbeduEblMpQAp0nMPNf60X2ypktq4HW4YQTrWE5FJWbg3gFrRzujns11Cu6ts9RLdqCZ2jev7
	mIHOyvdqBuB447S/EUAV8YeCNje3/gst3NjTlRNVzL3U1/hjsbc4o9T26hOiwda8KSY/eajFpav
	tiv/X06+Mxv+xeii95NxqGDRgg2BlacEuBjstw9iunVTTIPUrHxs4DdxqT/tLoDIsKBKPyeyrAe
	7b+PTky5srTwYts2YDVNA9UNPD0X19WjAGp6G1m9GlxeM6YMbya7h1+wKeKHjQKlvGJB08zN/7F
	QXoWHA8=
X-Received: by 2002:a05:622a:588e:b0:55d:37d8:5037 with SMTP id d75a77b69052e-55d37d85330mr62183291cf.77.1794840511508;
        Mon, 16 Nov 2026 06:48:31 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d70918sm86997276d6.22.2026.11.16.06.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:48:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSy0U-00000009VVo-10EN;
	Mon, 16 Nov 2026 10:48:30 -0400
Date: Mon, 16 Nov 2026 10:48:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Margolin <mrgolin@amazon.com>
Cc: Eric Davis <eric.davis@broadcom.com>, Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rdma-next v3 00/13] RDMA/core: Ultra Ethernet transport
 verbs
Message-ID: <20261116144830.GN2532299@ziepe.ca>
References: <20261109-uet-ib-core-v3-0-3e7e7ffed2e9@broadcom.com>
 <20261116143656.GA34010@dev-dsk-mrgolin-1c-b2091117.eu-west-1.amazon.com>
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
In-Reply-To: <20261116143656.GA34010@dev-dsk-mrgolin-1c-b2091117.eu-west-1.amazon.com>

On Mon, Nov 16, 2026 at 02:36:56PM +0000, Michael Margolin wrote:
> On Mon, Nov 09, 2026 at 08:00:33PM -0800, Eric Davis wrote:
> > Ultra Ethernet defines a reliable unconnected transport. A queue pair
> > sends to any peer in its job without a connection, incoming traffic is
> > demultiplexed on a JobID rather than on a connection, and what a device
> > orders is far weaker than IB or RoCE and varies between devices. None of
> > that has a home in the current uverbs ABI.
> > 
> > This series adds the generic half. The objects, methods, and attributes
> > any UET device implements. No driver is part of it, though two already
> > exist against this ABI. A reference device model that implements all of
> > it, and HPE's Slingshot driver implementing a large subset. That is the
> > argument for ib_core carrying this. What is device specific should come
> > from private interfaces per vendor.
> 
> Hey Eric,
> 
> Thanks for posting this. EFA's SRD is also a reliable unconnected
> transport (one QP reaches any peer, delivery isn't ordered), so we
> looked at the series as a possible second implementor of IB_QPT_RU
> that isn't a UET device. Other vendors might also want to support
> this interface in the future.

I'm not sure about this. If you have exactly UET programming
semantics, including the job, then sure.

But squeezing some EFA specific thing that doesn't follow the spec
isn't a good way to build the APIs.. Persumably EFA has its own
job-like mechanism for security that is different?

Jason
