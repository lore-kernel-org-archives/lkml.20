Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208673;
	b=Q40nG9e2vsVntUSWQZayVFDlqLA4Wxvl97B36kGNBQFR4I9n9yl4/QOWwogtYRLcTVvt
	 1uq65rGnepW3In59CKx7j9N9HmiVPZGq1qvSrxnLod8wY10kemsMulv7Q/O4QhmvLGVtT
	 za/+AfhaULFrQkReJeal4Snn0hrq54k4kq6XmkL8rzbJylk1F8Abkk0e1RmK0PH81w+UI
	 2kATvs+ZSPPjFB4iaSh+f+N5Vk4T1WAqjQeT5kFMQYWwbRODKGWiEKHiqi/YwaNGAUCHQ
	 Fy8EIcPiBLDLrcL5JA8sftY+51fIUFT4b5zjV4grfzN7KCKvI2jXskpYLJJy5w56WKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A+RGXs8/Ail6qHnGbLflY644jEJYQOYM38RZLvyetKE=;
	b=xn7QhDVWY3iMNjIEIJz+lMM6lHQa5hGkw61IXCqyhxI4wPekdYcOrim7Crf7J9+ZiteG
	 L7A6oMQyvBXUUZmRPhilFyosLgnpaGe/govBtD2y0Na28hJ3i7PBYUmYFybUmTX63F9WB
	 tpQ4BW8z8p4jsAw8quIyl0qfy4Or4EjhDsOxU0uLmeGIlXexhpc5ewcY8bIzAvYitbR1+
	 xdmV51Axh+OMA3P2AcNuoDUhYtfwmCjx6qdSAM0bhx5asQuMB1XKim4ew3DwCLq48uYRw
	 wmbYey0gQ+FT28JcaQWif7DNjjH8djKsk38xz29XZDi7MG2dD9HI0SwVmW0V692AKpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufleonBH;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE8D606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE8D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ufleonBH
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e00eee27dso961557f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793208671; x=1793813471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A+RGXs8/Ail6qHnGbLflY644jEJYQOYM38RZLvyetKE=;
        b=ufleonBH+H9d/tOno1mA/pxQ9SgKTe49I8fCqrQqRsv9NChzWGdaQBtCxPwlzBVOYp
         HEwR72xzxyezHU6WBAhtovrTrx3KqZMKdxC+/NdhAVnyda2XRk0XbVJSpDtsZYmQaSxW
         gryas7ImdzqPFK9J66feGiF0DibWyxN/9p/uhc4OBOGZySknSPXvWFlliQw9WfFmolXa
         6Ym4+ZsPc2TEFd0JvB+J0ZVQOmqnI7YI8y04jyEKQGD83c/vonoi/YbCtaJBhlBFuoX6
         Ms5PyHf+Vfc1ubEUq9EUBU3fXC6okM/Ic3olgmuBrF1Y/nvoxgkYAuT1pJ0Tt/AAoePE
         RoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208671; x=1793813471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A+RGXs8/Ail6qHnGbLflY644jEJYQOYM38RZLvyetKE=;
        b=cDUfh/eixypDpWiM5kZncwx2ff/F4LGcuAQwIGm+MxxAHycQvT1iJCwWjStXvyI5GW
         dXHpw4Um/UMhBE0bK4/lcOxICEbtXOTtC7ep7f7/vsu/DC8ODfgceQrpSvck159CntRT
         sQurIhSlcXmyDxaIu8sddLKNnAwmNLRX5gdvLVz8bhQmNFNFlBiZJLlvVI69QelkBF4t
         4gxReSTayECxRF0UdcPQhHaXEkHpteULxP+QOzdYbvaC1Xz2gOY1lhzr9E/BE9XdKrBB
         8hpUfPzGIqAEe9NnvIJYiaIv4j2AqqaC2/bAUP3Uga+HQQlKA9kRklvPt5c8dp0TMLvJ
         tbWg==
X-Forwarded-Encrypted: i=1; AKwUvBw/HZroItNrjxAd6cKP0HKYOVn+DprgaIat2YhdMXZ33f8unKJyuOl+Fan/T9vaHQ2k5NvcRLpZBrTk0dM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxCekOF2hR8HdVbWGbhGULHF29qAECNqwtIw/eNt0Sz/b8Tfy3
	+Bd5e4yjg3uX1ahL9oSeGEFLJX7WJXDtK5wg8XzZH45Gz57F/REc9U1n
X-Gm-Gg: AYBFou1IMKwboN800QQ04KtPQmss9x82n6FboDtupdLRHJzTgZ/6U4msxt/O4jI68Fs
	fWgR7tjb7HnN+YJzkaWRSKOb/hfVjUbAI1tXXEKvjLYSy1dQmH7F+mBNvQfQtkpTts+BM9yzWPp
	Bt0YBLEgjaqbIKE4llC/Q5pe46CJ7/gBKhbBVqYDKrQC2CQkUSroByitPBfOesXmdvsNTITqp7Y
	yd8NiVPskH+rSZ8fQRfA8xBd+LgRU6yFQpP4VyHHNjLEiKUKhdR1kjxsVR9co/vwtJF4X694nKU
	vHTOJHRJ1OaYkYbjALUwmsjZNZo89DoeBIEOfjYZYdSV/Yp92T9ncTw3+vfHD4QQ2Fw0PXgkPNQ
	Xy02S2o+3MKPzbxyhShWJewLPT+mhCmsntnWX/lBh26w2WH52Hm6g0fkEdmzAuHkFKyo1nkxkan
	ms25bqGB0B6vLoKQyj+5fHTalxZf+ZakjE6Bhpe3XJmCNTlkvQ1M64011HOBtedKA2xQoLZ1701
	5b/rcT3uGEBmtyMSn+lvKNFxQMw1ySr2c3EBqbT/2KrDs+nlSqtc5sf2u60QyHny4KF23g2RCVb
	2siuLy+QkzRxJRXMfFXBS3ubEM5Nk92IoaaBM/PBH4opu8auLk0lf1/pP2OVpkGAfP+2EcCUfOD
	FyAcfjU97beFmEgDqBLv5QqySrEf1+k/scFZt3sn56EUtT8n1s3Svm6X2RQSY7QpWe9w=
X-Received: by 2002:a5d:588a:0:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-48e5d58d590mr7802427f8f.3.1793208671431;
        Wed, 28 Oct 2026 10:31:11 -0700 (PDT)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm30601206f8f.11.2026.10.28.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:31:10 -0700 (PDT)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: iav@iav.lv
Cc: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	manivannan.sadhasivam@oss.qualcomm.com,
	bhelgaas@google.com,
	robh@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rockchip: Skip the Tpvperl wait when power is already valid
Date: Wed, 28 Oct 2026 17:31:08 +0000
Message-ID: <20261028173108.3457165-1-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-h64-tpvperl-ab-skip@iav.lv>
References: <20260911211559.207990-1-ehbello@gmail.com> <179196286749.38040.5597453767131590054.b4-reply@b4> <20261016-h64-pcie-resume-tpvperl@iav.lv> <20261028005548.2399155-1-ehbello@gmail.com> <20261028-h64-tpvperl-ab-skip@iav.lv>
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

On Wed, 28 Oct 2026 05:10:00 +0000, Igor Velkov wrote:

> Since the next version keeps the full wait on resume, it no longer
> changes the resume path, so I'll skip the A/B and test that version
> on Helios64 instead: boots plus s2idle cycles, results in reply to it.

Thank you -- that coverage is worth a lot, but hold off a little, because the
shape is changing again.

Shawn Lin has asked for a DT property for the PERST# pulse rather than a
decision taken in the driver, matching rockchip,perst-inactive-ms and
rockchip,s2r-perst-inactive-ms in the vendor dwc driver, and I have agreed. So
the version to test is that one, not the probe-only patch I was about to send.

Whether the default changes or stays at PCIE_T_PVPERL_MS is still open, so I
will put the DT snippet to set on a Helios64 in the cover letter instead of
leaving it to guesswork.
