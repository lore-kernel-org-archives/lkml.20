Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793512854;
	b=ytWEMKCdulkWaixUroqDRBtQks8u1EFBL03dpgS8nKa1RLIuR9d4v8rmEfOGkM7GPuhf
	 EMjuH+DOD0S9QS9rGrdLvIiTr8bAOArap86soK+VeMo/IXrq/kMXyvNBrc1BikU/+cQ45
	 rTwEMWjVHghICx21uEruTkCHEJMt8KEwganAZYUUhQKQDKeDxnW4PSPiexkfDzareF7zd
	 ndesfyivG86Znpkxh6p/wUyhSr2fcNYcj4GdSHgauzzf6t6GA7mrEZaZVUxbzTgq2xNh8
	 CC7cV2Z06jbnYP3u3DRCwQoH97LPyNGRMAkD6pm29BdjAFVFthFRLkLKRxzCRX/Qw0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793512854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=traUlZDriv7/XAv22io34n1BJf45r6o9C8uTIn9jXOA=;
	b=KaFTHgMg08tdV3RXtUPg1LhRrNg6Mh4kOrE4wngPzBdoy0z/A1U6pAruHVrfECtieZkD
	 W8AQAzxJnF7wnjSX5PEsXruY7qRjO4uGBIzWXbKJPhZKeI22crGQ5sQywh3095s1vQrHm
	 W0N93PeSvR3RwDcy8/CdGiDwkybmHaQX0pFXm1A66i6b/DaXZBnM3wQT7cHSzCLGjnVn7
	 utyz4rIzxvw2ijAadVSKg9V7yKDAfISYMdsKusutKVHVkntr+mpvDgxFzFpnc1Mc+1Xd/
	 GPNzoP9++NhYkhLNuuGS8QDXS3gbG39OxhUer7EMypIt/cIxD4QHxJvCS0/mCgghHGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTDeTo2a;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE7B606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE7B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jTDeTo2a
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a9f9473029so1388011b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793512853; x=1794117653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=traUlZDriv7/XAv22io34n1BJf45r6o9C8uTIn9jXOA=;
        b=jTDeTo2al2snGPu+wZQ0QmyKxnsxmABQ+0dAR6IzciZGy2130nmXdH+Izp9pPPv0eu
         QpG7egulChny5OoPzO3dQopXrjcQ8Qzw+UXIluhEx/Lw6uR844EyslO5GYhFAd7FJlGY
         zVB8lTGNkqfEKqIw2tKIDR1cvI9yeeg6bh9L49st9d1aI43V6OTJAd5oVVwgW2z0T9Rb
         +3/31egsGu0Bupj1Xx2ub8+EFdSrQPinx9g4Y+k9u3g/eDDyJ4QzRAGZt/z8Pt6jCIH+
         ipXk99ZglpyFsXLD1ihEPBG5RoaLWKIMmi6MgjQacjRHpYWnSXLL7KRbAy8/JVXEJ/ra
         TgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793512853; x=1794117653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=traUlZDriv7/XAv22io34n1BJf45r6o9C8uTIn9jXOA=;
        b=Aq5jtB9RHzlUuSS8++mSh69GVvASud+KiKiwl8GzkjwWoKSF6FF9dQNmqt5td62lzw
         M77nzkVG1sEf1dLNw3pdqF5M84JuMiAgrWV+qKz4udOs7WnXKh2bcpaMTj9q4mVoNYJ/
         h2jaiGlnvD49zVvXW0/YCZmVs3olrKeEnCAy68ZYi9o2CvlbHtjNUaHu2i+fllAzGR3c
         lG4kTQdrWT0oor9AaeBS6WGuJpPZ6qefw2M/v3q5Q6FY/mrgMo5jBwgVtuBEFyL47+CJ
         vQXpsYdMRFkHcSuBDwaQWOSPDk9cotjVxlTHTk3W/gt/pzW/SJO7sDXZw38hkDgvsNSe
         NILQ==
X-Forwarded-Encrypted: i=1; AKwUvBza5Jf+GED9gSvWTUZsLgQhNaZLm55B25tjq47/ZXDpinx0NR4ohdZ55yDG47bBM4wkvK3DPzGZ8Gfu3AU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqTeavlfEZiQP2VZAKgeyqAoJBALdvZ+X21VOWXBoWXp0Ty2Xk
	cgJsuqM9wsr69mLjwwN7LZoUpuAuVJnXbKM4VA6r78R1PD4KPfBdDpHC
X-Gm-Gg: AYBFou0ss3WEPB0UEYPGV9ZLAzV+Hhbk1ztK/J6AETk797R7lJSgG+2+Cm5NpIPRPu1
	YIxjZZkv1vwxo0S7uCkW7eZQQPAb07ppfzIxckmlLhxHX3xVEI9lLSz1GpR6cxKXvbuzInBSGh3
	l5PMImr/WK/KTKXJTG4qTXCvCI3X3R+wvxtI0w7buFBq3Qyjx0SeS3zOVVtfsssJ0anmHN2zGmW
	ngejLzMOkU/6Q1SLHBzvMf/qjahzu11pyV85nzBpl0nSrqNR6F0tkBZeUjAmipO9phdaxJP5rQ9
	+y56LnOnbL0ft46fid12apB1QAXCcCz05lfESrGAPwREgAjMsRGsHSgupb1sWl6qIBEcTxPrkD5
	WEIrXm7JbtIIcQrRdVH7geKpy6SAwjtBIAJVF6Nc06DZlRv4fVoWfzCH88CxiCPlNECsugcjALD
	EiU9I8hqLvwo+/7twxclMiALun5frn9jM7LvcBlGLEFUffeWOs6Ld3s7utrsVCtILuTCSdrAue9
	H59+G/PfZMe01uSSi+C2ZrfqO3ySaVdhsSAEJ+8PmqQntecAf+M+axcac0G5g2IJpunR7fxKS0T
	qyOV+vxpN0Q0eeUhd0fKD5BzjP79KJqt4PzwfX/f65TVKKJ4NdSEEHBblBPx0GaaAhbRU4otBcS
	LSr3mtmhZpup+fYp0S2+ko7CPHJkRV+K1eCAEjpGVL7H9I8GhF8u16lJ2KnaQqxTUD+Bh/uYuPb
	g7HERz2SW22Q==
X-Received: by 2002:a05:6a00:3a13:b0:886:ac28:3bd0 with SMTP id d2e1a72fcca58-8a9bed5c4dfmr5042593b3a.40.1793512852697;
        Sat, 31 Oct 2026 23:00:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:600:9201:5fb0:4dc4:c510:e576:213e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d067cesm1062706b3a.29.2026.10.31.23.00.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 23:00:52 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v1 0/2] fs: fix and deduplicate whence handling in default_llseek()
Date: Sat, 31 Oct 2026 23:00:47 -0700
Message-ID: <20261101060049.81441-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.50.1
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

This series fixes negative offset validation for SEEK_DATA and SEEK_HOLE
in default_llseek() and deduplicates its whence handling with
must_set_pos().

Patch 1 updates default_llseek() to read the inode size once via
i_size_read(inode) and compare (unsigned long long)offset >= eof for
SEEK_DATA and SEEK_HOLE so negative offsets fail with -ENXIO instead of
bypassing the range check.

Patch 2 replaces the open-coded switch (whence) block in
default_llseek() with a call to must_set_pos().

Siddharth Chintamaneni (2):
  fs: reject negative offsets for SEEK_DATA and SEEK_HOLE in
    default_llseek()
  fs: use must_set_pos() in default_llseek()

 fs/read_write.c | 48 ++++++++++++++----------------------------------
 1 file changed, 14 insertions(+), 34 deletions(-)


base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
-- 
2.50.1 (Apple Git-155)

