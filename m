Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892270;
	b=vVGsPPpjoPt6bE6gVPk1gsxnOE/vrQXJwFcXiDynAvZ4KWVpZqonpdmsYetIZCAEapPT
	 l9hP8Ta2CYoKe/aYcJa/yjw01Ccg9OBRkhJTD2ilhxSrJPCuF7ssUEwHHgLWmCyNokCIq
	 FpKEASp8yAa1fcmEmfGQN6R2Kl0IWDMbN7bswxMKk4GcsQO0NBUIGwuVzLAQvy8ZMu8U4
	 rggRjlpnCTnFYJU4V3ijfiO12xxvbCvvAsXeNLgCutES9UKlU4ibjLEYCoxaWntLEEPIo
	 jn9WDRG/CkOjGdVp6t9D5Uku3Ww2Z03sPhV4dHuiPJpsV/4NJZ+FQDRfbNITYcR4RWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QD877pGLpHjsBFVYfF6QgCZ1NDUdDbNj4gs3GngsOM8=;
	b=R8566y6CGhonu5AEObpa4XTkohdS7+IalDZ5VCCAPphbk4on7WIHdFLv2NgMh6v+SzWF
	 MipNHIJG+O1/oFCJgqzhx5FzBeP7HIoOneQWU7mXzMly9iKToVwu/xuvh6vUirlvPvxpT
	 W/nVg3oHo0+RVp6NISx/reDJdNjdir/UZG//Im8FUPGVt3MX5Nnr9rdi84JDuFrk6eEUC
	 ygFSPwW6D/XBwB+iEHEQpZHYoBrP9FUZjUPfDIFpjtodXb3pz2grsJx7CRa8QDpqgqWP/
	 IajaryjEUqDlyrY3OmRoHucoxOGKHqi495k4RUaxL/7CiEGogywdZ3BBtVYj6bvqohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9weM9jH;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0E606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A0E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9weM9jH
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36dc20d6de3so220277eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793892269; x=1794497069; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QD877pGLpHjsBFVYfF6QgCZ1NDUdDbNj4gs3GngsOM8=;
        b=D9weM9jH5gOIl58uY548DzMF5JA7jIyFo0eBRZKqHrFjqN/HTqjWZVjYRh3tfx0ZYY
         /3DTJCksIQppgjigUsPZfU7N5UxBa9b9dRVvxGmnoDht6k5Jgsxk6TIYuvKf4+BaxT0h
         M83aklPMKWL2KtXthCX6mf+I2iTfau/RmV6tv+0rIg+qLNn3OYcYEIRYEB0MvxPBhOFp
         VGkmnOgfA6rumE5AvAUUMAsJyrfJZGrYvvc/ma2LxYUVZQaaymz3CPb/ANRAPBMtcp1q
         Oy1l879tvk0TuWsbsP2peumACWhw6AFgBhQSMYZN+TdGqNj+SS5fFNSX9WMqPv6nBF0b
         LMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892269; x=1794497069;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QD877pGLpHjsBFVYfF6QgCZ1NDUdDbNj4gs3GngsOM8=;
        b=DvtXBlZlP5AV1gRb2Hc4Cq6EM+D5nUKnpz+oQCphacAfpTdVCnbsQPzP7AdgQxYl9T
         MCzKPp2rSQ2qAlzhNbhdm09r89iMlpjqCQjtTCtw0Hp8r+HftqVw00L6YFp6r94gZ9yx
         MW1dEJhTrX35mlXF+scy+M3+ecMmMKOjdMyBSuQg6cmLXX5/nXOIBB85N6BzibHS77aY
         fEZrFymObztXvgaH4bndQNhKszd8e/IEUfctle0xSrJCzovWJlnlpT5AvYPE0QolW/1C
         y9gETrx8mR0L3fJzamBT87XQrEV+DfUgaTt0qtGfyINkoYAo9+atgSKMsVwCdBq7TYPz
         TEaw==
X-Forwarded-Encrypted: i=1; AKwUvBwWclEdjWmkdJrHDZ6+zt+QrVmVbT8+SPvB/yexefiFlIrtcuu2Y5jEiqbzMtBOhL395Z39xxh0m1wPR3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c4wvN5v4THPYZuz7odY+GdsFXkZ1R0qrY/A3EgCHpSjrXWXJa
	uMuGBs5wrAamsagkgvgOcIKNHHDhRiBxXIq6uyoPz0A66LCTdekGJCgs
X-Gm-Gg: AYBFou3yOW1yWwqpspiQN8rXRcX4Y/zOByHE86kzb/z6z0z7zY4TIXfljmGilz6FGGE
	y1Vu/CMXBDfF/0Hdj5lmmrSH9dGlfyb8dZDQHGxPS1OcTsgGv7Hhb8iRGVJwlxS0CrpwO+fVc7Z
	oS2lcL2PehShwTS0Y5ZzdlAr/R5O+mnrpBE4WbiUOVYEH2mKFJySkEbR8At9hdIQ79TuFpeRLf4
	N1O8GEADFjacDAtb7pM3as2do3Ahe0/v0ujarEW5l4W4FL4+n9mTM1i2Knd0W4/Md9qYocNiwvp
	7AhiAIreZX53fgLaL49PBM7N3Ttfx84uFwqJfTdCA9V7/zDJ5epLXR8aKb0qKwrccuKp77GiVWu
	tVKp/CoqCR6BWz7DwtwDZ32nyYl30FGV6uVHMr1TULOdYrXiRSUp03kG2HtmtsOlzAeFcf6jZoG
	g4Vh5lJUuEPIId9xkO4oA5lZ+V9IpuCPo3Yfr7AyfWsDMMF7TOfehviRR6ls+djhjMxWXdU3zOH
	OkpukKVuyCmvyVrruvXJFr1iL/vctkZo9El3n1/jCj3ZkgeLNVHd9o1dcsQQqFFAUNiZaKCnbXc
	2jG5lMNXRxMoSBYGKYJnfn+AIx8ya+K5MMQGjHSU3QBjsoAy6s9TOlhViMqfjTO8MrA=
X-Received: by 2002:a05:693c:88d9:10b0:36d:cd5d:d809 with SMTP id 5a478bee46e88-36dcd5ddad9mr6393862eec.1.1793892268569;
        Thu, 05 Nov 2026 07:24:28 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm21647205eec.7.2026.11.05.07.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:24:27 -0800 (PST)
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
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, Nhat Pham <nphamcs@gmail.com>, 
 Chris Wiseman <chriswiseman@google.com>, 
 Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
 Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
 Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <auwOBaRtM9p_Wxfx@google.com>
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com>
 <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4>
 <auwOBaRtM9p_Wxfx@google.com>
Date: Thu, 05 Nov 2026 23:24:20 +0800
Message-Id: <179389226049.111354.14491396975794516954.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-05 14:05 +0900, Sergey Senozhatsky wrote:
> On (26/11/05 09:10), Xueyuan Chen wrote:
> [..]
> > > SGTM, but I'll let Sergey chime in!
> > 
> > Thanks, Nhat and Chris, for the discussion.
> > 
> > If Sergey has no objections, I'd be happy to send a follow-up series
> > to make the shrinker configurable and add the unlocked pre-check as
> > Nhat suggested.
> 
> Thanks.  Sounds like you and Chris will to have "Rock-Paper-Scissors"
> to determine who sends a oatch ;)  Just joking, let's first figure
> out how exactly we want that zsmalloc-shrinker thing to behave wrt
> zswap expectations.
> 

Haha :) Either works for me.



