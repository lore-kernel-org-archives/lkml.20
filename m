Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169471;
	b=k6ZMJ9QxbSGTsr340XwCXDSQdns/rvwLGZT0Enf4IMzlJv1rmDn91+AkcR7LpHb2VoDe
	 Z0BN358YCmBQdhVPhAdl/JFddhSVANJWfuVDrbvAe1iyGU4D+6P/wYJg82q+5bjmVGOBw
	 gnk4So94h7idUulH5T2teFIeJWQTv7g3nT2y/LXYg9T1fv+8qpIkcTuDpqasBJHKszCMp
	 n1tolxwJWAFqdtOyc8tmXzUiCRfqL6z4DZ0e5FNPM66oZ8jDPzCismM4rxrS+/Zy3Jg8S
	 7kz9pF4lcKbcdPMe6+VGJ8jR2i6Db7aDSQZatiBWCAI8SETjE97wsWm5F7aEIu2JAzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169471;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SNHbRrHlscvHCkYoqUCmKrf39a7siHdxMQNb9fFGUAU=;
	b=uztBAKjMFvnudhiXaz/Ng7eU8x+JkcBKcvOdqeSJIV/RXM4vAyepI+U1FJmRwcJTkQZt
	 EY5vtouF86lGmTNSs+bCmLF6JvRlReA6cY+ad5NXH/kzVy8WDeYceDlaW5Qsr4p61PIJd
	 mSi96ImUqMKV5NSSNFNYS+uz81HcorQgxhynqDplfJv0gdvakdc1/uISR4zFnirWSrj6g
	 b7oOrERozGNhPBSgyZNnAougCWebPpLGhaca9JESqzV26+ladCxO7bKUNX03SF/QSzSjI
	 oPq346/Sbwf4GSigujd8Off81j2P3ZRMnJnAw7FCWMvlz2mHqRLZB/kzDek1VZPWVhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kpk2ZWgS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1193607BB0D;
	Sun,  8 Nov 2026 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kpk2ZWgS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78141F008BE;
	Sun,  8 Nov 2026 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169470;
	bh=SNHbRrHlscvHCkYoqUCmKrf39a7siHdxMQNb9fFGUAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kpk2ZWgSsAg+Tl5bjWN/xBRYNYLAguiuZqykIr4DtVpnG/6QCQPSqjaFPL03naBAk
	 Y7RnPbDKXVafqj0TtoAIN6h+RVKNqvVeHL3t/eCs1z2y4ypk6aeU8zR5bxodEccKE/
	 2DYd6uuA7XuqI74l3fu0LNl8G89Y9N7rsS42FksM1285+X3dvOpyuI0c70t0CKOqhP
	 Gxp3hm44nidlfXZEoYK5IzEMyvjhFBoenH0v1tuDswlxOKeMif87bmqQWfAVhkMvlG
	 8QpDOio5j4Lq21dLk5N1/OKz2Bds8nmu1XCJc/y0n66hzmA3lBA5hEmw+M7JslcSy6
	 bYJaY8KSSVBdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
	Jack Pham <jack.pham@oss.qualcomm.com>,
	Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/1] arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB controllers
Date: Sun,  8 Nov 2026 14:21:03 -0600
Message-ID: <179416929405.628393.6125566619525822663.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
References: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
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


On Fri, 16 Oct 2026 02:13:36 -0700, Peter Chen wrote:
> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Without this bit setting, USB2 HS device cannot be reset after it is
> runtime resumed. For example, after:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Set snps,resume-hs-terminations for USB controllers
      commit: 45cf7caf54392c64d1046b88cc9ffcfdf52af968

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
