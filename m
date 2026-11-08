Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169346;
	b=2Uy74ukmTc5OB65UgDaCEZkPOBySLLsNOEa6KxdI58NJmEn3i1F90Y7Xs/Hqpq7nlbI5
	 HT0LgIjM4J3LMaaTzb0J3XGoBJhbyywaRSo6iJHGWqxhuSZMOej0VkkiAzsw77jahneNG
	 0SE/5JhSAcWm5F2JHhTu3/gu5/NyD6TxnwU5dUvK3QPbcHIKiKNWa+wCuWW7k8xCRmaSL
	 EOBYrg8BZ/GPeeDltZBoObjm04bkR1J0SseqbMtX7IPUSHdXiY3nDvJaDGncRrjWWidqd
	 APsLQjh5DM5xsXmKpbGBuI6stHKR8H5OMmG+wL0ckUCTrierb+mv7czGzE85QMgBjZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169346;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oKswcvR5YtIvBDM/sKvspeXY/a7O44L2kGWjWOUqnjc=;
	b=CP7q338DXNuwNW08E3/T+gGuhZk73SwhUIBRWvxxC0ufeYWM3bkKQfGk1w/Tbj2lYB6M
	 /5c2ufuj8l3KWpOiCkoRRq2afz2hC/yvCPu0wesnQgg3ekEMUxJvTTsCCZfR+cTDfoZiH
	 KJT58uqH5l0fmmDcwy9pEUJuCgOX9lkRevHUa8b+sDsk9zulB4RhFKmo2D1wXWhV45R/2
	 i2lwgmR8rJYnYK48zWlDkOaf4txW0CivXfqG4VcVuEBD7c2LuXJTKZk33JSJzovJ0MEaR
	 3ZBPeSj2uSi1Fb4MwM1AZfwe012omtDECbHZQCq11aTk1eGdY9EoTutqZ6k7yyGs0vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+MltNep;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DEB60A380A;
	Sun,  8 Nov 2026 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+MltNep
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7D41F008A1;
	Sun,  8 Nov 2026 20:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169345;
	bh=oKswcvR5YtIvBDM/sKvspeXY/a7O44L2kGWjWOUqnjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f+MltNepKhHDEbdA9YbTlNqZLoL0cmwVz7ayY04EiTR47opV364FsZ2Y4su3vg9xG
	 u3oHt4UvsmafAy4rugWYexHPpr6vGpTS2Oc30VLpMR/9BJc1pgs2i4EhbO6QbTbnfQ
	 B/sMFdVUWsmqDVS0cB+YNMSKnuPYpxu2bp28R+SMrIL+GJG3IUjo1voPZoj8kzKTbk
	 wxMbB4ZYHaEz+V0xMW8aWMQpDfxtt1dBARYgqabIFa3uM4u52phyJOrLGVTFxL02g6
	 7T6npEa5lYKnfCQttbJarDCYRCGLRU219UVlDdNQ7V3vYARz+OeJEzmu7BtCD7dWUJ
	 iaKi3YGkzkIbQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix the ADV7535 interrupt
Date: Sun,  8 Nov 2026 14:19:35 -0600
Message-ID: <179416929440.628393.2150156225768231577.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
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


On Tue, 20 Oct 2026 11:44:51 +0300, Dmitry Baryshkov wrote:
> The ADV7535 HDMI bridge on the IFC6560 fails to probe because its
> interrupt points at the wrong PMIC: the ADV7535 is wired to PM660
> GPIO11, while the DT uses PM660L GPIO11, a power control output driven
> by the bootloader. Point the interrupt at the PM660 and configure the
> pad as an input instead of relying on its bootloader state.

Applied, thanks!

[1/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt parent
      commit: ce13924a93f22d2dc5ccee4fad910da57755d16b
[2/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt pin
      commit: 05329d94fcd490f68e3d9b7670d385080d3e9a1a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
