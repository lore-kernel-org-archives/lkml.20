Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446F73DA7DF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818615; cv=none; b=LNNBEBxWVcdwYTY3cOPOtICiz784bM7aHTUJ/seex3xn9d+SYXe5aiXw+N2nic96zH6o4t0OolORw3SC5UOyd/AnWevD2wz7LtFozLaOrADY7kM3OtecVAjg9v76ypvzPxcAA7cUlQNUAbRvm9jX/q7MsC2fslFpd5YgcXFCzpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818615; c=relaxed/simple;
	bh=Wa7EMNtS/SBStCyHa0wWvJVG0R2Xdy1a2EIB8SPizDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHlao7ijB5VczoInZiaXwvhvNLpviePUWaHh4c51TGPEiKxPtvF4grOT2ataSeo7bSRZmRDrikSv0SKcmZ8HMS73CCymf5Ou61OG7O0Ac9+X6ItU6+B50M6at9cE3X7j8HyeEGkEGR2KUC7PJl812gBro0EY2RMejtoCJ7ds798=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKooWkvH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKooWkvH"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so1972309a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787818612; x=1788423412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvUOAOKXuBQHrhv/+0psbsiL2fO8oAFnkMuF5lJmkVc=;
        b=mKooWkvHIue0C1aY3KZJijANtpHuFWEfvOY1RPCxRb5myPsWV/cBHu/FnN+jqJU4Nt
         N8ETBSCZKUtNs2lDpiKU/lUZUnrphkST1iAXfMo7sAH1gGc+KkYbTnSQ3hxN9r+hajRM
         3J6dQ+Ut3EbK55WsyyOFWwkS0NrK4A6W6T6s4/keSmpjcQOUtNDK2oz1dvF4LnCxtcWf
         tCNDo1+JsqFgQarJPNXu/0pvJ7JY+Gkdw/KIP/wSyfdKFz6pCi1X/TFTV1ZQhz3ZvlOl
         h6ksG5tCLPVVT0NnLCdSMGF0n9/+O2CnqaKg/8Dm6a8eI/ygZa8t2iM32TRak7wN5puW
         uLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818612; x=1788423412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvUOAOKXuBQHrhv/+0psbsiL2fO8oAFnkMuF5lJmkVc=;
        b=gvWEvzuN5hdFdESZRljqMpw8HobVQ9oJfkIDhu9DjAPJaWcSLOJrBinwoYSYMukmhb
         roasmZMNbNyRIPO3uw9f8J77xCP2Tx/DF9SRGOpkPBRHblQoUcvuab05AbvqMMmyK+QD
         4v7GJ1ZgnQ2OrDA0QazArU39MASy5CBzrQUxFJWq9R8YVsWPT7LIiPoSj8byLPG2mXQe
         rY/ULs6mHxb4lu4J3T/0w/h5GiQM18/9y2++DBMSBuH4jiBwfjd6RHTeylqKuuUEkZ9i
         jSLqCtLm1jU3/X1bl/4GY+zgpBwtjP2ls+3wb+onVkqQyNxCLML3dMncRKK76GPJ68ag
         VItg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/HVlJfEsB/VWiFTwjFAq7J/DYZV5n5exxJ1qS+5NlgywBHK7uyR41RbOUmmo8/Nzxz1DyCYDdnxltbPU=@vger.kernel.org
X-Gm-Message-State: AFuF++kEbf3AxxKSkdauDgjrh/VxDVQY8gB0ELA9+yvcaN4n4+rFfi7j
	gaF1f8S/HpGJozFPc79LU/nP+7yoDEnFZ0uBohelGM4RSFVJmcqdk6i1
X-Gm-Gg: AR+sD12JCEunFCnmejv9YJFvOmRDuQlmZUxsUbQ8nv/uJZGPHw4eNBEKOOTY2b9khSX
	4pK/3oAFYK46R9zZrAXnt5WhE9aLKwTOeiaVNVcER4vbHacR+WIPf2SmHBGe5QkUCyHzYMIjgnU
	tQyA0kuD9pOS1B1bqYQg/X/uTjXY0pnzZJH8xjVomeTJKNBXwDnFVfAvHHkX7EZptXGHNw3OWwc
	PEELRVS3PeVs0DZolPZD7Zzb6pothFiaTmWb4suUSUqjMH/8tFGmCLAjWz0/fGqt5BmpJ1VrG3E
	ucLIhM0XK0CL3H3XiQdKR8cBWzyJv0gC9rYhd2XTqoU2/UhI0AnZOyGnfQWsZdnKb4FW0kWRdxA
	p2ly1X9jNgMkEXeV1yFDIp1uQrnh7Q6XX7OJ8IJPQENlK35FvsF60k4gZJX5ZKXZarSYDu/SZYR
	BU2QYDHWZH256XgeeVdlP/sXlUXCJj2e0Fnk0S+//k804N+aLaXKPIZVwOBEbhgOIs+sMyx3GrT
	Cek
X-Received: by 2002:a17:90b:4a50:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-3966d48c3e9mr24352683a91.14.1787818612187;
        Thu, 27 Aug 2026 01:16:52 -0700 (PDT)
Received: from Default ([2409:40f4:1015:7531:12c9:ad3b:96d3:4379])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm26865924c88.3.2026.08.27.01.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:16:51 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: KASAN: slab-use-after-free Read in roccat_open
Date: Thu, 27 Aug 2026 13:46:39 +0530
Message-ID: <20260827081639.17185-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
References: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 903c1cf6dff9

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 4f15eb951039..505844890ed3 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -236,6 +236,7 @@ static int roccat_release(struct inode *inode, struct file *file)
                        hid_hw_close(device->hid);
                } else {
                        roccat_free_device(device);
+                       devices[minor] = NULL;
                }
        }
 
