Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF33C584E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903140; cv=none; b=un8RYDcxMKKofdPDzioo8FTHL440aef7qxe+aOtJk0/em2A8Kdc5vyLQgWSVnFZkU3KyeEGo61oGeWtaUoRwJVSYee0aznWdogNuNpphqNy2xGOm8tqOfzxCXO8s7/tw0riQaSzvkGzLTOTd4eAX/8iIo4owDXgnoHmHDpOJjU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903140; c=relaxed/simple;
	bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jTN/BlGq7x7pyyO89k4JHm7gp9IeivcDceDdDsmZ1ov/o3vAnMD+LJFlJBs47BRymm4l4VQ3l9tSbQeEBw1scaUNvqmQ6k19UE00PD3QXIk+zj9kvCAqn+3l6gdMNLW+KUmD0jjOmUwVCY0lKq8DSglMcGWxNVPm/4YyMt2oNrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c734afb8deso4320362b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903138; x=1792507938;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
        b=HRdaWODJLjTFtFupw+nGPaSfdzBwLX+nrAAN3Igtvgc3mguYGRNLH+hrCmZdCEiqYQ
         ZGrh9xE4LrIStKaig3yEgQ0cThZc/69/bVwOnuCxjgKM9ZMiYF/kRjNw6Bo5cvHTWImw
         52nlMZ1srDcRf/q7M/BTtq6U3LT6grM0J5izADdeH6WSDXQ/CKePv4h0RiUqQTdRi8lT
         1sjkJCn+4HusrsLjlr+q+r0p1bpR9dabp+MOWv3po47Z3Wv4Sprx0TyihkY+S+x0CsIq
         oLhB6QKIn+x9x5tQW5pzgsmCd3PjWPOFV5gyIyEfIuxvVYjTQunP9zkoOimM5A/UM4Ba
         P5mQ==
X-Gm-Message-State: AFq9FYJVRDrmJEb0sJGgGcFHtCGTUuSnFI7wNiqcDSUu65/M5wMofwza
	2KwZIF/oCPMy7rG03MRRmQaw9MGhcAtLoyak3QXd5z3mjpmzo/sLWqNEt4S2hSb/dZyPRaCRQbJ
	qbv5q3+i4crSZI6h/yiZB5AjQL+ZmpPIGQNQuWWqUv+H+tjyYAA2HFBIE+94=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:130f:b0:4c1:5614:acab with SMTP id
 5614622812f47-50c532f8aa4mr11369362b6e.37.1791903138647; Tue, 13 Oct 2026
 07:52:18 -0700 (PDT)
Date: Tue, 13 Oct 2026 07:52:18 -0700
In-Reply-To: <688445fa.a00a0220.b12ec.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ace45a2.5f317f00.247b6.0009.GAE@google.com>
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
