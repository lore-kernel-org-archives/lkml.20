Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2FC59572B;
	Tue,  8 Sep 2026 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888490; cv=none; b=BSNYdZtVkSEysAKMgj/o8cGxRWnZ4ZdYPwl7tq0SX3nfqoTbFSo/+2Fm43IAo69A3KMmbj0UrbTvMmH7Su8m+QyjwlaX1C016gOcWmnLCCxroasrb7xgR7RI3CqHsvbkfmRURt2a0sqYdLHswIbb22LZmUeb/wRxhyiE3c1FxDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888490; c=relaxed/simple;
	bh=fMJiwrHTyjvVpgbOXarjvXSkyT6yrU59DVbno2lZsBs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Xw3dTlN5bP+sjBSOzbPPVD/t+zGZrWSCjGY8bkHToLklTEazIw5VBwA2YJq6eVHqHLBsZ9faJCloKRIi10TrII9jlNCOKjdRcQHCdr3UTpfH24sN66Y6FZsMM+AoOT6TlHQZn6UD4Pfb1ykFqkYHvu3Wk67cUkao9B5AuW4yQH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUVUzHW+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUVUzHW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018091F00ACA;
	Tue,  8 Sep 2026 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788888489;
	bh=vuOH39iw3d/PmB0J0eEsdrkaPdDup6dreHUeej1Qxy4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AUVUzHW+C2uSRaCKaT68zCs65xE+E+bvP7kiqDjBgKqaxhV5ZUS/Tz/X41vPnb8ei
	 49HX8n+akUEV+o5WE3drG5ToO3PE8euS/o98cm9zFEwJb7ChFBbTJZ9OupjKu7eWhO
	 FlJUoZ5xOJpJaI++TkGh1zDG2IKjGn93zjjIk2h5HKrSOHh4AIdEvbZ46cuvcbfv6V
	 nT6E7w6cGqObUF/ztIQM8tnps3KxB1EryA9rqApgEEZHT+iKuoWSu6jIABKjS/u1XQ
	 5UHtBD1VqkbSNw2Xx9xG2MHEwuYkfT7oCxjPPw9E4O3E37LTuWW9MctAEDW8/RsbNS
	 2iOjy7oU1VCVQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] ASoC: SDCA: SimpleJack support and small cleanup
Message-Id: <178887273153.78527.8368268314964292566.b4-ty@b4>
Date: Tue, 08 Sep 2026 14:05:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1569; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fMJiwrHTyjvVpgbOXarjvXSkyT6yrU59DVbno2lZsBs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoEWkkrszhuMlG7oo3McIp9lvM1F9dN5iXwBzl
 O9ph1RlvG2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqBFpAAKCRAk1otyXVSH
 0PnqB/4uv6W9gXrzjMMIb9Ayfa6L1OBYrUxFHHI/2mY+O86o8ZKBtIMDIMPYalsXfq12VJ2EWV5
 YfY86J17xfks9I1HzaXH32PNj4H36dwtgrRmiJhflmz3tyQxjqG+4MbkK0Wp4tvNnIs+GKqTT5i
 7VYmyzrOOBybbJgGuwds2VNOFfbb664g9Xyy/b2Fu7s4QcN456vbSDv6Z5p4piMhFzSj7PPz0IK
 PNELcbGR6iWHiggnYRNAtIM8gef5sICq+PdzECyiVgSmqwB8W42jwfS0U6Dkrrx44cwz0czonFu
 YViMQ/qLN0LTMoRbXql7TIy9WcQSxpSKfFO1h0Yk1vunRq7M
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 08 Sep 2026 07:36:42 +0100, Srinivas Kandagatla wrote:
> ASoC: SDCA: SimpleJack support and small cleanup
> 
> These two patches were originally part of
> 
>   https://lore.kernel.org/all/20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com/
> 
> As Suggested by Charles and Pierre am sending them as independent
> of the rest of that series and can be picked up on their own.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
      https://git.kernel.org/broonie/sound/c/29863d75b9f0
[2/2] ASoC: SDCA: make find_sdca_control_reset() return void
      https://git.kernel.org/broonie/sound/c/1a6a763a6237

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

