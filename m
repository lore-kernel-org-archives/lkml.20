Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D605221DC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684674; cv=none; b=LGI0VGY8v6ktVB/oeem613K/6wzp26oQlXK0PcMoKw2tSwLLNH0P02l1hV/z4saB3B4oUnqYVEfKBAZl7gDDYNFgU0QgOji9vufA0N6uVpZp5NYrlaaVxIEv3O08EujOvICOE8TsZDkc0A93Gom6X0Y7tMKo0Z9Hhi0xc85CgHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684674; c=relaxed/simple;
	bh=w6v0UOr6JbOohE/P59sncCpI20ugCKosnuPAQYS1als=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlQga01GCq97C01cWK3Eo7Hk0qJiM+bdmaRFjo+y0OBK84roRPHkrVV666CneFzjrwVqGN3TJZnHyJ8sWWj3ojO/KcOk2V3RyHvcO/+1C0xwxTfE6jSMKEZPAc3L3IISrM3GdiLwV3kHyjxPykLu2GRGp+ynuLQNeoppWMznR5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jf4YQnZb; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jf4YQnZb"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so3252758f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684664; x=1791289464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cC37ObDoI6gvj753bjIn2lX4ChGqbdLdiKBVLQx0ab0=;
        b=jf4YQnZbzrszO2R8xP6FF75fWSePuF+jJgqE/SWOsbks/q++EH0zSKq4XR8Sl/gyJp
         fiFjIPT2OZWtqWRKeBcwjpOrAbroY/kENXuvLx13BNhJEV1Y/idS9df7+Ae0BeuBHDUv
         DbJlG7fozeFtrMSm6cjKBurRL45nwZr330OxDeEDqv3HaRBcHoFuyjlby5L9TcQv0xui
         lQKa/et/38f9g3CLqqwd+ETFde/52TsE+vgjaAeXUcpXmP4wKFA/WnEkeJfiIZG7iiFI
         8bAu2SQioajKS5iGPNS1J1Hd44TMMAVW/hq2cWWzavuakN6iKy9NPi8Ypbdu1R6FQnbn
         i7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684664; x=1791289464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cC37ObDoI6gvj753bjIn2lX4ChGqbdLdiKBVLQx0ab0=;
        b=C7IBQC37vqqSD1G9jEh91q5N/GyFWjocemB6y87Po2e7V+bemAtMlvLOoTh+eE4OGi
         R+BHvvM1WjXwkccyAtjl2DXoP0d0pd7yO8t/sGfkz5pOftYyizBMPs3eQJDaIjxY3lMy
         x/2FvHQHGVLvguYQDE1HtsmephRnls+wgUV9sxUcPYrFvTTIiD0Zs+HfG9qcChLjCmz7
         NMjMVnUKw/r0HP6VBfxD9zp0hk91E3C7ehipVjhMY41GN8mY0Hn3hLoz0uEHq+RWdg3l
         7grx+5cjgQWZKjc/vuIyzRQMT1tGS+7VHcGPmjfF7CySTTtrh4xUZeuecVWVnEM1cUKe
         1oMA==
X-Forwarded-Encrypted: i=1; AKwUvBymbfTUmVJTBRrjfveOpQ9pbRBIwTktDfauzPBXx9QZxMkIyDQoO8DDC2d2v/AbFzGb2NufFJqfeUmlwKA=@vger.kernel.org
X-Gm-Message-State: AFuF++lEsZddAJ25/MkJbLFtb8yVn2qploSW37sq5PmsSi6jvtMKfXyr
	r0w1LAKpEMs57AmDvjGV5+VXOxUm4qBARsPpnhqfh1R41CRopSgjyAdO
X-Gm-Gg: AYBFou1rqOaIfMFMzGDvw5TS9udlZ8M6GypsYuelJBExJkPXuqWXLpoxzEof3JdQAa+
	39IXULfz20cAA3M8htt5PDVHWrobCR4+8xdX/ysW+HUviOcRHIC+X6KO0wLD8Ppn03GUH4ttvPr
	LMGxa2MCoXAhDzvfTZAYo8yTt3+zXGjdLewAph3nPZSfFxcZFqtdy+M4kQSp6+2kYW11zYmqz8W
	dYl4LWwHfuF1IOjBB5KK1CJLN7K+GoGWt3amAmwGkrJmgaddBCxtYXFDrO+XMiRPl93QfmiruDD
	siVpd7D0whNbc4q/hodNX5//S5D4upIs3NfmW/a2KO3ygg9VMTlht9kjKBlH6C+nQnbf7bbU600
	DVBik8aLC/b5I+DmuwsIiq9iJjNrJ4B3E4Es45R3xXJWiJ7DACmMVr9BFoR2yhec9jHhNqNbf59
	lcJ5/SdsJJ0E8Dpedy2ujP7vGbk84xK7J3FfZf/RiBpEJaCtX0t9d8QXLNT4JS1nwWOp11fUs0z
	SM2us75Q69QPvNYuTvSqMM5LV+OO1sGu3d3LsyutGutqX4cDlk3skaGVFbC3/ykQ0VDcDs7y7Je
	bnm7Ay/W/okgvMCyTQ==
X-Received: by 2002:a05:600c:8486:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49fe66b426bmr271918275e9.12.1790684664219;
        Tue, 29 Sep 2026 05:24:24 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfafa23sm70994965e9.14.2026.09.29.05.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:24:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/5] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for RZ/V2H and RZ/V2N
Date: Tue, 29 Sep 2026 13:24:07 +0100
Message-ID: <20260929122407.219448-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2H and RZ/V2N SYSC drivers register auxiliary devices for
power sequencing, which require the pwrseq-renesas-pwrrdy driver to bind
to them.

Select POWER_SEQUENCING and POWER_SEQUENCING_RENESAS_PWRRDY from the
RZ/V2H and RZ/V2N SYSC configurations so the power sequencer driver is
built whenever SYSC support for these SoCs is enabled.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index a63df28df3b5..5e0389e677a8 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -516,9 +516,13 @@ config SYS_R9A09G047
 config SYS_R9A09G056
 	bool "Renesas System controller support for R9A09G056 (RZ/V2N)" if COMPILE_TEST
 	select SYSC_RZ
+	select POWER_SEQUENCING
+	select POWER_SEQUENCING_RENESAS_PWRRDY
 
 config SYS_R9A09G057
 	bool "Renesas System controller support for R9A09G057 (RZ/V2H)" if COMPILE_TEST
 	select SYSC_RZ
+	select POWER_SEQUENCING
+	select POWER_SEQUENCING_RENESAS_PWRRDY
 
 endif # SOC_RENESAS
-- 
2.55.0

