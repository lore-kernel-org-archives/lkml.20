Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845704;
	b=aEiz9pddY2OfOEkShHojssrfPCK+ExJTnE+c+w3VVULgrK973VA+2Tecf/+Z1Ufk5zoD
	 xfIuCF+VG07K31qBXO+H3hjbGDcb7zcnoYT8W6kDGXyLku71Cr0BWj0bCCrAQUR2JTkYL
	 pn9QbcClXgOIIHqmFqBcrwLkA1ELqeeIkenqzevuuuMHpnhQ/dIOHGDK2ECwiMZNrhc5j
	 dx5/8g+qKlo7kw/A+ldslOCINjo8jvMYHzGG0JOLt6BgfUz+oTdIhnVVqh0d8rSWCwKw2
	 2P80Q+mrpSSmjzcz91mDuzLG4qBsd/XRwRtPO/chPaN9xDLmnDiQNjUyTaaMI/pk1xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=GzPA9WhK4cILuoe1iRCgnnP61VO9pRE7QO5z8ErbFrAOOeOpqt8xnLdlYC8cRiADxbwd
	 ttWCcBFEuBaRtgHlmil9MApkJkNmn02m8+HySdJXih3C3lags235vH03uBprGY5f2hGM5
	 wW0fBE2DLnoRoIktzkTN2QzEkylhiz/ozqnV4fmzD31HmH52eu0E9HLtY/4DIbmH0XsNR
	 8LfHy9Ug7OnjlyB601iKq+HSkbE19D8W3D8HkFovRD499Zun5Zs2cgEPhG3m1VLKTccNZ
	 EVCOIIvgbVB/sQp+3neR2kIi6oCPTmasVR7fq8dUs6vA6eTD5pkRqfb+OxABjtUaWAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nu0/bKW7";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA7A606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA7A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nu0/bKW7
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso906534eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794845703; x=1795450503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=nu0/bKW7W7zw/srEPIy+Xzw1+PcDj/Xv6I3qPew9xbXRN5kQWyXfxCsYMO7UQmnKX2
         PctSQizQ7k8DSP/chKQFfzqtx3aM+jsIBS7ybTwYu4yXkDxHofCzZQHCsdiVE9cy1GFU
         jjfzs7TiTKNH8ektrjBOuOC2oKZWZfl0uDAg39bppmWRaXibYOWtkS/zp/nu9NOCdx3V
         +uFgxryKA/jLRbKyoPh5w1H45eyxzKKh4/rU+unUyZ81BNjWDNqwEMJSftn7JlKhz9Wv
         yTVs3/B/xd2HLOQYAGgvRIlLkrHND0dYSQvm34W5xSTTCG0Up9UvA3J10Or5sYKNfVfb
         jHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845703; x=1795450503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=J3OZDom0Sj02/3IN89Dlo5OchoDl6r2d1B5iUtKSPI+zAlyqWO/sA+Izatwlut24E3
         BJyBi1myT9yLD+sl1PFMbXbcUZJ9aW5YHRycEMcED5QeBoLnXQ0Tr8duI7v+gggvjyS1
         8NT5vXDC1iDnu5HQ+T1af18yFZ76Pgl3kJCIKhM0XYK5JQscxJISAFK+kYN9Igg4QQyd
         mmITo9VCgL2X4wZG2wH5pnGgt0eRkVFHczYwi1qOzlFVUPClJa9lQgQ/RMUIvHMz2nD0
         Cm7MNN/sg9c3XVUj658JzPX6y0oHK6H6Zr+W6t9jjKmsUq7STDWEWtROZPqMUMfYPd/4
         /yxQ==
X-Forwarded-Encrypted: i=1; AL+hErF1Nu1Wao8Lxl/T/PcJrIVHIOOdA3ylPP+DDfMUZV17rXGljcp2DpSYjPi3m2jwvLGCIuPKPV5Pv0+YfHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pf9513/camL5gbJ5xBBNqgF35livzVzlkoZpxoxp9s3lcndtk
	btCGrhARFqd+XwSreACs6CPGe3hQ4kKsUEO/r53NF1EMSuskZfX6BiPY
X-Gm-Gg: AYBFou3rJ+X9xJ8S12DmLdZAXKYB2UNE+MM5NXi9hPPXuWEpmskQLc0svlUbh+IRipX
	Wro1wzOHhR2Y7zBZBRmOfy04WoPjvgAQ3btnT4lCcanjqvzHirJrunyO8E3zAiXW2Eb7CnSuLcE
	6FqQxbrr27a8p2Gy08Vizo1ABfCOLtVlodl3hYjB0Q9keky/kiOcvMYbpzyDuTBl3OBe4NWcg5b
	0UDrofwP0Kn07szHXAtm3wNpDVEcca/+dRLGUm3pvqOjzv/QcZtsl1piUDukmOpdV2Thu6GVlzg
	ZDUKwIUoSDd/H0T4Z85HnyAv9yz5pTUbmX5z1BeTiq9rgv3yZe8SvUyxXKBAmas+f0F6P87rZYM
	8Bh2wIi8Zj8AlEfZ1sm1/Apmvg1b7vdvBlAtYkQBij92nMegZk4MY/z1gIOjxXx1avb1OmHCBoU
	eeJi6+IOf5j6yfMGgoqsD0s+BOvNAeWhlOoua6j8OF4W56Tji46MncFiiqLvjr1kFp1CiChGrGC
	1xwdHqtFZ2m0YDVwjY6FBwerDGmLYd6LzppGbyFjnC4PFi5jIpFmEj/r8YKnj2HXL2gb5Wj8Xmy
	Obx7u/SLdls/MjQuf4CGk50mj30GiPvh0C+30tR77anNITf0IBXvpJA9wfWkB/HcoitqZfRO
X-Received: by 2002:a05:693c:811a:b0:36e:9763:9268 with SMTP id 5a478bee46e88-3796695b721mr11102878eec.26.1794845702938;
        Mon, 16 Nov 2026 08:15:02 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380e031f3e5sm1494597eec.12.2026.11.16.08.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:15:02 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: kbusch@kernel.org
Cc: hare@kernel.org,
	hare@suse.de,
	hch@lst.de,
	kch@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	sagi@grimberg.me,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] nvmet: reject invalid write-protect feature values
Date: Mon, 16 Nov 2026 16:14:39 +0000
Message-ID: <20261116161439.2767-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <179484220923.249619.10986402925266130295.b4-ty@kernel.org>
References: <179484220923.249619.10986402925266130295.b4-ty@kernel.org>
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
