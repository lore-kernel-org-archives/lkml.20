Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822214;
	b=Y9xkFTTm3W9qEl38tecMgQqR8fdohreNdc8rOaAWiP4S8jdQWfmBatjTau1SqicpFXyN
	 kzU+uwy8oZQYQHtJ5gBLM3waeG///kpsBIdiHuaa8YZJd+ns3hLBGII6PCL+Bfwzo4lA6
	 NSav5d1PP27Kath9OG5CHZTOF6rzHHGLIzOLpnWjgClxGl2fBJIY5pOsbZl7vZyrkwEbg
	 aXV8JsDEnIUR3Dn35TocBcAAYnwjkYrA+ve3F0CrFnJWi/4r3bKl1ebEDnRgdsHPz0g2E
	 xjsHybFuXpis0F4UqgKxyt5FA0Z/dI32rBOeBphtneP+I0IT7ggXjNnpWQ0w6l3VlbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xrKa+VT265YSl+/JqzQSpxcCcwhP8N6auXFpJdA3IgM=;
	b=GT+mMCT37YdKe/ZJL54BfFFmu5O/cOpZcWg11pkQ8GZJrUtxhrfIucLjHmn8+1TGLwA4
	 RoFGByoW2PRRD/WMNFN0lRZ3UN8lnmijj1cJF2joiThmP2Kiy+wtk1GQy4CrKDMDlQzlt
	 BGhiXLmfvWQrwC4o7zQ10aaq73zA1C+/TqnO7Ea/f22jpv+qqo8PEcr/xfHQT3PLWDH43
	 UDfLyKlO8WOCsY22jBeFUjjgjZbjoZ7U1GOfvf94AkPC9QBIKSxN5I5MCop5Nbc6qvm+d
	 ERo/zd1h3/eFq/j+6dazOjh/Jy+Zzm2OL314jieEWx0RwcBe8RUqszl0ttHfJkdNp0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=N53fQ7A6;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B9160E752D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B9160E752D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=N53fQ7A6
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a1947498bso2592315eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793822213; x=1794427013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrKa+VT265YSl+/JqzQSpxcCcwhP8N6auXFpJdA3IgM=;
        b=N53fQ7A6j6zDRf1HvGp2eiK1RyXqfnJynb0VUYXAeNZPhy2b8b5Yt/eQ4IMJWvBHuO
         rPZSTNLo7fdbmdrIaxiUSLddCNXIQa4oLPJVeOIrdklDjmQAVduoWyS3ktQ0jD0i7pBC
         rLvloDK1qSYvrAJbiVhgy8SMLD0alUNQbJg5KwfpDQfPbqt+49CbyYzlznWqs8Md/8Dk
         PBOUx4RQSdCIBT4Vk0Y2q5cW8imS44umvk9MPlj6ISED8H84yKayQr+glentQgUPN75L
         A3WncJrdc3t+z0fkgRFGu5smxposAYN9RQy7ZF0KPS2gDwLGc+f87PqBfK/Wk9cW2h6p
         UZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822213; x=1794427013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xrKa+VT265YSl+/JqzQSpxcCcwhP8N6auXFpJdA3IgM=;
        b=oZn4cG0CinfQvGUlCb6H8CvmyuyDZFBkqUkrf/luK0pJXymr83DLUl3qPLmBoAU7/Z
         t3yEvQBhJoF4wq9j3mC5Cn3fCSrsbNFYj/aiuY947fHfev0DgP0XrUp6Cf1fylJrX+YV
         5MqQ/1cTbcqNB97WYJ6nUYrF4e3kwNhl6BUygDo3LXZO2an2ujDeWsNlqDNiUo2/yt8R
         XxLzCgRoWIG0VPplnHU60CBIgMNCTxtNeKeqVs78B+T4pVOM8LrKwgpzEuUtdc9Lt4xQ
         FHJHReWdrkMgg8ImRKB21ll+U4Wmi1n/PFf/C7GK2/KtWH3LeHU4ulj1Pm46YazxsaK+
         knHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8qKQqeE1WnQJWFTnN/waqSAgmkK26h0WfSha5zDquhsg+6aqcOphZ/D+Q7EgauHnWYIBSblnRDYnQfGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OnVJzt6mGNxHtNdpB647CgLExW9K2HAuQZbeQsOwCEFLL30hu
	3EdGDTEv8vvHDOR+YBFdb5Utqysmly3VG11dJAc0Sz/lnR/J4z58yejYNMEpUYjPy/+jzKYLwdU
	I6N9O5w==
X-Gm-Gg: AYBFou3yrH97g7EdZzFhvg+mWmdWRLzBT6XM9ArFW8LByH6EqBsEwJ9cPPU/4yfNxUd
	KSKqMyh7MtcZ7Zeo9LPfgWNRVQku2SW4MYqjyAEHCNlQPVpZWW+tXv1UAQwey3UB6oXSzcRdmgW
	uhBcBCCe15riLp3HTwvVFIoI48s8Q+tM+A1CNoOrxAsXFv1WeMNcR0Hhw2qMYMXW1VTmqOR2E5M
	X5v4NoSH+ajri/WMuoLsR3AI0aEBm4MfXLznJjj21dwdBUEETE7B5UmerhLgeUjvZvJcmtn7npy
	lX//2KJK99jFqTjJZJ+IUNu3cxwRegzsA5fuKrggxfqagfAYb8zExtSE1rRR8M2/MDMNGNaMzmW
	Av/jEXyvHTwGk+HZnAfM/jgJtjV9fBmZvov/e9CSa00GsNONgrWjjLqLCXDMqCgKZJijRgA7qY1
	bc3zgUspYCl2Uuy+JdjpXRpQXc1V1jMppq7xMZnkJUp/XWg4NkB9C3mEjexzf8l8MZaqNOPAbu3
	kYg/SIXt0WxyN6Ft7VPupUjw4nVU+9UkhvssgBsRGCpAKnKJSE+/MgB4/4mxsVPQIHka1gaU8xs
	BL+iy5Zo/QVTI1aVdblRqAFfBTXmSzLlY/Wn
X-Received: by 2002:a05:693c:8806:10b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a4241bbd5mr26449643eec.36.1793822212586;
        Wed, 04 Nov 2026 11:56:52 -0800 (PST)
Received: from localhost.localdomain ([206.206.222.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fe477sm8703069eec.17.2026.11.04.11.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:56:51 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: Boris Burkov <boris@bur.io>
Cc: dsterba@suse.com,
	wqu@suse.com,
	josef@toxicpanda.com,
	fdmanana@suse.com,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] btrfs: tree-checker: reject inline refs not matching the extent type
Date: Wed,  4 Nov 2026 12:56:49 -0700
Message-ID: <20261104195649.2422485-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104192415.GD3301639@zen.localdomain>
References: <20261104102323.4090290-1-smish149@asu.edu> <20261104102323.4090290-3-smish149@asu.edu> <20261104192415.GD3301639@zen.localdomain>
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

On Wed, Nov 04, 2026 at 11:24:15AM -0800, Boris Burkov wrote:
> > 	item 9 key (30478336 METADATA_ITEM 0) itemoff 3636 itemsize 33
> > 		refs 1 gen 13 flags TREE_BLOCK
> > 		tree block skinny level 0
> > 		(172 0x5) extent owner root 5
> > 		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >
>
> I assume this was crafted manually, not via btrfs operations with
> squotas enabled, right?

Right, it is a corrupted image found by fuzzing. I did not find a way
to get an owner ref on a tree block with normal operations, the kernel
only adds owner refs to data extents.

Thanks for the review.
