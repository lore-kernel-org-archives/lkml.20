Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686603;
	b=HON+zjxaqD6SyZQ0E609UVCzF01HV/b/WdrO7unLlC+5ERtHzIJHQ3UzWOVVJ/UO4RpW
	 vWLji4jNvFVbaTGJnCsKjfrYuhqFK6OEmEvXDNWJ/hKNXwTNIKvvWfOHC4TjXQwua/t0m
	 7SJgSKsD7tzOdzVCuLIsvOsMKGFR/1drIRAAAXQy8nbaWGl8vw2dpiTxtqX9kC7Gnkl2n
	 HSQbihVRvb4hGDORqpk0rvEHb2XEpIvV053k4g6Z6Or4JVsT820kNqHBHKGwQLVV22bZ6
	 x44V6zwTVQDdjl13myjovJk3KBWQFQ0uIXvIRY/0AW33AesopOB6+1Ozl8LIzsy3PmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686603;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=p5kRDgeTvfe+gU89RQp3snPJsQI6aii5+oQzcmqDjd4=;
	b=RBrUt8nuKgy8Y25c+WIIRtdaRtkCJ8ZhjjFeIA0DWInP15ClNfER/R4WCIGBqH3j9eSu
	 FNpQQofyY/0+1O84s0NS8m0kmMARzsTrsrfXd6l8AEhI0Ee9hy70OiHnWVS2xlfYKtgrQ
	 F0bE/1akrOjXiQb34Oa0A7Fk0PzvLVQSNAFNlCZYKtIv5bKyZ36enFTVliVgfTO6XD5Ep
	 hWvbD/juAOfjd1M+M8wIZNn8ZMNpXeHuRWj8BXNYdAt/v4MJ1aYB8o0e+tyVu5R4UpzzU
	 dxTRJMRbImqDbbdjD1Fkyo6QSeEd8brpl84IHljml5fxQjh4Xq3tPMlfE0p9Txmh3/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0887606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0887606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-843cf077bf7so2913299a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686602; x=1793291402;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p5kRDgeTvfe+gU89RQp3snPJsQI6aii5+oQzcmqDjd4=;
        b=ps3CdhowGBrlBZnBVZKGb/psufPJSJfc4Swy6X/5j6AMRMRRkSZsHGAdjkeA93BZfH
         QyUzEge6x8xIXInV0TUDQqQheuNrnP0lKB7t505kW0f93D2JzFRCmyx5M7hJW68gVvib
         pUo7xFrpygUQfZbUwPUWeBUQvpNuc8CWk2Jxfq7DRT9ftG4xpMIOdsmw0tBtAN4K+tp/
         FSgpSZnBlcT1BaTfACLIbEg4PvlcFV42zY/FyqBHHVKfPdEXDacI7d79EY9Cw1Ayyoni
         TyEuI8odxaCi7Hq6wQzRpoAJ/ALl36tJLAzypL4xAFKnqutUVgMLT/xxL1holRowoARl
         u6Nw==
X-Forwarded-Encrypted: i=1; AKwUvBw6vbs2stP+Y5EqvtBI7lA9fElHF2V/HlmeFc17EVedrs4mHlh9KasUHzE55aRTODlQzT/oOtBy1IKUo/4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRDLKRzHHVBQQY1NAUziyblQ5LsGXgrOP7a5NSm6qTwb+FoyXd
	QESnwg3Yj/KId+IBgY8+qKgih7DzBTvdVd1GH2BxSMN2MPi9ExlfZ9m5NAJNOzg5VU77qt3u0MZ
	NoJLeYYwee2pU/O1DUlmGLiAv8a/XCGZNRfMBUfrB3hiMe+1RWmO5jG6XqLY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5147:b0:4f5:97bf:e56b with SMTP id
 5614622812f47-5535a767efemr3861350b6e.17.1792686601788; Thu, 22 Oct 2026
 09:30:01 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:30:01 -0700
In-Reply-To: <ato0f6AUVyixt40U@elm>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada3a09.297debc7.3b379c.0009.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in md5_block
From: syzbot <syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com>
To: code@tyhicks.com, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com
Tested-by: syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com

Tested on:

commit:         8f6626bd ecryptfs: bound session_key_encryption_key_by..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=1793caa5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba82fafeb7f9e7f0
dashboard link: https://syzkaller.appspot.com/bug?extid=03c68e42ce4b33f7ce9b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
