Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7401D351C1C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097831; cv=none; b=GhUiaDLy838u2YXtPhsyExHg10khM3rh9YM+Bx5RDCGe3sR0wiEcmNLsqFvtKIKbmMvaC2dV02H2z5g9U7aTEdoNHYUpq+pcPW8y0PPzzZ2XcxLbGEr5xGfredhlIPlbrc6gwR9XHcBPBaZYCHy5+DmmtXCUp+KxGPcBlJiGGis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097831; c=relaxed/simple;
	bh=jnxbrAUNCi8h68fjyd8ZlDlk84mac5zqMfeH9/mmBI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boPOer+urApKbRF+82AlgTmk2if3Q1Y+RtIi1aDv+PDNmMj5izJrgOKw5B05MNt2pydmN03KdrfcJrgJ1PYCYSXQnWM5wYVs4FHJpj1rRYT9RoiRX0uCLcxAkW6YKU2yPvhtBE+1+Lt6/Jt1BGwpXzfp/bpoqOul56JXqjSUtXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkYW/9qB; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkYW/9qB"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso430201a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789097830; x=1789702630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=;
        b=MkYW/9qB+6iLfHw0caDUOAaqQ0xW6BmFU5TPmQLgofu5E8WvDUpp5SCiYDV0OdmClx
         QM1OvYRzSzrnFztyGMHisZgzsUxP63IUL5u4qWYFpaaJOQq2krPJ4mHy+4sCsUmLWH/p
         AQHaq4hneBsoqeSS1ZNjvw/cM1lv5Z8aj+8reIWneQC5tzHMaznaXS9RMz1KcAkI0IaT
         pDIDX+c0TfdTZ1Lt3UTaNX3gxzBBXYxAf7SHdIyK/dSIwILSCEaRsJVUUuFqqqHQyafA
         xFax+V3/bVFZzVf0PIAKz7yWBxfcSzlVJOoXeuH+0nrxFaXT4BXFrqzwiL5ItwDbjCnJ
         ri6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789097830; x=1789702630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=;
        b=s5W4Y7NrWddT64o/Ef07IUHjV1wtSBXkLko0MWyCFySVGq+vEAPRoGwPmwtdchIahb
         uQWJN6LFyzN2PFIuH/3OLvHBV2wmLd+TmUxQPFiWQ+9eWv0rUV6vWmqUrEHTL6u5ndkh
         7nWM2dLhdMA2jJrpnTP91cuFq6M9RH9vRELZva5aAure7H1501OweIaffKg/TV5k+VkL
         HGij4yeWIAkRjuzUQYojrZ5TE/nUyKpkJFnZsbAgpV1GxbDwUrz6o0c4WpWini5htfx2
         wANC6MCHO7ZPMkEbYDkm5G/7cTtTQ0/6cRtoVCI1zuat6bp9/79f2VHElOIPGn+gAl5g
         0phg==
X-Forwarded-Encrypted: i=1; AKwUvBzHPMDz7bMlLY3uxJj4g9EBlaQWFsUkZEh2N2aFP1lQvdmVxCIa7u9pteuJ9cAFhACUWEHslF6WUgHeh2s=@vger.kernel.org
X-Gm-Message-State: AFuF++mhiHuh/62jIuQMmLPqUmivDXyGVJnQyJq1KgOMHUwZQlcagly0
	F+GAKL1Bs74ZyLw7OxOs4rDgtp7NiaA+xdLAMKo8i1kXrV/ch8j4+9KbfRcCA/ck
X-Gm-Gg: AYBFou0Si+i0lwDztDRu4pvmXbn01aufb6uv619w9IrIjLyfA4amWWRJZbwuMoEAESS
	hKXQRoshaeSk6wib87K2P0vYNcN7pEavQ6exM5YJgosCra8u3j7Zq9hPeLULn23RVZ6HjL3Fs+D
	JU78o3Gq4poIqano7qj4ruSFm9pjgDp9Ih10K8QwlGGgmGdn1T8n9b2ANnM84bCdOU41bXxI+YJ
	Jcw0gTzo9gCYh4ZfKPpLLaIzqGnkBI80d+mromwse8wy2iWpgnXPPD0tYPwhfBVVO7I+P7B8wS9
	19ugr8SVbPKwnBpRYQOE3O81K4p5hI4qmvgktNL+pq7TfLEA4Qbk8IKTHKviREwDYmNQm6VDbgg
	3o3C4QLcHz84umiQRYvkPJfJCRDVVbxOr3R90yB3ZABlQEPmKo3y1elcowFf9dEM64gtAmoEuzM
	+6QryiRfJjTjL2qzO9fykvH2PPlUPhXPJZA7zC+kfpnXhQpmGU4NvrlBOMp0XDMLPtxXytKH0WV
	FKMCNgdyvIcZisfsRCtQlA=
X-Received: by 2002:a17:90b:384f:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39d9c1c016bmr3307088a91.12.1789097829777;
        Thu, 10 Sep 2026 20:37:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm2537488a91.11.2026.09.10.20.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:37:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 20:37:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zakariya Hadrami <zkh@mailbox.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, zkh1@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: watchdog: mediatek: Add MT8127
Message-ID: <8bd4787a-1666-4f92-960f-287bc3b918a6@roeck-us.net>
References: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
 <20260910-mt8127-amazon-ford-basic-v5-1-3cb9eeaffd5c@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-mt8127-amazon-ford-basic-v5-1-3cb9eeaffd5c@mailbox.org>

On Thu, Sep 10, 2026 at 03:29:12PM +0200, Zakariya Hadrami wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Applied.

Thanks,
Guenter
