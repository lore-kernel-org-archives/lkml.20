Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A262043E083
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 07:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788592875; cv=none; b=lVRqcaTPqT8BIJWHKM9KPQN+p7WLqg7RIefI8CNMC1mpuwOZ0n4/W6H5Hd+a/QQfFq4IyJ8D+1vXBL2odQsF75KAMecacocYvcSEYFUzsa4lTm+/juY54CyTWa4Wvd+yKeWX3oajgchahdsokuWOMh99ELDs6rPRP6zKlD/XUuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788592875; c=relaxed/simple;
	bh=6ihfkR1QVUMxRUSxBsOWDmpMOFfSiBu48b2nNUha6SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSBLSGfz3c92cfCFeH7b9jpF+l49pCos1mlSd1E8G1AtBnewEoJcraVt6iV7IyQkzlvgMztCQUhcYASsLMW20Iei6sm7vnGp422Jp9co+pJxRdVIeK8rsjfWq2XBY/O2amM5z08tEBIAjJiryfwqv/q/xD4gsgdtOCS8zfIHjOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDRWqXg9; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDRWqXg9"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c9995ca60so3003727d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788592871; x=1789197671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0xCKWxfgEzWbLm+HaC7h/66gSjU3jgg6ww5T0m1lirw=;
        b=eDRWqXg9p8KQSEDrS1JAbXUp9HnS+UkMtQ9ldLllqXK/mh46VeifOVDOFtmpgWlmK5
         ewfv5bXy/P/nMlH8VuK8UAfd5afX5/p/Hys9qTlvA0j/v8Tn4EBeHTkPySdDQkI3tK/u
         fL85jchw4UckBjdywTAui/Rbn2h0jSRhlS6mdMPS0ThVi6DS6hHN3mpwRupEimRu/eWI
         1izW2aamj4oQrus5iyiOumW3fQ2PsIr6FbhGJIeziJhMeA4JRfJy9pDxFVqxmobnKmkl
         8qW6ncKbJgGxaKRqcgJWzCfldnOPcpiYzDVsoOixELaUlRdpGMco/QcOTrnfV0bMPR7A
         bsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788592871; x=1789197671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xCKWxfgEzWbLm+HaC7h/66gSjU3jgg6ww5T0m1lirw=;
        b=TJNpX4QtOiFArNyqXEjjxpIMfoIYiRC8fNyVnWKglGMSBDHLqf2KBpl6EgNfueq15M
         WeUYQd6PUm1qvHLHtuhtPu8Z2wWQb2xSulW9eYPTsHZFdC7BsyYVA5QFgNvKWwrqvBSt
         bggn5MziW+ZIuXqyxJ25RiwvhnEyFoRdkoPzv3UfKnoXP9GqOVZeXdGrvV8c5nt6lq1W
         nBMlQmUL/U9pArCw68KoUi0/wNFTZMob2oDb3BvsQjTrNjvVc1Btegv4Ah7QI54FIrUr
         w822OcFMQ0n0guK3RYPLWiO3mCrGC4dM+eUOx13+ikqiqb+tLL6n/Rwh8Jd2vZ/UyaJs
         MzCg==
X-Gm-Message-State: AFuF++kyyl/P7Ynuk8XRcaK5H9SCAKqceN21OMteETTlC8vqq78B2DE8
	5FJCB+XqKc8OvtEQinxgWwtUvybNv3fHv9REeLD6K7vF+5+ocCG/MQhTYM45zodCnmE=
X-Gm-Gg: AYBFou3Wy2AcgAGEAm2+vA9be9MJkl2nSFAIdKIYn9+vYV/Si8hrM07Dck21+YVzkSW
	MaII+c+5knjjSQgHuB9OMucwEMCTTlSJ38pe9G962Q2onjBghpwbtDZ3luhzDXRGy/qNc6JaFeK
	y9l6Y3yMVKOIYD/d1dP2NFH5ZMQuz95I0+J4fqTnTAiJFA4Yc7UdygXK3lZ4iqmEXgeN3NFErVf
	fKhaPADHuWoOCNdyhv+rIFDODvCQA/PzjKKV9oowz/WBKFHrFsX6CAYaXor5d6HaLSqTq7RSYYc
	62eMkkoMhP1KHYaxkmIhwKyrHfTry5B5/kvcxz/FRY1pMCZ4PpeSGW2MuBTQtvSsYWt+Tu+AkBN
	6iZm8Q1EYSRDYlfraPqf5LqKo88FUu4KNtYdAdlRmd/P9ifOhsCI9ygW9w4TOsLwFm8CGcM26dN
	d03It0PW8yNaaI7ebf6PVteetjw4dGU9S++PdmYHfoyvJGWpaDYw3jTGAGYYoNUqIoqahcqzWgL
	vXJedFXyms4VK1gBIMOA65rbPs6R3jMR0hoe/Lpw/x4Cg==
X-Received: by 2002:a05:690e:1596:10b0:66e:5bd7:7dec with SMTP id 956f58d0204a3-66fae6679a5mr4094586d50.3.1788592871023;
        Sat, 05 Sep 2026 00:21:11 -0700 (PDT)
Received: from MIRSEO.tail0c440a.ts.net ([115.137.91.250])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714b720e57sm34453117b3.40.2026.09.05.00.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 00:21:10 -0700 (PDT)
From: JunHyeok Seo <starlights2283@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	JunHyeok Seo <starlights2283@gmail.com>
Subject: [PATCH] staging: rtl8723bs: align AES function parameters with open parenthesis
Date: Sat,  5 Sep 2026 16:20:33 +0900
Message-ID: <20260905072033.54813-1-starlights2283@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the continuation lines of the aes_cipher()
parameter lists with their opening parenthesis,
and replace the stray tab between the uint type
and the hdrlen argument with a single space.

This addresses the "Alignment should match open parenthesis" check
reported by checkpatch.pl --strict.

No functional change.

Signed-off-by: JunHyeok Seo <starlights2283@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2217cffac5f2..3de102a27517 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -765,8 +765,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
 
-static signed int aes_cipher(u8 *key, uint	hdrlen,
-			u8 *pframe, uint plen)
+static signed int aes_cipher(u8 *key, uint hdrlen,
+			     u8 *pframe, uint plen)
 {
 	uint	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
-- 
2.43.0

