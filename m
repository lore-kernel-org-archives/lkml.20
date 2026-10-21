Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589090;
	b=0tQRTKxT7oLiRNE2Ju3igbhYsXAAlIccb2vfPq8Q3L0oqGLrCyOaCfsan++Q7kSsVjHX
	 iuJFkknq/ddb2gOQkxtOIxZAVb0QJvGBKAeGIB493iIZHaUBnJDwFrdUAFfaJ6+5pIcy5
	 DDLnvQzojtD2rMTxTV/XDhwNObytSIHJLi9+oLSQnDO9UooHLsvrXTCiqB57dhJXzP7QH
	 iKjsdv6l1AIzfH0MAH0qs5o6k4iHzTE8nWSqPFM2/DnUJFshBcUfF0uxsCFoLgHBHu75X
	 xJPI7BxhdfTbsq8slazj3n199OaxxgV8bqDQbzaSrDLWT3XC9bSJeM2Bbfbpwzv79xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=gSlKv0ToGAeQ53lsfFOtI0+sE635JWib0pSuSvkBPtk=;
	b=PJfOAmLqYNR3gfids6dbh4h2ButrMEJ/1gmclZ4dW23/aYHCZeKSOa+ut4tDsgizAT4E
	 1pSuPVpBb7QgOLaCyEeTN9MXboJuwi5QCGDQQGGQ5gGK+41Uq3bQjht+PXTZoEDER45rB
	 5/nHPBZiQo4HyNnV1jmB0jB1s2nlsQTqhzSfIBKLhDxAvgsDiom0IOkabwcO9JEyMTMdt
	 Vsr23Cd6RQaw+H/l+MagQS3BXEUAfowIbUAApCGf6wejovpLg3V3dzeXnJxXZe6MuYyhV
	 T7pwHk/mAfW/nd0NCAT73w4/OLjeeD/oMXGuVHcQ6EL1vBMpn3C7rf3q4BKlCuu5zMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fP9QWsyg;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9F606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD9F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=fP9QWsyg
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e4c00d71aso80280885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792589089; x=1793193889; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gSlKv0ToGAeQ53lsfFOtI0+sE635JWib0pSuSvkBPtk=;
        b=fP9QWsygi5jE9vH80f+pFuefsreKP9vY3VKx3ybj4UodI383nCjmiCPGzle93AT/kg
         cSSqp0W3l9N+URsf0bNJu8U9FxgrYwOKjo2xUbUPfmkTXmuK4SUi5Nz2kdkdzadWkALf
         MaupmuT/v73XNXef8WoSyybKVXRC11TpUWuT3rJTqwW7rSbfjYvsCayflrfKRMrcjzQH
         Wx4Scn+PNBlC1/X5DvWxHzAd5MVStdp/7D0HCxpFxaFhtRz6vjB+9c9DuCCCtuDG8rLr
         XQbbixCZS5Cq/02baStbcWUzKKMf+VhW9pb70s8pZGlHqyIDBmvSC0rL6k0qVEv7rLgX
         sbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589089; x=1793193889;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gSlKv0ToGAeQ53lsfFOtI0+sE635JWib0pSuSvkBPtk=;
        b=Q7zCveCw1uV9V8D7D+xcQ0g1XcrFrFYINS9DCed4Bq28g9AcLyJHnXX7lcr+tiTLW4
         oD3IN0rmUlNHLfIMmK0mO55HACWNGXym9c699Z/hFKyLVNOBWV6o8erFOfyt1yLUy67o
         6nUfaqz9IxwCvRJLdkH0n42eCWcC3MbGPlCejmzukuJkrB/rthZkOX3Vus3WYAzuw54r
         B4nrqT+WN+/vspAAEvB3BUDgA9V3sxHRJZek/LDARCbfg6WQkPOrcqm9GeAkej8LWq3U
         k6rZsNedlfj7aSPDlDj2jmS1E3KF3fZlLPaV/+Gibx13uWOdB1Xzmq6EsNfBd/yuUbkl
         TShg==
X-Forwarded-Encrypted: i=1; AKwUvBxu9WklTTUAFbNCO/2B93DgwT7mQKE+sdb4uOwctE9MBEiUsSVkrCXC+UaJZyzrLK0LKGRlYOPgyq0aMww=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcUv9qCQrLwQnlygWGPMx8VQT+lAC151LpQjoAlV0y8WEjAd6/
	7b8DbKg3inq9/wbP0bkIuqj88qDPCAxaWKKho0vH06myQPO7d48jBfY4msuSpX6/Sm4=
X-Gm-Gg: AYBFou33X1X4aNbVO3lwlo7L08XKrh1uLfM7sy3VMsNk0ijcWjGuDdXIyMT+nZ2FSP5
	TMJB06aMNvulCLxnmM2RD6IkkUofpshSDzjSdXsFETIh/78VDds6G0zJIRCwiFRO81O87jPByct
	l5NU/8HSdbO7BBMlNbKIdhj/9FQ3ITbecHk79ME21RUcsxWVEEjvokp6QX35ZAU4uy/BUrOvP11
	IIRLc/aaozYUXRp/c+jL8SKkqcEkjsOuzAWVTqlJpJkaTalwnUmdQRR4zCwddylb38LOrT50IQF
	tkTDpqGaO3kohYYDNiOgUsJvZVWiPo1ZeQuaiRsJ+HieUepzep06t6MhCZ4yeafhbfHWgb9c3Qv
	WgXslQ98ETtaOInFqB8+8vKG5AEPVLoxTJbOC0r25nEPjM+zI7R4O3+SzGLwZGWSJH7rPV6glQT
	3CjKy6QWxLOKZsKirMP08U1r2UaNMEPtW9l06hQP0JkWBOYMTfCTKvD3G9VI1JFtOfC94wBxMAV
	i6w4B4B22NHqD215uayfTou937eyo3URcYdZTzVWpZiBIPFyB+VonlaJtV6n8R5fTKeI/3D7VvG
	cRlShXYSFEp/GWJb9FPSiokuPogjpSNSxuqbHSDmB5j8oMt0
X-Received: by 2002:a05:620a:4496:b0:93e:5861:34df with SMTP id af79cd13be357-93f57feafa5mr395621285a.47.1792589088891;
        Wed, 21 Oct 2026 06:24:48 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e221fcsm250054885a.40.2026.10.21.06.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:24:48 -0700 (PDT)
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
Subject: Re: [PATCH v3 0/8] mm: fix allocator races with memory hotplug
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev, kernel-team@meta.com, 
 akpm@linux-foundation.org, mhocko@suse.com, rientjes@google.com, 
 shakeel.butt@linux.dev, rostedt@goodmis.org, mhiramat@kernel.org, 
 mathieu.desnoyers@efficios.com, muchun.song@linux.dev, osalvador@suse.de, 
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, brendan.jackman@linux.dev, hannes@cmpxchg.org, 
 ziy@nvidia.com, bigeasy@linutronix.de, clrkwllms@kernel.org, 
 mgorman@techsingularity.net, anshuman.khandual@arm.com, 
 Bessel.Wang@huawei.com, jiang.liu@huawei.com
In-Reply-To: <63521469-3829-4895-a7d9-a0f7806c58a1@kernel.org>
References: <20261021023940.1940971-1-gourry@gourry.net>
 <63521469-3829-4895-a7d9-a0f7806c58a1@kernel.org>
Date: Wed, 21 Oct 2026 09:24:45 -0400
Message-Id: <179258908579.2324641.832287495252342628.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-21 10:24 +0200, David Hildenbrand (Arm) wrote:
> On 10/21/26 04:39, Gregory Price (Meta) wrote:
> 
> Usual reminder to slow down a bit :)
> 
> We have
> 
> 	Documentation/process/submitting-patches.rst
> 
> Saying
> 
> 	"Wait for a minimum of one week before resubmitting or pinging reviewers
> 	 - possibly longer during busy times like merge windows.
> 
> A lot of this here was broken forever, so there is no need to rush.
> 
> (thanks for the fixes ;) )
>

felt prudent to get the adjustment Vlastimil recommended out to avoid
time wasted on v1 since it was somewhat significant - but ack.

~_~ found a 9th instance of the same bug. Will send next week.

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>
