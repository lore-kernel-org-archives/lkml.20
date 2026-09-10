Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D4B202F70
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789017466; cv=none; b=pVsVea+69iHyJWIItOYCNwPomveL5IvOOnxUjI+A6majziMxSB+KRSAMjbe4Fdq6M60qgFnpiLvpXE9ggmsp1J237OliOHRnLnf7MPM2toxKsuDbYvYwX+ZByWNhWCelB9NdwqNSEHpBVGVSKECvRQuk6UH6dgywT8EOLz15DO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789017466; c=relaxed/simple;
	bh=+uttU9LoNQl5UcNsiobpMhUgBKqCGf0qXMslcE3NoOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LXXR5rhVzlJSO/FVnTPIVInElLbiG0RC9BOSugulQG1p0HYh5TBg263bQMEPxiAR65jK9LoONpgxbkeIJfT1IIpa4mxtvA+pntLh9bxtRAbNTQZdU07dxV3E9zrXlppY7gjwOm7BL/F7Wykfqcvm0cHFQpSjgsyTDK7rkecquKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=L5a43ra3; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="L5a43ra3"
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DEA503F920
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1789017455;
	bh=lnp4DkMY9rmqEKCqdg1i483FpRZlyfK5ov9pABziNG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=L5a43ra3Q1NBdNjr/53rcCuKnVezL8f9Z+32FhxiecSRKZ/9MFHpeQC237GilLQkr
	 /yyUCu79GXfNwfDYHWnIIf+FUlr951YEvib0mbf7MDvc0mzMzQ8o9RuQ+umq453+qI
	 UIZtqVH2V/eC8EvlQuMWpg9vzAsnk5b3PpmKiVcfrSbGKgHvnXHty9MFEDiEUv1bzY
	 9t8hVkiGyCaG+PFBocG/7QQ4gXvDeLUFHN4SsJMQadBw/rDnsY/vkqDqcPiQXquoJL
	 BbXOmPEz93BJihf6UYNqnnan14JjEsnsJNqnvjvaKue3YRxT2M3vLE5LxTnn6uY/m/
	 T75H64Km860TPApa80M+lMeo25VseusavKnCo88F76EPDfyU7kLoK1LGGBUZw+pzAG
	 oZdxbuuc8BcrjVB8PAdBmtRoCJOshvJYcTrnWVqjHmbiIjn5kS7d2iLOD7QV8mjmJK
	 PabeuCNxl+cbdzPSX0BSTSFAsfTfvMJv7ycOkxyiS0ir6Cf+3Hb4lR5KWvmEW2gG7j
	 NPwyzSaLbnKzPtgNYsY4Fl3Rxjryskm4jZcgvFnrelNGt7wYGJHsaqZUURno/Ejv4E
	 kUegXJbxPK49P2r9CBVKeMvUSqwTuNvJ7UZWDtpUKAIJSJ/j01iUoMGgP1z1xTqPRP
	 4yxgNcTpV7IqjEQyauyK172g=
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-853a9c4c99eso79241597b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 22:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789017455; x=1789622255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnp4DkMY9rmqEKCqdg1i483FpRZlyfK5ov9pABziNG4=;
        b=Y7cG+V8RNj0tTijOmhC0mAuKNM769jBCI74IOu60C+BzIchp2U241o7woQFmK9vqyw
         syuoZfVVBRcTWsbnMXV3Y6eV8uCM2ByzqUmJMYD6H4W2wzJh8Z37wINYlVVNLexa3QXp
         8sxOdipVDeedprC85cc0AzrrnGOJcmm8eSesoPQOZ9TYUXmOm3TnHLnjjX7W2/o0+mEN
         e49v19yNkVqonKwuq8r6F7plml5f3bUmjPQHpf7BH6Sleh2lI29/J9aTIvI8Rg9WXtnm
         k3Sm8qABdv4Hn9IRUIj4EOFqq5JE9bcLctlHdLGlAv/XFw2lSDGPPQH5nLFhyqpgmJlx
         v1yA==
X-Forwarded-Encrypted: i=1; AKwUvBwZCG4TvGb/iI9B5T/99hLzf61pLQ9r2vAUdB5tcskJfqpT7DADCxyNu2hht0wQiHUnyy72BUsMngsVgRU=@vger.kernel.org
X-Gm-Message-State: AFuF++lWtw4shehW8NcGJXgtafZhx9/d+CZnSFRfqXoAYRoMklwGaWFx
	uCtQmQPZrJ+kCPHOxdg2duu9rXSfHqpm63/shgIJi9XbY6gvADqzDc/L1KLT/M8y6/I53HbsShl
	Cee9T2QHU2N3XjnuKCWWcqQ0OyO4SSj1b72Ff87C0N+2uFNa/6GX0mlU57/yEGfx6ybOsa42rRI
	2okxhdXg==
X-Gm-Gg: AYBFou3nnI9r2niLlh471aoUCsov0ZqoZCoAcHgp9guczAjV16TkQYFN/+KnJ0kaFeW
	X6VMjbvQCdEWzEz1gnqm3L7DqvmuTpaTJcs5K39ZwYUe69m4Ty7+8Xgrz/ZJa5zhHFncdWrXfgf
	Ms226IrwggJ5LacAiO0j/Hlb6m8267pjdMXapZfhL5Kw7nxsCBXFmsRnK/yoduevOAWGqSLS040
	ZRlJMfRXHu9mqgjd+FOmpblqe2IVydrEMarfn5erlXCQxmqDGkC2QwAL39r61tDSknBdYlwP5Fz
	d9AjTozkQ3OrRcNM0GwvAmQOsnqk1iJf8sV6wK2rGmapnexoQXa0Maza1wFf6WVKZ2JOCG0M2i5
	CjiRWLCLskjsWanHeaWxWnZjLemLt3//XZYnEW3QkrBbPcLU7sWfhvRvyB9q3BhlKRsS7/Svp8F
	sID/viDzznLBzZ2fiD7tV+nmPXdg==
X-Received: by 2002:a05:690e:4381:b0:66f:c1be:84d1 with SMTP id 956f58d0204a3-66fc1be86e7mr8345900d50.63.1789017454738;
        Wed, 09 Sep 2026 22:17:34 -0700 (PDT)
X-Received: by 2002:a05:690e:4381:b0:66f:c1be:84d1 with SMTP id 956f58d0204a3-66fc1be86e7mr8345887d50.63.1789017454357;
        Wed, 09 Sep 2026 22:17:34 -0700 (PDT)
Received: from april-canonical.lan (24-148-58-139.s4745.c3-0.lem-ubr1.chi-lem.il.cable.rcncustomer.com. [24.148.58.139])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb49763bfsm13441030d50.19.2026.09.09.22.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 22:17:33 -0700 (PDT)
From: April Cardenas <april.cardenas@canonical.com>
To: linux-cifs@vger.kernel.org
Cc: pc@manguebit.org,
	linkinjeon@kernel.org,
	ronniesahlberg@gmail.com,
	sprasad@microsoft.com,
	tom@talpey.com,
	bharathsm@microsoft.com,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	April Cardenas <april.cardenas@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH] smb/client: send lease break ACKs thru correct session for multiuser mounts
Date: Thu, 10 Sep 2026 00:16:49 -0500
Message-ID: <20260910051649.3806214-1-april.cardenas@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when cifs_oplock_break handles a break request from the server
it searches for the appropriate tlink to handle the request
but incorrectly uses the current fsuid as the search key, eventually
causing read errors for users with multiuser mounts on NetApp.
Fix this by using the tlink from the cfile struct instead to respond
through the correct session.

As breaks are handled in a worker thread, the current fsuid
isn't guaranteed to match the session that the break is intended for.
This means that cifs_sb_tlink may search the rbtree using the wrong fsuid,
and return a tlink with an incorrect session than 
the lease break was intended for. As a result, the breaks 
may be ACKed through an incorrect session.

While it seems that Samba/Windows Servers 2016-2025 ignore this as long as 
the lease key is correct, we ran into a case where if you're using 
NetApp ONTAP or Azure NetApp Files they will reject the ACK 
and return `STATUS_LOCK_NOT_GRANTED` errors on any future read requests
a user may initiate through their still held open file handle, 
and the server will eventually close the file.

In the dmesg logs, the user may see errors like these:

CIFS: Status code returned 0xc0000128 STATUS_FILE_CLOSED
CIFS: VFS: Send error in read = -9

With a multiuser mount using NetApp, this issue is really easy 
for users to hit on a wide variety of kernel versions 
by attempting to copy a file from the share 
to the local machine through GNOME Files/Nautilus.
This copy will always result in Nautilus throwing 
a `Bad File Descriptor` error to the user and fail.
With this fix, you can copy files through Nautilus without issue.

From looking at the traces, it seems that glib will 
open the file first, and call listxattr before actually attempting 
to copy the file data. The listxattr call always triggers a break,
causing the copy to fail.

The proposed fix returns to the way the client grabbed the tlink before 
commit e8f5f849ffce2 ("cifs: fix potential oops in cifs_oplock_break").

The bulk of that commit (checking for list empty) remains untouched, and
I think the change to using cifs_sb_tlink was intended to avoid a
NULL/ERR deference on the tlink as well as update the reference count.

I believe this fix should preserve those safety properties, but of course
I'd appreciate any corrections here.

Fixes: e8f5f849ffce2 ("cifs: fix potential oops in cifs_oplock_break")
Cc: stable@vger.kernel.org
Signed-off-by: April Cardenas <april.cardenas@canonical.com>
---
 fs/smb/client/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 1aa4844f8b8a..0d428517f454 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -3354,8 +3354,8 @@ void cifs_oplock_break(struct work_struct *work)
 	wait_on_bit(&cinode->flags, CIFS_INODE_PENDING_WRITERS,
 			TASK_UNINTERRUPTIBLE);
 
-	tlink = cifs_sb_tlink(cifs_sb);
-	if (IS_ERR(tlink)) {
+	tlink = cifs_get_tlink(cfile->tlink);
+	if (IS_ERR_OR_NULL(tlink)) {
 		/* drop the reference taken when the break was queued */
 		_cifsFileInfo_put(cfile, false /* do not wait for ourself */, false);
 		goto out;

base-commit: cb26524ef4ac28fcfa554c0656e8dc412c38a8ff
-- 
2.53.0

