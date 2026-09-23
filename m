Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC77E41DEEC;
	Wed, 23 Sep 2026 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185742; cv=none; b=tcbJtUw6BXcqUPNEySWC8CCcXz7x3vqa3pma6I/Aso6BcVCk+Vqzq7akH0GIADNxuSgG6QGDVTDRwbSyZD9RZBky1+ktgQc6e7/7wJpXZYUgi79dVP1ij3nJYP09EFWsDooFnv1ZtQ4GD9fI0JmpHXyIcq44KjronAF/iMj/2DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185742; c=relaxed/simple;
	bh=tSCbXhwl4VF0SWxnMnzR581dMjQ6o4o9AB8+Ikgrm6s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iNHxmEoxKa6OjdreQ61o5Y3L+W6D1WLbsgeDJaaG+jxbEcGaUxLokQfQm+KjfH9r07etWfAShFs5Ri7SRIw8gCnSwrJ5RDR1V4HwnNiUGPZRI3vuZ+IeZx7EVU+Je+ci+Ggoz4VpBiO2AlNCpAxt8NYHS4aAwhaiWGEOxhPkXPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRSSQCjc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRSSQCjc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555711F000FF;
	Wed, 23 Sep 2026 17:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790185741;
	bh=N7ztw2cuF8oGka3HMYMMtFKCti3Pqq2Z3BAuO0pODYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cRSSQCjc+jHHhG7/iDEePs9C+n7lEq7xF5/Twv+s0bU5Xg47OSbszUI46rlvm3U+i
	 iu9TXJAElClDcT4fqCmx5/oTgr8e81DjRAU/124F2WAdgsw42cmyykaGiAkfEmn9V0
	 z9Ee+0/Sw9Mw0U1GirAlgRIYhK8CET+t7yNEYCos1YqZcCw9EOdDvmjlpy6KoeL9gR
	 PaTG1TeKYXOw5iegtJ1naUzryKAGTHysmdb+zleD/H8VC6Y02qkdPpfFFKQCVoHNJd
	 7h/xGQHfjhoL2apTmJUm6W1QMEsUIvQmvG0+W/jL7Pn90MxC7wfYPGAOehW997ayyx
	 C2TgLA+8gPXSQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922212140.1118832-1-robh@kernel.org>
References: <20260922212140.1118832-1-robh@kernel.org>
Subject: Re: [PATCH] regulator: dt-bindings: Add MAX20024 sd4
Message-Id: <179016471553.322763.2206433472163704923.b4-ty@b4>
Date: Wed, 23 Sep 2026 13:58:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tSCbXhwl4VF0SWxnMnzR581dMjQ6o4o9AB8+Ikgrm6s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtBEHj8Im+hkqjYq9VAqsykmK5H8tanE4LZF8P
 4WMGCNTLZ+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarQRBwAKCRAk1otyXVSH
 0E0IB/9Rrv3BCGZC5vKDBi1XggAPk7CX2x6tW2gIksr2H4EyhPDjXB3gyLbUeRm0mnFmJeqVsW0
 0eKAEnjNhF9neAOnOLCRjmtI3Ih71k5Q761y/Wt5s071DDF/XFhXvdV+gjsYhNyg2Kmpv0a6T8A
 lpu0IZ1lnWh3LELOoflSl2/yM53i3k5Lcg1D7SORcQ4t/D5MXFZTC9HuQN//OtKt2tKrXchXOFu
 YKZAkfdh9iSDHj1s9ujdVa5olV1R0DiNe9BKqlrpYBp1LmpheFwv5NntaRMPEbsGI6v8UCyNjbc
 YMEUmKk2TmhQ4z5QoksHl3xu37NkdJJ5hBDwb127ikdelpYu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 22 Sep 2026 16:21:39 -0500, Rob Herring (Arm) wrote:
> regulator: dt-bindings: Add MAX20024 sd4

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: dt-bindings: Add MAX20024 sd4
      https://git.kernel.org/broonie/regulator/c/3944065c67f5

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

