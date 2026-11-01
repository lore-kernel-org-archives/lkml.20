Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793531297;
	b=YjxFzX52ZzU27JpQ/6j1CF9//NH97XEhXSPa9cc/3c+h7fV5yZHa39Fr2Ofaib+ONcQl
	 k9P/SVP1EAfUE6sFmZ41ZCCT5GbzQGRlaHCyzImUw2DzyjiUh7DTxJ6aruSM13hPz0/jR
	 dU+v8ukPMOTqnyAmL/46SZq/mfCv1FirBEGH23CfCuozbMOGxW1zZAeHBxVyI99F7zwkS
	 2rfS3Ki+mdgZc4GRm/bzA/bg2aNPTvOeeIU/1NQ3UPEA9m/AoS2u8o/uFlm9AmDPi5fmF
	 zAtZ6crmE+b5wz1lCQ3KoyChPFJHhBkimZFF2pxBKmS05EtA0+PMc6FAxmZv6euTSFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793531297;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=8ZqHKrTZAa7k2c+zRd+2kFVhc7BZE6cjwLl6WJGjDT0=;
	b=RTOi5Stz64kt85chbB2M6KGuqT3yQR84B+zGC+Ze3Lh8+Qz/+IYv3xxvUZps68E8tsBs
	 EoNrfxL9lipJNYtorjrTBy/FEwIAULwIAeCJ/4EkC46BfiCII7qaqIur72JEI0LZ70TYu
	 /1SHPTmNs+0dIGTSh8TIOz6NDXZxb78TrmIRXXf5pPK4dSO9w7lWCeoUEOjeQC/bVMrEx
	 hJJI4Qa3RspegIGjRS1XnJ2TzlvbXUNAT8BLvfc/aTyRD31QtK+JWeqFXXRC/YfWfMNci
	 0/hVeRlQlUvFrxL1RreoRmyXtNoj3eXInLHIacqSIqEW6UFTKbub58xRk6eqNhIMI8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZjvCiAz/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01218606A324;
	Sun,  1 Nov 2026 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjvCiAz/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112701F000C1;
	Sun,  1 Nov 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793531296;
	bh=8ZqHKrTZAa7k2c+zRd+2kFVhc7BZE6cjwLl6WJGjDT0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZjvCiAz/R3hHYCQjzSwylNYDqpP98D94MjX5tXYTpgDdSYBgmJRdGaDqRJ/SVUmNg
	 B/t1mA+yCqsP6rgUO/wGmi4JypUE8Wnb1JgOJzzHZNbjyBttMCt6ygoaELLEtlsohW
	 6VXkd45iPPsuJf3/5WYiVm+8trodqkNp7VogVtkQKnhwj0gBpuzuiwpvZ1WbcU/7jt
	 3S1kG2VnP3pwEx/AsVwCjfngRDyCRwzqNAkjb+JRwsZIx6SzphdJr6e1wDIu1mT1S+
	 pXCNoHQq/SkiNDPBrYwvMmWISfMYg2x/dyULBmpinzFGU/UlIVWErRD/j35tOF5Xs9
	 GCpeT/4lvQ3tg==
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
Subject: Re: [PATCH 2/2] phy: amlogic: meson-g12a-usb2: add S4 support
From: Manivannan Sadhasivam <mani@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
In-Reply-To: <20261025192202.209045-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192202.209045-3-christian.koever-draxl@student.uibk.ac.at>
Date: Sun, 01 Nov 2026 16:38:09 +0530
Message-Id: <179353128971.2955.5743207181968737681.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=mani@kernel.org;
 h=from:subject:message-id; bh=4i/UwT8KhY3hDwjDHgZhm00CnhxEntUWfkuk3YkQLrw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5x2c0yLz8HY/wgEQv3vpJxM4SQJtXqKuxtC0B
 LCogdcfNbCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucdnAAKCRBVnxHm/pHO
 9UOJB/9SBeD1OafxoTl/SwCaFJ4dyRTpOgVlCzWb3ZLWr3/uDJWq9lfhVJaKaSPNj3afa65p4vM
 jEUQsr/ell75TnsWQXsLZ/7orZpUz577RsM6FDvgzM1kbTdp0WUhtALxYwrjwuUb2BgYWSOIIwG
 6PLr4E2Bgd0IM3+WmSdqxR4NzBEm9JPx0nyzzQD0QwioiqTAJskV1J2COuAueG1h1BMdcAFw3Px
 qNr1m172yWnYquAJ5RgjlmHSCCZxQ6xIN8t9IZS1SS3Be9qPZbhh6+SqpufamxKLYN0fyUJk9ld
 hjL7EgcSLyjBMI/m+OVPYuun0La37tUVBHM+jqt/OagPGAmE
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-25 20:22 +0100, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The S4 USB2 PHY follows the A1 programming (MPLL DCO clock select, R21
> calibration, R13 analog settings) with a few differences taken from the
> vendor driver:
> 
>  - edge drive trim 2 instead of 3,
>  - HS disconnect reference 3 instead of 1,
>  - a disconnect threshold in R14, and the R13 PMA signal update bit
>    set to latch the analog settings.
> 
> Without the PMA update the host controller sees no root ports and
> nothing enumerates.
> 
> Tested on an S905W2 board: devices enumerate and work behind a hub on
> the host ports.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


