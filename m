Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98849B1E0;
	Tue,  1 Sep 2026 18:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286835; cv=none; b=FVcrShBZ1SomSwl1z2ZZCUBq13trAMJm455rwRtW4/NuFnpLpwA8CkLhi2NFtRVZmvIyTCrViFlDswXlAHGr4vp+obsH9aNXzg4NGzbfG/3ykTWnZ6lu2zx6Hptht60/fX3dz4XCODxWmA1IRufUTu5TmBfES5ZVWn1kNhCnDgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286835; c=relaxed/simple;
	bh=G1o2fOb+b8zZot2tnJjWu9uxPSwY7Tt8RZblc4UrUIU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WqJiR3ULGJznFyvR+79kyQIctoQoiQc6GikcBs+9gNg3FnF7FBdqlsUyK4kgt4Ij2TCVbPd3F6TYSnwctOGj8lqnpXHslQZzGhFOVtyzgKQugxY3cg92LQhBkwSEH7zMhNRBMhKOa6ehekMpxnrYaS9s1WmtUJd1uq7dYF/ga6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAHH+725; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAHH+725"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BC31F000E9;
	Tue,  1 Sep 2026 18:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286834;
	bh=DzFOSRSfFZEXwrU7R3npJ1aDPbSVcIQBYbvQ3bdLSBA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WAHH+7254KBQOS3SGjEzNQl2kIb0pIEqWi6esAGb1/H2Z17DalfXZAbr03a2NAY76
	 nQF2OjvbjVljOE9Sfit/4hscwfGXja+krslyjYyqqaSp5yI4cE0tw4SZ3IhkfB5iGU
	 lTt70jatNK32KL0kgvDQWDgVNbxbBVVSJ8UI7P+iQ5w7l5KcrXdPvMygbYNC2eWeUF
	 c4DH+AgUJLax+VhKEfjkgIPomaVOVbk1TEI36ecWwnBVQjVwHve4nFjh4lZh6S9FjH
	 jA1huZZ6RwOwR4lYSda0sB9KndLh5JN7NaSSFnEiJIqjjh73I0MfrhQ5Nur590SL74
	 pO4jEdGlXzwtw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, David Heidelberg <david@ixit.cz>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260823-wcd-dt-typo-fix-v1-1-a71b458e0d31@ixit.cz>
References: <20260823-wcd-dt-typo-fix-v1-1-a71b458e0d31@ixit.cz>
Subject: Re: [PATCH] ASoC: wcd-mbhc-v2: Fix incorrect properties names and
 typos
Message-Id: <178821151230.439600.10637420602245098274.b4-ty@b4>
Date: Mon, 31 Aug 2026 22:25:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=broonie@kernel.org;
 h=from:subject:message-id; bh=G1o2fOb+b8zZot2tnJjWu9uxPSwY7Tt8RZblc4UrUIU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxduwOrHkHo1rY8/YGWj6ENU8g+oyi+g/MKYz
 9bIL23CRWuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXbgAKCRAk1otyXVSH
 0AY4B/4l0fCPcwoWeSMia0gdd8Zc2DvAYv2Gje3kXCBvXGdQtsAAIrecSWgB/uSXXRaRVXnaBWS
 q9gg+D6CURQ5EAz73vFRiMbgr5fEi9w4gXd1I5O5qh3qXUwKRxj/MY+v6v0ACa4xI+UBqao1SLa
 6KI1A+oPhScAm913ljEVN5ndrayNCfSsMiC0thlRCUpGocOU//T688XHPLW+DgcE3dmK42AVIPn
 OPk++HFL1YpVBG8cs2i2ZKPG64p1/0w27rNHeZNyh9hIfugoISWMhQZ8yQrLXYtai1bVB+YNCjD
 6McpbDox2edOaaArp9hy46f459pRWKOnjhFljbbRGa3BncPR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 23 Aug 2026 11:09:55 +0200, David Heidelberg wrote:
> ASoC: wcd-mbhc-v2: Fix incorrect properties names and typos

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: wcd-mbhc-v2: Fix incorrect properties names and typos
      https://git.kernel.org/broonie/sound/c/17bca5d55446

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

