Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799AC2475D0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170421; cv=none; b=m/xUtrONIL5XVuDSScfBBhjHHLt5gO4W4J3givLINskRgoQEmUPtsMPw88vVEJJvdg+fo7IRnfSjXrKfoEqI24qO+it32TXA2nK5GOnUFv8Ff/Elyzi+o7KNEZoyojz9c3E6QmJRoOXGYK5Py4sg3SxoCBmAn0a0v961nwRQOzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170421; c=relaxed/simple;
	bh=FocYRFooe2PHD6829AxmHF6BCLLKXg+c84HLUZ9o35c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=X+qxM7i32gSHtCsXbmsYBdnE38N7HMyaz9IkDJzFaO/J8mqlcYwiE4wV6w7txbyBMlsvkATvrIa0PSnZIXd8nB6Z/n9xL4Foojtw0E1ava6z5mU72FyE3y2PDLV+CtjIX4XFE2DIusagbFD/SfQtV4CTgoKs7m1sNvmh39jjB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ee59eeb8c1so2119280a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170419; x=1788775219;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FocYRFooe2PHD6829AxmHF6BCLLKXg+c84HLUZ9o35c=;
        b=CB0abf6nWsnSt9iZNKSkb8yLaiW2VX81psunj8/zGO+lBRAvfaXvyDF1AUYaYDC8Ap
         oW0UWB2hJizmxzWWCc9kGIAOZhDKZcwqkYiNvRVaTvAqlGcUkAxYvT6NiMqvKG/qP/M0
         F40ryS2EkVNOD90JDK0ghALxTbKYaoGVsgFWJhfCT9+lwS45DLZM91ve/57nx5zRAcX9
         z768+9BXv6JxcL/KeZzwwcpVb8uhV/xkWGCEFFtp6OlKk8MTFPyP65IVOZS+vBgrMXCu
         cASoaygt7aD4rqlvV6I21hlJVM2eV/oUbn+ZgTrc8qoqAYsv5F1nPS+e28GrfneoFRxV
         1U8g==
X-Forwarded-Encrypted: i=1; AHgh+RpQl0EMInYXIJfogy1ItlT0oW6PoYFXeVkGQtizH2Xz6/r6ctHbUAgWsRnjdIhnJu/2RqSrGCbucmIzSqs=@vger.kernel.org
X-Gm-Message-State: AFuF++mIwXEj0Ti7BhSazEp6qFSgQ6ko8uviDExiTc96UUuHwePTiXiP
	Y/xwBFaDt4jLjFv6nzOfzY3auinveMVtsVzc3FEIwL2DpX7ztD+UT4zMVLVGTLGleErAbpIds+7
	C3YI+rWTfZXNYvlvNBhuW3jW2ie8GuImuHcjzYOdIQLeFgzm0gq1PkfwNf9g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f4b:b0:4b2:8e1c:5920 with SMTP id
 5614622812f47-4b3981ace12mr24159156b6e.9.1788170419468; Mon, 31 Aug 2026
 03:00:19 -0700 (PDT)
Date: Mon, 31 Aug 2026 03:00:19 -0700
In-Reply-To: <20260831120007.00006021@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9550b3.4d659fcc.734b4.0049.GAE@google.com>
Subject: Re: 
From: syzbot <syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com>
To: joshua.crofts1@gmail.com
Cc: joshua.crofts1@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

