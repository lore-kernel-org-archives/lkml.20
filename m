Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169414;
	b=vGEBERy78GXVzTbewoKdxfDEUznsFHx4WCop4xXYdXxQYfe5Is0YeYTLbmucvAm1+e3G
	 9Uuu6c2wOrSZATGeotidvr+6MgYY4Hib7RJYIrvgmrXxXYVJKb0d7m8bv/eLsAFq58f10
	 NTd0+KBYFONxMibXvIwiGgNa9uz/v81Lntl/lQIAut5BYIxS0NEz+3zei3A0WDf/gCEjv
	 /n/QFyH+QmVsf8WgNYGonFJPKPTwnsUUtarGxkRVtB9ws7QhYxE7LFrQQYbuKxg5o5tXN
	 srW6E8N0uxMN/dv+72qZY141fGabv460oHvybdFBcb/H6eMvOrdk+1o7eqUXPxEQulQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169414;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cKVCJp860o0T5Qa255it9obpPutgvMPgczrhnqgjomg=;
	b=LsJ6ShdntAfJWNAYTOP3wgtIp2GoB5KHWOF/40x2Qb1gBbZzOWzMxMWiiUfpSwoCvAZ8
	 LjfQAkmDa8T9nn+iJ/7AxsjXHodmprhHtTxTW0VG24kdqqpAlQT3e35N4M7NKui0hvInm
	 qWI9L90ZMt1QcYbZ97dVjK4Yop0kRHJAt6KQ8G3dTvGPqqMe19crPxm79P46NmRu8jOeJ
	 0acmqXXZ28bBLNWY7swIgwKzfPf8VtPvLcElpW2uaCw+FVZ3+KKieAcLOU3LNkceHy3JE
	 BGM1Sj2lJYqhASqG6Tyl+NlCf4+rAyyu2qOT8tXvKcPSl2MgT/Or/idXEbHzxtQnnIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQ2HSaDH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8F6071FF1;
	Sun,  8 Nov 2026 20:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hQ2HSaDH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA7D1F008A4;
	Sun,  8 Nov 2026 20:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169414;
	bh=cKVCJp860o0T5Qa255it9obpPutgvMPgczrhnqgjomg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hQ2HSaDHoT1ogyWdycol7fZnK+QXSI/zSb9fmE1D1UBsKr8OkJmDykaDyjK/SZrKI
	 GMGTknWjuYDCoauiFQvT3B5wKtPCsMsodoGJ0Izv9qAaWlKC0dMYkGJ93nEQqSSUfb
	 OD3Uujv6Dooqg7wOZ/a1HF1bzfOhb4CGrY/tjepM+DM3BU3cQxiD9Hsni3kJFMZNy9
	 icMoutPgQnhIDDaItW9t8U+yAP6OtPGqcmtrrozYVT6t6SMNjbfdIeljXCiaIoODbx
	 NUC/slOO1usbHIuw/pD5VcNb/jmF+EXdc0UE+oxx9TOTFDiFLYzUzc0c/8MLB39Lsz
	 RmwavuURyMRBg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_pdcharger_ulog: Match on SoCCP
Date: Sun,  8 Nov 2026 14:20:18 -0600
Message-ID: <179416929568.628393.3526348606720397673.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104-topic-soccp_ulog-v1-1-e6e108ad049e@oss.qualcomm.com>
References: <20261104-topic-soccp_ulog-v1-1-e6e108ad049e@oss.qualcomm.com>
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


On Wed, 04 Nov 2026 19:43:29 +0100, Konrad Dybcio wrote:
> The battery management firmware, as well as the logging service, is
> provided by SoCCP on most SoCs that feature one. Add the match entry to
> enable logging on such platforms.

Applied, thanks!

[1/1] soc: qcom: pmic_pdcharger_ulog: Match on SoCCP
      commit: 303b54549f40401b9c6e6036226b81a57ec9127c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
