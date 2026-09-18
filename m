Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EF7547054
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714927; cv=none; b=RB+nuMnvC3I7EMbEkvTyvPSHCVfQCchnUKNd9OEBtncYLSOFqnTLRwJNHw4VSnRooyusEiC7bLuGUcrC8v59btpu0hfFKF205OHuwRkO34m/mG/NUesTtxOj9fonaxpybouw7xX6bS2KMX9q9JDM8q/sWzRVSR1upiJVLdVEuvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714927; c=relaxed/simple;
	bh=h22l0pv2pb/KjjaFRrpsnmoGoWRnymASbIZrcENzQu4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OUx/D7p5jXlJHQFiDt6QZjzScN7xspk7Jd6mch5Qyec/PeetTIGAyQzNOUac9+BjclpMDpGnoIMht8wOdsClKXFomUphWS3IXMJ/fp3b7zY6k04wa3fDl92oBypEGfy5FJpl/qmLhc0geMJjc5F4voUUyg25hMHXYoZ/4CGGijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b5bfffcc2dso396545b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789714925; x=1790319725;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v8ZRRviEo0WCd5AjsbtzDm8gtn6BQ/eAs9L8QSZagyY=;
        b=FW8S9+OhJ9uhTT1w8wPAVP3OIVkgot0n9kxP3MxuGav7mmFfCg1CH36wD34CzKiQYH
         0Z7V5TepHKyeGuEFXu2bk8gFcq3gvrZ/oKJmw156FFdPS12Qj3vWvz/AADYTbaLdWQgz
         2Ju79HRNeqK3OjvSp1BTZhWmKEExoCp7dPxoXr81mTpGeEqUtpHNt/S9FG0xUKIS+us8
         X1YlGZmD1oGNTzdMPzdtTKylF20PsSv6c0DaURhfatzQKivU756BfY4PnL6MRLqXMigV
         Yaj+px1jiIfhiDi8YfvTJt8fczDbQUOWsJBCP/L49rzPQKPI3a/fwWCN++i9C0CQD6Jv
         WkBQ==
X-Gm-Message-State: AFuF++mdDj3DNCFoUStbdWyXBFb1MPHtkFJ2gPt6L8amr51Z56BBzhDV
	X8ckQfMk88WdUdUIGmCTCxurqZ3RBVgf+GuE8EnElYd3Yhjpa17qdYCSAW9T9tzhZa2GRObJbey
	wNnhJ77yFQdBAHgA9u6XM/y3dHMHggENafyh84QKnjNB+el6pDDiR8QbaABc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13ce:b0:4b8:4703:db97 with SMTP id
 5614622812f47-4cb6af29710mr4554985b6e.32.1789714924994; Fri, 18 Sep 2026
 00:02:04 -0700 (PDT)
Date: Fri, 18 Sep 2026 00:02:04 -0700
In-Reply-To: <20260917203850.753752-1-shaunakkdatar@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aace1ec.87c06881.1db2b3.0020.GAE@google.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=13d307f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84649d3ff8d550cb
dashboard link: https://syzkaller.appspot.com/bug?extid=1aae11dc8d42ec1a87ec
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1691fbf9580000

Note: testing is done by a robot and is best-effort only.
