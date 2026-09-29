Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3BD47208A;
	Tue, 29 Sep 2026 03:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651796; cv=none; b=DU1aHAB5sIIGtbbjv/UkGhAYimuLUCz2J2ddQIc8CzUBuSb1K3pB8pLUDhYCzi7z3p6WTjPFrXy7Jy++hHhQZAjQ+VIhtLE0+rxzm5rs1MBgmhmOJtTdL3ASoQNQ5iCrKsBFanApSVea2c5mIQjWgtKaJs2dd9rhd639tW+C0mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651796; c=relaxed/simple;
	bh=J+jSlNxmRWIQm9DJ3sYv4y60ayQm/2LWh0DdUMnDp5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJtGsigk4JO20dKfYnRACJQjumvrQWWBGd2QebKRpuPYasjyypWUzQYXmkXI5u6D2qtr1k7LEWXC5KbziMmUkKvspMJu1PcfQrR62bHYtgv6fQrrFTO6rgcTFm2ddwDAGi+a/PjsbagvURE8I9A8UI9YH0+mRAwMdmT/bygHlec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwi6GH6X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwi6GH6X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761CD1F0089B;
	Tue, 29 Sep 2026 03:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651787;
	bh=hMX4oUfVUr5V+ZbSjAuqEnuRYqRTPUw45j36DHIW03c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dwi6GH6XQAntdEGa6R1hVqYq/R54A/Sygh76qdt2mAYPYkW++PCljkso1VeFTYIJP
	 kP6nlCgb7+n5JHk5dOtByQ4cEVRY8Qb2S381cWFzf3Kz9eAoxK4Sn+sWZF57t4/wzU
	 ya8HhLpJO/K1DPShjeKepyDzMDbDgV/t8Znsh5cHsnD4Pp+JBg509RcZH0Z2CkTeIU
	 i9nEfja4sVN9Ms6cRAq8E5tUA++0CKgBraXU36PT+ABRqBFz+sRgf5I9QTxUrTgcwF
	 d1/Pg+GMOOMdSJJLtLGuBDDaQTY3I/JsmS0X3D26++nueEkgUpMeUm0+9B0lPM8pgf
	 h9LIaFxPzVUeg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: add reset to SDHC
Date: Mon, 28 Sep 2026 22:15:15 -0500
Message-ID: <179065171024.2673486.15370884485746687859.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925191706.1579990-1-robert.marko@sartura.hr>
References: <20260925191706.1579990-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Sep 2026 21:16:34 +0200, Robert Marko wrote:
> Add reset to SDHCI controller so it can be reset to avoid timeout issues
> after software reset due to bootloader set configuration.

Applied, thanks!

[1/1] arm64: dts: qcom: ipq9574: add reset to SDHC
      commit: 8a8e78e4667264fa680b37c1b6ae6caa75bb735c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
