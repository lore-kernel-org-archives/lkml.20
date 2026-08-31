Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449E359A66
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141974; cv=none; b=EVY3OhAkPcHhDXwhi2j2riPW+RbouUG8QOw+In2Acpdue6k5gRSpWRr1sJo2POHVaIbwYL05T+qkvSzWeqNMZz3NbMrUN5XfaysgrI8gkbcmpiKs1WPKSU//fZJHLYe2J1tO5YIB1ZZxeoQSQOg/2tKYU3zPoxoiaGB6wEYojtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141974; c=relaxed/simple;
	bh=MQrMhcoX0T53A/BolDIrghwROp+RXFXDcVM837v9P+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sh253sUtEfLmWGUQ1+7j+qnCB4ubI7Ta9Tc84J9FPHUZm/3AVtn/NCXBMf7QOY6nVHwYHmmUpvI4xbY1+ha6Ex/EtfAq7fifyDII4xF/LWfZeIEgxMho2PAJ/GCvS/SL5OfvqBKv1sXlFzr5/xneTWKrVe/mVwYE4mIObWrmRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G12E6kPG; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G12E6kPG"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso3071981e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788141972; x=1788746772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BoQQIG4yLqzMLHAsbkE5MbCHxuyB8pPqP+IrTjJWJTE=;
        b=G12E6kPGI1Qj1XXa6/rv6gqgpPFuJfV+Ia+HLLXbIpCUn2rbVJKIHevVfomMZ3eSFf
         3cuXkAmLTb2o1RsnQnC1mdxcambnwQw1oAZihBKEZPhShlfMN9jTdkTrxuE3cV344Skd
         IbaUGpVuR7d9xYj2DuVXT9lZKBKgIkumwm3fTiKYhVfVMPMtzjaSN6vjznycO+h53o2V
         kXGHyXRat+HMrwb3/rYD3wMA1W4/htI+9XiVRCVwHj1A42arDIvUjrOHBtwMh6PMUeTa
         YByODvx8WW2PudQsE9LSGTYyEywIeQ+ySq8jfn7WcYoiS43Odni/PI/YEZ5+T6gV/Ijh
         YJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788141972; x=1788746772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BoQQIG4yLqzMLHAsbkE5MbCHxuyB8pPqP+IrTjJWJTE=;
        b=GguMggQBh3o7R/2Cbl0ewdfUQxBzCsXExzH9WtslC61VxHwF84e5RVrCEQO3y72sNj
         XczDO1D/WrjqzkO/p4CFm07f2UPDPreLt/J+LFHYGYHhIpvFFujdteR4SuVubiSaJTWi
         Pbz0K4LSkh2PS2WysP9YLZy0gBkfdHpjK5PlL+x5Uj5jaZ5F8pzUgmMEXkBsiG1ATAEr
         15zWJxg9cy20r1VsQc7INOGSQezwPPnfTHTxZM2LknNpeOgwdqUGlVtDcIvwlZWJR0bw
         Iq3IWDqT1gmlqQXoNK+hIVkHR004t4cm2UmVkPx2mv0/mfKC8MNaJFCZmJJQVAwRDGN/
         s4ag==
X-Forwarded-Encrypted: i=1; AHgh+RrmkSUl8l4BLpQKnuGmTlRKWX5z9cQexSh1cnnzKM4tq6TLWvWpY8swQwhrYLxjSqaw5a/F+97qHdB5XSU=@vger.kernel.org
X-Gm-Message-State: AFuF++nFsIWxAlMfMLb3y95PIBrnfvxJvcFmj4o+CHu6qMdM4GtIxSzd
	pwI+aozz7AXAn3AxqFnvpYSstUM0i1LRaQ8ayuBsGJ+DOhW86IbK0viq
X-Gm-Gg: AR+sD13FBGOd+O09CghZV+nCdhZT3K+JyDLUArMYMTDoFCfVCHhuJjJMQdiGL/SaOqn
	y3/Ow3/dQKSf704/PpEXULbmi2jeT+q6nvJ0e/46JxSinQ4BKJ2QSUzgDtKuMgNfoP4HyajShu8
	37a4LjiM3gEmCisc6xiRNRRCSnXHg8bU/Do8+cF0oLuA3ALbwwrHcB7uPeVIYCEQkWhn6QkRP7j
	cYRCt8O8JZDb3/hekRMzOOBV0lwL5fjt4jIWQ/FYtZGo7v9KrSk/GdzqtF4Kax+u1abJVCR6KMu
	mfm2B08CWqBU7VGyCXVIbpcaYCaOyzVVqcttGJKpzUO6DjEDrP/j7vvd2c5H6DjdrNYpaFhkDF+
	Ze/mHi1k89ar/JMRggKMhDbt8rJUDwMYcQLzGEiMWHu558q4SfxYWnrB6HzsCZBPbsw6vnVNTxG
	jZ9xGmQOh5ta3E3ZZZJ74/2xu396YEzPNmKu1CULvrbS03nX5XfcWy
X-Received: by 2002:a05:6102:809c:b0:785:8ad4:57f2 with SMTP id ada2fe7eead31-789da793e3emr1242175137.2.1788141967139;
        Sun, 30 Aug 2026 19:06:07 -0700 (PDT)
Received: from adriano ([190.215.95.120])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f532aafcsm5875214137.1.2026.08.30.19.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:06:06 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: remove dead chip code
Date: Sun, 30 Aug 2026 22:05:55 -0400
Message-ID: <20260831020557.1235504-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two patches remove code in the rtl8723bs driver that is never
compiled or never referenced, with no change in behavior.

The first patch removes declarations guarded by BEAMFORMING_SUPPORT,
which is defined to 0, so they never reach the compiler. Preprocessing
the driver confirms the symbols are absent from the preprocessed output.

The second patch removes enums and defines left over from other Realtek
chips that are not referenced anywhere in the driver.

Compile-tested on x86. Rebuilding drivers/staging/rtl8723bs/ and
comparing all 55 '.o' files against the pre-change build shows every
object file is byte-for-byte identical.

Adriano Cordova <adrianox@gmail.com>

Adriano Cordova (2):
  staging: rtl8723bs: remove dead beamforming code
  staging: rtl8723bs: remove unused chip-type enums and defines

 drivers/staging/rtl8723bs/hal/odm.h              |  9 ---------
 .../staging/rtl8723bs/hal/odm_DynamicTxPower.h   |  1 -
 drivers/staging/rtl8723bs/hal/odm_precomp.h      |  1 -
 drivers/staging/rtl8723bs/include/hal_phy.h      | 16 ----------------
 4 files changed, 27 deletions(-)

-- 
2.51.0

