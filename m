Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF4754705E;
	Mon, 28 Sep 2026 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790561887; cv=none; b=hYMoBiensBGyADxfxOIVIYofZdeZeZ3kT2LPkEQBuSvElYF220k2GVyqOC2QO5GJWlyQXKY9zsr+Z+NWfzwrbFdM+NwgMW7PtyWhBmCLCeQyUwMhT2+AIaxk39oHYrt8toONHmcUDa6oyrSvw9qc9DE/4pihgStsUDIM8TcVEFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790561887; c=relaxed/simple;
	bh=Q2e7tvCSmxghMOKlOOkr5jY8/FJIxvcZFTbXwZQcgWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubvUkUEO11QVQ+IkDbQKyO00rZ6oPXe3asuy18b4u+KE2KUQOlv+7urelszqXRH7y50F0+MJ1sbuJWKozQwCRUjgDqjSXeE/3nhuqfqeM3FnNOybv+FqD05e3oUswSTjHgbjgVlotPGg3iyYWGZY98dEfn2K0fVCCslLktk0dso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlv0o7IQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlv0o7IQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1E51F000FF;
	Mon, 28 Sep 2026 02:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790561886;
	bh=2rq0O6wy5eVrHvoHNVo5PyM4bit3F0zz0yyKUTVD72w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nlv0o7IQqJlNqRXlwC03Ith3X4P2HCiQ4cFz0LHkq0+Xtdl1jG3Jr2hOmjKOMnTon
	 hw884rxrvf9MILGoE5x04TeDYme3xMiz1/xWVj28q88o+AeHnLxsO0t6L3dhdVTx39
	 +XTXBdfjUMwC8IK1NwMau4UhK316owcyqlkoA4d85fRFtPx3zErEnU2fZbfBdWbO8D
	 kpHlG7d4MINWPq0pA3+vh/Jk0iuLgrDHkulOf4+gcsMZrLwWzFYQX8gQolaiFlsz9V
	 ljV/fVp1VUnCQdFtWN9YEffPis46PqlC0td0/xPenKaYK6gAgtQgTHySylHKW6HSTQ
	 LIL/CZONMwSAQ==
Date: Sun, 27 Sep 2026 21:18:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: eliza-cqs-evk: Add storage
 subtypes and rework generic parts
Message-ID: <arnKea0HJJjq9-Pq@zenbook>
References: <20260915-dts-qcom-eliza-add-ufs-variant-v2-0-86d72a2a8f47@oss.qualcomm.com>
 <4acd4d53-a444-4282-9bdd-1f2f2a487239@oss.qualcomm.com>
 <stanm22bnloxjv4kdukrzhl6tmofgiezz2q25rhaurfoh24lp3@ernh7jgxsiou>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <stanm22bnloxjv4kdukrzhl6tmofgiezz2q25rhaurfoh24lp3@ernh7jgxsiou>

On Thu, Sep 24, 2026 at 02:00:11PM +0300, Abel Vesa wrote:
> On 26-09-23 14:59:19, Konrad Dybcio wrote:
> > On 9/15/26 2:03 PM, Abel Vesa wrote:
> > > It turns out there is a UFS variant of the Eliza CQS SoM as well. So lets
> > > differentiate between them with -emmc and -ufs suffixes for DTBs and
> > > compatible strings.
> > > 
> > > Adding -emmc suffix for to the current Eliza CQS SoM and EVK devicetree
> > > files will not affect any current users as these boards have not reached
> > > public use yet.
> > > 
> > > Also, move the sound card support from the eliza-cqs-evk to the generic
> > > eliza-evk, which will allow it to be reused not only by the UFS variant,
> > > but also by the Eliza CQM EVK later on.
> > > 
> > > Changes in v2:
> > > - Actually replace (and remove) the eliza-cqs-evk.dtsi when the
> > >   eliza-cqs-evk-emmc.dtsi is added.
> > > - Collect Krzysztof's R-b tag.
> > > - Link to v1: https://patch.msgid.link/20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > > Abel Vesa (5):
> > >       dt-bindings: arm: qcom: Add more compatible for Eliza EVKs and SoMs
> > >       arm64: dts: qcom: eliza-cqs-evk: Move sound card support to Eliza EVK generic
> > >       arm64: dts: qcom: eliza: Rename existing EVK to suggest eMMC
> > >       arm64: dts: qcom: eliza: Add CQS SoM UFS variant
> > >       arm64: dts: qcom: eliza: Add CQS EVK UFS variant
> > 
> > I was hoping there would be a bit less duplication here..
> > 
> 
> Do you this so that one includes the other and then override ?

It's conceivable that the UFS-variant is a reworked version of the
eMMC-version, in which case that would make sense. It's also
conceivable that they are of equal standing in which case a dtsi with
all the shared pieces are suitable.

It's hard to say from the information provided...

Regards,
Bjorn
