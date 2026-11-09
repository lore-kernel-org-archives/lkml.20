Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234175;
	b=VT4mTbOuskIA75OAdS6c8edymiTuJPkjpVyfn0WrttX8V8PCl5MDaaSZ+LzMDyVur06l
	 N/gLk9R+1jtFs1/BUesz3OHQVh34NYT44+sybmSuomgHPzIVv2r2A6YmsfrRz31wFroy9
	 ncAG5Od3ZrW5mWYE2mVQoKy707pvHv/JKKLU7rFTZFCZEn8O1Dx/2BC6ExD29dTZ9+RIu
	 RRcdDOLfSt4ILZk7rFlEfG+hMZdyUZlqKhflgczLyUupDV2QNYymYoe0seJc8AcB//OOz
	 aiUhamq0UT85CszQVY+mME+UrQtgl/r4tw6ja+4G8/6edjbzUye9k6t45dg6oUFOUzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234175;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=eEbY3NrYal9RWarIUs9d6k0Mc1apNEcXcrU9HAM6OU4=;
	b=MjJDMBw4MPpdc+OYrqwRE24DFhnApLOV/My2RlTIpZNmzHmBZdfyfe+J82uqJFZZxsiE
	 RZ/5noOyzxDwf+cNv1JBUrJ8gXl1kxGoFx7cS2Pv+g2XXq9zUc4MNG6r4CO8YEa2Uu+QS
	 ZbNH4MMaKpqHT1vH9lr4jMr4wqvt1+9Ikb/hW/GI1xHIUxTkP3+osgPffz1GSfAVkBuEf
	 RDOFCGwtVRiczJ9NBJGCOZYrI+L0/aPtCEA64rxQQDTo6eJ7TmujqX7lj9i5FyN4lxeOJ
	 vZRl8bhgJYvc+rGzmZ8hR+n7nJXajexjJvrecqnlN1j0xJbvcAmZ75Xcdox4PmQLiYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ymp93usH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1848A606A334;
	Mon,  9 Nov 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ymp93usH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884A31F0089F;
	Mon,  9 Nov 2026 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234174;
	bh=eEbY3NrYal9RWarIUs9d6k0Mc1apNEcXcrU9HAM6OU4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ymp93usHP/3tcyizmeqQgBsoBVH96Cn7sX+Vez2LgJxlWZRrm3aXeJ23Fkun3j7ZK
	 YOs06ecETQ4tVqu8QsyGGwkxA+DtFrTqjLC3rajaIbuWpJc/B/0jTPYqSIeoDek7b4
	 S2ATaayZg/Fp4oJ3K+BPncncpxqvBDXFRdVyNkPLPqEmGzE0IlzG+ZO/w3f41cVUOF
	 l+aHm14KiWo9E+DhtWtW2GCdHv3yXl7aRqsE0TwIU43RcSsKyFArv8pjIceWcZ5vah
	 HyMi11CFMxarrCvNHJUa9YWJtiTb8nFA9FlEiss2lImRUZO7aUdzZ2BUUWa3pgrsoG
	 D4BEaTSM2Ztlw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 2C9C82E9F6D3;
	Mon, 09 Nov 2026 14:22:51 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 Michael McAllister <me@michaelmcallister.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261021204202.43738-1-me@michaelmcallister.org>
References: <20261021204202.43738-1-me@michaelmcallister.org>
Subject: Re: [PATCH] ASoC: qcom: q6asm: Reset PCM positions when preparing
 a stream
Message-Id: <179422611102.3711751.15137943245271806219.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:08:31 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gX8fuDjiLA5FI7KIzch8pW0anre/Wf5DFE7FFfiqYBM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+Xre+9mxnxjn+vYd+u7eYP/s2c+q5qtSQh6U9FV7PV
 fyWTHGd0VHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJlM9j+Cut/z1EIeOtg1/J
 3K/uGVkVgl+MirwYhQK+Ljl2U/pvz1KGvyKe66vb9qx59nen1+TZ2ln3l3nzqmhezZpRnJimI35
 ejBkA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 21 Oct 2026 21:42:02 +0100, Michael McAllister wrote:
> ASoC: qcom: q6asm: Reset PCM positions when preparing a stream

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: qcom: q6asm: Reset PCM positions when preparing a stream
      https://git.kernel.org/broonie/sound/c/54e89fab723d

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

