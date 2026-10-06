Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A8470122;
	Wed,  7 Oct 2026 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368615; cv=none; b=CGSrDDMrCkyqSbpVgesiCC2hMCUpFEFFPd0NFQeBiFbsMgTTHUZY/jWeWbxkpTmcMBdK51gV8afWzw/D0VlskIyBMAnLEy0IFcJJnGeBVBK3vEiAzuCrBnJYHlVm2Z1PY/sm3pnjQ+tkfjW3ZzwnWUKHdiEuc1QCMCgb4AfHiHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368615; c=relaxed/simple;
	bh=2I1/mbNkyaV9hyx0Sxgrd0aRGL55BKzdhyk1GHnQmOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q3okLslo1yuuS1C0SlhcZit8igqFMhE076R6zXv4tTI/09UXyQUqCPKletrjWNrbF7zBfyVMqCzMtOGV5eH4JfHJ5eLWXxVfZaX7OXgkxFRWN0bGO9aligZMClNJFaLyHwZhbAuhqlA+ND+LjAL+9kXsFcm8uxlJBnXAQsMT03A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAd54lat; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAd54lat"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164CE1F0089B;
	Wed,  7 Oct 2026 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368604;
	bh=TmnOgKv4wozxYFqHSrYCxUxMk6Awr2HV8lb/D7yPgLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HAd54latAnhuDBmGk9HBMKKgmWgI/fX7dLH4KNhdvRrLFTuVuf1MIPNeyk8Rs39jE
	 GQ5enRpdArLs000Z5zAadPFYY3dQhm0rvKuYnEUKKdxS7gbQBjmMw8s+UtByhKYM5t
	 kSNc/VN1mr2pIfeXgj8tPV3WVRY+yIgVqwtxOQJ79mPhMJOmCN0OBRdBPXIl95wS2a
	 O53Q5jfA0iB7QUCe2dPPwQuIt0o2uWpuslR1QVmqE3MXOutUVVyhBM078A7wa60H8o
	 rx4oCmbTCzexZxaFdVoKH33aJXQRO56s3OvOlThDL0et8THkNnSQvOZ2n5HNKMM9We
	 LnsYVgghwPBFw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Milo Kim <milo.kim@ti.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com
In-Reply-To: <20260822-ti-lp872x-v1-1-0ae11357eafc@gmail.com>
References: <20260822-ti-lp872x-v1-1-0ae11357eafc@gmail.com>
Subject: Re: [PATCH] regulator: dt-bindings: ti,lp872x: Convert to DT
 schema
Message-Id: <179130054155.150114.2054665704299140965.b4-ty@b4>
Date: Tue, 06 Oct 2026 17:29:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2I1/mbNkyaV9hyx0Sxgrd0aRGL55BKzdhyk1GHnQmOc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxh2WT0DgLDlOI9aTnT+mUwsfTZMlVva4OztI9
 HIZ4wmJ8wiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasYdlgAKCRAk1otyXVSH
 0DdkB/0UybCNYijA+o08nW3AlgcBp2fy7emHck8GBGwpv3ar7wXknxmnbaSbhbYT+lk9g617A7Q
 d4gO0IIrqOj4Xx+tyaBs7vgXFJ4VmIAwFfSQlaDGjJnQIxLMoLZUXkCEajWSXsAcJ4I3taqGLt1
 UlTQ0L0Vn5HArxTKBr66ee8tadavj9EMvo58IgJ0EPS5DWEhgzXqwwsBd/kexBvg4Rl4i6SGGrU
 VPNVjlnL6Q6mgY65yAA21DUYSHfvTbiEd3eRUT6u+Tq6vOgUCAsKXMJnnUYmdLr+QmcVqnSmnWB
 GJKmXVKaz2/qArJyMI87b4TRs7Ycn6ny+Pa47m1ZoZ+tqi6h
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 22 Aug 2026 21:37:24 +0530, Bhargav Joshi wrote:
> regulator: dt-bindings: ti,lp872x: Convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: dt-bindings: ti,lp872x: Convert to DT schema
      https://git.kernel.org/broonie/regulator/c/d344f1af5c7c

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

