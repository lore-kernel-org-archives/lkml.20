Received: from mail-oa2-f30.google.com (mail-oa2-f30.google.com [74.125.231.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7359235E93B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127841; cv=none; b=AsGsOs28QM26qwF5vz6KFhr3Z5YwGVZkhMyknWBPTEjPhsT5QoZJSgOj5qMXypTR2Dvvqt3Fd+qlSSCJV24IgZ1kpNbvqlpURf6BuTxbIk+M6uQeippdMaTlN6ERvcTNnI60CVR+B73hgk1O1sl7Z7bXqtjP7664JwNYQiy2Z7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127841; c=relaxed/simple;
	bh=ZGRMUdvpEDO28//onMwgdeir1i0kQC2Vm8gsM52HBfQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rlg2XLEi5PstSNEgO2Gfuh2tHMGUWpwRHfFYtVwDGjOUrtx7yTlASgW15Hz9/Iiumn+NNGcYY81HrnNkgzOicm9pwFsMI/Jz+eDeiDRXby0YvGRM2AUv/0iJ/l2N4DB+fV5LdZ78HCPAYnnOMeUu0B6mTvHrdAqsW246eIlEFVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8uUhVY0; arc=none smtp.client-ip=74.125.231.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8uUhVY0"
Received: by mail-oa2-f30.google.com with SMTP id 586e51a60fabf-483c65c2fa7so315411fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790127838; x=1790732638; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VZPAkhgcpAiEbHXleiCEIDZbE5BEZ43kNMKfu3ffIhU=;
        b=Y8uUhVY0/DyaSrHLeZPuU6UcY96AiLU6adZK0lpCNQeIZAhKMgml1A4rvXiSOXkSt3
         YYFDkrgdgjs5OS2Q2zBVyJPSYV9O8JLItV4MZx8qwgQ/U96id4IbD5VvsS0qZMxijUo5
         8nfquWhN4CpPiMXmg3RjVDaps31D9har9ZSaO1CJPqM3RxWNw8C/i9Ozx/H30dShJVBG
         T6MHY4LgsGY4h2ToxYO4AqzF4tjxxVB4dz4Cp+nZwGwS28iR08X9bkk3dY7LVCCTfpgm
         j0iLJfnEWdMcG0Dc/XxEUweo5q7o2zERj9kl06dCsmdoxFnplitRVRsPcaTq01HrjyoT
         47gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127838; x=1790732638;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VZPAkhgcpAiEbHXleiCEIDZbE5BEZ43kNMKfu3ffIhU=;
        b=OM2qsnv96DQXxxnoQS4grAUGHL5skDwEinUwzmCtbsLQU5ql5SR509obge9iFlJ2d5
         rpOnVytZSTUpbwtG2Ee46xGRqFdCMTn1eFgfqxiw2//yyJGHvezR7Nj6p3F3EJ5xVgDo
         vJ9JpYIXKMOjwug6WrqSMXffLWSw7BgDl3PFaIRgRj+ditAtaEF8xm160Id2uRlwbM0O
         49H3+nGc1TVR1meadr0R+koFnjVuKnsQE3ibQsZ7eDdvj5WkindqnfPORIMnyyGN6WJc
         x0m2KidDOSXXqRevCnxuMJIc2FUYKk+XYy3R5GYuc+JLA1lqhrnRYJ7V23MvjA49wV5A
         AmNA==
X-Gm-Message-State: AFuF++ny/e2DUH6xpuUqQO7yHGrMhmurVXxDpTvpRqv//7SdSzVywHSK
	iJwMLBRXWnZ61ezTo3kSqQGUmRQAVuHrtsqXzNAo159zySJgFeS/b/Zp
X-Gm-Gg: AYBFou1DmTGacuewhaXbrYHg8+FBRorOYejCVo9VaFJZ6JqM3rU+eiGjYULDZZ+rzRN
	FYHKT5P1zXKLF2kPrwqm14o6jJwlEdTVl+YejA+RMAPZ+2DZdGI95C8bT3yRDmgI432uX9C7MUO
	yeogzYd8Oe2H5Cv7mDdPAMpkh9XS3o7RO0Cx1RQAOVV4QBAQyTSwBq9cV5WvonniH1fq9L6GD6S
	HPlIbLw+1TW2MPr1pgvFnb1BEJYrbbAJqvS/xIWI0KmTdZy3oOuglwPJsAtvJMufUsNtI0CY+7x
	15LrwOOX8CP2/KDzExFTRFOhDHeEzzGULUw775ISxf2uAa/n29sTmsDpzPUl6DBjAsVBsy3vtBx
	/da/f/W1FNlNr5wcuYLXeVALD2GL5D8daKA1AxsyD2FV8F/bXrSr2QC0pTCW2QRz56lkzMPWIom
	bQutlYxcjecTvqhjZpAh4nOxPS9bhEPIYg+O2wXT5B/J2moMDoJ6dhwCOfTGaGRhExHIuZ
X-Received: by 2002:a05:6871:cc:b0:48f:e0e5:a1e8 with SMTP id 586e51a60fabf-4908ba61bcfmr1353300fac.45.1790127838251;
        Tue, 22 Sep 2026 18:43:58 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:43::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908eb88b49sm1110257fac.11.2026.09.22.18.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:43:57 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/8] eth: mpnic: initial support for Meta
 Platforms NIC
Date: Tue, 22 Sep 2026 18:43:38 -0700
Message-Id: <20260922-linux-mpnic-v1-0-236844f53072@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMous2oC/x3MQQqAIBBA0avErBvQpLCuEi2kxhqoKbRCiO6et
 HyL/x+IFJgidMUDgW6OvEuGLgsYFyczIU/ZUKmqUa22uLJcCbdDeETrndF2qo3yDnJxBPKc/ls
 PQicKpROG9/0AAG6SB2cAAAA=
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 bpf@vger.kernel.org
X-Mailer: b4 0.13.0

Meta Platforms NIC is the second-generation NIC from Meta. There are
quite a few high-level similarities to fbnic, but all of the CSRs and
descriptors have been reshuffled, and new features have been added.
Since the device is sufficiently different from fbnic, and the design of
our FW is minimal, we have decided a separate driver is appropriate.

Major new features compared to fbnic will take a while to land. This
series includes only the bare-bones Tx/Rx datapath.

Our high-level patch sequence and plan for the upcoming series is:
 1. Core datapath (this series)
 2. Basic offloads, RSS, and counters
 3. Firmware mailbox support
 4. Base ethtool operations

This patch series was prepared in part with these LLM prompts:
https://github.com/kuba-moo/ai-prompts/blob/main/driver-upstreaming-prompts.md

The prompts were used to distill our fully-featured OOT driver into this
minimal Tx/Rx capable upstream driver. We then performed human review on
the output to create this posting. Jakub has made the prompts public in
case people would like to take a look. 

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (7):
      eth: mpnic: add scaffolding for Meta Platforms NIC
      eth: mpnic: allocate MSI-X vectors
      eth: mpnic: implement Tx queue allocation and cleanup
      eth: mpnic: start and stop the Tx HW queues
      eth: mpnic: add a netdevice and basic Tx handling
      eth: mpnic: implement Rx queue allocation and cleanup
      eth: mpnic: add basic Rx handling

Mohsin Bashir (1):
      eth: mpnic: add register init for the device

 drivers/net/ethernet/meta/Kconfig              |   13 +
 drivers/net/ethernet/meta/Makefile             |    1 +
 drivers/net/ethernet/meta/mpnic/Makefile       |   16 +
 drivers/net/ethernet/meta/mpnic/mpnic.h        |   66 ++
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  321 ++++++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   |  553 ++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_irq.c    |   64 ++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c |  181 +++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.h |   35 +
 drivers/net/ethernet/meta/mpnic/mpnic_pci.c    |  187 ++++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 1398 ++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |  147 +++
 12 files changed, 2982 insertions(+)
---
base-commit: 6598456d72e48d779445bfec8f72114747f8b8d7
change-id: 20260918-linux-mpnic-8fa318d530fa

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

