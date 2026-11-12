Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482414;
	b=NbbvB6KYQtqn5npQ7JL4FyHRiMT+f1taLknnZAYMQQwOCibcO42PdX5+ibwXc1IvmPLR
	 SWJlcoC7/WBsK5713xgR9RrONTKETtyh8JGNUPdi3IohRu6DsWiaMDC1ZygqWJMJMvZtg
	 Z2o0j5SBnjqGbpbx8rfuKTRNi4Yyy6nx+6CuWreKHMFfQFF5Y3/E+CAw8sHsBwpy/fj9S
	 Qlp+NcWNO34hpWPz7YXOiq0drcnBPWizzpcddB32ktLqNoiKtXlgsgSp74G/RbooJ71Ba
	 fe5lJ33UaVwggv1BMsM/rXkGq4XoSMA9ZPaLxQjcy6hEHwDwPCyY5j/5z1CW5Ik6UOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482414;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=M92eLyM5Sw0gwYUIgBq4EZJwQthDYZqVWWHI2GtVQoQ=;
	b=MFqh1myGGU4RJVJ7mD0SoVJB/dNX5urohbGzQdAtNNWxebMoIbT1u/V0o6XK5g29Hb/j
	 Ggg/9QgZyzSKXB0Ls5Eh3YF7gcAo0mY21bSSmsSLWM3M03nQqcE6IJV22cpiwm+n5sdv2
	 giFV4BKpWpGOl+U/H1XPUaMRIZIahlJQ9DrKS0xW2ThSYqFJN9oUl23aKpXYwUdwLI8AJ
	 /u9iFBQlCKQfjeAEQJBmSR2h2j4/IaRsMmtr3B2hIkJwMMQkaockt4Z6MxMc1veidmd+r
	 ptusHgCI41DW6WyAgca2YqhRhanwfM57ecC7j7F5wJcFEZT3c2Qr3oym1E1eTw8Rgzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q/VXGkMM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2890B606A323;
	Thu, 12 Nov 2026 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q/VXGkMM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667351F00A05;
	Thu, 12 Nov 2026 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482413;
	bh=M92eLyM5Sw0gwYUIgBq4EZJwQthDYZqVWWHI2GtVQoQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q/VXGkMMwSnZU5/vlXZvG4MwejYzQM7DZIAWt/7/U+a8QqpWaBrajY76Dxnww3yhV
	 xthV+dAbeP+4qv/0T1NrDe66Qzt9Kp29SQ6HtOF7ORMY/lY14fptdEWKZjGtA/rfEH
	 cxZoYSXZaQx9DeZqtFlaXjoDZIw5u5DKb5/2SISwfFBLd+nemAaWUxrpaGrDg71nOH
	 GJPuej9zqV/bAhSMhDtGyMpwgqxKksqdMpbK51evE8z9HsPCFnoYEsGrGNtaAzIRhD
	 /ELEZ11+ZtSa6A4FB60SZ4vSxzURR6p/CW6GJVraqpqmW5IBEh9W11BndjKs2rrCYH
	 55Gbb1WKeY48Q==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20261112-smb-repeater-power-leakage-v2-1-0f8ee55c4962@oss.qualcomm.com>
References: <20261112-smb-repeater-power-leakage-v2-1-0f8ee55c4962@oss.qualcomm.com>
Subject: Re: [PATCH v2] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB
 Power leakage issue
Message-Id: <179448241104.492462.10336704424380926541.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:50:11 +0530
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 12 Nov 2026 14:07:15 +0530, Krishna Kurapati wrote:
> On Glymur, it is observed that although the exit call is done, there is a
> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
> well). As per recommendation of HW team, disable the repeater during the
> exit call to prevent this power leakage.
> 
> 

Applied, thanks!

[1/1] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power leakage issue
      commit: a6d71ecf65b357ae036012bc84b313b2e4fff679

Best regards,
-- 
~Vinod


