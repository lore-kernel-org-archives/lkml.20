Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB04254705C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789805735; cv=none; b=FoeDU5CLEuvavp37ls8DDgkVqqQLPPtIaTg33Xf4dDKHyPyiXGAKUuNDA7ErtRzcM28gkK8AypSG7WUzOk7su2hI8B8tgAEHSuJEFjxmWIEgP4n4TDFJvvqiGAz8+PXjzbUoXJ015lxFBwd2rT6LT/dAtyB+e5KOOxsv7HW4OcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789805735; c=relaxed/simple;
	bh=LAmv7IuQ8AlMtjuW1pTuI7fqC3bQBL8C6WVOQuWMCiU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IQ9aikdi997SViqCI0aaeTbo6M3oKWBLdtoLwoEOZEhV50o9ckDjBAawiJtgtq3US0wYNVAVhuOTdEPvjmFjdxJftfYgKIX8VwViEmL4plEVLLAbPHaaQjw9tHHM0u7uSF/JZwZdGzTjRtIfoejPzk1XIe/npjttjrFRDc9JwT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6bfcf73dcd5so2046525eaf.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789805732; x=1790410532;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZFE4Dr867bqwc9wcyImXP4u8dFWdd3VmsKuDpQq1Cp0=;
        b=jmTpZa9AWPKRZTngKS71GFuEUlHwF39uCi1QtZtHT1twddag12DB9tzh/elDUF5q1/
         KFOkcPqklKUXRLTtEYqOU6XriASenrsDBJVGNEINTvoVry3XXi5m96l4ksKgnrCdjJq+
         Xvjwr0+UfBsmrlEi2SwPRQDj21pDlFj/9cYoE6ZnIjPB9PpfvzXHwnTGIc19Cxeb58Tx
         BSkwMoiBAhIHugD1otdhZ2D3RdRHTCe+zoC8H7VTJ4wEKL3pLIPMnwgkB3zltN+vTSPH
         dIC95NAm5fvfpHeh3drfVZfzDKw+hSEx+Cy+jbsmtBQJmtk3bwjwm5BY4cSxznmwiXEh
         e5zA==
X-Gm-Message-State: AFuF++nIO3dE8gUgwUqT0bw2Ghhsq08Nl6xJ4Pzk9va5gpKDF/0LE4xV
	HsQAz9RZl0WYU/ybRfjwz39hhg+MSZuINwIdQxtZXbYUBcvseqXE0tVlyYNtt31BAjvsNrDYDQC
	N3PxVslQ3J7gCxaFH9cKIneYUffT621xRCOCGGm/CmAFHOJa9HQLS6txL99o=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:ec41:0:b0:6c3:2d16:34a4 with SMTP id
 006d021491bc7-6ca9a230979mr4807696eaf.6.1789805732763; Sat, 19 Sep 2026
 01:15:32 -0700 (PDT)
Date: Sat, 19 Sep 2026 01:15:32 -0700
In-Reply-To: <6a6d3f57.6ce73036.24301b.000f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aae44a4.e548f532.1ca396.0002.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [cifs?] WARNING in smb2_add_credits
From: syzbot <syzbot+eeb58d2197d88720a228@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [cifs?] WARNING in smb2_add_credits
Author: adarshdas950@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
index e266859818a4..7df5b3447aea 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -965,6 +965,10 @@ compound_send_recv(const unsigned int xid, struct cifs_ses *ses,
 	if (rc < 0) {
 		revert_current_mid(server, num_rqst);
 		server->sequence_number -= 2;
+		for (i = 0; i < num_rqst; i++) {
+			delete_mid(server, mid[i]);
+			cancelled_mid[i] = true;
+		}
 	}
 
 	cifs_server_unlock(server);
