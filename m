Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794877521;
	b=eHqTjXB0xvtIOqztW2tpvSTawfk+/fQEcKgdpF16zIVqIFVCd8uo2fGYuxzUSNVgXjc2
	 EZKIkAVz0KTf4H+s7vZrGX3BV7oNjKrrkx51xCeqojp1qqopss79Xqp5MIwrSSNHU5gvx
	 3YfagbA+Asw0reqF+i0DQ9H1f5XH0t9tPJBQ68yS7ExxROyBh5LcdjEwCgWxwkF1RhISC
	 70a8I1g91qmXkVdNZ+Ay7Ohn8F8R6HOfZLXjjPgitY71fdDlASBzywqdk8gFVH2//MmeC
	 uq4GewhwuvqDIqjO5lziR0oTYq7UmN65XK6ZzGq0KBoAVAm5PzkFGrB/vfroXx4YH8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794877521;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TFVgaovpCdXFCchb47lWtFAHAaVIAA+TVCN/Y84x+Zs=;
	b=YPQprQF8ZtYGe+kaz94YygGg7acR9SrmuCto1HOUXW0U0wwnzqIFG2NgPe91sleQjQuR
	 a4FZ00o/vgZYYoBa0+6NwZa37KdwQa+LrXjBulH0C7PNewCOI9Yv1zTI55G8wlFOGPBTp
	 o0QdDfneKg1RNO9qRS4wlcR1syk5jqXhVa+rqxVy4u1XuSMb6OLku0QmfuKJ50We1vglA
	 +3dWX5Kx81moa1XtSGBkMH+E2NyXgeiyrcJRBytXAropI4TTszB89v6Ymsksnqzbt6Q8z
	 LGwm9VGc7SYOR03+JYYo7lyXpYb6tYxNfJxTvoBqBSorOZusZA52yNw0ViFEr0zvYIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n2fw/OIp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87C2606A88B;
	Tue, 17 Nov 2026 01:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n2fw/OIp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D931F000D4;
	Tue, 17 Nov 2026 01:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794877521;
	bh=TFVgaovpCdXFCchb47lWtFAHAaVIAA+TVCN/Y84x+Zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n2fw/OIp+7K0K/0LTKt3hgFIyaYyNVus6Wx40R3oGdx8Pf5FCjjTgV961RfiJ6nCh
	 9F46RmiMp7Sl9TTSB1xtv91d3vIbCBBQWIFch37Uf/SDXZ6ML/VLWNJuwcrJo2v6fX
	 RdAcKZWOVFYW/NccbvWZ68wp0mLPTiOkSUTldgMmkfymidzHc/DS005zyA6DwbHUAr
	 R6nKyJqM8+zjObqKMcRlLkwOKDu583bjMGe/FfsvD5QnGPTrV+BMcGOHQQCiNXdYES
	 L/XLenuwketM1zrwJyn13JC5mnu17L8A1XLNSx9FiMS5eWSCliUtt1J7acUKWDuCxA
	 gbaJTEEQFRb1Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] Add Novatek NT37705 panel driver for Fairphone (Gen. 6)
Date: Mon, 16 Nov 2026 19:04:50 -0600
Message-ID: <179487749299.432567.493550995991347090.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
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


On Fri, 09 Oct 2026 13:24:59 +0200, Luca Weiss wrote:
> Add bindings and a panel driver for the NT37705, and then enable display
> on the Fairphone (Gen. 6).

Applied, thanks!

[3/4] arm64: defconfig: Enable Novatek NT37705 panel
      commit: 1ff72de9902a955b8446bba2c56942028c1425ea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
