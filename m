Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D939E370AC7;
	Thu, 10 Sep 2026 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055690; cv=none; b=SbKIy8MOpB7zydWKU1H5UpY+5ArxsVQI/9zbDkjzL19QbRsAtsBcE2WJtMuxeE6yAeldscN0hwvYiEJ8/N+Us39G5WPdpjndCLXwCWQMz4MmNx6CxDITMjbLBrzM1MGSE1OzoJiqTVj2a9ezXaFPK0TK1rNJQs53AMK2tSKZ2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055690; c=relaxed/simple;
	bh=s4NxqGr92//qftnkj5zRR/Qf6BqQ+nrrPC3g/KXwSSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGSnNrXUZ+fLX80gkGqmUZyDFiV2vVW7GLmuL0PqZ6ADIj9QUNOxUuYGG8KCxdyQFmpSQIOAOKFuPu/De5IdJz9RLYWJvndc9BC6HoKSdHeC3GU+5xHi6XAcLpDs2iKQbIjLN6ZVObjE5bKMVUwhZLeR0DOOMhvkD8JWH4NQxUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6QOWOJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6QOWOJl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053EB1F000FF;
	Thu, 10 Sep 2026 15:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789055688;
	bh=8Ir4e4Bkn9QSvVke1gYnJgn7j7+VZiljQgG+/MkuFlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j6QOWOJl058EJayNWTugQ409V7kiLnUtRK8qWpS79NarH4tBpNxrnMx0nC/OQYzw2
	 rCUt33ymW67yR5sgcpQY1QPcC6PInmKYZwO/P/cSokTNkx6rIWvalEltpbA45LuRFu
	 DC/2oxiqnnXy0/TFLDHWA6MUUA8GJpYKumjaMDZvNSGLRSCB7Sp2T0RYusCg6vDzpr
	 dCTRK1IplImdXmIgBJLYYaJQzM37ntlfamk6i6zeedH/ldvFaJDpYjoe5T+XfuGLXc
	 1YHc6mPajYx/Gn4VV1+og8vbc1ejigfPi/9ya+RRlwbXbIuYZO15+aRuqcTZ1MfIgv
	 XLbO3qLl8XIyA==
Date: Thu, 10 Sep 2026 17:54:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Message-ID: <rrhij7mn6fx7y4m7g73q2dtwkmsvsx4cektplhkcq6zwhvw2zc@bb7d7dqnavfo>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <20260905-eusb2-interrupt-v7-v7-2-820cf5377a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-2-820cf5377a70@oss.qualcomm.com>

On Sat, Sep 05, 2026 at 08:59:06PM +0530, Krishna Kurapati wrote:
> In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
> required to know the type of phy (rather than the operating mode) because
> DP and DM interrupt lines need to be configured differently for each of
> them.
> 
> Add support to cache the PHY_TYPE and add the following helpers:
> 
> - phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
> declare what type of PHY they are (in this case PHY_TYPE_EUSB2).
> 
> - phy_get_type() for the consumers (like USB controllers) to query the
> type of phy connected to them.
> 
> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
