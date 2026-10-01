Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEFF3B3BF3
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869853; cv=none; b=L10ryuRB5ugWF6tshQSG+b+ggQYzDKoHmFjFQ6dLqX3BCkIPrUBJJMAcM1vYAT3fkOLTZdPTLDnsQ2YdLzw+lXkMFPm3x3HqesOuUIpKfQNUeCBT2S/FUs9TdcrnU7hYpaQuUasSeq1OX0f627BRwEpP51eQa9TBWnUrm44lsso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869853; c=relaxed/simple;
	bh=tiGivEimnoa2XWirSyFka2iWq25HCiVKk8Q8QNYIDXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R93zTnRp2+zQlzqdTk7P02yJeFsWnkgziwMLNXrwpkoM73N+5q6W1/RFXWm1nYCGgAiLFcP3+nCJ18CW89RwyMEB8GBeFNxJNnHHzi1bxbkNVENDpiglUtIvhb5WmxvjEMFOe16I83MT0TNiMgmG3Oy0ysoryUhq4e8uRGf8hSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6dqT27Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6dqT27Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D4C1F000FF;
	Thu,  1 Oct 2026 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790869852;
	bh=38PEju8gJraz7rj/lcXRXGwgYOzwaB6JD1QWV7pLJ5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e6dqT27Z4SMNBytpWWlfL5w3s5ueCegHCiUgSDc2ZMEbD2bEswlCFECsVY+uPTcQF
	 OJZVcmsT1d1FHkANFS6MKuXP+V3Qxcvg3LoKWk5M8xzSoi9h2qY2b+ToIgzoFn0jy0
	 hVfnyb14YLbGSN3DOo0GfoGPdnSdvlw9WFZGROSEBne/2Uel4Khf3ihI5NHQZzHE8y
	 E+hkT61NbbqlJdoRL7xdrtVlqLBS5UF6NsXYE1uJPNn+oOu2aztEqz/5aknt5MkT1w
	 MIJfa9ZPAgWBbnHXAyzgAf1RXuBlVgGj8KpmK8WhwEbavVVzaGB2iVKFnVEyWTvT6t
	 uU0m2Vk6lOarg==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Beata Michalska <beata.michalska@arm.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Vladimir.Murzin@arm.com,
	suzuki.poulose@arm.com,
	James.Morse@arm.com,
	xuewen.yan94@gmail.com,
	seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] arm64: errata: Share broken AMU constant-counter handling
Date: Thu,  1 Oct 2026 16:50:42 +0100
Message-ID: <179085736057.651403.12389463608357199980.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001090050.3849551-1-beata.michalska@arm.com>
References: <20261001090050.3849551-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 01 Oct 2026 11:00:30 +0200, Beata Michalska wrote:
> This series factors out the existing Cortex-A510 erratum 2457168 AMU constant
> counter workaround into a generic broken AMU constant-counter capability,
> then wires Cortex-A725 erratum 3821522 into the same handling.
> 

Applied to arm64 (for-next/fixes), thanks!

[1/2] arm64: errata: Factor out broken AMU const counter cap
      https://git.kernel.org/arm64/c/573371caf7ae
[2/2] arm64: errata: Add Cortex-A725 erratum 3821522 workaround
      https://git.kernel.org/arm64/c/45f730467987

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
