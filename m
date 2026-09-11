Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9798529CB52;
	Fri, 11 Sep 2026 04:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102709; cv=none; b=CgIxEBf++wNAmWESS1EK3rA+sqcrAZqgsE/dj6gI2kzFAASEtrj5DTVtCFT1+gNrwrVRuYFjJQfbbt5wP1MWDXg1MVRNaCPqr2aOowG/HauZV4NRxqqgPzX+nZ1AKC1faS+SVzbCs3W3/AqbLGuMhvMJ25DMaEOsBuvRPDHyv5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102709; c=relaxed/simple;
	bh=YbTD7ZvjICLnOMZouevrosX0x6n5gp1CMS4Z67cg3s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SuzYRCBaRg4gI54WEcmePWlFaaxMO5USIYjxFNMeaMugRURLzyoLvs9neuVC4//LXCKEWTHipi10oHUrSwjNSPO1xF4SJ50FBt3wiP9zy6QwaV1VK/nwbYFkOxm72t9N+5y0Ggx51DRCtQuyj7tYSvFmCv5gcaykw07HmUiuCb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkT9GtIe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkT9GtIe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108661F000FF;
	Fri, 11 Sep 2026 04:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789102708;
	bh=aLqxTeSnQobvdCEGtaeTkZeBUBwbrUwGUXS2ptHFEDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HkT9GtIeLDYfAdNhhNSBao9djOyWTM6uAswIJ5GWrdz2oBBcTbE79O/Mt6SMYtL3L
	 eHd/lLMZGYndd5fHpgQi76sJ8+iRHeKEtIs1gtmuFLkVuBmy9HGtfP/sVvifg5r3Fy
	 NtV40dQudjHXiFmJi8ZXD5ZGAWCG9T2J3Y475muiMivLg0t3r5+/P329BKMgH1TPVe
	 6g51IX8yiKSQ1kC2Y4iboQsdpFBu1vIVryh1l3U6viqfEOam0tbOwe6X4eICGuCRMu
	 mrU6xgMme/BMN6h+m9ZuSy8vuE6K0qa9VZF1idNui/9DGyvSIDQALL4nYwE1RuFOXl
	 feGAib3j2b7SA==
Date: Fri, 11 Sep 2026 06:58:21 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH 01/34] ARM: dts: qcom: sdx55: Fix PCIe wake GPIO polarity
Message-ID: <egwl6g7mmmfhnl7bbaiooeiolpnbx5obyewjh2zkuvu4o3nvyo@4xpn7im7lxv7>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-1-90a252ddbbfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910-root_port-v1-1-90a252ddbbfa@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 06:58:50PM +0530, Krishna Chaitanya Chundru wrote:

s/wake/WAKE# in subject

- Mani

-- 
மணிவண்ணன் சதாசிவம்
