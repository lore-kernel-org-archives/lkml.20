Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108466;
	b=gXvjLtyCWowm0ME3/wZBM8c8Di6zFlI53H/Uab4jmwfr5fHfCcWHEqdk4oMmauqfHeyd
	 F0k/b/udePLQi6EZhMXKGFtn2msmSQrA0lLJnBHqo8Xl94A/VnexBGjc2EMAhjLuELRZl
	 IDf87yEtvzR3aZKxVoj4YjF6ahDJKuKdaMhGco04HYAXjWuNUaw9fIQ5v26bIpJkvcMje
	 HfxzLxhqm75yGiAUtsitLZHyHg6akpoeK6uQpd9TNWgEDIXiJu3CZPjk0KXjAqiO31aml
	 qNHs1Wg+beydtw6qUUNZY26//ZMFymrqwR2d9HpmRfZlcw/dbOSula8zwmcGlQGEDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108466;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=+WVZITERpseEXuowlMAn428SGHSH6F/I+jxSn1rzuHw=;
	b=x7p5OTdAobZ3vHO0tpE+2mf5hrZsAC9/6x8CYQTlD7xPabnjLgpHTtO59Lkz26dPRYw6
	 GRsQBNOC4/2aJ0bKjc77Eebqz2gFuv26O12xIkx18Kn/q7rwxxVg88xPQk5DVDGxisJT2
	 duxJoz5Y2vAmouf3FifnvQ2Fas9o/cgrXNNg8nseKzmm9C6m8GErHmAX7Tpoa8ss1mByL
	 gwQeiBNrB725HRT+LAKcuobqLgvNm+RXInNFqqlRMUlrhIvWwZhhmBAxVAJ6P+qLVo5ok
	 9trDP9/I+6J7vkR6U7XF6e8RTb9WlXqtjMo6wYziJm/sq9tGUShpIRLApEgxWpph6+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95F606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE95F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-55bf11583d9so1398072b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108465; x=1793713265;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+WVZITERpseEXuowlMAn428SGHSH6F/I+jxSn1rzuHw=;
        b=rr6SwXbUfIG/vYMXrYB9b4ixm/bbStjVnk6+f7P0Un4w9kl8c0VEDjs6Ym5E+qn2BW
         7keubr3jeIOGsdt02pgfjGad3DJd3KixnwdKLIlwYlK9aIMS7pzCWCsPnYPZtQ9AHrJR
         6u34vLDgD8zM69HECAr1T364kNDNcOf95Xvesux41VllqpNXRc9bL0LpV2aTui8VD9tv
         kbgG3kJ7zvI5PJX3MbIYFuMILp5iOM+z2iuNRLK4BX1BC94x2LE5H2e9WyR5RXauTyXC
         ndxHdg4DWGJAFRjUVMjWPhl5+ej85A6pCBeHTYw/b2yJydJOrmniS3BQS1uXTLtLfTKU
         jH/g==
X-Gm-Message-State: AFq9FYKO1jojzYnq6arHBkNOlPwStIIRnrcqLV9cW7c89fU+8qYFHkSH
	hwVD6poRHLokaXmLXjJ8rO+5Ekq6ZQ8ZS5M6tDi+hc5S5DPfuWfnv5UPTFXFFAPEgv+ZZcieDyn
	j+q7uWZtTtcINQABqD9iDvYhy8WoOG2s4ZVtKnX+2dm2t7kCqmGAwmoc53K8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2391:b0:4a4:989:bb1f with SMTP id
 5614622812f47-55f6c503dd6mr1320663b6e.9.1793108464779; Tue, 27 Oct 2026
 06:41:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 06:41:04 -0700
In-Reply-To: <6ae09413.985912ea.1e5798.00c1.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0a9f0.768774f5.3237ab.0018.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 d135ab453a7400a34930bdda1ef4bdc8acfac80e
From: syzbot <syzbot+64197f7577a09686ffdb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d135ab453a7400a34930bdda1ef4bdc8acfac80e
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d135ab453a7400a34930bdda1ef4bdc8acfac80e
