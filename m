Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A39415F27;
	Mon, 12 Oct 2026 21:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840341; cv=none; b=ERzWzDLhB8eLsM3dcpk2xRgsEzX2cgisVHLEVCIdHG5yKxzvJljg6jGnYszJzxXes9hRHhSDKSMpHHF53uE65GzAxT8PajQVSxCJsh+W1jmguQveYn1g1Tuk4tmvuGJQIs9KVPnnxP84cISkWUxaW9FxBrWmUcB8Q056k+EzWx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840341; c=relaxed/simple;
	bh=HQLFKtO1DEOPAkbPa7+/i9Zyu0EXRzoWl+rb8pafhUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E10MP8sRaK3m4N7F5iQvdCRP3THODhqH7uRt0AyNacU/QEZ1kpKwVOPQO2IZ4FJ1QtzgkpWIy5poFK+003wM0B8v7DCGWmx19bBp1yv/XVW/EiFQ8GGb+TyeW1920ZteylDnEtvwKD/rH59izHRFnKSfmcKSGMoyQBm/+p0fY3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xp+Hptdj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xp+Hptdj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE071F0089B;
	Mon, 12 Oct 2026 21:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791840337;
	bh=Omx5vjLmVLV/2z971Vu2kIGK/Sz2PenYZbC4VAZwPiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xp+HptdjRppPQWnhUcEg1Mm5e/aFv1pbPWsr6fQNErFcPE0Dl40ZvLrLSIemi/2Eu
	 LBsRzDsY35aD3JgAcCh2Oq3hV+iNONTmFhDGUhl0dr/BQmGsKHu67Zyeh90BDyqeyc
	 3w07krwfoXR/Y+R/jXaiCThoQjqCBiKx1FTYG03gBe2LhRIANy6+JrMu8cWAaghjQh
	 gjf6jY7O5IlRgDPxgcYHdhBOh08PeFd5n8xuFWppxAsZbKNLlK+DG7hU3hIXKPJsdh
	 +UtJGt7SIh2cGOm0PemkUe43H3EVP4gZ1ztEpGWR9iZ7zFhiAvxn3FZh1UjnOXSACS
	 T/eZKAAGE7paA==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, 
 Avi Weiss <thnkslprpt@gmail.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011035459.2289403-1-thnkslprpt@gmail.com>
References: <20261011035459.2289403-1-thnkslprpt@gmail.com>
Subject: Re: [PATCH] ASoC: stm32: spdifrx: fix synchronization state check
Message-Id: <179182939460.390394.3163207660378747742.b4-ty@b4>
Date: Mon, 12 Oct 2026 19:23:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HQLFKtO1DEOPAkbPa7+/i9Zyu0EXRzoWl+rb8pafhUM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOBvh+FPUpy2m3+frV0Dda8uyRKs/PH/c5HPDPjpsg6
 l3IufVmRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbitYiRYW3rjJbm+aW3mHY9
 qi7Sq5d+9Pu59penl5JnHaldv6vtUBLD/2J/2Rs3466XXNuzaMP0lqZIzYWX+ANnh3Uz/9N8dMb
 oCgsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 11 Oct 2026 06:54:59 +0300, Avi Weiss wrote:
> ASoC: stm32: spdifrx: fix synchronization state check

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: stm32: spdifrx: fix synchronization state check
      https://git.kernel.org/broonie/misc/c/0936bbd35a24

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

