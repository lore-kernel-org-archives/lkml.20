Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626276;
	b=BiRh5P7EpHv+zS6AImwO9kKrLmmWRhVt8WMYeguR139jOwLrt+/3btb2//S2XC/Jujpm
	 49A6y/N3IFKQg3TseKiDVqjOKb4YmYHaxha4ZfSV2+cWUwvBbFlmN3E6juHEz/gml8kV5
	 7HTb8M4g57twweP45Spd1B/0aFbr1Z4xYRLen0s2DfaIMqLvoHcL+s6kQvMMe5r1zLo4a
	 QoyOMD+MMdBDo+rIrMs0UVm3QCx9qoRWOVpBwF5m5yTH/Btio9Ha/4QKB7bwxbm2RHEuo
	 zFWywwQ+pGQzMwj07hhvtJVBelPwvvIa3mx86Z5paFdpaaXpeDNQrT4bAATlR4ycv1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z2VcmWiQfYdESRbeg/UZvm9BGb4bUA/D2IsTBQi5i8Q=;
	b=X5maDZcOKNPkjkW2LjXvDuIWxwB+AJBchtKHkMQglTOl+On2EafZAbctFM1UO5VBIHIj
	 h6rLApEuujsNyo9U+SowRaJWLD2XM1QPXxAaQEqEjRQ/3RBZIadFhPGIb7sj3UdnSK8lp
	 RKTHUWWxuGqAMMg/FsxpHL1EoU1Fg8uAM0GhDToQvQZIi8ZjNvQ4HI4P2jhS7gymRLwgi
	 quo/vxb0lu3YGnlfQ9pGYA/xmbVVPUlNkl9IMeIx21M9XEh6VU3dS9/XP4Vc8UeIF3xCc
	 gJWyM63woZsA/sRv8480RhYU1K3yNIldcVk2tkaw+Ya16Vzs40yY1pI8Gy06HOeIJgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="exdYKI/p";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2B1606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD2B1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exdYKI/p
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dc1508191so459202f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793626274; x=1794231074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z2VcmWiQfYdESRbeg/UZvm9BGb4bUA/D2IsTBQi5i8Q=;
        b=exdYKI/p3ZLFwYOH/UwyULF0ebfy/+I5e53a7o6NcKf0WAOZYCtaYnr2RB7XDrnooS
         +mq2wDIjhWHSTwC8Sfv2vZPKbJC557EYT2ds+Qo8LCht8vngiJ+gTycllgEhz5JYKQQp
         SgXokJGlTl+4x6QRe8pZGnonL90pODxvzl07GJDJuYifJV2ac73xmWXNAl4R8j3D2QWm
         uERien/dXCNNt7rNCEW35nHpMJWJa6MgLoIihfgPlz5rMOSLZzbn3asT4D3tGE8UbYHt
         Wq9Ssg06ZuyOJbkm2icm3tTycgeaJoJ0fyIq7ff7wqP0H4dwJ6ALwgqihEAz1FY3dlWW
         ODpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626274; x=1794231074;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2VcmWiQfYdESRbeg/UZvm9BGb4bUA/D2IsTBQi5i8Q=;
        b=Et49AKFSRFHTV93gSNnV8n/UyQjz7O7sJo3IMWeKgCh7CJgaSrjY0ppfsMLj9pLqA0
         50q9sNL3Fbaxjz6tUh4JPotrZnrV4GurjlXPZRon2WZXxvQUqc910VxKQaQUZF54QnZ3
         1lLdAAp+NTfDKgheG/otLyyk98JZJ7JEKzbVLLNSRnBmjjl2H7i++nMpNfkx6j7K7sa+
         rYlcXVBJb37TMQmXbONhbiI9i2+WlbvHr78wuwY5nynp1/d2Sc26opyBvepBePZbvGw5
         rkSSw7AeeFM0b3Qml7GTsbWBOVKzXOdsaffvCZlNXAkYRi0tSSDiZVpc168VIR/2iQ7N
         OZ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZYlMDe02mdJxff85qm9+gEhr28BA7oqXFjH3liw8l4e+euc0sld+wWL5PqXIbIzLTqdWciRvRWVLvUoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZMb+wS6GmZBMS/yla1QJ44Ctxkcvy78g0V2+ioiW3HfOX0oMw
	qxzcQM2NI6ET7h+KDHvEPQ6PgDHDE8VrAO5MqL6Ir6/kja4TL+Rt60uyhj53yA==
X-Gm-Gg: AYBFou18MgyCrrgHoies8FWlvpu0I2uYZ1bi8ga1Xsa2TeyR76nEs73mskYZBWYTQms
	gtm79IMEM0ML8q07IsfNqKGoCTJbKFXCSumbdp34g3pW4PW7/ue0BM4rskuGjZBGInSOKpLI31/
	/zikNs1EBrzKaPU1C+a8jEcqO+6wod/Zqv5W9M33ZJn4X9dg28V8xrnbb5z6/cX/E4Bkt48ke4d
	3hKtVR2rvljw3jdzlZXzbnFVGnK5MSQJIyxLZvNZ40hU4VnvTbiEyznRwbo8BEVti7wXfiQqqTD
	QKBWSbf1s+khq9772lXy+So1j4tUUCGt7hhOrQZuW4hZ1T3DRex2rRMffv3UUQokmiO/Ju4lhlX
	ge0p69GedMkE5xTGoZdj8oCNvEQLONoZzEMmXJPrfm8CHMPhVyPWm1XRHXEloeIw94xfuTrKZ94
	ebdEahoV4/DY8Db4G+nTAAqXY4xCmWkN7zg14Id2SxUw8mbCsOANi4Px+TpTaMIdK8LajIJwuwm
	QmeGxUTqbmZkY+9cIInTF996CHoWM+3JIrkwwZpjPiNkvclqkKedsmc4tqDoDB7ZfgfhiTNAxXF
	N/aW7Puleg1qMqYSp+/F4jpZDgTlxFHVbdsS6SlHDiFnHD8GbYsh5Xqcw+qPM2ndr323iYY3ifb
	+MA==
X-Received: by 2002:a05:6000:4006:b0:48e:28f2:64ea with SMTP id ffacd0b85a97d-48e6e30088amr27345388f8f.4.1793626274013;
        Mon, 02 Nov 2026 05:31:14 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d4f9sm20432460f8f.2.2026.11.02.05.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:31:13 -0800 (PST)
Date: Mon, 2 Nov 2026 16:31:10 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org, vincent.guittot@linaro.org, 
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Cc: christian.loehle@arm.com, elif.topuz@arm.com, 
	linux-kernel@vger.kernel.org, mingo@kernel.org, sh@gentwo.org
Subject: Re: [PATCH v5] sched/eevdf: Fix vprot across reweighting
Message-ID: <auiQU5LZ--A-PLor@scheduler.schedules>
References: <20261016153721.7843-1-kayracizmeci@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016153721.7843-1-kayracizmeci@gmail.com>


Hi Peter,

Gentle ping on this one. Do you think its ready to be applied?


Thanks,

Kayra
