Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C056555295D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905630; cv=none; b=Z2ullLXPmmPhL3vmlD4SKa74moqumq5q8EuZF6MuxZ/DmQhFV4dPn8CfJp65cwGBURWpfgpA8/SofHHbdlpS7mHuRmiRQSNQOjzIJOB+ysyxJFUPZg7xQGuXfXfruyZktQjwy2bMdHdW/KbDd8IgmmYWxm+YKziVFrwfbUcEVhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905630; c=relaxed/simple;
	bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kL8zmJtiihWYAHmGziCGIvv59Hv8d1xp1DwWphIPDYBd8eWTwe9X84U3Er6PpCao5myHYZgX4N5PcZ947mvxC+ns879j7vKvA+mwNWXTIZLCYSTMt+3XudQpKqj11mrV1z/kx4lQ8SXUqVFlUjc0iqfjtD6h9ptbNcynp0ARKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-47cfa971c9eso7181025fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791905627; x=1792510427;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
        b=swKnh+lHhViaz3dJgdpjWEBbBqR5YfvdNqn//nJLVadoM66NcCLlDhs81hZtk5Chry
         +B0Yep4Cz4kMrFzbyhHKzZ+61JxAQjsW0to1qPza11axZXVIjofgOQdl76KBoPHvgkIn
         IU6GNrDRqr9CyIOYwgDT0LqoCApk99ZIhGJb9H3SRMy/Arz+fzA4j3dfcgPhhsJuCBE1
         B+MJAGbh3cnlsYY0H+DryuCv0jVUM70ZC/bcj0lRzdwUMswYVSxX0WIPmf3bwLD/5wlF
         AQHxnMtj8y8hpWhKNonwHMsg/WyrbYZakA0LNWTP+Qb2NLTes3ElaJJgAJeCdlpJ07l+
         wcVA==
X-Gm-Message-State: AFq9FYIkBVMuN5OBxTdPHvzX4ZHnk1CS4pEckySfLzAOtNh7Va8xAltM
	muNODRCFAJxKLAon6841PIkFncIzvpdLMVj8MferfYf9aIuK7zdqeWLVoR3fZiSxKtffOMag3dI
	9t9wEPm6VmWzd2nxvZmuasdOU+8p6qmJhuHSEF9QGPDzngizSyjD2ieoLjeE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:16a1:b0:4f0:2d60:f0f4 with SMTP id
 5614622812f47-50b5c4f1977mr9211683b6e.17.1791905627675; Tue, 13 Oct 2026
 08:33:47 -0700 (PDT)
Date: Tue, 13 Oct 2026 08:33:47 -0700
In-Reply-To: <688445fa.a00a0220.b12ec.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ace4f5b.8cdf6287.1eb53.016e.GAE@google.com>
Subject: Forwarded: #syz test
From: syzbot <syzbot+baad8fdbfa4129f93db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test
Author: spannme41@gmail.com

#syz test
