Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313D448095E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396632; cv=none; b=KHEmI9nE4vQcxNd9AuwmJLVICd8VQuylKlCkC33HZslhpsOolJROVE194rdBZxPDbipY/3cGYzpwLmJIEjF690ePxSfkDZhn0Pze97Y+O1qbRHJf5TiB7Hmz55522ld0uGJHwMPOJClVEx6lG+e3BxZw0e7tkXcY+1ogqudoKlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396632; c=relaxed/simple;
	bh=zyXYn5lNGP09NNHFR8KUhfOLM0r+nd+ipLvDagozeW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKf+RYrQD4M5Ig1fRrE3l1M+6GHucyf+OkyTH3pubGacFdLJ9awrUhkxCuTgvqzFeL/jxYqlQOaHfMl+Z7EqqOr77c0gALWuCdHMbNA+rQUT3O2GfvsXGD+RdnkaddDKraP2pvTUK84rq+grmhcTsNaGDpCy3F7siQUaHdzw38M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YxrK0A4M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YxrK0A4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789396628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tMm0dH64p0dEP2daRjQKOJUb0wdJsotITarZnjr79Xo=;
	b=YxrK0A4M/IMTanGPSIt92U1pMOqho2E9eJCpYCUJJ1lNUCxcL+qahrBuAdT9lAzTtLnetc
	nhg/Lo8XBVWTY32DgaD+qDYPQ8/8He/oDJewkc7wvNi4JKXgiIiF5xHWmkNyOLf4Et4utB
	3MXaCQjiSwKdrILAC2BrUvNkLKbNtQw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-538-Rw7VHGuuOHe_IHDp2ubJDw-1; Mon,
 14 Sep 2026 10:37:07 -0400
X-MC-Unique: Rw7VHGuuOHe_IHDp2ubJDw-1
X-Mimecast-MFC-AGG-ID: Rw7VHGuuOHe_IHDp2ubJDw_1789396626
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97C14191DFE2;
	Mon, 14 Sep 2026 14:37:06 +0000 (UTC)
Received: from aharivel-thinkpadp1gen3.rmtfr.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 380521800345;
	Mon, 14 Sep 2026 14:37:05 +0000 (UTC)
From: Anthony Harivel <aharivel@redhat.com>
To: kvm@vger.kernel.org
Cc: pbonzini@redhat.com,
	seanjc@google.com,
	linux-kernel@vger.kernel.org,
	Anthony Harivel <aharivel@redhat.com>
Subject: [PATCH RFC v3 1/3] cpuidle: export cpuidle_devices for KVM C-state policy enforcement
Date: Mon, 14 Sep 2026 16:37:00 +0200
Message-ID: <20260914143702.915401-2-aharivel@redhat.com>
In-Reply-To: <20260914143702.915401-1-aharivel@redhat.com>
References: <20260914143702.915401-1-aharivel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Export the per-CPU cpuidle_devices symbol so that KVM can access
cpuidle device and driver state to temporarily constrain idle state
selection when enforcing per-VM C-state policies.

This is needed by the upcoming KVM_CAP_CSTATE_POLICY capability,
which disables deep C-states on the current pCPU before a vCPU
blocks in kvm_vcpu_block().

Signed-off-by: Anthony Harivel <aharivel@redhat.com>
---
 drivers/cpuidle/cpuidle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpuidle/cpuidle.c b/drivers/cpuidle/cpuidle.c
index 2d2f40a2cb81..13f8acde31a4 100644
--- a/drivers/cpuidle/cpuidle.c
+++ b/drivers/cpuidle/cpuidle.c
@@ -31,6 +31,7 @@
 #include "cpuidle.h"
 
 DEFINE_PER_CPU(struct cpuidle_device *, cpuidle_devices);
+EXPORT_PER_CPU_SYMBOL_GPL(cpuidle_devices);
 DEFINE_PER_CPU(struct cpuidle_device, cpuidle_dev);
 
 DEFINE_MUTEX(cpuidle_lock);
-- 
2.55.0

