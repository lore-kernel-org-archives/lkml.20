Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com [115.124.28.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702CC4F474C;
	Tue, 22 Sep 2026 06:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059892; cv=none; b=lbt0BLdJkXFFiVe+EHZ1w2JOF0FWB4/ZzAKuLn0ZL5jalZ7SNjUWZ6o5lsPGJfqg/KjVkRI5qlSs88XRIEPAJ2/L6Q1vKjBPi1kGMdQoy0dPktV8akxx1rY0NStoXmQcLK+bl3q+J324Md8dehhPjqfJgwKE9aghcCXL2F1lqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059892; c=relaxed/simple;
	bh=1Zv9Hr5brhKUcB8/L5Mo/X0fKvmp9p2WST1ZQpm7x5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gs/q0vg/d+cajR+tU24jkAV3VUYKTHKwLem1KCvpnmIozq1QlMkRXVAcg7ASkNMMNS+ja4dWxjm7hyGcX9L9w4IuYQmweuqnft9DCT2rdVTFM4XeaExzkHsfbUL0DjkfUh+f3OBQ4Qjw4l8WnUmj0aKhxnHylWd+BcWfPApf2qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=WVJN+Rh8; arc=none smtp.client-ip=115.124.28.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="WVJN+Rh8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1790059887; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=SjCyIEDddo0/b9Tm3gRk+0rVv2yVzXVX9NhBIRE0xyw=;
	b=WVJN+Rh86cwEt0HI/7LNmRsEyJX1ZBd2uJtSCMqhZHkWbF+ppPJCnB9C8wSrsUV+GdhANG3QsnsL6MZJgFiUQ/Zpk1ATRku0lpNcDcK0cMXMh0NdNdfyb2kedb7vGsh9ZySPUvafW0Nts4xbXFoFGqaf0Fp5Ol/473cPgv6QvXI=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1208203|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0202845-0.00223714-0.977478;FP=6878995749440925026|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032053168;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.jJokLKi_1790059565;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jJokLKi_1790059565 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 22 Sep 2026 14:46:05 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: Re: [PATCH] media: i2c: vgxy61: reject out of range MIPI CSI-2 lane numbers
Date: Tue, 22 Sep 2026 14:46:04 +0800
Message-ID: <20260922064604.847150-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <0729208e-e1ab-4960-aa03-810bd4915001@foss.st.com>
References: <20260918060352.1879381-1-guozh23@xiaopeng.com> <0729208e-e1ab-4960-aa03-810bd4915001@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Benjamin,

Thanks for the review. The maintainers are in copy now.

On the lane checking: l_nb is the number of lanes, while clock_lane and
data_lanes[] are the lane indices. The check at line 1453 accepts
num_data_lanes being 1, 2 or 4, but an endpoint such as

        data-lanes = <1 2 3 99>;

has a valid count of 4 and an out of range index in the last entry. The
indices are stored as unsigned char in struct v4l2_mbus_config_mipi_csi2,
so an endpoint value of 99 arrives as 99, and anything from 5 up writes
past the five element phy2log array.

For clock_lane the write to phy2log[clock_lane] at line 1461 happens
before the log2phy[0] != 0 check at line 1480. vd55g1 and vd56g3, which
build the same kind of map from the same properties, check clock_lane
before the map is built rather than after.

v2 keeps both checks.

On the tooling question: yes, this was written with the help of an LLM,
and v2 carries the Assisted-by tag as the process documentation asks. I
went through the code and the reasoning myself before sending it.

Regards,
Guo
