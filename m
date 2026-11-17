Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922095;
	b=0hu8AD1e9Id2FHhnw1pwvBGhf0Aa/f20JBSJwjlKiA47UClaNIXZ6961OHicCInsCwOR
	 8bTWk62jcjbGfRJ242+NB4ArWuMkSp6qu8eZ2q5A6xOuCGQ3fQckvG/Sc3hHh61dIWh7a
	 rRLjgPzav8LXb34K87SRCvivS0vbyrcbWA2CbT0qcRLFM/vTZKTjMQ2z0lC3h6578Sej5
	 BZNnQi33ltQzQbS+hf/yVLGHmEod6vG+Gp89S5BeeMuwm5gsES2nneU35h8Q3LwNhVZ2b
	 OyceUpQuv6OmruRLLHwLA5wdi5hZEshPwdZONNmuNKdBFNkxSiaCI2+QhGcb1OGUpGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922095;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key:
	 X-Scanned-By;
	bh=bq6R3BqIosLVAUzNBGUDBPt6z67HPJp6MUmEltWOs20=;
	b=BbIdz90TVQLp6x/OfeeQeu3y+4O7kYtHML5uQsku+1fMy8W7gO9pfd6M6dEu2N1wWKYw
	 2PisizBFRoH13FIfjwB/4qwdwZgn2Mr3PSAjnvWik6B6JwZuphg0DVJ7xmD82Qy2NFkwQ
	 XUXAHgJcUffkJM1VNtu/7QBoXuaZsCHAzIDt4YS8TZsYg9ZOdXyGYPzg+uZ/fMrS3OcvP
	 5QqAyKUTu0ptKVxTRpwlbxNRwrCRYoXIoSzYRQ3ZnM3NFLEitCdunUHHKwciDfAHSjawT
	 hGLavKpwpXZBGsiIoGnkWgGAftPUjRTOyFrD57U2ctrh/yVqxP7EQim3i558fNq8WRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ka68f590;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AAD606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96AAD606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ka68f590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794922093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bq6R3BqIosLVAUzNBGUDBPt6z67HPJp6MUmEltWOs20=;
	b=Ka68f590EwAWmbKalmi7WgCwMWxqbKUR97/hmbg/3rHl0wGPlhPct9dDqCfy8sAVkec3bA
	bKSUa9IorC0zJI91PaQfJB5FUfGvNNijtfzeDO5qsn/pu9MaxvGekn/Xr2nOGb0J1KR/Hs
	jllvgshNHaaYNjUMTrhhbu+gkox+S6k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-146-xzZPgCPEP-Kgpmv5Om80EA-1; Tue,
 17 Nov 2026 08:28:08 -0500
X-MC-Unique: xzZPgCPEP-Kgpmv5Om80EA-1
X-Mimecast-MFC-AGG-ID: xzZPgCPEP-Kgpmv5Om80EA_1794922086
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E45801955F54;
	Tue, 17 Nov 2026 13:28:05 +0000 (UTC)
Received: from aesteve-thinkpadp1gen8.rmtes.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B05E8195B3C2;
	Tue, 17 Nov 2026 13:28:02 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 17 Nov 2026 14:27:47 +0100
Subject: [PATCH v7 2/3] selftests: cgroup: Add KB() helper
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-kunit_cgroups-v7-2-5bcbfe17f323@redhat.com>
References: <20261117-kunit_cgroups-v7-0-5bcbfe17f323@redhat.com>
In-Reply-To: <20261117-kunit_cgroups-v7-0-5bcbfe17f323@redhat.com>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Maarten Lankhorst <dev@lankhorst.se>, 
 Natalie Vock <nat@pixelcluster.dev>
Cc: linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Albert Esteve <aesteve@redhat.com>, echanude@redhat.com, mripard@kernel.org, 
 R Nageswara Sastry <rnsastry@linux.ibm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794922072; l=832;
 i=aesteve@redhat.com; s=20260827; h=from:subject:message-id;
 bh=io48fDca3BBUAIFe/tlBE5JydAIJrbrMjKfgVtDHM0s=;
 b=VpmN8iP/Oogl0zCSUe2jFV/1Us2cmshcuya+GdRv0gTE8YNzsl5KjKhe/m+aK6WgGsnKZAz4b
 mnVfx3pUDC3ASamv564nd7NlaILXHMk8Rn8NbTUfJuAyEsUwyduAp6v
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=zI2RBeZgocwYm3AkJW4CtjoJnKoDZrfBl1xe5Ed6h+U=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

cgroup_util.h already has MB() and GB() for size
literals. Add KB() in the same style so tests can
spell kilobyte values without in-code shifts.

Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 tools/testing/selftests/cgroup/lib/include/cgroup_util.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
index 5307f3bf32a0..455e52a516da 100644
--- a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
+++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
@@ -6,6 +6,7 @@
 #define BUF_SIZE 4096
 #endif
 
+#define KB(x) (x << 10)
 #define MB(x) (x << 20)
 #define GB(x) ((unsigned long long)(x) << 30)
 

-- 
2.55.0

