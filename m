Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1EE340A47;
	Sun, 30 Aug 2026 09:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788083438; cv=none; b=PG4akW8TfnCucaz+nlfc2lAnldHCx/pSfqQyg2De3p3D3sE3gO9pd2599FMNFdRnlEv3F+KHJ+V/Ms93xpBgYdGpG1Xj1bUtEyAF4yTmKB5Pz5esqh0tkme+nVojqawR9JUm68BfUpRIN6iHXVs0F4vhcC31G9g4f+qbeDHV3gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788083438; c=relaxed/simple;
	bh=n8JNqEz6Rv/9hhnk0QiRELTnfG3TVYjuVkxC24GK+GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhs27Xo4ENSV9CB/FlDac/r7oVoE6CLYeAGNmACHzHu2RJaVzJO/ndIqhUrzGq4vqqAulXjIkbLr24mJHbdAuD1QFLp0dmQxrJNa1feyzMyCqcA+E23BYA3GMvfqApXk9EWbWEMuhtn6ydbKDDqcc9tBIwixyqCiT2yym7jm5nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bgzta3yB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bgzta3yB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7461F000E9;
	Sun, 30 Aug 2026 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788083437;
	bh=FYIfK3uTkNCT+KVZTnBM/k5ekM0A7fNCMCiGAvjFqVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bgzta3yB5Kc4FdjDdpPuSyRmToIgrAt4Cn/vsD2/opxxWp6r17x0Ciz8B96v+yuPn
	 9ttxB9scgLD5vFo+TazrVVI6kZBRtMhhAzcdtEGsXoXadOftOOZCevSHlNMvO32HW2
	 /a02G/FsEqsRm/9zTUs7dREtKHpqRtWIGqeBHaYiVQK2AkJ20MsD9Z6vY+vJToLqjh
	 mu/matyEEx9hsMR/UrK8vZfS0OKIOQB1SxQbSwRlVij4LSHHXzlBI5Rtzp+5nQb7lB
	 8GmOBpbgrpCRQJD165QpyiTUsNem2oU2JWeaB2C/sbc6OMNIUyAf4HosHJxP8osAv5
	 4LiBgKvz6fupw==
Date: Sun, 30 Aug 2026 11:50:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bharath Kumar <bkumar@qti.qualcomm.com>, Chenna Kesava Raju <chennak@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] misc: fastrpc: Add extended IOVA mapping support
Message-ID: <20260830-hilarious-controversial-boa-bbcb1d@quoll>
References: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>

On Wed, Aug 26, 2026 at 07:15:42PM +0530, Vinayak Katoch wrote:
> 
> - Two new UAPI flags (FASTRPC_MAP_FD_EXTENDED and
>   FASTRPC_MAP_FD_DELAYED_EXTENDED) allow userspace to request extended
>   mapping. When set, fastrpc_map_attach() iterates cctx->ext_cb[] and
>   retries on -ENOMEM, falling over to the next extended CB if one
>   exhausts its IOVA space. The SID offset is corrected per-CB so the
>   IOVA forwarded to the DSP is valid.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
> Vinayak Katoch (6):
>       dt-bindings: misc: fastrpc: Add memory-region property for context bank
>       misc: fastrpc: Handle multi-cell reg in context bank probe
>       arm64: dts: qcom: kaanapali: Add CDSP FastRPC extended context bank
>       arm64: dts: qcom: glymur: Add CDSP FastRPC extended context bank
>       misc: fastrpc: Add extended context bank support
>       misc: fastrpc: Add UAPI flags for extended IOVA mapping

DTS must not be part of misc posting. Please always split it.

Best regards,
Krzysztof

