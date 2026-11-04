Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808450;
	b=g8yOKjGUD4YEnYXUj3MIPX9CBWmNtU0mvwBWugEdV7FXY0ji1YlQq9vbBVLfllwTH1I/
	 dlJWOiEKrESzu7kY31eyim7VOiY+n7mMZh1+srC+lcldrw1kYmLeisNqFZfpb6FU70ejm
	 GCx8dZ2AhyxPEWqyPv6nMujGtSbYwIABxn76fw4NxOcQWg/Dc5IRNezfs4CMV016+0nQH
	 nLBAJE1ytMeE7SpY3oOfCU5tvg3SXHLplQpWpLjpKhjnFVdHrslutzs5mlZ95HfvVAaaP
	 2HD/AsJjqUKmrwz/fIlrYJI4CIqPu4GCRFUqvHa2tLv1Ayc+U58f/YGReE3Sp2BIaug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=4P+k5mlTEZCzjYuIrh+7DyXOz9xXyMQoPZnEQu3oqqtKDfUdW+c5gm+7ps7H4JfgiW8M
	 cSAh2subXUfw8Xx2fm9dwgwkBirBHuSGc/rST7TCphZl0FWEEXV3sz4v5TfXfpoZ3xhpn
	 P8G3eWeQb+jxEkSI9YhJGE4xK8fx6sUaK8m5nVzuQFqZXN4H4cufJmZ/gOWcIDBGFhqLW
	 7OMoigOsG7qdGhEM2q8Q/2+FGmHDsffiKcY/0BL9SeIj6NMG2YJO319hN7szo+qjp4i6G
	 mefzTU4z0HPDIsALzo5WGnTnvlNM2QMQnmiFzeUhStB1gnJYeQBnP34mOjsGhbEn0BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RDVEp/Kd";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A36F606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A36F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDVEp/Kd
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so1783934eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793808449; x=1794413249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=RDVEp/KdSubAewnqmidoDmsqETCBKXGV9hqdEy9pP8Bwd/B4Fy3cg6CtJI2r0FAX4M
         cMWyNew4bhP1By6JvaC3iIToh7bKZtVT+BkokrRGfJNW/wOqp3E0AqEOa14e8AY6qs6t
         BjHqYCSaZ4Ob9pCxpi0eF//YwCKJ8P8z/gbLMWUHEjc78CW91r4QbV/FsVdKG2+J7bLs
         25AC4N77q2+ZEE+7Lucx45D8Rpr+Icz7If5N0+krN8UbxhrQ6EsFtAvuWd4+4kxq18gP
         rDlmGnoTTknDY09/uBVLjtbmqpwQAliu02/pgys2FJcF7Ud4c1h3Ae+nsRngqJ7+23Bb
         fNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808449; x=1794413249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=Q0Gr852SI9rMaz3/e4P2b+p82Lc5EiXEYlFNLIj1/Sh1pGuNsxdpJBtcBQ9U/NOIcw
         UeXVToWzJbDh5ejZzVGK8pivIpv3LV+6alh/+Jzrg3g2A9AwaMK80p+47r29+xOx06rl
         DGIhw11jgxjs88xULimGrZDS4ceVP2IE8F0C0IbwclbO1gfexE+AqnX5Xd29lX8lJNlg
         zudR3DnnkxH2RArpX4fspW6SXifaLDt90WKdkNd/V4A4n93zNCTQk0v3dSDAQ3Q6yhAo
         8TKyNWZMxs/hIy9aBgWeQV3Ceo+eUEMawaXecIaPCd65gREI0yYXroNf8aivQFVG0h+3
         6i8g==
X-Forwarded-Encrypted: i=1; AKwUvBz/pEYGGe43fd1F5Yr0Ew3/EDwv0Svq/vXcs33+M5/s85cYiJ/+r0D/IgcV+CUJn4K9Vmz3l83SV2n33C4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pPnZt4ECXnXLFEmkH5r6vOXdEWf5jywXU4pc2Pd2loVdpG9G0
	i8F6i0hv+/QD4eT9zej0AStd0VpxJPldTrI1c50xKfLZDayUg5pMdLX7
X-Gm-Gg: AYBFou2oOmIns4+AGr1z7eL+eg3oU+cMwPqM3D9ZvzZshaOSjGd2hfirQqATE3u0CjU
	n/VYWSFj8fwDHgBgQG/lMGEAJcHYcOwDBlOfopZFOa2zlWfa2Fh2Vv4uboEnK5nDeJyJwsidXau
	sd9Qkbp88DaLsBswH7ZRzIHUwoPWQy6UwTLTXgNPyXc+Ppbui60qlGlL/rMeBArK9+i2iwDFsj/
	pUuzfQtvtsKF1KqThuZGsUp0ZWWBKyliz8orlfgGvd5o49iDTiu2igBh5YFiFTUuFBWbLBselDn
	ByB5K3L2Q70L4CBoT3QUvOmjBh7ELK0EE6U0MzvLCzjkxQGyzS9+yEDFn/OpBZhrFWPbzQ4npE9
	7wSXVBjsEhB+bjZQdJx75kRFe1NcZdYSbMpwnT+dQGnIwCdAeCeHh/Fq1map0ocejayZ+nsdUdC
	ol9W3c0LWeV8jUyc26mOq3/lblKixN2AjdSiuCi4QiUuh81I54qenc+Wa+FxoLPokDRtLrsmKXh
	2DfSeIPtm/M1goZnW8dhIay6W+IFTFwOgZLSVnPfA5j1cBKuOaIx1f+FkHXVjO+b99pstmIC88z
	hzT1wXechs3blEKmILEqNJMsHku5mOU0x2lFmDu10m46cwFe7D0=
X-Received: by 2002:a05:7301:4546:b0:36c:a93b:1ba3 with SMTP id 5a478bee46e88-36ca93b1f2bmr3137939eec.20.1793808448995;
        Wed, 04 Nov 2026 08:07:28 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm276249eec.18.2026.11.04.08.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:07:28 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: kbusch@kernel.org
Cc: hare@suse.de,
	hch@lst.de,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] nvmet: use appropriate types for authentication payload lengths
Date: Wed,  4 Nov 2026 16:06:52 +0000
Message-ID: <20261104160652.3603-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aun_15SXOxpzPZXT@kbusch-mbp>
References: <aun_15SXOxpzPZXT@kbusch-mbp>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
