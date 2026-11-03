Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743653;
	b=fuVTZkp/t+OY9ERZDqT4+JNV3SAbiiKHNIhv2xZbPZGVU8CKSWBHTv1PqwyS7FVq1PIe
	 gu5KfU6r8NV15b81mUWRPi38fXGs6oZfnreYMW1dSgadchXcCiKLVtaEGQKB3q4QlTXJi
	 74i/ExO5EYwO7yyn/wcK4IBpNyGGCUvuQsuiglH3sgMHI2U7oz8IL2u+HVCnce4TMO/Et
	 gHlMmV6TOJACQT+lwW1fp1rtDbFH6uNOgCDHwID2wFxyYOpf60BxrhPqieQeFmmOUUnfU
	 bnGap3lsz3rdJDThPga1iO8YqCSjrNlpL70+RHeP9b1375kfNYBVTRQjl6SAuBqVEaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743653;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hUCocccnsnf4xuExAg437z+DV5q0Sp1f0DdcukIjmG4=;
	b=3UKLFQP5F/+IwlYHusSo7lkMhzlxMrKh+YB/z1KfUtt8LSe57WmizeO5NdNaYGf1Agms
	 HI5YmYTXR+/RKj2dodsSY9NKOh5v/oIsl5GtH0lswO96h5gL9wiJgqz4TnVjHU5TU5jGk
	 lv6f+8Fr5XikZor0UGhepy5gT024aX5Tu+odCehDnl8D7F3ZFQzmv6ZI87GSqXiLsA8HB
	 wAajHCXRFsaElvlaICUVqgfBpRlp0YHFcppPWdBg/ZoA1ZNlGG/vFMtIoH40K+XfTeU8W
	 QbN7yC4J4CvGgllmkt9ZdH8yCkQYJmW0gMz973d5qVv67h6C73NkcqIQhpDAyQlQxWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=1g44ZpTk;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A990D606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A990D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=1g44ZpTk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hUCocccnsnf4xuExAg437z+DV5q0Sp1f0DdcukIjmG4=; b=1g44ZpTkXoPPCChI1zYrpMbJGO
	D+a+MnExzT/wGw5Y6PwfcXQVdZY5GMsN+R7zTySPRbU854mlVOP0lCKi7G6lYwFo5hw+W+hcu8qRW
	qsqCHADeAlRx9ShK/WPyuOI9NoMB3VYmDrI8C0hDL+5WSyHhj03ND+5GbR2Zhw3LXbL1fHuqeTZIy
	0meSJGJHd/5++cD/95RqRZdn6C+/VExHvsDFOtpJMaRqlW/OAI0dy54JCdoyDbHPOfiky1BBArLGV
	HZHUJ1VX9DvS1hrE2xwMjCuy16DRPGa0EAd2QbKI1PGwDaVGdPf3TtQX0k6TVU7GX4mXCLX2uOt70
	3kUGwcaA==;
From: Heiko Stuebner <heiko@sntech.de>
To: sidong.yang@furiosa.ai,
	royalnet026@gmail.com,
	Triet Hoang <triet.hoang.dev@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ogabbay@kernel.org,
	tomeu@tomeuvizoso.net
Subject: Re: [PATCH v6 0/2] accel/rocket: Fix allocation handling and scheduler array leak
Date: Tue,  3 Nov 2026 23:07:26 +0100
Message-ID: <179374364224.491826.14820937269561898345.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914045605.381933-1-triet.hoang.dev@gmail.com>
References: <20260914045605.381933-1-triet.hoang.dev@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Mon, 14 Sep 2026 11:56:03 +0700, Triet Hoang wrote:
> This small series addresses allocation and memory management issues in
> the accel/rocket driver:
> 
> 1. Patch 1 ensures proper allocation checks before using pointers
>    in rocket_job_open()
> 2. Patch 2 fixes an unreachable memory leak of the scheduler array when
>    running on single-core setups (e.g., num_cores == 1), where
>    drm_sched_entity_init() drops the array pointer.
> 
> [...]

Applied, thanks!

[1/2] accel/rocket: Check allocations before use
      commit: be22e979c18f5ac6407f21c860a3e09d5411ec16
[2/2] drm/rocket: Keep scheduler allocation in rocket_file_priv
      commit: 91c7da1f42cadba62e1b0ba40be999803d998db0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
