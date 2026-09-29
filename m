Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746E3DC4DD;
	Tue, 29 Sep 2026 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651751; cv=none; b=jU52oJX9y/SUauZ3Q4tPUSQSOGu+8wkgo05TF6IoPhOY90AqJOCXsQRwKVC3333/iOxmfk16uQmjK/zfCUeDoa2WnBALOv7c4kmqPqX2GIEulrcD0BFqclA6Tp7YsLQV8fXMVO7a6lCY5v5vpNVPI5EZ+x96RT07/HeThkdspCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651751; c=relaxed/simple;
	bh=rzeRpF09s/thKlIjv77qUB7JCKtF8fBFDOVUd1fAntU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oyE6WG/sTJf9AuSTFY1XqsBNKIUDuXr17refxR9pB+ya93/mBFggHjpvmJMzOPOq7kxIMgSGCD63C2/9tJm1/px/P8YLOowuGEOFx/8oCMM4TWhryjxmKGu5qtQp0fvIYNzH7AsGIwp9MT0Jp2Yz1QphOMNQpdsARomgOUVKMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4EdEIeG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4EdEIeG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAFD1F00893;
	Tue, 29 Sep 2026 03:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651747;
	bh=x02v9lYImerXfecy7cxoXIGqHCUHwmqRCjNJ6gPzsKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X4EdEIeGVHL3WpS+RFlPkFfnko1VPNEPnI4ThUp+kSR4zTGzTUDlbEyQNuj7AoBRK
	 fnK70PsB/blziapUWfcFebrMmAcL9ONBy3vPiy2ZsJUO+jfRYLb4YEPV/fAcwUKV1p
	 5z/AElp1K5xZSiAzVO6FfQIul0tnZtWwcyn/r5PSWlQ45P4dB42Y4vEer5twSRDJBU
	 eDOdvl5a6BqlXiLxo1LdkbQEXSDLl156fQiOeJow0rJoOgfiQXIZWjbfsjegUpJfpo
	 mBwtoZBQhQ7THYdY6CcJuiLz68e3svtzm3+H1UiIw73MzPPgQr441uZTOIYi8Gy7CZ
	 gBrlX7dBUmaeg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] firmware: fix typos in comments
Date: Mon, 28 Sep 2026 22:14:45 -0500
Message-ID: <179065170966.2673486.16315687113712437439.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907061742.10954-1-hemanth.selam@gmail.com>
References: <20260907061742.10954-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Sep 2026 11:47:40 +0530, Hemanth Selam wrote:
> This corrects 2 misspellings in comments.  Each is a separate patch so
> that any one of them can be dropped without touching the rest.
> 
> Nothing outside comments changes.  Every touched C file was checked by
> dropping its comments, replacing each string literal with a placeholder
> and collapsing whitespace; what remained was identical before and after,
> so the compiled code cannot differ.
> 
> [...]

Applied, thanks!

[1/2] firmware: qcom: fix typo "uninterruptable" in comment
      commit: 6359904fbd19a18c267f63e51061c275ddfef647
[2/2] soc: qcom: fix typo "upto" in comment
      commit: 5a174856d0ac97699b07cdbf09e0c251b3a60034

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
