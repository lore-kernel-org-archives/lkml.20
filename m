Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E9D499F3A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637579; cv=none; b=YZw9kM1xxaFUsKoH7Cf1TP0hilQ99TuqqYyBOCS8rl4t+L9nrqw/DD6qjtEcV8sE/JN5hEp8MdvYX1IiteE+qYK5H9lr0exbD9bThPo0Hfsn03C+z69QF2/OTatPrzHVEYs6ghgmYz35kesgvYhsbP0aXnr70AqPoLnh8hjsB2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637579; c=relaxed/simple;
	bh=8Hpl/jJQXgMDIx/9aRjnDimcwY9u+PRuHlp14LtJI1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+B/CvxY7venrOPJtYSUGP2cWuih9glgJdAVVn8FmftgWzyJFbjlWCfNVfkSRHmNlr8/rqIeBNxi22XrIwjyZgIiEHHHYJDw4bO3QMbg5nhInSKmwxqBcvUWsqfA1RLJmSwIX8nx/Y/MlYiBRnfiBcCwEyV8j0cMFSYoD3IBqD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=imo3UH4g; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iibBBT+L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="imo3UH4g";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iibBBT+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
	b=imo3UH4gELdgl3AMfTiuLnN5r/di+m+TfJN/qwtp1M0jU/C4OdueKJcR8bUlIK9W5cfEFK
	Hr4OdUQ5psoBEMgk6iFhlkRbX6NTTdVObU72G8DijkYHqeJyzBINYxcQuCcax15yARjito
	dar60O9KpF/p9mO7O1yLIGlVLJFXvBQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-ud3N9e-OMWiNiX6Q6RHdqA-1; Mon, 28 Sep 2026 19:19:35 -0400
X-MC-Unique: ud3N9e-OMWiNiX6Q6RHdqA-1
X-Mimecast-MFC-AGG-ID: ud3N9e-OMWiNiX6Q6RHdqA_1790637575
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8a88d53c7a6so45440237b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790637575; x=1791242375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
        b=iibBBT+Lun9q5MYme41HkYMZt4u9A/DAitSXRCMqDz2iIiWBYi9uU3a0yi9Ni8lRRk
         tCxeOEEMnF7QldhgFwccToz02wvjYxv6dp0O2nLRI1/QgtLuzTWom3Tv2y3m8FT1xeCM
         OM6vE4AFvmQlXHw8L8ElKVmGZMszVjP+AoTY8LFV076JgWUsaWlVy4cCpnHt6v63Ev7C
         zdBJxDBYcRltbOfwgcmoI56LwSZR2d/C0qOCaBHcpu1TYF0ZcBX+hDKY98jtHzlENOZh
         YQRSoQQ7DIeSqxAhuGT0fNz+vLZa0kAc3kfBNgbziqo5kz6FPwZk7oeXQfSiANVNpUbe
         KBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637575; x=1791242375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
        b=qUTSwAUfMIcKqz67XekCScqi4IKfVfV2GJhE5s8bPblycM8mHtVygM7B2WQBHudpUP
         sy1L7gc1YXFteXpRQ1X9T14UktFl+d8V/pc1R7zclyhGjL3JtNTgwBLOA2abMvqPBKbP
         uZ8H/8owLeCFR9yZ1q8tFxCqzU3zRd4nZ7ZkvnTm1zOpiNY/443Vrkon+qJCkV/ozYnO
         w88NvTnphMgVo0Q6W1yG1++ctCVz/n2NJ0P+ya19ANMUn7QJhQm23ME+N8dELeiS68Q5
         TXEBQAwgAFvQgJ23qDBtIrFYpvcJu+QSMlCtELCHwOFANP86xUneAjn/hI40T9sS8USV
         yZ6w==
X-Forwarded-Encrypted: i=1; AKwUvBzdcV81Xgm0L0KBZ0wjEDfdHcYiQBJaaTx19OkoExvgWU6oUG4CGhyhGe6GfXL5R+ZlD6arGJTYSe/fwL0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA6QEGGLEAfP32wpgfLHrM2zlkFEN6VNYfbYwuTsfeI+ImmcWF
	ztikG2ceqDnWl6pyaG+Q9m5IvHIk4AwgpYOGdZ6G52Gg1RY5mdGrcE7g32sAgf2msQffuedM/35
	tlN6R50eIgkJ2UXQMgDz0e+kesDsCG7AXknpJ8+KBlxxJHSj/XfbqHA6tUonUCAkjOw==
X-Gm-Gg: AYBFou2Jr88oIqvzvhPMFqI5Wtnm74bmhBiyedefGZ46dZio89vhowtm8jGEYT9LRo1
	Gg4tU1TCocQkMGHDpmIi0EhQZBu7hk6BaHP1NrpiHD4kKkIosCADAlGbi9Hsj83XOe+cAxBIU6+
	r2k0KCB5vW9FoHZ2KNcWpyw9GbRk99tjBhYNUuTMGDJxXvCwmZBV/ovvT5O99wXQSYL1tQMspcb
	0tDdVmzigIEs8qAFkRFPT2+/DYjjYoifVUxb0mm1DvnqJyDcRb2XL4vtm0q4nkyQvKSsuOMb/9P
	Yj89BDd9Mm1iz6jlEgtXyuI3HD/xRKSEU/20neHoIRsepW8wH0O3Vw==
X-Received: by 2002:a05:690c:3181:b0:8a8:889d:2ea with SMTP id 00721157ae682-8ab3b5249c4mr5722577b3.48.1790637575144;
        Mon, 28 Sep 2026 16:19:35 -0700 (PDT)
X-Received: by 2002:a05:690c:3181:b0:8a8:889d:2ea with SMTP id 00721157ae682-8ab3b5249c4mr5722437b3.48.1790637574673;
        Mon, 28 Sep 2026 16:19:34 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:34 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 1/4] riscv: dts: spacemit: k3-com260: keep dldo4 enabled
Date: Mon, 28 Sep 2026 19:18:04 -0400
Message-ID: <20260928231807.1757995-2-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: James Morris <jmorris@namei.org>

dldo4 on the P1 PMIC is marked regulator-boot-on, but has no consumer
described in the device tree. The regulator core can therefore disable
the firmware-enabled rail during unused-regulator cleanup.

Enabling pcie4_rc on a K3 CoM260 Dev Kit without this change while the
board's included RTL8852BE module is connected to the M.2 E-key slot
results in CPU hard-lock, as seen in kernel log:

[   32.521536] dldo4: disabling
[   48.125823] watchdog: CPU3: Watchdog detected hard LOCKUP on cpu 4
[   64.125829] watchdog: BUG: soft lockup - CPU#1 stuck for 26s!
[   64.125926] Hardware name: SpacemiT K3 CoM260 IFX (DT)
[   64.125928] epc : smp_call_function_many_cond+0x158/0x740
[   64.125938]  ra : smp_call_function_many_cond+0x11a/0x740

GitHub Copilot assisted with diagnosis and build and test automation, and
changelog drafting.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Assisted-by: GitHub-Copilot:gpt-sol-5.6
Signed-off-by: James Morris <jmorris@namei.org> (Microsoft)
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 92dea86397798..054bfff7413a3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -187,6 +187,7 @@ dldo3: dldo3 {
 			dldo4: dldo4 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 				regulator-boot-on;
 			};
 
-- 
2.55.0

