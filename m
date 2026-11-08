Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169380;
	b=SbTUfOKydwjZ7Xax6oYDMVJs9eDuR/yPvGkJ7HaiNnQsV3EEoRVdXCwGAX2dmsBql/rD
	 SyNlfX3Ax2Sat9LEgJlW7BLCwhGKVrpPAoup2pf3BHpQY7QcJbNT5hUpS3VyRfmjhSBPV
	 +lj/VMZlp7hEQrOTSMKK4jwdmfHu1mXzOonh1xrOCcm1190W/cuSiYmMlyQjgUsg9Ia/y
	 yn9ACm6UJEM88vtmpMqrZPTMx/ZEi0H86MRerU9DP8/rPKWTXH6QSsGJCAn8TcRTyUi1P
	 mi6i6WkxZpQe0TAjPrOZ7OXgtK8Vh2axImN1LTqlzH4ueZ3w8llfxN/hTaYPfdkCjug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169380;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6Kn25UBDuK3cFV4znjG9SOshUH3lh//tgSS+aaXgEhE=;
	b=w4HEz/X/njtqI9QD0qv8YB2rjGGSgKFlei3Fzbi7dpYQFtvXrrxBuEHcStPzkvoyH+e3
	 7GGCR/XH8BoZk6HfS8yR/N6LOemkK9E7s1yi8WFK6wCYok3WAHXg/hwKD9J9QYREaVyax
	 wKFI8gnPSn4UBlApdOtrok5MAwvIvNO4dvRmbspjVjYrmNJxc8S/4iZvRdDnVxX/Eh/Ql
	 9e5fNHkBLfg9OcHQvaswndtTqoJNWeRh60FODDqxxAwH7/Nv9Eq+ouEoSsu8PtWar0LwY
	 puJdrr1Vspd4zZ66MXleZ1VFYo/GT7u9smNbzkAKoEIa5HUwfqjRICA8zMXNTIkS24Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7whbi5I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27503606C74E;
	Sun,  8 Nov 2026 20:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b7whbi5I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A34B1F008A2;
	Sun,  8 Nov 2026 20:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169379;
	bh=6Kn25UBDuK3cFV4znjG9SOshUH3lh//tgSS+aaXgEhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b7whbi5IrM5UisWmJS4HEQfUghj6ZOgteO6yrA9b9MdUPzBeq4ak47XZlXfzX1QCv
	 +GDNNlkKh8muCdwYMJc8jzeEi+U6plafb85vKwGvX0fMdIMgFKyKj2X/GUUROXITJZ
	 I5iBzqEu8WNWiHm36RxfOv2xhBdwGeN21Q80K0sDeBPHU/VkL2yX6dB3PMjA2RHfJ4
	 DvuSIz1pi5tBuYVtgP5Hc2I6ea3Rha9S6Jqb4YhqTkxXat8vQu5Sm5FjXAYT7vqUYb
	 hZcjRkmKZsmb2fgznIRz37CD/oDdCcPHE5FILhDxHo5kKXRpJWRlkvY8cCZoEiSFtr
	 2ecLwG8XU1fMw==
From: Bjorn Andersson <andersson@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: tarang.raval@siliconsignals.io,
	konradybcio@kernel.org,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support
Date: Sun,  8 Nov 2026 14:19:52 -0600
Message-ID: <179416929348.628393.10724857709383743399.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009085041.181160-1-himanshu.bhavani@siliconsignals.io>
References: <20261009085041.181160-1-himanshu.bhavani@siliconsignals.io>
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


On Fri, 09 Oct 2026 14:20:40 +0530, Himanshu Bhavani wrote:
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.

Applied, thanks!

[1/1] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support
      commit: 26bca83dc724e4f5e111b3b2c1a0bcb9a624afcb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
