Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1047847252A;
	Fri,  2 Oct 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933291; cv=none; b=qArIDdDd4uy/QwUdIBqejLj4Uv0o1H2lMNsni5O1EGYW5olJLHRNNBVjjOPFLqWqzyYY6OeXpBhME2M8blwV2E9CqFMf0RJCUWnZPLgDnh9KSayh3R6zRkJzoSLRI3Mov6MeyYIL83GrVqRQ0KWWnvGlfEjF0m91kPx2Q3hkGFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933291; c=relaxed/simple;
	bh=GhZLFjWh7++VbgqwiZXUPUiSt5lrvUXbGyf0Uee2g/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtgXIfCqX3PJfw4vUZHuRq0L9GPbotfU7My7z1XhmWzgnTaZ+ER1SAm56sDWU27ucBP/HOFHLStKhPLqDuNZE5k5IlTf3P5jckAXMTVvH5p4sUlA676GlMN9BQxKj23qtypPm5tqrbP9ARh9AzlkTqWzVT7jlQ8FMhB6wVayVw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dHN++6fZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dHN++6fZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE851F00893;
	Fri,  2 Oct 2026 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790933289;
	bh=MdAeds9Rn5ejHFbGOvaWtfpF3b+9skQtlDhRS0wmEHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dHN++6fZVpKjXzePoFtLfLd3/MqlUFPLOW1U1e8dt93RSSSgW1q2neMOPMS3mJaHi
	 pBxoCtzdiDrUe6/lYaZcqjdoEfVUlCUFLCPOmw7rJMglfJFsNmglOaoQkDsQnnQD3c
	 KRW3OOvNq/x6Z8GWn6YcqU+LxZF4rtj9e9CYv9R8=
Date: Fri, 2 Oct 2026 11:28:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Document the Nord
 DWC3 controller
Message-ID: <2026100256-enquirer-glorify-c80a@gregkh>
References: <20260917-nord-usb-dwc3-dt-v2-1-8f88aa30c434@oss.qualcomm.com>
 <CAMRc=Mf=Uw549oV0sAdkEKn0YWGbGs3WJDvwT9QT68Wof_M1jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf=Uw549oV0sAdkEKn0YWGbGs3WJDvwT9QT68Wof_M1jw@mail.gmail.com>

On Fri, Oct 02, 2026 at 11:47:26AM +0300, Bartosz Golaszewski wrote:
> On Thu, 17 Sep 2026 19:07:00 +0200, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> said:
> > Add a compatible for the DWC3 USB controller found on the Qualcomm Nord
> > SoC.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Link: https://lore.kernel.org/r/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Fix the interrupt constraints for Nord: we also require hs_phy_irq
> > - Link to v1: https://lore.kernel.org/all/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com/
> > ---
> 
> Greg: could you please queue this for v7.4?

Sure, now applied, thanks.

greg k-h
