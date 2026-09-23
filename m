Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087B53D9665;
	Wed, 23 Sep 2026 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185737; cv=none; b=jb4Z/6rT/4YN0tadbFWGt4lAlcvbW8WdOKbA3VtwGGcKYpCZlijGgT5Bh1WcxVWhrg3YsMHzJMUDMeBbutPck0OE6UD76k3I6eyf/ZZjvYXi8L294psQ+GqaY5/c72Cg9oZFTydy+rfTDngZCJT3TJzAgwABs1uLrVBjND/wziE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185737; c=relaxed/simple;
	bh=iwVRD8sJ2MGM7EJ2JGoHvXZX/gUu3eJQo/2uLGmgCe0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y+WLs5ewkC98kAwbzg55fh/46Ub8JGX5cTfgWBmrZjO7z+JNHxb7U8RE52L2Y3M0USrNxUOxeZQ2NK9dbPYr1gTcHnSBG0JBtpLe5bWuPUaUUtBzv9oDeBhRXrCfc3V97RfOX9UfSAxBVQ0IqQIuDMJBIYlOjrolHBvxH0KyL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPG42ilU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPG42ilU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55291F000FF;
	Wed, 23 Sep 2026 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790185735;
	bh=rcRO4L+VJsf1kNU+GVSV8Bhb21/48J9QoBcNO4eleVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YPG42ilUDYeg2iu3fwvtMu7wZWW4UdFH4LBl7bX/29QCylN/eLN0koQ2pBqGTZUf8
	 bYVaX2BPEryzJ6bslqWWHzQfc149R140rtEI+Z9EUqoaZhMNoZogzy3h7N2TEtEE8a
	 Vlkl9tTfuiih76NTcOXeHVWJIzqyava43WC1BnkO9u8mdaT4bBK9QY/qofM+U2GXEs
	 ByBT/xtt2iX1TxwVnq+OnOw+0tlvmSkDNg1sos8cjnt3JBxsplEdpF913ACKEdtOf9
	 oVi4xJqXhlUTOn+jK0WLnDHsEPT9F2BHe0HqhzWHzlcCMKNx8ffZWqfmC4bSi0Wr7e
	 wXsTUVy4hQMJw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260922212122.1116270-1-robh@kernel.org>
References: <20260922212122.1116270-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Fix TAS2563 address constraints
Message-Id: <179015979860.322763.11975467580269233815.b4-ty@b4>
Date: Wed, 23 Sep 2026 12:36:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iwVRD8sJ2MGM7EJ2JGoHvXZX/gUu3eJQo/2uLGmgCe0=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqwtgkxtIQ0GixdzPJvtkOtw90nW2pnGrTsTOqfqv5L0V
 Bd3n8zSyWjMwsDIxSArpsiy9lnGqvRwia3zH81/BTOIlQlkCgMXpwBMJDmR/Z+dwq6YPdoalkrn
 n/nvvSlT/dRZer8OA8/ez0pPlF72nXquuS3Azf/Np16h4DPF1pzssvob1i7e5Cq6qFxR+Vnfn8D
 gOH7+q1YyJ6S+GW2Jn6IusHv9zeq4NzmT7CVTry9Jb+3/ZFleJcQ+T/kUU/Fky/z4xNN7MvzXSv
 4xtV6buOaXuYb8ubU9jq5Kj4x+ap658Dfm1wQ3p1QD/w9SLt4r9r+s0Og+nGtlb9E76UGWzlGLl
 ct4q/pja/Ol7pzhSTbw+GZsWbfKesME508cG3ICXTsD8w+v2LHPmHVZfg3bcWc1qVdHXuR2qzxx
 uhp+VJDHZg2HaNajxEW79y/Vy1C1iZiZHFPwQXCWtJwFAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 22 Sep 2026 16:21:21 -0500, Rob Herring (Arm) wrote:
> ASoC: dt-bindings: Fix TAS2563 address constraints

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dt-bindings: Fix TAS2563 address constraints
      https://git.kernel.org/broonie/sound/c/87dd248876d1

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

