Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFEF368291;
	Tue,  1 Sep 2026 18:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286760; cv=none; b=t4mPMFTgR6iA0w+iBVzl5fphcYZXOVbpJrhW07Xm9ioJ4n9Voaw+0dbfbYbqCukoXH1COjWOD0qHbtUH4bWf/HcGs8eaAMxbNcWA9Xhzuvu5QZNCRabYXoo/tz3RAoVrLci9gnW50kjYbR2SP8MU8WlPCd4fZSdXjwezJ7DzRZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286760; c=relaxed/simple;
	bh=uSY59J9XqC32SHJcQ/CLHAGTtMIhMACTIWP7Zs9//l0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L/HEfLq2DNOGXqOnEdnBEhv/Yv3iLVXGcFVXIdX53Qsgcg1nUtOPTpapdX2uQKcp83soO+AAyBM94omVAecv5y7/Dycl4Upy3AJSDHfVbB/XpsuJFjNkHK6VcWZqHNVhFeIt6e6rcOZODeWZbr7Yt6kEbJ4hawYLQ/HQJM21Qq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NB+d6PUj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NB+d6PUj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE1F1F000E9;
	Tue,  1 Sep 2026 18:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788286759;
	bh=Zk2XlnxUEDpzK+TW/lBde7Hv4God9MNhlah+ZbRNPPI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NB+d6PUjXroT2O4rq1NsKy/WnWNdlETPm3+6+6Dhx7nGg3+xhr5W6pqc/Ta01TBfg
	 5jTAG/HvtaiE/Nr9WMC3a//f2NlDy8roYAle+Mh3Mbvkh0tP/6xHyH6oRzQrvighSK
	 Cd0FM+Lwv661BPWxBBnxg9mQTulPEgeGCWUqaeuVUocDZGi+YWQfz47Wy3Ny6KX6Xp
	 HOJFK3IrZZ2hXFtsgaIsvV/7z6QCm0ZsHm+jM+c/yOReJFUXf5p+uiSJJcFzA6t2Tv
	 pR23rdLYSCrPfMXHiKIQNEV4Atsez1eZf1KbW4lbSFk+WllVMgr1YE5lbxkrqa8Nz0
	 y7O7eF6yOGswg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 =?utf-8?q?=C8=98tefan_Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Cc: Chancel Liu <chancel.liu@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260830205106.11267-1-stefanghetu9@gmail.com>
References: <20260830205106.11267-1-stefanghetu9@gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_micfil: balance mclk enable/disable
Message-Id: <178826699502.33904.1590861277346269268.b4-ty@b4>
Date: Tue, 01 Sep 2026 13:49:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uSY59J9XqC32SHJcQ/CLHAGTtMIhMACTIWP7Zs9//l0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlxcijPDzxgYyIBQ1NhVfyOSU7iVYdFZaZ6S5j
 MkxiHNcXsKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcXIgAKCRAk1otyXVSH
 0LfmB/sElU7Xxe0MtGpoINOgg+3hv1pemh25YoTNh99fHsMM7obEyKoOAXLsXp/RTpJvFdQFIKo
 BAfFkJ1ZvvT9Iibia0vKKfwGT0yebsK8ame85SY8q2gQPKwVwkUyPi92d8qcrdPbTTeEkd+IcNY
 sJ2hZdBHzJHnmKxJ0cmlFMAjxGCMBtIudtNrWc1nuCwZk5Or0AFU6ajvMOsmGYJfRU8z9lNNMs9
 zhLQV88Od0z3ObN1F0WbC0ThmyvxbwFDJ93MyKxNU2PmNxeXbBDPnlv6gbOD7LEXJ+DYYY4KHPo
 ydV3hhMXUhLur7bxH4FN0XTaJOXWhcDkPCEpEd5kaRzoj/Qt
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 30 Aug 2026 23:51:06 +0300, Ștefan Ghețu wrote:
> ASoC: fsl_micfil: balance mclk enable/disable

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: fsl_micfil: balance mclk enable/disable
      https://git.kernel.org/broonie/sound/c/d3dbccfe6afa

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

