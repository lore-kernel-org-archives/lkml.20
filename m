Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95387358399;
	Tue, 29 Sep 2026 20:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714060; cv=none; b=UX2zP639Z3tryC06IVIfby7aYykoMhON7ZzpuGNvky2xBa7pcoS65WU2zoPyUNU0rMlCZYfM+Itrztkdm8yxaHcVjz3NheFuLfp5PDgGnmt7S3gxEeD5QcFIm6FWbsIMuGA6ARps8KZEytVher0cHHUb0ANRfVDQckEjsC2/j6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714060; c=relaxed/simple;
	bh=Qcc3CuiGR8F6BmSpgb/iA2D6hQ3P7hKSHh4btT7sfx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gJDaDQcnEb9nJNuCd91XHZ5fbyxfDTp/u8zPhTCssL93MEBLrNxRBf3jzEzSUKP4KGqz3cuCVwbKHhztzkFFxNHrNYeG7u39EJkQSSgDHTGSOVJhF0Cf3Q1TPJr+OYOaPqbRqaaLXKRtFr6VfxC42Cz6USrXLOLMHZiZUmAq4+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSrp1J4+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSrp1J4+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22821F000FF;
	Tue, 29 Sep 2026 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714059;
	bh=0glIlyA2h3h7vHM0aS45Ph4Kslhdwq+2jFa+9j6F0C4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VSrp1J4+eEuBOkKZwyL8dxlRgHIaWOVFs9j0Y5+lY2hGp77+Qde85w5OmsREoX2Qs
	 MbNIUfhOoLdmDiVdCp4CMmtEYf2irhAS55/MPS9Ei9yis8+FEj+uG2/OyZi65taeu6
	 G3/2xrH8H3rA1p6zpP5EjW9qcQ1P9hVvKKQM5DZ0l6ZfdBedMo53MsANB4prI9DIc3
	 9xz+dHNy7mIAt/i8J6bvXQUJYaqrRiNf8vYXbL0xZQfGEDuZrTxIPoiuxM5g3WqmnX
	 FaEsfVIhB4udSP1vbsPA3latEdYQ26bVg+2CKaJfQ7KbodFUbocid0mxr6KGG0xqfv
	 rzK+2R0lUROYw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	kernel@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yijie Yang <yijie.yang@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Maili SoC
Date: Tue, 29 Sep 2026 15:34:12 -0500
Message-ID: <179071404932.2903617.5656557809470041633.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Aug 2026 20:53:44 -0700, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".

Applied, thanks!

[1/1] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Maili SoC
      commit: 769ff2033eb181cd87564aa41d3a3979e9e55377

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
