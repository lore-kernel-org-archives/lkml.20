Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0014E3A9631;
	Sun, 30 Aug 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082982; cv=none; b=CdAqJjpSfR2fppOgW+8kNehbK1eXH1fpTpdMutDx7t7nGz6BZqtftB1v33OUoklpSac0o151/LKAZoBtJSVC8xtUCNU7lnzXek17AXhJCMOmx0el5/SgcdFZGc5aNYEzz41K7xfdtS1ld7xSDCsyQP/Vt2IHqFH140yDy5PPtyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082982; c=relaxed/simple;
	bh=e6Q0w8FJOUBWAQuSBaiTnBEiYjdsjgdLxFaRxl7MeVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNl6c1lXZs13pRwwDUa8QZScuTCT+fgVVzg1q8MTjTSKu8fBXsuCEup95kUBjPn6Qn3uQqQVW0B4YQIPlADhBCJnHnUTCOB541pt1fs5NaGhsP3OxvOSM47wh4UKmoMr6f/t0iyRx1rfDTI/oUqF/TcbOoUnSThqdFRX0UEg9Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mz2IqBJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mz2IqBJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4381F000E9;
	Sun, 30 Aug 2026 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788082979;
	bh=KSzrSUzfrVyz+3h5TAg7uiKzQIyKJXzhhPFii6440X4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mz2IqBJzIytQ9vMUd4C28TDgR4Qg4nlAV18vUV1gxriuK+c7OClRlu74v4EuhbIfS
	 wpjxgA0gqEmVuZboqWfWix3iKJkE1xUfKrXQH6AMtO9wQ6tqUENMr1HedEuGNjGKyh
	 OqV56xTOjCb7tax0pMPGHJw0igRiFB3Y86riMxSW8szbzxTAUf9WtSV29bKf6X0SAE
	 QPfTTGVE3l62n998IcD1+nSP86Fek6F/+k+m9w09cATZIuzCiWkXjYM6NlKU8UYIK0
	 vVcOf03qM2og+k8fL6zm6tvkxg2yc+GS8MslTp509glWp4r/8NgiYwuOAY0ik3CFSf
	 6Huv74fPC1j2Q==
Date: Sun, 30 Aug 2026 11:42:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH 2/9] usb: dwc3: core: Allow glue layer to pass reference
 clock
Message-ID: <20260830-fragrant-jolly-snail-eadb92@quoll>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-2-5c1f3170bbe9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825-ipq-flatten-usb-v1-2-5c1f3170bbe9@outlook.com>

On Tue, Aug 25, 2026 at 02:42:27PM +0400, George Moussalem wrote:
> Add ability to pass a reference clock from the glue layer to the DWC3
> core driver. The core calculates the reference clock period and frame
> length adjustment based on the reference clock rate.
> 
> In the flattened snsp-dwc3 model, it is currently not possible to pass a
> reference clock that differs from the default since:
> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
> 
> The new glue layers (incl. Qualcomm's) set the ignore_clocks_and_resets
> flag in dwc3_probe_data to true, which disables the core driver's clock
> management, thus it also doesn't acquire the reference clock from the
> devicetree needed in dwc3_ref_clk_period.
> 
> There's an existing DT property 'snps,quirk-ref-clk-period-ns', but

Where? git grep gave me zero results.

Best regards,
Krzysztof

