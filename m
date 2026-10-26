Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052628;
	b=GyEBxCHXPAQfRoMX+im0umWBIS6DWsjS47tO5ANFEnBxu1WvtHVEDpJBn3//mWa68UO5
	 V6f7NpLE0GILDqmj1UvaHoAcmWi2/AWkJ0AvtGhIyS+2p1txMMnjYX0sq9u3VH6SsIoS8
	 Sy9PiWb4ngzuGFD/6mGAfT8XHQwHEM0OS4cQTjHphemOiq8jnjhS2IeXl2MXTx0cvcyYO
	 hGIVoPGdxy/JwtomGEd5h0llLj1yvT1iL+H9bKGedofkxDxjSgIrRD2k57rQ8t31U9TVv
	 ms5R9i22iUI+UyXfiL34BUt1oDXtLy14pKl7em9WOaGbQPcHQgDzVXvqMKoQV8tvNow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052628;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xQHquqb8tucALptUniqI688SJNdOnIsODYIm3mHTMxA=;
	b=JHqWniBdcRuHR2dsXJct44qvt+cSC/89MQxDCDAA/Ius/VlKoEze4S30Zn6ZWJ9HMTlY
	 NjPySMgFI4XmMKd/Kk4dt7nAdLFMXyXA0UculuQnrwQis3hPgI1/1X8owMT0Bss8CzDEO
	 rSlRss5e/3syDNONQkT4tWxiH5yKVlW3A9+On8VlcK+wBWBPw4rvLrUu7RZrilU05p3xN
	 HuYzrZrFLV+uKxvo5D0AgwrWJQAPpknHCEOzDsj6lh9agPWGh5pD77xJcXLWA9LdlWCuD
	 +y7vetTqILX27K2lWfjBGhZiUCyQVAmZuo8/rJelYpJV6VzHwIS+Kx62aQyvFUH3z1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=xl3VvVB4;
	arc=none smtp.remote-ip=109.224.244.108
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD23606A327;
	Mon, 26 Oct 2026 22:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD23606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=xl3VvVB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793052625; x=1793311825;
	bh=xQHquqb8tucALptUniqI688SJNdOnIsODYIm3mHTMxA=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=xl3VvVB4m18YGNJ72kHt7F5ktkfo+xawsLAaIL7HBQPeQdiDEE5oNvtRcoOXMGXLB
	 +cZpwGxjFQBM9GaoDMMKR8vPnYzWgxhxnr8+pccL65fldwYroXPA/UnU9WudEDuWPf
	 pOBu6jxDlriaI2jk6SJJ2UnZjvMCpHi3osmXsk56D5qGskfnAkXiepzm0n5fElluNX
	 AR1XxaBFvGbUPLDP6a+gbwTJTPSVE8QnERyzphnQqZRBJss7bkDyyiXuYoopa1svEK
	 8d2gGBWIxtGkJQbKetnZ26U/onWRZmjYYZAvOPpomoywfj1Ff4i0H+xIUYPdUQH+Qq
	 iNWfxMytaWAJg==
X-Pm-Submission-Id: 4jD79C05RNz2ScX8
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 22:10:16 +0000
Subject:
 [PATCH v3 0/3] arm64: dts: qcom: Add initial Motorola Moto G10 support
Message-ID:
 <179305261663.94591.5491359960257085739.capri-dts-v3-0@michaelmcallister.org>
In-Reply-To: <cover.1792840208.git.me@michaelmcallister.org>
References: <cover.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Konrad, all,

I've removed the final paragraph from the idle-state commit message and
added the review tags. The code is unchanged from v2.

v2: https://lore.kernel.org/linux-arm-msm/cover.1792840208.git.me@michaelmcallister.org/
v1: https://lore.kernel.org/linux-arm-msm/cover.1792703903.git.me@michaelmcallister.org/

Michael McAllister (3):
  arm64: dts: qcom: sm6115: Correct cluster idle state parameters
  dt-bindings: arm: qcom: Add Motorola Moto G10
  arm64: dts: qcom: Add Motorola Moto G10

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm4250-motorola-capri.dts   | 374 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |   8 +-
 4 files changed, 380 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm4250-motorola-capri.dts


base-commit: d053e38e614fb2e383b298ce8fc308a780d7f209
-- 
2.39.5
