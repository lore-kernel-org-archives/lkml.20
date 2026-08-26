Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D9E36308E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747728; cv=none; b=WZpvuM4nWlQ2krvUn7FyLWW/djUh5UzaEAJE2YH65MHntYnTHdSkZRfBk4mUoBjIWK+Misga/CnU4rcq3eEfIkfIfjUwmxpGdPIhANyTMKxx2lGwdEWwRPo31YV6h6W+AcWvLM9nuf7/fG0+O3z+89iWDjKyf2yPbuXUnghGgL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747728; c=relaxed/simple;
	bh=V6o8/Gq5JSA1hvsuomub+jf7dy5sMCVKfGHckD5JYt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc4LWTT/UkIomPsDYCIP1VlcqsA9CUaDxNuS4JC08gWcvl71XFo31DvrJZQEZTUhSVGKClziChigUlDtXdDHh3bxgmGml1i8h4nqEduX17fl999oA9XDDMO4Z6NL71P5gZDZsSCzdsxyCEIPeUKgAtmh8Yi8oXRUVS62MNJ87xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z111cfjF; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z111cfjF"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso641161a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747727; x=1788352527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=;
        b=Z111cfjF+MIKPOo+mF/4D/10UEfDu1XdcB8CJnwatfN1dz49BpPKFVpq5n+cWrAOWH
         Y++XjHF4LLhii1STKj83qeFbMC33I9EghPcu9t/+TGETi5hag+6dp+1XC3mt7s4pu8ll
         uQ3s34axfLzoZDjN06f6V0sltf7Adajt4S/Jdbww0unvhw0LrqjBe2xFA6MSDCmNnbba
         3sncFvmgrVXX+jhFAbUa7gpO3AoFhOgwXvVUwfVYohxjCQr5LxVX16WkBSLdrmPdwtQ2
         KZraVZalZepBr6mirTUf37HjsrGUc38l/xTLx1czEpOqNGlGF6/sMz7Ki+lP/mHzmYE3
         E/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747727; x=1788352527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tFmCMlIdazreXwyWNHIM7U0F2LSAg2/FgtTByBRIJs=;
        b=WpcWRikoEDVsL5rWRL0QEjOWduLJQzrhs7Bfpic8UwrZ2YysYKo0dKYOAGQIO3LO7s
         2e7hQ5TkNetDM/gKCIEv2RrxggxsMFvtjcNNuTPR1jO1icX21kXTgdVJQw68F6Me0cSR
         NH0yGlmTMX9eoJlW8JScq26atZVe9qqcNltqIiS39DQnuh+/YUFSvS4TgYG5VRTA++C9
         uIrx3d7M7w1gx2EkOSVaRaEYhtpjGGZcboiImNd/5O6uiaTMyyDrErvrcFm/0TN7WLag
         xbh0LGc/IFBLvBKRKApI1yXTev1zJ7eGNV4ooa+Sn/PJXpqKRJ9b2fHkM/jMpir2lqw+
         ZnYw==
X-Forwarded-Encrypted: i=1; AHgh+RpS/wC6bPAvkOsCdEa2cpGzsLp36C6NNNJ0tnCdHcCr+gqDv/hUvbAhusoFYly55+s22VQpr3utmyd7n6g=@vger.kernel.org
X-Gm-Message-State: AFuF++kDPfDvthp1YIKO3wf9f56iG++Trr5jC3IZ5nHR/+7H+nVwsImF
	cdZ41Dl3PrKuCnoO2XCk2nIrxoCMYs1dymBVxVQsExHt5ncmQcDvPBoo6VlmJg==
X-Gm-Gg: AR+sD12UzKn54lNif5TFLyYVzEmZuyurjpTsDAD0ZhGCZ6cdWHEiHJX+tSmfB7ldlCc
	6nbu5lf2A9O+vyTq5Dd21N3qv9xUss/bWja72y9sZ33xZVxMPZYewrZoMnYlisiiZ0JapkTUi2R
	JjRlfr+/U24v7tjfjAMxtWlcpqfnPnz5hbsnE68GWBcmbjuwEhHL03CbDLZyGVbGLuVfbxuu6Co
	s5hUP8TloTT03aswiircx0DI0UMUztbdK7Z8eFrgqe+HnudpAWYulQU6D3wrAJjK25cdtWWW64H
	sl4gnJb2Q9Z91GE0EK8Q0jnBsK6+74/vt4yiXh2Lgb0wGGyfXNkcgeLaf1wWQakfoOLqEIVM2Te
	sV9zDsi/4MX8RvyEtpmShGpVNE7QI5OmGU8vUGFt3G+3jSp7o48H8J6pLZlLajRZCQGGSgS+nul
	cqxRTxYX/Kv61dMltwLWL1RwSAbe4xYizvvHG3DU4+M++dNasTrj+bvrmcnQKFm3pV/Z185yCZQ
	Q5xROlKqs2Kvqtpn8a7Qi/cVIjMMQ==
X-Received: by 2002:a17:90b:4b04:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3966d5f900dmr13609817a91.8.1787747726840;
        Wed, 26 Aug 2026 05:35:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5877:641:857b:1318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20095sm7925744c88.6.2026.08.26.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:35:25 -0700 (PDT)
Date: Wed, 26 Aug 2026 05:35:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: rva333@protonmail.com
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6572
Message-ID: <ao7dfxkXtbt9BybP@google.com>
References: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-6572-dt-keypad-v1-1-2ceff2373211@protonmail.com>

On Fri, Aug 14, 2026 at 04:13:52PM +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied, thank you.

-- 
Dmitry
