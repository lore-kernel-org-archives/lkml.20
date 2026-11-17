Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887676;
	b=ltIiRg18P6YKmXiSFF3iPlvE8jyYxlO+PmzGzf+ZbqH+sknVci9mQSzLeoENwIcmqsH/
	 5wCNjjb4vJvTw4mp2r5xJ/heUq8ZRYFO2LB1Bfcc0bo92GfVNJXr26dCTd9skSX/U34AX
	 y1vqlMJ6bbSXI0dARF+YnIpHnrgbqK48uYFnRC/b/ch21TTffzoTVV6kj9aCAqCqjLdUe
	 4uFJ3Y/YEqDDSUJ+CEZ3xdqhgipfYv50+wkX5sdNM4S2qsf5Ae+/MnYDLQvMYrkFxinUD
	 hIiy2Uu2RAk5m5ADyAHBcR3HTiky8LU7fFBvO3r910GcYTWNr3gTkXj3xL7ohC+ognA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=5yYPPMuupwmdDkr+0YrNM2gwTmLnnxHM0lDOoH4/yWY=;
	b=XLXcmz8N44nVU169vumdlzr86iFq9iu4IvkSpGcN6muWbLXHixzfqt5ek55c2IeitwR8
	 DZiNUHxfnRynFrPmWvCnLH5tqy4+2Rn6huVJo774yqAMLeIt7G/oeXuzqDLVBmU050YU6
	 RzOBpzgwQGkY488+b9Hi9LQEpSyxWeIVYS8xkaeR4dn1BRvHA8ZK+iyYzJdSGH3fksgDa
	 6St9/zYk/0zznM/IMF4ly49kkNkpT2fHJRXTWWsYlvkkoTAb/OVwlR95KOfA7lNSI3Hkg
	 Yu6HupQJDvchQOUxIjtkyPi/VDZeZmkktKo6bhZ4d+2bbB/aoamPqjHmVRUyGE0HupA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2f8mTIs;
	arc=none smtp.remote-ip=74.125.227.199
Received: from mail-pi2-f7.google.com (mail-pi2-f7.google.com [74.125.227.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C82606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C82606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2f8mTIs
Received: by mail-pi2-f7.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso1026424a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887675; x=1795492475; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5yYPPMuupwmdDkr+0YrNM2gwTmLnnxHM0lDOoH4/yWY=;
        b=g2f8mTIszN7dVObfqgo3fNF0P891H6ZEKGtteGSegN02r8UpGCb2URkABmGUmYG5UX
         h7d0gzS3tRjkJRrRdxRlPb0Q+FbXKI/olJtsgjj7en8saSqG5KG1KtXWmv9v/X+yEDp1
         ELd3qugxCtjn6OacodEj3gOCDBU0VB+iC3KeH4MlVUwYsPvkQLHn1tS4DuT4bdnwMrsi
         Mk0KuG/ZXGEIcVOY73FmrBwF1rua0pZ4hheyQYe7+YQW1YsOUlsqR7wGCIkaFXTUn3Ia
         oxA+RviOv+5nyuz6paA0jGNJF+sXHbsU5OpxL7bjVaxQQ4u3KejyjhKXnYIBXKpAPiJs
         twwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887675; x=1795492475;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yYPPMuupwmdDkr+0YrNM2gwTmLnnxHM0lDOoH4/yWY=;
        b=Wg2XUX0nYouA6RpHEDqZ2hE2TsbNb3BRvsonxN7TpNtP3sdlf7sHRepRzCEZ15xkis
         J2j5/+yY+iyr+FSUto3am9yd2qBZBRptC/zJ7F5iCbnyIJg+FK/j2+Re2CwL1ZNb7xoo
         DPc1aQ/xTtS2s0JA0gXzaImW16N+ziTiVIY8BoHbzBuhuveAU2ahK1X+MnKD8ySWUEiQ
         WeejtZLi3n7+tc89Xi5QvNr36czRfS4Nh92RmmaAliXloTbRA5417420+MlU9T/GF3I3
         /iQPsqd84qrMtHuxLXdH9wMJ/DvRbgpi2+/2Zk5akVwn0hgnqhiU9IH8xY85PNJQwan5
         NjDg==
X-Forwarded-Encrypted: i=1; AL+hErHNScJhcUg8rar0a3P9SO2hZZVfi64GNiwby7++bwCkrU4VwVs3CrRDgCw1DA5AtSGJusOHT8QCaHOif1s=@vger.kernel.org
X-Gm-Message-State: APuU4Z++3MyWORxOzKNgW4nADbuwKgO6pr3fkXJ2A1QINdjO8yJuxYwS
	816UUtLVRsXcnpjSsgf6Izqt9LgIwA6cnwpiA6nIOsR/yxEQ5F7pBibI
X-Gm-Gg: AYBFou2Gkunus8WqUT9Cb8r25NL/Q5LnuCCAJInzPaoVJret0PaHFZM38lmV2N+I4gZ
	21pakIdc+KeUfKZL/l7Y1sOdG29Wvg1DW0KjnjUCpYgROh9vsI+d9c/Q9osU+QMW2cpPul7e86P
	L9Yg9CNYENXu/Yu5dqe2xoiHhPGipoFG0mRmP7lQEw0B3Ypcw9hoaXiqtLcSECeZ3wGciAlC+xQ
	r3LVPMHAi4L7q4kwd7kkXzhBi9Izk/wTb16LmalG+8sxYg4281Sg6lRXdf1iP1QQSSR1ViayzkA
	Tr3IFr5xHaSsn0fkkohR3ycXmbhJTIyg5xrQjGhpPzccN5WOnsKU8Vq+gwzlo9GOyqMaP20NIQf
	KFeeqCop3dIFP9TvFAB/ZcUjCNuDqO+cGBw2MQZIJ6JPpWP6VfYfFtRPR1JhT4UpsYILoYrAT3N
	DFuzUsvijy0G7C/svmr7xh0T2DpHWonv/CcnaEW81vJCcy7MCLTwB5ydZZ4z+gIXU7fvKNCiOJd
	QL/kmfScFzqKJcjk+vYgzfERp5gu9sDcBtJypI0+szYk//mLvFJbJea7nhZScE6M58xSI7wXh4Y
	GWWALmSdyrr+OBMV+gH/Um/hPnfeO1CXaUS6k17X7eUO18C51z/Myl9ZZa82xCGEZ/lyw7RNsKE
	ZnFj98Dz32fa3JW+Exo/3EhgiP6+FZHod93u7Ub6WeR94sqB8kFjv7bLm/e/FXw==
X-Received: by 2002:a05:6a00:bb8c:b0:883:904e:da56 with SMTP id d2e1a72fcca58-8beb677fb7cmr12261080b3a.36.1794887675077;
        Mon, 16 Nov 2026 19:54:35 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263649esm4319559b3a.45.2026.11.16.19.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:54:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/6] mm/damon/tests/core-kunit: test
 sz_ops_filter_passed_last
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 17 Nov 2026 14:49:05 +1100
Message-Id: <179488734513.2.6285120857568566018.b4-reply@b4>
To: mattathias.pinchover@uber.com
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 Mattathias Pinchover via B4 Relay <devnull+mattathias.pinchover.uber.com@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, SJ Park <sj@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261116-damon-sz-ops-b4-v1-3-1cffe7227e6d@uber.com>
References: <20261116-damon-sz-ops-b4-v1-0-1cffe7227e6d@uber.com>
 <20261116-damon-sz-ops-b4-v1-3-1cffe7227e6d@uber.com>
X-Mailer: b4 0.16.0

Hi Mattathias,

On Mon, 16 Nov 2026 19:10:06 +0000 Mattathias Pinchover via B4 Relay wrote:

> Add a kunit test for the sz_ops_filter_passed_last DAMOS stat.

Since the motivation mentions contexts with multiple targets, maybe we
could also cover two targets in the same context, with the stub returning
different sizes for each? Checking their sum, then changing the sizes for
the next interval, would verify both aggregation across targets and that
the value only includes the latest interval.

Thanks,
Aveline Noir
