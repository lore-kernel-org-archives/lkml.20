Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737229;
	b=ImjAwDqqWHs87HjWsbbqw+kSMw7Y5NpNrA2DsABTgInXwakDY9Jp5fRviTc6NRuW04aV
	 ob1usIyS61Rm8kcD389LZlnNsO9dK8wxug9/pdwPua2l8JSvlsuMVJFzSBnW1PdZjNJ/H
	 lrlP+Ykm3btpp+s2/TrCIKpqqb56h13gjZO2+IKCG8R9JkZpxz/oynvebmIx3P88doIPR
	 QwiTv8C1h5rs+NkzcNc0DeR29Ula9lGiXizxGs19JVTgdHJBKX32/rOaRAmg4IO7VlJVy
	 EXZRZQPZve2n6zMsur4j7UtaymOcVTlHnX72DCL4zQf4kuRQ/DVMCljSgurS4JMzV3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737229;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=uw96e8wxJn4dRmmYbzz6TU2vxUmejS4+KFRn+pnou54=;
	b=u9F3xhO2LVPo+obp5I5UTkUmDmA/JabaVGZiArGa7V589gikJTdpSQ5w3QI/KbT11WQL
	 GBBIVEmsf6hl+VHnClZXTiQGinzRY15PgmJVtzU6fr/aY/33UE3YMKsGqa3C3IOh4hfJc
	 Sva6SblXUM8rEYI4GwdusIXmcCfaiexi7M+mTHMsAS+rdVNCbY/tlaJ5i0bis4uXI9dnQ
	 KpBg5Y7W1gbBfIGXgqBsBE7f55U/NPu3HoiRhSIRojCFB18g1Tbdv2zrp1c3DuKVWgfpJ
	 L9tyLQ4MH7h51THG+H0mH/4t+Kq3hWLGFtleaxZj1Si0M9PcdfkjiNSUyG9cVG9yTdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jI4hJIO2;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA2606A31A;
	Fri, 23 Oct 2026 06:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCA2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jI4hJIO2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1792737226;
	bh=uw96e8wxJn4dRmmYbzz6TU2vxUmejS4+KFRn+pnou54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jI4hJIO2SpFbTa6a/xXNcbZgfUBwadU86IGVap5dP6Byi7M6nGFiAXg7pIBc4izeL
	 hrArl7CTP5kcpnRgw6iWhqQCeIYGiFc5fc413gzfLagIfttLPLS+8WPfVbVoiAUdQG
	 fUok7Yy7kd3VnMM2FXnr5NDeu6J+3xJz/XN9O5D4ghwO+wf/C38fV562uJgkukoxl9
	 t8/3fnUk0ZQ3zj/rytOOJsD0TvSkFbFp0ytsiPIl2awnIM8Ffx4pDNiDO1jsbFlloW
	 XA8furCsfhg+ziBpVU+alqMDJ8NJ14pM7sURDZ2uRYpcZDGjCtbJd8m0Zi/AZrh0Nm
	 MLs6HVQzCKYoA==
Received: from [127.0.1.1] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C82946C53B;
	Fri, 23 Oct 2026 14:33:44 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com>
References: <20261016-ventura2_initial_dts-v10-0-a546659a084b@gmail.com>
Subject: Re: [PATCH v10 0/2] Add Meta(Facebook) ventura2 BMC(AST2600)
Message-Id: <179273722468.1026112.15880414807402176715.b4-ty@b4>
Date: Fri, 23 Oct 2026 17:03:44 +1030
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Fri, 16 Oct 2026 16:50:28 +0800, Kyle Hsieh wrote:
> Summary:
> This series adds the device tree for the Meta (Facebook) Ventura2 Rack
> Management Controller (RMC), which uses an AST2600 BMC.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

