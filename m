Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1547A4B7A35
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824509; cv=none; b=coVMZNV74tfxvA1TWurWLFaSxLyNwbueuxMqIfZQbAxvSUnUMsFyClmiqpRf/KxKOsbMMk1RyEJV/Oam1nI4G33eXNnO0hA9xUH0mf2iOM44KbBKZMEyLguNz8yLI0TzK0r3oDGmjcqThWeF+gBUSGYwJVJclkBSL4/Im28dtcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824509; c=relaxed/simple;
	bh=mk8XDZoJLrnz28nCgNWfaXENJFPufAikspSQ2eN5odI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoj0aU9Xpf1OhUb7oQogpT88uXEhble+g/VcIYolb7hsCQAhlTqbfwSnA9LHP5XCI/LWGEAZBhaWeZDIK8EcOH48oc4rUji2VqDl9rmdDPLYQQZYoV+ebP95wZGwqpdZ3JvhLxrJGEd6bgzdHU34QqGKiLEVS1VxX8vikv2lIT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxnZ/1hr; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxnZ/1hr"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1613531a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791824505; x=1792429305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mk8XDZoJLrnz28nCgNWfaXENJFPufAikspSQ2eN5odI=;
        b=XxnZ/1hrslvw2d5+up2S+1Kgq7Ul+LVtCS5ifOO5lXEDhBOIDITrmmkYigNNSC0sDA
         SPZ+FYWiDa2u8FW9ptsZMZ+hduGBIsi1nN5XcvNQKx3N8xBZIHC2AQqcCgAk8FpWVPpe
         PbhVEfjtGPLB+hMOVSOCYN125JmvTzC99UDOUWB4yBdW7kT5c/VCAgUd+/BzvKg8XPJG
         rAL8TBv7EBF0a77YMQIOulgBKsOKt+clz8C92SkNK2FSFwWGMLcQFQ0lCpaRqDa843Qp
         b7vV7QvCaddmcVhquGtiMc99EsLQb8r63FyTy663udcBmZPFVbp8dcFWgYQEUWCYhHXE
         pE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824505; x=1792429305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mk8XDZoJLrnz28nCgNWfaXENJFPufAikspSQ2eN5odI=;
        b=bXBLbg9oQG2iEV8pajhY2eqtpFCqZu8iXLt5re2OC1OmCPJqZiv0U8KKVgeSfQKEQ1
         /rvohgkyh1cxHqiV5i3LPeu+hC0p3PB/IrqPlD6QjAEFfHAMRuS24W7j4YGhCrDscgyA
         4P8sUIhQapFISl1mq/da33pbIejU2caxWfKYamyMCwCj0yapUNYHs21+Lwtv/i9iQEK5
         4OAlV0vuq9Ub3O4jb0KJ3l06EXmbd+AIqzANGvabuH4V51KgK1TRxpM4PaCs9S0wpJad
         sOCNtF5dYzV9rPz8YoCo/OeGcM9H9KJ78ZFa+2p/tnux0t/InqOi7lATyP+gmcyP4Y9j
         jJrg==
X-Forwarded-Encrypted: i=1; AKwUvBz6FjKHVEBI3k7u3J+z5XFGJsWud92fwoHPNdWnCOkouk27ji5whU4l4SXBvfYzBdvsKIKXPKMotRokX0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrS+AQyc9o8TEgGr7MvJx6xW2MRORpkqz3Z4AUVsUFQDtBtQZk
	9qTcQ5bDQTg78E3ip65eePdQujxyRbpi4phCWSaX9CVqrukjqrw8NIib
X-Gm-Gg: AYBFou1VQK8belYgvboBbqOSjnUeSkh33BjiTX3MDQGDVZwwTnlSAidYL72TJtRLAZc
	ks2eLM7IEVFYfdLetAaDRhiYlxTuN6u8uVCG7uHUXyINUIVUNWo8CLqAjNe7qu28Cw+wIK9O7qr
	Mvj79TXcfpnKI5oB7WXIasaC7FNqvd/yCoX6sczwrMAZ518T+sod42vXcXTsWZh3iD6U8gHurFl
	yySymjFi1pfDuOhW4Cg2ba0mzd/8lxBMK+QxV4AaclqCyjTfnaARZalD5mAVsYeexvQO8uojSGu
	H2n8ng6cmMGemjWfW/siDmbZYqE2miU4AqmZEFBQdpvM350OQlZWuOawQFn2uLIx37t597vy3u/
	tJ3lu/EjTuTsQq/D0ZAmePX5fgn6BN3sEZ0c+XVhclEqCBYJ+Lb5WFec/pTlEq64HAs+CS/4Ill
	Ja/T+LOumvzi9AQXuJTqmtBpdgBApOXeaxWAQQxnf35ylnv44gAl0SKDL2XC9XSlKzc1LvPtuhq
	IAOKu/Sko+lYDN0Ysk25/Kni4ciAaMOw2LIApL8
X-Received: by 2002:a05:6402:218d:20b0:6b1:827c:af27 with SMTP id 4fb4d7f45d1cf-6b1827cb0ccmr6636473a12.14.1791824505098;
        Mon, 12 Oct 2026 10:01:45 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dfff40sm5093730a12.34.2026.10.12.10.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:01:44 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: Imre Kaloz <kaloz@kernel.org>
Cc: bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	andreas@gaisler.com,
	sparclinux@vger.kernel.org,
	davem@davemloft.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH] PCI: Avoid D3 on PLX PEX 8532/8533/8548 downstream ports
Date: Mon, 12 Oct 2026 19:00:57 +0200
Message-ID: <20261012170113.985649-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927105609.8813-1-kaloz@kernel.org>
References: <20260927105609.8813-1-kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Imre,

Tested this on a Sun Ultra 45 with PLX PEX8532 downstream ports and an
LSI SAS1064 controller.

Without the patch, enabling CONFIG_PCIEPORTBUS reproducibly causes a
Cheetah bus-error panic when mptbase probes the controller. The kernel
boots with pcie_port_pm=off.

With this patch, the same kernel and config boot successfully without
pcie_port_pm=off or pcie_ports=compat. The quirk is applied to all five
PEX8532 downstream ports, the LSISAS1064 initializes, and the modular
mptsas/ext4 setup boots through the initramfs normally.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
