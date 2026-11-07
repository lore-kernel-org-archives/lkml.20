Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133524;
	b=QiiBuGp75TGtZJ0Lg789tpIExfqvQV5VAo2f6PlUuVq/cBRfXqo+O+ZUAC4P1PuzVzpm
	 AtxFnDHyUkUO/83LcuJkmVGXz1UsstZ/D2Jln7OIujSek6wC8BaASu8cT86oZs3H19Bsv
	 pw6LwGjWDuHC6kMWNdMFDY0NoT7EGg05DQ33ZF4UoOtdZsaOHwtuq5MA4gLPBOsBHf2qV
	 8ixVyPS6QXTC0mHJ918F4XTFSXqzhm5VpoaFJMRE6yJGYWfOXbs+TswxkFUGvTpi1HZFV
	 rjrChRSxCOuMYSO69AxP/vU9qHTXgEKluS0NuSCd8zY5WmA9hmv7XRejrSSDNHjpXtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133524;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=hfhNnalS9GFYuSHidbjYftuezJdAnfZU/VmvCK8JZAI=;
	b=aZ/rrG+ZiTxwBWLKPK5RAjM/ihabvMiGIBXBf7VIJyUwYc5p+PzXnEWY0Gq+s8lPVbP3
	 zXZogFC3hxTKR2wBFlQ8kB5He3a4T9OuTM31VDdVeMr+CKhR96wAnMkYmc62ok6oI/yYG
	 tgM0LKYXZqU9IFl0kF/BuZy5KGbNSNLHSp+N9CsmvRt+5VqLhkD7RzYAqmv8KG6AQ1lbj
	 UU192xD7ppXG86vD34jEY3ZpJyILLovygeuBVgiQyRlqeBEQHWaSXhcBWnJ+FwWVAEtzu
	 KTg5pACJL+Tjf5vrHTJ2L7eL+HENkcu8AgUHYf9uJj0Jib32Hh3qQup7WUHVGqrkB2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIbYNzdw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11018606A31C;
	Sun,  8 Nov 2026 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DIbYNzdw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF5D1F0089F;
	Sun,  8 Nov 2026 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794133523;
	bh=hfhNnalS9GFYuSHidbjYftuezJdAnfZU/VmvCK8JZAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DIbYNzdw/xd20UIweNIOFw4xuGa0z2Opsb1tiTzcrFvEpr8X4P6M+OMzhgQhN26Fq
	 XkdIied3b+4zN02FPcioxorPn8rzicJfivVx9Y/dJJOBEy2bo+HCGAfroJ3EvbhwMO
	 kIyd2PHJrrSpXo5k9dSDg5sHIqsLZVsfTrCmNbglCZY1PJv1xFsKJfNWLQHlhOiuFk
	 IEqYmIgu05TTyc+nR2f9aQyzMkdRSiIhqH7MmEewuR47hBZTUJKxtzovPRz8QWnvNH
	 8iiC2EUOWvPRrtWezY5+cldEXWhd2Ge8ypYmyFAvSJMymHjGYSfG6DgKatAqXAcO6Y
	 6ytd5FRWISg2w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id A37922BDEFF4;
	Sun, 08 Nov 2026 10:25:21 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Tang Bin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028015732.1985-1-tangbin@cmss.chinamobile.com>
References: <20261028015732.1985-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH v2] ASoC: qdsp6: q6routing: Fix memory leak on probe
 failure
Message-Id: <179406053601.3424803.7992285493416201804.b4-ty@b4>
Date: Sat, 07 Nov 2026 14:08:56 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lAhKU4TgygOB5Lb3CWrRkNBcESMfQk/0i9gbpYwWWIE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI++PGdd2FpeskYvX/1Ucdbn/h9dsWudDE6vDnVQm1Jr
 dFXwbg1HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIsmhGhl1B/9X/LvA//k8+
 R6w4vkEwUjglpW1u2Mkf6TdKF52/Y8zwT91lyrPfs53elR2S61w1T+jGv+Av6rmP750v0/j1mvv
 IYX4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 28 Oct 2026 09:57:31 +0800, Tang Bin wrote:
> ASoC: qdsp6: q6routing: Fix memory leak on probe failure

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: qdsp6: q6routing: Fix memory leak on probe failure
      https://git.kernel.org/broonie/sound/c/861f35761dc8

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

