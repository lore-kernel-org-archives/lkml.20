Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169524;
	b=ZoikITUxYYfhMDaMO3Tk055kgPD9xtq4UNJwfa78EYGITKzWQQbH/1QEE3JoXMzWE2Bi
	 59qn3Vfxk8BrvTm52r8Yg4lFRorn6dfcLO1CGtkXN1Cb4T8fLu9q1cB+OybZ6/MdIqPDq
	 veS+kuWHB5jCWeETp1LJTqnhfDCW4tmnGojefX8oh4RXK+TBB3GZ9nCwvzwmwUJK4tugg
	 QqJcx0Zw03+1PPx4moSTQlKf93A0+9wucl8H/OK7TA4/XWhTHGQjfEtH3C94B8fEHCc50
	 ZoW8Mj5pVCm9EXZ8U5rs2jmV9viFpBIZV1qJOSyxocl/ZCm7shXX9k79elXXhtXJOng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169524;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=h+YBdfasWpLm6Da4YFjegeB5DsXOdDZJeYTsCIItuZk=;
	b=INbnx7ql87ScLfas3W7n65fXIzRyQUbc5KAmJYBSVaSdJQKecNgppptn0s3CUaqY1uve
	 szh7kF0ftdRP1O+6IVZjbiLUQ3EBXQjgObO0FNFvQuhTtMA2wJmwNxpwFRkLnlMafZ2ve
	 3Ylv0IImzChw4sdNWPXQXEMTGVZBAQSBqqQ88IOeRkj7uHX9cmWmcv7XnvunMrMGV2CvP
	 6zRwns373HN7XsiEe9NrG/VvWcLxobHnay87ayDbrDpzpaRIp05zaMGd/vD4sJmt+TDSS
	 q0XA2ImoBmnR6ppf7QYQaB9Tn+vnyBoV4wzvCD5A48M6LxmfSKo7ZqFGkfGNoDznPBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jgg9ZHRt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE6E606B11E;
	Sun,  8 Nov 2026 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jgg9ZHRt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931D21F0089F;
	Sun,  8 Nov 2026 20:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169524;
	bh=h+YBdfasWpLm6Da4YFjegeB5DsXOdDZJeYTsCIItuZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jgg9ZHRtp2aFb1ctTf+1WzewU4bqbjl6oJzdo5K92bObWbIna6Gk+KnT/QhnrUXxn
	 wHgdcERK1g12NFpxAU2P0XcitIojeBmVSER1cVH3HEbLlPmQhI5AKQ00zKxzydkFtw
	 KoEvodnpAO5y1SBaCTflFDyQG0wvwcblYKREkjc12BSxOZJBts/l9bzsAw2YOTACrx
	 v605wfx5Ee3AM/TYoQVcEujpYWjmCmXFhadXPAEKyy5xx9c2KI3UDdF9jBjc2e2C+N
	 BLxOQDE4Jeu1GSNuHG8cJiu0hQDuIrT0J3N81mBrHACz9JQfIma7SfYAvzUC19X5cT
	 tRR5OadNErIfQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cheng.jiang@oss.qualcomm.com,
	wei.deng@oss.qualcomm.com,
	shuai.zhang@oss.qualcomm.com,
	xiuzhuo.shang@oss.qualcomm.com,
	jinwang.li@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO polarity
Date: Sun,  8 Nov 2026 14:21:41 -0600
Message-ID: <179416929520.628393.9104719158063560519.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030030906.3856759-1-zhiyuan.sheng@oss.qualcomm.com>
References: <20261030030906.3856759-1-zhiyuan.sheng@oss.qualcomm.com>
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


On Fri, 30 Oct 2026 11:09:06 +0800, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.

Applied, thanks!

[1/1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO polarity
      commit: cfd8ac5860d6f528239121aa5bb87d6ed8c20d7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
