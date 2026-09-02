Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6FB4A92C3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363121; cv=none; b=knYa2v+oTnR7X1A5i5CwUKui3TuIDL892oF1TAotHNeX+R3Fn4lE83qF8enhH1S6DUbeSioEgnkZKw51WNvT5ybVcPf0JGDD+wNoVe8Id5MUZRU9l3FnI8wtJW5jWax2votD8ey/6tnm+WLg1Y6hJzZjAkVdWkFD8/hmhfXjQjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363121; c=relaxed/simple;
	bh=kcv+0OXwacoUKkfvTFKIQYoooOR8znqyG0iAuaWM1nU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ECXSL7ds1M7ruewmB0wN341lKf0aD8b9A1RnolTxFSmfPtfRuVtIK/AayR6WpebYBnjuFcrGmWC0y0gQGVLWzihyUJosj2un85Pbu+zMElLrM3i4cxq8qF3uL2+NTroPKT2/pOsgeKqUzSOXGWppghERa0wl06EGhpkYPqigY7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLL5oUxF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLL5oUxF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d58efc7356so15573005ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363117; x=1788967917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXeu7tqkF/2SrDqNx2feyBpj2N1uMheEuJGHutrigA0=;
        b=hLL5oUxFgPLj12/+iTmJDwzOqHIU1DDQl0XAZ5Ym9cXxa6KblTmQpe56eGxAl0Glg8
         7QWrdF0kVkjWieIw9hohvVY9WrpDqX/T53rLvDfzdjLDytEQzd6E0izfb/Eh5HHOOlou
         xXfsf8CKZwDGjAhnR3WyfPM99pXFpVisS9eySykYSUFb8FOxG4wdIsJmW7SL0fT7n+JD
         D3poZsDhawagAjolozgtsC/YdrEYV0A2/Fe+MOQ+QO/RlFaZ0c0hhv6hpw+G8xK6Y6qb
         HxDBvw1uTohdH+XB8Q7PMlKLyEbCc/e+G/NPEWOvybstzopfthx9liHvNybRfn6/rpKe
         O2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363117; x=1788967917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXeu7tqkF/2SrDqNx2feyBpj2N1uMheEuJGHutrigA0=;
        b=fcrMWJ5MmNA4wMY4GJDTUH7CoUAj5CsXLDnO36RQbqr82kliKv9dGVa69lcn1R5guz
         AWqupHbm0iauDG7kbUJlBh7nmE/y/RRkL6iqkQ1AAbrjIaHnlFwexeUjxqcpzI/21/mH
         3HGHNjpOeGqSphnCrcbWPq5XpAO3ckqT2nJO3v+0Gpx/Ei35bpTIbbKXBqcoRHbo9x7/
         Hl3lxY2O1C/YsodWWuBtwafIThvGVOX3BitZFFkmJb3+CcBGoY88tX8AKTSo8B6KzH/n
         n7HcvvPEOQi7DM8F7mAFot5JB3hjplrWwRq8YveeniReZRx2NQ/jBa1/aBhdRXnlKIOU
         ayFg==
X-Forwarded-Encrypted: i=1; AKwUvByZxltxQulGtQ+qxPy8PqkqrP6aecynxyyCZKhX0QYKogF4kAvq2KR8+PMglc2i69M2A3JJBoJ5UKNpBNE=@vger.kernel.org
X-Gm-Message-State: AFuF++k1L3rNNIH/DOd1PEI1JHXgUr08CH09FxRFQCUZEmPFUy5/opZE
	+IBiCwxq/Fjw+mRc1Ds6AvkNNNeg4kAEn18XuNjM/90PYevXtJPsx8r4
X-Gm-Gg: AR+sD130UdtzKZAz4r4kat/CgiGr+JaHM1wPSmKmx61kIhzQK/s+/QpcB4bVFbvY/R2
	qsM2YJCInlG78mn8J3CEA1sh2sCT268OBTCFmfKELf4oco+LesZfjw4f7HvRAitHeWkZKK9kfNy
	i1OWZh0mhRmt2DpxADrkjWf1YmObkPUj84ce/i1QrchE8PjeVTlmFO/PjZj59j6WUGQAzYcM7x4
	1Ve87N829YFhdCjYbYY2EgCqUBMpdsVA0eKkumo1J2ZXz4Kij376YutE7s5dUyaKuvCmcwiWBt9
	LjSryBNfty89B8Q/SnyUy+WDVUUAMZztwvNGERV83xmmST4QGAUUalhGrO+rmJWA9eFIpkH1218
	Tc79HDBeOSmISrfkY2Ary6fh7u8WTBonGBvmla7rcWvI2064t1f74aPh5Po8cmkNSmLXYK/G7Ac
	Vh+Ja9HntdExJI96SyC5eL7hXahHHRafoIPAF5HuRACGUaO/oer2/fwk03o5MtgVi3cFiwhXqPu
	HP+/s/KBMea
X-Received: by 2002:a17:902:cf0d:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2daec6fe801mr94524095ad.12.1788363117079;
        Wed, 02 Sep 2026 08:31:57 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd357e3csm15310485ad.10.2026.09.02.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:31:56 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org
Cc: anmuxixixi@gmail.com,
	chizhiling@163.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH v2] exfat: speed up file creation in large directories
Date: Wed,  2 Sep 2026 23:31:36 +0800
Message-Id: <20260902153136.1275991-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKYAXd9K2bjm4pyNSQn3NL4EBATxG-k3g1X-MjgaLCwWirU=dw@mail.gmail.com>
References: <CAKYAXd9K2bjm4pyNSQn3NL4EBATxG-k3g1X-MjgaLCwWirU=dw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for pointing these out.

You are right about the 255 UTF-16 code unit case.I overlooked this 
boundary condition.

The empty-entry hint can also become stale when an earlier entry is freed.
I will update the relevant rollback, unlink, rmdir, rename, and move paths
so that the next allocation can rediscover and reuse earlier holes.

I will fix both issues and reorganize the changes into a patch series in
the next revision.

Thanks again for the careful review.

