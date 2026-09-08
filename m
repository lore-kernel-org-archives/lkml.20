Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624435221FE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865826; cv=none; b=Iri+t9nYOLuE9TMvq5Ic9beVj3BlRDAm8ingKObv+wyxMENwLjJUEpOrhCAodyOEprjwSlooPrp290jEoQnPgWj6W9qdt0C7Y41a0MfBELIdNhCYXePG7rM/RF95HvlAebMMEALal2X4ceviLwd3XCR7WU9g6GaJjx000P4qI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865826; c=relaxed/simple;
	bh=oqSDhFf73aL5+BlWTbjr8MdQCyWd9kcTHGdxvnv6FWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qS9DH5SOQ3Iaj5KBY37lgrKeS5BK5OU25ZvWlDxSUPWF7HO2t5ZgeV+jcS8rI16Jh+z4z8LXSfA/ZVkyv90PdMmlwIDcfJYiX2dzRFMS3l0tw6wE9XJk5yR5OYQEU9ZaHbksf4xpm+TuwdH88kkKPKh6m5J+2lDQ4yECEiAp5S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=UThMrAZ3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="UThMrAZ3"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-484374f54d0so2865850f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788865820; x=1789470620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcn9aLAAZo7wqesym8j61ULNO9k3Gwxg2yqdzb1whoQ=;
        b=UThMrAZ39Rdm6u0zCYYww48RcovwiYNPAJ0EYinf+j920Lm1rZV9GUJKb5OgnK+oLG
         w2x+vFsurhdrB5plHhSswhD0YPdYf1JsgBhbnv6cWehQ3BubXz9Iv46lHiafafwNc0fF
         sfk0y/dAOlAg9djWLI+kkOWXlExd9R4aExKCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865820; x=1789470620;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcn9aLAAZo7wqesym8j61ULNO9k3Gwxg2yqdzb1whoQ=;
        b=Y8zkcXATFXy8gcTz2u50jxR59ZH+PTC1EO6jWeCyWgWGlcWVST0PB403Ya4dUm0z4Q
         JHhXL3CrKzbO1NGY0OKwbTJA8UTX4hXe7Dv8OmypKYvROaIsW58plEd4+pM0SjfJqGWZ
         CFXYJja9W46apQZ5OoCwpgzCSGOnLC0PoXtpvn9/Rv/sAFXpKZTObU9tkYMAYduTCmkn
         dgFl9A4JaJufTR/uDWjHlPw06llwW92VHC0ODADnlVXnismuWV0l1hZJ9KQN2RsQddOZ
         s0zZBuaGOFA64Y/Vg7gvPsZZMnBOtnG3xHT2qOHB902lcipYYumG5r7MwTz3mHibqWdu
         tbLg==
X-Gm-Message-State: AFuF++nqBilhehWGve1aiOaKTxiRkkxQj1emD+IhwSTMF885VbUhkZAj
	1naQaq95aEWpIND8WzNvO9yQUCayE9k6z6Ft3V7EJ57xqDubU/KFNwbcgy4cNFnxvw8WZRajIdG
	6+UE0
X-Gm-Gg: AYBFou315swvHWf5SJPa9s8wzX02d2tpey25f8OhqshjhPbIi38rdkm27ymmxKipLE3
	gSa2o9iD1EtTMQW+qeHc3GqMcaRsnEnJW0HeAVpTONAPGVsVuEe6Vkq5+s7yvtCdnwgblWvhjYK
	i4AE1q9jTd1LInEgXZ+mx1v6EcdnFzG5LCFTeUNCUYQqdXFdXV3NhTpfJVAy6ESQLp3RT5ViMvz
	qdwmDTPoXgzy0WIhhyLJLtgLDUGMkHTi+yWYSrXpZdWpsHLyJ9OpRt+J4hLMWVW7uUscinCJBE7
	SlQcR4TggjTWNL1Zh9w9dVkbojJbTom+W3vxMwKZzmSPMknm7SXepjsnN7w2DLsDdHul4DDK0J7
	zqRyGq+7EE/wkSbkZgdA9NOMQ2lEVwKPXdqhNd3/DYQjOkeX6VqD4Zti81yeTQ0i6pIlIfzz7v7
	lza3O1K8D4CpZpit9x02zaD3QmZyjMhtt1Lgs7IW0j215FXTwt09MtqfMoGfh5z0EW4DBnJAIUc
	XmUqkyCjJQv3OkT
X-Received: by 2002:a5d:5f89:0:b0:485:892b:bdad with SMTP id ffacd0b85a97d-485892bbf0bmr51682730f8f.12.1788865820340;
        Tue, 08 Sep 2026 04:10:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48594172546sm26855073f8f.15.2026.09.08.04.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:10:19 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 0/1] ARM: dts: draeger: Add socfpga devicetree for Draeger's M48 board.
Date: Tue,  8 Sep 2026 14:09:59 +0300
Message-ID: <20260908111011.960876-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

This is the SoCFPGA devicetree part.

Petko Manolov (1):
  ARM: dts: draeger: Add socfpga devicetree for Draeger's M48 board.

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 130 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

