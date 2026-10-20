Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792474491;
	b=Dkamk6lBYheM0c5i6Wl5YR27XhitI/med9TJITjQugxQmTbbV5yGsSkQqRd/wdxdaOzN
	 nVey4Gg1v2uRq4zVTncSpViz3y5q6QK7DIs320QxcMusE4Z6RUmUSDRh3qXGvi//akplQ
	 e5Qu1S7eg7buudqsucCSq4QOp986PB0JMWuoaXzvFA4tJsfetNzhZ9VlOGfcRyROp32t7
	 uS6cYItxptiDcT/Zfo7JoL7JFiPb62GPIyXQJxxPpOIbg2qN7fyg9UvdGLFtbwrlGM3eG
	 nLz488MzthZcz1+T68fQQiBnRSmIaGHe9hj0xcLl2le0RJh7WMdYVIV5JCmRKbrzfNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792474491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aQfHHrXMXLY2j/M6I94/T8E0vvM8q6x0cxn+YnCDD4k=;
	b=2D7Ool/Mtvqx+E1AAlux9NCpCfxFU3wLW46BjO8fcWtWzNczAKt/xthX29mJHGdOzA13
	 IFf2vM49SOWVeF9KN4qbUSaabB4rHxM/Bd1Yjrh2QJEOAcWotfEVisQn54sOJjp3FaL/R
	 1IPYBh3YbIDrcP/72SBBa2R2BisqDtFN2g5GuZyXtdx8bvyPkOTkmgXjqWMUA59FzjWIB
	 WW2ZrH5G8vmBaNzWvMzbr/Qd5HkIg3rWzEHyjjr70oZwHdeaXpUauojVD+YTOGXOy3cK+
	 F+ykgxlb5CaE5dAviNek44TPgRSQTE6zjR2r+RVNKqPEEi2B4nzArOwhiUjP7YaRqUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fs5p+QqU;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C0606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A28C0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fs5p+QqU
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e831e86ebfso13313295ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792474490; x=1793079290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQfHHrXMXLY2j/M6I94/T8E0vvM8q6x0cxn+YnCDD4k=;
        b=Fs5p+QqUCKPcdPkITuqn2vGo9SkU7aHtyOKb5qh0D2/mN6+uLCmUXq+UbtxKt+kpT8
         /y/IRsdvzo7lZneeJbbqB80oks+9KC4Tt3+RfSEL/5jCNS5zJJ882fDri/zAEP4c6V4b
         18U5Hx12o6dO5vfmMnuijVlFHKfI3XiFsJ+yqmEM5bonPPOW1YU7l5t/TD8MN3pH95Vq
         /pguadP4d5v/I/pQKKuuwevLO/et+ZlVlDR90StAShUGfSfscvpcPoKVzIpZcq8B8Wp5
         pbfHenTBqUpwDJPqE6OM3QWreyjDqqQAustBE69mnwZYGvGG1KhQVMqD9zt7uJAftN1x
         qo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792474490; x=1793079290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQfHHrXMXLY2j/M6I94/T8E0vvM8q6x0cxn+YnCDD4k=;
        b=2nmyOWRORDgAfOIJsFI/e0l8qonBTbnYPkT95UtWT1snsGzDc5TIytF+iMY3CJvVfO
         giDL6d5VIA9bbswoFrASSbhjB81eNVexwrIYGdfWcNkiSBUTlLRjqyDkJqI2HKyUFU1Y
         HWSeBAxJ/EUcsxWfADOLzPYjy9QSrj/8hU/my2+ID+ltHFWAve/DhtR9TLDMV/U0zHJI
         LrLcymcHt/QkfhhiS9ob+0YujYQvwqIvCqPy6SP4SQ65o4OQaKtDxs1ITAYTlupmqG/N
         jIGWVra/7TLyVpPuW8k37HV1T2RaKVH+PB2oIx4gmG3aweOSaO4i4u3oVu4MOCoLQuoF
         o4ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHzNo9awQHummdh+K9dFNyimojDLmXOt6Vk4ZEg6vN+ytwlU8xPcMMwghFJk+QhLluQEkwXEim8pvbXCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIA7Xo5vOlvaZFJgRmuteLOebBeqWsBPpokD1FSyJV+BZeY/1b
	junc5FSvjD+exIUGpxb/9xXviYatf8uwWRLxcegLeBcFjCqKTHmg9IdH
X-Gm-Gg: AYBFou2WnnoCQukxbEQQgXma053XSo7bVjVbcNXC1XursLhsm383Bkc9KT+pt4C/9tt
	THdHiVcw94+57AJ5dERllxM+xz/wdNjFgyChYDj49VYq1wED87tluCzWnW9piYnLJnNgrtm7szi
	Fs/evrNidhlfW0DoIUBT6w2PgCUOg8/sja1I9SatuS7Ghhj2BZ+XHOvubIMjau2tOAxLTRbBs9d
	PeE1sQyGMpOkJnfkKQ9KCK8YMNGANrGQVN/IPvZwXsHK0VDlr2pbf9A0xgMbmW6aMStydnVFcDL
	WDZ9+LAuRWx6VmBMR7cCri1WGB6O/qbwNOTEaYqV590/WWG7GUgxrmQYfh1kfs8lH+pMPDSYQSm
	51J94PkG7BH0QUI4GHZi+FY7b1XiX8ytqk18zGSYVclk8lQ36XD8m6eobGZjDzkCCHI4MPcRbos
	ToY8cS3eJfVf9J3ovCE3iNWBZ1MYw26EuF2cTQadRpQD1nwbo4ozJf9Gmc6XmOAfQjfA==
X-Received: by 2002:a17:90b:582f:b0:3aa:f4af:1e0b with SMTP id 98e67ed59e1d1-3acee98d90emr8576204a91.8.1792474489983;
        Mon, 19 Oct 2026 22:34:49 -0700 (PDT)
Received: from hachimi ([101.5.175.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad60102ebdsm2216041a91.1.2026.10.19.22.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 22:34:49 -0700 (PDT)
From: Lanfeng Wei <xlfylawarthur@gmail.com>
To: tzimmermann@suse.de
Cc: airlied@gmail.com,
	decui@microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longli@microsoft.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	regressions@lists.linux.dev,
	simona@ffwll.ch,
	ssengar@linux.microsoft.com,
	stable@vger.kernel.org,
	xlfylawarthur@gmail.com
Subject: Re: [PATCH] drm/hyperv: add a parameter to disable the vblank timer
Date: Tue, 20 Oct 2026 13:34:09 +0800
Message-ID: <20261020053433.9419-1-xlfylawarthur@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8e91baa4-1ca5-43b8-bb04-9b5e3630bc2b@suse.de>
References: <8e91baa4-1ca5-43b8-bb04-9b5e3630bc2b@suse.de>
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

On Mon, 19 Oct 2026 18:03:55 +0200, Thomas Zimmermann wrote:
> The problem is that module parameters are impossible to remove in 
> practice. Once in place, someone always depends on it. They also 
> increase the number of states to test.  Avoiding them is usually a good 
> idea. Especially as workarounds for bug or regressions.

Understood. Since Hamza is working on an implementation of cursor plane,
I think this patch can be dropped for now.
