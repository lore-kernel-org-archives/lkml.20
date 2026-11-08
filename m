Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169373;
	b=JCLdSagF8HxeG3ilthzhBuQZ2X9Xxjuzg2E2GAtm55MJoeV+nE2JrSvRJNkAMyXA3h7Q
	 lcJuMysyqo4+NVr7hvgUR384/iQIhwCZx0J3250VGks+w7U5Yk8H/rPQ+uV6H7qXUa+Wm
	 xupMM0fSx3RB0hLHGRpGwxi+mIzFoNrFsiWd7PC4ow2LbrQwR2T3BP6yfvz+lsvb/RvgE
	 u6LuveCh/5eH6FoEhbwjEMgM5tAUGrrsM99fFTwDqqUQaVxA2+2MThK0PCBygyOqX79mO
	 MY/DnKGAVueUnXT4MDCKA9VS6SgWHHrszLWvqBneO1f7Hv1TTEHdoFNp81Sq9pQQ/1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169373;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=p7WDi4J3BaaoDlmRYlpEKF1Z7u9lZhsCUSzEymvpXW0=;
	b=3gL08p497OGsjtuRT97fXcHLl8SKLBQbq9Ayy1TY96ZBGMZL24xCWGO99cnN4dxaWZmF
	 2iGDnF15WMRPzoHQSydBlMq6sHcLfEGD8jnPwkLqwAViZVapOi8Q2muFw+37pSL79LHk5
	 8c3bMCCNZG5w8rq60p0MeGEYNnhMVD66qYnb7zObl9iYb0ITD3+feIEP0g6rhAnGwu+ey
	 /wOxabTXNOKrmmNE/ilmsQnWZj5UTf4iO1/DuQlDakyPpgJ4rtYtmwm1yBO7eA3PZwzDc
	 BMq/mXacc9I6cwRppOVpVOkvuViMYCHxT3nGaUOX9INqsw9LxPv+nI5NcoAxfd3fAoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPV0j0iH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2F7606A33D;
	Sun,  8 Nov 2026 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPV0j0iH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C2B1F008A3;
	Sun,  8 Nov 2026 20:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169373;
	bh=p7WDi4J3BaaoDlmRYlpEKF1Z7u9lZhsCUSzEymvpXW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hPV0j0iHWCaO/hPw6eNhThoLb+wiwUp5pszcWTRfUH0dx9Mf1aRGnKy2g7ONGlyk/
	 dY7cRrDr97OzyWSVD/xa/NOdJvWVoLSLsAjVplsKwvfRty+LytOzc/7nbj8+d+RqBq
	 pcJVPBAkfsn/y4s0CiKyy6/Ettrz+3O1Z6ifvAf8YVjt6ZzsaFmRFMuMUlQIhtWJzt
	 3ymgm5GjKVZSh7sk0cvB9S+qF7oFig4tc/Z9cYTAdF/VMk9L+HRR3T+LWhVHEil+Gg
	 530eyzOKvaN/i4thu3WYGvSSEK7ZSza+6H7DkeY36ZTRHE0leJO64PVm9FuLRH8Gc0
	 xUrMCSFCtDUmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/2] arm64: dts: qcom: Add Kalambo SoC and CRD
Date: Sun,  8 Nov 2026 14:19:49 -0600
Message-ID: <179416929409.628393.10887631985173736936.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
References: <20261016-b4-kalambo-crd-v9-0-11e6a40b68e2@oss.qualcomm.com>
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


On Fri, 16 Oct 2026 03:30:21 -0700, Gopikrishna Garmidi wrote:
> Qualcomm Kalambo SoC is derived from Mahua SoC with CPU cluster 0
> removed, leaving only cluster 1 present.
> 
> This series documents the board compatibles and adds the SoC and
> Compute Reference Device (CRD) device trees.

Applied, thanks!

[1/2] arm64: dts: qcom: Add Kalambo SoC
      commit: 5200756cf5af4aa463b5d9537947ba195e43c112
[2/2] arm64: dts: qcom: Add Kalambo CRD
      commit: b3474dad57457dd3bfbf9035fd61faf421b73523

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
