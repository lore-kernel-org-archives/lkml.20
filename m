Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747865;
	b=Jv8pFpuimHj3e1lsy+0ZgyI4K6TpnntA88TzQAhJCQ8WBhSY2uvtCuNQhSLQe+O/ppDk
	 Zl6CYTBr64SPBWpITxumKiqxbk6bJE3yvmpNMKF8r/zKmzHqjN78fbviMpux9Dw+92spE
	 XZ6RjSnaj+3s0mX5xorVCX1u2Ce7yD/xDq+ny5XJ4SgDMGEshbfa/obPk9kk1Sc2NNo7R
	 sQ5zQPDtPsC1B6rysvzXoSSkujp4G2gip+7/eY9i7mt75Yh6W3bpIqU3Oqxd//+l5sI6q
	 4DlGr9v+4CY/T1JxUa0W0KJG0MJKC+CAEY4UMPXyu0FiS4XXSMhCGabroagWMkb9iIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747865;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cTRxgqB3j0rUHFGARJLABy1S/kakTChhAy0kJQKCjqg=;
	b=L/embmxKKeJKJpSBk7XjhNqZL7btwTpqsSWzvFSjNcekAmrRgdVStVGbf3itWDU4hf5D
	 XNjDcGpYyJ6OXvkI1xV8ki3bWxpNheJRdOKQlRjAY/UNSD4CAwJ0SgB9FQIT5rVMicFr0
	 0go+q5gv8Y+i1Re2NOYGe0HC8hKSSiGq+WOrHTtf91q+TgGNrzIKLGLjzBtZIqsJtneTU
	 v8pUFuFgnbZwzrwAEU9G5X2iIm0XR4q4Y/YKBTbSoHiDZ8It0FpVnP0O8XAhwmGe4znw2
	 EydqFdp3jgdhbg75CSXh7DUlA+3CIgBmycmj3Hado8YaOl0eSUTxyUHFOsIqh1JKp2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVgbubw7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E596D606A31B;
	Tue,  3 Nov 2026 23:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVgbubw7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA491F000C1;
	Tue,  3 Nov 2026 23:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793747864;
	bh=cTRxgqB3j0rUHFGARJLABy1S/kakTChhAy0kJQKCjqg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AVgbubw7svOXEVBxux+Dhz+y37Ms4+FQgqiM8ABE6Pm5Sa/ecZNGFphoQEqUKsqY6
	 +O1BZp6pBFxwblWR4AqqKdot7SN8PGa1p33SwK09KleQMJccK4ayq+OUODesnJ0Frg
	 Ab2lEBWVAX3hpWoWbfAVnG5g/U81yzce74MsvPosYZixJv51G6sO2vu4e1nKV0mlBS
	 SJx3y3n4ztDkEfblZbC0/GPhNGJa3eNv+K1H2YrZ554FcvdT6HncAeMI7WDc5TWXId
	 WdoeYRxOU0YDt+R3WHzxC8UZewnnzVqRH3iAkgaxhiQIhNTbffFlM/Yl1xGpYZpQ4R
	 UgWS2K/6qkt2w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 726EB25BE13B;
	Tue, 03 Nov 2026 23:17:42 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com, 
 alsa-devel@alsa-project.org, shenghao-ding@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, k-yi@ti.com, 
 henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com, pin-hao.huang@hp.com, 
 Syed.SabaKareem@amd.com
In-Reply-To: <20261103131755.1558-1-baojun.xu@ti.com>
References: <20261103131755.1558-1-baojun.xu@ti.com>
Subject: Re: [PATCH v2] ASoC: amd: acp: Add support for more projects on
 ACP7.0
Message-Id: <179372713592.2270148.14622565162095930987.b4-ty@b4>
Date: Tue, 03 Nov 2026 17:32:15 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CDX6Fuc9P7pYJEpQIcjCPJIH9WOKQPKlv7/smLOIYbM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeZU+z05N8LL6QeZmBnIzLLOsbQfeitT5feWbS7OTEw
 XFA7IZKRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACayl5mR4fpMt9jWtv4kcZmJ
 yzLUtm3OsLZlfeyQuzDHq2fy2b++powMDWGGVybU/Ln4fW2hgcH7nHMfjm9efuDtrXi5J5NFHD+
 fYwUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 03 Nov 2026 21:17:55 +0800, Baojun Xu wrote:
> ASoC: amd: acp: Add support for more projects on ACP7.0

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: amd: acp: Add support for more projects on ACP7.0
      https://git.kernel.org/broonie/sound/c/a08578200344

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

