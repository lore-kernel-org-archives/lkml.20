Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551814;
	b=TLUOcIMbaIjml9UdM75/vmLVq7RsXcRPJnmUNzMcIRJmi6rNrTmWAa/pERxCR6gMqGdI
	 HRT+9dCwwir1R6gluzTj2zSAQqfYvaaka2z5jegnsl3gRGg/a0WjnDfyJ6YwLZrbqTQt5
	 kue7OZRr21jEKkv4fPwqIMFqpg3q0luc4Ph8ndkenBeJmXsz0IUshW/WJTnKj3+FoP4Nh
	 sHkyBVXlZcbILPLHy7+8Qq0rxi9ifwkaMk4868iFBMhQX6XBICDnKKV97SxxAKQKDX/ZL
	 N5UvmJIkEn6zehFclFVx5JTv2Nl8wNmiyKJg9Tgnn/MxkCLKchUJwOwMM8uzluftqTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mZZe4bKEcD5TSYKYkVMyAQ6dVStKsxhjunUD6f+PU+0=;
	b=Rqoc2dXnVSmInzc/9kJosJfRr4E2orPLtPfhKsaRTyLU9DTgYD5/ci1znPSCBIGM8BNj
	 0PNQNqtquj66249tfkpFPWnOkPxkaIzVOcXJS6pz/i9/Lhaj4HA1tOCNBpzGVeJh0v2la
	 NZgtSL2AZ2QIQfJAGzvvvG8schw/CkMBRofWPlfwj6yRKuMQ1zp7LXhh92WzG6cOhruAi
	 NKpXijerCHlUF/UvBOI62oyZ5NPXyYeCQUrJmdT3mZQp8OkkcyQ3g/UDsurtfaDcg8v0h
	 C8kdSdb0/KgmUwpD/IDg3SJ4vtS42F+DJ03L+p7y1Wd2uf6S+BE00k5bIj8bmpSZ3Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jq2OaOv;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2423C606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2423C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jq2OaOv
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3964283eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793551813; x=1794156613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZZe4bKEcD5TSYKYkVMyAQ6dVStKsxhjunUD6f+PU+0=;
        b=0jq2OaOv/VB8alV10OIyFhzRgwYGwdbak1sNcvg1B4TViZnUcpBAp2z38SSNRYDRFm
         iWL4NL6qgRA55EC9Nok9ZP8gNMVq53QnCspXz1P64Zkgy+AWhvqcouMzwsduyTkZ5012
         f4nQrmaIrmukypuridQE1Rqc2bQO2XtKr1wXs4gKemRM6oXqppdY9DKk6ZwU1tpgVLRs
         Yht0Pcfho/JnMuEIPOp4Ns3v2a6FQiGqn6Zq8Z9d2cYZdwoU6NVPn///Vpb2mGCsXGpG
         nHarEKEXX6wypiLqRLeopMvysMA2SEdZjNx/LDGITkRP6YXHoQfCv2vaKmKvnjsp/MVq
         5idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551813; x=1794156613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZZe4bKEcD5TSYKYkVMyAQ6dVStKsxhjunUD6f+PU+0=;
        b=Y9kOWxslNYcTjm1F1+nZRkX3T1OiuzcEj43VlbES0AWyBCRPrwYNoSHIVM+nzK9ArV
         fXdG3OIAVQaSD2d8AJ9RBw96+Y4fU6m2wNUpvxOFPKGKDcO7Mhjc+Z1rkERHYf7hYeBm
         T2oZOj98kf5/V1Kw0A3bRjbkhFERMTykATRpb5aBPOwmSmEhaEB+3KE3J7/XUDMjGNbw
         StV6zpHWmbWUfYsaNapsMeM6LjUPidxV8PYxOMFaCXfMuiE1AtRgDwIUutlngV2kY3pe
         R0rCE2s3/7ca3xshvu4InwrrUx8oIMredZie2NBQslTm2ceSyAnzbdzDkoldf6rBV+5i
         Z6Vg==
X-Forwarded-Encrypted: i=1; AKwUvByWVTvjoH3j+T4tIJJ34UToYxNuFK5F5yut+Fz3u9PQCNtgkWpvxtgjFk6VFb4j4BcsoX5/v2AJURw5aTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wqMsYB5PkjlXqUbyV5q/NcygZg12JgAhRzAD8lmplzrZ2Bqik
	TrkehUZTvHV/qk4k076TKCwBWsSAgSvj1Pke00oB52qzBt+F8sbjKFCW
X-Gm-Gg: AYBFou3n3yaNB2+2wZIZNGLcQk/4gXv/80ifBnoU6+qr9GnAx3SJIJGmGj19UzVVkw7
	5x4G+O6F8M5i2H+Y/ZsjpWxg84LmFC7Y6ZGPw0DEITNldjSigxGUuPpF6Hr+YFnVt3mb+yjixSP
	zSlSeliqirKEt8pR5cx+OI6RorTvx3AkfNz/KevBHex83mvuOVib5KmXTa7XJTs6zhWfN+VCmG9
	vMRnojkXWvpgbOzT1NGBdoZ9gvv+hX6iAaVeFBMJFfpZeGrB9e0c3nznFiDZO474A4tI2iUpbGg
	tcs+ZFfQYBHTmy1upnb7OJIpqHHhYRXQhNuRGiiXLAabx4uXsVPgN4X5WJDp9Qicx3T8x+CDvHr
	CzK1HNr6zNOSPBwQmuVhxv4Phs5d9NMSPL7JzM//9f8zDTQuaEC3mR2lrlPQ0+y35H+JicPS629
	6GeDgOPpUgf+30NuiLb4PIHPWhgKyM985BLMrOUTue4CK0r98y/POLQqkHwo1HWqc3ewPh3a4nb
	NxmejPDC1db+dczkA/yQWLC6E29FtyD3M5RFKmGFXpypH1c6EMXpZuMilh8T5TRteB2s3lu31/Q
	7uHzuEn1px7d5rk1O4qmewuQ7b6A+7ix7WzBeg+rxbfChFXj6lBZ771yLdw72BSBRhtr
X-Received: by 2002:a05:693c:87cd:20b0:36a:32de:a239 with SMTP id 5a478bee46e88-36a420643f1mr11900427eec.0.1793551813029;
        Sun, 01 Nov 2026 08:50:13 -0800 (PST)
Received: from localhost.localdomain ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm39444940eec.16.2026.11.01.08.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:50:12 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	a39skl@gmail.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
Date: Sun,  1 Nov 2026 23:49:30 +0700
Message-ID: <20261101164930.17976-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
References: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
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

On Fri, 30 Oct 2026 13:30:28 +0100, Barnabas Czeman wrote:
> Poco M3 (citrus) is same HW like Redmi 9T (lime) and Remi 9T NFC
> (lemon) basically is a lime with NFC.
> So i think it would be better make a common base from lemon's
> devicetree instead of making the same devicetree again for the
> different variants where only the compatible and the model property
> will be the difference.
> Check sm6115-xiaomi-gingkgo-common for example, it was the same case
> for Redmi Note 8 (ginkgo) and 8T (willow).

Hi Barnabas, Adam,

Thanks for the review, that makes sense. I am preparing a v3 that
moves the shared parts of lemon into sm6115-xiaomi-lime-common.dtsi
and has both lemon and citrus include it. I used the name lime-common
following your naming. Happy to rename it.

Plan for v3:
1. dt-bindings (unchanged)
2. lemon: move the shared nodes into the common dtsi, no functional
   change intended
3. citrus on top of the common dtsi

I can only test citrus. I do not own a Redmi 9T, so lemon is untested
on hardware. Instead, I compared the lemon DTS before and after the
split, normalized with dtc (dtc -I dts -O dts -s). The only
difference is the numbering of two auto-generated phandles. I will
describe the check in the cover letter. Adam,
would you be able to test lemon once v3 is posted, or look at the
split beforehand?

The IPA carve-outs (pil_ipa_fw_mem and pil_ipa_gsi_mem) are identical
on both, so they now live in the common dtsi.

I kept the following per variant because I cannot tell whether they
are real hardware differences or just differences between the stock
firmware images:

- ADSP carve-out: 0x53800000/0x2200000 on citrus, 0x53400000/0x2600000
  on lemon. Both regions end at 0x55a00000, so only the start and
  size differ. I can only confirm that the citrus value works on my
  device.
- GPU carve-out: 0x55a15000 on citrus (right after pil_ipa_gsi_mem,
  like the SoC dtsi defaults), 0xfa400000 on lemon. The citrus value
  works: the GPU runs with a full DT that includes the display
  pipeline, which is not part of this series. I cannot verify
  lemon's value. Adam, is 0xfa400000 intentional?
- PM6125 regulators: seven have different voltage ranges (s7, l5,
  l7, l11, l17, l18, l22). l24 has the same range, but only citrus
  sets regulator-allow-set-load. lemon also marks l5, l7 and l22 as
  always-on, citrus does not.
- citrus deletes cdsp_sec_mem and the orientation-switch property of
  usb_qmpphy, lemon does not.

Barnabas, Adam: do you know whether these differences are real, or
whether they only come from the firmware of each model?

Thanks,
Amir
