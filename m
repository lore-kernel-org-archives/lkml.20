Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169522;
	b=e8vfr6uNa2aMqACHLmh0iojWY1ADfAEQROY4PQFCv6POjBBrXV8TgK2VEc1zRaScuowd
	 YT4DR1FCTE8IhEeb40/sJ1VX5VCzfZF9KGfxaM4PDUIV+erDq/lDzg0x4N8STjMXyrIMg
	 235/Rspou8X6EelH5PkVV3zfwl9WaIEEb18n6mPcB0YmxQhh4VI153fX94IEkxCpG0xeL
	 /vgv/2D4JwYbidCMCqWM2yQ9YaaQQwlvl5EG7TO0zQWMX76+pu0/abDD2I5xkUn2yqDoO
	 iYsFfr9CgDuT1iTXpMD6c02V2Qk5Vig9qhU2FIxJKpRgQ3XrZTXrqzhzrOHeE92nyOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169522;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vEpfVgvWDM4KmL55CE5daC+CQd28CbR4NeJ6R77tUa8=;
	b=wzOLCXXGPEz+p2BTz+r8sYhvLqtXlaezIR8+WCQ7hfki8ceXmrVRQFn/DBgOYzW4ZzL9
	 p6EE7SROjsyTLx6Xbksen7GoNa4IylEOZ0oD6PYa/4FhT1mEwExnPGf9futh1ulEE+JCN
	 YYrF8ITHnCESQamcyEHJdxWkxLoQNAE6JNPlo2K4Q3jL3jl6hV6LFxnPoKluznVsdJU9d
	 0MLW1uEhX/yhyat/+oWMDwOBy12etzYkI1vekoZxOgapi7h6v+HDUgKs+v4gV+lESXa3a
	 9qRy8s7ESVJCMhGttN935GwrZlER5+er89Wrfb8pOAln3vLWmt1bzPApLW6/Ea4Wbwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wccb2cTa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA76084EDB;
	Sun,  8 Nov 2026 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wccb2cTa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF8A1F008A7;
	Sun,  8 Nov 2026 20:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169522;
	bh=vEpfVgvWDM4KmL55CE5daC+CQd28CbR4NeJ6R77tUa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wccb2cTanQU5RcxsSs67G/KCxeoLHJ0+fvEDoloNNHWCPEqJVK9ONMQxf5LOd7XkJ
	 1zvsZrzrFkc9TBVtHI2ylaKfgRe+/hrR5ufIIf/Jhfig44jqjkJdOLYdy6lyvXfv+c
	 VeXCxRa7rjAgPhj/ZNkJ0sMnAJmB5PH6ueaVu8RCrvFxkC4K5ILc1gKf19PW69Hjtw
	 qZci3QAoVNQinY6JuJm5y2o+1H7eZ5vrs717AchvU5fdXEPihYb9G/QFM55lCd6eV9
	 CbDZJBcfX5q2lXwC9FEtpDyaJEU9IRJX6ChSgvIwFKGiXAWrh/QRg/StxEbrj7C9d9
	 v3pFgtcOqTevw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/2] Initial support for Advantech SOM-DB5830 board
Date: Sun,  8 Nov 2026 14:21:40 -0600
Message-ID: <179416929274.628393.12037192351352245383.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
References: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit


On Mon, 28 Sep 2026 11:18:47 +0800, Yuanjie Yang wrote:
> Board layout:
> +--------------------------------------------------+
> |               SoM (Advantech SOM-6820)           |
> |                                                  |
> |   +------------------------------------------+   |
> |   |     SiP (IQ X7181 EVK SiP)               |   |
> |   |                                          |   |
> |   |   +----------------------------------+   |   |
> |   |   |   SoC (X1E80100)                 |   |   |
> |   |   +----------------------------------+   |   |
> |   |                                          |   |
> |   +------------------------------------------+   |
> |                                                  |
> +------------------------+-------------------------+
>                          |
>                          |  Plugs into
>                          v
> +--------------------------------------------------+
> |         Carrier Board (Advantech SOM-DB5830)     |
> +--------------------------------------------------+
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: Add Advantech SOM-DB5830
      commit: 5fb1997399eb2e27086f1cdd160a120314358f1d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
