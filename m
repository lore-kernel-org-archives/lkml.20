Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703C648AE1F;
	Mon, 12 Oct 2026 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808828; cv=none; b=d1zvGFdXVABvF99F22mRCRlxZEVpruMnhzlg5Rtm8LGzaSmkaRVPPX9llPvhskIrJlnqZ5JHNSzUx6EwDaCjIoyth+KpoV/xcfktPOy5rtH11zrVWB2XZbzq+9W1q3Q8BBznBRwbNcSiqdDPJkoCO7lZwc+w8G9LHGh39T5gT/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808828; c=relaxed/simple;
	bh=hvb3TFwNxh/T/pw7unUD0ynrzvyRbUIaJfQovwxh60c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UuJwWLWHSOOiG+UMFAq46JMz30dKsW81WohfU8hja1o3V450m7jy5rHhpHoAO3aWIlaS3OLjqsFKe98Ft8RCHG9TRmv1Q8ExFGseYP2xLu3kbwJdkIOtKz8socUegpWiOgaU/xIkq7Hq8Mriunet1KtgtNU2mRgY3Gy6HJkE7Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjbjvcRK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjbjvcRK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF8E1F0089C;
	Mon, 12 Oct 2026 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791808827;
	bh=P/TSl1L8Ht05edTVfaYU2gcLLw2yVPD8qW5aGHbpt+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SjbjvcRKipBBWw0CRdCQ7BpsJ/7ONN/xm8d2bSyKhb8TSPtqOzwgQoUBa6SyyWT47
	 XQKRVA4hL/W5ntVqFnbBjNNR1NMg+MVkfwEG/JH/5hSaFU3wfnxQmjddwc1AL+XklQ
	 LtiELTLMsU34PVLtI1CLpaWaU6I93Yi8fMKLapgbYuu8WHQWoefjidoORiIz/8GuaC
	 8m6l9ONcoLg3oomFfUbpFIhVvd3yLtbo5yVwzHHcg1y4VTXBgureCRiqd9a0X8c30g
	 2dxbHKpBDHutVPOy6QQyKLdCy3MCbl5orALkobTK0CVxFVJcD6KupKJieV10VtpSt/
	 5hvuKBME6nOMA==
Date: Mon, 12 Oct 2026 18:10:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Varadarajan Narayanan <quic_varada@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Stanislaw Pal <kuncy7@gmail.com>
Subject: Re: [PATCH v4 05/13] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Refactor init regs table definitions
Message-ID: <aszVD7ngiPeb9FtA@debian>
References: <20260908-ipq5018-usb3-v4-0-b789702f0695@outlook.com>
 <20260908-ipq5018-usb3-v4-5-b789702f0695@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-ipq5018-usb3-v4-5-b789702f0695@outlook.com>

On Tue, Sep 08, 2026 at 01:40:58PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Refactor the IPQ5018/IPQ5332 UNIPHY PCIe init data by introducing a
> helper macro for register/value entries and converting open-coded struct
> initializers to the compact form.
> 
> No functional change intended.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Stanislaw Pal <kuncy7@gmail.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
