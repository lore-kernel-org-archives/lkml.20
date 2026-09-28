Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D54B4DDB4F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618033; cv=none; b=jP7ucZa7Tljq9PQVXaFN4pSBxReWhtN42gId2+djHwoJST3thhdxOZChNwwydvmqWTfvpTmNALly3SYbFi/nKjyeuu9Cnn/N0+c4ogHD2MbLbJlq/v+6/5ZYwsWfaXvoX+PTKEjVAWQw3ZNMXK5hW/gQuPsAw72OytHtw1qjzcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618033; c=relaxed/simple;
	bh=Ry9723u1VCONEYNULtfqjmkGkxac0FV34z/xJBvJ25M=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=nWzAXhyms2bxq3ikfDamqpI1sbNfI/rEXqR0Ywmx0Xj4bJyPC1VNUA/YrrkTOxvIeMMCh8HDFqjOpR4oGmMaN0LQOaQNvtlwx+uYp6j4e7T05LKGDmEeinZZl2j2YbVBLsSZIOHfb3mpYURU8tT12SK6fs5ocfjzEV0EG6LpviU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1OkH7Cg; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1OkH7Cg"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c0d931083so1222986eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618031; x=1791222831; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ry9723u1VCONEYNULtfqjmkGkxac0FV34z/xJBvJ25M=;
        b=h1OkH7CgfMgL2jC46l3+YT7q9E/Uyf0NUOQQnhr/qvHz9lcYCxlcyuZg6d1rkoOY0R
         SVi4lr50LYLDH1B1/O4MlzoPQgrXZaOmNGpYyU0G1q1L6RH6Zpq+xeVxaFKiz75+RtZD
         TNSeG3wykNjs1BtVamcONwZkgtBy8NySy5pn3YV2ZNuhCuLOr9CDSx5hxAZUKBpJPFhr
         pmuCYuIiuT+W9/X2fsxJonAeffwSt24uFixjzq2J0W++LQCMXsUYVIQ/E0Yc4PfwofEC
         4Ke6OIPo22AQDO3mlboSklpovaj3vONNK5siw0/bG41nfUi8Guk0aX5XfBty04V1uXeI
         on+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618031; x=1791222831;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ry9723u1VCONEYNULtfqjmkGkxac0FV34z/xJBvJ25M=;
        b=sx6J67wLMbE3RdpG0pA35GM2lIKzN0QVlFuJCdaj/0sYvNJEXLXk03sVBt6d5O/0OR
         QSupZtdzMMMvFIfrxaIB9cJZ+dFxQKVi17yfvWTNCIcdv0mwnRmtvpL8+astKDtgI5vZ
         6tC8Jkiap53MEaVGXDGGBZAflYfVh5FQ/omjCtyBRD86nsO0KWBuw9q8eVdrSBDfdaKj
         Mv7Fd9LfIWXGx0gAiIs8OpHAU4dEP09TE3W3Hs0bGBeiydGzUwzh+5hmi9mCp1iOH2rQ
         vNEezjQuXDlJ0Gu76CANCT+HwYEMb/APSNZ8Kv5JVoJT7w3ahzFdu31stEyp7EvA1x4Z
         ZRPw==
X-Forwarded-Encrypted: i=1; AKwUvBxU36Mu8JhUKt23wM4ZgSTEvgEVL8WNARrASJp/OkrAPGE++hNsTpQD5EFL2/Ccgb5jPkSkwEZr0lDf5vo=@vger.kernel.org
X-Gm-Message-State: AFuF++kJRfch8S5aFc5Y6shnVdMJiqmoCkPXzBDvlCEMqB8RCHpAd8GY
	x72jshVdSqxb9li6jvfhezF4IYrWvfaE7rpE3ow24udjYrBCKCqb4j/zfDQicmnl
X-Gm-Gg: AYBFou1sCz7gl5IshPq62rqCnm6gr13ncmTWJWxAQmBUQ1WOncDU+ZWpuWRbm0Ep29k
	4BvvGMYCOmXw2D9y5x2kE5/bjrOaRCwm1CECQjVo8M+ILdZ5oIoQmN47+yuylpr33gwe566XFGb
	HGYd4xVLBq7hGiz+QooAgiEf1IEQInM2SEBL3g3Xk9VGkOSAtgMj47v6eGaTrbaY6N+agW3I90w
	WtxhUJmWnVRuPA7ehTKrRN71qYC2vaSYmZOYREpsIwlm1+EMRRuZ4Nz8Nd03cYq1F7K57prg5va
	vg2qDIpPsKjECy9Qia0gM6fPT4l2CWIoZPLOSXqa7a9p3fDDxUleMSI69UHjRXhzOdmROm7Q4WA
	UnyZuvoMnhyZfsxJIzfWvApmdWnB77kh9iYihki4KPjNdewFVyRxEQ9ktrXFemH2J0l7+cP4/6o
	B77AB0mIOBB2Dayk2resKpGj6xPGJQvC192ykdw1l4tb2NjAwcOkawtjBm9C2aNJXTc/mqr6FO4
	T/oO50/Ogu2zxV8jyuBb/9ms6iC/C89bpeNWe1bZ+WX+XZnK54tlg==
X-Received: by 2002:a05:701b:2210:b0:144:fb71:dbd8 with SMTP id a92af1059eb24-14b2b6bd4dfmr165181c88.8.1790618030705;
        Mon, 28 Sep 2026 10:53:50 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb6b9sm24285377c88.1.2026.09.28.10.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:53:49 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Muchun Song <muchun.song@linux.dev>, "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Muchun Song <songmuchun@bytedance.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Qi Zheng <qi.zheng@linux.dev>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/6] mm: Unify device DAX and HugeTLB vmemmap population paths
In-Reply-To: <8385F749-0F72-494E-9CA2-2E433A066712@linux.dev>
Date: Mon, 28 Sep 2026 23:13:35 +0530
Message-ID: <se2tjmpk.ritesh.list@gmail.com>
References: <20260924075259.2013039-1-songmuchun@bytedance.com> <607759bf-59f2-4ad6-b95b-e780ed2acba3@kernel.org> <8385F749-0F72-494E-9CA2-2E433A066712@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Muchun Song <muchun.song@linux.dev> writes:

>
> If you're planning to review this series, I'd suggest waiting for my rebased
> version.
>

Hello Muchun,

Thanks for taking care of powerpc side of the changes. Is it possible to
share your git/github tree somewhere? Sorry, but it's hard to follow
which series is based on which and the overall multi-series is based on
which upstream tree. If you could share your updated tree somewhere -
that would make my life simpler.

Thanks!
-ritesh
