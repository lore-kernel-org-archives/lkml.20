Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394D75111AB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681972; cv=none; b=Mt8p4j1nbx78CXz13NSfVvAEMd1rr5yPEWKWO1cU1Xk2dHy6uvw9LJUVmZTkns238q9sS4iyVc4kvfD0uNDJACUdsJWs80+HUmz3H2BNUTBQ2U1Lp214mxoe6Bg2N4/bFfoS9tFhhGXsCLqjzRRUMz/b/roDgo00ypWipuFPXYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681972; c=relaxed/simple;
	bh=QaMnkzX6EqShlGHNFpyUbUxZqjzej/lVJ2TWucKRB6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmMUeSV71XBN/i86ckmNqOC+2nzXNCMcRWW8pu07YikOFG+MwzJotIubQYPIaxigUqohMJbLwvTT6ip5SwbX0BjQY2ZUw7yvOps74hwZdmc2HNECtJ5CShPPf8OOoUOc2NfpG+7PqvxV2ZfKgglBv0yBMqOEfqjz3nu5I4YPHkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXm6e9c8; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXm6e9c8"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so392835f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790681968; x=1791286768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckbTsCWiYKNlzqXGD2Tr3x77O+MgOzPXQMoGVWRepJ4=;
        b=HXm6e9c8UAVxBE/jwrIo48Cy5NF9RMVUsQT50UIjzdGuBcxKQCK1HC8OawAWu+SBUD
         lK52J6l0W13sVTif/tzJgVSF0JLW7v10yWrHV7XUqP6Soc9sPLQOGv3fF7gwhGiFbq6+
         S0SZw4fO37dwY5koYu3wBYPOaBgf1sXryqLcl9tpKF/JwFjkQegjD2nJi4TdvXnxs8eE
         kifXDFEnx6pjZudx55xjwoLtFCrmQX01lljQL4YERGnX77oMzF+FPpRNASTlAO5n9P1l
         V73wGvkwqf5OdeS2yUvi8RHM2cwZ+0cQoG+MT9j3nJLgs3dMnsRYPjrz1F7J5XpxGoEE
         d4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681968; x=1791286768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckbTsCWiYKNlzqXGD2Tr3x77O+MgOzPXQMoGVWRepJ4=;
        b=2rUNLYvNXBdUaQ4zxxXwl+zM8jeabkkFwerohLdb+SzUFnG9bwTwRoHz2aNYLsl1uk
         +pm26iqXOYRM2o3iQ+Qv3DSZDReQi8pH/btjtH+pOtaPuO4RKZE4vpZ1g60Vcm75XE/F
         Go/j5e7OZppBHYKBOtz5KtuclH8I4O+zoz5wHjuEWY/0/aC8IUqot+oqrPXhc3Z1vPqP
         6xbE87dpqG4GCzSlMQWKk8rN9A0Sw4RZGgrc8jtnoZ2q1deAax7cK0jSf0uMSjAc5BGc
         Bpkcl+XKlbkyHmJ0UPgS3RFTJHmywmCYm+UwPCmZv8ypOXQjHXpSm8MbJgOMZo8m3vhP
         YqEg==
X-Forwarded-Encrypted: i=1; AKwUvBxgG90xMDQLTZF3IfuupilKNjdoop92Ic2A/vWTTJGXM60k1FcViiUpoxU9ix+ndglggBlpy+cKHvgidn8=@vger.kernel.org
X-Gm-Message-State: AFuF++mhut+VBu7qSs7E/fsMryLWeuWsEXXdHE+wIGWFyOywyeM+eMu8
	XOwL4d7sw+90HYDTNoELi4ddBwLlJptbFslpV8iF+jSEaM8Agnx7b4om
X-Gm-Gg: AYBFou2Ywxk7k3LD1zXAiAP8MiFsFKvw4bcA1oI6g+loItTz4BoiXPUz9xZclJGZiZj
	5X+0Oz2msYBQGiFUlq42ddmzVn5PkhKLjThzgW2zVT0/J2N7NuHrVKNRXmGdIiQNF2hNYvTD9FE
	BiiStl0yp5ZF1S869rC6g5BfTkvinzOIiYEnDzAsttkEIDyRwiNIrjxH8GMUGDJGNbcVMMQ4Cng
	XVEpzTCkK0GWIyyn/wYpKWpSMQQYE8hGfQE9IMXp1rtUkhqqFlRga9GxvXWNDtuHzLoykRr2AmV
	hwbMuGRLlwFfSgjZwKpmGMrDIS9gq4WTQR4bsaZrw0/tNjBhsP38Tk/nBdNRUAecB2U/ngfdHPx
	LT4Nbn6wNlfaYOaNPcZSmaX9Lt5M+W9+cEC09p8wGpfdWfyJxCy1R6BsdNLRSToio2Nr+6hTYQ6
	WqJdLQyk9Ys/VoTzaeynVVfHRS4vA41tdzeUSEA4wm7+SEzRcLmp4LNvYRVaS5DYa8SX9O+4AR4
	Fzq7DJS+ZH0LFKqA0Tcv2XIfr++xyl9H5zpbg9KfPKLGUx/K5qmF4mj7M9DQ1u7HaQpPYi2ZFhC
	0Nsh1l/qgAB1rAMzQA==
X-Received: by 2002:a05:600c:1d06:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49fe7bcc25dmr261575645e9.31.1790681967977;
        Tue, 29 Sep 2026 04:39:27 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0f66cfsm83215565e9.14.2026.09.29.04.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:39:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add ADC clocks and reset for R9A09G05[6/7] SoCs
Date: Tue, 29 Sep 2026 12:39:19 +0100
Message-ID: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds the necessary ADC clocks and reset controls
for the RZ/V2H(P) and RZ/V2N SoCs.

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g057: Add ADC clocks and reset
  clk: renesas: r9a09g056: Add ADC clocks and reset

 drivers/clk/renesas/r9a09g056-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 22 ++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 ++
 3 files changed, 46 insertions(+)

-- 
2.55.0

