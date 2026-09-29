Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0E142E43D;
	Tue, 29 Sep 2026 03:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651788; cv=none; b=A8OfKz/XpZN/F6gsWVDA0MbAOesXxdBH3JN3H2i9HIKfr19vlSwvWn9KwfEw1wgxKDnJCsH0Ca3KbImA/0ao5+zHQHAbJr2zvxqZRwSXJfMOwMkxXra9oaPPnAzd4SG6Vr1RhxMEB83g80jetM0EwdFe3EQUS2ajNcj12M+loVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651788; c=relaxed/simple;
	bh=0jFy8Pyr0ELJ87TBX1bfPf+GyjIEJJEcYuqGS5d5Tsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uuPp9Y0Glk7+7+o113eL6TkrXxbmS/7ePh7T1cHJ1dU+k6WeR+6bttokO4yPcKgZ/JhgxQ1jRXLej7qiV0ikZc2My4CcgcsWS6BmxUFU1bIRGoU+jdoXufnht3rh4MfUhmq2krQkzf83o7eTGl3oKoNMu8uhLGDqQWRmXrRSRL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=In0+8AbL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="In0+8AbL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA1D1F0089A;
	Tue, 29 Sep 2026 03:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651783;
	bh=QiwQxU8TxSRiT4ubd+pu2YHhnwaRWBHjGolTNq3bdgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=In0+8AbL/kK2wbfhbxBx/CS3R3C93YZN5RXWBO28dfNO9XtRkyulxl0360aCjcWUg
	 BS8Jo/UmuRTfdtbXC4lj2thFAHNUX1uI+JtgoUBoiqwULqX9zJvzk2kdkwUNWJWa6I
	 YWZ0I1jY7OUA+ogHBe0qbO7/tElAwlBNAWWjXA5pl8Ua75lAjDMfo2omLfN/6w4Ws1
	 TPaWFBp0CCnnRmORrX3fHnPTdUifZR68vXv09Zjkf53w7IlFtVvaNoM+yJYRdFbnpm
	 SWSxuTzyJJTlmc9Cpq4Emw2+m0EbpxMiBpDzblEoJ+k2L86l/dKe8pvtF0LPKvVDhf
	 5mWgnh1XwpwoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3] soc: qcom: geni-se: provide PROG_RAM_DEPTH for I2C HUB Serial Engines
Date: Mon, 28 Sep 2026 22:15:13 -0500
Message-ID: <179065170897.2673486.7131583478070337388.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923-topic-sm8x50-i2c-hub-fw-ram-v3-1-44287b4e814b@linaro.org>
References: <20260923-topic-sm8x50-i2c-hub-fw-ram-v3-1-44287b4e814b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 23 Sep 2026 10:51:45 +0200, Neil Armstrong wrote:
> The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
> is in the DMA register space doesn't exist for those instances.
> 
> Provide the ram depth in the compatible data to be used instead
> of the reading the missing SE_HW_PARAM_2 register.
> 
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: geni-se: provide PROG_RAM_DEPTH for I2C HUB Serial Engines
      commit: 7656520bbee1cfef351bb09c9304f1c264ca2666

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
