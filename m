Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931052;
	b=e0XJVp89AsM4gPhQiWSAs2RFQc/uiPdiOAVmtlhPRIYOjpIcGIQ8rZZyLhnlSgBQ5J6T
	 SMLroh8VNlZZapYiIIQ/NyjPmeLm0cn1MObXi7HnPIQYf6W2ZecdrCujgmIMJM2mSJtRh
	 6FbE5+QLoUedqFnOBxBmN7Fxls9QmbYtX5O/HfF1xN/8J0ebSwRTkkKNJnq+L1bCvKitx
	 4hcjwUSrGzMdbd82aRWtGyoYKRkh6AN3phc9oalQiHFUHvbQOY/wHr+Ip8W0yud/EKc6s
	 FTm1cWt9gl6XGOCONFGVVfupe9FooGlvdcsWXJeLbO4c48OJNUBzYUZbjRsAnEx+NsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=3+FyKPryUnxHupmwOSIIYdOL35FcAHgGEhz0DKQNfhY=;
	b=x8yTDjxcuUfmDMBObFXjRa8Yqf+8StpYLbX3WnwmwBBxVWSicSppF3uqPg1qF0VxI7nw
	 1J22rWgHEfbuA3TGolBQQFbrG7uWIUgMm+qmfZuPe/CUUETRCPfRkf8LcTUeHofEQx7cZ
	 ezVKkMrNvK1GLxhveWQQqYSqj4MI1rmvVQI231afONiyUB8dIwLNlkCkFw/Ad8EmImA/M
	 IGfAK3HpYJytxvZJLelMGO52NcOEPAIbbbNkxC4oUlm+w5kH/XVsC8U66uM6J0nfac2cP
	 m8MepwFZGh3YWjIgBjNZIF8r4h0bXK8scvhCKGG5khNh+/oEyK8LiBEabFx2Ia8nf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVR2OQN7;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E614606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E614606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVR2OQN7
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso1530251a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794931052; x=1795535852; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3+FyKPryUnxHupmwOSIIYdOL35FcAHgGEhz0DKQNfhY=;
        b=PVR2OQN7naGi0aZNxQqGGOkN7W28bMClIgDW9Q4oP7451ufRW2PR1/l9NgHtbFLrKx
         MAXpG4ChnVfeI+w4oqR0v6AwU9Lb2Nl088KCn3lSHQDdI0WqUmV96L82VDsSuoOwtBzE
         vOb//Hr5ZLVljyYhx7GUW/A47t9HajTkTUiMXBJlvbTFjjKLWtfjmY6vW6w1IpCkkukN
         2mr1Ai9pxiIAmXZDHpj9Uncl0HVO7ZHtFprXf5OuS52rC94G0v8iVc/VyV2gCR2h+im7
         BWgKB+SRRhvKxb8wxvvmKEP88/DYbOaBjmc4K1iUr4JB+nsD4k/2kPy/Ph5PtV8RBkx+
         UVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931052; x=1795535852;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+FyKPryUnxHupmwOSIIYdOL35FcAHgGEhz0DKQNfhY=;
        b=amMqxwfQUJeiZI4Bn327RbmFFFFKC2mnv3ls37/+376IVtlQnYT/U6H7Q2vxP+cKfN
         UYW1yvK4b4QR9hgR+WtH47MtIMr9P5/nD+hA+dWH5/sNDD/VTZxcS2ZBCaf7gnoCwUSR
         O+gHaCZq1O6kMV+mOahPDJ1V1kYZd0Tz/kZtvza1gpnuJvV2oZfFpCrmTyWwMqKX+1qz
         F2blgEmmBXMBHDvfOw4WSMUldup+SL0vYCExuLI0jitLQs8nJeqsYfFuCiAmf00WwMKs
         B/72aRtJVZP76/hlj2cfZNDMWN2MY4lHyq5pKWCL3rP7SrnMmZqdsA8Wjd3Dnmpl8Pok
         9wjw==
X-Forwarded-Encrypted: i=1; AL+hErFfyWELqRFPnSWjhHVQvSFv5cqg0kAo+ndocG3fTwM/vuqU5b9MrmLTTCO53WXp1CzdZ6RUIjoEYvlv8is=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TNl5WgpaU77xUz60RHljNhaUpjEAopXv+8FufAQ5cnK8UF158
	nCdOvHX1gjy7niHy4c1VAXWFFiVl4kkjxKJaHVEI8dsP5ABdwXo65KW1jt4XYV4ObPsqbsfk
X-Gm-Gg: AZFdTZdpochT/QbsKv8o/tR0okz1WTD6hYJc2NLy40oby4iFaBNfL+5RmjKnBJh2kN0
	Wfw3Wes21kzL4SSmuGPeY/zOVzkS15itJ6Of1ah7+0hNoT1NKL+y3HAKFySD1+rYUSVYf+fCwmj
	cAlqZFEYa0iEDMKze+rdCP3QYaqxKMIHmfef0flc5zHEHC/BRUJu3MaI2NK7TJJyk5swGElY4uT
	VQE+zgaaqb2hyaGUQS/G8hYLQN+OJn3i9KVs5m9Dnk0HmVL43HIRsckIMEfzjsemApsJwLmq7Gk
	tA/tv+STRRkup8BdDQ8x+HagwDgu3h7+CMQmI53mCU5z5ClmBXCeyBugBDlA3ba4uNeiBuzIE9H
	UaDNc582Bnc8njQ3eMDPBJ8d97UiXuiignEF0VZ37peu50IHqctQ+1qSm2GUOkx43/TdZXnGRYg
	Tc3ayGw+Toko8UPkA6hjQwPjRp/8zpqI0aT2Xsh5x2/js+iI+SD6fLZIwFUrBOjUU100ZB2ljGK
	ZM2ysLmftFuc+LgYzD535muZ9prKTu7OC0dKCBFGCJhhD89OAXyCbP0khxbCC7o3B8rmEyDHe6w
	IpTace1whztn+I+avwiguFcb7Tb3nT1OSHEomyDv2MStxL4mO8kMkEKmXoaoyKHQ2DIdfZ8gc3M
	PqaBlaIgaAFgcNC14WC0EuX76t3ys3CINM1ppXqZoc6EanRK2mJxOEt0VoTmoavWRC5g4eJI65d
	/zLLYdUxo=
X-Received: by 2002:a17:90b:50d0:b0:3b3:b750:d2ed with SMTP id 98e67ed59e1d1-3b3b750d6acmr2306459a91.8.1794931051401;
        Tue, 17 Nov 2026 07:57:31 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac6016c3sm4692320a91.15.2026.11.17.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:57:30 -0800 (PST)
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
Subject: Re: [PATCH] mm/damon/paddr: skip hugetlb folios as a whole in
 pageout
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 02:54:30 +1100
Message-Id: <179493087012.57245.993362683540368479.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
In-Reply-To: <20261117143352.121497-1-sj@kernel.org>
References: <20261117-fix-damon-hugetlb-pageout-20261117-v1-1-054ef8760a92@gmail.com>
 <20261117143352.121497-1-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Tue, 17 Nov 2026 06:33:51 -0800 SJ Park wrote:

> > +		if (folio && !folio_test_lru(folio) && folio_test_hugetlb(folio))
>
> Why do we need both !folio_test_lru() and folio_test_hugetlb() here?  Could
> hugetlb folio in lru list exist?  Could folios not in lru list be reclaimed?

Yeah, you're right.  Neither is possible, so the hugetlb check is
redundant.

> Would only !folio_test_lru() suffice?  If so, the patch subject and
> description may also better to be updated.

That'll be better. Thanks for your help :) I'll fix it in v2.

Thanks,
Aveline Noir
