Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7500C47F2F9;
	Mon, 31 Aug 2026 14:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184808; cv=none; b=FnNjmbJ3ZTY0nq0Y1Ze504JaaW5dTs9nSnHbiF631yd7tHE97W/bEd/uSZiTHstiVw/wcCHmqrPJJnqtx96Pj3MFQ61f91rV1sufZpiUH4mfDVioD8G+i4XHf0WzlQm6nzgxE/5hGCmwB8KjyPsqVTgxJSBCj33KAKcO7j6Gc30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184808; c=relaxed/simple;
	bh=dl7/Eh0kM87J7jB3Hxv3LgDNHGmcEG/yJ0+iQ3BZcuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBAEhvsmSX8BawKA4Qe+SWFgpfY1M292V69LCUPUBXXdzYTTfF31sJaoPANdx2zggaonTYSwtE78E/IkFWtnOWXnTzwTyxGhV/FN4WgctrvqHYv8DTsTtNC/ZzpixiSN/Zu5e7+xwwysNWG8k4fm/1b2RY/80rlc80BdsU5E+LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccsTr9XC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccsTr9XC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA1C1F00A3D;
	Mon, 31 Aug 2026 13:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184806;
	bh=2m8k66Ew9TmOdYozj6yzIlmVibF4BgzdeRDi9qxMbdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ccsTr9XCXkD2qXeOopeFH0mFSzUiXEI0ynyFYWDQUQcvHlaEZwOXJ80LmzZ91cllI
	 AtAyHdxZfn2wCyvo5BzKCCa89hs3cyPfQNLC49hX1ELUT+V0lerPIuOh0xqEcs8O6n
	 dNA+OB2XdOUxPzpi0B3JNWUtAvvL8YQ3dQpgMKFn3gvT5mOcSmDfKUwussq+pFk51Q
	 S2LG+LunMrHeD/C3x/Dy4NIFcgiRb92vfanPl5IKhfnjbxna5w5d0/xEsRJMuz/YIO
	 aFXkFFsLNuy3nwqmotec1Yu4t320QxjS+UMK6EXrj5sp1PJi6IBnP1526JYsvC59ZC
	 I6yf/3uzTOWqQ==
Date: Mon, 31 Aug 2026 15:59:50 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] phy: qcom: Introduce USB support for Maili
Message-ID: <uqb2eabsls4x5ofaw4k7bmwb6ijuyn44yfgopal5d4ottijw6s@ftutwlx2apa4>
References: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>

On Mon, Aug 17, 2026 at 11:16:04PM -0700, Jingyi Wang wrote:
> Add USB PHY support for the Maili SoC. It documents the QMP USB3-DP combo
> PHY and M31 eUSB2 PHY bindings and uses Hawi and SM8750 as respective
> fallbacks.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
