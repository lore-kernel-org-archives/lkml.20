Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794091380;
	b=3b22lvtpDQid/2w1tLyCzPb/kL26IrhGO9J7t9vSngcbu/3x/RcM4ZsT4v6AlOnwi3+p
	 kQkO+vk5e7DLjStA1jPvX18JZAOty/QlKCL1lIDTqwt9mEKHnCJgQeQtjnw3KWfE6Chyj
	 8waBJkE3Hc32hme4BRUudvtgQNiPLSjLzpMKN8dhEsD5hrqi5F64pZQqckf22ws9ffKXL
	 p0LVIIpdy9if8Zdgx4lUqpL8UMYLirxxK4jVzsdWvGCgFhstClWtIyOloayBjw7zEFe2G
	 jLMvzqpKyGaEEwzXSNKf+HIEFm0/RN9kGx8fLoN8LKfxqxh2Fmm6FVdFLiq00ndTX2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794091380;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=tiQfKsFyOHw8u3O47YSkIKnn3TyNxLXR1SdumyCP9wU=;
	b=XykZOCj0dmivjrlTg/JkcD1J7DkQmYss/xF8NDW0XXHLD86NJCxQzwxyqokTFVgzuctx
	 +ruKwcoC/ZKyyinz6JkCE9g01ZOCLao6QDTDewQVT1ax3LZnZN2xC/67k2HhIwxeQaTeh
	 eccV//oGTWHcPJ2gRe+Xe0RXXeeI65vBEoq3WBIVe36BH9aibbqebIG6stt5JEbORXS+E
	 AaRQFTKVPmgPg4slBUzFsp724zXyeelrYb1npGNjwT8NxeOvTu30oUCzPO8pT76LocA2z
	 xJ6uv+jCzuVwlrQiNuUjwXCwErXh6SqspECjoiU0yOahIh7ig28Tllp80mL/v1GMkmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=RtvRe9qE;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C2A606A32D;
	Sat,  7 Nov 2026 22:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C2A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=RtvRe9qE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794091376; x=1794350576;
	bh=tiQfKsFyOHw8u3O47YSkIKnn3TyNxLXR1SdumyCP9wU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RtvRe9qE5i/jPoic9u5cS8N3Ix+J2IvjMuQzd9FvgK2R3Uc5f4aDBPle/2tyEtbVg
	 C9KW9NBX2yRs6jmNv37tgUVgzByy1mMZkVOiDQEvCiUUF1CBMP8SK088Bf/nuovbZ/
	 rCTEgUVNNlKYwymDFoVQsMaxAWgB2eQaiUINJ/GXnqanhV6azcA0EGjGH7TnBCORCu
	 ZDFoPuBh1RYY2XOn1oegXPOXa/ZQ7Euyle39ZjbynpaXvJt+ezAWxltMmhJFZryX2V
	 YYM72C/lYyCz0wx0kXrAF9OQQ8iZCe7nJqSP2YbVfVmbiioij9k64FCWUVGf5sgv5D
	 s1w7HOoni+2Ng==
Date: Sat, 07 Nov 2026 22:42:49 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 0/8] firmware: qcom: enable UEFI variables on Lenovo Yoga C630
Message-ID: <179409136720.63533.3499513835986215877@pm.me>
In-Reply-To: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: a8236e0245e5166aee49a2ef1233446eed5ea918
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

I've been carrying patches 1-7 of this series in Omarchy's arm64 kernel,
rebased onto 7.3, for the reason Tobias gave. Every laptop we add needed
a qcom_scm patch on top of its device tree. On top of the series, our
table also lists qcom,glymur and qcom,mahua.

Tested on a Lenovo Yoga Slim 7x (X1E80100). The series takes
lenovo,yoga-slim7x off the table, so QSEECOM comes up only through the
qcom,x1e80100 entry:

- By default, uefisecapp comes up with the same 118 variables as
  before, efibootmgr reads the boot order, the RTC gets its offset, and
  a test variable can be written, read back and deleted.
- With qcom_scm.qseecom=3Doff, QSEECOM stays off and the laptop boots
  without UEFI variables.
- With qcom_scm.qseecom=3Droefivars, the variables are readable, efivarfs
  is mounted read-only, writes are refused, and hwclock --systohc
  returns without an oops.

Tested-by: Birk Skyum <birk.skyum@pm.me> # Lenovo Yoga Slim 7x

Is a v5 planned? I'd be glad to test it.

Birk

