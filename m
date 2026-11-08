Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137882;
	b=tqWhlg1Cp3f3c7hb2F+2kbjq9/d+Ts6tYRUjLq0EeHt6uvTEVV2i5XHnEz5GF6zU5FII
	 VmP2J4FIfB81lb8G6ztVc8yzFSotAf3VGnj2QAOzSm5kkpYbGUTuteoPIAujeHxn4Vmrl
	 TDxg08WZPDqO2sURI+Ek91JDlFvkuE7OLSyrD0c+HKMQAQ+Trx3YALHIc3l8QqbWGEFRv
	 x4H0A8vH/cZbEpLvDMdTSg++aemZUB4Q/fpAyuZVkNCYouL14frVl9cgTtH+yDB3xUYSz
	 ln6KB2llFheVBWdgUcBzc4mSg6Wz8m0oSXrRI6n2JOEa+yuAFEjgyjE5WatT6iesrfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137882;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=aeLqZnp9/l1a11Bpvlag2NNd15Eb5k/MpOolGoipei0=;
	b=RCAxBYHhQiDl+I0UlZalWZS2fBM1e1VLb53G9kBclE9o5sx9BqxfHNn/P9udHKJdpuno
	 Weo9JGAJyrBT6tt/THWCmgZ+3OqXFxhmXA5HXkNQIp/Cgv2a0y2KbnI7evu70Vj8/zMVI
	 8sQLVE9gWZyTSyrQjjVB/rU/1P+T+age4X6Y1uKBUKEzYUZYWZ3YQ8tc/TuG71tqfE6ID
	 4DY0SXvu1USTD7YxJHBhCFoORrVMuGkXloX5H5sr3TeuEgoViDYq9cFOvVpNhz1H1SXqj
	 GqxeEDMB8hEG8lHoBcCGLemqSlmxoSJMnVSKZkn6cCm1J/0/G84qYhESxgczcBTPLzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A423606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A423606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-83edc5c5ae9so16874a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794137881; x=1794742681;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aeLqZnp9/l1a11Bpvlag2NNd15Eb5k/MpOolGoipei0=;
        b=dPCjUKDdDZDdlvYr/KdanXwgryPdDTlehq0ix//vSQlSEfWvu7xC+KCLnOG53Hi1+L
         xaLfWrM48JkHQPDtkQgoMk4c4moVDvJU85Llx48WfZ+gju4mrIcRnChn++JJqDuKV6lu
         H+GVUZ9ntLzF9j/5+Uq6pKKBxocFWwiatRzARlNX1wykDdnmmZrMTKByC0Ul0mzzlqIX
         lU8CQQSRbb6JSNC9JSVlyawzGA0Tj88eOClF8irx4BIMVRo9KTYaHb78ImZ6BAfLS0iD
         im/S0ZTa6HpqqkzRXOS++E415gix+rlRgraQDcIQhagpq6e7AEmr1TPZsbDkgzQSAjJS
         nxPw==
X-Forwarded-Encrypted: i=1; AL+hErG5L6c6duWVuBMc6dzpDjluR5Ay8pSuEc7Boiid7PIL+K6Bh+mYJ0pBl1qT03CpBmY7QlyIQV9gHM4RfaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/il7IMypkQujsZC32RqgB1H5T4Q51WviNEXBoqaNI4cmDXedbH
	j6iwYn1KnQ+Z8hZ0otnfpwPlLwPB+rMoWI0uSCkaz9lHy64/nxAUPToxZRBqvuHiUOxZsuj9dSH
	M9pPCjBNzHUl2itYTt3D24LvXCYnR+Hs5erA2r0FX4NOeJNGXnm6ZUWe12+k=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6c8c:b0:53c:5052:ea07 with SMTP id
 5614622812f47-568143a8d41mr872317b6e.5.1794137881308; Sun, 08 Nov 2026
 03:38:01 -0800 (PST)
Date: Sun, 08 Nov 2026 03:38:01 -0800
In-Reply-To: <CACbwGuTvOUpZU3h5VLw4aC=Kyd+CapUx8iuADR2Ezr+0aagHcQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af05f19.4dd4714a.f8d02.0013.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gbughunter8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: VRP_SYZBOT_ROOT_RCE_1108_6d3f91a7


Tested on:

commit:         62aaeae9 add bounded privilege-position fields
git tree:       https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-62aaeae main
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
