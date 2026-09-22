Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3E539787
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075834; cv=none; b=OKUcIE1+jnOPslNvj0HCAorS1Rbxc8eMLVTka26UXesUtX1vvjDdjm8ctPP6sJNp9mv9rjPBr7kAsKSD/NbhsrPwF5qiZQiYnXHwfhBqC2X1JOA0QoKZYPDVbe24s1mEEnPnlvmzFe8BCiqzJX14drvvBko+d4QRY0enjoZjCjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075834; c=relaxed/simple;
	bh=Y3scqoUo6pqUpiMsHzNZ8XVWMfc9CJWenD0B3vqBVoQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nVkQsUnN8DlFJAbwG56GniATo3/3LjzDb6g8YiLK6R2p+gmJUjD+2s/tSt4Uk+XhX5OcQqv+0mhlJzUB3I//SMrQngNbzbd4vItJ4irr1yV2QEtfymJVxCGb0zopeVDpH95b1HAiRJnD82Es/yxRmkzXljAdLE29rrfbmrrWGrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c18e7d53b9so1396983eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075830; x=1790680630;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HS6k3j8l0wduA83pEXlST8ZKVfvcgTEX06jJUe5ZF90=;
        b=C6hOuKxvWUV7D+GutKk6t3qvh+s/wob2ExwH8cvlUgbwqhB9N+JQvhmzF9oBh+/nwZ
         a7CTFPX/rqaU0zlvpnlgJxakGStx/S8DXU+d3gXA2L7CeMHdM8i0vpY0NQBtAL0oZ7jx
         B9fuwXH/aQUZT+eBXcbPWjzNWYQLMWnwfGZ0QrTIOZeCavP565RyDRNBIs77EBJVUcab
         6o1UbR22Cm+NOXEcqzvAD6H3ZOPajfV0Em00Ta981cjj7VytRxZmhIEqt+SMbzvlCMPm
         Oen5gnPza5iuPqE6w3waWLujym8Tdajpw07yajiza5xuJMnccglXqPUetmaBVkHTlJiD
         pF3g==
X-Gm-Message-State: AFuF++nEUQZrAjYW4W9LJFqT8wn8Ukhebe4X3nx4+GYFfom4lzV1tnc/
	/HnzDjlxj1wTqJ64jgylo0GnVU8HxDrnaZJx8FvTErw0uM/VSLegPuwGE+gqwpjG2UrsXjTIDgl
	ALh/wRIF4R+gjGhiRcFftaHYKlpFvvFe8vLE5ovd6E1a4o+n35uRn5bAwCss=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3102:b0:6aa:1bc8:ae0d with SMTP id
 006d021491bc7-6d157d89803mr2117797eaf.4.1790075830685; Tue, 22 Sep 2026
 04:17:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 04:17:10 -0700
In-Reply-To: <6a81cdc4.f7a79266.2f965f.0015.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab263b6.e548f532.1ca396.001a.GAE@google.com>
Subject: Forwarded: Re: test patch
From: syzbot <syzbot+bf4020519fbd94b2355d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: test patch
Author: syedtayyabfarooq08@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 01715873ea49..158b2f91d68e 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2432,6 +2432,13 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	else if (!vc->vc_hi_font_mask && charcount == 512)
 		set_vc_hi_font(vc, true);
 
+	if (con_is_visible(vc)) {
+		if (par->bitops->rotate_font && par->bitops->rotate_font(info, vc)) {
+			par->rotate = FB_ROTATE_UR;
+			set_blitting_type(vc, info);
+		}
+	}
+
 	if (resize) {
 		int cols, rows;
 
@@ -2466,6 +2473,13 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
 	else if (!old_hi_font_mask && vc->vc_hi_font_mask)
 		set_vc_hi_font(vc, false);
 
+	if (con_is_visible(vc)) {
+		if (par->bitops->rotate_font && par->bitops->rotate_font(info, vc)) {
+			par->rotate = FB_ROTATE_UR;
+			set_blitting_type(vc, info);
+		}
+	}
+
 	font_data_put(data);
 
 	return ret;
