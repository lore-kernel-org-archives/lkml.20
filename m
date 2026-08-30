Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0A10F2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788073354; cv=none; b=ej/78dm4mALO06xp2dMtSIDUUzDJ4tW4B3KZ7/YtC0ZxHCMppyERaI+I+46nE4qiRtpaRm714ffiZt1aktvy04NAeDsBpOrT6Nr/GZI90juJ3WbwG/oAhtc/Yj4ZNUalMJ5aGlMdq6kT38bU/jwle1HRkxaZGxdIfs4G25Emjn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788073354; c=relaxed/simple;
	bh=JYkJEKp+0xkpp63D2jQrcQVdFNMc/UVNBuo1GXnZ9xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZRls4qRvYerMBv6lj7RLCkEjDMoO4pUuU53V/bCD30D/XBRP+ALDkg0HuPZ89jyKqnyglHHYOoAr6CkQ4lJX75ft3sb2WPbeGFB+IpRNQ79jpKZv1wCC9veF3M/WTBsx/ZQWY8wTob4UlzjRemCUf/wh0jMU02emM0T5Xw/LsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlH3Pd0l; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlH3Pd0l"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso26167215ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788073352; x=1788678152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYkJEKp+0xkpp63D2jQrcQVdFNMc/UVNBuo1GXnZ9xo=;
        b=MlH3Pd0lATX5+9L4ZlamWHBBJ3Ty1do8wlEyjP/hMJNFl3R0vDDOnY3imeG/zUJfFU
         yLUMSrzPFFeprXopWGyD6Ap/r3/iqDeXPEUB2MD7KcfyulHCsuEJOuFvtiNHoJjMgJga
         fhGC8Sc9sa1Whd93TqNOzZs24GqZOUIYZKsEK06o0T4krvtw567yJ7dvwp70BIGrzkVC
         ZAKADC43Wcp2GwBEbe+SHNPU3XDbYnBI6oREVXPSY1IJ481dunberjJPCd++WspL8clX
         s8B0TQUm2xPMyyA8mFpGnGgPjg26TiNtClzDVDmf0oXFE4hSadGBSc9bb4vE9jd4dSeq
         5I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788073352; x=1788678152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYkJEKp+0xkpp63D2jQrcQVdFNMc/UVNBuo1GXnZ9xo=;
        b=nBnaheY0zgUdDrkPQ1VslpVQpIG5Dnr9GYF/6B+Ai9udc7nacUv+mLG1CbWeh4/2kz
         U2yubZa5RP3X3Fb9nTnY/Nb7PzqH7bRXrZbd9VoTPdbwQKHs2/31cacOGQxZzfUPSZs5
         TQJNsB5Gt79WzcqTdKTQ7J+N3MVlhCnlJlSknIa15q0OjzamFhioJ2KMfCxfUgSboXTE
         EHfwNUQujgRbtivIhr3dpLobAirw1Tj/P8AHdIZ6OvnH2OgeCtmLlUtP0EZULpuBbLRm
         6GKhnZgfgBPSH/FIPB+UTx5IAmh04CvxaHMdRfyo4S+QfCehn3qToDoxKTauB60hC+h1
         K1CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWIawHaBMuyaqd5TkMjxypfqoEEAS+A1EdaQGv0WzTNChRtDW5wvyqpmpdLWCpUxdCqIAAgqnZ7arhFEo=@vger.kernel.org
X-Gm-Message-State: AFuF++kUwA2sMCl4skyidc1DOOJ5wmQX65L1CrERqDYhvqM8Jtp29dPf
	U1V9sTeRX/nNTSrNEZFHIbjMH3dpe2wjx0gRuu0+EXG+zoCVfTpfnIGP
X-Gm-Gg: AYBFou27PbPacPMWxjCkowC9XC6mKeeleaWReDPUhuQM+9ogomMgwi136ofyhS/IVB8
	g9yELAP61VJq/x9p1QsjhMUTEiPj3LwadFRtj0pk+r9BmBY3wogJSNmo52P0BugrrghFbHsooQB
	f/g1UFSZ+IGkrlQQAIWGr+4ePdgOTqGdc/5dm3AQZuS72PHry5CgQUnd3r6zzy4mqXhCyvB/GMY
	0oWSMiqP1Mn1PYdHiUhKnaL7ujs1ovg1uxXpaB0byKP6ECGdPpNsudQleofoK+0ikug7p+ykTF2
	OKBOHAPpxWX3Vq9S4R70ammfX2GAAZIloFLNLOLuhjHAFvDB2A9tz0/yIKrQgJsZNAlbE+nGGZk
	whJVlxv5kXFZoP7msLBEX1KcXXyGhR90a/V6TPwE/AmRi1d8cMXYQ6zqdShHxttLhRl83+IxrNO
	7VcHcoqeHOLOSnxq8dx/LvpoQpjmZhHJv4kSX3qBgqovyS8IUh68+Tng6mjq0BNTn70wvPfPnm0
	pYDTcZhHfEklNYszL5dKJa9fQk76Q==
X-Received: by 2002:a17:902:ce88:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2d74dca2281mr283760995ad.2.1788073352062;
        Sun, 30 Aug 2026 00:02:32 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598c3da2sm20434765ad.82.2026.08.30.00.02.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 00:02:31 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org,
	lianux.mm@gmail.com,
	axelrasmussen@google.com,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	chenridong@xiaomi.com,
	david@kernel.org,
	hannes@cmpxchg.org,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	stevensd@chromium.org,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [PATCH v2 2/7] mm/mglru: batch update lrugen->nr_pages in inc_min_seq()
Date: Sun, 30 Aug 2026 15:01:53 +0800
Message-ID: <20260830070211.77958-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827234704.63163-3-baohua@kernel.org>
References: <20260827234704.63163-1-baohua@kernel.org> <20260827234704.63163-3-baohua@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Instead, accumulate the size changes and update lrugen->nr_pages in a
> batch after scanning the entire oldest generation, or when the scan
> stops because remaining reaches zero.

I have reviewed this patch and the related discussion. The accounting logic
and the break-to-flush control flow make sense to me.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
