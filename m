Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269940;
	b=2pDz0g5slkgT7yD6K7LRh8GbfnSsq/xzLKvkpVixwDRGjncZew+mrveINhCRv9ZwixVf
	 NlpnE5x4JvH4zvCpuKIjtk3kjPnABd6VpQh6tw8WOiAArXHupmye28Zvpomskn5/mh+7n
	 W85++tr1sYytyCGs1RDeQ7nd1OYFWYlo2oFhBLS2cLMK44w8bZMqP533TN9RaDDAMOiZ8
	 Um2sHNNzBbUlqGgPt76ApYmgBDblKIvmqsbDw/cF+SY9wiMblDWgweTHtNEKKNHAIggpW
	 1Fh9K+kuBzThIf+QziDH0w/dZ6lwlikegWXl2UEQNAxwM79zM0HKFKoQSOckoKGMw/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269940;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KHE58ax+PEyPhniZNrxi/+FM1uEajhUVPzOagR6Yuok=;
	b=u9W6M8LQixZAfy9QWwLSXdoOekj4wbOoAAy1Q7j5HkxhUUCfFouNG1IHwdmV4Y15Hsgt
	 fxHuYToExs4t42kVAsUU3nkzGv3J5Z2NZHY3jpM83A2KiCaoXYhmGiiQclwgdJrdzrMS2
	 TEUe0Muy/Q7XU87LF7hVGdyvFFIP95NqrvoJpDNLDO882SAqSlFsknxRqoUnB4sez9TTn
	 i/V5NwIlGLEBShFx82MoVRXbCWWjNxsWSfCUldTGYVDuC6ue2wHG3+2LRu/0uLHcUtvMg
	 mrYyzGNslq8XSrPm+pMB6PK1IYIyqDADem/vReEzToKJoUSqdicOjvvaldtkwVIBUag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EEvKZ78d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818DF606A31C;
	Tue, 10 Nov 2026 00:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EEvKZ78d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAE51F0089F;
	Tue, 10 Nov 2026 00:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794269940;
	bh=KHE58ax+PEyPhniZNrxi/+FM1uEajhUVPzOagR6Yuok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EEvKZ78djbpGqeIjeOwK5XDBVYxNbW0qUuNh6pgsFntgKUFz+fwfpRuRehHF+cQK6
	 RwDTtcqxn4BjTZ7cE45cMqH+yYUM3f0CWSnkqicNH3AnUtPvTV4clXzuIAzbOi7sPa
	 LtEorvj6GrP9KZFohTvoI8aLNkwgDeow4iCGCkPb+qMZSgtZ97aXX5U1hhpaXio2im
	 RG0Fiw+QYT6lo8fRhOEpXfO/l5wRF1EwpJ0c+Zw0NwoejjKVVqjP3O2412kwqA9463
	 Fgpcqg7KzE1ffq3a27gDSv/IPm11AqrUB7yRWYxReOtGYgiPla1iVW+ZodJ9uIZzF4
	 h6zWQJFeIistQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/8] Commonize Glymur regulator settings for fixed rails
Date: Mon,  9 Nov 2026 18:18:52 -0600
Message-ID: <179426970787.877162.11018805236130863553.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
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


On Fri, 06 Nov 2026 10:29:01 +0100, Konrad Dybcio wrote:
> Certain rails are predefined and will ALWAYS have to be the same for a
> given PMIC configuration (due to electrical and other requirements).
> Factor these out to remove a layer of pain when creating DTs and let
> one have a better way to reason about the settings across the platform.
> 
> Glymur-SiP will be the next target after/if this is accepted
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: qcom: Add Glymur SiP CRD
      commit: 83402dd1d06a97eb2a377d65afee334c24a5a3d3

Seems I tricked b4 again... 

On the way here I had to fix up kalambo-crd, so please help me double check
that I got it right.

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
