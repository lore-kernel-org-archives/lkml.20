Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A5F28CF4A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346676; cv=none; b=FMsBYzVY5lK0KLcJ/vQ4d1LBW8/aXywDxP9gTnWaGyYSivznXhTFEQS2otn/1yp/vLGENA7QPb4wKdIsYXGv8lJjyDqyKYb4Rfcj6/asmhZGZhtdLSHgEqCWqyxMG37kYsYjd+V1QdmxODHQQs+478yheomwqSPRNo82rEKNqyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346676; c=relaxed/simple;
	bh=3kVKj2W9nbBQa0jpyyn55rDKRsOkknfjoFAkPleTJfs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h6iGZ7moCUVTjsdeWs9IK9L/qveC1vadezswO2RZc7KDdSEMYhSfhY8AL798TSVRvfD3wY3LUXd2OGCARRtgayBoaC2oHAgu3z7AHn3aVRfVl5aRHqRRjeC/oO+s1EWk+mFQpw4xl/3Z9pQ4v1Cl6i14efegRabwGnGuj4Ixa88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKKLD5oY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKKLD5oY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA70D1F000E9;
	Wed,  2 Sep 2026 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788346674;
	bh=8SDeXPzme9XNtVAmGgZ6IOyZxuKvpCr7/TsRoDa5Fq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LKKLD5oYSvbA9VSyoxqTQYiBrt3kKOxSS/lqEm7GrXe0gmEdkF8aiqLzHORHlH0qH
	 0LhiQx6LImtcoN9t1HBfnig9aIUaUypMomgwALhlCZ6Fyf7PB+W1Hx+Q4+jU9TT+GW
	 px7YBZ3zVApBpaAQdyLu6cRQZuQrUDyOTqZFHQ5UmnqBhk01Yav2fcyjQrnPFSf6oP
	 5c4fpogwn5EsHscDT4gXbFT5P4lPnLciJScmlVPZGt3TQrza5F9ecltYLp2Jq7piJX
	 dJ5E7kY5+V+QAyWLuyG7+5iONb6yO2ChA+yzUvgpJjRApsVTkFsUOGvS5HTxh9Qt3k
	 pdZgdKSgolXUQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: Farhad Alemi <farhad.alemi@berkeley.edu>, 
 Thomas Gleixner <tglx@kernel.org>
In-Reply-To: <20260901-regmap-irq-deallocate-domain-v1-1-4bfed4aff559@kernel.org>
References: <20260901-regmap-irq-deallocate-domain-v1-1-4bfed4aff559@kernel.org>
Subject: Re: [PATCH] regmap: irq: Free the irqdomain we create
Message-Id: <178830297893.33904.41103574820669431.b4-ty@b4>
Date: Tue, 01 Sep 2026 23:49:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3kVKj2W9nbBQa0jpyyn55rDKRsOkknfjoFAkPleTJfs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmAEvqRd3LhwoH9GKNGqhniBBC4TiCndzdpag4
 mzNFaFhVLGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapgBLwAKCRAk1otyXVSH
 0FUbB/4mPLEC3cj/Cpb2Uuu980o0xJzAknI7FkAPtr861ow3zc5QIPO4Soi4WWxMcpYNtulpRSg
 SItQ1jbDe+rZufdYyToxfP1HE5N1ZcBuxQKctsT44hxHVpHy69vpg3zrmyJwSUQtYR5dTtrwf8/
 tIt2MsHSiARmJt04Rrx4ZnZ15a1kjuOH83cjepssVDS3BpNZeljUifM+JJKfiD3BBPCXCZIkyuU
 52Fr4I8GcPE1oJ3QrFx7y+xNLkiWCTqYNXZzGpK6cbd/hC6IqhHOEHHRfOWhUla2YtVO4z9k+H6
 Cb5+xPOvrfyQKlg4eH13k8Q3WtEM70n17lvAecAJZy3IXeQo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 22:55:42 +0100, Mark Brown wrote:
> regmap: irq: Free the irqdomain we create

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.3

Thanks!

[1/1] regmap: irq: Free the irqdomain we create
      https://git.kernel.org/broonie/regmap/c/2e42cade8ff1

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

