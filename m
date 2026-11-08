Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169473;
	b=wCAJkHq7jnf7bFsBtvuy9K6AAsbOunKugKL3PtlJQF4Cvo/2Xfp+o3MUdAmwlJ6FjUu0
	 vIyCZBGr53QYJdfQu5rdnId8z5+i/VJTG+8P2Cqczayq6+q1emEJEU01Q/chicGewwL3U
	 fLYIaJPzw9SBqMxa7ii15K2xrAxAs93KLtEvKE+y15W3U/p0vPNtfwC9uTBxst/XC9Not
	 zbt9r5XtK0vRjWfzbwysaYudJFhrgXkugJGoTqAZAyl2uv3TJ4pk5PIAuZUI8Vt0XyaCn
	 KitDiX8P6coCOIk8V0o9gNkhU56SyBuBIf/v8NX2JBKq5OGr/DMnplECvEb3dr5trtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169473;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uygfYEpKnkwmVZhADVlp9pkKSqQqdNPc+V8s7eo3P88=;
	b=jN7bZPe0HypwYA4tIZ+USUyRAKBSYZWzfi6oN+0AiEsfEY1kDggYPtST1CUFswkyE503
	 jGrSFY+C9ceiYnVfzigwvoKbsb2eYc+nuy1/3jb7ojh2NIhEeVUDSxdz6LBx0gCJWueDS
	 IylbkNivR0CaxP0d0tD4fZYUy0ZT8Umwo+F2bNqbFjWxqQ0P8FjT7KG8ZXgtGEVSPQ1f/
	 VfgkKJ4YFPv7W1YEWqShypGrbx0FQBKgOE45pEm1Mlf3MVHPNI5SUIhQzVImhyTg89U1X
	 3F8poC0rutzLRxpMVzZaCZGM5qYd5GBUTtbyhhbSe+FrcVwt+avjn2u9eEAZDfSfmhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ew4hhQfz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693A7607C5DF;
	Sun,  8 Nov 2026 20:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ew4hhQfz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B051F00900;
	Sun,  8 Nov 2026 20:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169473;
	bh=uygfYEpKnkwmVZhADVlp9pkKSqQqdNPc+V8s7eo3P88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ew4hhQfzq8Xg40yF1lsmE2H05SLQwTEuKiRwBj2Zz6M9pkcYuJSNubROOtxFZx9v1
	 0ZJ0fDCnxz5EDfb4xbo3uqJfNhhGWDFrA3/qP8nFnNwW7jD5SazCf7ygSXUkiMnHQV
	 weWqKRWt+KJXQipGqmEEooYQeYSP4KGSyjWNz1aJ7ZWZD4XAepIR/dtS9DPsQlE7eI
	 G8IUxqJ1flub/MmdetNam2Jd9c/rPbQ9JXEbzlAvlw0RUomJazZcoDFSHdQ2f4qLGr
	 S1j9WfY0mijM0beZGZBaM4u3V9WBrRZtwNKNC50W2STTixr7gUuPpT9GabYdSJfh41
	 gtgPPn1+V8ItA==
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/3] ASoC: qcom: split out self-contained Hawi/Maili audio changes
Date: Sun,  8 Nov 2026 14:21:05 -0600
Message-ID: <179416929329.628393.8263808018546375822.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit


On Tue, 06 Oct 2026 11:07:14 +0530, Prasad Kumpatla wrote:
> This series extracts a small set of self-contained patches from the earlier
> Hawi/Maili LPASS audio submission to simplify review and reduce dependencies.
> 
> Link:
> https://lore.kernel.org/all/20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com/
> 
> The original submission included changes that depend on LPASS macro codec and
> platform updates still progressing through their respective trees. This series
> contains only patches that are independent of those changes and apply cleanly
> on current linux-next.
> 
> [...]

Applied, thanks!

[3/3] arm64: defconfig: Enable Hawi LPASS LPI pinctrl driver
      commit: cf446442a4929416742719913a55eda92a8801e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
