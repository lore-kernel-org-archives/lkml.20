Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F04BB810
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827340; cv=none; b=DKfPJ48WxSIreNYdMXOr7k2nPVhjstViqs+bnMer/VAL2aOWPKnqhXRamNVribepjMH9Y+vxevFxIFHy20gVBbAjI0CutHfa/C64hvag30ppfmiXTY4P4i9U2/0H9qpQd2gRZyxoIaXIoXXpC9qBWuVV53JmwdUB/ouG/PnLUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827340; c=relaxed/simple;
	bh=isW5vzcH7hZFWP7TK939GnVWli1ArbFnfpqVb6Mi43U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnt5C9vNnYpRsPR8Yez42Kzue+hjl3DRhm8PnxlXUZz74hPUFDcND7rwa0La8k3kbmMMqaRSI4VZx0F8cjiwIXFj6e/N2Be2u7V8xD5eJ2eLgqJaoHrWLELKgqdS3xcNKrN2V09qfeKeAbWoadlPhA7wVupnSO4vzS3PfISkZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iKhdHfBW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WFHQAJPg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iKhdHfBW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WFHQAJPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791827337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=62Jee7IyE5taDZZf4Cyq0DYOnCOUlmrnptCshY7ZnoI=;
	b=iKhdHfBWXpYMAPvfDqLc1ZEjWEmGkeeUw1ivyL7berCM5TxkfR1g60AYk9lU0ISKQKMNnF
	MtYuT1A13m9lbR5myzKis6bO1L8vkbauURzEx1wsL6Xgu7lz6ys/OwKa3NPnq/+vhpPG7p
	nb6dauVhdKORkk9amFlkBokmFyCxnn0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-vIvNcNFLPQiI-iN51MqCbA-1; Mon, 12 Oct 2026 17:48:50 +0000
X-MC-Unique: vIvNcNFLPQiI-iN51MqCbA-1
X-Mimecast-MFC-AGG-ID: vIvNcNFLPQiI-iN51MqCbA_1791827329
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-487038bc9b8so1734811f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791827329; x=1792432129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=62Jee7IyE5taDZZf4Cyq0DYOnCOUlmrnptCshY7ZnoI=;
        b=WFHQAJPgiZp1Jb5GBQxp8u4pl/utzA6frRdZ2SZEhd4ypdnamqEseFgVH+vA8zHLm4
         Cl+SX0j1qFvS09ZjCYzvZoQ0UcGziCkushlnisykN8YzmesBUjupmeFswu61Kzd4R7ae
         2BDBa6TXdfiCh8pQIGnuBTWjd4BkfQC7XxD92I8fZqUndNmvEu8O2BPNTYPVrS0aMnuu
         js/3zWVysSa9OTd8WmnqqX+uPuPh+wr5PvQFNiwQXpfT6B7E8fJz1i2W1M840DKFiJXF
         goXLWx7kWsfu0AVejQlSOkhK03jGxdYrs1av6Rj+jhEXb0ZjTv+OEzk7xRLbRhUioaFy
         hXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827329; x=1792432129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62Jee7IyE5taDZZf4Cyq0DYOnCOUlmrnptCshY7ZnoI=;
        b=2a3aQF9zEuCAAx/9Q8OiBjhyke4UGzaxGSviH1qw+Mb3P/oWb2P5U2yhALQfPsro4r
         dPATMAC/ZdGxlRCgYDW79307I0Y8inGIxXJ9fYrA3D2GidfVkX6pRKjS5QxW3BU+v93o
         GUUJ3ik3HtZfjOaYMmgCKAmWntqstFeZ4DkgtKh1wtQgCVGoB7OO+z1hd0zAbIWIvWPr
         WBsm0l089QWFe7VO7dH2lPvmU+H+5aMewWy1LUhsvAAf46FKA2LvqLWpNXCfMZUpybPt
         20rabUKPhEoGhiRZRvSl2s1ygHAfVPIzl0C5B5VM9tIraEqdS1S2QZntQ6GSNzXCJ854
         JPvQ==
X-Gm-Message-State: AFq9FYLvoeXKGEcDWIlyit9tbiRov3T2EpNoiK2OisZs2zh0qa4XeAfY
	VujLBBMzNCje4fRvqEphaL0P2QqhLvhheuTpMdJ/J6yx6vrfIBt9h3KQiwE1mukPttS1lT94o8i
	XjEyeKUTtxRy+H0FRuE7m2HWnZPvr/jZy9J8f91hz4nZlVWmWAtSMWT6GT4xfdjCVDEKyIfqIEQ
	FC+Oge3XyrAbc9RtgZItwnIwmmbQfeI7DzZkUimhwzxaMNg4mIdQ==
X-Gm-Gg: AYBFou0SHqSL6+yYtaXT8XODMGrJdVq6qLGsEdo3vrBXRrDEdsIay1IFbYVC6EESn3j
	uBCd0x9xjgU0Z+OGLd4yZETi4C9OgpxFsU1HR5shScq8eUT22/0bLISXsGpd/dPS8RgwDM2o/EY
	gEPUekk0mhEpMdiuRAXqK9OFjcuwL+2l1/5DFPHDf0LYoHSDKoSfSnEraeZRJqImBcgc3dB6bBl
	0pU66DhV10n5jrP0BBXGc0OI3O3ENHefCRyaaZy9PuXvNlr3wO9vmNsBLWE3EmUoq+QkA5apvHG
	IgEHHpu11JtrOe1aHzEGYc2u2n25UDX/wlbbTpUqLPlE0ZtTHYSA6zr1xTQiPJ7MlsaO5hRlQWN
	zkxJNLBsd/hdHSrO6hlFElTUXba4zdyANASUwz5R7Qe62LeENOa0mENzMAs3NVFf+hFrO96Fd61
	yGSuMj
X-Received: by 2002:a5d:56c3:0:b0:486:f97b:6412 with SMTP id ffacd0b85a97d-48dbaceb3c2mr14753118f8f.46.1791827328915;
        Mon, 12 Oct 2026 10:48:48 -0700 (PDT)
X-Received: by 2002:a5d:56c3:0:b0:486:f97b:6412 with SMTP id ffacd0b85a97d-48dbaceb3c2mr14753075f8f.46.1791827328306;
        Mon, 12 Oct 2026 10:48:48 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.82.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4edfsm717714f8f.26.2026.10.12.10.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:48:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seiden@linux.ibm.com
Subject: [PATCH] KVM: uapi: remove dead #defines
Date: Mon, 12 Oct 2026 19:48:47 +0200
Message-ID: <20261012174847.147915-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These #defines were used for the old KVM-specific device assignment
and have had no in-tree use for more than 10 years.  Drop them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/include/uapi/asm/kvm.h       | 2 --
 tools/arch/x86/include/uapi/asm/kvm.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 56d3fd7eab44..18c3ab8b0764 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -45,9 +45,7 @@
 #define __KVM_HAVE_PIT
 #define __KVM_HAVE_IOAPIC
 #define __KVM_HAVE_IRQ_LINE
-#define __KVM_HAVE_MSI
 #define __KVM_HAVE_USER_NMI
-#define __KVM_HAVE_MSIX
 #define __KVM_HAVE_MCE
 #define __KVM_HAVE_PIT_STATE2
 #define __KVM_HAVE_XEN_HVM
diff --git a/tools/arch/x86/include/uapi/asm/kvm.h b/tools/arch/x86/include/uapi/asm/kvm.h
index 1585ec804066..00ce265391e1 100644
--- a/tools/arch/x86/include/uapi/asm/kvm.h
+++ b/tools/arch/x86/include/uapi/asm/kvm.h
@@ -45,9 +45,7 @@
 #define __KVM_HAVE_PIT
 #define __KVM_HAVE_IOAPIC
 #define __KVM_HAVE_IRQ_LINE
-#define __KVM_HAVE_MSI
 #define __KVM_HAVE_USER_NMI
-#define __KVM_HAVE_MSIX
 #define __KVM_HAVE_MCE
 #define __KVM_HAVE_PIT_STATE2
 #define __KVM_HAVE_XEN_HVM
-- 
2.55.0

