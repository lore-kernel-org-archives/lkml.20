Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F8D3EBF0F;
	Tue, 29 Sep 2026 03:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651773; cv=none; b=t4fDYBHWSfb8EWoVpVX+Wo+wigBLwrSflSlS724xAvW0DVobNavZomUpx8WYj0b26hRJNqXAy+y5Jz4DStffddxM0FnG/wV0PKwbDjOJKAwuTv+HYBLwH0G4O31Uw7QAtmZzlbcFDzDnhl90sSMd55m/mPLU5SDtFzePWCFoQlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651773; c=relaxed/simple;
	bh=wxsWQz5kwMs62631hKp1pV8QSzsUrJQ+PkI9dfi9uD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pbsenwRCm8WIq4TPAlyhfSEwgGnZA8U+lz1wdxTG9rReFoCzZfr+Xzgs5ptf05nZSVjLQZWt3ZsKJEt6qc26KIZopNhcgsKbodSjFM0xx2Rt5c4vrX48uCQeoYBhGmARDVjlQj1jpko2QC+OZ3/DPup+y4dyW14ei+WZcoXhWPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7QS5SmC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7QS5SmC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07ED1F00899;
	Tue, 29 Sep 2026 03:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651766;
	bh=bgUGDLcQgcDEbbAt8TRQhftxnoEdzxO95+EbBYRuOPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C7QS5SmC+Uv+EIPEF/eDkt2jEMlq7tQRkVma5FKm50peKOlPzbDcId7NTH9wkUhD8
	 kf2gbgekQrOJ2F5by5V4Zgv+Nu1YSXs8lXFePztJGP6eOLvK3t/aAJO3NAs0pVL5Sk
	 bszrxbHSsrofipD/IRxZfla/1O+KmvtwGcIeRbRIc7jWRI+E6hyfUDENLMtDxAl7Fo
	 WjFxt54u4rD5PvCmkPxQ6z9iM1px39CCRCkBhbL0ASStBpIKgZdBxBnFYqUmC2Ql1t
	 FlFFij2S730VIMA/ZsBGnp6Ey9hb8eGMNZ4uHIvLsdu0l4Hd5qgpztlCJiM5Wmouy+
	 zMLi0b0Y3fu8A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Yibo Tan <lhfff@tju.edu.cn>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: qcom: pmic_pdcharger_ulog: prevent work requeue during remove
Date: Mon, 28 Sep 2026 22:15:00 -0500
Message-ID: <179065171035.2673486.11996109111446095232.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912161210.1683266-1-lhfff@tju.edu.cn>
References: <20260912161210.1683266-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 13 Sep 2026 00:12:10 +0800, Yibo Tan wrote:
> pmic_pdcharger_ulog_rpmsg_remove() cancels the delayed worker while the
> RPMsg endpoint can still deliver callbacks. The RPMsg core invokes the
> driver remove callback before destroying the endpoint, so a response
> callback can run after cancel_delayed_work_sync() returns and queue the
> worker again.
> 
> Device cleanup then frees the devm-allocated pmic_pdcharger_ulog while the
> requeued delayed work still embeds and dereferences that object. KASAN
> reports a slab-use-after-free in pmic_pdcharger_ulog_work().
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pmic_pdcharger_ulog: prevent work requeue during remove
      commit: 2354a6131c7d28523675786ca95aadccc7763117

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
