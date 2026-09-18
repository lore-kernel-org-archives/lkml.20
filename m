Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A9935DA41
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714087; cv=none; b=CpsJgbsNwuXzb9BTXBs4P3Vq/Z5cQ8i1oHffeFgXUnWFC3bcdA7aGkri0G+vYB42zqqnjIVbXo3XV9rwEcHur27RDtDoTao/wwAJz98ts2vO3NAKRi35tVGxTK0LbojKg5iMrtsPIG5ibsUx8cLEIAE1PbA58+UH3nu2oJ8OO0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714087; c=relaxed/simple;
	bh=TUbTfKsbSYMrEsiN1hxbJRZXndS1kslarVQJ6COzQyU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OaZUbugQ3deIXakJfoUXFTbIy0hARwYHdswD86vuzSnTlgRCRux2cTVXV/0C1vNma6JRCefYGWUs1YcWABikzUj6S008YZeSmmcLtsCAiSXkqpqED+MAMAY69wKTne9T7fJYPV90HL4mj8h2H71OAkBnoOLBPVyxQGes+Jzx+I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-448d51840c4so535733fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789714085; x=1790318885;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=69UpKvpEIv8qryiMt+Rctv8OVcq1tp4tlnVYx4OwloA=;
        b=JUQBsOqndPiiwpwiNBSnkE6JrIxlSJy/yEoBF6CFlgCBAZCJshynhOdfrt0FYE9tRN
         1n6Moy0bj2uU3WDQ94KSnoh98zpU6u7O4pMQn8Uquq5fIMQI1XFHIPlwK1EwMhnVyakG
         VGICcqrOINBxaw5qmXYWrGPMIWgBLm4IDxrrnbbhwV4Ylau1BhOp9zfgX6ud2BkcB+PH
         P2xKMUDE7CPQvHgjkBjHqMtEN0bzDJgHqQ73wAy0lHuVx7KmZgJU6OHG39f5OgVoopnK
         zUnnv282bPJFoP7JWRFgt4yPnSW/1H1Y6CWl8/h/xS8nPf918jqytXtWJag4V6gl+TbT
         HOZQ==
X-Gm-Message-State: AFuF++kzLImCcPN13+uHXIAWqfP/vcv6tivYCAsUJ+x9NbHqiYqUbDdU
	qUCPx3obYxDqXgUP3wSvlSFUJFq5SlJE1O7hD2OaCQU43Uza2qXvlBGNCFUD0yeg+fEUaB9+fbr
	NKdXss7v6QCixiGLu6aRfnXz407glv3+77RQAxUURZqtBc9OrQW98rqeNPPY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:161e:b0:6ac:98de:f087 with SMTP id
 006d021491bc7-6ca9a134493mr1428835eaf.12.1789714085249; Thu, 17 Sep 2026
 23:48:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:48:05 -0700
In-Reply-To: <20260917203124.753286-1-shaunakkdatar@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aacdea5.b398a7c9.1f86be.0030.GAE@google.com>
Subject: Re: [syzbot] [can?] WARNING in __netif_receive_skb_core
From: syzbot <syzbot+1aae11dc8d42ec1a87ec@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, shaunakkdatar@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1aae11dc8d42ec1a87ec@syzkaller.appspotmail.com
Tested-by: syzbot+1aae11dc8d42ec1a87ec@syzkaller.appspotmail.com

Tested on:

commit:         5dd1818b Merge tag 'for-next-keys-v7.3-rc4' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1424a915580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84649d3ff8d550cb
dashboard link: https://syzkaller.appspot.com/bug?extid=1aae11dc8d42ec1a87ec
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10dbc915580000

Note: testing is done by a robot and is best-effort only.
