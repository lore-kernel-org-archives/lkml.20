Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709603A9D8D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019131; cv=none; b=m1oQuV4m+IWO9xHbjImrFyWyIJ2OmewgvDTcwHIQ1ESRcf2ncRnIWt4+Oju5v7/WY2Ynv5PGY0nPz7vPjEG/b56zcRiUesiCYKsQC9CkvGHLVA5JHShyQERNolSHno75AE1qjNw/KX/urn2G7qWs4xxYZZ7zy8M5lJSoNsaQnmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019131; c=relaxed/simple;
	bh=DlxL+7x1lp9tnfFTr4GsXM8J8UTaDQhZyuNIKR35QKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9zuZbGpPSEKwFN+ArC93tuoVyOVILB13cHrnMBUsteFVdPITjUTUm/TwfxsaEI1XjejyOQcyva2S7Ol/wBKrg5WfA+CxAdSHAurNcIvhv4WEGAr+VQw7stfm/k4IUaneqBZjXk8uhUH9fmhGEOcYGZO3Xolod9Ku938q9MCGXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfPF8gHi; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfPF8gHi"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so41162795ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790019128; x=1790623928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=;
        b=AfPF8gHihqxKFvtNza2MGwCvpV6MbsDsDRIoNgNIeeSZr0dlfUr+1UeOlB6y0r7mC/
         rpUes6cMushi0H4WxkjcK/tiOQsKxQXKcjJvFdj2CEv6rAgkxLNvSyKYajFTeNlqdYMR
         jhKiwujTXvbeHgiU/Y9ZnuQr0MoLCUKjLWXX2cjEy0vsyrMHeTdbEXJd0IBpCgu2xMo/
         JbuzxKcoAk4Qzzs2RoXWTgfN07VMmY2wzk3AqAUIvdffWPQGD9nb6MxUAEnVjIud+QaE
         R2dHbz2xAvkONLCvYriwH7njZxfT1m/5YJmZyYKCfvfitj8mINm0eTYldaCLClzfO17j
         ilxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019128; x=1790623928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=;
        b=EZ7f3FZEXR8vNhJIQ+7Fbw7zzWGNW+CHYftUFIpP9TusDkfYrkJL5ETopJmMyfHXSB
         d2wxAc9S210+/Po6ObWspPRxraQJhnkQl68C0/qiNFWfq5jI7MBgXoIHXROxRr0a5+jN
         gXtRMmZTiwSrUR2fwLdACAkygZaalzf+LKDglgk+8cXHgh/1mfvBDSRhd+szw8saoOOF
         0ZBok2G+awzdJ9fkGH3jua+VwZBnrDkD5H7FXsviQds4NXdUESnPDtaoPBATILte3afX
         Z9WQX1iVgpLV8h7INGXDQR09lBJDAKurmtmM6Nq5ypv+aweYwX/QuF1JbjdKxomw4zrg
         t7Tg==
X-Forwarded-Encrypted: i=1; AKwUvBwylzqd8emr8O/NBveuoQqnb6Bt51dX+NOFSuC66/CS3RMLMi+GadZ/foZUR/eV+ObChuEJp5WnbzssTyw=@vger.kernel.org
X-Gm-Message-State: AFuF++mslJe3p9a3JR5K0cXG1P4D0pVvCRUG72w87RkLWbIQANIgpQoc
	AX6+fQifJuOf4gqQiweLKikAeYOVOq1JrWGdfaqdBJuO3Ia63oK1eOrK
X-Gm-Gg: AYBFou3ZJrvH+ajzrLAQhf3q6BKSGGEQiwe3OUzpQymfCHvhuCPbF+I3Y79OrVtIHhm
	ez3AEGmVC0PdbwVi1PZbAj5obd53h7QiXzwftHty7XlVlvTvKP5BHqIQV3a7ORADyoJTjdFsBgY
	P4skp/c42KH16nZ9Jz6f2s4AR+YtP+wBohtAqPRqmitafIo9GXbBeeRvXT1RDptzN1zCP7sFaRV
	UybakkoYHmHvWmui67oAiXRqdB45DWNqyvm1EtKIin0dI78aopRWTat7jMEV67W8FSd7STYx61O
	jR1/f7ldLAvM3yKt9LMy4FB7YnlY5ghFDkuoZZ/qR66CHh+T96xyxytzdOcxf9vy5h+rD0yPt+i
	j1XqtNWaT86nns8revNebvTCkfozotSzg5wyx9dcPcrziBHUxTpi87j2RNvTArgN32QpL6UMJUU
	uNL3kB6eOU0OFMObU62dMSK0NqL4luH3nKKteQf0yHoTpBb8ojoIl/0AnZ61mdtxoXnG1Q7QoXy
	6vcY8YEzjkQcZ+ZSTJkoozJ2WVMAD6V3dSsMuyT
X-Received: by 2002:a17:903:4b28:b0:2dd:c100:a5da with SMTP id d9443c01a7336-2ddc100a676mr100940305ad.46.1790019127634;
        Mon, 21 Sep 2026 12:32:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e1a7:4f7b:11d4:34fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec60d1fsm126954eec.28.2026.09.21.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:32:07 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:32:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Artur Rojek <contact@artur-rojek.eu>, 
	Frank Li <Frank.Li@nxp.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: Use consistent indentation in the
 example
Message-ID: <arGGLo9vmxyJQlTo@google.com>
References: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>

On Sun, Sep 13, 2026 at 02:33:11PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied, thank you.

-- 
Dmitry
