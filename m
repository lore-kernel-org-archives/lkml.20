Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515210;
	b=5jMkm4kFSIw46ZogAnuzp1QpeHM9TAjLCq9t9zQhwci15rUUtgkQWiRUff/K18/A5SOQ
	 xWk4IlL7FVaFCXDk50ivdwBqCPENhNvZqwdoOzskUVKBcdSJnSMenGgbvYkFr5Q7C9WE8
	 fppKbVUKrHtUVyQ9D/EFST4zWOJ97+4cxzhbJhgq9BfOTH2kYQTkWrd7pRy4ERbOQ5GCi
	 folvbtN5lcSbiqgWvFCprXsriCIPtwJDPbd/EfJZixFFCspdKtLiel6+1L82RhAfuSv+b
	 YHl+0cipdE7xG3E7HG8rXAI/Lt6SK6Y+G6Xzwdxix+E2u8L425UFanxhvdYPS2iOD2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515210;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=i8o5XpAdxW8YK+91ZogRFhYoz3DDkqo9xO8qQk//tAA=;
	b=Ho90L4QEWIbVqMs7XqpSqDnijaP8PkGlJfRdpXqcRmqbNGzVv/zO2GIaTekKrxakXzPz
	 CaY2+C/NuvHm+3w6hRhhHGwv3dfvChpwffoTQ/TSGpR01k1dyHoGjLPmqbZeuzRptlZK1
	 0QagrxcYJwhf4MVxpiUYo3hQUeZXV+fGbErJgiW+uI4AjiWUPlfQU2Ara3OfX4RJ6YQEE
	 uNKkxUxvi6QiJ2xNcP7aXoRJfoUXdgLtWdWi/H2yOzIy62/6f31QcF6qWLFZKwflZ8wjN
	 bjJMZrA0fupNYSF5rijezuGsU4zms3o8jzd4rc206EVzcUxfRCcYpexqnNZGlAchoqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtefShIE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB78B606A31C;
	Thu, 12 Nov 2026 20:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtefShIE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879451F000C4;
	Thu, 12 Nov 2026 20:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515210;
	bh=i8o5XpAdxW8YK+91ZogRFhYoz3DDkqo9xO8qQk//tAA=;
	h=From:Subject:Date:To:Cc;
	b=gtefShIEfOc9BWQ5+hBbq8zu7RKfK14o7pH0CVoDPx7i3B82P+z+LNXdK4BVGle1I
	 F+Bhe3b60ipWwnO1HtmZBeZhwCGsmkTRNVF/EoCHWs+/u17U41gh6GRJiQQVvUweHZ
	 QI5Hx0aAvRw2RzxrZiNqZmQxeoeQn0YcS82U1n0WvlgSQPqfjisGwvk4kg+dwOxkk3
	 /AHhJ+EIORKkT3tribxYapNYBzidEZynQdrCm+Jc2whdJBuYQfxICAmp0XVZlXY+kN
	 T9MEvXb28SE8pK7v7n/2ng9Y3FMWSciOMHi5jcC2iTvhTokLirRUnnLYFhT9RCQ6Cn
	 TfV63A+5ofaiw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: Add MSM8996 SAW3 compatible
Date: Thu, 12 Nov 2026 14:26:38 -0600
Message-Id: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDVpKyxcRSx0TBmJvw4iEXdXL
 L/k5V0gFJgEyuSCQAcLz1OESRPAvpk6UtxGg9W2MMZY1W5O1IrzqHJvs1x7jY4QYr8E8nx+r6r
 +LbsbCLd3APf9AGqydGZtAAAA
X-Change-ID: 20261112-dtbs-qcom-5f2350f0cbec
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.16-dev

'syscon' nodes are required to have specific compatibles, but the 
MSM8996 SAW3 nodes are lacking one. This series adds one.

The binding should be applied with the dts changes to avoid new 
warnings.

Rob

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (2):
      dt-bindings: mfd: syscon: Add MSM8996 SAW3 registers
      arm64: dts: qcom: Add MSM8996 SAW3 syscon compatible

 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261112-dtbs-qcom-5f2350f0cbec

Best regards,
--  
Rob Herring (Arm) <robh@kernel.org>

