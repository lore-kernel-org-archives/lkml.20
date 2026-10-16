Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88EB4734F4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159654; cv=none; b=LMpjJmA0+DNYmbcya6tua+c2CvQ7ayKjWJcA7Rxfwfas+JZp/ExJngzbjh7OluIxXzlWCfzb3Dq54UJ6ktW2CuSprKmm7L8yIu7LrFlultkIb7sjJLTMQvL15jT+ygnF00vvqxsGcQhBxi71m0/lkTWj8o+SYNj2e8/4OBFuFfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159654; c=relaxed/simple;
	bh=Na0MxOQFHDtrpeKjiTAolDwXcDVgvk2USy+qcKQNWWQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T3wopRHagL66d16YjgEdI/GZl9zvJDaygfw8zgxZJFUT5O8M4cCxkdNdpmAwV2SKmYUvxzPToR2SqhJ4TPvdf4BtuEizRSnrT6W+ZG4fzhagwfGVfb6OMlw0WcXAuFVs533aAww5Po7j95od/3ubOJ6jxx9ZgF1DRP5whK4uiaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab8b4887d4so25855b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159651; x=1792764451;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Na0MxOQFHDtrpeKjiTAolDwXcDVgvk2USy+qcKQNWWQ=;
        b=z6mNMYdxe++8iOx9CZ7EI/9h8gP0iHFm3pLHVaMDTDEXeFgimw8kI7jMpgawycy23V
         e9T02TUCPrcGyoewSceJTcFrwrDUJAMOoV8kjf1IcPq656R1vBGSMd4v1ySTTJu4pooA
         tw+B3pOKacDNwx1HE41ls5jQ592+tcauUpUkvrZe9yth6tdivELvdgj4iYAq+1B8eYE5
         MpJ667hHZ/1yxAd/+ey2xRaZ3UxZKHaK8PFjizXcFJIZCZ6t1iNYmZz9CgHvNHwcYDJV
         eUgMYuhPGNmMDI0EQOTnR3vEFZWDFNM5NF0JC2bBRS61G47cHzIrTbxWyfUWB89miTey
         nY7w==
X-Gm-Message-State: AFq9FYI5mSJ3+wcu1SgCZp8KilJS2XC1m+YiBo8diKLOC7afFep7UTOw
	/QbtsZYri0m7Zm2CQuH/pnM88m7Mu5O/VWilKKCP8UlkM8ba8fqqkX5MQF00bwTFV0yMtae1Xzd
	eZ9wU9DsjZOn9EJ7XqB4KihSIuRco18r3ZvGPDSCB8njkXH2+Ivr6C6/GClQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:508c:b0:4b9:e5fa:8a14 with SMTP id
 5614622812f47-50c509541b4mr24741096b6e.25.1792159651724; Fri, 16 Oct 2026
 07:07:31 -0700 (PDT)
Date: Fri, 16 Oct 2026 07:07:31 -0700
In-Reply-To: <6ad21435.7514cce4.1ece07.0150.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad22fa3.a6d1a155.34a93f.0003.GAE@google.com>
Subject: Forwarded: nvmet-fc: skip port entry rebinding if already bound to a
 target port
From: syzbot <syzbot+be62d4b375542ecebd17@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: nvmet-fc: skip port entry rebinding if already bound to a target port
Author: neganhat@gmail.com

#syz test: upstream 4056b3c9d3c9
