Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169331;
	b=cbwJ0eM3GwJTfAvd9it4jUc0/F6dGHje0/N3RdHqFKkNrU56sfVqeSaRRYd1t4w42ham
	 hcN28QGoAXeMFrSGKQpnnBp3pvhRjZCmzt9R8CqU3eP0d0KU5DwcdSUbcm5wR1skEOUxV
	 nx3jwktynC+mN5ZUd2AYPu1TLlDl9gPg75sfOedVuoWkYxFLbXrQEULhVz7jpm9gxAw/h
	 SP8X1AKl8XwArV5VhcbvAF7Psxo9uTVvx6vlfpFkBJ3JBgPoYIa0C08XZAv3FWuK00Yrs
	 +dLVwn6xPT6YN+FFtbr1iNANW+3cdXm10XBz+qCJ18YbqCRUqLNU1wq9ZZzIU5qJbNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169331;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wDiC9ZXsWsyooRxcwFqZRT/gZitI9XGp1Et9o5s7hI0=;
	b=evKBwUdbGhTujjcfXMq7XeVM3ogDy602RhnRthayrOn8a8IpP2r1G915poQfibBLLk/R
	 YSh0gvh2Nu9RF0h6d+ndWXhEOTFTydc7bezfBnL7U8rP/CWpZIXs3/is3V24AXIuh4BxO
	 sOotZIgi/sJT9Pti9S0Vn5JOTTWZT3ximxv4xwRboP2eS4/tDe4++DOw1hy4n6hr1ugpS
	 1E4Vh2TwRWk3Zi+GGUDUbRMMD9mq8w77nwt9bMsqewCC9zdmLc4isisAymlZjNr4dOu6F
	 kpU1JyMcHMKpxQagkj84gHPNbJTPwjmVyJTLw18KZN5cp46L7YoQXFgS+/jFqQJygrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFxuPUXK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AB4606D81B;
	Sun,  8 Nov 2026 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFxuPUXK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C58B1F008A2;
	Sun,  8 Nov 2026 20:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169330;
	bh=wDiC9ZXsWsyooRxcwFqZRT/gZitI9XGp1Et9o5s7hI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CFxuPUXKUSrbFiv2Cz+4brn9HOlt/FrsJDZMKePzIdIfLQX79Wtj6/3pSYyU9D42D
	 Ph6OJP0grnGLdRegCQrGtP7Ng6y+ZLjBpxRN7qCRixIqOJ7rzvCjET0abHd6FxjUc8
	 b7LQpNHODlO/rLUNQahKjuJiUmkd81htT9BtFvXR/GNDYB3t71uTL1nMtzk4rmqiSd
	 8wysfwUa3e7XxKSTUxWQiMU0Tq9tpJ2owtjF+b+uovmUG0DrYDDPz/LaSSy8+fjQ7G
	 1JNVMA54tINjto9Wx5H2/qyGCeVMUEMOICNxV+hT5kjT6TV1DdosPSnhfGNRKShlVG
	 rRYZO4xAch/mA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Kelenyi <benjamin@wendy.sh>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Christopher Obbard <chris.obbard@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Make the ADSP remote heap no-map
Date: Sun,  8 Nov 2026 14:19:25 -0600
Message-ID: <179416929302.628393.11418005802278751117.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001085247.1897991-1-benjamin@wendy.sh>
References: <20261001085247.1897991-1-benjamin@wendy.sh>
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


On Thu, 01 Oct 2026 11:52:47 +0300, Benjamin Kelenyi wrote:
> The ADSP remote heap is declared as a reusable CMA pool. The ADSP has no
> IOMMU, so fastrpc hands the whole region to the DSP with
> qcom_scm_assign_mem() when it probes, while CMA keeps lending the pool's
> pages to movable allocations. Once memory runs low the kernel touches a
> page the DSP now owns, and the board resets without an oops.
> 
> On an Arduino UNO Q (QRB2210, 4 GB), writing and reading back 3.5 GB
> through the page cache resets the board within seconds. With fastrpc
> blacklisted, or with the heap declared no-map, the same test passes
> repeatedly.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: agatti: Make the ADSP remote heap no-map
      commit: 689dfffc33af9f74cd42a69f948fb5ca7b5a44a5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
