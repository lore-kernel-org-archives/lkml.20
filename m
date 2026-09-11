Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401AC3EFD21;
	Fri, 11 Sep 2026 02:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093567; cv=none; b=JwPMwOIM42tNxrDtzxHvdy1vJPIeNdItdqAD4+mUzKFMz17EYjnVjPWlCFng3mO6TkjBHFgKE2z/DtaJTMdRRB7wYi0e6X55+0mDouvmxH0mNZdWlK8KpeHsn4qea3SVHH789NiGYvMRbgxGgEs9HhoBchpL2y/Ze3vFkHCzIRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093567; c=relaxed/simple;
	bh=mpxFsJPbxLy7MF3Zc+LNXJvrkC/mKhBR9yUfibMjX2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FJccQ42jJYyq5S3tPC0sFAh/1gUd0dvJj1OUf2zXmxb/5IZvJpYbq/fQO9kWfJ9HUDP9f8KFlWTK3DTkOfpCSUrNJbjI71btSTbRZJB2y3eKckkA9Abmo1ZYfC/akqfpRRIgsG02rZjpkshULk11WtY2WtAEFuRKp6UOiObRK+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+6liKtm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+6liKtm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B211F000FF;
	Fri, 11 Sep 2026 02:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093566;
	bh=rVbi0b0eQhgBv6IQCthAkkykdRRJRkQpxuJwNS5TX6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j+6liKtmY9yrV+eq30LddO2aF2VaK5aVjW/6oixuc7GgJm9nth+lSbCVDXaSjeY7z
	 g8Pa44Iywtid9ocunFnGJO6yPb2lgXoyOhfubZDaWAsCZg3/BMIJ/JZneJtbXfwOQG
	 na68wVThD2cCBgE194nGr3769pqxfI7Yn0RMeQuxOaajRmTMTs8jLrHPnIRiYi4Yrv
	 h7o89EHklBOh2UQPmP0TVWvJTh1hnx9663/Pbd6N4gyN4RFD/kwZajg8+IbLR//GXo
	 DxVtRsD1GsCJ7eCJxv2SngZaVZxJtRx12wyXpub9RFCeKAwGiVU7pVs15qcwNbShpM
	 ZumQVBhazlaMw==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gourav Kumar <gouravk@qti.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: ubwcg: Add Nord UBWC config
Date: Thu, 10 Sep 2026 21:25:43 -0500
Message-ID: <178909353847.920241.13640322776596541718.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
References: <20260903014309.314962-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 03 Sep 2026 09:43:09 +0800, Shawn Guo wrote:
> Map qcom,nord to glymur_data in qcom_ubwc_configs[], since Nord shares
> Glymur's UBWC capabilities.
> 
> 

Applied, thanks!

[1/1] soc: qcom: ubwcg: Add Nord UBWC config
      commit: f9f690d2559df2b33f039e4de3bcd87952fb4a43

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
