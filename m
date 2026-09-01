Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF683AFAEC;
	Tue,  1 Sep 2026 02:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228612; cv=none; b=lnsMPhsf71mtEPkuakfyV//DHBndc7B8E8fhNINzbfxTltO7DQWK8k1m9SknVXp5WXt1C+TW8qlFR/QtfcdSVuOw5JESTGBFPI6tsulyiF63sVwUaUpGwuTzwzPAaHYn+QRRxtxCCile64xOLZkW26y1Hs9iTulfcdPKyQUQMCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228612; c=relaxed/simple;
	bh=9lGOhnH8ptLDbrzPUiQ97sAk234LdBCMlIfJxkLpFBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rKIENttx7HGZnieyd0HNFsvhxfSV2G8/K0L89iaAUnZmROXR0Wro2O1ifXzarMWV1a4m4G03aNCdVAShFFO2XvkhVZUwTfypp4i1LLTO9B1MI2MrMKVql1rGi+PlZchkbyPY3s7527sLrrycQMg31OWRfCvIt3MJBZB1083v9aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpNfTAl4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpNfTAl4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999F71F000E9;
	Tue,  1 Sep 2026 02:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228594;
	bh=4of322PSUzZ8Sy5+INLRbdXL9+QgQC1VI18TEsEFeDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CpNfTAl4a3B24uow15+SNahLdlOmlNNr+BMY6fJdBIV1lgfbYexXdrvybw86U5KbX
	 IeuqLJdJeDsegQiNj2eEnT8t+zxbZ764RZehHs6w4ixKcWfeK6hZ8gVqjqstJ0oMSF
	 LApMolqe5KceNXfn4nUuMwLVUKOS7GD/YG50DB0rfYGFbyQYWCY+kZ+p8BKsrLt2kZ
	 q5yfoBHGmaKWBmpW1KGCKQbZQXMc5NAQFPvPom7jcR1aHEKKPndECapxjh62ge4zwv
	 3egQIK4w5neq510Qm5XvqjqYezADheKmEuzpMB/arLaM5pvKh50nJCqas3PKS9hD0j
	 zkcVvdTRVQAlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: Remove redundant dev_err()
Date: Mon, 31 Aug 2026 21:09:29 -0500
Message-ID: <178822856256.1835959.4462451688948832696.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723024248.17480-1-panchuang@vivo.com>
References: <20260723024248.17480-1-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Jul 2026 10:42:47 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"),
> devm_request_irq() and devm_request_threaded_irq() automatically log
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: Remove redundant dev_err()
      commit: 29b96e2769def61531c19aa537f5a3cf3ef38e41

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
