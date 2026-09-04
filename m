Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96E23CA49D;
	Fri,  4 Sep 2026 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558766; cv=none; b=MpX5bcKgFKlXLi9/yZEEtX7Y54pAgtuIOa9MYaGFuF7nc6+2RVzmmaIX6F6p20X0Gr0Wxgr8WFikYL1RIsTi486S6frDPpm7eUplJFRbInSGACDldsDccuYP5ofywU6Iw1YmT7NhKu+9UMxogSiLKnW/Pn5EQwFH8ipxmb16QVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558766; c=relaxed/simple;
	bh=5zeTOvmIk0EI53GwfSNAdWIbJbhGjhQh5FLDW3pYkrI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T4/rtxxbWWaOZwvmS6+uwmOzz79wJcwAjp1+FzqHBBJ7pHpQBGL8oU0c101s+vR4ADYYKQGYpjYvomsXdCUdlRVLCnz5BRY9d62gmPmy/2JYT5tQ4TaIjWwkWx1+S9l2O0JI93Ll69KS49FGgvMU+Y/qwXO5ZyCNyUM6qyAkmgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YHbbnuMB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YHbbnuMB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE021F00A3D;
	Fri,  4 Sep 2026 21:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788558764;
	bh=wPY8AjcwBIxKJxhGlHKtBEs36+4wOdwZd7Oot9fKccs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YHbbnuMBbHv6K4zfyuOcbuHYJfsd7sB8aMDaFCUiRdZvx3qirDp/jP5qM7W/ddKsT
	 9x3h5EKziKbvnXpSqYid8B6WySXb6B+36Uv1QFHWli0a6AmDVQXqTDQAKap79WSdx+
	 3hblNzkabF4ZM/Xw7UQnowrl6yzYcwnGSgCRq2Nb7/vRZJsQhoJXKUE890F4/Bc/vp
	 X5Un2D2JMIf3QGUifiTfzoJG1UMpzKQWHpPJNY7Y6O7kxV2lmW9/NepnPU7AydjvUO
	 MVLss07xdytmZH6jVIDilsTu7TrUM5L2mh5pBlAsIv+OluAAT2zfRtHKU50wBsYlqA
	 NcijdZPU/4L+w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
Subject: Re: (subset) [PATCH 0/4] Add supply names for PM6350 RPMh
 regulators on Fairphone 4
Message-Id: <178854754328.632048.5938751539078194557.b4-ty@b4>
Date: Fri, 04 Sep 2026 19:45:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5zeTOvmIk0EI53GwfSNAdWIbJbhGjhQh5FLDW3pYkrI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmz2nk5ZznzOT0g8qtY6HTE4WGIXfwZY3lC/Hh
 saH91KaDSuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaps9pwAKCRAk1otyXVSH
 0B7kCACBxVzvCOSI1Q1v2dSf0fOL8XeXaEMBHp9EM+0ooF/+DRKgMwnKpNpPWL+bYdxkijPFxy0
 3B9nZOT4osX2S+BXMbP6TMUfIEVbqfatiWkpfNyvmBjr9PaZvFU+T+fA/ywAXd0mx/hkWXpOWIS
 SE+E5XXgbCAeP8Oqp72Q91fvSddptFdGkB6p3eU6JqFTUR0M9yb5mXKrqiYlQRCB1TqOyvcLp3y
 yGqMwc0PMIKFdnRpEbHxY5BcjGAdv6UY969G+RBrH5Te/MqARQY/GmebrnWSWxvyQ5eWIVEtA6U
 Ou79GFbsT7d+T7xGRf2fcxlYxf5zcD/PC6Hmq4YddgryvsaD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 01 Sep 2026 10:58:55 +0200, Luca Weiss wrote:
> Add supply names for PM6350 RPMh regulators on Fairphone 4
> 
> During bringup no parent supply names were added to the RPMh regulator
> driver. Add them now.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/4] regulator: dt-bindings: qcom,rpmh: Add supply names for PM6350
      https://git.kernel.org/broonie/regulator/c/f0944054a0e0
[2/4] regulator: qcom-rpmh: Add supply names for PM6350
      https://git.kernel.org/broonie/regulator/c/05e0f510e299
[3/4] regulator: qcom-rpmh: Add missing regulators in PM6350
      https://git.kernel.org/broonie/regulator/c/fd744eb396a3

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

