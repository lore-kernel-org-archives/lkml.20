Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375037;
	b=X2JJXB7Sd8QswN/a+3QeURqs1SkWxba0nimBygyHnGKG107faVKprgtLOPoM4CTTlvv7
	 MZapyldRGyBIV86UdiaIDWD3iOi3t5OMhkse8511a6wVPBAvNASWTtBmkga194HZf8s1D
	 /DHbxNHNmGdYUWF5+Wor3uBIxBiuQVSa8AqqR78lsn8DRw9MAHyvkzXvm8X0HoyY6EbJ8
	 bY30DEVhcv4J2jsb20rmB50/CEGhJpsJ/KMru8pN9Nujg5+TV/sjwiskLfCw9JMv0CHMx
	 So7QEz++zHbmKmaPlti2BWyD15czyAJ2KJKQtJIjonmY2BxjuQ/eglNj0rNYgUlVn1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375037;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Scanned-By;
	bh=M84oJxrdiv8X5pbN7iFC9HueWa3cnI6RoJQKMCgUm+0=;
	b=owxPnRVWN7ZDNTehM3kXpEAQMSOeJE/6DudLqQu8oapISe6BuNS7a+fWTVVZW1UWSScs
	 PSO6dFlrbt0knn6Aj+YubfY7JooAceigdJ64FF+jkIUxJ8/yImYCb1T5r8/dyHrmqavsH
	 1u4eG8uDx2Jku90JECGYTFHCBjKYm3UUnkspWyDUDBoADMVyqJsRIfKnb9ZAY/xpiaAjw
	 cWYwFFB0cTJRg+7KbkZlosaz20SiIibbrYthwFcdN/qYObilq6EXTyKvc5uKctvL9EiGT
	 1SsvWo5XTJrCVVE/8sopAptdlvovecWBJojSfDwO1hCERq2PfEQ+nVyl6ilMjv1INRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N7ux71aS;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F830606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F830606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N7ux71aS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793375036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=M84oJxrdiv8X5pbN7iFC9HueWa3cnI6RoJQKMCgUm+0=;
	b=N7ux71aSoHkAtemFKSqsVBJVttsKBk1huXhPz9DiKj3V5LZt/H5qUqCJiyqe6KNDUWJqN3
	z/KoaFPUbUma10NDJcIFZ606p38hyjbSRSjaDBaW7zoTjQkIR9swvNyaSksMwlMTQDlv/Y
	JB8UCwduEz5V8phiT54uioRero+238g=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1--PwJYgukNoqVYbm_ooY4tA-1; Fri,
 30 Oct 2026 11:43:52 -0400
X-MC-Unique: -PwJYgukNoqVYbm_ooY4tA-1
X-Mimecast-MFC-AGG-ID: -PwJYgukNoqVYbm_ooY4tA_1793375031
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E17D81955DB5;
	Fri, 30 Oct 2026 15:43:50 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 7AFD73000C00;
	Fri, 30 Oct 2026 15:43:49 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 30 Oct 2026 16:43:50 +0100 (CET)
Date: Fri, 30 Oct 2026 16:43:48 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Joe Perches <joe@perches.com>, Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] get_maintainer: lazy load JSON::PP only when --json is used
Message-ID: <auS7NOsyw7pJ7rbF@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

After commit 09d8b39563e8 ("get_maintainer: add --json output mode"),
I can no longer use get_maintainer.pl; it fails at compile time if
JSON::PP is not installed even when --json is not requested.

This module is only needed with the --json option. Use "require" to
load this module dynamically inside the "if ($json)" block instead.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 scripts/get_maintainer.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 16b80a700d4a..8239c8ca0fce 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -21,7 +21,6 @@ use Cwd;
 use File::Find;
 use File::Spec::Functions;
 use open qw(:std :encoding(UTF-8));
-use JSON::PP;
 
 my $cur_path = fastgetcwd() . '/';
 my $lk_path = "./";
@@ -685,6 +684,7 @@ if ($json) {
     $result{web} = \@web if ($web);
     $result{bug} = \@bug if ($bug);
 
+    require JSON::PP;
     my $json_encoder = JSON::PP->new->canonical->utf8;
     print($json_encoder->encode(\%result) . "\n");
 } else {
-- 
2.55.0


