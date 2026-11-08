Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169443;
	b=EsXZ5EXsaqqXpHQMzQYf1Xf8ALjiB2tApue0nfCp0iIsgmKgbg2UMRCxNOrmzOrdkcmD
	 sUxHcZQqDi0aO19B27Yy4RhKtbrBs9dcpgJn4iSUEMDLeeGKXhpsOO2vWdPCun6MB+jHf
	 XfcV2Jchh5l4PwuzWmY6iR/aP+yFrRn65rKrvoYFKiUhULDFPz6p6kvDx5QGYa+7MkYtX
	 GyJ7a6LP+woN1VvkHMZMCg3y/YHbgYVAxeNFHDQEsk8/hyxYZvjrfMuKUSXADyyP/ki1e
	 5iXwNG8Fg7bBjGvuLgRa5ceZplSbNLLlUWq6+AnNXYX6CeVIYnqq3CFHaWYZph4wqKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169443;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PIDH+MAdQFsQS+wGtZgwtO/Ik9s/WC9VAQt3yx3P/nY=;
	b=DBS1DE2wBT7AjOoxknyaK+om8mms6xShRG8IsQ64bJ0veo/V6QyyuwVj/ujYzk/ZmnDC
	 yx8vyzNyuno4uWQEhEcAVGdE7goo1qfE0ZYK35ff8SpXe2GJomMExM+4YtzspHjXU8PSS
	 mr12K8v/hLHXdblHhl4AnS6u8vq42xsFkIZxbGP4QUB+OFV8zuEV+nCUYodxvqiTN2H8w
	 xdmBF2Ptp2WtH2yIQLnlu2h7EINET0BnOd2+WMG3JEFNIItcC03dnSw/EcyFAE/u4QDbZ
	 zl0n7cNvLR3LrUOKgJ/vu8pqeQw6qjEUeWOuEKLQuxMAKe+ou1cjQFdDDKXLqEUvJ0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RKVaHM5t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB36076C00;
	Sun,  8 Nov 2026 20:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RKVaHM5t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31491F008BC;
	Sun,  8 Nov 2026 20:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169443;
	bh=PIDH+MAdQFsQS+wGtZgwtO/Ik9s/WC9VAQt3yx3P/nY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RKVaHM5tB5dS4XPW+1tN2IRgMisQguCkVRVvYKTcEwK23hsftiLRGwxBxwTrYcLlJ
	 RO1moyXzzdQErKJJiXa27Qxnndsdu4XGmztLVbMSbImPQGw2XQjzN2lgiUY19nfRNV
	 yW3+7gUnSy/ZQRrglu8lGx5/neQG5iZKxHQhrkggWaxS2SMujTtAxwpDKgwznCgCPQ
	 EJy+tIgwNaQNoMzPk9H3Gf7rCwSDY5euCq0fZtpZOA+hmkJ+c87KMB9FMdsnJM1Qqc
	 DqtJfun6uuYdp6XU+/7qVVGsnnzUWoDa0gLZZaC+rmVKgq8pSUM8HbQNyGk5GzyLMB
	 Blbams+yL4pFg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrei-Alexandru Bleortu <me@andrei-z.com>
Cc: ath11k@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/4] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6 Enterprise
Date: Sun,  8 Nov 2026 14:20:41 -0600
Message-ID: <179416929470.628393.6109143972218065313.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792761470.git.me@andrei-z.com>
References: <cover.1792761470.git.me@andrei-z.com>
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


On Fri, 23 Oct 2026 16:36:56 +0300, Andrei-Alexandru Bleortu wrote:
> Add the Ubiquiti UniFi U6 Enterprise, an IPQ5018 access point with two
> QCN9074 radios on PCIe (5 GHz and 6 GHz). The first patch documents the
> QCN9074's PCI ID in the ath11k PCI binding, so the radios' nodes can
> carry the calibration variants their board data is looked up by.
> 
> The Ethernet port (GMAC1 with a QCA8081 PHY) and the IPQ5018's own
> 2.4 GHz radio are left out until the GMAC and the WCSS remoteproc have
> bindings.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: arm: qcom: add Ubiquiti UniFi U6 Enterprise
      commit: c8ad14fa57232bf4a167b0fe2bd1e856e587cf48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
