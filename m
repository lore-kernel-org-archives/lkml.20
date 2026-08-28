Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2630A3C9885
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895424; cv=pass; b=EuwrypCNZ4D9FNqu6BMnUybSJDeLJNTi0w9+2Qjgk9y6puzxOKAwaruUurUJQL5+E5Yt6X67KRe29s5lTgCDmVKcMTMoS8aMUYJOaM3K0NNgfqJDL2wovBIxfg0M9a7/OE23cryJyyk+yFpP2MxW1FWbwOLYRpwd8OGzFP6GAnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895424; c=relaxed/simple;
	bh=F6974V1qqhjB184vkuvnv1K9HbL/klGkmFP33fR4nEY=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=qQL6RVNkdPyOIfuhbqBhdxIVlhof/bcF/B4BhaU0XXepKJWqtEk60nzxGjvLItpvV81KtZCxL6ikL/wVT2scI3olKKXnu2Qg4g1zLqnoqkizsSBF111GuQTd3w0S43YyZwlWVZZNsWM7Vdl7Bt1gd8dl2EPHGMVF8icZmY2kOic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=WgtuHzTz; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="WgtuHzTz"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so506433a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787895422; cv=none;
        d=google.com; s=arc-20260327;
        b=SpoR23hn+iE2YaBNOUR5TAOJwQkQuEAfxLCzKSiKAUC2CqHVPl7dbmC6Wt/X3ymYTc
         XhyIy1pQ3LUcUhxHdt15OeAp75lNpqZgyrAGFry7DHcNdrCv450o0HaN0myNiXk1EFGp
         wxx6XhHKpsDXjRmb6kfo8ryC0DufsjRv4bT04469qKkQ5/Ngfi7Xhsd5os6mIyLhslzz
         shBPE9AnG3dZJRKortZp2WVqDiKgFbMf2zwR8OAq2tv4586Vul6u0LQW+/k0olztpUaw
         hAd5MJ+FWDai/xEAbjHaPRHSCyWwlaC59grm4tVfeYGSwHuLzlzYj1jU+1XCEh7s90A7
         8ywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=TsyfVz00LthLpZZO0h8zMHmczrHd5U+2H2ML5+krMkI=;
        fh=AToAh2HEnxosXM4YTotMP3EWt4oRQN1LtXoCfOlD7A4=;
        b=JTs00mnsg/HKg2BBDvJGivK3E5xm/MrkX30oDE9DkEMYs+9YycXzAlMHEaTtcP6fp4
         7v+7PpuKgMELqy6iJwZJKt3ZruDGFdhK+2M+tob7gj3GHjrL+8NxXt4ksV+PRqHdTPgV
         nVHFyjQTVkbhueZsgHUFDGY9W2iG0bdBqwyOueSlttuvl1gnPTUlQoAzmeaL+rI79Jec
         YryIE3A6StQg4RPK9KsOUSRiQKmLoFV8M2mVnFuip3KtRY2harej7XA7l2VUeHhCRvTZ
         csCNpZuC58xBMIMYJ3uoT3OFTc7iAiKikhEunZlC/+kJghTrSrDRtbsgsAMWoDHRtRXn
         wEjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787895422; x=1788500222; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TsyfVz00LthLpZZO0h8zMHmczrHd5U+2H2ML5+krMkI=;
        b=WgtuHzTzS01WzF8n9AEPgxMAcR/f1I6FKEskF+BK1+h7GRHaFpGpaMJ4FL4aRTC9VG
         LN+l0sJuKoaqwal1X0tRrFyl0K2v+qaNmRu7l9lAK4ZHp403lvINCe0KDNyoTcOBkWa2
         bH/jj0EhB+2npXME3BC80FmgPJpnM6lRHAV2UB/wVXRsmnzf6sngvTXR+J9glXxZAqwy
         xq02MRDrJ+iWiVxDJPKmVIz5e/faPonKlEp+ksgMMzx4SEJ5B8+4S0ACKGjot5mRV2nJ
         M5VbJqHo51Gt1vXY20MIQwPYoAETaBEl33F/hKLJI4DUwVRT+N8TcZrzaSIax1AdSRsc
         HAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895422; x=1788500222;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TsyfVz00LthLpZZO0h8zMHmczrHd5U+2H2ML5+krMkI=;
        b=OOCVPparmaqOEbYG07JvyH7hEzKi22B/xxMBEgCgRnCV3R0+g9xUGgGOpqAaL0mFOE
         oIMDPwGfZSIn2D9gY6pNZmoBL3pcHAOFkUQ1rp7KHktkwDbtOEcHv8UrIz4GgFu8MeR0
         37rPHQmq/dvEumE1GgnIl4C4CYIneIwJt2UWiVe+6W7Y1rTGCs2h1MxtoUO7KnjxL2UK
         qK5ZeJ8TGgNchwwOPRAjr2DbfCFO9SdE+4Z0NOQ330NUYDXOa4efM/AGZxvJDbMmHmnh
         JsGJp1Do2EPXdcNkkuF/oCmPCrfzgeYTrk780PREAwBDNqT56QQwKrTdst6FHB/xkAqH
         LfGw==
X-Forwarded-Encrypted: i=1; AHgh+RortDZtO1+QJ8RlsOsiLCzvtQMtGqwDYb2T6Jf5nYx8gLwO/X/MtPaWhSxm7Ff3BCYdU0wwZjG65EzCEEk=@vger.kernel.org
X-Gm-Message-State: AFuF++lrGph5g1HNkt3t2HTHKsT5+2LTAomGzyZVL9HPhV4XUHTEowbl
	/74YQqe0ikDrCoaTGUa6bEdSpaoSS3y7JCT37KtXiqBZgGBec742Xi3tMEz4vLcmEuEpy5Kho0v
	dFwywWeHCIGp9mSqw5TiahZdyVJjTjSFd4QtLi8g6
X-Gm-Gg: AR+sD13eIbybNlO3hwSlk7d8uSZHPFzgD6sKUS+dfyRsMv92IZs3JTZAzqH3uY003lq
	22QUErhtDG+TqPSHD7HQHCjzla2sijnuY3bOam6MASvUCM3XzzMRhVr3zaQnQBhEizqsiLNxU7r
	pE1dMEe+0e9uQScLEgnNnkkkJl6XuNfeCPSfJ8PFiLU2xYE/eYzLhJJiR3UnGmvYmmZK5YOklNe
	T+mEHMv9M6PKMv0nAzfVpITLde72a7VD3uf1RFvQMVcV0jE+Ab/7veRGZtyhWEb2BxdLa92SXi5
	Msl3RP/ajSURwoHFWaoRuOtZKxT8JWledo8ADQ8P1u6rt0jw9sg/YieZ23CXg2ePiamdHDGukn+
	Lm2or8dTrS4NfG0y15JXCT2IUAahuEySt
X-Received: by 2002:a17:90b:440d:b0:38f:bbc:6a0f with SMTP id
 98e67ed59e1d1-396d0e5f35fmr7652756a91.1.1787895421337; Thu, 27 Aug 2026
 22:37:01 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:00 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:37:00 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:37:00 -0700
X-Gm-Features: AcwNN1X-Dm9Pq93nwXthj_Gk_cu7GiCRwHHlNBoEo4XihKqW7_PeohxdvRfPLms
Message-ID: <CA+0ovCjBrrU0H0Z-fqBZ_mat4toQM_z2=+NC-9ONSXn=bD8mmg@mail.gmail.com>
Subject: [BUG] tpm_tis_plat_probe -- maps a borrowed MEM resource by its own
 size, then reads at a FIXED 0xF00 offset
To: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>
Cc: falemi@asu.edu, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/154-tpm_tis-borrowed-resource-fixed-offset-read/

  BUG: unable to handle page fault for address: ffffc90000a17310
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  Oops: Oops: 0000 [#1] SMP KASAN NOPTI
  RIP: 0010:ioread32+0x1c/0x80
  Call Trace:
   ioread32+0x1c/0x80
   tpm_tcg_read_bytes+0xec/0x270
   tpm_tis_core_init+0x48c/0x1830
   tpm_tis_init+0x420/0x540
   tpm_tis_plat_probe+0x118/0x1a0
   platform_probe+0xf9/0x190
   really_probe+0x267/0xaf0
   device_driver_attach+0xe0/0x1d0
   bind_store+0x1d0/0x220
   kernfs_fop_write_iter+0x3af/0x540
   ksys_write+0x150/0x270
  Kernel panic - not syncing: Fatal exception

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
