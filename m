Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECFB47A876
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838688; cv=none; b=pSz+2cDsTCUExhBf9p+t4l3YwzLagh1sI9q48FNz8UJyCYBy5SdYBq5A96lPveO5R40BCBRlsCZuLqDI9XjzvsycFop2k9/GfC1fGkz8PRV4geA7GOJG5uUPsmCAqDG2X20JN7mdieSOG/aCJOUcvSypU+fnrQHN1Ba5Lgicfj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838688; c=relaxed/simple;
	bh=iMmFH4lgDHyoNQ1xgQa/pQGhmZVKPSZz5PAimZRmSu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=qBqAS/5J3yh9TohPkbmhw1jltXZcUOJx6zbITpSJ0obYfIOEToAwYCVyOAXBmVnnv2tzp+rckQ3QwwmXyKfqt9yNmMy0gXQF54KjmqxEVDqh91FijOnBmloJ0jfARuI63N1AOIyVeY3jQvaAXiHTJ0tayjEcYYrEbp6OpTge1+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DAJdvz8h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DAJdvz8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790838681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sQkhrsRcsWf41Bxxpf2FbhExi0yeXGInF1+JbpCTMxA=;
	b=DAJdvz8hTaRXdWXUGav8DoibYbmZqn/HnZjrqhf1jwWXD/6ixWS14FiXO1Ogv8S9jMcPc/
	EdM35tGodbtd9XnWvP4xNYXKj7TOGDuhpTMjo+dkspmbVcgJjtUwCReBqSDcWIKfWZTOJ4
	hTV8GWgU25lSdD+0H5qWP01Mk8dHry4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-113-_ntGq0lDP42OwLLTq_lLgg-1; Thu,
 01 Oct 2026 03:11:17 -0400
X-MC-Unique: _ntGq0lDP42OwLLTq_lLgg-1
X-Mimecast-MFC-AGG-ID: _ntGq0lDP42OwLLTq_lLgg_1790838676
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 86ECD19540D1;
	Thu,  1 Oct 2026 07:11:16 +0000 (UTC)
Received: from jstancek-thinkpadt14gen5.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A80AE1956089;
	Thu,  1 Oct 2026 07:11:14 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jstancek@redhat.com
Subject: [PATCH] .gitignore: drop Module.markers
Date: Thu,  1 Oct 2026 09:11:10 +0200
Message-ID: <8cbe913b9f80dc6fea73a9e3d51429db2b38905f.1790838401.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

commit fc5377668c3d ("tracing: Remove markers") deleted the marker code
and the modpost output. Follow-up commit 8723eaeff59a ("Kbuild: clean up
marker") removed it from clean and mrproper targets. Both are from 2009,
so the file is hopefully no longer in anyone's tree, drop it from
.gitignore as well.

Fixes: 8723eaeff59a ("Kbuild: clean up marker")
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .gitignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 9875120ea7bd..01e6a1f7a49e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -75,7 +75,6 @@ modules.order
 /vmlinux-gdb.py
 /vmlinuz
 /System.map
-/Module.markers
 /modules.builtin
 /modules.builtin.modinfo
 /modules.builtin.ranges
-- 
2.55.0

