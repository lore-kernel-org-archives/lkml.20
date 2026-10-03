Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C6139EF1F;
	Sat,  3 Oct 2026 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016509; cv=none; b=Pn1pVYtHvVahfeZ+89vx7ib7krBZNUsxytJTOny96G/e1Hojzi/qshMWnQO1SQXr5ROHe2Qaf6ovR9j1z4pGXY5tgWzr4int4YlaAP7FcL3OpU0cBDXo5B3ee7d1aluls42zHXlmnuJ4isR+6rfg5f/6v5RHHylQsZxbfe6xt0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016509; c=relaxed/simple;
	bh=GZOzbJd3SvVEZ5zANb7obHTnsb7kiqZS9XT6KaHL/CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q61U1MPrwgdbMCVaBWKvom01kq0MJUGQn7l5ly1047sPdPWjZyIoXSnke+Ksdg5+0QU1DaxLiN9gIhyjf9+DBTcOGOGfqg3FdKnPgejSYEIVlBtgwhlpLvzpzmtuCyLDHtRoFhmgMqGjiuz4qYldHhHOchpbOFj+dbIl53z7ZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHWPseqd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHWPseqd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35261F0089B;
	Sat,  3 Oct 2026 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791016508;
	bh=lBO67bcGiEGT04UUyRyVUX4nE3vSBlDbTJbdu6o4Zuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hHWPseqd9u4y3f3VgiCLroU3CJUae/2Bo7P4mEOGKwbA+sjCHd6WdrA0uwpXFTuR5
	 ckkZa23ohTISQ1g5OwdnBRErKu1oRkjgHQLLTLmCueTAPBK6kktcVwlTfgImKFiLEJ
	 eIJvpcZXKcuRBEooYc0qBk7LJY8qszK6kNaQWQjn04cgYre+Ki5HDSN2/p23w5luq4
	 tI5TE5jF2IuaqPfv1sYHHRfQbi8r2hUHeMFHsN3wh69dF9UMx2DUgPgDtHSHhWW+zi
	 N4hBdrkrDM+LYOEuMkc/5GMkeMVm/76+ITvSvxdbgzaudgqswWCdLkufAnyxk90Yk3
	 E97guSWx+92fA==
Date: Sat, 3 Oct 2026 10:35:04 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] phy: renesas: rcar-gen2: three cleanups
Message-ID: <asC-OEN4KzmQjMvu@parshuram>
References: <20260804-rcar-gen2-v2-0-829cb84112ca@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-rcar-gen2-v2-0-829cb84112ca@gmail.com>

On 04-08-26, 23:24, Felix Gu wrote:

Please describe the changes and motivation in cover. Also this doesnt
apply for me, pls rebase

-- 
~Vinod
