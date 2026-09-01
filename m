Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B0E41A559;
	Tue,  1 Sep 2026 20:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293534; cv=none; b=Qj4O54QWL4ljMEURFLsswyZxYFaU0bCjUI5Jp+7FeQtsM6PiN979NQyHdzJ9ZZUFGVOQ2457KkSohGBy6tyTzKxtF8nMFkvP1ZY5ywn7Mb/0T6n1j+5WDkjLWJO3EuRsBRdSBSgOs/tfv4MDZOUcu1sTpbp62bQNjCNxFnEQ5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293534; c=relaxed/simple;
	bh=SJzR72pQD5gBS1917aRa/6DlPqZhK4s88RdnKtT4toI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NOZt77XFLz+mBxXfkQp3fSt2xpzGEBQsGly8QJprV/AkFXA43gxG98/BDJfmwm+9fivZTDn3mJJudGVB0wMd7zaCXYK/gOJsKthfguSCauTJqTPxxj4VCZkNg4CgpCyzz2XhXMa7FWBihrcvpCQG7i/DLD9Et59N6xFFLx5RHFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WM2N7lrj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WM2N7lrj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543B81F000E9;
	Tue,  1 Sep 2026 20:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293526;
	bh=DvTXiWu/bItfCARpRA0b3rATqvTSL8ODsEPyVemaOF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WM2N7lrjPxJ1DhG0v9z4XllQeGB7wDmCo9H5eQugxtozEiOiK/XKhjDtgeSTFCM/h
	 hDj8MvkL0bj7/UyK/C4l/2bIK9f0J/lZh8Y96EV4fs8GInMi+dUrElML02gGCBtJaX
	 nanKfArkiZIQnGx0gInO4JS26MsZqc/iG4DZSt+ipx3aRO5pIXm9a8F054cZI9t7AZ
	 dG/XhLpx3xeZIV4/bP/PvrKOogxatb//m8ELpkuDdsYjEoTi8m+7aAlq6hfENHq1DG
	 NRkbQYDEIV4gMD50NuxmYpW+yk5Ei3v0FUBy3D3cfdEPCEOpyWLuh5+wnIRn3NimoG
	 HsicGnEIfLyzw==
From: Sven Peter <sven@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: (subset) [PATCH 0/3] Enable shared GPIO for Apple Silicon audio support
Date: Tue,  1 Sep 2026 22:11:37 +0200
Message-ID: <178829346733.46626.4826048578689802871.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 21:32:38 +1000, James Calligeros wrote:
> On Apple Silicon Macs, every speaker codec's software shutdown pin
> is connected to the same GPIO line. This line must be pulled high
> whenever any codec asserts it so.
> 
> This makes power management impossible. When we goe through the list of
> codecs and call each suspend/resume, the GPIO line is asserted low or high
> by the first suspended/resumed codec. This causes issues for the subsequent
> codecs; they are already shut off by the time we try to cache the register
> state on suspend.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/drivers-7.4), thanks!

[1/3] arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple Silicon
      https://github.com/AsahiLinux/linux/commit/a416a347931f

Best regards,
-- 
Sven Peter <sven@kernel.org>

