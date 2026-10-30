Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363086;
	b=wmg6NNUBptH6K5n9Pubc9KfGyUZ/9Dup+7BZvrSChZPCWfbktBpk/7jWx3eSPM3AfNNu
	 hKdNk2AkPMs1LDLCaDNBe9tQxhhmIwft11BHRUqt6ehKGzBTUPJW0c2i6mF4ax/Qf1YQA
	 vsunuWputbDlfuSIz2H2LLnBsaPBkNUjMEQemBl1nFyGCV1cGDwrtBj3s40Uvkok0onUH
	 SDyro5MgXrrBQZ2h8NCTXhpfj4u4/qwuhILTyVm/Thw/WIEMDJN0Q8N/wWhbJrXj01UkA
	 1fjcXicirKvl+2zOe0WZz8pC/o+McF5UaVV/yNBdGLIpY1UlkNfBw8Ly5ZPJYYN3I/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
	b=2ac4L5N9xwyEnEK3UWrGr+KLoR7sdhiLov9cegGdF/XfZlN3h0suGlGsxUd+iDLUCd2t
	 gjS7KOqrZYCLXbDTy3jFcZ+nrGj1AQHYxPmLF1+qsFOTbsiDGsIup4BNz/7EKCL/Xq8WF
	 n1TKHtAZJSI+2mkMW2yMQ9eP6JOPOQKPoLPQ2ZDBwvjoHVfh0TijpasIuLMTP+ERH82gb
	 1GyIGP7/fww3NdgA9fgWbGNzMQhzpXgPE322tbEbu0Z2VQvRlkuBtYxDuXFimdebkprtg
	 1riRr1/DbU5T4h61rT4mfmsJq/nxJXg2xnQBXNqHJFQG0hWRFVl/bSFLiY+FYqTSWAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryYiWSQO;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CE3606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CE3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryYiWSQO
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7ccb2ffe333so420505137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793363085; x=1793967885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
        b=ryYiWSQODoAFQWFd0YUZMT/CuNVZF4RcRqW/9bAZTp9ouRXv9bvFbTC9iDSTtEFTgX
         QBAC0hzqyw9O8+9wk3MJRA1twuUlOcuvrmekv2hJmgqZ1TEKlCCSWwud/Bviceo6xUxE
         E/0Wh8kx/yJoZ8TlGP3loHgQw3lgrmZX2uQ8F5jutVY3rQqeAm6gwdT31v32BfohbQO/
         G5ie1WHDvmAz25uM4BPv+T1/OrsH48ouEYISV1nsWZktvT/yKbCN8siQc5qvcSz/BqGP
         4TOFjVE/XvAF1VA0yXocioVvelvMbdyLfArxCrgax993zJ3frPx++minYOQzqlbjBYVb
         s17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363085; x=1793967885;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIV9tpRgLQZjeNbnTpIGIuOv0nbniYNHC6sYgR8Ss+8=;
        b=dFZqyJmwKaT3PBv6XxKpF7B8FzUAWylhodgPmbmoC9jNqpnTxHEOIbOKOQnHhJODQN
         +g2NmWy23EP9tp3Z/WsHKm08P665gpCj5AvRbxKMdT7DNE6hYadNA2sPREY5uHKArb3F
         LsGjFpLJoWLtXuGrXXdNT3/Wd9FxtLoJRORfA+/+yKEVkKEZtMX6yNHy0ddexKvt2OcI
         ZYc+OFAnEtDXASJfb/2iMoSm19kBdkolwmu2Im5e4gxeokhVM8juCpzvPYVD+IYmymzd
         dOim9BMrzt6P5z7Kb7VlRUKYVKEBtt7CwxulaXEUsW1wK9MPeW23UwJzROI+gUeJ5N4P
         JXxw==
X-Forwarded-Encrypted: i=1; AKwUvBz1shZifhIKkcbEVeaiaxLNEAEwvbxvqe5ZS+ZwVX85EbaX0K2TH5pMZ3mNngTZZKYVV/wQEL4oMR0E4Mw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeOKSFeGdNt8sxKlkVtz05pXX1Mh3ioSP6AC7qDfWnIxtx7MCT
	um2D1ZAeusTD8uJrryTX3wS/apxWh8NqbEPhW+JLIEDvMUvELAwiRLkA
X-Gm-Gg: AYBFou0L6cwhVaSvzr11G7bDAHyS6skGvQ+64PYeUPSEWZi2i5CUZDbKae6OGd87vKw
	73yV2JRVIXkj7aKZ+JMjIWm6ZTLTMAXLKUJyAQlqBt4MJUGWHSbT71jHgF5mJymw1qzFbHSP69W
	569+o1epIvMLAq+MFd6HnNsBlzE5Xd6XbsFOWSU9tmYns9p1Cz5xz2KM2HdzigJ1hHCw3Qc+lzM
	iEAik4H9XNU+ASpHu8DukVusPNcJsH28AQ37cLPevDfdSaHoUZ/jkCsoaZOhsQIjOFhLHexTWcJ
	2+2XqKcxiTpZ8QFwhsjCv8Dg4tYzQdql1ZWNat8u2dXGrTN8TGMg01IYnNy+5fLoLXowzRSVNjB
	Bb0ikqrlrTxVH8MHUiYhN8CtNy+XoH1HiCbqRobK9v9TKkqKC/w+2PIFM3u7hZ+L8ODZOkriHWd
	fHqFY+WR53tKz10fZjCESkV12gf7Kr3KWZGL6caZEEJdri4QonTZXqspBbtKdZRxC/L7updwxHg
	urkfIGnn6ZrrA2QPsY0cZjRCmvxcKbiYs7dBt3FCK7CBEoyMVa0zHjMta+F0cfAmB+piYUOvWKg
	93fE4qTnRGVJe2saHqP40sdXTFnxh7gYHPVq43ygSlXDzjzbvvdXP/JmC3VhU7OViUyfDqzLp4t
	CYwIULk1y9aySq3aLM2BgeR/QVXlbM8zAOj22
X-Received: by 2002:a67:e70e:0:b0:7c1:7ca9:94bf with SMTP id ada2fe7eead31-7d072c3fbc2mr1028237137.19.1793363085481;
        Fri, 30 Oct 2026 05:24:45 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf54casm2188412e0c.9.2026.10.30.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:24:45 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Fri, 30 Oct 2026 09:24:33 -0300
Message-ID: <20261030122433.1659882-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030-adaptable-vagabond-skylark-bacc90@quoll>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com> <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com> <20261030-adaptable-vagabond-skylark-bacc90@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On Fri, Oct 30, 2026 at 01:03:31PM +0100, Krzysztof Kozlowski wrote:
> Just one paragrap and explain whether they are compatible or not.

Yes, the A733 PHY works with the D1 configuration in sun4i-usb, which
is why I used the D1 fallback. The A733-specific compatible lets the
driver clear SIDDQ earlier, which made intermittent USB1 enumeration
failures go away on my board. It doesn't need a different PHY
configuration.

I'll make this clearer in a single paragraph in v2.

Thanks,
Vinicius
