Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F1E42A173
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731081; cv=none; b=Q7Jjqghmi/Jk9WRmaAeRkXxFmCg/mMDObd+yqBBGvNFyZ8G3++aPkd7bhn2GKFS6M/XIoUiGru+872FjWNrLYe5Xu8Gms06NLaiWbKMJPJRxOPW6YHh6jZwzEqxUfPpccXq9xXyInSUwlLkPfKl3Wu2jQgafnVAejwTXcpUCi0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731081; c=relaxed/simple;
	bh=jtxXiG95EDLxQVzo6IiOO+kz0dOST2QALpCpIuyYfBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fUJd5ei5yFw/sslgny1YOdrFqIY78oQT5egRRZifA+bvWXIFuUNCFpLeffRVCKf1Rpob0DO5vuPjokuT1JsoCszzTZXmytFxP2IpCNAHxw4uRt0r1wg57DUs41zyy89stfLpKEwXSTX4odZtVFTTQ641XFQAf5WN+0r76e7LfjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlPxbCE2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlPxbCE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E1F1F000FF;
	Fri, 18 Sep 2026 11:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789731080;
	bh=L/Zz516kYItSH8+rRy2r7gKYl9Ci+xbgs98Xewz48NY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dlPxbCE2DqMeieWD3kl8zxJ+pHq1CqYhDNRW/3U+gel7QXiPaXEKuvpiWDdDRl4Jd
	 Emgi8BkcmpnOtG1QsgUBsbhZSewc0K8b7VOmRnPElaOwM4KXbwSWC3X6agJKKlVYUW
	 EKsjxnxwdEVA0u9yYfFaEdKxoql+bEhSFp7beP0W3TSr7rK6nrrzF3io9oCJsmRbm6
	 GEaoOlfkq5X5DrfEV3TJXuqkrezEK04PdSYFJsis/On0hV6oLSFtOfh1sMpaRgyVUo
	 PWd86F65AzSxMkchCgs6ejRtFrmQ5Kk+4OehEAAA4EonNRw1eROiaytXdO/PQC+Dww
	 WrIHGCvWAbsDA==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com>
References: <20260917-sfdp_size-v1-1-c1cdb1003f48@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: Increase SFDP data size limit to
 16 KiB
Message-Id: <178973107865.3144177.17346333400133401427.b4-ty@b4>
Date: Fri, 18 Sep 2026 13:31:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Thu, 17 Sep 2026 14:02:15 +0900, Takahiro Kuwano wrote:
> The size of SFDP data read and cached is limited to avoid allocating
> too much memory. The current limit is PAGE_SIZE, but the Spansion S25FS256S
> has parameter tables at offsets beyond 4 KiB.
> 
> Increase the limit to 16 KiB to support such devices by introducing the
> SFDP_MAX_SIZE macro.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: sfdp: Increase SFDP data size limit to 16 KiB
      commit: 935457a1ddc90921c3a3444f8bb7aaa97d2af55c

Best regards,
-- 
Michael Walle <mwalle@kernel.org>

