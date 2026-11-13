Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530274;
	b=FWgwedJEiUOfcbdTMezV7fR/lrm2hX+a0IHKI8B41u0uztjTUmLWQRkaoTzo5J3t/MOI
	 vnkA2dWVMrTT42L/eU2BjyPCWgw4XG+GLNyj+ffCGpBy+p3Rm0v/pdFAOmNYCNHeSQ+hK
	 ui5Qw8k8R7GKoCfc9BTpw5ac5vHWbursBU0eCjJulTrPmZUd7Nzn6BSzfNdE2/Y9uqw/D
	 jkNomQxxpQg0kxC3ml/eZo0u6LvtTFtqVkj/3m3a6hLkHURe3I5Fve9l5xu97CVTB7lHn
	 ycZHatkPMxvDQX3DqiiwSj2EHHTASxGLEpmYn0j8hMV6WzQ16IoaJfIF+2CDehSINcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FzODplEKs+WHcm/+4H/RVQkgIn8A4rJ2dXxs9VQSrPA=;
	b=wL0oyuZR/WrR0tGxc2w/cl/Y2olZ5N4AT7x4tA/kbbDFnQFWV7ehnvZ5Q/3HbaO+DeGf
	 Uv2S+HSGS4u9PP6ffL/KWJoluWbftJj8EZ+5nAe8zvIU3vcKTU7l2RBihjFRtl2M+gXld
	 ffDoomhLs3ByxdsXghl1o9Ue1fbMmRG3wtN59pRkoFmE/zytlwpm2EhFHYBsdkg64a/gi
	 DJD8LntMJfS+h8crwqdrnvN6KjlhncXWZOurxB6aivfvosTtbxt9K6kyHMfuERxAaliyv
	 Zwc1umsudeVRxtsDj9EhpoYVDyXH7vEgCyd+VttcH9GL5NwEHX6RSzVFj4rPE1Wytsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sxk7TyAf;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BEA606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46BEA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sxk7TyAf
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4919a880834so158681f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530273; x=1795135073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzODplEKs+WHcm/+4H/RVQkgIn8A4rJ2dXxs9VQSrPA=;
        b=Sxk7TyAfvprMUBLPfRxZq8aZbkD3Mu/r/W0AmKA18WTgowz1bzDUXazJ3H7HFiqiXk
         rJnBD58mhnP5pAz8goQBww+UHY3mmCQZ6AfWtx3SJcMKa6bvp6E3y9MPYrJEoKpvAvwu
         xL0f80PeJ4D6g2XPV5kY4UuEqIW2o8LPhhEfFpfSvVkxLEJZ6+OsSrzi2zvNzdbh1cr8
         fzmmLwjPSWSvzNwfc/RTBNHYETaPI+gS7kBhuR2ZSSE5ot9pANyrhLrY80ekUNW1kjE6
         k/a3tmxzWHTCOK5iBCwb6ATelKk8w1dEQxNS6XwxmWKgIKJGWoSf957/ETiAO/hEVGvC
         jL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530273; x=1795135073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzODplEKs+WHcm/+4H/RVQkgIn8A4rJ2dXxs9VQSrPA=;
        b=hVv0EvimRSXD/wZ+32OGr4WYrBSlxg8TyXPaQ5rLdMC2prI0s7/2e/8ZB/esxm66pF
         UKCLIQPAPAVk0zI5VgT27SZ7uw8+qgwVjY3e7o9qZkGvoC58Tv+/0rU8v5b9/roV+J3+
         Z7BLWWkddMt0mPhTWSVk0PC3Ifn6QebCS63KFVIosx/S4LsyUl7kcPzxTK6JkPUewUeF
         m6lNcUZZ2sH89nZpDW58virnQfKMY+sc9Kd4Ol7DxRAA1WkzkSwgtF+Zh0Rbk99kjXib
         xKp/J+DPzWrco4ajjM4WE/o6sk8b9jfOGqlRVipAzEAodFzPXyf9jNDAX7asPwtVjlji
         h43w==
X-Forwarded-Encrypted: i=1; AL+hErHNmbIgckU7GsFITZ8KlNZ6QyMwgEiHPJeiFvXq1d67ABgn8Br0335Ze+WroPM6WYzb4H0z9YG4+dClMo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s3YFcPhXC1Jj70LZORY4MCyot9e4TOvVoP5K7+k4VWY9tSFUC
	wEz/SJhAkJNsDD8ALplaQSMDaK5hpuMKTYuD1qpE1Of3Hk+AQ6qmz2bc
X-Gm-Gg: AYBFou0VUcmYnCUvsBQMN0G7eiiwsNhEmsUGflZyMXum0CFNbgjg7wQU+7Yr//k3USb
	Ze+j0CKj8YzEzygUP/X3dvKQ3JNfxKkM/q/h+pk3mFfm9ll7HwFblkyA8EKgITHLlBX//NzQMzZ
	bX1EJ58yCkFHbxH5NjLSMyj4w+dGXL37cG41POUJHrll9uthBRCeirrB0NJi2+QXXwEWdbCOJQf
	VGlb6nfAXidyzwOBiXGF/ZsO7yOyCdUARtjdgswYeQB2DlXACHlJI9azBSkmrZn/GnuEVUOeH6L
	ZR1bSsCu9PujE9lEr1SEHB1ZTj3DUGHHHupL3wPg/PRs7CXN/CjvQfOjAMagJXXYWS0zJTGdb7f
	nR9oPVoCkYgECGVWw/4JAfBM18sGJ8gP7fnTCsgXUY8gkrAurIlF4J2Z0QHe368Wg3CGPGz8Gj3
	aWL4BlqRZYUxnPkMlUgmphKsqCDDOj+YtNMTOQfBMI9xD0o/a/JZdapsd5YLx5NQh9DCLkgwjoU
	hV0GTUwIBDK9m88f2aE8wW6lMwtkHV4+RMJ6B275Z6MNmYScXtoUWMHTHNS5x2KJEgAP9oyAcqk
	vIP+AeoLN6GLhTqgs6lrPEz1AmMyp7ZFg2fofLffi7ORPC+pH+vmVvwyPBczox/OhGqTyVVEC0T
	duOeavA2UD6ETl6M/kyz/TJudkCgdGhNqdqF02dUXE22f3JNzlG5Igo1dKX66IJek0Z2ElROcZ4
	A+XsTiyi5QT3fxeOFJeM2PbhPLWg/yyoJOvSOTX6M=
X-Received: by 2002:a5d:584c:0:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-49c72e85557mr2540807f8f.51.1794530272663;
        Thu, 12 Nov 2026 16:37:52 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm1741922f8f.19.2026.11.12.16.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:51 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/24] dt-bindings: PCI: Add ZTE ZX279128S host controller
Date: Fri, 13 Nov 2026 00:37:50 +0000
Message-ID: <20261113003750.3668725-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027214010.GA1212169-robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-13-ghahramani.navid@gmail.com> <20261027214010.GA1212169-robh@kernel.org>
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

Hi Rob,

Rob Herring wrote:
> Drop. No point in -names for 1 entry.

I will drop clock-names, reset-names and phy-names in the PCIe series.

> Is this for PERST#? If so, make that clear.

I think so. Both slots share one GPIO, and the driver holds it asserted
for 100 ms and releases it before the links come up. I have no
schematic to confirm that it really goes to the PERST# pins, so I will
check that before I call it PERST# in the binding.

Best regards,
Navid
