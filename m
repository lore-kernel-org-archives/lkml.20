Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116245;
	b=mAKcZRIPAbRj86zhqmk6Tz08fCDAE8oP4tdqXdSirb3qJQkD4MyeSMtPTUO+g5l32XK/
	 CX5/DOTfP6xJmy2GF7FPfSDcHA5iG8G9nFoUifWDkBfzACAwel7dGuy+pi10qvoKrcWcp
	 1xhnGoxJwr8CwAgLrtC4+WYlf6ZkGMYM7ydvAeiPSuKP4u3zNx8mAKyH8WAxUGs51RnL/
	 i5hJhoH87/zReRDjLGKKdeKDoUYhzbwFzlDLIBxfsyXHDkA2UpS8IKP6FYIOViQ5s2MIe
	 1P2p3c4V6m1d3Dcf3D///2M7k5bFP+LBPaO/5OSjn3j/Zg27wC9Z1u4xu2proh2d0qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
	b=r9/v9TsXabTEO5FNgJF/R7rHrXL0soaIUp8ryTZeMo4eDraB/Hv8eF1f6aJsUYnIuqsa
	 sQ8vwhbE65tUIjVvPFxpShxi7IpqSovmzi2QZgLSWNMEetNL+qv7rSNsAZ8fhk61XnQIc
	 I7BfNw+d4EhNJA5rOywiFnDuKpWahwZC9oVvd/FW664x1PWgJi3aRtJKocNIJu4fHY4ED
	 9DxeBKIiN19QrXqk2Is054sC0B6WrQYQ/VFreDPubEbJEfxQ1WTtSxEWdDqw3M3zJ8FjF
	 GgD+ck4NpONrDBm3imjAbbrF+Ds0JtRsEeAWkQhfE+7uV4yA3Fwp5zm6YeJohUnlxrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AsxhCWZq;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A138606A337
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A138606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AsxhCWZq
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so44558b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793116244; x=1793721044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
        b=AsxhCWZq4ZpcjmjJGMxqpyEK2EsT/+re+Mm5/ZKOT+XhURYz/lucLDPINHDCt4pSHL
         y8vMTuF0oIMUgaGtY7yiuudiOzaAgHrFgXCrk5P6NzZl3LzOLzqGTlOAIQ2+YnuJIQNc
         Xp3e3MKxrOO60WCzQqu1OeIEx8gMlfyi6L5EK7Rpu/239CtGex8R+8WcFOEnHkpkMa6T
         d3jaM76tPpdmntjDZw6fpUGWke91YLa8SkbG1jeIe2IrJHqqgwZwDc38NrBJETdlJfw+
         OR8ISkqd9VP65z0a6z05FEJMEophVw1z/CA93fvhXE13Tch/CsLuM/djhuadgAj74nHt
         iktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116244; x=1793721044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EmMXFW21R4wDDI6QCAxEHbuFnBmRN+vpQa5TJPrlWU=;
        b=gBQM4/6BGgFmt5YM2UShG9cMKsULK6Agk+7pGoT6YKXGWTGVIjblxOrPqrDsWtOB4V
         qIp7PiuLVKHBuIzALmrCWfoNrZrTCzN6DqyMhcLCzsc9p/sDjzwd/0gHK674Kgxp3DcL
         aSG4CyEs29fs493NpzDQuXv1OIk/ZeCg7C6DtA1s2EYRV0aDmNGMQu53DfklT0TYD3HO
         jFKpZFhcIzintf1EpvocyB8qrEF/dm3xn7oBXowCMnhBR0ANo9XapZAEdwJHhCl7AbC5
         YzYzM9lMtXn27x1dD9UPd5pKBzaNn06UmrKSDX6yxR8Y30Gk07Nks9K6e2XPMCW74DpI
         M3sg==
X-Forwarded-Encrypted: i=1; AKwUvBwrkjFVWtFJusFeCkCC/+F9z7tGEH5uikab1ETfo9idX52W7MTKL7Ov4Km8U6u0tdpqjhzslK8L5cyvqnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0V63ZGrZhLf3KF8eb9Llo6VZQp79v12fWVDhgMNH7wf0iHwUM
	npoM2KLrZInhk5Nb6tN9/LdxJvtus6/0E0+0QF7di2h290euc9Qxnrjg9whL+SMSP2Y=
X-Gm-Gg: AYBFou09LGuM+7ZI/Vqrc3vxJJPWLKsm3xBJEEOPsWrLK22cp6isRZfIma4ZXkYuIkx
	q+8Xk3ZieVaFvGGYreyRZwVeqjpzMSeOKSXYHhoZuRNdX+RS6gDFFcPCCbS0/gDS1fw9i/u/DoM
	D8EgL5YaUflfa29zJVxyH3CkSeqXLoOnw4pjXf/fJIS6uZmTDpRcpEYMnzwTNx9GLcQUEwV2KZK
	lZH0IBSNpkY2ZLCPAC668FmD60NAPjX0V5NvDxYOkjxx1YeHtigrM9IwSElT64TQa6IpYYsTO3e
	s6P8j3A2eBxX8xqRVaOomCXxH4DbKQXU4/aXSBqbPFIW0hFTwAIgpxy/rQicrEVNetTmSmjkq6p
	S0dFNRFU9QrhN7K9xvaxk7zYffPyxPO1CZ4PolVCloJywcKmZycKGvnJBh5u6v2Cck5KQysck2g
	Q64GGRQ/rGW40xQh1D5J9gdENzICcRi6q4/GW//pg8KN82aZLa7UzQGUkVZeaZ1URNfj3uzPw0Z
	xyOGBBa3TgRb4gpzXB6dF7Sw6RAp8PeTfi4l1/ZvQBoquG7p12Qet+d26M=
X-Received: by 2002:a05:6300:6bc9:b0:3e1:bd77:2c92 with SMTP id adf61e73a8af0-3e7cd4cbe1bmr6742323637.68.1793116244485;
        Tue, 27 Oct 2026 08:50:44 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c0a5:5d28:58c5:eac9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666d1sm2943517a12.16.2026.10.27.08.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:50:43 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:50:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v9 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid implicit ABI.
Message-ID: <auDIUf6Vx3VdeXcz@p14s>
References: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>

I will apply this patchset when 7.4-rc1 comes out.

Thanks,
Mathieu

On Fri, Oct 23, 2026 at 03:52:48PM -0400, Frank.Li@oss.nxp.com wrote:
> The driver currently derives the memory region type from the referenced
> memory node name, creating a implicit DT ABI.
> 
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {	ret  = <0x90000000>;
> 	no-map;
> }
> 
> m4 {
> 	...
> 	memory-region = <&rsc_table>;
> }
> 
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
> 
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
> 
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
> 
> ---
> Changes in v9:
> - s/hidden/implicit/g, sorry, missed at v8
> - Link to v8: https://patch.msgid.link/20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com
> 
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
> 
> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
> 
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
> 
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
> 
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> ---
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid implicit ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid implicit ABI
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
> 
> Best regards,
> --  
> Frank Li <Frank.Li@nxp.com>
> 
