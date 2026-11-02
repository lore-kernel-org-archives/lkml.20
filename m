Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618472;
	b=30IwhnMumfNjw4k+s/8vfsV0P7lqraDb8AK5nFV/K6CtpkrWwAPaku3y2cQioaXZjsLW
	 vQL4S9DeP/C9yaKLpQ3Lg/7XGtjWzd7/TvLxv3tDf95biqoKxZpkV7Zm3E0B4miOkT3rz
	 DPufy83sXzVEYG7lThZh2cZWdnq/v7cf5PHYXAu/fXmDGIso4HKIbDS1SKuC4D773Nsua
	 lNThipEfiEJH4Tgji5w9gUvpKFOtIWLQm5WC+9g1UloxDiEpNvKUgIbemYmRwZrUCXSck
	 rWexdn8flSJfHTUe0GOy6jXx2hIRz+J2vmksK+UskNMl8/09YDT8k/uHPg4dWoma5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618472;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=LOFuYQz5j6DmIjE/Q+g11UkPLw7GOVvDSuUkb+wz1/c=;
	b=K6D+NR8W0MPKhSlABFA5tbZM91axbzd1Z7XsKYu0qBB54eN886ruqFinMaQdz/MriK3K
	 PZZlDxu4LX356fc2FJLoSZhQmaW3ov6lDj1wxotS6hUIgaG45C5f+XtQReJsN9HUUVW5V
	 jh/tRfZGyl8nmG8+eaFHAkybOYzcUk3lC5IH/20o5LU26RsnAYxxcEqrpn3u7Rwgn6+AI
	 W2vT09EH07qc2npi3SR5RCf0dQ2+2O4aix6KHV86+k7K0Q3MFJdCF2sm0UzR+KAot4Imn
	 HY7X74ImrNUfhENz6Y/GsB71JFsC8F6HzUuwEikwwoMzKT3BacJYVuUa3Qg7oYzM83Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShS8XVxx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BC7606A326;
	Mon,  2 Nov 2026 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShS8XVxx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D3D1F00A1A;
	Mon,  2 Nov 2026 11:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618472;
	bh=LOFuYQz5j6DmIjE/Q+g11UkPLw7GOVvDSuUkb+wz1/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ShS8XVxxkrOTl1Sn3gFl76mVmG1hta04ifCwJwBPSRvOQkX4X3Q+F0Dkde2tlLhSt
	 H9kiywZP6DlTl9c2E+NzcXezOfwdNJwCSbZhsOpM7YQMTLoVECG1IRv4N+Anm21/4W
	 U6rRckaK1edfSfMgSRvXP8G7dbb8RrlUAZgVLaXW3ztM6KJs2abQP3uVpwOyKpGost
	 RHtImOGJnlnZcBGkZ4JLUlrJHXC2oyEAdpBEzcCufPMwJZR/w9T4PWuM93HNfSNQAL
	 KYPky/jaXKiY5MC1esdDp26LD+96eWTkQihKYqfSDJrnCYYndw+QE58J6Jx9O+lUqV
	 pMcpaRDsyaJyw==
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/6] ASoC: SDCA: class-driver fixes and PDM
 data-port support
Message-Id: <179361846817.71449.16862116006916454790.b4-ty@kernel.org>
Date: Mon, 02 Nov 2026 16:51:08 +0530
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 20 Oct 2026 08:38:50 +0100, Srinivas Kandagatla wrote:
> Three small fixes in the SDCA class driver (propagating a read_prop
> failure, dropping an extra pm_runtime reference on probe failure, and
> re-enabling the IRQ on a failed system suspend), plus three patches
> that teach the SDCA class_function path to tag PDM data-port terminals
> and the SoundWire core to treat PDM streams correctly.
> 
> The three fixes carry Fixes: tags and are Cc'd to stable; the PDM
> support patches have no Fixes: tag as they add new behaviour rather
> than fix a regression.
> 
> [...]

Applied, thanks!

[5/6] soundwire: stream: skip bps mismatch check for PDM streams
      commit: afd88e7ad78170040612f608203734156b8a9eb1

Best regards,
-- 
~Vinod


