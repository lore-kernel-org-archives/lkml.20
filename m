Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793678606;
	b=SrLoNVmrz285bUaXF8OqmtoqLCgn0//DvlsQNTvRcg8Gy1yp/MfVrYdhcEMzt7HyEAUu
	 tVj371ltqZSaVtcHPyNweM/Xq0m8AAdnA+N6JcoC3dcEUVex/0wtS0VGbrMh1GF2uv+2v
	 NrDDqc0XHSloUH4+CVRIL/ez/TqFkooqKhcyx4x0cAHe8fxckOT8tebcq4+wEHANeNe7E
	 zwdqSw5zwyqLD2V/u/TGLihmu0s0e4eFR6YxYHO39NrdaY/r9F3xE58sMY+Iwswa98MYn
	 ltZS7O4rmjkcffggt4FZ95/c6pPmLezWVX6hx8lBiIr3aSzbcQSXmBy0Hlo0MGCxuNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678606;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=yNJx8chMtCeXWl3KaKPCoTjErBK6LBENXJ1CL8gOBQw=;
	b=kFMBWlRltfpAzf8gWKRLMI4p2BUWfOCUNi9SOTFO15N/iBseL0YIUaZxlf1qPOV8cmGa
	 kgPAXeD0QsEq7ukCPOFwsbjFN5O8ABEEr9sfseqMmovnNi4o/cMWlcKnmSFoDogpRExrB
	 GrGtCwYUNOj7uF0unCnjJy/WR3X/moPfDyl9jdQZtS4kY9SV3yieOaggVqdSaRjWdbNQw
	 SDM1RoZPGTS5/MMyaOtqqGyTdW/njAfB3UOaZiW4MOqoAPDFuszJClwVDBewNx+s7IWT/
	 GE8m3/BtsKbcTDsW9Hp9uRzp852/hAwo/tGbSp0uH756OF9lzLO14gm+C4PEI/3wXOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Npe4O3xe;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD65606A324;
	Tue,  3 Nov 2026 04:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD65606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Npe4O3xe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793678596;
	bh=yNJx8chMtCeXWl3KaKPCoTjErBK6LBENXJ1CL8gOBQw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Npe4O3xeYxRZuIM87r/9x5V4rBpQSVBCgGV6mk7gq3kbDkL/S0wT6UTQjZHBgXIGx
	 G0IGxrzyn7CLHJoAz6sJJ2oIG6ZYTwaflbL+XVun5dVD53WijDZrWzq/RnreHULCIE
	 e5PHon+J5EJ1VTWLHxNRyrzZ3cVRjXUXfyH5FsjcP2a4InCbnmraT/tWfHf6gSfgOq
	 4YDsAqhu38jXBvO7puJKxb350JpepTXxh6HhZK7mtWjEIaCMgEkcx9Y9ZKQva2hJzb
	 M3UsivRIBumoJtGZYOZ+hM/TEKnItuw84iH+9aaqhbBFlnuhRNCEGfYcoh36b9qHTN
	 5kREQmUaQnmJQ==
Received: from [127.0.1.1] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7114B648BE;
	Tue,  3 Nov 2026 12:03:13 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann <arnd@arndb.de>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029-ast2700-evb-reserved-memory-v1-1-ca1360d585d9@aspeedtech.com>
References: <20261029-ast2700-evb-reserved-memory-v1-1-ca1360d585d9@aspeedtech.com>
Subject: Re: [PATCH] arm64: dts: aspeed: ast2700-evb: Reserve coprocessor,
 IPC and VBIOS memory
Message-Id: <179367859374.59456.14319284457238248837.b4-ty@b4>
Date: Tue, 03 Nov 2026 14:33:13 +1030
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

On Thu, 29 Oct 2026 15:51:54 +0800, Billy Tsai wrote:
> On the AST2700 EVB, the boot firmware places the SSP and TSP
> coprocessor firmware in 0x42c000000-0x42fffffff, the IPC shared memory
> in 0x431080000-0x431b2ffff and two VBIOS regions in
> 0x431bb0000-0x431bcffff, and locks these ranges so that accesses from
> the Cortex-A35 are blocked. U-Boot does not add reserved-memory nodes
> for these ranges to the DT it passes to Linux, and they are inside the
> memory node, so the kernel uses them as ordinary RAM and the EVB fails
> to boot once it touches them.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

