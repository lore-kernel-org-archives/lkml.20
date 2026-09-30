Received: from e234-56.smtp-out.ap-northeast-1.amazonses.com (e234-56.smtp-out.ap-northeast-1.amazonses.com [23.251.234.56])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F14483A4;
	Wed, 30 Sep 2026 06:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751494; cv=none; b=IwTLeRcyn9+9LAsZOGFG60GIUuM1cHSnV9rUki3YW4NLAId+Rj/WvlXrn4IiBz/MStrAhADXJl7mErlJ871/pze1oc8o5KPqwdE/n5dLgxdQcCKuNYBIAfymCPvqkMN9TxQ8AZJ9znt7+lb/pNJm4FctP3OqSwJBq9PzOzpLeLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751494; c=relaxed/simple;
	bh=Bh6CFp5rAvf83mkNS+YEKmzq/qxSt8+43QAaWKw7wKM=;
	h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type; b=E+wNRD7RSB4fh6bybeeO2Gh+AT4qGDyraqNSHnicp4JF/PSnS6eMlJfMdQj3/EsgizNLOejRzq9LxEEBpZtpw/Tn8fMWDAibBA1/jOBYLPxmtxQnVEGKeix27HXdeBvQUEw13iPm1uCeZlrs9IPl0JkBQ/WW2qx9MKJyy3iO1u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=2NJOGLNm; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=gFa8k/jv; arc=none smtp.client-ip=23.251.234.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="2NJOGLNm";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="gFa8k/jv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1790751480;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=Bh6CFp5rAvf83mkNS+YEKmzq/qxSt8+43QAaWKw7wKM=;
	b=2NJOGLNmOCkGSQeabrAaPbbuj7VUt75MmE0nuJfwvCtIdXBxn1Z2zK1SbTUKTUb9
	ZOOROlavoinMi4OyZo0oKOCIxOva18Kz/kE3NzGyg/PVZacr3iH6rqyztfZX0QRa1AN
	o3bdKrTdACBuIhfIjGm1E9VOLRQrw5lflA6b3vEA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1790751480;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=Bh6CFp5rAvf83mkNS+YEKmzq/qxSt8+43QAaWKw7wKM=;
	b=gFa8k/jvJSAYjyxYf5egDlsJu+J5rOiR6Cq0adsYuqWgUK1rWx+wLS9w0ru3tdZx
	5mNY50mZWnnuEBSwSZmLPZDNBEBcVf7/xthy7sXtTc8uMamv8X/p5RaNPWkZkPKEGYG
	M34YmSbNxbEPYxVjtDfF5Fh2ZzQaaqXpqfdLoGJI=
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] arm64: dts: qcom: enable the Surface Laptop 7
 13.8-inch touchscreen
Message-ID: <010601a0f11b18da-f4821bda-99b3-4c3b-b188-2c48bafc3c36-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 06:58:00 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.09.30-23.251.234.56

Enable the I2C touchscreen on the 13.8-inch Surface Laptop 7 (Romulus13)
using the existing HID-over-I2C binding. Normal touch and multitouch
input work on my machine.

Changes since v1:
- Drop the reset-gpios binding=
 extension and GPIO31 reset description,
  following the review that this =
property is not accepted for the
  generic HID-over-I2C DT binding.
- Add the GPIO38 interrupt pinctrl configuration with a pull-up.
- Use my real name for authorship and Signed-off-by, and remove the
  author's Tested-by tag as requested.
- Rebase onto Linux 7.3-rc5 and =
order the I2C and pinctrl nodes.

Previous series:
https://lore.kernel.=
org/all/010601a07a6500d7-57284739-a505-4dc0-b12e-f92177607374-000000@ap-nor=
theast-1.amazonses.com/

Validation:
- ARM64 Romulus13 DTB build.
- Focused HID-over-I2C and X1E80100 TLMM schema checks, using the
  configured ARM64 build directory and processed schemas in $build:

  make ARCH=3Darm64 O=3D"$build" qcom/x1e80100-microsoft-romulus13.dtb
  dt-validate \
    -s "$build/Documentation/devicetree/bindings/processed-=
schema.json" \
    -l 'hid-over-i2c:qcom,x1e80100-tlmm' \
    "$build/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb"

- Normal touch and multitouch use on the device.

Jizhou Tong (1):
  arm64: dts: qcom: microsoft-romulus13: enable touchscreen

 .../dts/qcom/x1e80100-microsoft-romulus13.dts | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)


base-commit: 72d3fcf802c45d00b300f25b84=
8a93c3a2bd7c7e
--=20
2.53.0

