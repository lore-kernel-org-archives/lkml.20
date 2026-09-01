Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E84078D8;
	Tue,  1 Sep 2026 02:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228604; cv=none; b=Plw0W1HRmEWjn84xuqTrYaWDpvchjkVnQyDz8+ShvnUmBVjlk+jim5vA+KcyEIdk/tJqp4ub/u0lzn2eHhQiGUDE6vOoQrzd4WUVGF6Udepj580o0Ni1lc741cfDHYXJvgKQS42dhq5LbfgEfkdfFOAiGeZcXW1sJJnfiUi2A4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228604; c=relaxed/simple;
	bh=r4vNH6iNxQx74OgXDGNJnlWhJylbFZKPjDrcYocUzLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsCV7VKpSHlcj6PKM+qgo/DDAY6XYgJkAxKH+Dsgv0DMFCwVgL72rntE0P8u/iJMo4o2zr/O5hERoexzf2m0dlOxzlep1Ih7b2TSKc5iwBYS2lU1cuX/25MzCQ8ujJ/1SkmJRYG7EBUW5H+cZyNhz0h5Bv5i4hrTdBJnOVA0g/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m79ZyCbw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m79ZyCbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8681F01558;
	Tue,  1 Sep 2026 02:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228591;
	bh=X1harb7glA+KhKN0BUgU9Vz3aNHX+jcLUesIR0F+dIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m79ZyCbwfQKfBqwPEV1BbqKQEfg8+icPdNFFqU8QF0Az6oTbA9kKsPav2KT5ZtWdN
	 pT74OKv+A0s4ctMXMzRS+00og77fRVhk/ESGAZbIZrQ5MTo3CUVYQ9poZOjC4PXUQQ
	 kOacWck2xF1YVSZ0FM5CxRpc1ZgtIHzYJ0has05znVdma4BCFcaJ/LxuevIf+nH7wr
	 UOUpEbPke/aK5G5RPnkg9Ajztu+bxK40A2o3ou99fH5Dntm5ylM15MFiL0nu6Q1wV9
	 nDtSY3iE31cCoPCUrz9zUn7uBXE2afaCcXQsXb7jqrjcIctFWzWpBd6br0dl/b8UQJ
	 Ok70OeO7HY4zg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] soc: qcom: rpmh: fix kernel-doc issues
Date: Mon, 31 Aug 2026 21:09:27 -0500
Message-ID: <178822856280.1835959.17994382077104031476.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
References: <20260802-b4b4-rpmh-kdoc-v1-0-0f5026293d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 02 Aug 2026 18:58:52 +0530, Maulik Shah wrote:
> Fix several kernel-doc issues across the rpmh driver files:
> 
> - rpmh-internal.h: add missing @ver and @regs members to struct rsc_drv,
>   add a missing kernel-doc block for struct rsc_ver, and update four
>   struct comments to use the 'struct name -' format.
> 
> - rpmh.c: fix a typo in struct batch_cache_req title, fix function
>   comment format for five functions, add a missing kernel-doc block for
>   rpmh_tx_done(), add missing Return: tags to four functions, fix the
>   struct cache_req format, and fix the inaccurate rpmh_write_batch()
>   description which incorrectly stated that SLEEP/WAKE_ONLY requests
>   are sent without caching.
> 
> [...]

Applied, thanks!

[1/3] soc: qcom: rpmh-internal: fix kernel-doc issues in rpmh-internal.h
      commit: 4b9f2e0e0bf58800cc092a135268bc042bd3d1a3
[2/3] soc: qcom: rpmh: fix kernel-doc issues in rpmh.c
      commit: 7177f08c6b65ec062ec3880a90be28a42135d266
[3/3] soc: qcom: rpmh-rsc: fix kernel-doc issues in rpmh-rsc.c
      commit: 33ac44dcf9ca0dfa6193a23bdb7c8b1ee1083102

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
