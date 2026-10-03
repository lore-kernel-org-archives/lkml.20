Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C91023909F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791027862; cv=none; b=RNmUFvgte7snYLKj4rUAzZlVzhS2kjRM3ZKNWVYonVkheyLO5Z1tHWn7T9bgN4Fr8grCoM+WaTaaYbE2aPOMGuvZFP23MFNWz/ug1RgPkosibpOhebevJwBNfjPV1VtSw0qNX+exEEielwigQ17/QFpM76M/4pPR5zuABBNfZQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791027862; c=relaxed/simple;
	bh=SPJgS5kgGCdrjB21D2xL695GmuQTeeXXhSII78zybpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKnKLbMmNv6sjLUMf5mXC/P3iODmZWjX1OoO5sWQMS5dMG+LzAX4zIZ2ox6s9aZl+/dHPmmjQKpMLrqPMDy0+PmppciIchXjI9CHS+BU0Bj6NL3++Lna8USAIXct7gYg9iGBxJ0jzCA2hq59huSFGLHPBong3hlPYGrHFslMRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqdLBV7m; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqdLBV7m"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so243528f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791027859; x=1791632659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZ4ULGKSm/cG8v6BlyRVVFCk/EzNYVJ7PtZl9aubdS0=;
        b=AqdLBV7mvkXOFWnDCnWlGJM6r4b7uGu8N1BzdSMjp4H4TNDB10QGAbPlfGtdMfmqZp
         x4rOu58J/9dVisvqsB9y3A4IcjdZO68vGBNYjXqYFbnty3CC5pnbpGramgJbTcSbLWuA
         ZqWwR4p3V6pq5198QS/Bp1DSCYwMuzAYL5Kfebd4hidw/7oU65Y3Z5Bq6vnVCAgmOOer
         b+fdONJehC9L9Yu+QWn5SwNav2CrEDMRO0W0Z2GYBlG1HCJxeMDumq6Slm/vBrOaDt/L
         Yv5qmFEqSXZf7APDpySmYsqlLvsnX+Ik4GFqoM6SQh94d5hqHZ6aDdP2ahAKiAmPQ3eq
         3bdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791027859; x=1791632659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZ4ULGKSm/cG8v6BlyRVVFCk/EzNYVJ7PtZl9aubdS0=;
        b=LhdUkU6QSjMaBBFk7FJNXcrFV8ottuNgYk2KxJwlib7YgtrQjwZVtzVUYgVHgcbdEo
         uqR0gpkR1NSd6Ugy1n0cJ9qmxzRlzpa2m6Ew0PGTO3IlqGytFG5dASvnS0vZOPdmh5Ex
         M1rgnVZvb3sDoDLXv5ZhpQPKoD1bPyy9CgwLHCaAc8J0rfIJkWTw3Fpzd6PHEZfcsd/w
         uUoQAeQHFsTOIOiWYMfMeUW36RHPaPmmSsl9p8+5x0H4cz20j8bv5eQVD9MgiylYwS2D
         A3UDZU/ApxCd0KCluip3QmBO08jvSWPKBRnijt5GKo8qDyAmWFULNFvSrsW3RgohOTt5
         NxoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwrh94fwRN3aZaymLw7kO1OW3sRerejQKc2pwB5ObSsDwBL+qWrF2u+mTah9fHjN9g0zfiLTnOziOcPgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzYFt9QWDi9Bw2KeLoWZAS4fiXogxPh1plP4UUlABTh12M0fEr
	btRgK1adK5v9ihQvgTChsYTC27oAladztZdtC6EATLvNbdhaQa4xpG4o
X-Gm-Gg: AYBFou1eQlZUGIEysj59vU6JXhM5rVVMmWjS7QSZ8bROuBki0tEpAfAw2qbZdkUGT8H
	Sc0KRP2BIjSyyJdKrRDcHcNU0D2Dk8KChFA64YhDO4jNttEAHDXVc8WgnP+wG04JTQt85/aaB0G
	5alYDRd1paNRc6vKWMXKMyNRFgISVf1Hq25ti2fUNAtpe4qsGuezHZfIH7lVoBIZzi0D4uoxY66
	R5u2pBHOxAgQm9ECfVeqdiUQ5xhESc9VMPFKyTym+PSx1b0Z8F3cCDtzZKNTqwin4opCvVjEguy
	qmd1F2dy+1saBBBwNlKxxY8t81kbEc0sf0roigl028vrq+UPDCAP5z8mmF1slyuYzPlCyFN4t0E
	It0ibQrVcZelhcYrpo4fGJ5AzrQQc5SXztmgCD/e5qvb8gAT5+8k6/4UF4pvSlwjRgMmH9cORJw
	A6qtks6WLs3pCmOZw/LjdxsKfKQnv6eHGHFoomc1KoN7FSkKhPUvU0uAQKrNZ1KSC1xcI/Vx7PB
	RdzXUZbhVyrhTWiZL1tVYvB
X-Received: by 2002:a05:6000:400f:b0:486:f3db:e0f2 with SMTP id ffacd0b85a97d-48c47fc5fabmr3888867f8f.14.1791027859341;
        Sat, 03 Oct 2026 04:44:19 -0700 (PDT)
Received: from fedora ([2a06:5904:28f:7600:961a:ef3c:e30a:fb0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fab11sm11982800f8f.16.2026.10.03.04.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 04:44:18 -0700 (PDT)
Date: Sat, 3 Oct 2026 12:44:16 +0100
From: Luca Hernandez <lucay202@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
 around list pointers
Message-ID: <asDqkCac9Si2EPEe@fedora>
References: <20261002215746.81683-1-lucay202@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002215746.81683-1-lucay202@gmail.com>

Hi Greg,

Please disregard this patch. I just realized you have previously 
rejected similar parenthesis-removal cleanups in this subsystem. 
Apologies for the noise.

Best,
Luca
