Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350E144BCA1;
	Tue,  1 Sep 2026 21:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296995; cv=none; b=W4L/fZfUBF+UfrkfKOaaPTOPx1s7eFzKbaT5e3oVfhaknV7A1v8yElPPyYeRJM9qa0ZpbqDPD3sv80EybUditOlpJMVxIaxNLs6/JBvwRFuTf1ofXyzIuTCb1fMDB3XXaNco3iDfRr5QVjnJoi2oC4gEsAT1TPX86LtpDut+1og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296995; c=relaxed/simple;
	bh=r+/xbYKHczJs5n4jw9NGtefrAeJVp/F0rPnzufxusXA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V5UMiL97pjshnfmFsdnlDHA+WpveaJGxXt7hbak0n5xy3zZ3tmnb7OEAo9suauStHGbQyEhz4KbsuElpzb4/NXJj9krqOjWaEAYwK59wrgW2/JWMOa3wFYTTKehXXAU6vSxl14OTL9l3QNeZCL9roEPipxx4e3x8R9uAQpQyD2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXIChZYR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXIChZYR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0B91F000E9;
	Tue,  1 Sep 2026 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296993;
	bh=OA1d3ezstQqc/RK3blCRLnZ22qqW1jSd/tGiyNJhLD4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FXIChZYR2n3n1SP4N4wvODekM+70+5rA2YIwE7VP/QVV1xoo56La9ah0u9ZfLYii3
	 z5RIT2fhnsPoR1JmMxcVvegxX5yEnHZy312YyGtJ2le2PDX2YuUm+HaCcGFxUKA7ni
	 h1JwdCgO7QwHzT5UiTlZPIUkxRPp0vgp/6s/JEAmhMt7z2H+XSMjBgu8ZU8oNMGi1b
	 onJKS5l3Y/JgtF63vUtU+/mOYzuux4T3AySUIPp0sK34CTdP/eS+EyjFTVY9svjt6J
	 MIFY3ylxhwrzQgz1uw7Rdn07k4dvUVh+Tm3+5knvu1Jh5uESYpPET/VSuencH3cwM5
	 8SVIIiVnzPaLw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260825085239.82282-1-pengpeng@iscas.ac.cn>
References: <20260825085239.82282-1-pengpeng@iscas.ac.cn>
Subject: Re: [RFC PATCH v2] ASoC: report component resume callback errors
Message-Id: <178828353046.33904.14401744941337808093.b4-ty@b4>
Date: Tue, 01 Sep 2026 18:25:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=broonie@kernel.org;
 h=from:subject:message-id; bh=r+/xbYKHczJs5n4jw9NGtefrAeJVp/F0rPnzufxusXA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlz8eNW5jas05xRiNdus3/L86uAxxupmiZe0mW
 9feAazJlfSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapc/HgAKCRAk1otyXVSH
 0NHkB/sF5nHfyXt4/0eSsdrq70BZbKmVDOVzmtbbfJpOgCwQl5iDTqZCjre9hYB0CXtM9TWakjI
 173yyKHJ09rytWq1lP+OYUtOeuh/x69L2QNBjCKGzMNrYQxmJc4sGmH8NyvLc0SIpAnjvF8aC8+
 uPbxaR89mNCGNVO3LlJfilMBDfhphFxQcOmmVUVovW5HxS8RTlbfvS3kFModYc3ZtI7Y4D9Wm1M
 abttVsjg8KyT86wxARaaPl3Rh4X0GgGmDEdXWLhB3+z91xBVWG4BfDxzHO20Ou9CLQaUCfT2RFg
 KkzLbh4pa5om2VHPCZBO5YSFs9VmDkZJA1yHQCHTsSJ7w/t2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 25 Aug 2026 16:52:39 +0800, Pengpeng Hou wrote:
> ASoC: report component resume callback errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: report component resume callback errors
      https://git.kernel.org/broonie/sound/c/951af101c730

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

