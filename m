Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372276;
	b=2mz+sHd+uYMzz2ugljitYDRw8GHj9285gtAhL0gF5MdpAVOEY+zQJS5wvEm2ZxSoBtuB
	 xNDXqTWB7048y8ADnB+cMOrmIc1H3CVJg8a/awQKwWBVoSwRDi2A84ZIRDcCHIdFDIS+q
	 aR0pNbf8FXkzhpgkNqKWrylP8N5ldFupMdTIFKqkejQ9aN7i6wGxQsFCQdFONd5N79M1k
	 LWOp9HiLXtNiLhUR0gT40NYf3SzeBTLA2YTayz/0GqCh6aeKGVYPUMJBtiDXg+4xxEBGi
	 i0LpgBg/HOQ0k9XM74o0ntICIvvRr2ZmpO+YJzdmKeWSiiqN13PX7k1qyan3O8lUung==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372276;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dJ6Y+BUJ5kaJIb+tXDOob9cif188nL1E5qIpQ7gXVO8=;
	b=XHCWp9NbUxmXv3QV1ndVjFJyCHd+7pOafbqcpUXOrgEk0yXQOazW0yEOvp3zsfpGwtG0
	 emIaAbCMDmV20URKghW1mxn8YbfUynstUQQk/WMxA0RjZB9zUSyW07DFlJZjEfvc+HQez
	 O7cDlaN0kGrDYA7ed2Ok5PYQgnquXWP6xR7M3XZXn36MKSbO7euY4rlTa/SchTAN8f7gP
	 mly77cuc/y1XutHeGoTHZMRbYcsew2tEiy7+CqC0lYmMxgUQORuXPLbVomRExak36ntV8
	 ow+qYHIVkgMqg+TpXEgmZzCn36kfFaLntmudbc+BsVq6zv8ral8Kcp6czmWhAt7TC1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=baEePjvG;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C949560A5BDC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C949560A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=baEePjvG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=baEePjvG14qWRmKMS107nG5Kzgfql1AFr675dDdJAbBXP4Z+SXKhsrJaE9OfpUk2JHNjz8RRTkXEV
	 7L90/+BJr/sd1LttholE2Y+gmIMEgtlJludwOguYdBA4vcXRg22XmJFhFlzINMiqaZDgcaP9WvLtzl
	 c3YGhr8jl/NhniUk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af3f2acf29-a0753;
	Wed, 11 Nov 2026 12:44:31 +0800 (CST)
X-RM-TRANSID:2ee36af3f2acf29-a0753
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [25.255.2.225] (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af3f2afc29-cee1d;
	Wed, 11 Nov 2026 12:44:31 +0800 (CST)
X-RM-TRANSID:2ee96af3f2afc29-cee1d
From: Jiahao Xu <xujiahao@cmss.chinamobile.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, xujiahao <xujiahao@cmss.chinamobile.com>
Subject: [PATCH] mailmap: add an entry for Jiahao Xu
Date: Wed, 11 Nov 2026 12:44:09 +0800
Message-ID: <20261111124409.470301-1-xujiahao@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
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

My patches were sent with the local user name "xujiahao", which is a
single-word handle rather than my full name, so they show up as a
different author.  Map the name to my real one so that the existing
contributions are attributed correctly.

Signed-off-by: Jiahao Xu <xujiahao@cmss.chinamobile.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 0d05be949..312dcbe75 100644
--- a/.mailmap
+++ b/.mailmap
@@ -451,6 +451,7 @@ Jesse Brandeburg <jbrandeb@kernel.org> <jesse.brandeburg@intel.com>
 Jessica Zhang <jesszhan0024@gmail.com> <jesszhan@codeaurora.org>
 Jessica Zhang <jesszhan0024@gmail.com> <quic_jesszhan@quicinc.com>
 Jessica Zhang <jesszhan0024@gmail.com> <jessica.zhang@oss.qualcomm.com>
+Jiahao Xu <xujiahao@cmss.chinamobile.com>
 Jilai Wang <quic_jilaiw@quicinc.com> <jilaiw@codeaurora.org>
 Jiri Kosina <jikos@kernel.org> <jikos@jikos.cz>
 Jiri Kosina <jikos@kernel.org> <jkosina@suse.cz>
-- 
2.43.0


