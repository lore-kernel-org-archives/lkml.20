Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDC43C13EF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792020; cv=none; b=m4YyevuZYGKRYSMtELT0/WJCTQQ5AZbUabMzmF+rVaHO7RZQc/dp+OsfEz0vIPlXHHtVRsSfDApd23YMCytJ8Quoi/OVvPiuLaJLP0CDEj1tz3CYi+dntcBL1Nq1UaW+HFM0ZafEEff9NnKSu92n+z/Z8OluSZfElBLcVJRDt/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792020; c=relaxed/simple;
	bh=3riO5LF0LDQ75LkWbWV2i4SFadXEYv5vGvj8f2UtOgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BbpMy5HEZTkNG6kOI+Tjs5aWfsnUoPoxsIV8P8i+l+v+OEg16Hj2VAQ7QRO6GUN7xdm4xRYnPiyUtDz3qF9o4BPtd/8ZHW49XwmO6pxdlRNEG6525k2xQtQpqDj84upCIeQeTB139SdzerYb5RFE9zufKUZoPGGHp73+jHAeH+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqB14JF9; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqB14JF9"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so4453193a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788792017; x=1789396817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RuGYW3h9PJYNaiCjKHB/faSczvFn9W4fzqCSPNsruxY=;
        b=BqB14JF9/W2J7fnwtvAf0q2KWeZfVojpXybY8rR6XB9tKuf+jf34UQVVi3/H1SFdjk
         Rjqppb7y/tlBAcNLyAgBAGNI2w+YX3dlcR5L2PtXJk0t8EEQEp1n6HMt2gSFnsvIXaPq
         E4CjgHoWIek3PPxn0ksEZmbbR+RlRQOKU39dzxn9wZunhhHd0nqUqxamjrzvxFal4uZL
         6hAD1fpHeAzqyNUDA2enUDtK/VhmVtvqHAL9Ku3aMeuwELSilVzmpAYZa/Tu6nTs4q+3
         BxEaB6nSFaKJzJGG2jtUci1YNQeqMqjDpF7YnzS81cPa5lCbHJVjER6rSD0FOBhbSPGh
         jDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792017; x=1789396817;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RuGYW3h9PJYNaiCjKHB/faSczvFn9W4fzqCSPNsruxY=;
        b=UNpuPiDrVQFLigg5MDtxFCSCzNcYwr7Wl8wabht+PYsQWSqVsml0UVgJq8KXmSfIbi
         R5ZXG/eOyyp5Y4lJO2K538JDfm1ADj3lTXJTAVSQh/2SKL03optEkMIIS5YAnQ8ZN6V9
         tDoYMRevOAIOz+EvQJpePs9s6jA6ArYbPHUgsz7y1/5xaFqbbd5ObdirZUNioGmqcnzk
         aEACkTqU2AoA517wEmWv6TUN/DsvYHTR7UEmoO9pIqrqdS3hbVSJWg5ajgEL9/215RCi
         jrNQ1mOZhwtm5F5vpjcxGlAMG9FtlbAXmwMeTlaLYud2/gMP1O+MomuuDi9NCM+p1Njr
         wEnw==
X-Forwarded-Encrypted: i=1; AKwUvBxI6QK0z4GY0jimYretRJdImA9vqAuas32/MnoQhOf1U1nDKYxX9MsyBf/eCZBy4znovFUCjv03Exsg3uI=@vger.kernel.org
X-Gm-Message-State: AFuF++maQMX18af+EuEsQxq1L7Ii8q31i44QezuFYREu3gO92nlrH5YG
	69kf18vIgSBaelAGk3j+OT2UNVYu6uZHzFnVfvE+w9pApmUpZTHFq5oL
X-Gm-Gg: AYBFou0MWbj4+ZRufSjnRaVhVoJanfiaQC7XQk7R8kHUJCN9pjclKDOCL4/4EgaqhpU
	+yNh6qohlLtIp7OF7TcMaLstZ/UdReSnDm0zlaGZlItrTLISmNykWeNGBqjDoX6thszKg3axe/O
	UObQ73kWQmhm6aCTEiNu/De1MDgjbzHGyc55O+WXVr47WyPful66jx/sg53ml5gZFOt4quu1tmO
	/iYE8qKO+PY//2MfVrfb8O2qAjcNAtEHWCc8l46CMf7VxFiUWt5ivH2IVm5k1Rc7K3AvpfAODEh
	l+KmIeEPNDVBHb4hoXLh5qBJth3zY47oHZ9iZQWaLah0QmS3uYcDDTpRWqvG1FgM0toGXOXSvFQ
	VPgNW9LdwUl63JkOT1WqYP2t5y1d6K6rmAUkr/+UNDPDLOwVz+oSWbT61rQvuuMaSWnaTvD1Ujc
	LY/sCC9I5Q9IcoQppScgpyhMoIiGwcI5gcENaj4COaLvJJ0t4RvfqjEvOmvEnYxwB6zbc+pnU=
X-Received: by 2002:a05:6402:3706:b0:6a6:7818:b18 with SMTP id 4fb4d7f45d1cf-6a7e90a9981mr8187671a12.22.1788792016878;
        Mon, 07 Sep 2026 07:40:16 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20a41sm4438279a12.31.2026.09.07.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:40:16 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	lvc-project@linuxtesting.org,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.10/5.15/6.1 0/2] selinux: reject an unclaimed class value in security_get_classes()
Date: Mon,  7 Sep 2026 17:39:53 +0300
Message-ID: <20260907144009.162239-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport fix for CVE-2026-80912.

Bryam Vargas (1):
  selinux: reject an unclaimed class value in security_get_classes()

Christian Göttsche (1):
  selinux: avoid implicit conversions in services code

 security/selinux/include/security.h |  4 +--
 security/selinux/selinuxfs.c        |  7 +++--
 security/selinux/ss/services.c      | 45 +++++++++++++++++++----------
 3 files changed, 36 insertions(+), 20 deletions(-)

-- 
2.43.0

