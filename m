Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C823F8898;
	Tue, 29 Sep 2026 03:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651755; cv=none; b=UEcrW/76OprsAMh3wLk2ZuT5zYkHNa6lGpHwdzMqSk99kGIQJjFYeoOGW7VwwH7zG/KmZxCLuiyPyT6mdF+eakAVCEQhEhlQKcdrLtr4LcZervaB0x0OmbRcVKyCheSqSxc9KzWyaPg27XLvKpmUnbqkIlUj/s8Yp2b65LYeP0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651755; c=relaxed/simple;
	bh=z2kjs33gZFVJLfKMH/g34v20ynyN/sUAcnyYP7M3TzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJdfS8proEJAVE8B2B5w1LZ+mcl81vK0Yotq2nlug1AkVxIlVQN8aCTNSy100DEP0YoETyYodE4JsRxOXfMwUSuGU4RlylRD1+3qJtHK/8F+7E/kFED7d1QMGiksAz0wpca3vC6om+fwfYKCoMM7YHHZ3JqnI7UT8tYtVYOHDIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSRTSE8t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSRTSE8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D791F00898;
	Tue, 29 Sep 2026 03:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651751;
	bh=4awIwp+tlB1j5JdsSpUEDV3vpn3wZQ5Hd5fK6LXyJAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GSRTSE8tPgbiU7RmoBo9KP3K75DmqbjP+nd80ZmUcDy0eJ+4zI8izRrVO+IQSow/l
	 EN5S3wv/3bRYoUnuSsLd6bE2vUT9+DXMc6DCeE0qVwldrqDYocJYoph2QQGCwItsuo
	 YSfhzm5E5/gyriRxD/5wvVVYlMZHYQaE6GZhBj30ySV1iDyYJ+jfqlBBImShRGCQFy
	 dUrYC9B1exru7XiUxu0eddZFRiifn2P34TSj3hN93aslNhBymf2XdCCTbHSQnwWz7X
	 xV7bJR2cczULXT5TgcA6FJ9lY+6aOMl0sqgrLRN+JG7uftS5CQBpu+quNUWknZeR5V
	 xfCX0G+3GNzEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add Qualcomm SM8950 socinfo
Date: Mon, 28 Sep 2026 22:14:48 -0500
Message-ID: <179065170908.2673486.15794173085508434988.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
References: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Sep 2026 16:06:18 -0700, Jingyi Wang wrote:
> Add socinfo for Qualcomm SM8950 SoC which represents the Maili platform.

Applied, thanks!

[2/2] soc: qcom: socinfo: Add SM8950 SoC ID
      commit: 594b2a67490ccc7c8045ac4919958d1fe90a0340

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
