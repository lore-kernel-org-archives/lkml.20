Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389BC399CFC;
	Sat,  3 Oct 2026 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015693; cv=none; b=DHnqwSt1u9wL/YGvwKzMlBcFNYspTUZXuiXx84bbFPqzaXz4AuFgCJ09tSyBIg8MjLlX0LQODJ0BiCPljOfrqus/Ke6NIt6mxWRfz7Cs+lkTI3mEsuF1Xxt28Yp8+qkoOhtjn5VL+UMVMAzkz5lAbKz4Yd0ohX+RQWsMclDJ/3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015693; c=relaxed/simple;
	bh=m8NxaCq7j4wU61MdUNSTYrZ138xoedQP3Q0Xl1dQ8aw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OJ5wSVqfPERejlwJuXqwTQU3pvAqbdtZpIdOiMEj7muvc4t2zPw7QCGV2MPLFje4Ne0dj0Fn70H5R9XB9XgOK0uewuiUDho5I5VrJ/ypbIkVpyygQT429TNz9Y0oVsI0c+zxjsfA+79GqcbW3tFdd5zkDEpKLL3nfb08vGxNerQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WuyiDHuJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WuyiDHuJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8AF1F0089C;
	Sat,  3 Oct 2026 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791015691;
	bh=4hH9V5FyJgSxgr9dUkrf5CQjlbOB6/zdBSxCtBSTqFc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WuyiDHuJALTZUCxf5mkYPSXw9lfzjT1fGs6402ykysvaFNoLtq2qWdSoJRBr05XCO
	 66BpzhcoBEgRy9SDPABQ58L5X+U481xfbmlYOKMDFxA5SPgupd0J6tH1T2CKBCkEJy
	 XeNEorWKl0778afPO5xAOpPelApmI7Oq3/Whe2eWpOxhFsoOyDKoMoaC5jSpWojBHP
	 hvQlWgtrjH+kELY54WBfbAb8pGZwlc57q7fH9vhtBI+45fafiKCMhYCIGb8cI4N+Ct
	 0b7ha1FB9KSo2KzSgr9KT7C5zrX+eaFsxB6pUoMezpDW98TalUqIbhH9oZR3/d7BK7
	 7RYQVUhTfhqaA==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Sergey Lebedev <lsa.uz@pm.me>
Cc: Bard Liao <bard.liao@intel.com>, Amaan Lalani <zlzzm2014@outlook.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260913210849.6446-1-lsa.uz@pm.me>
References: <20260913210849.6446-1-lsa.uz@pm.me>
Subject: Re: [PATCH v4] soundwire: dmi-quirks: drop the ghost RT1320 on the
 Surface Pro 11 (Intel)
Message-Id: <179101568918.158974.6265276425987256334.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 10:21:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 13 Sep 2026 21:08:55 +0000, Sergey Lebedev wrote:
> The Microsoft Surface Pro 11 for Business (Intel, Lunar Lake) carries a
> single physical RT1320 amplifier on link 0 and describes it twice:
> 
>   SWRA  _ADR 0x000030025D132000   SDCA class 0
>   SWRB  _ADR 0x000030025D132001   SDCA class 1
> 
> Identical apart from the class id: same link, same manufacturer, part and
> version, same unique id 0. The part reports class 1, so only SWRB
> enumerates. SWRA never attaches on any boot or firmware version tested,
> including the November 2025 bundle.
> 
> [...]

Applied, thanks!

[1/1] soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11 (Intel)
      commit: d32e04c052342d7d1cc03f6ba4cbd135cd0112bc

Best regards,
-- 
~Vinod


