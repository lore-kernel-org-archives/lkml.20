Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169397;
	b=4eQq49bm3NB8Bb+6vIovHmr5ysao6Eo2ZRvWqCFqX+g5oTkUAVWEwXu3seug4jL620i2
	 ZRkbEXnYrG5kiG01o1XYdrTG4acL/2eDvaJQz6i6JSAniTG2jg/6LvgxA9WhegAyBkbhC
	 y2Md3pZ2jmYliOB5E1DcqCitwrxAO1fp4Uorb8NLtI+U58FQGfcoP3KSIosF/Mp/WFrxx
	 8ByfX2uDWK0wxYl3XMDko7vD6X7MVpLGQnrv6iAiZAyd97P8jxWWVDSmeGwR7GPXhmEJh
	 Uk3aFOsCdH2Vqy8Qv0725LDhb1A0CHPVsacrWOWlGq2NkaEc9h1VepKCEMCdhikDzwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169397;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1j8KpJ5sZwlHkcwkDDb9e/P2rtf7utaUidDMtXarwys=;
	b=4Q5caC76mY7b9frNSXqsRJq1iN+d+AoyNBfVCGCb0Qgv3nr/XvFvvx+/wQbe1RhHL/Dl
	 AUNuclnP7Qr4TgTHu0J/Abq7ssTCfp8wW5JaQZqozayz/lNUsa2NMYPzz6KhzFwn8leQW
	 pTH1hl8r4G8JZJUtLL+UNZ4oZEAXYz3F1LhLW6Nxk6qSR8XcUrfGARsh1VkZ3v2yQ/wBr
	 SWucRkVDBFNWEA0GVlNYvrPHU+MNOcAeJxMFUemkGKfNN4G+fboOHcQV0lak1kuPmrt3F
	 gae0oMtgLgrkaUGCY5Q2VqLnyOceOQEZPt9M3XQF0QafGAux8leDL5+9LULZjzhfeyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQwQ+Ckl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530B56082BE9;
	Sun,  8 Nov 2026 20:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TQwQ+Ckl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387E11F008A4;
	Sun,  8 Nov 2026 20:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169397;
	bh=1j8KpJ5sZwlHkcwkDDb9e/P2rtf7utaUidDMtXarwys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TQwQ+Ckl7/rNjDx4OA9tW5b/D+rq9uEAj31vmxzJqx/PzpN9ozEa880YfHR3w6aUk
	 WpDZekWmR9GPwuJjknDdi9xkGkZCv9A5ZD0NM8cYPBKqPIMUnuV+pbmwDPXA622pPr
	 fzVxbREPSgYsluogwQJOKpdmAeO5iL+WOowezPZVUjZB2YNHm8WmX0A99dT7kz34Tn
	 yPPV+eYUtke00Xhhev+/aZO9KvRzns5iQT72GQ8/LsMC0I7waKPeA9mr+AmDy2FDuj
	 46dlQBHNe2g+2ICfu5x/c0gWHvA3gVp0DwCMAnFdnxo6Mwz/ksx58c/oyLQdmQYgZt
	 NEgCc0nNU/oog==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ekansh.gupta@oss.qualcomm.com,
	quic_chennak@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: talos: Make the ADSP remote heap no-map
Date: Sun,  8 Nov 2026 14:20:04 -0600
Message-ID: <179416929378.628393.12814297492759225393.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
References: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
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


On Wed, 14 Oct 2026 16:38:20 +0800, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
> 
> On Talos, GPU stress testing triggers a synchronous external abort
> when zram accesses pages within the ADSP remote heap.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Make the ADSP remote heap no-map
      commit: 99c8bf54fb62f458b4bd69fc7b42c6d344d16758

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
