Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9F1448E0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887319; cv=pass; b=XnHWMLJmYiCzjfSbPyRz4aEJYEEF+og5mAwA3CEKXQibAwykgCTFCd7H13MHIZ/T8Pn93yE8WjO+ussTJiDz5WoES8UnoysxDJc/IzNS/ihLgwnQXde4hvXwf4HAeZEHA6C20IfY7LUXSUgWNOCISYtGV18RZ7SPdGfc+9W0Eb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887319; c=relaxed/simple;
	bh=PV74xrzDSBRTke/cHvAJ9HlN5yJIVvwoG/IxBDWTvkc=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=CblIvnNFWNMC6nQZhsCnKvr3Ffbtuo0BFB7aV2Kvk2wa75eLO30XnYbLJit19zEDrHMCnp6P/2Qr5dcfQyJB0dV0lf3x/puQBd6nX7RQjIkNClTACKQjQi88cTYg/IO0lF5h0/BUdiAD7QjN7NoQk3njx5I7C5uHFqFN4M+UpYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=Fpo1sRjD; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="Fpo1sRjD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6e954afbdso4075845ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:21:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787887314; cv=none;
        d=google.com; s=arc-20260327;
        b=r0hUZxp3gb1/tGkIN5gsX8vgVSqbNINPCLWzr8ekHWLhkNaW1uQGShBxu2o+XFg60R
         uvuYqK+eOKaIcTpx5brVUeWVzLLcTtvtitUA9T1EYqZQqNvV8kQlYu9/p/9Od90SE+lt
         y2OPE8hpXTozuM4h9+OQdzoGevncIL9RqZoLNJF+lb3uhJ6uilvXDGkczlZbyTXy6uZm
         jTUvz0vV7TSuI2L9Zw0HBXA/Rd+RGtJcjqZ7nMPGMSK9BLIshVI82YndJUvCaE2Bm9Q8
         FUhkiaTnjQTm/95O9jUVlBdcDMjW+JgPDnDA1mbBY+9gvCwZQr4B8f+S2qh5i509nihm
         OrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Uee4CaKhfoQ1WGVh8aDxMhw0p8MYNhqtIxucP0xeS34=;
        fh=+GVaY4jEu+epmZW1u8CqomcoXuZh76oSLpmJOVhJlQ0=;
        b=ZBP2tOw3ZWfT1sUlzSn71U7lH+/q/hdCVkxFFal4vGz90NgXjuRlo3An0Vg03dHrgT
         j2d1+Jaxdkdj2lfhQcrRqyBpAssygfwKO6bMj/FYpBD3YVWE6Pfyw+omIAeZXgTrMmGl
         4+ZRlcosq4LoIfn3tDoB5kuTUyTiJI0iywMCx58rTg7cRV/HgRofS0RDhFz5MiztqHsv
         /h7hU3OrNbwIljnVpeoncThwHNaMR2Qn82d/V2zYIYd1/XF/O9+qAbC+Y/AfozADnV1D
         xqG3bUBE1g50P+dCmRAPTk0o43lFT1iyh2CZv/dsdFxH3vHyBlOvrbrKsOh9Wos2ZSfK
         TdYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787887314; x=1788492114; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uee4CaKhfoQ1WGVh8aDxMhw0p8MYNhqtIxucP0xeS34=;
        b=Fpo1sRjDIC8Ngii4Re5FCtcwle6Km8k7HLVLs0qG4T9mDSKWGyrNTyD5IJfBayRP/6
         sxG5TUzW0YSiUTZYTB6bhqpwbGAtBed990MpDejZar4dOE5VH9RF71fJZMWdBJwuq7Ld
         tbpAsiaQ2bB5yWw2QOcQ3KyiLrCKsInC4wA9k1m8vPo/W/HrNtTZsVZCVKBHfX8OWhm7
         rGt0J1xHUR4b3jBmJT8GpvWiwtvYsoeP5/aVq5I1FwZ8NqWagDncggmIcD/GJi8OiPid
         rdbkqL1XjuNqSLN5tUrugRovc0uvhQN6DPT30YuM3niOJEQK/x3sN1GM5n2B2gPY1zan
         ZK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887314; x=1788492114;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uee4CaKhfoQ1WGVh8aDxMhw0p8MYNhqtIxucP0xeS34=;
        b=lmI6XFFFVuBeKnVt5ZHDI/JDl0xck8vfj8DdjNGlwNBpLEVlJH9NnwUGG7jld6i4lz
         5QysOqsde4Daiv6UXIc3ac8mlrNVw7gWTgejtdLUvkRpEA1HiYruDkuc7IaW+lYEOyrB
         ZKtgtgHh6Gy58anyXEm9w7ioQbvw/WMPJyJCSkqyP3Dp+0EtO1023BopFYto+WtwXLrd
         dG7WBGeCkwnGC09M2RfEzxpWobSHOQ1WV5mLfQMJa2QwQLZqR0nqcgVU56R7sn/rMfwx
         fbnQjFZb+WOTYEu+3fytqxYIDx2IBwgNALUXDOR8T8TOv8pBY4CqHC1LuSc7VgYYTO1l
         wLcQ==
X-Forwarded-Encrypted: i=1; AHgh+RpG9h8HwdYRiZsHRpnhvD7y7WUQiU0RmL4lysqGjRF4dRl3IVxkT8V5QLq0akMbaaL4j9wobotFEQyuu0o=@vger.kernel.org
X-Gm-Message-State: AFuF++lRYGN/nbKQSAEeL33+QBDbpbWCYwSzJivF6b0oTtsMXhhbFCbb
	3IrcgQ51HyhWJfV+7VqZMnKUSNn0tbAl+xyA9okfzG+YxDdgadaCwv0a9yIgd7E5VXG1oMbrQJ9
	4Lk2cIpsjKsOMqDOM03Ab4/lsWPeONVkDCIuhEetz
X-Gm-Gg: AR+sD10g/YkkeyodQ06voQmKnbVN39mKB3GDFn46XLkRwAbyWqmOknL7TtPYq8vdkC9
	1b+vH/wuOuAwWdwusNZ6dB1/3arOADsfr1xrPSCqkPZUB6HiELOjj/ddkntAU3xtkpMfT02SAxa
	1Zon82RSTA1w5nikqtUgqXo8KlJYJEy26kKSZxjU/q0bX5vzpn0ACTQfifN9c7Y8WEi3a2cueeL
	/11tAFIAGla2UAzMR9A3bN0UoTjZaqe3oPpBmMfgTZ5rtsMxu0XSHuk+rpWeRIYXL3YFkTMDmrv
	yfpsU1TFdVsh3Y3PM2MEIR9ac5SirWjKjJO8VQaO4LOHXkfJ+G9pSMS49/wxx4xQsVQ9n88XIR7
	p5mo+GnUI9XpJuDQXrvEI4X0FAVHp7YzA
X-Received: by 2002:a17:903:2f8b:b0:2d3:160b:c01f with SMTP id
 d9443c01a7336-2d74ddd684cmr64429595ad.6.1787887313715; Thu, 27 Aug 2026
 20:21:53 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:21:52 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 20:21:52 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 20:21:52 -0700
X-Gm-Features: AcwNN1UXSzbvMguu57VTO6I3Vg6s4xk8FB-MSfUF9MZz6nJ3LiZ8NA7RHl_Tt34
Message-ID: <CA+0ovCi3Ng3vsi3ZWWMxKNA7Wk91iGUu6j+x9Lof5EGsm8W6zA@mail.gmail.com>
Subject: [BUG] afs_done_fs_inline_bulk_status -- KASAN null-ptr-deref on
 call->server when a fileserver aborts FS.InlineBulkStatus
To: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/134-afs-null-call-server-inline-bulk-status/

  BUG: KASAN: null-ptr-deref in afs_done_fs_inline_bulk_status+0xb4/0x180
  Write of size 8 at addr 00000000000001a8 by task repro/9497
  Call Trace:
   afs_done_fs_inline_bulk_status+0xb4/0x180
   afs_deliver_to_call+0xbf6/0xfc0
   afs_wait_for_call_to_complete+0x2de/0xb00
   afs_wait_for_operation+0x244/0x8d0
   afs_lookup+0x1245/0x1700
   __lookup_slow+0x1fb/0x2f0
   lookup_slow+0x53/0x70
   path_lookupat+0x3f5/0x8c0
   filename_lookup+0x256/0x5d0
   vfs_statx+0xfc/0x200
   vfs_fstatat+0x11b/0x170
   __x64_sys_newfstatat+0x151/0x200
  Kernel panic - not syncing: KASAN: panic_on_warn set ...

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
