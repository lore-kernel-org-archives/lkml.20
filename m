Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0644749EC68
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057921; cv=none; b=QBuSEt0JPjGRVo9AsxWUDtTeuEPeJbykMg6koW9zzke/78AeePNT3/pi+bVdL7umZ1lJUuKD0h0viSdo8Eg/5Kx+qL0YlkSYcKsB5oDFR6txGKmHgSjC4/RZqyvVwVENshGdFFcx6dfrQq9k4+IZngMjUQsTQ6zBhZmi5A7Vy2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057921; c=relaxed/simple;
	bh=h1WMbnMbzIi253lfdQ+u9FLPEFTOIsOzHEUUkwnXNqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KpjSUeFgjAc9ygD1xkr43rjNO54wkp32KJ8XoiKf4+s9N3zWbG5I6GnvfUgTVoQ70sraj2ugCTiHLqmqAZpqlsKIyxTZ0q0hYpTLTs4JBq1lnZhscXERyaMa/z+FO6HYTHpktKB5xwG2V0XlGTGy53WkGPO4qZBMyuv12tmnp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UnSBobRf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sr6Ugn4v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UnSBobRf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sr6Ugn4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792057918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iSloRlPr3slvcSabouqCfbFikV0zEeUbF8yFoLWgrFc=;
	b=UnSBobRfaksXNjQa+TVWwdBcULpIeIQ3sEbxV3ORoLMo5FXo+w8Rle/GHp3ZB25AdNiNt5
	b4EQxxfiv5hgx+EUn4D9UXXHsVHt5Aw5S1rhzFontIVFMwvfxbovQlbC/TYudqbfYRXjLj
	x0lECdlC/I+kOLbiE9tuRjkZaQh1+wY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-U1PLL9xqPyyZk_pG0T1J4g-1; Thu, 15 Oct 2026 09:51:57 +0000
X-MC-Unique: U1PLL9xqPyyZk_pG0T1J4g-1
X-Mimecast-MFC-AGG-ID: U1PLL9xqPyyZk_pG0T1J4g_1792057916
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c4445512dso1193872f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792057916; x=1792662716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSloRlPr3slvcSabouqCfbFikV0zEeUbF8yFoLWgrFc=;
        b=sr6Ugn4vNJa+IKRRChLBwLXfQkii45jqcBGTJ3J4qk30iby/CmXcIaakXlAet63fVC
         3yjN0o9+5HoiCIO1nJONS3Egv1y4lG1CBZiwW81GS/DzIY9fTmTpwMV7pdREAa/8BhEq
         i0O1MVI4CWRTgxygHJizlZezi9aZF6WVqKkOxAsgZ1CdBlus9wmHNb6iIjL9hI+XZRc/
         N/ghLbapsrOnjkEmaLkYraGc3XmZSWF3AfbPA3VNE2rsovCfD1KwvBZcwC5jjipeJTNV
         4J4KmK0Jp3e5aM2xnnCvjWGFaT+bPI0RfH9r3K/uLKi2Sul92lHgnvzaJCahGJLDkAG4
         ViGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057916; x=1792662716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSloRlPr3slvcSabouqCfbFikV0zEeUbF8yFoLWgrFc=;
        b=aZ2Ynjlbl7GX69uwQb3VfT0fdSRpm5rFsB9NRZwMc4xPijKvxCepx1r2pXJ0rZX+lZ
         xCaOj45g84urKSmGvhBKAGoCKgzML6vJdFymHAGQ2rTEnjXubTUtmbb2xY1Ffr9aFL0b
         ziIhjQM0nF//5zVNUDLblNdocPdKEtNvrMnmrVSA+QbvcnO1tCjMk1lRhM/svaIaiqzY
         9K2HmYB90Dv2xp/y6YkUAwvP6v3a0DyH0rJ8WIiXYcCzGIxnfLjF4kphJALivMaq8X9+
         hC06/Z9CzA4jU+i/Ig0XvclPB7yUURhvSCbrncrf0cBRB8TRZwnl8qfocoe5q4GvWgZq
         zonA==
X-Gm-Message-State: AFq9FYJEWIhw/oC5hn7ksyQBs4Bj2+0NOFO+JWmsjG4juPE4Av70qbTN
	s7yxTpZ71Ats2QlPGBrXt/R8gR3PjmbpXmreUKQdHdQaeDg3uCLgRU5SIDlAy1mI1RwHz70pOqT
	tYLgRASxYSdF7Dm7TQh5bnYekm/O+X6OumAWcXej+vgN2Tiv9PDsYE6sdnmjqnHItPpHDRJgqOg
	==
X-Gm-Gg: AYBFou1f1KAsXKsSpdjfeYlOUZUZxSOmRq51beG+PQpwzLS++7e3qRcUYtFUk9YiBCJ
	pe8u1Xij3xCnAcaJFc+XqsMDZIZ4SD2zhuwDFTFtXpgQzl4NHKb+F5OAnA0zHLWox2YhD0wh4xA
	7aHTaOPPN0na2HrorJ+erl88fstByDHZBaENoYEEPSYAi3xqfgfpOGKqrJmyTT2hPi3d3egFRwF
	CrBRD8lbni/cKufBUBqIPTzG5UK6etcNZqY946a7oJ6KD3ma85NeRSGvuNjj8yoK2Qz4LX1naRf
	KY71v78qcdPae694vDVtNwdwyJbJ/tkLaELtgOMpCEacXHWMCZ2KSyuRdJvcAOXmVVg6jFreb/a
	K9LZOoBAMlotUxgd0qtPM4xFS9nFrAKvUY8AiLTm+1tgMbTuGd2JybMyB5a5kTeQpqK/UZD1o82
	sjgfxM
X-Received: by 2002:a05:6000:2407:b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48dbace40cfmr33733787f8f.44.1792057916413;
        Thu, 15 Oct 2026 02:51:56 -0700 (PDT)
X-Received: by 2002:a05:6000:2407:b0:487:1ddc:aaff with SMTP id ffacd0b85a97d-48dbace40cfmr33733768f8f.44.1792057916074;
        Thu, 15 Oct 2026 02:51:56 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.82.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc6b82sm18207703f8f.51.2026.10.15.02.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:51:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] More KVM fixes for Linux 7.3-rc8 or final
Date: Thu, 15 Oct 2026 11:51:54 +0200
Message-ID: <20261015095154.815793-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

The following changes since commit 4056b3c9d3c92ea45955641dbafeb9b960e146ef:

  Merge tag 'nios2_update_for_v7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux (2026-10-13 18:06:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/virt/kvm/kvm.git tags/for-linus

for you to fetch changes up to c8f4cfe1cf93bce924e27f2abead7a4c4a487505:

  KVM: nVMX: Reset MMU back to the root MMU if loading L2 state fails for !VM-Entry (2026-10-14 16:42:40 +0200)

----------------------------------------------------------------
Even more x86 fixes:

- Avoid a false positive panic in the #PF handler, if the kernel triggers
  a page fault within the asynchronous page fault handler before the flags
  are reset.  This can happen for example because of a perf NMI.

- Always reset a vCPU's MMU pointer back to the root MMU when loading
  nested guest state fails during RSM or KVM_SET_NESTED_STATE.  Otherwise,
  KVM tries to run a non-nested guest with a nested MMU, which can result
  in a NULL pointer dereference attempting to get the nested MMU's pgd
  (EPTP or nested CR3).

----------------------------------------------------------------
Amirmohammad Eftekhar (1):
      KVM: nVMX: Reset MMU back to the root MMU if loading L2 state fails for !VM-Entry

EJ Campbell (1):
      x86/kvm: Don't consume async #PF flags on a kernel #PF in NMI context

 arch/x86/kernel/kvm.c     | 32 +++++++++++++++++++++++++++++---
 arch/x86/kvm/vmx/nested.c |  4 +++-
 2 files changed, 32 insertions(+), 4 deletions(-)

