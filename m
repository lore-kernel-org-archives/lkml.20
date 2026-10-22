Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671120;
	b=Xra5tmCNarayTlurxeJpquP3/AErWlXr0XS0vnEmAyWCPifn/w9gKAbydK7Hq7DkmFhl
	 s7G6EoUYOKbD0AVV3ajdcA3oIKUkrHjRM0CZowMoGPIzLUDSNNpGKEk1Rlrjabeh2dGDm
	 sY/BynlVSn+fSJqV1tCH1nDSh0+SDuH6iytTIDZpBtBZkiGBzH8JiFAM1PB+w4nrPQMv2
	 libp5cqBMgxpoFAInu3/REe4YGZJlqNkgpHdzyDKcNF6EmpvLDgw5Rj0d+qPn4ZzWawoy
	 Du818oypowWiU81IfaBoH+VLjb/3cn1Fn0e2kONYdpB4tsjoTeDI4SkeK4GxI/lXQNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671120;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=BlJmxT1VL/7xfsSa2JU75Gql57GkRUZ3kJZ080WKl1Q=;
	b=DeUQmSLHRTWp6lSkBR1TsXcNQVbH0OPaxufnQ2/7Rdqhhm+HDPBrTEez1JJdW/BJ575J
	 8spA+1qRdPV9OYvSqDdZRizHQ17dmZi6oLBz2DNMQRh02xrury+XY8F0h7wsiJeKLVLO4
	 ngoeOhZ6xeRysCXeHidcpY6pAlxJQqWwmPSQJhAg2ed8+bsq56diSucEeDN5bqXnX0pl3
	 VtvKTNxfw244h9uW3sEMOm4iRVXrAh/wOBt8ZKa88Bzt3Z1xtvRxI0Hlc/RBGiOk6vJBA
	 EjQG3w1ebO+HXYAEEEm9QbizdQHJdUzZQ8gGMkjQtS37mR7Pp6eHHtPZ4e0jYRcoJSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C6606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 728C6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c467e19391so2624839b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671119; x=1793275919;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BlJmxT1VL/7xfsSa2JU75Gql57GkRUZ3kJZ080WKl1Q=;
        b=AH5eJ4UU3oPt6RQjiDvnu7cA0OPwqk/jNeoU6XcIgbvRH8XSTu3fsa7B61WaDfPAcX
         HndMLzrptDKUsywa+764h9JNLU9uRchqvURhbRq5tveeh+s/OY3lZaPoSTIIGcB5rsUU
         KFG7MWW0fPQaQE1LRiwY+8UcO/Lgp8Ms4rSU8m2Tk7As2V9m9yHH71DGOYhKhf9d69po
         P/xg6cOT1K341luH4mVpZLOOHAXUbnlpbhaH5VhU5gtHiCBB1c6RnomoJQIxt5w5zjT6
         4/Yo/ZXlZEklk6MLP2lJ0lXOSCseN8HpxcvMRx30C4cjgiNYX4VbaN3Rcu4ZyP1lx6nQ
         TElA==
X-Gm-Message-State: AFq9FYLa6Ye+7iMJPLvBLvIMpNuyBtPi3chfalt2e/keZy7vwMOQMkNe
	w/jbNN/4pFlZGNR4yNwACmf8fVFPpJn1AmQOKW9Y4K/87NFucrJTyAUpoKFOzkgjw1hXYGM6Lbk
	/9esYZn8owsNhAD4rdTtScYlQC1KLmvkGVd0+brSTDvx4hjbsGm5qJscdEf4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:221c:b0:4fb:a089:bf26 with SMTP id
 5614622812f47-5536017e84cmr3805057b6e.56.1792671119511; Thu, 22 Oct 2026
 05:11:59 -0700 (PDT)
Date: Thu, 22 Oct 2026 05:11:59 -0700
In-Reply-To: <6ad958f5.16f08417.1cb7b7.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad9fd8f.297debc7.3b379c.0008.GAE@google.com>
Subject: Forwarded: media: em28xx: fix refcount underflow caused by em28xx_free_v4l2
From: syzbot <syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: media: em28xx: fix refcount underflow caused by em28xx_free_v4l2
Author: neganhat@gmail.com

#syz test: linux-next 8f7df005a756
