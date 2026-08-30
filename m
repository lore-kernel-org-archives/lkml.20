Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E9133DEF7;
	Tue,  1 Sep 2026 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262170; cv=none; b=mm5A2IXeeiY0FZtKmSES9PGpEK3eCRVk8T9ho+ZebT+VaAtu2ygT/0d1VzloE+OyUFgmnv9jPGuepogYJCF/gou/Q63/Se0plFzl0NEhZOIrksoWRBD/5K7DvCZK0BTcmyAIid8RNVGt6yhDS3V6VQEYNc/UtxmJuIDXPag+jqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262170; c=relaxed/simple;
	bh=OoCnRwKpcqDdhpYmBq7TA7QbGzRYuauJAtOq4pa7TyI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qYhherEeaR3nYhNR0Raj/paP6z05C9CdEXYXSaaA0DomoFf3htAEziKZNsAlzZzlFmpg1XadMD+RelcbR5w46ePw6siRd+UJkwp+qLuGXwrdbjxtWg+IvbuHeMlbwHzjvdOrN6EVmhGOIh+UboN8tkacLlc0dqItUnbXkZoTfNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEmjdDjx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEmjdDjx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BCA1F00A3D;
	Tue,  1 Sep 2026 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788262169;
	bh=oM4yCC2hBuMgZaUBHgTbMj463WzyaycIFuvMYPxInvQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MEmjdDjxS3BP7vVGQLQHhnA7VeKccsypXsFQ/+tYObaYlaYPB6Gui0nByQH5L4tCB
	 7Q1I2GfgefWm6UxJpyyiZpreqjBIXmLcszkwQ/6rjg9mSrzaPFD1NOSRrqv+6Qy5Ox
	 hhsegapscOTpDOKx23fl5Z6vrXONU2IK4Ih1usu6Je/AjmCdDT6ydR9xBsh4i6/SaV
	 6U4lacNQsuFFAmGCNjEZ08z+YhqkAnmyZW+ZGW/5cLqjJrXbdXdPI19JIUXSBzsXD9
	 PbOmIElL9oSkJPqE8UQPo0Mni315myP1sdxiX4FcgHRVDrHLZJ8h9CgGb+OKswiRne
	 GKZ/i4QwFBY3Q==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Fabio Estevam <festevam@nabladev.com>
In-Reply-To: <20260818014059.351152-1-festevam@gmail.com>
References: <20260818014059.351152-1-festevam@gmail.com>
Subject: Re: [PATCH v2 1/2] regulator: pca9450: Use LDO5 low-control enable
 mask
Message-Id: <178812944220.13461.6831841026193121438.b4-ty@b4>
Date: Sun, 30 Aug 2026 23:37:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OoCnRwKpcqDdhpYmBq7TA7QbGzRYuauJAtOq4pa7TyI=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGqWtxSiVr0pRgj2B0eOlaOwKRy7JUXjx8CxX3zLozyp4AM4d
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqlrcUAAoJECTWi3JdVIfQhsoH/Aq5
 Eb+E/bPlY1b1jGxgbD7T1GZR6zpEBgJU5+51/GqimSM+LLKiLaVS+ihkVtp6868k+SgY4hwGG3+
 ikK+MokBkLss7i760rkaYistZkdbCwZXF9IE3LZ6X1GMawk6gPjGVj5i6XOM5LpIefd8gcvT+jp
 aOzElX5v7txocNlpGmQet1Yjx0xtJIdWA3BvFUH+m8X5f4jI1uAtrfnBkhAp1d7jyL4Ov80fP2R
 IQrb0i5t4Ky9X2JEjd6bWjGPk0u5i1l1/WACJgpP+7qO00miocisHzmbJRWdGdyGHp8aX0SauZQ
 hk3mqvGUlG9ujr/Z1wF1DZYWWQ++B5iuA6MJHn4=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 17 Aug 2026 22:40:58 -0300, Fabio Estevam wrote:
> regulator: pca9450: Use LDO5 low-control enable mask

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/2] regulator: pca9450: Use LDO5 low-control enable mask
      https://git.kernel.org/broonie/regulator/c/97350c1541d0
[2/2] regulator: pca9450: Support regulator-off-in-suspend
      https://git.kernel.org/broonie/regulator/c/0c47038219a0

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

