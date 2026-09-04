Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF2D3CB560
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788494092; cv=none; b=A3S2V0oUL/uUxahsGA9DugpdBm54X4ho4lb7n+N2YWiI/B/5BlL7KDGAQqA7sf+XHwD1v9SyyHfPGwsu9QKJraknf+IkB4eO/4q3xyJK92OPtH70+1D/jHHQYiTorS/GSuCczVAJzZyYbqEFvcul8HlmFe19uNLggjCxo5e8qA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788494092; c=relaxed/simple;
	bh=cOSvrT8OwNSAKwOpkrHuj9mgUaRoMHev278SjnGB+Vw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Eb3lGz8yPqji6u5as4NyPebExy5sELEorkpFfivf/o4oLUWQ9cq+VzItOG0gCm5chH0LGMsbAMFJzLFuCPYp2zhgC8UGdXY9+h0DuLnc2DZah/7NNB4MdE8t8hadiyB5MJzliTI58B5/Ti4kLBM07lMIUIu60+pnzXXVOqSLgAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-464fb819ac5so540069fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788494090; x=1789098890;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cOSvrT8OwNSAKwOpkrHuj9mgUaRoMHev278SjnGB+Vw=;
        b=eJRiaM8SwnLHMu03qUG2nNDrm8zejv66h/lkMTmi8ts8OVser16OzJagId1qMaTGU1
         eqkdTIyzQW/ZxcQkMqjOZVypMv6YcAluIl6597fh8dTrX+iapsaWNDc+HISO6WeWhQBg
         bl4OpcrfEr6JwVLLhKMJBu5akn4N9++GqZ0brZh+gb+jGSBSiVPMXEtVXavHOa2EUWAK
         5EZX7rpsh8SWxUiL0O+Ns4yYyaTRhdobo8E92GTVV4Q1NgMp1LHMURB0Q0k4p/ibuU2b
         8U+VCbB3c6q2lQFZDvVKx1FuoCCDp8MxTwVVxHTkMoRVvOsDwXDVxGrX8ykXXIZEBFkW
         4UNg==
X-Gm-Message-State: AFuF++le0B0CAqrQzGl9vo8ABHya1bLPjChTeHmmUem9qu+eAD9D/iub
	l9b4b/F0zHq9xA6aRCSU5ERO2wGZsndw/+q2kTZ7GozaZBslTx+yT5pSliEk1t1BVKNxTsdFrq8
	7ONdU0dVfkuDQTql6NoEurcUbmy204g+322//YeMlHe02JMIQiR2Prz6yXD4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e905:0:b0:6b1:6f3d:2069 with SMTP id
 006d021491bc7-6b6fafe04e8mr2472507eaf.10.1788494090539; Thu, 03 Sep 2026
 20:54:50 -0700 (PDT)
Date: Thu, 03 Sep 2026 20:54:50 -0700
In-Reply-To: <6a99dfb3.9266084e.bf0d7.027e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9a410a.2e567484.299ffc.000d.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [media?] WARNING in cx25840_init
From: syzbot <syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [media?] WARNING in cx25840_init
Author: m.harisawan@icloud.com

#syz test
