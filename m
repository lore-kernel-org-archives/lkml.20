Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169467;
	b=JaULva09HpKHrpuEA6133nEucAtkJBOcsjIQRwMvQGQsIzZYIMcehPns1cLmLRvjKGsz
	 GfniDKffsfl0MmdMnHn156QayiWwsBIfjganC6x3DQV2FMleceR/qfW6w+XUsBeHIx0gz
	 TNrhsiZTC1+Y3UXVp2xo5JgYDKp+rx1TcgIFUNS6R3IN2CKpEepYukeMsqcxmiGeUkXgt
	 F1ARoZ/+qYDY/KJdl90dIeJVsz3jN84x8FE54EZZfA86PUkKKOGDZjOSUNjIWxVRp5D6b
	 Z7BZ2lNsmdXgtSs8Te//VvOIY61OePVdMmYGqmZg9GEhUjqIHQDAGQcuugXcF1CuyNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169467;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DcRnFmMgqYv1JBS45xJBgRXHKs0D/3YQxnJbNROxhNA=;
	b=dNrjMIlDRPrf6U596beBYMkR60rjj51XT/QFKkIdzGASHt6JqzcAfuKzh8PwCzSIkRCH
	 2B5JLFkkFVL7OlcZNxujZ+Uncp/5xpcWLGh6dkPFiTPNJmAsqpHQOm5F2pyzo8tokcFOG
	 sPEEcHbB5Qwlb6FRf6rwWglxqNelDNDWuORdjsP1dRP1dHiB9yyvcqvSZypu17pRTRQo0
	 WYbnbZCEf7wajmopTPYUxKLNqvXFRAnHplLd9uDNYNK92yWnIlwIQSX9ZA9zzz5/6i1YQ
	 B6LCxvi7M7IgfKgXzXS2mm6gu4wc+xYx7xeQwrq05NXueqJjl9UbuzzI5rnoG7Z+mJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9hAiQAR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F1D607A748;
	Sun,  8 Nov 2026 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9hAiQAR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75591F008A5;
	Sun,  8 Nov 2026 20:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169466;
	bh=DcRnFmMgqYv1JBS45xJBgRXHKs0D/3YQxnJbNROxhNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C9hAiQARh1suIca3AeY1YU7glbrJsoh7cfJlA/4fZ7dEPjo+Y7pRicauFYZr0t1nM
	 VkMSqMvw/IN1fZXotEFgnOWQz9b2mSzkmsDm0dlkksTWWkScmoFwvT1EWNyRTriUCl
	 8tS3wSuRkelpMwmX5MePVupc1MDkEGKRcdIyiP6LOvMB2xadyjxLPrPz7HdKsebyG1
	 k8nyhBNPKVZa2BbyNPBIO6AlhbFjDNmRsjw5vK9+oWdWBpw9XayqvULCehtbsZB9m1
	 AF5rEqPSZonBKbohU+QLUUkm3wXWUyc8+Uh9aBVFYoLF/wniMyzjgiOiSNRIufSw88
	 fKY06XMDbtDlA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Oleksii Onchul <oleksiionchul@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: Add Nothing Phone (4a) Pro support
Date: Sun,  8 Nov 2026 14:21:00 -0600
Message-ID: <179416929358.628393.16013072609504329272.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011095221.24767-1-oleksiionchul@gmail.com>
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
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


On Sun, 11 Oct 2026 11:52:19 +0200, Oleksii Onchul wrote:
> Add initial device tree support for the Nothing Phone (4a) Pro
> (FroggerPro), based on the Qualcomm Eliza platform.
> 
> The DTS describes the UART, GPIO keys and reserved memory,
> including ramoops.
> 
> Boot-tested on the phone with Linux 7.3-rc3 using a minimal initramfs.
> GPIO key events and ramoops persistence were verified. DTB and binding
> checks pass.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Nothing Phone (4a) Pro
      commit: b16ee900bb5688b779e37322cd8a92c261a33536

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
