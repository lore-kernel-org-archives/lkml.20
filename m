Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011592;
	b=kKxUgwORGgqJWYf2/FCOs02ClWN9abPHNeiJaryZa3TL+0gACk0W+5DqOYEwv9PJCDt3
	 sDanqXo4Sp3cSH+XfDb+9XinC0y8sfoe0vkjkHko0ZlgbGfXl1MXm0sEST2i8gPvmS/8p
	 W/SIMzD0wuyABvij+5loKsmEu19ILw+wCT7Ud2ynzUqORvY47VRijpLal4JmUPwpm2fWV
	 OKavBB6swYT2MBd/5EpLiEsHeGiNMQWdrCur38Y4uPIM10uMym3hExO76aeY2cBbWGxbv
	 olCD8ejFshmENxbMqBGdnxDooyEVEROwt8zl7bhd5LK/0crFXvExSOr6CTO+l4jrpRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011592;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8T6J8yDzBrrY8+0J5W7yruUUBqoBGCuuq5Evn3v44KM=;
	b=y3n33ZCP0+qvV0hi4BK9oIXgyaAKsqfITvoSfbhZBX82NfECEV/OqAwa7j16Uv8jSEzF
	 MGN5c4A1V//TBgWBM5h5A1J3qPv4o+3G5++lSbZKESsrn7p43kNZRO3zXWswisIi/TIoV
	 o4jWlWI1pGCwCYupDZ+SlgwS+1RFTHbWdMe2FO5OfCDfqQY8CoCaVml2rdgBJGQ2VbCp2
	 EDxUKpittLeL9QDEUoRTxwDaeJn5k36pUclZM9obApaR/KEtY+ay15Giw+iy35j4rJHB5
	 Krx2BNQ9HscVaBe2+kIN3ABsmf5laMxcBp9r8hXz2lyLb4qojBtdyfLmaqj4jTttEmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YL5aGo/3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64471606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YL5aGo/3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3601F01829;
	Mon, 26 Oct 2026 10:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793011592;
	bh=8T6J8yDzBrrY8+0J5W7yruUUBqoBGCuuq5Evn3v44KM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YL5aGo/39dTI+cih6/OaLzbIL/1z1YCq23fgbGwaBHXiNPAke7lmvEa2zzM0fRTW7
	 CEsO9bqaM4xGgxqQ+OS3QGoKRe23WPhnaQxWzRctSixGPIZTsxJOAdfQ0dG42FXiI0
	 DjS8A3NLtM+42EWp4oPnMuCv71SfXhd15BCPYCOCN8D/3+5ODYvu4eRKtrBfQpZEA7
	 OklV5XMgvqzIA/xLjVoqp/gfUJukcSbdXfA77Jf2a9y9NY8WxZdSvkGU+K58CGWOrm
	 mZwOoJp+YT0zruYqkaEfPBkaMFl9o7lL1k06EkjzZcXJjbp8e2B1GLVtqXQhtMBjk5
	 mFsyxAx1/kFjQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	tglx@kernel.org,
	Julian Braha <julianbraha@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Mon, 26 Oct 2026 10:46:26 +0000
Message-ID: <179301154574.1773497.7405050699126931502.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020222817.1231643-1-julianbraha@gmail.com>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
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

On Tue, 20 Oct 2026 23:28:15 +0100, Julian Braha wrote:
> ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
> dependency, ARM_PSCI_FW, is met.
> 
> Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
> select conditional on arm64.

Applied to sudeep.holla/linux (for-next/smccc/fixes), thanks!

[1/2] firmware: smccc: provide stubs when discovery is disabled
      https://git.kernel.org/sudeep.holla/c/6cc03818814a
[2/2] irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
      https://git.kernel.org/sudeep.holla/c/40b097fdfd00
-- 
Regards,
Sudeep

