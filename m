Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627484;
	b=Qmw+dqAbzVYEE8lIGWePn61vJbg2KNA+ZqGVOodKdJoHDakOTx7eMXg6eVdAEjdZvjqF
	 x1318g6lnKaYjtz04Ykpz3SHL2IXQ2n9on6RdRORWBRnc62AG3kSYMHNkawRdQD0HnM4t
	 ocMZKT5cYIRfZlKsGZXD4a7VvnP0gwOQW0lmOob0jWIQbSPqU5nqDeHqy9CeKZ8GPa7oL
	 RSLMnNGpMrqaZsjnrQ4FXRvTzPG1HBg8dIjL45ppsXlWNi1KdJ1p5wEkab3DIzRF2AzH6
	 8yddE75dCMn1PG6A/b8AtIWk2PXtZlJrztrws+Qf4zj28RT7/KBt47PTdsvXnbh03HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627484;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=gwiZBxBwh3YvFiuU3Wf/oJCU0MRFpiDJmH/bzEWCvwM=;
	b=dWDNLEGvwsSFm2dyMfSFv1uZP5bEJcfi6aSKvra6gNQv9EGv0lepxZBmc64fxbkC2lps
	 rQQZbbK0qILUT742dtU2L0prOy3HH+QgEZbAtK5G6x/z116XBcMMkyFIBce7PtGj0jdH0
	 mNNavWwF8PDt8kd/x060VV4luhm+L797q5n9Xjl9iHOE0zsaKZCIFUwEBZSXTm0pmw2oe
	 CsEGMYcpSfjLL84YQ5EwlkEV9SRielWII8LWHZBVgmHL4Ha0wUQc19O3sNM2yaSxxO/RQ
	 yGDC3qFkFFbsL6R/DgV/WCHiqGovKROBJw6f/LXlbIprsPeWBx+c44RnA/7+IPEUgpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWFIDGp9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270560A2620;
	Mon,  2 Nov 2026 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWFIDGp9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80CF1F00A22;
	Mon,  2 Nov 2026 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627484;
	bh=gwiZBxBwh3YvFiuU3Wf/oJCU0MRFpiDJmH/bzEWCvwM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iWFIDGp9hjniYVb/JQRGpUqMritbyBXoWCCd/1eQreIaJucwXuWKjURmikJ5+SYmT
	 4p8SUJkovwyjbbgy09m6fz10fd7KnRjpIfHeSPbkM5L7salg2vvBoGVbnfDgCCFM6x
	 lR/fD5O6kT1h5MPcYsOHwppBNm1GLlud0GpElggnDghNn4d6jgQbfE+LsYW/kFyJp7
	 FdInW28Goh5uixnj4rK8FyX5j0wTkDg7RSRzuoy64fCM3/IaHyXdIqBsilkXtEhSfN
	 HFQAinAyk3yGMfhanqUrZOVYzS3M1E061moQqiNAJj1LUcv0qyVodCb5iSs0WSBYOG
	 q/Ne6swBvx1yg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 3B6912344CD0;
	Mon, 02 Nov 2026 13:51:22 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261025081610.2675-1-tangbin@cmss.chinamobile.com>
References: <20261025081610.2675-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: qcom: storm: Fix of_node_put leak on error path
Message-Id: <179357908661.1716893.12932787546089480317.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:24:46 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HTZNBV0AGiJdeyefYbDJG3WhtdKiUwyg28WPMoJ7wX0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTI0y1pogqcggLLVdc8Gk4saV+RFcamal23eU+z0/r
 1l516Ovo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABOZLs7w32FydbSoTtIDniWX
 XzEsmKvlY+DMostT+Zv1Un5yvXjBGUaGfmGFA47WBz5I1WdcnuW9eUb83KqfevOX/BEr/Dn95ub
 LXAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 25 Oct 2026 16:16:09 +0800, Tang Bin wrote:
> ASoC: qcom: storm: Fix of_node_put leak on error path

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qcom: storm: Fix of_node_put leak on error path
      https://git.kernel.org/broonie/sound/c/3e8dba0e26a5

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

