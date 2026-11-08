Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169434;
	b=PGmyJG65ZofreAGI3806V3ZeAq3TaYoF4zF+FatWE7srVMvxmBQU0CQe+jNZx16zBWeU
	 nb06ZXiivZ3VqYWRZqMB5LyYV2Fsz+09DEYk9zL9lqzjyAcazSXSlqcRqjCyzeql8PdnT
	 ZZOKenCFo8VwIvFFuQocadMiZaE8XofJ7l5sQ/KaG2LLq2iUBWoL6sZKRHkafpUynvPKF
	 DwLZeEZdgOCWyjeWK+a9W03k4Bo3FjGnRuK6zms76yQVclwSTriwuyofaL3J5EkCutLXI
	 tgA9G5qdmUHnW+51LMarZ7h6fiUxCdh82Pu2rIJorriCfcKnbefU1h1p/OMyL4GrZxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169434;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qBaFjQFLcBBSS0/yQ9Bg9k/67NFL5hQgBHEWS8yf9kI=;
	b=I7rGi9Tv1pFJ7untXlJJnyRVP75n0caLsjvUyOVYbSqaw6nExgHdoqSC2dL3n48rw3Nb
	 pfWtyuXdVvejfGyKhIcKFCmbJ9V36zf6zEX6dAIL07FQ1wGPeazbm6bMK+A+RrVlkOVMM
	 EXCYMu2CbTEvRE/pnL43PaeiyV9jIaPa+aW3krdZq4n094Wl5n9hv23cfYv9arFJJo3mU
	 wma+YHhCRT0n/TLgt0QZoB942LMnqKLNK9+rMv/35QTD44obqA/MZlm6Mv4YupLeavuQh
	 iqi1ZXoVGqtABMsvJ1WbhX95iIAQRByyynk0QblcROfUTuxwmqrpXZc90e3L+k27l9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mnne1OJ+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90536074FA7;
	Sun,  8 Nov 2026 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mnne1OJ+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523781F008BF;
	Sun,  8 Nov 2026 20:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169433;
	bh=qBaFjQFLcBBSS0/yQ9Bg9k/67NFL5hQgBHEWS8yf9kI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mnne1OJ+viWuJ6aHQAjROXw5814T7pS5sGtHwzXTTzw4CtTQOTjZB09A/MrlGZdAB
	 w9aHipCeUHb5sIBvOKvvIw3lKyk/HZUVL9Lv+OMU9M/suEsl0cuL+wjT2lX8c0dI9Z
	 OpSLOiy5JcihLkbanYf7K/g0r/XK3vhWe1fMrkCvhhQGuEh3MWzRMsTz7YljPxusze
	 fr/ymr/REBAAZRdWSVKW75U8wpzaNYgTn4ZS+sYzvb3SgBSMjIeaDcHT3bBXxJzHFS
	 ORNPRtpAiHX5Hn5f1ayn2E4ejAAOFBZqhVcIUQST+dXfx7FSDHvl58vP7RiTfqLoj1
	 Y/wzF7meWE64w==
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jasper Korten <jja2000@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Federico Amedeo Izzo <federico@izzo.pro>
Subject: Re: (subset) [PATCH 0/3] Support for the Samsung Galaxy Book2 Go (SC7280)
Date: Sun,  8 Nov 2026 14:20:33 -0600
Message-ID: <179416929372.628393.6400266306544455392.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
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


On Mon, 12 Oct 2026 20:11:02 +0200, Luca Weiss wrote:
> Add basic support for the Samsung Galaxy Book2 Go laptop. Basic support
> is just eDP panel support, devicetree bindings and a devicetree.

Applied, thanks!

[2/3] dt-bindings: arm: qcom: Add Samsung Galaxy Book2 Go
      commit: ac299104cdfbac5b0fa2846eff77192d804c60ef

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
