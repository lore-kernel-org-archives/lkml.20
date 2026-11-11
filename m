Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399305;
	b=r8cSsFRp57DOvSQ1FZv8/VrvSveHbuuQPaw4vhX/k4TN99qZk92JgOoZkPvIkr+fG59o
	 dd5zKZeK2MBPybEkkI2nY5liiaco7X2HupbTePn5CJoZ85agzebkB+uI/SQna2reyr+lR
	 p8VRm7MYaAgUwP+onzs5bYX9kk4SVKTBi3ID72YhUE3cz9S0cXeM4vctoiWJEqUddvjem
	 Gft2HeZ+9+e4slcmm91m49SuDJugg+/LTps9j0IwMPn3qbW1VVrcXLX68KHDY4vZMiH21
	 99oxHs07tTqKDoEE5dl1CAm2qF9EjhJaxF9Zz6K0kGIONIj7kfu4/R4/rDuKmQpoo3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399305;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Content-Type:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hpjyt/s2QLGuYGj5afRjh1dUyaldroQS6rrCr7rFHZ4=;
	b=QaKWqMKMHwMpkY3CzBrPPwATWg6g4kzOXq4fEDTtFaChtOAjj2wwPaBpW/qvYyvry8kd
	 UB6UV0b//d1O8USqjSOorsytvIyBPUk/fwk4Dxoc+avFK42+2KYt4EomAAn8mOXUezkgf
	 BVCDb0jcIDu6nlQOErSu+tT8xoPZ7lNF0qqGIDqh7eDAJ3CwLKPgFXLx4gXVxmFgjLvwX
	 DljGh/O/crsYOB+M3rJC/uARPFb0oVlGx/J565IyNfnZA7Q+qM/Wb4rggLZ9w6v5hoNyp
	 IxFVKGuoPAjxCICmbhdaCmz5bc/0CsRPeSGN611jWYQBc19/8SxSa1fEAxKHKqYfKtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYrJQ9xT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F10F606A8B6;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYrJQ9xT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794399304;
	b=TMj9kJ+gxI87sb6s5IWrw85AaHkA8p931HS6965bJ23iAMtij8Jv+7Cbe6/K6avko4JS
	 WkaWb2hyWkkQ5xS0Jg0twUpBTjgk3LsUuMYDgFDkCYOSoWfXbr7IQY1q8WGro8wvWTIFi
	 oJqfqThOIHW/8fC5Mwuj7UzdCT6NrTmWBHNthQzGQqIX3N9nZNvDx3zDcDrJklyARbXL4
	 MOeO9A1OlmLWmJV8JOPAQtWdqnYPcHwMyQlLaYDz7TEnRlQdhpCzKFjxt+IDU4+9pDTpM
	 B9WHgF+VZyyp4oMEja+VAMje12ccHWz6/c2gyA2iRh5yMNaqgd6R+Ktrmz/lMieOBrg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794399304;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Content-Type:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hpjyt/s2QLGuYGj5afRjh1dUyaldroQS6rrCr7rFHZ4=;
	b=2vy3O9QxBnxWprSCZZvYw7FJSW5bqlUMjxDmJYru28jT76QSNPrtxgAIkMhrOvrfD16R
	 I7+qNUd7ktx4qWSmlxgjOw2/hyDSVYYHO2Ib1Dj9ahDzlpCCl0phitQ74Xh0DbXM13trK
	 COInzMo6HmnNgzGAjS5qTJxnyz4fsv6DI837nv2Slr8Mp0mPWEAjJLcyQlZqX1WyUPiM7
	 eEQsy2x+cl6nHzfG/9W5bRfgQLchPI/d02YulSHQFjOhssMY8UthyDWy2TBKvy89iExGU
	 8C7ae28lCadltk8mchRmWAvc0lq+WUK1QPGdP1qD3elPeRTzMJUZAFYN/c8yxHmnKjw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 208AE1F00A05;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399304;
	bh=hpjyt/s2QLGuYGj5afRjh1dUyaldroQS6rrCr7rFHZ4=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=LYrJQ9xTQLhEvP0OCZAQT3r4k5qPkoeRwQh2LlWpSB923tU/flhWrqiKJZxG7560O
	 wyEmuXbc9FB8Nq+KthntyWPP9qXNvWxIxH0G8s8/wpgQVcdr3Hkf6ZP89nLVnqjtBK
	 UZMG+ON22Kpic6RMWf/v/EQ9Ry1GAyP0gtR+yShMS6u/JDPoyZdJuM9vx0oxLUVtj2
	 O3u8jnS8i642HY14njjaWTzR4JBzlNz6y7aYmN7a+CFW6KzPcf0EjWXRxoLTjRKqqb
	 aZP77IAB1wJnvOg4K41S8BsjBvWZ8h2us4fiA7ASE32uSnYcnvx0jhyDPcAs/BMWtL
	 8oDsTnXdjM1rg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6AABE48F89;
	Wed, 11 Nov 2026 12:15:03 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, robh@kernel.org
Subject: [PATCH v2 RESEND 0/1] Enable I2C2 on UNIHIKER M10 V1.2
Date: Wed, 11 Nov 2026 12:14:34 +0000
Message-ID: <179439927405.86676.18160135777424812496.i2c2-v2-resend-0@crepuse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=609; i=founder@crepuse.com;
 s=20261012; h=from:subject:message-id;
 bh=skhAdHA3RZo/qHb7dMGwTpa8Pr/oRjo6b/TwlaWkzuo=;
 b=owGbwMvMwCUmds2G2fVJ/hLG02pJDFlfYrSefT21L5jBPV/5ytZ4lWcFp1qis9ve8fQK/5bZv
 rEzUzmrYwILgxgXg6WYIstsUfbyQ80rrs2d0GQHM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFTv4Gdk+LezzXSiBHd7yoc+3oteeUvlKvMSVLvvRqdZhvw8apv4geHHn9mPMuL
 0lVYd/35aklMtpOZ9lcspzw+60e4SWwIiWbgB
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
Reply-To: founder@crepuse.com

Enable the onboard I2C2 controller at 400 kHz. The rk3308.dtsi pinmux
provides GPIO2_A2/A3. This common board preparation is independent of
the pending touchscreen device binding and driver.

Changes since v1:
- Normalize author/sender identity and preserve it in the patch body.
- Recheck ordinary and strict checkpatch and the DTS schemas.

Mizuno Miotsuki (1):
  arm64: dts: rockchip: Enable I2C2 on UNIHIKER M10 V1.2

 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 5 +++++
 1 file changed, 5 insertions(+)


base-commit: ae965b9856f033145e292b0c29082a26bcc45efd
-- 
2.56.0


