Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586553;
	b=RCAJwTOSWl22V8TAiV4rvMlZLWYlfYCEMPSmnCkFWBCo/IABKW3p0nsHbGbqeXNeE/6E
	 bS8sQvQg+J9vmrg+FDuIf4a1dY0LDPo4t9RmlWWh94Lpz5bz0AYysrQPIR33+d1Mcli0r
	 kMhuHvyr9F9eRvKvmnERdnpgs43NL6vul144cpy5TVrdYZ9RYmknn9NnfSf/QJvCMSBiq
	 Jra5V8oDKR+VhNXpojc/wzHfi81MBXz6Lo6nO/pUMofOJIAXavrgqLVt8/TiYDZcM4f5c
	 TdJbvHHK6Zoi+/e62nCCMKmr0uOqvJhmzhK9s2niGYqF+bqASDHt4Sp5DWD3mSBql9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1R/pvYOnxMShbEJj2t9cWr3dLJwjl+MKLrzd1FqSlyY=;
	b=OLy/5ClPbv0oM6LBKM2nv235/RC3wwplaJaZPJ7p1VK2de+fdhtDDFFA/MR+7rcxGeIA
	 emEL02kney1acAfeMEYO+05vvFXmd58P7YybSSHIuMfGVSZjKWbeHEJqw0pY3cPGc+EmT
	 VOFX16He8qURVzk8Ew1V7uL7Z/vGpOZTRmPhYnoN9TpbcGCeUJeKXJnJuCZDnj6vR6m/K
	 NeX8C+s7Bh3Rmas04oTR49cBUwKJ7fKWGcfQ6+LaUDryyhSJBo2dPpRVE0IefVCfLUIEj
	 vNfQKpTAm6jzZ09ChlCtKRm2KIYwMW8M5o01jH0zk/PFjYideNOQgjX3VRZfXk5KQZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4eyNgir;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69757606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69757606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P4eyNgir
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3176274a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793586552; x=1794191352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1R/pvYOnxMShbEJj2t9cWr3dLJwjl+MKLrzd1FqSlyY=;
        b=P4eyNgirbyRAyHN0EepilixE5a+ndmRPLwKpgOM1Gl2WChPcrG//MAVC1QELlTWsMB
         /4vc/mkNakzHPF5nrky236YQc5CphNoAsQp09pWJAmazqCy4QUi4HaVglZVoXn+uBTjU
         B27JPtxu5ej802Y+2lRX1EaFksdDz3E6Jx6ZurOxyYBoSCwjRbIf9XagQ+grJtotxoxP
         wa2z3oa7qXRgiyKU0+8NF0azj9KkxIAKKcy5i0Oyp53sG0wyuHVFJtEH6X+X2YSkBjl+
         8o07izbaeRZM04yVJXVOqRv7L2qv+OjGZ200cmIy1zceKriYvWTcPG2VD57uFcJMofPi
         BDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586552; x=1794191352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1R/pvYOnxMShbEJj2t9cWr3dLJwjl+MKLrzd1FqSlyY=;
        b=TaiRxY70HpllJJ8vchjXKuxzDGYufPS/OEu5vy+fxAqE1+5tbNp9Y5acB7aHIG2TZ7
         Z3YCTsrGWl5OkLgolSpDuu6VVQ7JfVVRiEYnm+VfY0sQkh1kShy+zEgC9HowZRc7qufb
         mtvqbpQp105S6R872IyiPPo4/ktw4U9vWWNOegy+mEO6gK/oNhJAVIDMPAT+FTi0hcHL
         avsfhV+SUAPKuHGPSlPAqlhC1wbgNy77pVilU3YxitwutT7V/2ouKMLRYAOlVxfbmAeK
         weCd8eTrgpNoEDxO2vwthfjct39i9NWo0Nc4cqxOETvGEiWzAxONXTZ7Bb3wZDpIRGUS
         tUMw==
X-Forwarded-Encrypted: i=1; AKwUvBwivd9dD7jXIKtL6ciluXBe60GQ/CZL2qrGz/N8D1nRMtxVnsHxfyzBnJrCMWgPFZDwQUYzk1YJIZOyNWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s46biKZBT188Dfx2r6KMgk64x6uB3h9JiOPLACKnhT2+g2HdP
	Y4HcS/3jK2lbHK6FvQQIJJ/air25bda6npPcKJGwnR1wLfJHMkZvIudO
X-Gm-Gg: AYBFou0eCY8Q4iiSzVLt63n2MvkfTM3onfCtp3FDHnDIPabjuE1In0iCj5C69sU3v6Z
	mNCKG9pJhY5KHV/cUzl7qg9CP85tS2Ejxl7ksHas0P+FqZncPq3Q/td0b+9dCaYY7dlp6ipEUfn
	u7F5R3U20ILRCDdZvYP2Ghd9gjAWWtLEvJrR9En+BRb4GO6d+rB8KEdDUb4R7ohGadZte6AOccC
	f2t2LcWZRQ7hBeie4IDnKlmQ7eCQXX++rEu4gTNThT+83Kh8ROcwIYraWMi+F29KIOg67pn49WL
	XXqcBGDAfKVbMAmeUAieHBlkYSxJ1JUGI9wNVmBiqv1rZ2mOq6m08Se+k758SMhULC6ALLyiVze
	VI+C7MB9VdHMoBbMGv3SqeYmovpLNtKccezSUh0j7lNlhh4D1v038U7ZDKUNwZ8ZZARwVBGJqYH
	F5gF/qaE9NxwCH2oQsVrvwQ9hp3ULm7gmznjrxm1jUwBEJa2lcigmLFpk1JkctDcvG2VeZ7qYp2
	JQysH9bowdlUyjTpwwESp2SI695C4mwlcUKOcFad0s5073oQqusnJZb7FrjyVSWyGqgwhCuRhIL
	NzSnUyNhs+Bm6gHTMheadXhou50i0Q26hPTe3/6ErnIEwHt1JyFEjqX9COvMT/WVzX2bZzD46xo
	2nHUXHxW83bgZfnNS68gmCJVCkUm0a0yciCgBRlYY8J4AnfHDvqWRj0vM45lIo4NYZSQ=
X-Received: by 2002:a05:6402:90c:b0:6aa:f0e:a15f with SMTP id 4fb4d7f45d1cf-6b4d534badfmr5935492a12.38.1793586551636;
        Sun, 01 Nov 2026 18:29:11 -0800 (PST)
Received: from maria-VMware-Virtual-Platform ([182.186.37.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca2112bsm2803078a12.32.2026.11.01.18.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:29:10 -0800 (PST)
From: Maria Sheikh <mariasheikh812@gmail.com>
To: outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org,
	parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Maria Sheikh <mariasheikh812@gmail.com>
Subject: [PATCH] staging: most: dim2: fix non-kernel-doc comment in errors.h
Date: Mon,  2 Nov 2026 07:28:33 +0500
Message-ID: <20261102022903.5312-1-mariasheikh812@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above enum dim_errors_t starts with "/**" but it is not in
kernel-doc format, which scripts/kernel-doc -none reports as a warning.
Use a regular comment instead.

Found using scripts/kernel-doc -none

Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
---
 drivers/staging/most/dim2/errors.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/dim2/errors.h b/drivers/staging/most/dim2/errors.h
index d707daaac3b6..af909560aa93 100644
--- a/drivers/staging/most/dim2/errors.h
+++ b/drivers/staging/most/dim2/errors.h
@@ -9,7 +9,7 @@
 #ifndef _MOST_DIM_ERRORS_H
 #define _MOST_DIM_ERRORS_H
 
-/**
+/*
  * MOST DIM errors.
  */
 enum dim_errors_t {
-- 
2.53.0

