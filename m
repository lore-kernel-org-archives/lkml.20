Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377808;
	b=uBGA3H2xkg1ede9YR0zp1+VMPdL7EBA9ztF1cMNTktXK6oKEhD+tYey2Rl0MdcO6ajb4
	 hahFnBRzA6n/UDl1IpsCFHkFGcI2AK0xJ7tcwzAgTNlZ2yjVVmM8gbCXGmi/e2uTuNsg4
	 3uDad+60ZZKO5L0+I0B1DcdwfsD4ExayevrHlqHyGM67vVNzlt7lSiRQegs4q1TH+ZaWU
	 jTCCeHGpqd5+ERo+8FaxmEebW+V03Shenrax5tVnWgtU9f16Btq48yjJ2v03BUVnFD033
	 nPvrDb1oAdo1r4zJ6lmUgtdv/RPQfEO7o7zWICSVdfFBjGEWVA59AUw3OuvVNitsTnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377808;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=fdu/DSPE6WislUeJxQ9D/yofjgnTGMji0mV4t8PPuPI=;
	b=B0lWszeOse6Oq0kArMBbaBZhaBPaeOeV/c6D9VOtAicJI6iSR0PkgLvQ9T+sakffeTZR
	 6j6iCtKouliu0FZs8IQc6Dz0u3dqUarYW2kjV8jOLGG0xfw0ChGMQidJiA8srbkYoTSNJ
	 rRnJxBffLKIfjCVFn2xdKgDatRk54KwraeuTkCYPrcVttXan/bfsDnqLp5UrvjkZU2FwY
	 DxcF8MZ1r3kL+TxzxfvFkAPwXmrP3jlVRgaZChzYDm0CIqX1EaTUs3HgTCkRg5WXsTvzm
	 yBO0w9UmBT3erSq/f6yzUwvN0dxq3dT9zptiNyWjI4eaj0L+Xojvm2ybwb2DlCIx99w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XRhvr61h;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D953C606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D953C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XRhvr61h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793377806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fdu/DSPE6WislUeJxQ9D/yofjgnTGMji0mV4t8PPuPI=;
	b=XRhvr61huDDnujyVE67vBkONd9u2PIvB6EfEV7dX8/3StTbD0CzPAhN8GhoY9B6cWfDh8e
	k775Iz6dWsyMFJ7KFQECb4mzXX2+7ht6RfUU2qe+FdzGyKD/l5RqmgO8d47PNm+I5vZ9o2
	xCl7Y4+fixQsHxL07E9dlndKyXoFDaU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-XawAb0plM2WbEp0Y_EF53A-1; Fri,
 30 Oct 2026 12:30:03 -0400
X-MC-Unique: XawAb0plM2WbEp0Y_EF53A-1
X-Mimecast-MFC-AGG-ID: XawAb0plM2WbEp0Y_EF53A_1793377802
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3305618007F1;
	Fri, 30 Oct 2026 16:30:02 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id CB64C1800347;
	Fri, 30 Oct 2026 16:30:00 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 30 Oct 2026 17:30:01 +0100 (CET)
Date: Fri, 30 Oct 2026 17:29:59 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Joe Perches <joe@perches.com>, Sasha Levin <sashal@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] get_maintainer: lazy load JSON::PP only when --json is
 used
Message-ID: <auTGBz2VI1sgaayK@redhat.com>
References: <auS7NOsyw7pJ7rbF@redhat.com>
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
In-Reply-To: <auS7NOsyw7pJ7rbF@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

After commit 09d8b39563e8 ("get_maintainer: add --json output mode"),
I can no longer use get_maintainer.pl; it fails at compile time if
JSON::PP is not installed even when --json is not requested.

This module is only needed with the --json option. Use "require" to
load this module dynamically inside the "if ($json)" block instead.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 scripts/get_maintainer.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 16b80a700d4a..b31b4016802f 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -21,7 +21,6 @@ use Cwd;
 use File::Find;
 use File::Spec::Functions;
 use open qw(:std :encoding(UTF-8));
-use JSON::PP;
 
 my $cur_path = fastgetcwd() . '/';
 my $lk_path = "./";
@@ -663,6 +662,8 @@ my @maintainers = get_maintainers();
 @bug = uniq(@bug) if ($bug);
 
 if ($json) {
+    require JSON::PP;
+
     my @json_maintainers;
     for my $m (@maintainers) {
 	my ($addr, $role);
-- 
2.55.0


