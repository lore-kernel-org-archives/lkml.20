Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FCA57982E;
	Wed,  9 Sep 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969185; cv=none; b=thq/oH1k8S2K+1c5eKfQbA9nBr0BWZUIeUkDxRYhd54DhB84y7lcwy/oSpowW3BUHKyYq26FSEbT3D9rjRqLGQzfZ4V99z+thFAXKcax8w8JovqmQ1+uD631JZ+2mkhuvtITaA2SKtOTb71NWKzNsjitNgVcDq77IoDskIR/B1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969185; c=relaxed/simple;
	bh=BHkLJC0hqDz+ERK3IdSuUXw9+KpoCtq4bWyk1cn/3y4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mGY8Y6aHgNjQ3sNc1J5bWz3aOCUcMiigsLZcPa0rVmSKjEmkjpOAD7154cL/S6xIvP4xvv5zs3dnulyPgNyubGXF/PaoDzDaJCP1/wZpEt/z4JjTnA8iY3QOi3BCT86G6Hzobzezs+xC2e75TEYDE//fF8Y/lTl7JbY2VlBvIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XTkzP5qc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XTkzP5qc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0831F00A3E;
	Wed,  9 Sep 2026 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788969184;
	bh=Rlh5eqlcDiuRDrVl3sj4muEfOWGgSVcp82Q1l8QqQEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XTkzP5qc5uK3UO1SDtOIa0Es15Hmz7Ms96xp7skfgt5t9j497epANF5LHVMocMVmT
	 HeA0lT731eUXrjb+7FJ775wRCWOXf2adSz7JHZkXO2LmnzTnB9lkskL/deZvoknFXO
	 PkpWGWhLgHdU/kbIhxkxiG1oVO6cR6qm4uFyy3eeNGz6jd7PHrv2+u2X8FtRJDvPxf
	 3CpRpl84wOnyA1qAW0dP97f1q8TabwKidSXsdzTxf+183/JIG9bMrGUHpW5oA8D2ly
	 I6L4/mpab3SOBM5zsMPdH+Ho9+nP/vUy+R6M3KOH0/NIEqh9znrSyXJGs3mZZFRwtY
	 vugH6Gza1mGvA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260830141521.33246-1-pengpeng@iscas.ac.cn>
References: <20260830141521.33246-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: sta32x: make power restoration transactional
Message-Id: <178895933274.87467.17320712495330559103.b4-ty@b4>
Date: Wed, 09 Sep 2026 14:08:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BHkLJC0hqDz+ERK3IdSuUXw9+KpoCtq4bWyk1cn/3y4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqoYDcOyALtb6wbfDwimUxPhWoeZBkNuOusIPf9
 w9bE+EYvImJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqGA3AAKCRAk1otyXVSH
 0MYKB/0YkoCmQRVwzBWfP5KdtSPCgY+fX0umuFkLvwo+gvBcR8E9tRU1twLb87nLf8djbgTbi8c
 Y+vdCIgvzJc9mW7ATwCicMG9KB4lTvyT8NZgl+1hun/9fOa/wWsF1zOK/shuFajA40K4n8uCgHA
 kjo2GMzBHA5mZ9PgTb2IAWWMLLuwBs3pA3hoVist1IHfihI875qp2PRf+zRZHE4cf4CikQ9QsOe
 a8uAMGUDfsqqKIqJFTR+V8FEkaNOXTulX6kNp9w5HjvHEo2gIHqd7c0Aq7vF7xj0c6/J7WH3A7I
 HtpdjcqMOzVJEdC8DVH5Py/UbcFftbs2xD61up9I+KZEEj/1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 30 Aug 2026 22:15:21 +0800, Pengpeng Hou wrote:
> ASoC: sta32x: make power restoration transactional

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: sta32x: make power restoration transactional
      https://git.kernel.org/broonie/sound/c/3e71dc4508bc

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

