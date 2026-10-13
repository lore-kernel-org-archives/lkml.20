Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D8953CA97;
	Tue, 13 Oct 2026 21:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926954; cv=none; b=sfRU8LNZ/B353SvZ6vJrjhLalm6jMkMuAWjDHvsTrHbR0aISS9eRQ3GLdZRETgIAOlWRaeb+lu3ELKerxifgl0yA/0093kbPzW1tXaHT+3jauAMzTheSdYWlipQbSEOWdO4Ctb7McypfMHSUfPsMNUUfRWyuYvBzA/WHt856VwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926954; c=relaxed/simple;
	bh=Q8BDflHJqp6FmCvGpr+azISn11DFhOvAXiDIP9w9dIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K3m3mF8IIbmZGMWUVvWTtKWLMYV+Mt5HLmFeEBlAo8exMk2Fnebw66aRt7VpToZB+WYmV0rRHnfsi91SB3gy5v9D4+z8jC9K1hmDgDg1C3g/V/odMGZDFtpNxhvNnKpyYaKIf5nfxpYcrVl8S6t1/P8pJe7IfvTrc+avnicw3ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IidPUgZm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IidPUgZm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CE01F000FF;
	Tue, 13 Oct 2026 21:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791926953;
	bh=oIDhZyJHXbWjwkM5dezWUWdIXaFw7DP1IuBLqpD8kNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IidPUgZmMVFgldTTuT9qiUT9CBx7Hfk6+hh+1zkGinJxutjDQ1yYGBxDSf2/btQZ6
	 LJtKHnVoqDsFFXKkc8/Y+tWU9GSPbyfMKBxPo9ktGbUQWpgO5Vae6qcMRAAQ15Xn+j
	 5bLSUWgsFRuYNaYyn8zxrzfV5ksQDOXTu1CkXzFMPrQe4p2mxKH4G1y62DQwIPJvBe
	 M8PZQGoq5uDjVqAP2sS41khcN9lW35G4HB5y+E3LZINljevmEkKsO6MrC2ytq0wNZ1
	 npHprnJwJX7V0TVJmhMa3N1GxAKI/NjMw1/e6v5/pQRP02MucHpP4lcTqzq3pt2QyR
	 1dH7F5JASu9rg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v3] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes for read request
Date: Tue, 13 Oct 2026 16:29:09 -0500
Message-ID: <179192691435.348249.7985530889247939276.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
References: <20261007-rsc_read-v3-1-7501c014fb37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 07 Oct 2026 15:35:49 +0530, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
> GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
> length.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes for read request
      commit: e284de4dfc0132764ef0e051a7024932b130c5e7

Please run checkpatch --strict in the future.

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
