Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645DB32937A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790494731; cv=none; b=hudvRIbaDQsPGFZff0hmOt3vzNvkN4W+SVcmTAOe90QSfRaUSeqf008EK2wtCou2QDPtN2FgPScYvhyngZP5tZZtnrBxYaMn/1HqEHLWgVqmHEBsxkiP2g8M5xGFrexHdCulyHCnicT11jOypv3QRE+mnL4PPPSFnc6vR6nQMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790494731; c=relaxed/simple;
	bh=yN3mzdzZgu9J4xGbp5IsRF0F09xVnXBGaFaceajxsnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oBsZ4ln0gGwkYBrr0s7wXXsl5+rJvocXggrcS2QwoqSG5k6KSeZrASH1FUfeE9oRBAozTE9bEHR752rxK3jfAnh9VP3W0NYatiH3zk6nIMXvv8R3eZngcx0KcmEMwjfTR7dV6G03dntO9Q+tuWtncY2WQDjhEy7vOdfvzUhMVas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPLj5xCa; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPLj5xCa"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48879d4fd8aso1137675f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790494729; x=1791099529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7kVEqO7RMErZOqrCCwlGVc05Mm1O5AzHceXa51xeCso=;
        b=KPLj5xCaoblEdA9FWrou5tPXDGddPRyDnKEV8CIx1YFFKJIX3AHTf6spQ/usQke07a
         pUG+8L0RQQvRRRBng0dGtWen4SGOjLIsfYFC0SCzKPxfgsMT7YDcSsUjULGdAITkaf5Q
         gXe5NB8pPKm+lmSHy1FB+wQNkJa4eeEOSk65vmD6+rXvKraKQ86XqTzNqQ/nSci5UXod
         e5Y3X/agIoNkvp+VXpzgwXy+gphTYuplxXHmXq3BOoUDHEDEVcz/isC5PM77lSWKtEg5
         D1kmbLlVr1rzAfQaILb55n0+9eVGiat1VBZ4IZZG24LlqBJz6ljODJm+bNknSTGYYt4J
         amDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494729; x=1791099529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kVEqO7RMErZOqrCCwlGVc05Mm1O5AzHceXa51xeCso=;
        b=yHigDVNjkJjLitLiUcNLq6qH7+VtYI6k2R8gmtPv1JPCIXeTbY1elgrUKEZ0xleuYg
         z6PbQMDS8YwoaOcOhcF+Yaq2rA+EAOogecVjtfV5NNz+hLE5R2Xd7psamTR+5BEcXjJA
         QljDjLr0uAEbJY9VA4BZnlSmFsbnLjqbgJ0w1PpBoI+kp4y5ySrWXnsKTqhB5qPLzKoW
         LYnVcPNyNdiDVfeTg2B6DckCdMYts0WeI20DPMcQl3H1iTSKa9kWB2MGrU731uLyTC9f
         /Zjud/ptECt7VJ2azOAganh9+u2dV18fRebkIDHW+P03EUbfy+YL+968hv3MOprGUskG
         q5hw==
X-Forwarded-Encrypted: i=1; AKwUvBxaGFONvR0/MCnUKPaW8amMB4SY4poKnKFF1hDQk/KOlhrzIVLwAoVA/oD2JLRtNkDQaNKgchc8uYajGOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpFeGbuO8j3y9TyBttxErRvXn+k80ihFNOJsldmOBiVagSfVpr
	fN1/SmBYR6ZBBq8J+haXi0GQLVedMDXS2P1qEGHbO5SML6o7hycPpM6h
X-Gm-Gg: AYBFou3B+XEeH7tLUwfpNhr0EfcFoDZHpbTJLhMu/2vbN/0QhnsGLVvqLstPPB8uc7X
	7yhtX85GKHhC7gbAvNuz4xsKBl+jh28qp3iSysdkuYCqy2Qn3rJDy5ddRybYN+sPvqZTwV6K3H/
	jr2aGUxFYrng1EmONyahnl/ivQO1WKkVAtEBopmCYurZlF3m4Wc5/2gosIoE1bdZKvuGbqlta2d
	L6TtK6KRzjCoCARJV4ULjYQZW+EEMwtVAMxJWQ3o3qSkMoutC+17nCn44x9dVHjQLeV+VHABNVI
	ddEoMu+pEHAPA2q3sfvRiZ/0QT+lWN/u1CHd1wacbQ5IycVzmlYbsaQ8tsxMr0AX828fJ59VYdT
	UDoX1KLK+fpnhiklTd435o16s1knd1u62xjPBiktkhRb/nribdgpNGOWGPVqpqzT8+uSsXjT7fg
	w0ULdwJ0tclAe2CEyXjll/0q/JDirO5E7zu3icwbH+tjHDhZNlctXHY+EpRF+qMOvCR774gwQZ7
	YWW69C4uVmUWkGD6lscrCZdE6pNg+UwyEfsr9fT
X-Received: by 2002:a5d:5f85:0:b0:488:7fc7:dffc with SMTP id ffacd0b85a97d-4887fc7e08cmr12715977f8f.37.1790494728438;
        Sun, 27 Sep 2026 00:38:48 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a35607bsm17210652f8f.16.2026.09.27.00.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:38:48 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 0/2] net: axienet: allow instantiation without a device tree
Date: Sun, 27 Sep 2026 10:38:41 +0300
Message-ID: <20260927073843.346910-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADVA TimeCard X2 is a PCIe timing card driven by ptp_ocp.  Its FPGA
contains an AXI Ethernet MAC with an AXI DMA engine.  The plan discussed
on netdev [1] is for ptp_ocp to register the MAC as a child platform
device described by a software node, so that this driver runs it rather
than a copy in ptp_ocp; Vadim Fedorenko agreed that a platform device is
the way to go.

These two patches are what axienet needs for that, apart from one more
change - letting the DMA device differ from the platform device - which
has no user without ptp_ocp and will be posted together with the ptp_ocp
patches:

1/2 reads the probe-time configuration through the device_property and
    fwnode APIs, so it can come from a software node.  No change for
    device tree users.
2/2 adds a MODULE_ALIAS, so a device registered by name autoloads the
    module.

Both were tested on the X2 with a local ptp_ocp change.

[1] https://lore.kernel.org/netdev/CAMuE1bHr84n5LKcj02HmMR5XefPtvQ-UEJAx7+UKfYvRgS0eDg@mail.gmail.com/

Sagi Maimon (2):
  net: axienet: use device_property and fwnode APIs for probe-time
    config
  net: axienet: add a MODULE_ALIAS for platform instantiation

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 34 ++++++++++++-------
 1 file changed, 22 insertions(+), 12 deletions(-)


base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
-- 
2.47.0

