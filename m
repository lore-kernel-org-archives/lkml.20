Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792469176;
	b=vIMnSUduqeFLI7Mli8EpffrX4vTMmZbZqyeIhhLfVFwN/wKoTGeO0Zq4x2DrL2RGQMiW
	 G6aPM3SfdgyTwdbuernWHFQFJ2AYACNvoWXDQ4TcZ5vpnXsAd46WmHezKy+TOF+M3toL2
	 HqMeeYBSfrMPuY8+kwKGSHSn9Rof0cbDV0dd3zbCcB09lZuUvimqvGi/YBpbGRgXorPK5
	 o0EG3kKr3iaWX5qa76gLGv02xHCcPvrADxo9QUqJ8r/C98hlaCGIkpxnc/8PP3intUXPv
	 0+yOn9ce06iGAd/7TsHqlYzE4nO5wrP8tPLQtuXlU5aerOTtA/2cANRA0KLVSpYNJ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792469176;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=X94iF6WQ9utJc+Qff8l5eUqC4oEFwLu3u0KuYxIiRHM=;
	b=nfaXRC334LBjRBdY1epxww38yXf4L1DH1w4EA6V9q9gPa7NkkhnKpTktuGwJancdpGRB
	 1ARXIxMp6yvG1Bn4R0bjeiRQHkjKLFmaLp0VkeXe2MRErYbDRFur7y1RflMNc03tj14xA
	 h8T7crBLiAFmnOcBKr7ZozQ/46H6sTNYnAbNksP05BxMAtMPzaJefsdfrjEY7RqOQpOW7
	 ncvG+W++KHZRzxdWWSkggIJuCS2N5DCYZbouADWHbsoZyOxnJzPRj3mLBl+Gitn+epf1v
	 Jv+bSd4hwvFLnzKKC77pdINm/sYSp89u/Virk2WBTn10m2Nfs2eAqUx7OoNgE0Tn6Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA137606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA137606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-815f2b1ecc3so5514702a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792469175; x=1793073975;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X94iF6WQ9utJc+Qff8l5eUqC4oEFwLu3u0KuYxIiRHM=;
        b=u6AAQvFNitn0zlPn3Si9P0zp4jm9Eukas7swzbHWzDRAW1pj6N3dbfdwphBwddy+Pr
         KKqXkf/rz0Gk3I1V8KoXmXvHHtUJNrm+gG3Ng7muXCiRmGJ1abBSWFgK2WLyD0V7tsN7
         bLnUgV4uD1NGa2tLshZRVqLxgS3OjeNZRHApYUqfiiUZGGdNBrGyikewvYJfgkjSNd0+
         XX6Y5cnmiCSGsApgu5DlCT0QNq0Vq6a9qMBNtMFJYvfUUuxOcY1PeiBmaNrsi/pWt52Q
         S5ySP/o1EzF8eGTA5dpnn8uYFXQbZ60I7ta3S0bNsKXl5dYjvNuc94D6+ay96uUOzTyY
         kusg==
X-Forwarded-Encrypted: i=1; AKwUvBx2dksqZE+ia78NW+DEfBIs+WzeT4YsGmt1AquUETCQDPbIiybJNHPT2jVbwK3JTMUNPxUiJfiiXTbOzWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHjkHkS8c06VlMqAifA6sftuSes1eFtCUrz5xt9xEbpXhaoL7s
	HYvZ0dofoZmAek/sBguRoKgbZhFS0Mv9arFbhIifMMGr3hWywBVl0iNLrIl61cOKX1sB9yPi6Uj
	SOEqQdCi+I1YOsZuODPnjCKHL0T25yP+QHPoVuVvYykjn5vZUGy5ySN54ZLU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1707:b0:4c4:5f5b:6918 with SMTP id
 5614622812f47-53cd1cbc0edmr7852445b6e.16.1792469174897; Mon, 19 Oct 2026
 21:06:14 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:06:14 -0700
In-Reply-To: <8bb0534e33a5f5d152d2b1768d1fd7c6@manguebit.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad6e8b6.f84f00d0.6bdd.0010.GAE@google.com>
Subject: Re: [syzbot] [cifs?] KASAN: slab-use-after-free Read in cifs_crypto_secmech_release
From: syzbot <syzbot+c2ec61adfbcb24e5ec20@syzkaller.appspotmail.com>
To: pc@manguebit.org
Cc: bharathsm@microsoft.com, linkinjeon@kernel.org, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pc@manguebit.org, ronniesahlberg@gmail.com, 
	samba-technical@lists.samba.org, sprasad@microsoft.com, 
	syzkaller-bugs@googlegroups.com, tom@talpey.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.manguebit.org/linux.git cifs-fixes

This crash does not have a reproducer. I cannot test it.

