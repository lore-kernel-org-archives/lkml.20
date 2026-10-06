Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0360468C33;
	Wed,  7 Oct 2026 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368556; cv=none; b=nXWwS+U4xEgSRwIZfs2Ay7C1FFu4PIHmGiHwXgbB8Ue713zhB9PYFfbJENHPEPDp161kjDyXCaiRkz022LLyeUVrWeL+Cv4L/ZVvMf2YQ0g1hR1T5SDWYZTwMUKmRUerpmvYuoAXIYZfZFS6IC0o5mUKH7JxrrtlgMLwVhL8Sf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368556; c=relaxed/simple;
	bh=sZcZ2Lkfhju22e9qIS2BXcwU6/Lwoej9bKkDvQzsH3E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qX7PZQsxJrEaAa08Mr6Jm3K7PmMxqpeOgaLPcA/qlXWtp0DBEYrexug8f1f8Vc1/VZSemVHwQ0HvABNTE6W0jXcde6Hrf+6bhGhxOprjr7i1qYS+Ay7W3yorx3q61OJFD9CglKnx6dTsojQLOa6Bn6uiXahudQUd9m1jAJzAev0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1jKUodm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1jKUodm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222E31F0089C;
	Wed,  7 Oct 2026 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368545;
	bh=t9z/0Q7Qn9h9T22cZ3CtXSL0njpjeg4aF7aOM1ALsuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=J1jKUodmBu+VBZwChp40BcpqXOfNmEpR/KWwISyjvKmaAzfZVQurji52/wl+9Hxg1
	 4xfe2auLS1wtDBS3L51V//dAJCz6Pfrb0Zy7f3/3Szg9Pb/k3pOoeQTYFU+KN+qWKQ
	 cXdKsZADZ39BnDT7UbNIIAm0TOfzMVN79nJdjrrLZ/a9rNxVNy81eMdTQ/SooSCLRF
	 S6t4t2zmr3yJPLEnacD4mo0JVMXgl7NNi3cmlWiA46l1VmsP3qfx85tZO+zsPleE/Y
	 8z4VGlCm5o4t3kS7A5a2c6DZkMu2yGag3RjXrjAF6iExHdvB9JflGpdfamb8KFp+OR
	 sH+vkXGVTm17Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Pratyush Meduri <mpratyus@qti.qualcomm.com>, 
 Mohit Sharma <mohit.sharma@oss.qualcomm.com>
In-Reply-To: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] ASoC: qcom: enable audio on stage-2 protected
 DSPs (mDSP)
Message-Id: <179130111502.150114.14627451797945762193.b4-ty@b4>
Date: Tue, 06 Oct 2026 17:38:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sZcZ2Lkfhju22e9qIS2BXcwU6/Lwoej9bKkDvQzsH3E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxh1YljsUnhntksZopCroHihzWh52QisMbc4vO
 /Lj0Q8bkYqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasYdWAAKCRAk1otyXVSH
 0BZFB/9o7BNq9S5R35+7IRmVUUES380ic3VHMQz3KJ3SN0zvkoxqrSt5uDc44VaqRV2fJdhkr75
 K9EsubtobucKxrJ0CEdJVnc18o7t5YdrXry6J5Ht6+mzdUwPJSKr6uXpeBnNfh45EPYnNzo9Gql
 13BfJMFG6bgd4MLNBhtQ1sybh/KkfUlBXdQl5F9Aosujozpe1Bh6ILdRTnq2PeqCFulCyeqQ5wV
 Q1RbAAwPPVxeO4HOxEyNCPHe2mcUKrrWCanM7EyKYrs0Z2CPR9bkZu9ZdKKx21i+VMvuHLJ9Kq6
 OVvfOoExjexjEHSn2B8ewaGHVmRBMKiy2FtyR41Cr32GeWCU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 23 Sep 2026 22:03:37 +0530, Ajay Kumar Nandam wrote:
> ASoC: qcom: enable audio on stage-2 protected DSPs (mDSP)
> 
> On platforms such as Qualcomm Shikra, audio is served by the modem DSP
> (mDSP) rather than the ADSP. The mDSP runs in a stage-2 protected context
> and cannot use the SMMU, so the PCM buffers it consumes must live in
> reserved-memory carveouts that are handed to the consumer VMIDs via a
> hypervisor (SCM) memory assignment. This series adds that access model to
> the q6apm DAI driver and its binding, alongside the existing stage-1/SMMU
> (iommus) path, which is left untouched.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: qcom: q6apm: clear g_apm on driver removal
      https://git.kernel.org/broonie/sound/c/be2172758f2b
[2/4] ASoC: qcom: qdsp6: generalize GPR service domain
      https://git.kernel.org/broonie/sound/c/d3ad9ee48425
[3/4] ASoC: dt-bindings: qcom,q6apm-dai: add memory-region and relax iommus
      https://git.kernel.org/broonie/sound/c/7ff0bdaf9292
[4/4] ASoC: qcom: q6apm-dai: add SCM buffer assignment for mDSP platforms
      https://git.kernel.org/broonie/sound/c/bb8afd437d79

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

