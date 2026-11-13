Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558476;
	b=M9io2/nIzoh5cHiXaS6X/6tvN42haMsric+CFwZ5Djwm9U9zsWf7J9KJH4t9Z9WV7a1m
	 taU81LbNHVZD7+PjyUeu0k6j60ff3p/Q0o84NAeMnm4XUxcXi0VboVas1visuzJ/kmExx
	 OJyJWhxSsw0v+nIqCL63FRximxFhQBMduk36+0WDtGtzuAtycnKfyEHMpV1rNXTmVTJgs
	 Bix6q41LIbWwkedrNqPCdV1FInivNl8bg/1d+63cJtpzfXWcG4zRb3W3+nfD5ab2uWIMh
	 Kd+b9l5Q+AwPRyDQtthL5eXyaoR6U+kvWPBdbZOf1Ta6/1m6L4zU0lNsg5EeKlprcsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558476;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dM72oSYTKXSu25EPqpOTZBfasrv+wkrF735rHriHFPs=;
	b=r1deCv6R8bIidihw/dtqtXvk/mYBHm6EUxmPN53dm1tQp7XWqXW6uk7+7S2eVVYxzOB2
	 PDH3IlZCd9ftwc81263fxTnDLBB7qdd2AyGsLGQeWdK49nR9U6xbYHwu3ldftWLezLFT8
	 U783L72NrvXkOGA9FjvTNrny0LZxZSTQrWAydbr6oI9XdKFEVIrISrC/XxPhuqbVUqML4
	 VeHqlske0oOYvoTR4gL+WEwkvodYXObQheJIBzyHor8X1FTGZni8BAtJKJnulEisgnIyn
	 W5ra1ZPsw1FgFMQCljLx4hDyHX1cFQbmCfwb6QOvPMnpxvuqrLfdjJb8A+HppnNd2Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NyDdpyEM;
	arc=none smtp.remote-ip=95.215.58.28
Received: from mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009E4606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 009E4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NyDdpyEM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nYLdUbk5QLSfx/0QfCJHyY1+wwz8sy2W4IX1D6WfX7w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794558474; v=1; x=1795163274;
 b=NyDdpyEMeQylZEbb4ptsrUQJGSig1MhNvbhQfhXI/6HJTb1Zgb/mntVouDnnG5C80geFLpyG
 bglD+45ZlJiwvkeMU1mEe7F84RSbNRx8vE7ryNuvoiB2/KINg4Jtqi/ZwPacdFFBwb0dKzmsbGG
 u1M/JFtaXR3YUihsD1JjDI78=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c52c70c0dd39456d;
	Fri, 13 Nov 2026 08:27:53 +0000
X-Mizu-Trace-ID: c52c70c0dd39456d
X-Migadu-Flow: FLOW_OUT
From: Ruben Wauters <ruben.wauters@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <ruben.wauters@linux.dev>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ruben Wauters <rubenru09@aol.com>
Subject: [PATCH] MAINTAINERS: Update Ruben Wauters email address
Date: Fri, 13 Nov 2026 08:25:57 +0000
Message-ID: <20261113082738.6447-1-ruben.wauters@linux.dev>
X-Mailer: git-send-email 2.56.1
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

Due to issues from my mailhost with sending and receiving patches, I am
moving to a linux.dev address.

Signed-off-by: Ruben Wauters <ruben.wauters@linux.dev>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 7fb33babc931..70491b2d8199 100644
--- a/.mailmap
+++ b/.mailmap
@@ -820,6 +820,7 @@ Ronak Doshi <ronak.doshi@broadcom.com> <doshir@vmware.com>
 Muchun Song <muchun.song@linux.dev> <songmuchun@bytedance.com>
 Muchun Song <muchun.song@linux.dev> <smuchun@gmail.com>
 Ross Zwisler <zwisler@kernel.org> <ross.zwisler@linux.intel.com>
+Ruben Wauters <ruben.wauters@linux.dev> <rubenru09@aol.com>
 Rudolf Marek <R.Marek@sh.cvut.cz>
 Rui Saraiva <rmps@joel.ist.utl.pt>
 Sachin Mokashi <sachin.mokashi@intel.com> <sachinx.mokashi@intel.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index c4f4e48774d0..17bd2c76f737 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8337,7 +8337,7 @@ F:	Documentation/devicetree/bindings/display/panel/panel-edp.yaml
 F:	drivers/gpu/drm/panel/panel-edp.c

 DRM DRIVER FOR GENERIC USB DISPLAY
-M:	Ruben Wauters <rubenru09@aol.com>
+M:	Ruben Wauters <ruben.wauters@linux.dev>
 S:	Maintained
 W:	https://github.com/notro/gud/wiki
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
--
2.56.1
