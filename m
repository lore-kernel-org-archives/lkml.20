Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3753E0725
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676387; cv=none; b=V99m8kcLV/xIGo/0zZ9sgDp5+uhpzfjIyCOU/DPZaCPHcXjq+aOGwM5AiaINLZ7sjtbO9TqQo1s9ZPsqXeHNyhylDXesfnsG2XzNhUUTMsoCJF80tYHfOCF0PjS3Uyq1mVDFGFv8AnF+OD8vNtFwtSLocjpEwmSCylOOjItpKsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676387; c=relaxed/simple;
	bh=xNlUmKwbQXLSEE3QC0Rx5R5Pncj1II95pqPAg1hd7CY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CcvY6BSPuUhezDxwDwnRE7TdWKM1wOb3YHSHM9JB5GajvMSSnc0kEW4ykZrj/Cls1f/K0Z/+QXASybv1capUDSMdLMOy00oKck5MgB4iRl/k1EcVWBm6VEV9as3YkLrXKNZ/PtXMLpgECGO10b/VNiMrxdC7C4j5IioApaMBq5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=cymnc4JG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="cymnc4JG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1936651f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790676357; x=1791281157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G3eWez+V61iDGrqgukhgzGO2U/52pms2AtqUAmMdSCY=;
        b=cymnc4JGNiJaiBKPvPL7OFk+ctzIgiTlpVb/8UuCxR5YWiGodr28g3sX93MtxcLODB
         I3/o08LPbxdsviLnAjLpFoGQnTzE9KOs4dnnp3YoaGrTlSoPul3kjggB8aEDAkjPakLh
         2OqjZKAqYWiwNVCXrCBm7xcecjjXhlI4oN6I8jeHvnDiK59/jZJFZKNHKcnq3QwvpzBH
         A6+Rr29zp1CnkcXPnA/DcdEjnTPGwL9wCU4EA9c/aa+0wafjKd80KMuraBBgSUVkSF4G
         e1UDnH6efpgy1ney6YiI2kJDfozsfB6M0SZ/fj9NMlKL12QJihWGqVCErll4cqlUMkxl
         08Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676357; x=1791281157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G3eWez+V61iDGrqgukhgzGO2U/52pms2AtqUAmMdSCY=;
        b=IzEid3dnGnZW56NVjaPYrNoZ2fThLRVxGHUVEfyVu0PRy+B602a7PXizsTHZa/qBud
         YTMKGPEZVktQZrx40GZOF4szA54uYapcx3uEOGzgmu9VGcVC8kuB8rrazZPVU4ILeLuy
         6r20K+cxeAXlj9CwCqB7gUrwOkwiXpNxr+mKE4e670pTZCSgJthzJelOJdtT9HIRvvbh
         0OT7j6tc+mF24vGfAGjBifIKj8EV4XipJwyy6ayfVrWmdLbqf9pE+fH/0T5dp/I/BWbQ
         N7GWQKYyRQol+I3F8vbmtYaM9IvRzo6HSF4gzpHt5d2UW43WnA11ewohjoFIB0EvGqQs
         pT3g==
X-Gm-Message-State: AFq9FYKjYGgjIPSGlibCC4fSEren+S8J9AvuXA6MFwHem1mvvwzJ1Ukg
	0iGTbNdoVyPHErL6yus+mhq6SZxbPGcf81ME4x6YNFBFkfVsirQ5UHF6ublJ7ijxdEY=
X-Gm-Gg: AYBFou17k7dNwxyk/gupFx9tkgz5UXXrCpci6K1j1WmFbf/ekGrrs1Fu3ndyPMX1tuA
	SwzCfHGuQZJSUZJEtpjSmxO/xBd2BQ2tNmNEAVjas0tSEs/A3JEO0kuvq1JB7GnpGr23ggDQ4ng
	1EmvOP9KlKvw65NXajIPAY9xzSeC4M/DZD3dT7Z7Id3Aw8p+f5Rl0VTRbTeSTT1QzlaPnS4v/PF
	f/OZeB3k2sz5Ju7BPd5NxsV3es21tZhpELg18pd8ZnBcnMIu2TWXcHu3DJhuyxsLaBi8qEJvp4f
	CoLopZRv7NcD11NTKuYndAUmpV7cIzUYqevKHZy+Xus77ckNL0B1lW+vwcbIQqmbV+bahGjKRCZ
	Cvfb5ZcD6dpaJVZuVsZgaOqVoO8aUHPByhh8Hi5fL8wEmdw2Kix0xQlBcqosuRSV79QOnvm0Xve
	WQtO5qO6swYRXkZtPD6woku8PYQ44igQv6ryInFz/ToSK/0CPf6PjGvcyHlF+eOsFkNylyVcoSE
	8NpMxwRfNQbFv5J
X-Received: by 2002:a5d:5f87:0:b0:488:87f6:c20c with SMTP id ffacd0b85a97d-48887f6c7bamr16422031f8f.13.1790676357052;
        Tue, 29 Sep 2026 03:05:57 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502f79dsm2954995f8f.6.2026.09.29.03.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:05:56 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/4] regulator: of: Fixes to of_regulator_bulk_get_all()
Date: Tue, 29 Sep 2026 14:05:45 +0400
Message-Id: <20260929-regulator-get-all-v1-0-e887c66a47f1@flipper.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDugES32KqWLmP6JU4KWSRRBv
 HvTdvkt3jsoQQWJbtVBik2SLHNBc6nITXYOYHkWk6lNXw9mYEVYo82LckBmGyPbrmtxbb1vHKh
 0b4WX/fe8P/5O6/iCy98RnecHY4OSJHUAAAA=
X-Change-ID: 20260929-regulator-get-all-a553e73ff1ce
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=alchark@flipper.net;
 h=from:subject:message-id; bh=xNlUmKwbQXLSEE3QC0Rx5R5Pncj1II95pqPAg1hd7CY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTt7m1uqD1g4zN7rbndrd4VWyvdD7x5cufyy9aprxOO/
 D60+sqcro6JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BIx1jHiIGLUwCmeukBRobtDh+zuZZul7tkFaujVxdmL5/4WlzxqOnZqDDz0BnGiZcZGe7XMsy
 d4OEXfnvCgVNeb/+yMV/6YH37fsdXfd0/guYB7ewA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

of_regulator_bulk_get_all() only fills in the .consumer part of the
struct regulator_bulk_data for the regulators it gets, leaving .supply as
garbage, while the rest of the regulator core expects a meaningful name
there (e.g. for error prints), causing uninitialized memory access in any
failure paths in the core.

It also allocates the supplies array and hands it to callers, but never
says the callers need to free it (which they don't), causing leaks.

Fix both (the latter in two instances).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (4):
      regulator: of: fill in supply names in of_regulator_bulk_get_all()
      regulator: of: state who owns the array from of_regulator_bulk_get_all()
      power: sequencing: pcie-m2: Fix leaking array from of_regulator_bulk_get_all()
      PCI/pwrctrl: generic: Fix leaking array from of_regulator_bulk_get_all()

 drivers/pci/pwrctrl/generic.c             |  1 +
 drivers/power/sequencing/pwrseq-pcie-m2.c |  2 ++
 drivers/regulator/of_regulator.c          | 29 ++++++++++++++++++++++-------
 3 files changed, 25 insertions(+), 7 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260929-regulator-get-all-a553e73ff1ce

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

