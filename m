Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169328;
	b=fGJ17K51dT+qg4p0o5DftsOr9kMuJhEm2jeW30npxMxekirnfRsBt4i3ytuGQk+86Fdf
	 6GVlJdWkZV5hYBM00v14rx8nmdqgT+iPktB/NXJ1zFD6Y4viYhmz4QjEnGSmFFLP2hKl1
	 DYNJyHpRo+Ibr5Qhe2xG3WFgDRp5ID/LICNCdQKNrhnXnoMivAzU/86YLaExPcZF9oYg0
	 V+XHExZrVqNu2KxFUGbHmjNioGjn276iwA8/5a/kNUdj3Id+V93AU/NP684PrXKw/GMyc
	 ZgGVC1YBX6iaZwqH8uriK/t0eQBZfASUMhEwquwXjkUM9ONOfKDlFHy+qnCozx+hQxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169328;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vtsGbCDjTxvwF9SlKyOf7Se6ZKoifvH9uincnKlACbE=;
	b=b8lPpW4Kl5CyPldgqLbEcFmEnrCKb8/EzqbX9CYjfgzTkJy3nJsQzquUEBNqpbDOVYyg
	 c3yW3o2OKlIHgVIo4Rb2uodF79Z1QCnifZ8ZC67tWfhpU/ZPbF1n01nf+Z+L3X7gO6tI2
	 sjk2PtD9Kqht5+J7P5JcE+pwwQduQBiQvrmvMVVEhqfR06bdQh8X4ae8MHn66H0zu6njt
	 ugEhnxA4zqmrZrzG1F6SlBx/5JTjRggyjBXRETwvHHp8f8Z3EQIIRn5rNFHy6xXkEfWOo
	 QZg668IJMO+XtS110TCA8u2CpnAMj2h2By8x/WC6ny1YXm8g/88WD+rGXCG10t/bApw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BS4Om4b6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B9F606D81F;
	Sun,  8 Nov 2026 20:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BS4Om4b6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89FA1F00900;
	Sun,  8 Nov 2026 20:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169328;
	bh=vtsGbCDjTxvwF9SlKyOf7Se6ZKoifvH9uincnKlACbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BS4Om4b62TtOHLd+3QvjMDBYmjiapBwlEYH8q1UFgeHRA8JorMPCv1Mtjp0dCXt4T
	 UTzXOoJ0s5vFcaADlbhiIagsnqGtD+61QGGK+O1zYoOFaxmZDKVL40s13BZhfurZsx
	 fFXsqHkzz2Ddc32zbWWQRu26aqx1Rt6rPx7ZkCkMZjVyxKyG8zwpT9ds6oL9cz/QvR
	 VfUwpZOkUjUxubCtIHoXJbsxloXaqJ8TtSXnNwcuy1ouUc32MtC+k1uhMLMrmrQw3a
	 3Tc6RnJPJiPV+8ckZ3pXXO7qC/XG7GaO1/gTG98ALwwLVvAHPTRx+HlXYbvAUERatq
	 B70xYzRPNdDpw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for the Qualcomm Shikra SoC
Date: Sun,  8 Nov 2026 14:19:23 -0600
Message-ID: <179416929526.628393.7024752953655760934.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
References: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
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


On Fri, 30 Oct 2026 18:03:56 +0530, Anurag Pateriya wrote:
> Add support for the Qualcomm Shikra SoC to the protection domain mapper.
> 
> All Shikra SoC variants (CQM, CQS, IQS) share the same protection
> domain requirements: cdsp_root_pd, mpss_root_pd, mpss_wlan_pd.

Applied, thanks!

[1/1] soc: qcom: pd-mapper: Add support for the Qualcomm Shikra SoC
      commit: beddcf213a08577b4ed79944055edbc2c3cde851

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
