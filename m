Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983DA4FC320
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896738; cv=none; b=jSHr2wnSEzKotGLMC51VDEjFaPVLunQSuuMYqjHKrHs19Hsszi726WnCI6PNsMUNTL+3YLdp8MOY98MNMs9864VFCqVmREgXXXF5IF8mmSSTmf9aE7skTkA1KG+HdiChacxTDyPeZqVwSqjxzgBIhd3VgU+zszxK1kC46+cVM8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896738; c=relaxed/simple;
	bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=q6EF9q0dewLoTgIAmYu6+pl2jhx6ylCsw8VFvchPcXAFjGouNHBwPoVvBJyOmKKFJd0rt2zZb4zu/mXrIyU7b16UjFmvAVRaONrqw+ooLsonMh9mURltrMl/MOBeq6TruBO2Yi2yrxs+Yg4IWsodc13v7PvIjf7oEnXT14zyWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a45b3f0bdfso4816849b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896736; x=1792501536;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
        b=N4AqLSdFTSl2UU6w3wORLBVd3BnIL+Jj7iV9OozCb97V8DQFiDK0P9V5k2obx42GbE
         zsANfgPmfzjthb4B38iZX97OYNeWu4RPj6iseSCECBbZcE9qQ/qL8fW6YVfKpPhso8qx
         4jcU6+G3OnbdJ38F1asyecZSv6P+8BVDFmGBg8WaM6jBxqHhiih1f2/pzZXFbie0nQ2A
         +zIEDTYPlc+eArIH2u1bjM20IfAG8lCwggQM1L2OMzx8z/VLmcq/fbmseviGrwxW+A2B
         rdb2K2DfaM7u3/ermFW5gCPK165EAfhjaHG8Yf57yB4Uuqg1A3qFpm5DtWVZpDbzHbl2
         RubQ==
X-Gm-Message-State: AFq9FYK8ihATbxEyOFZTQQh3uMNFaeIijgtXUi+eI1uY1511niYE3oCs
	mRIMY4dQHSPfbrwmcOozOkM7UEVbsjfsDbvxYmFapqmC5CvwcRQTYRT/WGo0dHu1CL2qxwm/DGI
	M9I7KDfuI1PQ0ijDmYs2BymEBTHPU/mYj5emqz38xIU7PsSt5IiwqKhyRj4A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe8:b0:4f5:e4ea:9ef2 with SMTP id
 5614622812f47-50c45c6991bmr13972136b6e.3.1791896735736; Tue, 13 Oct 2026
 06:05:35 -0700 (PDT)
Date: Tue, 13 Oct 2026 06:05:35 -0700
In-Reply-To: <688445fa.a00a0220.b12ec.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ace2c9f.a150a118.27e199.0059.GAE@google.com>
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
