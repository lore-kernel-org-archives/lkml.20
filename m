Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DED72C027F;
	Tue,  1 Sep 2026 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261905; cv=none; b=Cdane+/5FQzkiNm6EOQ89aT/NV9091PYI5imkTbIuXzVcyH7riDWWnhfhCDN3DX2B88WBoBZg0zYhpSr8fiVbLZLUG2Xg8VMcWNV0hrk/c/1++AjQu8qJFnjWPxUSLrSN1DZz6fI3NcBcsGceFHFDex8V/VSMlZ1i29F50A8oXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261905; c=relaxed/simple;
	bh=yWfNKdz7HAVroXMHN7/2NOMoTKz5E9piBvjTaavTBd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jcq1lLfvK2izZ2tvgCnuqoqRwNDZ545420KD2beKqvdFyslodlxBPTSwGIdj6ZAzoGXwbRntHebWDaSSCzHJIq86fBO97J8q5xhg5HOyVdysgoSn2B+qgy5sDhuH3cumlGje4+BNY8wNzL3E4ELWxBPtjXeeIoNe2thoeghBhW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YX14xIXF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YX14xIXF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042CE1F000E9;
	Tue,  1 Sep 2026 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788261903;
	bh=9/pgRNnN1oUPIt1S0++4gkkUojIODOUZLdqpUMSg968=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YX14xIXFOcAMoFwwHcrzk6CuhG0+T5zXW4lJFg2lV+EKBCfbc2X3hZH8YKpnq0dlS
	 HWpJ1RcLHKZDIweBxjy2rqg2LYINR2ahOSYvfNemL0nA1qNF/gZ7oo6Wz0O79aPr0v
	 0GkuEqTyidlRbLrUGJydkERPy+k23OL9sS6YfFM0fiJmsP9nYlL/Fb3L/tc5rQu5dh
	 ylD+5vtFc6v5lmHWqyOswxkfUc9oU3LIRQH3w6/wUNmT0ZyFtoFp9LQVjSTFe8W/ym
	 6oMlv+7HHNMvwSl2LJ7vJYUI6O9C4Vf4EdBJ2QfW9mZa0kg73bYg97ObdYyM6TQkoe
	 Pgqab0O+vXEoA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260831094506.57467-1-rf@opensource.cirrus.com>
References: <20260831094506.57467-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Fix pm_runtime imbalance if suspending
 before first attach
Message-Id: <178818236777.141190.622965646011500936.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:19:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1170; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yWfNKdz7HAVroXMHN7/2NOMoTKz5E9piBvjTaavTBd4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlrYKE7MlZTUpnCzFFRWnw9bTnHjWC6DwlJ3aF
 vzY47VH6fqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapa2CgAKCRAk1otyXVSH
 0PCyB/4wKYS5aCIbrvaf7GIglQw1tBVSPsXIT4d7FHCPNgpShdxj/l26Av1O8ctaFDn1/005dT6
 rQyNyvyfzi0BrnblBDW1ik3OhLn2O7b/Saz2h52awHxDDpYEGM9z+vGZ4y57+72EcnNtFXT+8nY
 yzKS/BP8UlY+M6E0cmnZfmH608L6jbpskhJs8UftIuWxKpm4wb7y/WyietUiGtG/mpy0QyIBiqP
 GI/Bl8WBAJ8G0/BmyLCTQCAFeRfmNwPiIiC7BQ7Dy6L13ZE64luml3qxJ7BCHOQaRq3qLCjTzTa
 plsk7x1oGhFauUal7yrHsSDZc4Ii++gwtZ6zt6nTNiKUuf5x
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 31 Aug 2026 10:45:06 +0100, Richard Fitzgerald wrote:
> ASoC: cs35l56: Fix pm_runtime imbalance if suspending before first attach

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: cs35l56: Fix pm_runtime imbalance if suspending before first attach
      https://git.kernel.org/broonie/sound/c/fbf2c660bac8

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

