Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169334;
	b=xrFqHyd1dT9s1JzncFbBQTesUvQ26Syb83Tl3qn8df1AYg0sgJAyrx2+ZebJ5mKyXQIM
	 FI7IEMKt8U9QciEnydMCz398iPZDgvKWw2BkgNsF8bQIXpG9/ykNK/OS2IW2O77kF6IRW
	 d6MgeewAxFDKlEEu7z2RxOnPyQdX22+7dmNiq3pOCl3sROEVMe4Yzz451asYl4oUHWNl6
	 1jfy3PqHAktYp31PHoK7nxk6QMkb4UxCxZRjoDcnV+8wRa8Q/BRAUcQYzSpgwLoyafFvZ
	 BrhI5+IU/NKL9+Xesgjho3qodFavjjHpqdAG/2m3dcvb4miFHKyno2BDe7J/V1KUmZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169334;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nZVlCUcftHhSJqjJ1AMG/tLB09JAdFuweNRnDedK9bc=;
	b=roH8pFWuSVbnH0MGF9HwDy8ptrtOh9AJqODLV7ZoeGxGz/oQSYOegR71uOcROLLMXybw
	 /erL5VFpm7Vrvs7ajnAaWV9nmLtqyWjGUIxU2fG5twj4iQS1oFQHKEwoeh76vKy1qwgx0
	 1+Cg8e0A1I7Zbmis48E9q+cc+ZjKqqbj1ycwAJKq0IbdKt/jfi70SK4KLrih6pR+bqsi1
	 nTLHxhDp/+RHFIddwOGEZGTypp0N40h3iA7acvMdppQBZ/NH7mTnCfEf8dSI85KRXLs/k
	 jbNjyaFXmHoKSeeHbqP71rWW99cypT6B5QGvBM9GLbUm08KBasyo1ICrXNppKkCqR5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlYTJ2qw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770AF606D81F;
	Sun,  8 Nov 2026 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlYTJ2qw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D491F00929;
	Sun,  8 Nov 2026 20:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169334;
	bh=nZVlCUcftHhSJqjJ1AMG/tLB09JAdFuweNRnDedK9bc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SlYTJ2qwcAvS0xTWb+lNgy0oqQkN/DAxrlw0syzQ/pRh/4tu0QMN8XRTwhA90Gev2
	 S5tiN7aGw72UlqA3meL1noj2lbRbrOyGHh3Kv3yIRlg/GqEeXYBqSm89cdCRCmb1Yb
	 EK7t3sYrG/hx9lopAyrF66ezB6hjnfzshxXdz/LSYcAqKHFYvVyx3O3JpCRgsS863C
	 ubDKB+gPp84+JZQf58EM9LmyK4NnMaXPfxZX/QSAsnmHfgWv3CgG34ncMB7kQtK94J
	 URZP48zA2aEPJKioZvgjwJ0Ewl9nr1iRVI+rnngrkxWaU6vXrhal7KunPgPNPZowwm
	 AjVWgY722y3EQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dale Whinham <daleyo@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Enable IRIS video codec
Date: Sun,  8 Nov 2026 14:19:28 -0600
Message-ID: <179416929268.628393.5887155310474483062.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
References: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
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


On Fri, 25 Sep 2026 21:51:03 +0100, Dale Whinham wrote:
> Enable the video codec and point it at the Denali firmware.
> 
> With the firmware in place video0 and video1 appear:
> 
> $ v4l2-ctl -d /dev/video0 --info --list-formats-out
>       Driver name      : iris_driver
>       Card type        : Iris Decoder
>       Bus info         : plat:aa00000.video-codec:dec
>       [0]: 'H264' (H.264, compressed, dyn-resolution)
>       [1]: 'HEVC' (HEVC, compressed, dyn-resolution)
>       [2]: 'VP90' (VP9, compressed, dyn-resolution)
>       [3]: 'AV01' (AV1 OBU Stream, compressed, dyn-resolution)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1-denali: Enable IRIS video codec
      commit: 968d33742cb9b8ea676e17eaf48dffdf01dfcbf6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
