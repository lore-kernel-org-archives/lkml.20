Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B978F2877E8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789229852; cv=none; b=AygS5ao4WM6cx8yEUv82J2O0xqMSRO7mQmT12IpC45pOr2Zl1lx+lvd6khtgGmqkXoOYVwyuTk8kGiXykOHOd0MN2YaEm34LhIWAyl0cr5/1mNsqjF16+ZWyjQYR/qHtuojl9FC+8+J6xQDONy3X1W1+efSQg8o7dxcH/EJQCYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789229852; c=relaxed/simple;
	bh=Jqw79SmqLYkewooIG0Ms5tC1rgyoHKKJFJs076jCzQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LqinhuM7DPAVPKoLqeOBP63ZlN11esr18VWFRAvDlEfROtpiDFytFyRgjYEGXAqjJDvLa+lUGsEZLzjtJoCJS2DDZsh39T3rFlcI7O63XoZc1RRBut4WeQjYxqZ0UEEKeXmQBh650OJld1R8yi/grHPfsUcOyVGFruUPnJi715I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xepfy9qN; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xepfy9qN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so229596f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 09:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789229848; x=1789834648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jqw79SmqLYkewooIG0Ms5tC1rgyoHKKJFJs076jCzQQ=;
        b=Xepfy9qNZjaG0hYkcJVpkJU6/tOJ27m+bV2j1zZTU50TNUsfdjh3XLVHQZAGbe/Bqx
         zNn7lYJCMJXHrOFJe1DH3YHduovvnGHbqTVVzoK6sU2szGMagSmXuBJKpYEkU7tF25RM
         H6kkcIDxsZXDQb53s3Re9wEQDmHABqb2Th76Wlcx33Qtrsq+BpTppGG7zeTP6vENlhHp
         jJu+zqzRHw4FECFSpm5W75VsLnMdTLYn0f8yns2mfVtLYpaPIMnq8rHzsLGBa6lNr54k
         ZLWIjGxScGY/uoz+rc0iT+fHmibaFCiAA01blaLGMICEz8LZihTuYbW9vlrLCZNa9Z84
         +J5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789229848; x=1789834648;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jqw79SmqLYkewooIG0Ms5tC1rgyoHKKJFJs076jCzQQ=;
        b=sqXNflTLtkUbYu5TdJU83o9whQgD4xNgHFa5/iFnoayxVsSzzy+Zp5+Nm6GZM4JtLc
         LkfEsfW0DlTxRugPBYZEaXvwN3Od+vgSC3coZ5bdGYJY0l6Ntjnod0UG3Av72adNWyh5
         3GvTefRCK5k7pz0xZboOIYaNSlp716Rl2eg/0it70wWk8+Mhp3HOMWFTBzjqga8Xf6kn
         Ht0O64UQOz2tMi0u9CadSVQTlH0EaDTWmt5rlRb8ZYda0KXz1emxu1264104TssNwSUv
         lKlHFFLyvkCWIg82tQlc7cbbI6bNdi+/Bid8U5DWXIK0tO7AYXpQVw/f8JCMGv9Y6gSf
         jKaw==
X-Forwarded-Encrypted: i=1; AKwUvBzHUmzgSX42u6/B5nM2xQM3geYnfxeQyfy/TDId9zfr9TlGReKAPGtDbeZi/rARpMsKsAIGEly3L22LTOc=@vger.kernel.org
X-Gm-Message-State: AFuF++l64aYGLHysHYyPyIx5em+445oZZPqp8POKYvTbKCni2WW+1TqQ
	fMSAZOl4cbnUOOHqBGlsP9te4W/odY1pQS5678ty12r8SN5I5FAL8eWJ
X-Gm-Gg: AYBFou01tx35Gk8xSUMWvfk1W2zRfhALf6rG/py6B6VCDbpkA13g1CvI2rmoiLILrND
	x8OfqJGNmZy/daFWRNi5q9dnop2rVSev/pY9a/hrfpuP8e1fnlUaxyBVTxTFR/c1YltXN4Wfcxt
	AxCysCAayAVPIoYmEDzfM6dSBMjhW8hN3o/m8X6ZzU7SRYudYdiCGKTELoi6JJAtf7MfwqvZlN9
	AMe8WcthdsAkpCeeVi+dEh0cxSeREthwYDoEluPpqUn7tA5hxQl+dKZJQ0u0nze78IST+BxCyiN
	iPYvCv+Y5K7czSipNFE+JmNpGAZv4NWp91QyD/ObuIUzMtISq9cdUUOmm6QCnMUcs+OlXPEt4uy
	WgYFxtUvEgwam3LMslxHiEKOOu7IPDraKuOD7k4bWuece+WHLjTAyvIEFADU/cxcIdSbEtQ64bG
	CxZAqn5J1aj5XXWSTdoPpRhSHzoyEKRkbEkIvvwbqV1z6HuXLbCTOLcKsqyoRrfPFHYNQO22v7d
	I/bVM43F5/p+dAQFZeva/MjlZofwsNn/tLKRqmKFP2uCBFqU1z4Lw==
X-Received: by 2002:a5d:5d83:0:b0:486:f040:2e0e with SMTP id ffacd0b85a97d-486f6d4ab19mr2656641f8f.42.1789229847393;
        Sat, 12 Sep 2026 09:17:27 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm13567448f8f.15.2026.09.12.09.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 09:17:18 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com
Subject: cause of the image error in Gnome Snapshot [PATCH v3 0/3] media: Add support for the Sony IMX681
Date: Sat, 12 Sep 2026 18:16:12 +0200
Message-ID: <20260912161614.93775-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909203717.90605-1-lsa.uz@pm.me>
References: <20260909203717.90605-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: German Pablo Lindo <germanpapulindez@gmail.com>

I think i found (at least in my system) why Gnome Snapshot dosent work, i dont know if this error is also present on your machine with the patches, so i have organiced this message with commands for you to be able to directly copy-paste them and make tests

There are resolution in wich the cammera works fine like:
qcam --stream "width=1280,height=720" the resolution that uses google meet
qcam --stream "width=640,height=480" resolution on a web camera test online
qcam whithout the stream parameter, which has a cuality of 3836 × 2640

But there are some that experience the violet and lines error i reported o my previous test
qcam --stream "width=1920,height=1080" this one is the resolution gnome snapshot uses
qcam --stream "width=1440,height=810"
qcam --stream "width=960,height=540"

I hope this helps in the development of the driver
