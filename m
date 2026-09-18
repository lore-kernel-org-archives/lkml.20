Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2851AEED
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751249; cv=none; b=PZnx8cKx58gyf6otet39iePtKms3ZlovP2J1NfPPunyH3Mvh2GKCUUAvDoUv+7ittXtCMo8ZzZ3mSagWCHyZhySniHPSleC+vqI994utAlpR/xEDybdKlUeoCV/ZjLaMboZ28lUk90wmD+662+wpqpllYcnVXdrWUH79re15dl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751249; c=relaxed/simple;
	bh=PVQkb8h/HFIIvBjGE5JjDQ6o5No3SfXCNcrCIUgaTp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z178qxorgrvG1xGuc1LrxpQRfEh68rr/V8/yQz4eJtS1BKl+sLZh420iO1WlLHmzdI9WoFhEupvf4boRIfQL35JfmZaZJnbhU7hPpaPQpLgjs6HfxjYH8V3qUTYNXxD8LUUpTsdxKEV9Uzk6mHxMUe8A859nFeVka/NMvBvCprE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dn6AGlFw; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dn6AGlFw"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so705171a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789751248; x=1790356048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVQkb8h/HFIIvBjGE5JjDQ6o5No3SfXCNcrCIUgaTp4=;
        b=dn6AGlFwhBLn9O/X9aUYrK/hrWsfc1mkegowpeGmmdfxNFB/jVP/f1FRekVbObn5qH
         9xMn/+6el27xZkGSLgeh6/Uq3R/K/KZTBy2eX0pXrEyNf3NoR8zw2ESt1IDBXObSRT9R
         LULlPcUwd7y3y0RiPHoqlM79ineNtR+D3QxX2zA6jZwrzs4+Wq4MAnf/BuVRv+s1Howb
         rpPKum+T/vUXmznDuccCc3xxNoJEcNn5MndtNpJQaeV4eWmOwPLnhqU5zWAowa/qP0UA
         1H+mYIgDidiUxTKx56u3L4demieNzyHEmaAsSMZD/QkBgTUt85NWXbxsUDzqRmX7i1Fx
         4LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789751248; x=1790356048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVQkb8h/HFIIvBjGE5JjDQ6o5No3SfXCNcrCIUgaTp4=;
        b=cuzTOu2g6FHsn2fIwv9NPOoGVXPThnj61Znt02DSA0or9225vh/y6rwM2/YrWl7qxi
         Hvt9mFgTvGAlBbjZc3qIxRMVCxy9Mddl9ST1MUd8jMTOOWtaZ6lY01lTX0nt6V1GKL4S
         8GbVIRMaUqm30MOOm3GnyDwvyq3oI/oQE1BFLFhRflhJkmPhGyI4L6iEEB5dkhFwuBsD
         ZDkeWA+tQ22VgcGP2ihojxBegtetHTws8HU72cKCbtWqqmtrtcdeVD5Mwk1oOmFXaJlr
         Q6aWaohFCU2j4m/Wj2qNc11Lxt3/eCYPh2uO15XGVcmOG6irGTWNZ8laWdROszS8PFb8
         wFYg==
X-Forwarded-Encrypted: i=1; AKwUvBxIITgnRUIF+qBtKxjYpP/OHLPajSPvG3IgygM2P5DpoB9Igvb31Vh7NjfbF5qpOCWP8WMBdxwC31VwzYM=@vger.kernel.org
X-Gm-Message-State: AFuF++kb7PZK7rv9JU4KBlGmCxJUa47X0oDY2/XoK5PgoduvMQQr906c
	jeDvsWAh+QHh3S5jdQLiw8dlPOaLsaG50E1NMXmxuYC9aZ3dPT0zVem9
X-Gm-Gg: AYBFou3i/o8a6nsAPplcoGkOfUggzVjLc5KHaRMK90b+Cx7+66EpVbHqd8G8DaCtpIm
	3+ERAL8cKd+0WWmCslBPqv9ECQEzlGcrI9bDh6inVkHP3Z6V/jXyY2M7MXAG6wJuxxemCX4cIwH
	He1fPvl8WzVzHYR7lbPXBNy5mS/hjZfTYjZvv7+bSObE+SUEmC5Zn+AV6vkbmMAaOtH7EDx32Iy
	ZzQG5Zp3U8isLKRFbZrMf+6QP5hJ0kJKzG3wkrwSL5SjkB6d+S6K9B+Sh2oT59AqrmdZkmRx+9Y
	3541HUgeMBxXND3PJy3hXinW7pLh6ib8vtwD9+RCVBYbeAfZCb1g/8Poe1xXAJRAwfNXgrj4kY8
	ybtGYPC2qeNAszdMgx+8MNUCF0TNs1G1budNM+0iIQW523fmdevHre1C56u6U+3uxR0CucjvCr4
	UtKSBMU92uYxLGR0MxczADCeaBu4OcPMSlNm+oGT20tULrNiBINXBQWQr2NEWhyRmfxaxQlbahD
	37eUwXYGwaURFYn4APysakINgoH+ha5fI7ORLu4BpqXxm6b4efy9hLDSuKjsxJc+CZr7Dg0eUX0
	s+DVtniEWL46hFaok08KxzJre1E+QDvGxg9uEJFFvT5s
X-Received: by 2002:a17:90b:39ae:b0:39e:6c69:34d2 with SMTP id 98e67ed59e1d1-39e6c693659mr358962a91.54.1789751247561;
        Fri, 18 Sep 2026 10:07:27 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.202.182])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e29absm116665c88.12.2026.09.18.10.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:07:27 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/damon: document that a zero sample_interval is accepted
Date: Fri, 18 Sep 2026 17:07:20 +0000
Message-ID: <20260918170720.105849-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133513.26828-1-sj@kernel.org>
References: <20260918133513.26828-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ, hi Sang-Heon,

Thanks -- appreciate the review, and the pointer to the July thread.
Will post as a new thread with a link to the previous
version next time.

Thanks,
Karthikeyan KS
