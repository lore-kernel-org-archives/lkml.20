Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CC6345ED1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402255; cv=none; b=GYLcPDV91x8eOZXRuOKsQn0Jp7wcmDjHJ1QSENt9v46i9j6tlYByTE4K1qnDmBpWr7AxXw4U1x4vdPVGFtQf7B/rz0IWTb7oMCu7LbOtjyAt8hKHaJ/ATGNjRKlag9zyd0X0v7GqW+7H5RGjpk2ofNcRzEeYthuuNdmEz56ECkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402255; c=relaxed/simple;
	bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dG8sj2TMnU8FZHicw0G9JMbMpf+MB9si5iznmIajaQ1F3dC6Q2p7hJGo7mGH2tgWy4mCvs8vKtuNmZGwszOoFZM0DMROvvjJGsG1qxNXqVbM6QAZRfEQOyA6cm7LVZ1auG5MTYnJbTOFUKRUtBZXOyXyA3DonQtQ78AQbvFzZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKtI5OPK; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKtI5OPK"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-395cf2535acso567762a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788402251; x=1789007051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
        b=JKtI5OPKYgnHrf9Dnqgga0fvi2ZJ/x8+42Hn/6x6VZ8b2fqLfNt0iu05kDa5XGjXpS
         ZqYXEjybp7stvUwk0yBDEYnwp1WdSUy9OyapzKiIy9TAz3OXiMHWgxAEzc9xn23Jx8sz
         /+B2EKOL1XRUarPdgS0HUVS7d21Q/7cHbNCbuxExJ4q3Lhf4qD8SFoLFgDoHhKH6E9kn
         f8OBoLzOMMXTCc7hiUK+zvvTZ1fpT/digCAXe1UWjfW90THr7WI5ZWeGDC8pOBrZSDoQ
         OOaUEP0Elinj3QrjkaN0zku/q567yh87vuShATPnzyUJKHlM/gSepzSNT2nhn+EX82Vu
         gFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788402251; x=1789007051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gm1y3HjSbfjetP2qj6SkQ/PvAerOiP935sq/jHQIUpg=;
        b=PShw5uOOLQaiZeWQP9SJxy/f7v5y35t/B9eQDor7gKhNNRHamjJJcVZgnoCZ9W3YTm
         b3cVBzVUAJo0LLzqtuS7rjVvq1x7r9HPzBKOs4Fg5WH7WXmw1OxqvbMY4KEqa0Dgpilm
         OzqcF8f5h7KLt1YMV3MeeGY2SHXytck8JxwuguAn9H+1llCuz9IMyjL3IDYwCZbvSHwV
         PehUxLXnfJSBvyNH3JcoJgN3wODLTEAIM4VC1rGcdg5TZIWMKn/AjKIeXWrjjBEEdcGf
         q8LgC5/sytBOAdRUV9CQHX7AnFtC0lmqe4Yz4unMV3sOi6baejytN8CMJL1n0djjmYee
         qFyA==
X-Forwarded-Encrypted: i=1; AKwUvBwY+2Yp++LUjlUeolvlmNCgk0ZD6giXEVLc4vYTUrJgMy4r+P+v8/m16JsKHeQTkS2QPQD5hF78Y21Uwj8=@vger.kernel.org
X-Gm-Message-State: AFuF++kGDc8lWuEW1Q2yOGSGhTUtO8kfwyVYZxGNE7NEyCYalFfqna0h
	ANpUG+e3DhIE/6yMpwx+OktcFc7GdHbeYQFcYHHsnQxPFvWG432QQ4I=
X-Gm-Gg: AYBFou2GXGK7mPd5PcEttF0XR2/heJ8G5fIarw7S1mb3/w/UD8suTG8vuyLeNl6W8Y5
	9e0HJhzAO5blSQ/NAMkmOyFG52gUUfIqe/CkhzLAMZcQdo7doL9ri37fzE4cBhKcaQyyjyFx7Tz
	nzBI8S6SSRKa3Hcrkih+SZmVx7rIbo/CXPB1c5pLTwjETkGbDWJmDzTzMWgsb19QzJCfPAj7ZJN
	MjvfvmkPpbz/8E6+h8TZ9EIO/sNDQYE6xwRzX1JMq3ifXwT0c1M48kJB5XP0NFx6v8FuDvRq3rX
	OOEAs9mSdKKMlzkOhfFApzLS4DP74inBSFDoGiboVJQdvKsp1uH9w9yoVfnIkuUqMho1YS6dNZK
	O82G2D3YCTBPD9r30VaCYHSCUiPfLFjMHIXXUfwZQ9TbxwXFeN754ERP9JdZJG10oqf2iIpLV4P
	vF8sq8VGTKonnc3CBPeQOhjqeZ1RBDKTaQ/1niuvIXgsPudfrm1NN1NtUnxMYwMZ1tKCJRHr5e4
	KhhCoB4yrdxYmxEAY8/zG4//KuK
X-Received: by 2002:a17:90b:2e46:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-39b08653554mr3443262a91.19.1788402250805;
        Wed, 02 Sep 2026 19:24:10 -0700 (PDT)
Received: from anuj-MacBookPro ([2406:7400:63:f76b:3efb:3463:cad7:ba39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm2062933eec.24.2026.09.02.19.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:24:09 -0700 (PDT)
Date: Thu, 3 Sep 2026 07:54:03 +0530
From: Anuj Gupta <anuj1072538@gmail.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, sashiko-bot@kernel.org, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] io_uring/rw: keep CQE flags on iopoll requests when
 adding kbuf flags
Message-ID: <2vfjhhjzjoii2xaetvm5nadbvqfg5gamjcszsrj6ks5qvil2v4@sii3illc5s65>
References: <20260902210200.2336720-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902210200.2336720-1-csander@purestorage.com>

Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
