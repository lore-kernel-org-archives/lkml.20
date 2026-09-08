Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8BE52B1CF;
	Tue,  8 Sep 2026 09:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861014; cv=none; b=uNGCh4l7UMwLJ6s3bFPwQLWLSvcFtjMOSc42Mrkl/rhpE2MNGgs0r4Qy1fqKdNqPREIESlUq+fHi0vxQSJcAt3yh+8X60i+EkR0mDAkISVxijVqPKKWIr7xCwLH8oK+b/CKzJBuNwmbLg4HFsWH6CYyJ64a9KpPRZHk3V5r+/qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861014; c=relaxed/simple;
	bh=gG0CYqaB3BBlWKe6dsmyD2vnlZhB7Veq2Ynt8JeOevQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgzJkq5X+hsHOnV3j/3x/YWS7smURcByiPWCKm3whwazXsn9QThZY+mTzvglIg/yzhCjWo6l/elAYZbigFx+T/18dC0f7L3SaSYPpmTPHvjmKRKzN5fCQ/raFG9cfjmKqS1DtDGAf6KAXxDIkXdsspywcHZPXctH3OXXX8KUIeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxUwqzV9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxUwqzV9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABC11F00A3A;
	Tue,  8 Sep 2026 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788861013;
	bh=pOyngVYrItRuLe3u/yuA0H/Ld3sW0yaOzRVeptexYE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FxUwqzV9pyaNtShWLPvMjWVA5HEpu5Ub9FmlIllTLQreh6DS7qrSu8hfJciWclUVd
	 Ad5gj8mwGP6G+4HRp+OWSfuIyQSVLgaRm23zc0vN+7VEc0nLNEjAFRiVTafVoakpfM
	 JDpqNEt3bvhylnCF3pluCauOud2JP5unjMTvr4Orkw5/UNT+hT/v2p6ehYJIxIENiM
	 h45pmRxWFjGH7iLSOOk7L+qZOqCZHKyKvVBJIdHSrkI7qbrDdhy27BO7wvVZO4+eyn
	 ipvrYCjPdee0DYRtxFUQNw4GgnUSfkefWDsWfMoTq2Ciw/m/ptonV3FVA6RGV3XOYF
	 Q18xFkcU2iSWA==
Date: Tue, 8 Sep 2026 11:50:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, 
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com, marek.vasut@mailbox.org
Subject: Re: [PATCH v7 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Message-ID: <20260908-huge-shaggy-cockatoo-52b7a6@quoll>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <d362714624fa5025db50293b1b737d3fa3ce2c49.1788496816.git.nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d362714624fa5025db50293b1b737d3fa3ce2c49.1788496816.git.nas.chung@chipsnmedia.com>

On Fri, Sep 04, 2026 at 03:46:28PM +0900, Nas Chung wrote:
> Add documentation for the Chips&Media Wave6 video codec on NXP i.MX SoCs.
> 
> The hardware contains one control register region and four interface
> register regions for a shared video processing engine. The control region
> manages shared resources such as firmware memory, while each interface
> region has its own MMIO range and interrupt.
> 
> The control region and each interface region are distinct DMA requesters
> and can be associated with separate IOMMU stream IDs. Represent the
> control region as the parent node and the interface register regions as
> child nodes to describe these resources.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../bindings/media/nxp,imx95-vpu.yaml         | 162 ++++++++++++++++++
>  MAINTAINERS                                   |   7 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

