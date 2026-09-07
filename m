Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906EC47CA99
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788801580; cv=none; b=VSsElBaOBdTYgQbp3Epbj6X5LW58L+dRvyoLnVC6divWsOJ6bT5bS0E96whtIarBn5/yU3wca1/a9+hXwP1zEQ/kDSle6RQuC7DIrcK5HNncU98P1M/KxTYQaeuC0ZnODCSAP54xXZA47JqvXH3u3GqpxHfp0mpo9hi8BszZvss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788801580; c=relaxed/simple;
	bh=kqGezF/Wfqj/foPPQmc78QGbp5j69FCz61dTL1wNtA8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ge7nvu9IbrHJ9cGnGTao6EAun8/QHUxsAir62s+ICRQUdFwqEsUzIdV0hcFG/5zJhlf5dH7VvPcfaZFs6D+yMMcEGp/4aLXDUWvCGOeXLm2enGp6W1YQ/xC3ppvupK+Ufm6L3fhZ6I945DNcIEKoOG81X7ufD2MtMGXj8SQslfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JJ/1zd8b; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sebastianene.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JJ/1zd8b"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-482f41ca436so3123637f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788801577; x=1789406377; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDhNx6T7nc+YilNr/gP5RkiGsPYaJuQR8YZHHWYGhrY=;
        b=JJ/1zd8b1oEO/h1ASp3v1q48BjRR1bjkFzw722cLKVmadnmcGLFYxX3uWXZXfaaTJz
         VugSigW4zYG4Ph0T2Oxh+aEKFXol8+mtCRyGxiJTctXjT+RdbPY4TLaPDXdwvP/Aa92r
         CrnCBVZBrlfXBdJ9tRDsqcCOsCiswE3qAuPf0xDza6TQcAKrM/n+E6UC4Mf6LkUkLkPd
         UHZgZk5CRQ2DgmouOaiNq8qw5xUyxVc3biIpQAvQ6IWpymS369vnwF06rCgf6fEJCO9a
         GnFIUQsetilERwvIadm0bYFx4n/Z89f3o7BGp1naN2c5Qi1nZ5mg+jUx5lLtfCKTMh9b
         AW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788801577; x=1789406377;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDhNx6T7nc+YilNr/gP5RkiGsPYaJuQR8YZHHWYGhrY=;
        b=gDN3EsoQ/E8Okt1YOs995Oxk0cIAeuEH243q3Fd4KWlYBJ3QFZCLbKURCdbyuLqwKj
         0+zftIpoYPnwRaw7tTNYbuiCki8gqGZzVfk0nU9aoH2bk9PQdLoJjewvOPQLPSVjboCl
         anrR3xomNRy+ZPyosiZ4ggB7KaPaaCmtT2XeVLo/852oBZ8nUjzdgYHceMTdOoQzA0n1
         81KiI9ZXkfeYZtz9t+uWrWosCyTzfRhxQPkBMtRRsbv9xH1mEVdpPq4CpJgEIBMqoPSd
         ro1zgcuUxyLKLqF+4Dy4RNInqN6W7zM/Kfi/tgfg6Ols0nKRTMhXLefvuzhCFS4dR6Jn
         dY0A==
X-Forwarded-Encrypted: i=1; AKwUvBzCazqH1yIWcRmNsheI1Ba6/HxNj2QfYVpSFnOEXRvuC0n8U5ke3lqYG2GHcbh1+EPZCmyZeImSXUPduzs=@vger.kernel.org
X-Gm-Message-State: AFuF++lTS3mciAElvfIDbekfkJkdDjyZxjtvCn8bw73fVpuU40r4ZVcN
	6sKzrYH6c02OL9lnjH6DoBK0g5QaBzhog5j6l+pX6XskfpvmGkZyrq5plcBZrXHloDv/icOqPdm
	kuV/fndh48LVZBxatbyvhZnmnSMTUxA==
X-Received: from wrqe18.prod.google.com ([2002:a5d:6d12:0:b0:484:3a05:4b1])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4304:b0:484:3311:3702 with SMTP id ffacd0b85a97d-485872db94cmr27152632f8f.25.1788801576435;
 Mon, 07 Sep 2026 10:19:36 -0700 (PDT)
Date: Mon,  7 Sep 2026 17:19:22 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260907171930.4037166-1-sebastianene@google.com>
Subject: [PATCH v9 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	fuad.tabba@linux.dev, will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"

Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
FF-A proxy. This restriction was preventing the use of asynchronous
signaling mechanisms defined by the Arm FF-A specification to
communicate with the secure services.
While these calls are markes as optional, there is no reason why the
hypervisor proxy would block them because:

1. Host is the Sole Non-Secure Endpoint: The Host operates as the
   only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
   Because all forwarded notifications are inherently attributed to
   the Host by the SPMC, there is no risk of VM ID spoofing
   originating from the Normal World.

2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
   operate strictly via register-based parameters, passing only
   VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
   not contain memory addresses, offsets, or pointers, forwarding
   them doesn't pose a risk of memory-based confused deputy attack
   (e.g., tricking the SPMC into overwriting protected memory).

The pKVM proxy behaves as a relayer and it doesn't currently have its
own FF-A ID(only the host has the ID 0). The behavior of the setup
flow is covered by the spec in the: '10.9 Notification support without
a Hypervisor'.

While at it, enforce the MBZ/SBZ fields defined by the spec to prevent
odd behavior when a new version starts making use of the reserved
registers.

---
v9:
- rebased on 7.3-rc2
- no other changes

v8:
- rebased on 7.2-rc3
- no other changes

Changes in v7:
- rebased on 7.2-rc1
- collected the Ack from Will
- check for major version as well when doing the SBZ/MBZ enforcement

Changes in v6:
- applied Will's feedback and re-ordered the patch series so that we
  apply the MBZ enforcement at the end of the series
- update ffa_check_unused_args_sbz so that we take into account the FF-A
  version because the spec changed the list of unused parameter registers
  for 64-bit SMCs from v1.1 to v1.2

Changes in v5:
- handle 32-bit smc variants correctly when doing the MBZ enforcement
- add check for FFA_FEATURES
- handle missing FFA_FN64_NOTIFICATION_INFO_GET
- collected the Review tags from Vincent, thank you 

Changes in v4:
- previous series(v3) had serious issues with the patch number and it
  appeared like it used a mixed bag from v2 as well. Resend this to
  restore the correct order of the patches.
- fix strict check in ffa_check_unused_args_sbz and make it "<= 17"
- check the receiver endpoint Id in
  FFA_NOTIFICATION_BIND/FFA_NOTIFICATION_UNBIND instead of the sender
- use hyp_smccc_1_2_smc all along 
- check the receiver endpoit Id when doing FFA_NOTIFICATION_GET  

Changes in v3:
- applied Will's suggestion to use the introduced method
  ffa_check_unused_args_sbz for existing calls and added a new
patch in the beggining of the series to do this.
- merged the handling of
  FFA_NOTIFICATION_BITMAP_CREATE/FFA_NOTIFICATION_BITMAP_DESTROY into
one patch as Vincent suggested and create one handler for both.

Changes in v2:
- enforce the MBZ/SBZ fields
- split the calls into separate patches
- rebase on 7.1-rc7

v8:
https://lore.kernel.org/all/20260729121306.1519473-2-sebastianene@google.com/
v7:
https://lore.kernel.org/all/20260629093558.2425257-1-sebastianene@google.com/
v6:
https://lore.kernel.org/all/20260626074545.433234-1-sebastianene@google.com/
v5:
https://lore.kernel.org/all/20260623115354.632361-1-sebastianene@google.com/
v4:
https://lore.kernel.org/all/20260616154149.2763214-1-sebastianene@google.com/
v3:
https://lore.kernel.org/all/20260616105417.2578670-1-sebastianene@google.com/
v2:
https://lore.kernel.org/all/20260608165549.1479409-1-sebastianene@google.com/
v1:
https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/

Sebastian Ene (7):
  KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
  KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler
  KVM: arm64: Enforce strict SBZ checks in the FF-A proxy

 arch/arm64/kvm/hyp/nvhe/ffa.c | 220 ++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 8 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog

