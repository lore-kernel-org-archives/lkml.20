Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862358;
	b=HF8BGt8uFO8LvOiq1zK9XysK/bxi/QiswtDtW4z83Nh7UCScXssu4Btp6HR3GChNdIfI
	 WYWmmDNXPG0+LU1rvwDBzMySxgVexlsHnPF8NuGKqbb89RYBeHt+lE/orjupSV01H6fiA
	 ANR4T+7OWLH2axVMZE8UHU6MumO90AJxkbd7I1oCTeZDuHy3y4mWDTWX1DCItUihVo892
	 7i7GMKrcZmmk2SeDrHdiIVN8QMVHkIVnhjw2euKdMOvTRQmd0QXwxVkkYvrkvIIdE4UD0
	 4upssNCVUkf1TpEe5lGW3j8rD1HvIF0YokcuXw06/Au0D9pwXFI+JrxunXfXCezDMbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862358;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=O/WLe8IGTSwdZfPyk3o9swtenyk7Mb3WvItfESaLxh4=;
	b=MyCv9EvMpcoz95nIRC0k7bsyeGBC7jtck37TSzF5aRh4fbuahrl337VzVri9qUFntLBH
	 2YAJbkD+iu9Skh346alg5n3vgJV0JZN5e0cwW7bDcjkIDGtjBbYBFT+t1mLU2r/BhO4cQ
	 nKYJfYw9v/ODmpDCS4Bk7Us1zWW+JVlLJhbXtGHjuC6NXSv3gszYR61c4FDZarkioGZC+
	 gteY7CdCe2o/CzgBBT/nE9cNbW2tVgbOKDI3WslLWKiKZfB1dL0oGlNHa3Oaoo92iMz/n
	 IL2dpqVtXbS57D0zIejDt2Iixs6XqiLSaFaQOeNsOEaIHwy0lis68pPO0hWNzQWTLsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TdzsHkud;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E19606A31C;
	Mon, 16 Nov 2026 20:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TdzsHkud
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3C91F000C4;
	Mon, 16 Nov 2026 20:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794862357;
	bh=O/WLe8IGTSwdZfPyk3o9swtenyk7Mb3WvItfESaLxh4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TdzsHkuduyViJz7b4P8FtBT0nmjsCU64pEiH/Sf9SywijLc2obfmB+PysYYjGOT0I
	 o0qPuPsu595PxFLCL4DgU3zCif/zh8Xa4Ijjd0Cj5xws0quk/WmX4f1O1VwKHqQUmR
	 62gMZWl7QaIxZZYyJgozcke7DGMYsAKbm1pFvyT/hCzvEVgGnW5Xh1WxE4ACZ/7KM+
	 rummlmxI37OFj1qJiYXkECCl5TPiMn3LiftsnFosvSMFdGyfDQgOrzzK3n4+91+e0l
	 yBh2J+4vSP/dxdndbfqcC3dR49VR6x0aDXzrxVd85jJROeQm3mYbO1wssWyRhs5geu
	 bFjzUMje8mu2w==
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
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM
 formats
From: Mark Brown <broonie@kernel.org>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com, 
 bartosz.golaszewski@oss.qualcomm.com, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 20:52:32 +0000
Message-Id: <179486235253.2504946.2842491869825346475.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=281; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lj4vY8gSkepZxtqE+w592m+OxCR/O4xZgdS860CBN4U=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+5wpePCzMfzXfKHiNLiOPoUb/1OM3N90L6xRRmPQk4
 8wigeWiHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjICjmGf9aXKl3eNf2WrTvR
 tPfF/Pkz/2b+XLVNNPrklD1KLU1Tn15mZLhqsudK+2kDruh7sZLy/tPOvz6Ws+3PET7dmWkfV12
 Wm8ELAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> AudioReach currently rejects PCM streams with more than four channels in
> the PCM and shared-memory media format paths.
> 
> Reuse q6dsp_map_channels() to support multichannel PCM formats.

This needs a rebase against current code.

-- 
Mark Brown <broonie@kernel.org>
