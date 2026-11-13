Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604254;
	b=Abk4t2qwh2gaFZ1Ia33ayJq9le2qtvu7xR1Fx23ypv7qw4KKJ5Ayhg51C4uW+CDcVis7
	 NTxIhinAofNSPCVMqn/F04QkSfjiiyTSYh1IM9RQuF+2qp5eBX3EMs7npqswR26RRjSZh
	 d8YCdx1mZXaCZeqhZBKia/xPWV4F1ZMDkrpNMn7S3bT3lROQWdTKrOJtWQNVqcBDm8Gsd
	 7mxig3XwsvwzvoyRt23+Az4+OFJMBYz+8gHJtqZnyPlBpF+CZqD4ec3eCZXZnOtGxhKqq
	 7IBY8l85aXwjOU+sxYx723Jv0bsCEgD07viHrWTDLMPU6ZxaqemZf9iawnEN0fG93+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604254;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GN0ortW4nQvstQDFiIJ5PqM8QgjEi3y1N04o3CsU+ao=;
	b=x+U/VXJfs33RfMjWdB/EZYRlGmarkmiATZlWlCsTHH9HWByOtcVvz8h+aHJx597C3hhY
	 nMlezm4lEcI6vrr6zl37iLfy8+tiI9QFt8vearamM6Duz4/a4WbFjZS8NsXl+pBT0O3P/
	 Nw6qLHbcu4+xdG1nkJS6Jcz+gKdSg7htNRMMJtYCHpqqrgMwTMkdPz4QESO1oHCCV3RnB
	 slWX+BzmF1ZEgxQrztYfwyKqDf+NcptEpZIJhg6g8KBrFeiFfpOSTA12xGVApC1SRSyCl
	 /FoBYjvNkXw2N5bQvKypvWQrSvzGpldmUs9Yu3mUVe+Xej2Ky+ILnMdOUZe7MlXtRtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455D9606A332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 455D9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67c246c0c60so2472543d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604253; x=1795209053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GN0ortW4nQvstQDFiIJ5PqM8QgjEi3y1N04o3CsU+ao=;
        b=WeibyteW+XPmkqeoximBfXpZKgZG5pdTFD9jIDoECtyWDrA12nhuQXZSmEoYzwYSOG
         RSVf4hwb60rybXHBy49IS7yb4zKZOSGrPn6bWAqmca3UDORjDx4/VGy/eh/oam+ef4cO
         1Oi4JvEowZRErK5N2hFQi+bfbMXhIU+fiBZr3ORdi3eFRoC3goZmN0fCBYwtKrxPt1vY
         ldG4S2j0a4UACgU7bjxoz/hU2/KPKp/iygSLRQE1gfkU2CY/wgbQ8c89RHlRAVTLDbjm
         isoCdxgg0JXuuLc8AYR+ER7TK99Gm4qaKjjDd2zll1ibj0a3aidYXQ1PgNhWrkmd3USZ
         A0Yw==
X-Forwarded-Encrypted: i=1; AL+hErHHR4F60mDVsA3ClyyA7MWuOSXd5yz0Tn57V+vqlLpoz/0T9lj7x0dad4uQVIgS4vNJUJjQMMlxx5uC6UA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H0fr56aq/fcc1Y/pdJ9iaf7LxcmoVguOXANalzAHvwtorkgIY
	/xi6sfIb7TF8t0v/EyJcy3gen2b/CSnPxiZahmn97BLuLjOiH+qqAp2s
X-Gm-Gg: AYBFou26arPhslQMnk4LypYSY3qK5IBKFTO8ntvHNK50NhLqvwBYX+yNT4xfET7eFTI
	6MkO80UyCuTPE3OOcn9L4TUwIaAiWvZAukgLBEpl1wcXX2JsS9IUU7XrtzX+km5Z2sJG3C/hCw3
	EfoyOHW8etQwF4OL3qRGNBRElLKtN42FYNv0Lyw5PcmbcFsG8OFUdrSREq5Play9mLkAh1XXxO5
	gPy10KSc2D/K1HwsIkLvgFVhfdUVN9L3uCNH6nD5+auB1Ir0XnrnkOjuB32AkQUBVofyW0wUv1T
	LfOIGtMdX1xaRWHPCJ8JWs/pmdFlCtVnVWJsKpiiG24TYWziehP/3swfWM8xtLSm9FTrdGJvxOC
	GFh5PXUefO/2NlENAwRGYKNhSYKu0GO3LH8myenhFgF0ksfaHGSYh0ou7+P9aXTmm3TfR2Il+Cl
	rWB093SGypvBsgZprp/nY4UsOBrPDjQA4+QgVfV1zrPiEJZelfS0GjohMNtm77ouSZAfQ7KEyeq
	GWJNvMiRTXDYw78CWOPwLnq8hKSXdFGiRjvpif7tO1vTklje6SLbpBjzxpTd4x0LcNUuCcINL9o
	+AqKgxOan+tMhnsC3pWl6q3KfVup+UsEgzfhtX1eZKkuvjvSgPVEz0Pks+ehcZn5CuKdGnmdkIk
	CkST5AZ8Wge38B75eG9fqbE4FhjFbNF7Pu26OyvGS/54PO0o1CYJp
X-Received: by 2002:a05:690e:190d:b0:67b:fc94:86d4 with SMTP id 956f58d0204a3-67c78c3c92emr4305281d50.8.1794604253368;
        Fri, 13 Nov 2026 13:10:53 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a64b04bsm3050965d50.23.2026.11.13.13.10.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 13:10:52 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: dri-devel@lists.freedesktop.org
Cc: patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com,
	imagination@lists.freedesktop.org,
	frank.binns@imgtec.com,
	operatingsystemsdepression@gmail.com,
	matthew.brost@intel.com,
	dakr@kernel.org,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH RFC 00/13] drm/powervr_sgx: Add a DRM driver for PowerVR SGX5xx GPUs
Date: Fri, 13 Nov 2026 16:10:51 -0500
Message-ID: <20261113211051.88798-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
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

The Mesa side of this was declined, so I'm withdrawing this series.
The driver will stay out of tree. Thanks to everyone who took the time
to review it.

Joseph
