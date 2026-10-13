Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182CE5208D7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911571; cv=none; b=Vp/oiwkFFxWMqauhYKv866EpgtGltw7EB0/oP9GKg5MwwPBTVLyplGntS6xfOBR7cV1Lpu7IKnmrdKxUZp1qb1oWjn4b+KVHGPWXIliAiUKUaCHi4L3T5oKxGINGfFDeuAQtEaQplS9xKGWfhUpb6M98ZGa47kM7YZIt7cgSd7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911571; c=relaxed/simple;
	bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Y0oB6X/FzmvhWKh13NEip+GKbasw0MF3AF/zT7H+XNfRPaLXwiKlJgete0gQm0HthP3MpcoousuW0zORndPzT3YyxGKYZON+CKASe8qE6hqVWal84LeWt6o4Z4mP6Hhh1df45OG/wSK+j6gx+PM1PCtXUFP7A2zcvLEVDHQP8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4eb0b989f0eso5505147b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791911569; x=1792516369;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
        b=YBPBkxEyOhNgBqECUOfuGFIO7lPkZ8DsmKXffhQf31MRhlRksag2IDcRb8sruex8Xr
         sOWCv8c9JFC98DA5eUlMit09ekmRDqOYjJpoOCfVOoORBDcynDytGiMVS4vRVJvCyE6t
         wtmMqs4KuQwPudEhpLoBA3gXYvgji3rqC7Od0Rob7aujby7A6j7e07jMXow1NCkqTDz0
         oozgoxS/tyzBGJo/cJRBlsd7qL/Oba14khvcq5rJ1CE/pWGf41VTdOfzWIAA+1nUR+cT
         ejCJpe4tcCy8VAZ5dGrxGpQ4oWhMCMnRcYC3H5BE8ebGVdHygcZrjylfMSA0Bjz3Zmrg
         Ko6Q==
X-Gm-Message-State: AFq9FYKa77pZuiPOJV4QBb4lRHi2ur85XrMHKvp6JG56ZKdn8RobY7F6
	reZCxPg62fvKI1DmgTRMfCXpGYFmAd3egobHgkwjsRWL3T3TMw2BRU2wOtdrAZ7NLAHHs8nGyPf
	RN2TQZ/azObrbKqQnDgRPtW94Z/Qq14NK65WKxtYarEHyIuyC4VsQf1sIcNo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fce:b0:4d6:9133:cfe7 with SMTP id
 5614622812f47-50b682740a8mr11235928b6e.44.1791911569072; Tue, 13 Oct 2026
 10:12:49 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:12:49 -0700
In-Reply-To: <688445fa.a00a0220.b12ec.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ace6691.8cdf6287.1eb53.016f.GAE@google.com>
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
