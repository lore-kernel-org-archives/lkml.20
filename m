Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793518877;
	b=RJUSsVma05k+XTVOS5wDAeR/dsa/haHI6RbHmw/vx7uXeXVXg/YDHe8VKusxvcUVjS6G
	 qiG+UAaYqQhKOkVL1veAsYX59DB80MmE4niTY3XKl/33/bLQVrWTQGpeiXzU+JbBu10RR
	 0QkMD8Vw1gOeFlvzgZkEF2NWsSMPNIMGziGd6bLlFFOD6A6wfwnUuy8M7ENOneaUTvsG+
	 lQHgL1VKHIr+scxoTY+VKtvCb97KWVWkig4KO7yCq+0Vk2Ogwndm4WdoIPLF420aceM4z
	 Cw4C2PRr4YuWbhYSAgSsaSD4UiJqY3BVd83AMtPZ8NlQbGJZzfA8BPqPNEep1sZgwcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793518877;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Stat-Signature:X-Rspamd-Server:X-Rspamd-Queue-Id:X-Spam-Status:
	 X-Session-Marker:X-Session-ID:X-HE-Tag:X-HE-Meta;
	bh=ePVzI7jNHdOAykbgc6nDRcUCCVkYGyo6lEWW8rHDzQU=;
	b=UumUyhTZ5/tjjKpk3/fAj3ToNsqtmlUz+O1A272Lo5lqyMtW7AbAzWuTDGc9/FX3zHJ4
	 PTGID5wNUp6jYFN1e4pPe/7/vHShEFqSlhUslwu6UTqJ3JDTS2qNnrVaG74nnrrwRAYcI
	 uiUqEJ2hmwBdFZQna6NCcCRjVIvwyoQ328Sb4OqRvXad+t33tSynNliNM7LJfeMQ0oKXW
	 jo8R2VvnfVykA4NDnGhV9whsrrjdzuWSwcWUKyYiusQwoM2nfH79elEETGV9X/F/Qy+tt
	 /UyBcl8RtcHLvyvPJxXuZqvu387fbiQ0W8zOrYMzribAYVHT7lHDuZ6S4+Z0yPsr0lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E9606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138E9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf20.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 91A65808FF;
	Sun,  1 Nov 2026 07:41:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 76D8E20027;
	Sun,  1 Nov 2026 07:41:13 +0000 (UTC)
Message-ID: <576e04e1d8f0d5ac0805d450b9c87e69f7f0d2c8.camel@perches.com>
Subject: [PATCH] MAINTAINERS: DRM DRIVERS AND MISC GPU PATCHES
From: Joe Perches <joe@perches.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Andrew Morton <akpm@linux-foundation.org>
Date: Sun, 01 Nov 2026 00:41:12 -0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Stat-Signature: 6xsaziwpz68oshic846w8ra1w793xrj6
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 76D8E20027
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19YBCKo3+9zAJbU0O1SGOn9lHF2uItB5Yo=
X-HE-Tag: 1793518873-333525
X-HE-Meta: U2FsdGVkX19Nc3jy/RQCGXBYEQqZOZ8otigmfqFa8BcCNjMGZuaGSPQUoBVhltFb4oQIQ4HHJhYn3N+fuHlxmv4fpw9c6suS+5SdyqycE/K5eY/XJU0bR0THMYLC+CZcv7LDHnvJcwT/Z1BuLuoYezqCNoizBHpE6VeGRCVeAyPTAhPOgSMqUkifD5vMy6Cv8EnZVyXNjFf8a90Zv7mV+KDFYiF1soC+LS9r4NxooB/mluxDfQBpASTFQ76l42Pj1/PSFQz+udU2NOGkT0hXpoUB1RmrzvHwayWxJthyd6mXDeJ3Ak7TChf4yWeMU8VuQoK4RUM0gIkyO6cqjC60p1If40uJODwCZ56bKvBz7GYhQ4ZqYG81aelyaQgGJL01CmW3BcQ3PpxLF/lK/6QKPQ==

There's a small defect in get_maintainers.pl that allows
incomplete file pattern matching.

Update the "F:	include/drm/drm pattern" to specify only
the actual files covered instead of a prefixed partial path
to these .h files.

Signed-off-by: Joe Perches <joe@perches.com>
---

As far as I can tell, this is the only pattern with this defect.
This came about because of a thread with Borislav Petkov.
Link: https://lore.kernel.org/lkml/94f0ab99b5c9072ce7c026672f704b2987db427f=
.camel@perches.com/
and I'll eventually get around to patching get_maintainer.pl

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aaf2825ac945f..95e89bdef86df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8880,7 +8880,7 @@ F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/drm/
 F:	drivers/gpu/vga/
-F:	include/drm/drm
+F:	include/drm/drm*.h
 F:	include/linux/vga*
 F:	include/uapi/drm/
 X:	drivers/gpu/drm/amd/
