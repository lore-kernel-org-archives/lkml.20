Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680194;
	b=fWe6LhIFhL7UEPwhhgolafLkRVR4OYY/VL6osrj3jMwZf6XbQTI9cuX5xv6uti3dZawE
	 V/lQ0AO/kkfSYoVvgMlQlSpo69PJyVfVLx9aRwBQcFnJ8kDFB16sG52R366dM+rgoonkv
	 9SQTXMTleRmKcOI8goMZCDY0Uhxkwsccn8Ds4HbOd/21NBprGo5db+eS++oZm15boUDep
	 5yM/wwiqgNJLaxtAUJt0WOBYPd/RafckNTHvIxbqB8I68tE3Fn/Q0i4yzPvuE9iffHdbJ
	 wggR6WJyK7tExkLfxFf0LwmmZjlYR5iI+zemoLn7fAxOaU1z4QAn0XO8lN70IyWyuwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680194;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=gfIlceCKwYJ+d8Gzds9rA6niSaPauKsH+HYdosGBVUY=;
	b=c10BILsgTF4iy7SZjO4clwIXJkYw6dQJCCTufqktQVxj9lslBHbAm6AxotIMlTkw505G
	 HxEbHILWhrfLE7z9v1ws/blbOXPbrj6T1GwTv0zrTEdmMmdvH+vd6Tj9SC3G9JjWcnntv
	 TEoUwDPVyE0bOhcO4B5ZlHsYc0cgUFCCl8iy+9E1/jU7/AvOBjN6gjRWC+rSPLEABEoSm
	 HoLZP98hEMJMWkVaxH1lKpGBein8TLCksfKXXqJ1JEuG+714uY4ctUZBJZPUTrsQsCYsq
	 DtY/We5+QGiqCzBaW9e6MIlpQd19S9E+b87liLHkT1yrjO82l2+Tnu52XA6OO12mOTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=d+GeQbxh;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xKcOGQCk;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA4606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDA4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=d+GeQbxh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xKcOGQCk
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id A1BB81D00190
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:29:53 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 02 Nov 2026 23:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793680193; x=
	1793766593; bh=gfIlceCKwYJ+d8Gzds9rA6niSaPauKsH+HYdosGBVUY=; b=d
	+GeQbxhmc0+yQ9+UIwNuHkF8r2O0+uacfnajMDUTONYd4FtgJhpu0YXkT0Sk6pqR
	E/2xEFWrC+Hna4mbEc25LgwcI0HdNv7oJqm6jUPrNQyPpNCtWlxaT7m59HvPb/ec
	sDospEikfmI+YumvPIpDALVZ4elcnrATlYrP+R3PwPtFmJmaEBaL6pIqLal0G5Y3
	t+CUAa1r39R1ZYmUA+0KMk5TEkTPEXcPQvTV+B314rYpbWSy6gNZ3YTmqZm9FA4S
	R9cwv1DW3IDoLRXHmj/k/nw16BsGTMJSgMXNqN50Xx8BrSIhy2n4toRcx7MCPbJW
	fwpmLVBfCiGyCXwYTlBbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793680193; x=1793766593; bh=g
	fIlceCKwYJ+d8Gzds9rA6niSaPauKsH+HYdosGBVUY=; b=xKcOGQCkE0Sxfj9Gt
	k+e1bQAh4kIxDcLAa4KVh5BE9jeb+0N8mXOxhV/lFQDe1RdSOGAlP0ASaShovIKu
	dHFkOpilxccsVWfaU8H3D6qnA5J1JGdzZoAunGR256D8ytSPcJFYi4FbZx+y69/N
	DAlHvt+fmZ/i8sDazb7yLJKcViHBhZ8dfUFsSrKD3boIK11VU4j4ceDD2cvyxAmo
	xgVoFv4H8/PmxPDlzFT9TVWBoVl43m/p5b68m3/ktX6IUljIB5gpdI9fazXJ/u12
	RYH/sxfwSS6o/sfXQKlfXarZYmyNTkeclthJKu3kN83QvjRHsMgEMxRtUnR6qf3g
	FKJhg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793680193; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:cyGKHFva+BzkrFGqChrIrzoqaQr3+AsksoQpgm9i6RxUf2b
	rz+KPtjWr4xtZP//p85JVm2Lb84KqIFVC0GU3HCJf3Vp4pkMdErn0FEhnZ/bsZcO
	OHv7HhETepNMo7R0y1noiFa0gS79Dei6/0Wb/ERVWn0j+GObqd0oedLyGykfFR2U
	31HDE02FBJI3MNLgZ829sA6OzJwxu8vJIw3rwbHHF9IBGZtgmo9Lvi8scpj3TMom
	B/LjE6IcVA8VNFLno1hlZonrqRwu20myIInVnqd0e3/pEbo8LG1pf1+byR4LOQmQ
	8o/SvVR+pJHimQGkzJqFbRn5zKn7Kn9QNcjMZ7g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:4SZ+2++aqP4Slg/iwkxK4cc4UWU1pjd8yG5sTxgpVPo=:dGQZC1jvz1UYG7+1CQY0KiG+Cw2IRpCik6kNDzgnP4o=;
X-ME-Sender: <xms:QWPpaj2V98qhBTYK8VMiVSumEToK4gmJ7n2v3JkhC0MBucTiaCfrKQ>
    <xme:QWPpagCilX3A68rVkSi4qPpQW96emgGtgMQQAGSVx_2tMmuVK_x4SjZP2KddmnjEe
    YWbvV1-Q1NfAdoiYHWIMVLlUPtNEhBd3qPtBzCc5hyUF7syG4ExMf2H>
X-ME-Received: <xmr:QWPpard3CCrgfgLH0eBY6Umo3I_KBOBhtWTOyocV-qzoWbAAo4zz_9Ck47Va30LAQfpcclWb1Df7e1wH043E_hDPqT-R5VAI9YkmeRloSXeu>
X-ME-Proxy-Cause: dmFkZTE2Iir9RTLN8+QEF5l3mK7SQuNkg7PqGKPiXrjn8slDkBxugTaak0SAGwGrkTtxZV
    0rB7DEjjFC0C07lkYqjfTOr2EV+mRIFgwdgg9WVQFY/EyS2CmoHfF0sdJ943pnSWEwp0Ps
    zzq7vXRnQ5LOIAUK6shFGh5FJxBXh1a8vgLEz8eQjKKA9adndBRpHZEMr75mWp0/PX5l8D
    blzevvRBaIKmV3HVBBjqRRL3KEeJra2jU4fMYHk/lEhR3Yq4Oqui7vdjR1BNc7nL47VEsr
    wuwZ4awpM64raBfPqA8uZ5Ku5FGhp/SXWnu0PbnF0QaSJuMp7lZaIcfyNtaIwRWuVg1bSp
    ODpJpatwA7D6K+A6MknYv6R0C3I8Qqe/bN4oO7NAlA9qrQCsGVQhjl2wihiH5mGwITFOhn
    S6FKtDfffzh81TcXMD4KDM9ZlXm4z+6Itif2LkA3MPGfEnrxV+uOynXLXIJVqnJpjcgnJN
    /AMf7QOVEUalR5HnRwablKlGvsf/04LQiCc9fVvXfOsY1pf5aRNQWykHEOsqMD517xpTor
    OQIh8HjwUXWoiPWFe7+jUcvs9ob7m3WgkbU7Rw30GzC3M9cnYS9e4b2aptoefMmGQEbEaL
    jMTbAj+aUOIkB9FSkxax7hEAJ6KSYHuWW9mY/ZGi7kEKiTj+3x/ozRYZsPpg
X-ME-Proxy: <xmx:QWPpalhOdS2A2fVJuneQHM8Wa_CXHPPBJzWyt_h6PggJEZ3mHlteDA>
    <xmx:QWPpajoeCiTcHSyy5DPv_Lwoxn4FXTV7VHU_5RFkVzUR5xmCh4h96Q>
    <xmx:QWPpalHywEq9IO8Pd3_XXH0wzgF3qCTvM_dbQJUS6ST9PveVIVRsXA>
    <xmx:QWPpatn6BQOEE0sstt2g4zVRgj712Oy2HTWZ9gV_gkrAWOVAOBzFWg>
    <xmx:QWPpaoLfwfwfLg9gH7haNBHpx8z9qMVnp_Jubrl57Dv2FW5aXokbaS-r>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 23:29:52 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] firewire: cdev: use cleanup function for descriptor_resource allocation
Date: Tue,  3 Nov 2026 13:29:38 +0900
Message-ID: <20261103042939.1231773-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
 <20261103042939.1231773-1-o-takashi@sakamocchi.jp>
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

Use a cleanup function to simplify error handling when allocating a
descriptor_resource object.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index feedc2ab863e..03598f7e5547 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -960,7 +960,7 @@ static void release_descriptor(struct client *client,
 static int ioctl_add_descriptor(struct client *client, union ioctl_arg *arg)
 {
 	struct fw_cdev_add_descriptor *a = &arg->add_descriptor;
-	struct descriptor_resource *r;
+	struct descriptor_resource *r __free(kfree) = NULL;
 	int ret;
 
 	/* Access policy: Allow this ioctl only on local nodes' device files. */
@@ -974,11 +974,8 @@ static int ioctl_add_descriptor(struct client *client, union ioctl_arg *arg)
 	if (r == NULL)
 		return -ENOMEM;
 
-	if (copy_from_user(r->data, u64_to_uptr(a->data),
-			   flex_array_size(r, data, a->length))) {
-		ret = -EFAULT;
-		goto failed;
-	}
+	if (copy_from_user(r->data, u64_to_uptr(a->data), flex_array_size(r, data, a->length)))
+		return -EFAULT;
 
 	r->descriptor.length    = a->length;
 	r->descriptor.immediate = a->immediate;
@@ -987,20 +984,16 @@ static int ioctl_add_descriptor(struct client *client, union ioctl_arg *arg)
 
 	ret = fw_core_add_descriptor(&r->descriptor);
 	if (ret < 0)
-		goto failed;
+		return ret;
 
 	ret = add_client_resource(client, &r->resource, release_descriptor);
 	if (ret < 0) {
 		fw_core_remove_descriptor(&r->descriptor);
-		goto failed;
+		return ret;
 	}
-	a->handle = r->resource.handle;
+	a->handle = no_free_ptr(r)->resource.handle;
 
 	return 0;
- failed:
-	kfree(r);
-
-	return ret;
 }
 
 static int ioctl_remove_descriptor(struct client *client, union ioctl_arg *arg)
-- 
2.53.0

