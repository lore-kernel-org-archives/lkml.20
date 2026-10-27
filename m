Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186893;
	b=dSuTQAy22/7KUqQc9y8iVWEHTnS+5pfg3aN+5rr6sgESUTtXpJrVcsGb8g8Vi+nyzY5F
	 Kqq42TscwPw8JjSa2E6utqKS5noRCyxuSHf+9KEtIsH653Fhp5/7ZwInTjjGDbhzidxlk
	 AmrqzmHGimteaF9TU/hd+k/2TKvcV97BBstvQ3Vk65tMq4zInRE43AErN9AmMBVob0Czf
	 iifZmDhNteOtVRJ21+o+HF1+fQRFn8tSNjLV0+UhNggQdV1ft6dWVwPGQ84onDWY3ZVFz
	 rBpaiaaxkPnuGM6JnzZI2+7ebjzPj0QGexGwso7pAvR4Gj7tT/8vkBSKiowGLzz9Xfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186893;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=chaccbuoNIVj/yj4cT6pJMwWzV9YsiHfMf7FzYe722w=;
	b=nU+O/j4AaPqj2KhiYw4R0JfjM9BOMtUkd/7jP4Kvv3JEJjgmLO4zYTvgBzps2BkQHqzR
	 U2Hr233tvQ4j2y51CZlKflrpsROFuR6OKlFtY3QgCtEEvdaGpK8kHu2ltph0HSe+4P8Oe
	 agneN8rR6xTB4Rj+W9c3nmsfJnINYrz6MmeVOuRjlDbIdTWsThUXShI/tOwgr/dIFHBOW
	 mtQ7q11u70o73oDhs2S602WOAz77/+qOI5SIFNb/wvw47Wfrq1wWl0yKqLQNxffCUmRzn
	 Uv7fEnpIipq8/1TpzeAA72kbSqzakf8b8S5RTAqv7GI5U/wB4z2+DMVGi2tvZeKrAdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lp895fO9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AE8606A33A;
	Wed, 28 Oct 2026 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lp895fO9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3661F031E3;
	Wed, 28 Oct 2026 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793186892;
	bh=chaccbuoNIVj/yj4cT6pJMwWzV9YsiHfMf7FzYe722w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Lp895fO9jfP9/+6XbIeFPKG+H1eewRwYRcTPF9JWYWo9MT1BAQbFrX96MgciAwbjD
	 xiaFEcBnyATiBBAyv3wth7zZpRwczffAPixUDi9lju7rDCd9OsvUeMRKQkFrtlzw6m
	 IHwkkxA7KKWEpNolstUfFkqTuMCpot+3WwfVKjAKfwvT+8CZV0c/LRNl3VBb263gCN
	 C1dTXJNHRacQ6JSmt/j4gVG46O9T6BvVfauBmMK+33gEdp26Z4PDfH8tsXMb78KY+3
	 Hf6+gIBUH3n9wbxTwDzYX94EPtWfL6IIdQ52TdBvIu1BI2Vm0xSTW+1r1dWUapYJfG
	 pFDWDtzYP/u6w==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 6AA8E1FF23EE;
	Wed, 28 Oct 2026 11:28:10 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 flove@realtek.com, shumingf@realtek.com, derek.fang@realtek.com, 
 egor@crazyrussian.pro, jack.yu@realtek.com
In-Reply-To: <20261027-rt721fix-v1-1-42cd4b1711d2@realtek.com>
References: <20261027-rt721fix-v1-1-42cd4b1711d2@realtek.com>
Subject: Re: [PATCH] ASoC: rt721: Remove invalid register defaults
Message-Id: <179310496701.199157.11894614484998989723.b4-ty@b4>
Date: Tue, 27 Oct 2026 12:42:47 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/VtwXRKFDc1Z8vDuTuoXQPg5LVtRr6pQqthFwTvQSUk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIe3vHSu/84807BrrXngKT67KcLQsvzL9UGRGRWmTp57
 7nb+LejlIVBjItBVkyRJS6L+2V9yes1fAcXtsHMYWUCGcLAxSkAExESZvgf5NFVcX7uzeNKCtt5
 697bvPhUvpnJckfK26+dD3ziUu9/YmSYpXjY59C2fTzWvyX3fTjX8JyDV5rjWe6hYNH3b0q1NCR
 5AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 27 Oct 2026 14:02:47 +0800, Oder Chiou wrote:
> ASoC: rt721: Remove invalid register defaults

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: rt721: Remove invalid register defaults
      https://git.kernel.org/broonie/sound/c/e32773a86100

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

