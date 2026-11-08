Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169336;
	b=kbnxEqzVwkgYjuPHibNl5CHiT2u5nW0Rf1ic4I9lMXmwjixwRZhxg94PztgAraefF+dZ
	 YQa/XLmvWF2fG3YSalzDkAAFDnmom9k2/SS1+m2aKs2+AcUZbZX7rDalIobaIk4pS+zh2
	 Fl7gYsfPJJ5tNZlRigS2TUS1mrxG4uSkJ4ZR9sSnW5sLx5Ve7Y/1iDTok3PjLE9A1q6QB
	 Lo7NWkkJl01umQLqeabb+T5aiwovtSw9Reku8eRCmpWWKrQl80td4aaYrdmsGrdmpzjhv
	 9wcLGMVF28OtRup7dggTOWuxOdwSsA1iKPom6yoHmnihgGRGkCm4PFGU0pYdiBwmqBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169336;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EKBrfLOvz3MXTyqngwRKL2A0PiYWXU35H99I8H+ItMM=;
	b=efpqRIiHc1v7m+z8OYFWNgIUTjPyUbmUqZm+/VMenVScd/dwUfpLAuqoM6eQySOegPkv
	 0Ix6jtmg28fvUfxHFyk2M8gPDVOmRPbgqvuFOHs7Fl/w6M8qPilKVky1CqXPvDJefrLSq
	 +fbbN6aeG8KWued3i1evPhGyckCiJmmq+GgMFUqvk5sChl1ATg25bizOhTf5JyhOHjLp+
	 Zf9D3JkrrrsbQyQPaUwbHGfV7hKI4/JUtLqfO3uhHKCjQmgvOU+c5TkRwA9i4FG8vFo76
	 gxK4v4FdbptrJtWiWJqaH3lZqw74LQPXoMjaTh/sZ03BjUyvs2Z4vCMJYyNJViq8NHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CG8iRepc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF439606D806;
	Sun,  8 Nov 2026 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CG8iRepc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997B41F008A3;
	Sun,  8 Nov 2026 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169335;
	bh=EKBrfLOvz3MXTyqngwRKL2A0PiYWXU35H99I8H+ItMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CG8iRepcchBpKeQy04ZVb9O8jY1kgi/zQe4B58G6k9/Hz0Zi5yYcb6ShW90gnC5Ge
	 DYH6wdKeZc95B05uW9iZZwYI6hWWIsWfJBlCdJPIk8jAot+dOPeD+Hn5l7h7I1VGVa
	 PjPnRjw1fcTMEwr36TWHy4XG1xoy++P/vrhMxoc2HnZ/ZyFDLqysbP/mOhCHGsg61S
	 s9brLqFEVnzO06s0q7/WddBKohLKsb0fG5ev8FeZ6x4YzNioNSsLFDZRiRbZt20Hi2
	 WZgdW8yRSd5xsccx7ahl4H74sZb5F8M/l4EIMmZFrgabEhfmjuX74UC4wmYqmNHvhQ
	 v48c7npJPKdEQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	johannes.goede@oss.qualcomm.com,
	stephan.gerhold@linaro.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
Date: Sun,  8 Nov 2026 14:19:29 -0600
Message-ID: <179416929467.628393.8362598893010731460.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023123914.8641-1-daniel.lezcano@oss.qualcomm.com>
References: <20261023123914.8641-1-daniel.lezcano@oss.qualcomm.com>
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


On Fri, 23 Oct 2026 14:39:14 +0200, Daniel Lezcano wrote:
> The ThinkPad T14s needs thermal mitigation under sustained workloads to
> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
> monitoring is not yet supported, so use the board temperature sensors
> exposed through the PMK8550 VADC to provide mitigation now.
> 
> Describe the sensors near DRAM, the fan/heatpipe, the GPU and CPU PMICs,
> the charger, the WWAN area and the USB-C ports. The DRAM-area sensor faces
> the keyboard, while the fan/heatpipe-area sensor faces the back cover.
> These are internal board measurements rather than direct measurements of
> the user-contact surfaces.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs
      commit: 54c0271b5780c62097428067ff44834f8f2a59c1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
