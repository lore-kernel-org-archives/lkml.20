Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814801;
	b=R14Ac7o2TdefC1NKLJhOL3iOn30KvIGrDi8DH1UnAOi14kazn8XtA3FSG3TFb8VOtwai
	 K1EZKUse4yJZrK+ed8YkB2NVdXiiZWThCflumBmb5GPkXmlIIUdztXlQQWdknA6pr7CCC
	 MExgz1GuzkGJvRfDrMIC0CIfkVKbJn4L4o4iUzRDRAarSUaxpEY53fqG+IbfHAjUGFKFm
	 Io6xDwskUO278T3Bohx2RH14hsrRYWBoa9S6N0JHbPG5WKafljPFMJGDMyA2UwMhf7d/9
	 AX7lkJfo0GX79ZOBbTSknN7m2gGpKvUfU4wytL6uuf1mLO8k+h+lzcACJE038VuBjtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814801;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vwmHx/jEoeaxA+gJhdJPPiXFt3IiC1tLCejhw2TCq0A=;
	b=3iGAonmkNKTFbszXGeyaH5N6QmlQg+MHQLK/DZ8qrL5qQ9UCanZiXgraWwby09kXRs8y
	 hifgxlUaPOIcj/n0R50kZqaCyFS6aaSYwguHz32/ByoRuBW3FeA4ShsjPXh8yBBjIa7ph
	 YfX2qu1VixICjOczsbm2Ulinkp5VzM8MIfbZAQc+9q+VtpqDqvDNuOUUrDEVhIzYA2C0I
	 1xbS0kaML25fh8dVstTlBL6c8FXeONoGl8l+o+208A8p6gNLZ46exfp3c6H+8V2hFFZO/
	 FbmpY7wKQrQajs3KtKKP/BD40hy8dM+VBgpNswJLlpXuBNtNb+eDeiqla8kOIrMI64Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Wd9ihok/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0486606A338;
	Mon, 16 Nov 2026 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wd9ihok/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814801;
	b=cFrG+2zUaofwlo8XkpEfY2pdsxXwukC+qI6C0mYfezmaeX/MLI1tTxMu4ovorHmW3guI
	 8tkFuyy39Vhkz1jdMr+JdLO/3r1RvnaOYHZQ6e5X61m4rbZlTLFW6OPer8aVnR73w3zpi
	 6MUQfQFvsplyN9caAUdQqT/08fREDgeuo0Wkf0zYnZxU2s6TfJfhbWeKAgLoRbStPLatc
	 VuPGrejn+ec8Cn4TPRgpSOqVOMzpqMpnV2ViYnrKuIWLxj0Sp9i2Kh/WFZlTPaY9gxlXd
	 NKA74RE1iW8WWV39Vki97ZvjdSAeqkaUYl/EuW7EvcPopwbEk6JlYjli985YULQdlBA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814801;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vwmHx/jEoeaxA+gJhdJPPiXFt3IiC1tLCejhw2TCq0A=;
	b=gFCdMwDJAOpVFkiov7sf+jEWi1FICERsPfuRsSx41Bub51wDkqgNkhCY03hEzm9TOoJk
	 31Q0g+M81D2TRZ00SXzb2u0mamMK7lXVQXGsPf95VO1xkiSJx6K0iueomE1/NSu/AfkDK
	 4VRi3Z5Nodfo0TFvpARIvnH4YTBzZcSVIc96OHT4OehDpWJaL+IRwwzjnH2wzBT9Uucol
	 H5/HZNQntIxyh6JCAn5cEqe0IShl6Bo0VGFJ533vLXOifKClspRRjrb8V35uuqFpAo289
	 yhSrHM/EIOABeyClUJV8zxh8ZR1RnHOAM8nT8+nugOJgIe7wLmCWvn7YRhWd2CkR9wQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B781B1F000CB;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814801;
	bh=vwmHx/jEoeaxA+gJhdJPPiXFt3IiC1tLCejhw2TCq0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Wd9ihok/09u7sVsuJPqXsi9MNBbo6H96v5PJT6uKyM8zENsd6PenIyxBa5mq6QbVc
	 EXwmXWGnCNqNdwWS1YHbSWVYMpQy/XdPqHuJQ4QOOviBKSQ3qmFSHkkRgRYfFIEtGm
	 2Ba5s6pXn4uxsOanAlDmv6SmjA0cdrEWJXo4YpVXT3GvIKDC+hA82Waj0V7eIlvHXy
	 00wQTnAIjZuifGfZyulO4FWLosyb0M2RL9MgK8Q+iXlDIbJkFBqNl7SDOnFCXyx+++
	 NaJ/oSAnT3GLqgW7piG63uwsbkuUc32t9YXZyLGkJW01dH01J31NYngCipvLQXeFw3
	 AE9+buy9Gf5ow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 433B24A3A1;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:01 +0530
Subject: [PATCH v2 03/11] dt-bindings: interrupt-controller: qcom,pdc:
 Document Molokai PDC
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
Message-Id: <20261116-molokai-soc-v2-3-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=975;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=6zAZrpNbRMeb1g5rcQiYw3H1ORIIFBwSvRVKUAZK5ys=;
 b=ePSah5O0PVUhh3SYASdSFKzE3tFhuVaWPHp0fMl2ApwFnQeBicQeMejXqID5Be7pHXOqZqGwI
 L3gjhzntOa8Bqi8Nclz6Rtao4TYdfAFHQU3eiyXySaqDrib4aHiyAa8
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Power Domain Controller of the Qualcomm Molokai (SM8845) SoC,
which maps one more range of interrupts than the Kaanapali one.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..64de63b7a031 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
+          - qcom,molokai-pdc
           - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc

-- 
2.56.1


