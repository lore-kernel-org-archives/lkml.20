Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223460;
	b=UpPVnzOZ0Dg0glyT3gh9ijjHdnute9twTJMzAlxs/sTODCrHLpOg4KVJ/UIqRdYIr0GT
	 +KqJFphPqXlgEP8TEqka1iY2g93sYBag1r7U4lxwjgKmEmOueTljKF4/pS3fyIdHMnXbf
	 GRKv8sL9vKcUKp7LOpsONCwOdy6jj/USl3IFALaugqmKuob88FLM35iboWrVjAmBTLEvW
	 4nY722OGRTnJAFU75QVUlPJj7nL8s6C6nbRZzdNXQ5v+dOhMDu4vzCkGrL4CSU1nHobaZ
	 g87tXYSKUbgF6aZEBCNTZknDIs03/nG2n+dM/BvxKTWlSNq4mAnWABF8mheubZ5/0tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223460;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=PUtbdaKnvoW2SA680I0A99nkmg4llMddRjQKLTPtSV8=;
	b=FFMODJlX+Jw6wlZb+TK2yMQWx849kM3vVXxxqMv8UKpxR48CYrIH/ECh5M4f6oChfV8X
	 O0s2P2FcFkSoXZgz6CKFy7QQCnIfJICQembnBGwFO1JMTjKYFP2RxJvbTnZZkpTzbdMDo
	 uuuJBoHLQdCB2tTNhRLxNbPsk7GEVv9h8dCmJwLzq21P6K9nT5CMnQAvYLYbfpgVUYTYe
	 2GXyTULMpfX5iTbvK6yFISdCcI1NHg38EQluAYQVL/isHjfBfyIxK7ptOE9dkcaaayhpy
	 BHbMCfyWD9PD8v6AQpT0zg9i4ZeGnCpDNgfWOSaysJ46GK1m+kFSXbYlEX6RRv7zt0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DIle0duj;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1364606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1364606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DIle0duj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 718B11516;
	Mon,  9 Nov 2026 03:24:10 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A4F63F85F;
	Mon,  9 Nov 2026 03:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794223453; bh=6RMciIRqf5b89tNdY+m0R3BEOkX3wLzjBdLKHwVu9Ug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DIle0dujKXZvQOawadF/3p2dpA7YLOBi9ylbmIQUdY3N3zkJHgiiwBpzM7NBNgS9Y
	 DH1+az/J2fWDoQr9WYfRirDH20XAg5DxC3FSmkO9m2ium3nSECWt3nQPF7E/h0HFUd
	 6nwrjVBTCYhTBAPRXwDRACqNutkOLi4x1wju13wY=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 0/9] coresight: Fix assorted bugs reported by Sashiko
Date: Mon,  9 Nov 2026 11:23:52 +0000
Message-ID: <179422341585.3275439.13172030836992036731.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
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


On Wed, 04 Nov 2026 15:36:31 +0000, James Clark wrote:
> Small fixes for bugs in the CoreSight drivers that were found by
> Sashiko. Mostly reference and resource leaks on error paths, plus a
> deadlock, a missing lock, and a sysfs store that should return -EBUSY
> while a sysfs session is enabled.
> 
> Assisted by Claude Opus 5.5 and Sashiko
> 
> [...]

Applied, thanks!

[1/9] coresight: etm-perf: Serialize AUX topology access
      https://git.kernel.org/coresight/c/13416c2c8e1d
[2/9] coresight: etm4x: Remove perf symlink if config registration fails
      https://git.kernel.org/coresight/c/c78d454cb988
[3/9] coresight: etm4x: Fix truncation of nr_ext_inp
      https://git.kernel.org/coresight/c/e2313b68a134
[4/9] coresight: etm-perf: Fix sink device reference leak in etm_setup_aux()
      https://git.kernel.org/coresight/c/5a5e93191b00
[5/9] coresight: syscfg: Take csdev lock when removing owned features
      https://git.kernel.org/coresight/c/2afdd2ba15e3
[6/9] coresight: syscfg: Fix deadlock in cscfg_create_device() error path
      https://git.kernel.org/coresight/c/83332c58900b
[7/9] coresight: Fix resource leaks on coresight_build_path() errors
      https://git.kernel.org/coresight/c/5fa6b2bcedd6
[8/9] coresight: etm3x: Don't ignore etm_parse_event_config() errors
      https://git.kernel.org/coresight/c/1d2d404d4e39
[9/9] coresight: etm3x: Prohibit modifying seq_curr_state while session is enabled
      https://git.kernel.org/coresight/c/76101ded9536

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
