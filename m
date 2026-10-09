Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3813C3F66
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565046; cv=none; b=da3ZWpNMO5wz8LOYu6eiMlF2HYCI26EnKaK4sgs7yvF1vWIQtIU8vQf4GQUBUE8Lx5FUEVAV/QbuLUFJWj9ZaB4XZIGP8Q/E0oCKY+4lc4YVzhsqVLk2lbygwztSU/1uJezaGEfZzySzjuwSWd91+zThEKNRt8oBVu4Zh8VLoVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565046; c=relaxed/simple;
	bh=S0ooHVwsSm9j92TkP4B5RF5jogq2Eb0nglNby8lex/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYTvaUY699KFRL3ZJ2TYxZcowmVHVCsWeWU5Kj8m/2Um1O7bWE3TEza3UGvl/g+mlT4q32N2XUHMTxlQsWHi0SkmIOxnNa6x9H2pRt/YDqwEeDEZZ8pe5Et6CVfRFy/qhl/TtPX6jJBqej47l/tECo59jGXeQEqrmuA9/QjtuFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjuOQ4hV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjuOQ4hV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a168355946so1114935e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565043; x=1792169843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmxImwdyKaCz4AQnY1VDiMchfMQezVpc247Y5c7VBv4=;
        b=IjuOQ4hVVBgo3ulePEn6N/HAIjxkXU/w3sy0M41az5iL5E+HFSm0A3LR+ueavOLlt/
         6G7i8eK75i8yA+dx2ZjsqH7HoR01SFs1qPPdrryxwNRCxaWHZ/cLOMd8GwvSfGHe1WBN
         Ur8Pgw/QjLqfQMb9FFLZZPY9+mjt7q+3flGZv/hG5kXQ8oOw+JyeBDQylFbA8Nivd82E
         trnGoDPhrY4AcA6fMImAr8c3Imlt/7LxKUBSo0SCL4bx8LlKTVT12VQIqq/hy9swN2JY
         +giL/VKZtyhx1cQpXh1dkiUk0T1HKVOd+kc50SgnV4WZF+n9GD8eaRXCVdHm5m8Bws0r
         uSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565043; x=1792169843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmxImwdyKaCz4AQnY1VDiMchfMQezVpc247Y5c7VBv4=;
        b=LllCgmcA56CkOijQgoV9FgGtcoEgYQvCqsCInTAyQA8f5t7oKhgZAlHg/baAFscjtR
         vvd6YxUSvMiPsCuDSRw2jRPIrAeMKjFMNefbOPnQSnO5sRBvOEmgjSIsATa+SCjguuwL
         awIZ3mF96So+69/r2eRuMTgUZB6LQtHSgZ9Ggs/2ICF8IwXkgi6vppnMxcotvLTOGjl4
         LeJnawubmGuwTdXrUedsQFENkeTZcrl/vUPcVgVph7vtq4Ek2aMhnKo+QUcHq7ONasyj
         XgMvlfc/wUXEFk/QOkYQvtWuZAn6vVMrjJaVizRUo1X+D/8xRJJtPaSEXBa+ssKcI38A
         Zhkw==
X-Forwarded-Encrypted: i=1; AKwUvBzFIqYkm3Q+2zgDHNXRSk71B2RO6ja5V2oO1AQyOpG9pARZHNXQnM94NtAYWKq2PO22Da8T/cswJsKBkv4=@vger.kernel.org
X-Gm-Message-State: AFuF++l5wQLQRfaKaDLFWYYPcyfVa/AuXSLxV6E8VrBSa1ovk5zrAhcD
	hNuM9Wsk1Xhduq9YmIh2bLpMmiyaWEFqgxxAgKKWeWVPZA10uY2K46iZ
X-Gm-Gg: AYBFou3Pqoz73dK5BbkF2J2FDxJl58YtDJnQQyzXGP2j4c7iJgK9GRHRB66bq20tSiT
	HVkLJ0w6hPX5e6ni5JuejEC108dpKnJdlLveIgAomrQw18qnvsj2r56ntDe03eITezwl2oNmMbW
	QNUBIqFwfRvoJ4/96Qw3sKkRoL4TD0Qe1aQqCff5zdmnoWb/bcfWWqzkcel178a8H/Gga88OREK
	czZNsmj48YILLatFo8HfevwjOhzG2TIyz+JOMyj7she6IEI8ABRelMFJNGvEULGgaIM/MHdBr97
	YdWf5ag7RrPl/TKzU6gl1HrHYyzdqjWpXZkQdS36ZfSW8SLmr1DoDg5CWPbcEneeazzYAupDy/i
	LfMXdSMwRGrgnx4xhR51EGsga1APOL6xKp81HR6I0qaq4FsLb273EXU7cxMYbfxy8QXj3bgOFwB
	PIT0S9zr3aEw0NfuzlPknhQNYTipMXjqudEeagM/kzs2alvgHtnP3yGoac30MKc8y19r1A5eYvu
	bZKe1Ekocnw+ATiRoSm47h8O824cfpc5nGUJzMfZeYikp1Kt9/smMVrMD6WBKoufU/eBnDYI/z0
	R8KoAMTH3GoKfD0ziw==
X-Received: by 2002:a05:600c:1e06:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-4a18e4f1630mr47392405e9.31.1791565043429;
        Fri, 09 Oct 2026 09:57:23 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm70667395e9.4.2026.10.09.09.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:57:22 -0700 (PDT)
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
Subject: [PATCH v2 5/5] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for RZ/V2H and RZ/V2N
Date: Fri,  9 Oct 2026 17:57:10 +0100
Message-ID: <20261009165710.1320233-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- No change
---
 drivers/soc/renesas/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index b7abca4559df..32cd0d9c8758 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -517,9 +517,13 @@ config SYS_R9A09G047
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

