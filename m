Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108749E15D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066742; cv=none; b=MZe5RtFS8sNzPSYuoceGfPJkEYM3d0V+b+ov7Seasg2gPA6Q8bIfYf28fx/UI6vLAEf+au1ossLmMgr/yEvZ7x9U5BPje6bAViOwKAJpljQlGbLcRP6XMLCx8v19mAjULNVbkPyod5Azv2HVlqd6BWv7WCHrGP/cb0NQQch2kA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066742; c=relaxed/simple;
	bh=i+svUFWgR0CVmdNaW9gvdHhxIb9SSNi2f2TTUhncJI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RzgTfj4ZYnhYnC3RivssgdaDpKGI8ESmnMfuVpQG6iN/YKb107HVeg+W+IdZWIxDh6ZzK1H/Za2H8k8sZI5yKMoAYke85QJ1yTnAloAVbPyC7TDXsp2vHsVrXQUVwSnmi9gzncRyughLDcUtF3A/3qhrT7rp+bIDXuHSAwApqEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hHeVXR1B; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hHeVXR1B"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso970165a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066740; x=1792671540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8UE0FnktA/0QB+N/hruvrQD7JLt1z1nNTBQq1wQCA4A=;
        b=ufIYGPTzco2dgRT9/LSu8iDddoL7Ok9Gfti94K3czBEn5cjC5goDTJm8aZSZRJUO2m
         8YpW2EP6V0g+lK0kyBx9vB2ZnT+xZ2dh8pCcjwLdnJqUkvubh+7wqqn/3U3X1FrmUiRj
         I1UngLwsFvHyXblYA6ZBDrNv5JdWkw9PKX6OqPgMWEpObR/1TC31pj8YEHPZKMdQZjTJ
         idQ2d3UmMswd8Gs/7yNGYsW4o2GyF5xJdV2K++5CyrdaFII3gaIr1ZyOIzpy1NZ9IDYL
         O1tSHUhNFtWk1XDUPdhFIzkQpK8qvqxoMaEta+wYMIkLT9R6r6doTd0wD6Zd4GC6ZjIi
         LsXw==
X-Forwarded-Encrypted: i=1; AKwUvBz77FX1c4iYyDgEymUokE8Vp/WRR/lmHUZJ00p0+31e1T3WStYmo9F75t4GBa3rd/c335643MLGucz4Sy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHjVPxKx0VmHlzcR/VomfUYcZNUC+udtHoc54/PrRwxj/GO1LK
	U3oGmx1eFLekJECI9oAV+T5gKY6lnWK7Em+Ay5Sb2w9eNcW55RfP2VoVKyOprPvYDChLPD3F1Le
	zh0l7x5+VZD7i2Xj8WHjM4yozLXqx6gp7Mz+dzuHBI6V/B5IijzaIqS8dqdeAWtB9MAZmY9puEW
	slggeWBNaD4/hsgiI0kkVF6VrXjrzsNtW9kXUcGc1FBJKtxgJTm3ERv0fIAGAPeAigpuPd6da8S
	C5Jwl0JGrXpUVAzrA==
X-Gm-Gg: AYBFou10TXriqd9Hk/Vlo8Fr5MxFEbzjTKsDe+e+t617p4lDKhDPlKyZ+ctCGyd3r0L
	oP0uppkCBQSYlU7oOI7QHy+zQ1V7MJYQrbp9xLSuadzZHQt6S1squ79IWWl1MdbBf4gGxiMX3Fm
	MB/qBOtyf9imdbdlJBd8ZYjbHhrpxdw7eNemWZQBKY8YjclkSfsQtLEGO4pTEn25QA5rwtFaWe3
	4GWx/UFOBEHdz3S6EPkh+G9Eip9ABFGebYLax2hUsnq64rS03237FIO6vTU9vUdVAbus2SW+eGl
	uQlBHrywACVRKeAk0zn4DauilZNW8MUZBfHTGlfZ5nR2989NmoEpJu/UskzwQ15Ie/XpmWz4pT/
	ZK8pa2jn2uDpuD8W38uOVjjtjejGsaomUsSn62Xt+8JcxT0KjX8lWCQOB5eq2fIbWP0qpjH+0Ko
	5Wp8kMsOd24A+RScngPy6TalppGEQmR8PiJETz
X-Received: by 2002:a17:90b:28c4:b0:3ab:188b:c5be with SMTP id 98e67ed59e1d1-3ab3acdc5e3mr15463237a91.45.1792066739429;
        Thu, 15 Oct 2026 05:18:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac937bc0bfsm682543a91.4.2026.10.15.05.18.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:18:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35a4d2e39acso2873689eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1792066737; x=1792671537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UE0FnktA/0QB+N/hruvrQD7JLt1z1nNTBQq1wQCA4A=;
        b=hHeVXR1BcoR0Cva4+0h9jFIJguZKVc8D95DjU6DHhGlhBLto+n34Jh/Wb1fhi8eJuK
         PIs3n74tpwXuKyVQB2TwQIFj88hv/s0snN4/PQRUQYgLKmwFciyLgpq2Xt6XwvLsn0iQ
         6nGn7U1SJW1pR7ajIOe6hbO873IkCVzXr2GkY=
X-Forwarded-Encrypted: i=1; AKwUvBxe9L2FiFj70BIwX3PluzaKwNZZVt2PBa7COGL0Umz68+nADz2Gm4VKCljfE/cwGv3YSlifOzKmxnc2WmM=@vger.kernel.org
X-Received: by 2002:a05:7301:1890:b0:351:13b4:9c59 with SMTP id 5a478bee46e88-3537dde3eb0mr27290912eec.2.1792066737338;
        Thu, 15 Oct 2026 05:18:57 -0700 (PDT)
X-Received: by 2002:a05:7301:1890:b0:351:13b4:9c59 with SMTP id 5a478bee46e88-3537dde3eb0mr27290863eec.2.1792066736616;
        Thu, 15 Oct 2026 05:18:56 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm64496032eec.26.2026.10.15.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:18:56 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net v2 0/2] bnge fixes
Date: Thu, 15 Oct 2026 17:48:45 +0530
Message-ID: <20261015121847.1933308-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,

This series fixes RSS indirection table and context sizing for large RX
ring counts. Patch 1 caps the hardware RSS context count and RX rings
to the RSS table size, preventing out-of-bounds writes and an oversized
memset(). Patch 2 fixes the indirection table sizing so rings above
the table size still receive default RSS traffic.

Thanks,
Vikas

v1->v2:
  - Fix Sashiko (Nipa) review comments.

Dharmender Garg (2):
  bnge: cap RSS contexts and RX rings to the RSS table size
  bnge: fix RSS table sizing for large RX ring counts

 drivers/net/ethernet/broadcom/bnge/bnge_netdev.c | 10 +++++-----
 drivers/net/ethernet/broadcom/bnge/bnge_resc.c   |  6 ++++--
 drivers/net/ethernet/broadcom/bnge/bnge_resc.h   | 11 +++++++++++
 3 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.52.0

