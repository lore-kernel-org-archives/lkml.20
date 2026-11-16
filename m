Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792910;
	b=QcxhhOYx/xOVKWKAUGVZuBVnbdRqXE3znSy1do46IWd9uTRXG2ahE1OWEjnNh9bm/AxT
	 3+neb52kLZnP/Xtl2ybeIqERAoUyOQK1fehVjNeasLZP9ubRl+Kktv4rK33UlshJj9htz
	 rD9jTuVMIm4jddM93vEY05FSOM3gQvPhzCRClVFZ4SyHI6NbljPfwTjqvFfVROOzvqyts
	 WLe/Ag+wafiHFYm6xn2bxFcF+r7Ou2WB1F7ofUsGeMKP2EyWKn8rcLJz+4CORAGvXoeXe
	 mFdhG1WQvK3LMghIxCFEnschFNe6NFwZH/jeoWWoFB4TxyMgDS6ZRM4r6D3daj9p1gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2qV2xY4LfpSszQHqfRtrep5k0fN11OSh8rH7M8QE5g=;
	b=cXBWAbqmzckLaDeDZMJj+wsSGivcpV0E6t2DcyBNVP3AGbIb2+kATM29lG+pKcDDh2UZ
	 pqGPaaIPqdgySYavLix28quzQHkgGLYu9sdzmd1+OayoPWyBiWVjnmotLH8ISIWrC7L7c
	 BSDrnyYwZ79GvzXUh0yikyXADN8NOwy7dimIDOLpC6nGB2e2VpfkS1tfofbc679U7tAVr
	 ojULYoEieFUP9kTA/5ZRe7eCnjpuS9W2d3hr1MrLCAwOroEvTI+TPNzkwHYH+cPYiSR5v
	 JafS3MfrKfZDC0keNN6IwEwlq/W2kJK7S+HfXa9/B4xqcuyOaTssUy42zSwHrNueTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BabyPJfq;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EFF606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79EFF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BabyPJfq
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed28bac8d7so12062445ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794792910; x=1795397710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2qV2xY4LfpSszQHqfRtrep5k0fN11OSh8rH7M8QE5g=;
        b=BabyPJfqAmK+vdJmVWU5tHzWp7XdFLw3qxYGCv5gi5HdgxyeyjlcgHNrGRaDgqzLhp
         yJRyymXeweQdDFyMLwy7FrKWqtCarunrDAx+HsqgQM5+dbMT2vVnOHWsNJzPpvqzhxWS
         fXyfzvPeYXE7gn1VJRHswCw9Fl7mgo70OkZlwbsEWDh0pG+g4GFFpxOYEJtJ0As5jjED
         Jlf3Y2ytQsVSXkKC/JdNxDofhPs7LjHlwxTuJ2vnlI7AtIveUh66bc/7waDY7nrS9jAu
         J8+BAlzacxLF6hP9F4B2R8fGp2sTwhO8IouEaNl5ca9IgPA8saD6Z83U47ob92t5esrN
         oeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794792910; x=1795397710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2qV2xY4LfpSszQHqfRtrep5k0fN11OSh8rH7M8QE5g=;
        b=l1c2Vyf5WQfFHPDnSmbiwnLOaMWzFoNx7u4mxDIlWJIUb0mSbIYxHLy+7SNLjjGapO
         Bw0oqPSx69ePZpiS4fo4pey8Lwn7jPI7ccigUK0Qr8cuEJJ7vKVrP/m7CGRZfl91e5VH
         na6ozBmuDy9YD00725oHIIiEq+/JcD0ri7fevIWulDlXDCmGwLh9tn0CRu4RVfqPU4pU
         PefcPaiz2+cIx9qyI3wCgmy16X3Ex+LqtXK352r7ja48SJS90Ey4KVhAbfibQB1Fpv4O
         7PUcRVvQcqrWPOPtZgYvpL6F00l+ndetM2KWMFLyZ0wFTtFKX3p68eyMDJP8l6pRTCJp
         a7hw==
X-Forwarded-Encrypted: i=1; AL+hErH+TCS5zDHOQEQvBsVm2BsA3krG7HfWOJp1Jeogme3A67Tci0/F86XwszJLn4hySZAbeamfisj3QUbSlEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HJWQeTF7GMIq0wEPlFMEENMz8Y3qXFY9m0NOmF/vja27QD7+l
	35+zFTYnj22j7zUT9ueZGyxXVhZQg7akMnlPkIh5u98+CbiLJV3GOnFa
X-Gm-Gg: AYBFou1jXJabOeWompb3MOIqI6+JI6fS/8ffyQ3VWG9DdUgCbJvW1+wfM47khKiZPs+
	Lvj7M3Ala89CSaG+SJFhTwolPvKdjcqdGitcrDbd2YcPl4o9KMIYOdNN7hKnkskoyia3nMJziti
	wxnazc7/PKQJ1r33Y9BcFgGdNccidMjDIgAbv577eqG59uWs3/XjJmvTH/t6XlQ0TTIJXLvXjns
	0PBQPXEC9jZQSrW0hCdhW/dwh/CXKQcsXaVG8AvOKDdkQXu4WmTfK7lM+R0aDpdXhVyf0Y7mEAG
	uM02ZZTlk5nABOSDrR7K/9Z1SEw8A0OHrvIy84Z7VYgKb6GjQx7p3tODKo62K7CCVMc4nJm9KUU
	g7v9a+M03lhz3HVK5LQr4CCzAWi3XoQdM88HIsW1PUYTZ+4q+Z653OhTY7wKhFWX5ni5j8qf40W
	WcXT2INEshwatmGjZsGBawsp0Eitrledl8Y2QCZm5ShFeq0hlZJHKEGVkZ2h1Y1Dey9jJQFAirH
	aUJYlBm0FICIyDDzCUL2uvqYxcL+1Anjp1sMzQ/rg62wMP3hQE37hfO7JRXB870V6JIffoIAAoo
	E4Dm/ZIYAJe9+08Y8ecLW6HhfXQQrf6UoWidxbtMw+vvE8AQWb0Sh/QHXDjEle4M/PmZTYUI41i
	jDRzaO7oRSHYaJI6M9XDA+0V16pQG8m7X7++tLYfxtPtQ2Bnwgru3at2DX6Sd/55ZuIwPfPN3Ba
	qLYHSSN7JFhLA/84NNbL96VT6fcdnCJm8wfaw/aUmX9wjU8DMOnhQSEWPG6X3sQyJIXghEBnXc0
	K7knfwJjUMN5otHg+H/U2AOsEZaPTj1mbm/LB+Img0x1URK//Co1rIfxSLpD2Ybz3B3h2KmIz3F
	5A6kNk7JDQ==
X-Received: by 2002:a17:902:fd8c:b0:2e9:46a9:9b56 with SMTP id d9443c01a7336-2edf206817amr86764315ad.21.1794792909812;
        Sun, 15 Nov 2026 17:35:09 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f9f13desm29358595ad.67.2026.11.15.17.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 17:35:08 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: af_key: fix use-after-free in dump_sp() on policy migrate
Date: Mon, 16 Nov 2026 12:04:48 +1030
Message-Id: <20261116013448.15443-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <179477319143.3291.12335649021318391220@kernel.org>
References: <20261114223529.1791-1-danjwade95@gmail.com> <179477319143.3291.12335649021318391220@kernel.org>
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

Discovered by a clanker reading the PF_KEY policy export path. Reproduced on
an unmodified kernel before the patch was written, with no kernel
modification, no injected delay and no error injection, and the fix was
tested against the same reproducer.

Thanks,
Daniel
