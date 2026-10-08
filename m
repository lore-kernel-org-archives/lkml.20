Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F862DA76C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486078; cv=none; b=JySQCii4Pq6HlzpJvGptxyq9IQB23Vf7WGR0mEgRCCGTMmSor3cjAAA6RTrvJ7l5GIumk2OVYFHmg8vTd9YSJHyXsFBfuCREN0llCXUyA5m3MsW2h3qXD+LPxezVba4C2JCHJSO4twXgfGvWgbN+u6arnRYAbuJQhb0WblvKC0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486078; c=relaxed/simple;
	bh=2ENKqBaTPDdQhMdT3t9NB4MtzLMzeAWRcMV4ixhE+9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DkJJY0z2GqgAW+P9txnP1qI7ew1MHHjbERlzOwon5TNdGogaX1SrW+X6bEI8tD6y0xXZjyffO6G3mRvdY0dnhrO/fygysE9n2aOlPMiB9FKZCQMp9SPo7c3ODaiNlHsfmO4MBWW5c6chMGej0UOd1AdCDWM7x/EMlFcU4+FKoxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=MBcEWciw; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="MBcEWciw"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so1897082eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486076; x=1792090876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FggUo6U2laVtXWdbUW1VXActXrfV6jQYFCULV8ijL9s=;
        b=MBcEWciwLi1bYaNc9DFKUuNiSI53IjnLwgJCZhLQJiU/6yWp0TAhykhrCavg1MLjj6
         xs2GQJ4I8t06iPv1pDScxfPYVMll87LDmRvrO+/y5Hz7uPUozpZdadgLAPHvB/INvwV4
         0oweqVEyizdb8AYqdXoIlIX4BkS84zpQt+lYr8X+bJ2K8F2JEZMORSdXtPzx0QFSDdaW
         2z+E61Yr8RQ6HpL8Ufik9o6DCJq5YMgrK8ydrxJ7hkUCAu/I0dkU4G0TjjzeFrWPEPnr
         7v2Ad1TnAUs7AwVOZmAbkuJq56A/jKNKOJuyM9GKPwHLSLL5z2a5lNIvAZqScau5psRM
         rkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486076; x=1792090876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FggUo6U2laVtXWdbUW1VXActXrfV6jQYFCULV8ijL9s=;
        b=teeFDlOZvwnguXUrT1Kr1dWiEgDphPcC1CqwHpwcYu0W1I0zU1pxl1Ny8bGZTARDKh
         +mdENLj3QyitxWgfvoRmvxPHQUn6jPwe/ZnuZCCCBpQsKHn5nW7DcwEFWOkUP9XbLN/H
         vc7Ta592w2BUhOkQF9qQxTz5lNh4pWMZwUxI023ShQlbjZgvNxwfyMQxcLoyBgXL9lTb
         PH/48FyoBVobAza0MDcY3T5Cw1ku8jIb1h2rTkowxh0PmQ6qh3eAm1okoXuBMfkf2nPL
         GvX8zeB2lKJwQvNsNYHSNa9ADedKwiVnnM/rS7YJo7aU6K2gMRQknRTAqZKwBxvEw/jr
         fFmw==
X-Forwarded-Encrypted: i=1; AKwUvBw/I44zBdpNXS2O/AAFVAnJUIeET+kDw6+lEnIr6OF4tG419y/WhLyI4nWci8Gtt1eHCZHM9QB0W+Ptqgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA7xPCXghUhvPTEkf23MXM+OUXCtJQqP2KizP3+2/GK0FFV1Kx
	z8xG7Os9+EnXCsSEJtpEOIBmOd1Dtn57lFiCm4XIJuNot8fz4CrTa9Ydfh8Hgb0aO2c=
X-Gm-Gg: AYBFou0nNchWsUaoWnjhcxCmBYBgPJxBXa4YGIpOPnCAtN8mVP52HAZCFhVyZHGdbBU
	Z3e8iT1F7slgiIxaHOidKOwXsk+4WqAZ8/nbyy31NB2d9ZqYMJd/V1JIXKh3M9LcMnvZN67pNfa
	WLfCZy7b0qkQyX7WgIpXfDhXsnKwtNNc93r38fiukmYFJx2wQGhT3MAB34ri4j27jNV3u1eW1t/
	x20EKeEHvxkJLfjv9v3xsxJO2lCC9ORWU3p7UM6FqaUkMpStKh8z45/0ZJloHw204DvSDrVO63n
	Ey/SAdr8B/zjKI4v6mVts3uKOsHIp99umnufubQMpT/QXcjGlmWrIS5iXJAIwxdeg8TmJqMOIPv
	NwQdMmvNuAzD++NHmqoiASHLTWn5vBH9GTV7ON1GOi/y7Oj4baaLxKxRo7JObedjXfKYdz0HDli
	zLrueIH8dn4ffaj5D0tEHyETS2KcaHZOTKS0MyyRMhkTG6GbM3+VXQu8rpBtfnOCKJt3n1a3iDv
	E9leM0Y/q1xtZvkxHtboctrU/1Ev4SLXQ3pFC5qlgtRK6mD+TOz5OpcyIklkvzNzcgbHMQfOd18
	BTfneoM=
X-Received: by 2002:a05:7301:d194:b0:351:28eb:8cd8 with SMTP id 5a478bee46e88-3515ddee11cmr7825200eec.18.1791486073803;
        Thu, 08 Oct 2026 12:01:13 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537b3eccebsm405691eec.12.2026.10.08.12.01.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:01:12 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	linux-sound@vger.kernel.org,
	Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>
Subject: [PATCH 6.6.y 0/2] asoc: backport CVE-2025-21870
Date: Thu,  8 Oct 2026 15:01:02 -0400
Message-ID: <20261008190108.96660-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2025-21870. They must be
applied in this order because the later change depends on or completes the
earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.
These fixes also affect 6.1.y, which will need a separate backport; this
series is only for 6.6.y.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. ASoC: SOF: topology: Parse DAI type token for dspless mode
  2. ASoC: SOF: ipc4-topology: Harden loops for looking up ALH copiers

base: v6.6.157 (79643295eba17affbd16ca97f3ef04c90266b28c) plus stable-queue
revision 958ddf240a33ef26b1771be944f0ea6c3b597472
