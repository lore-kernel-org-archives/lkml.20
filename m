Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693812222AA;
	Tue, 15 Sep 2026 00:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433820; cv=none; b=kWvrNwPl4YqXfJNI3x1n4p7uUvQ8CqQMlb3r0VvBy8h2b1Svcp37GK41lrE6lHg9N7PsyLPcBU5aafbSutTNP74SdHyFqqTBcRj/O+EPEaxiyEDbdGFWkynjkxogGK27+KLkgl0QfXb+aLOQC2CvXw480W6YorS+4S6nIc9ImE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433820; c=relaxed/simple;
	bh=CKkv6Ns+x27qIfC/PamcYEmPRvxX/CgKh+sTCLbkk9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+2WovS5PHO8k9/OLlgKdht8XW1OmH4Ljeg7xmAcUxH56s202YPxQUWPp434NVANjeF8Pw1pnfu3sqgMnAjfZPPJCqWwFBEFiPF2hSCqIZ7uoX+4JweZuYuZUGpoDPl6GBoZ4OTYMPKLGmBfVWKvPs5FfC4FJMUqmvOZxqf3RF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPRXoBEh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPRXoBEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE89F1F000FF;
	Tue, 15 Sep 2026 00:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789433819;
	bh=wcaw6NoI/kdvca0JXoKnjNv3/X5K6pgBkW8BYKOnOuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fPRXoBEhj0nJfAaDgCU5/rcUP9wvyPbQMQDm4uJGGblfqYh0F0qTiXy849SuBATio
	 wpFsYblv7nyAOClfA92CWKAi6FG6en+PtbaqUk70v1MDGUMVjuFl+MoxyP7h0QUdJZ
	 NFtXVueWrxGRYOwdSYWpuPqrcTQX9kIGSiYUdRjVq082aZxCuC7lBk9qpYkET50YWP
	 B0GKujRaLhWQvp4KdTZ0NWMGgWE9JfYyVzsnwUSMKMtTh1JxZq1dBD+XSTEczP8DD/
	 rr+BlIa5M0xqAPM27ZBn9yyMzecBPu0uGbUbNuXiV1vFR95r/VTGxSWMF0SdncOb0e
	 IwbhG31dECOOg==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: sort nodes on OrangePi RV2
Date: Tue, 15 Sep 2026 00:56:53 +0000
Message-ID: <178943376986.3673424.9823989406709059197.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802100101.327815-1-amadeus@jmu.edu.cn>
References: <20260802100101.327815-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 02 Aug 2026 18:01:01 +0800, Chukun Pan wrote:
> Sort the nodes for DT. Also reorder the properties of the sdhci0 node.

Applied, thanks!

[1/1] riscv: dts: spacemit: sort nodes on OrangePi RV2
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=d4871c29f21dda76990cd3138c72ceb71c856b93

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
