Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350144;
	b=jwfPhIlwrf457/XUI1jsfqJUmDkK+5BLfKmRy/TrzOIb0gDx+N7O4w98TgTUBKTByD0Y
	 11PFKZ92Gm8sXS0GIr13Y4f59w/+6GO737YIwZXEmmEYIJ+draqZKBT8V0t4HiJZKy9W8
	 a3YbtRkWckjtbGTSP8YGA3nmqG0JV5KtSVMLHISVQEf3hDLkreVRWhxFLrR0cxJzy9mN2
	 QxDO2nCpsqmqmmRXl/tSmvP3EC89CbGe0y728pb+WynoNy2RPCMSkFZK3ntizqUOvdGhg
	 ASriEaeNYa4H12EbBXbxODMFLkzNLwmk6fA8efCuF5dfPYCK3S1n4b1BbMGOUzgznoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350144;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=uFqBBEwOWl98ug1TqMQYwIz6t+F2tyQFk0IyQsWt9qA=;
	b=rvbfjPepSx8Fp4xg4snqnwMuo1+/LJ2e2MGmQiNfXnmEQ8hiummsGG0SRmH9QGuXF+uI
	 8KsLw6pQ3GMm6c5zs8ZDNV9ATzWOays8U1MK9aVNnCQeisL5Rkh7j/Aty9gLaEc3qDUzv
	 chT2yD3c74rEUpI1rpqkfu+GGiMOX3m0rb9iXzbQLWn0fYV+g0+3i9O+AGphzOPn6vYqp
	 zH2glroOFKQ0VCOQioQgGiKD+hxEtwkT87W+zCfFBl4VOfXo0pE8YUJKD4ZV6DTtISFAF
	 r2siiLJWwXcUwXbi92CvQmbIgNMYdZgfYeLHAYE9mS6toDyVYWS6B8LX+KLN+54YWzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A431606A326
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A431606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28deb7ee3so609431b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793350143; x=1793954943;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uFqBBEwOWl98ug1TqMQYwIz6t+F2tyQFk0IyQsWt9qA=;
        b=BhEEBcfo7GuJ641GUP9jlP+u1O2lQ+cXdW19cq3mPEm8gpTOHMM1TVrMFNgpsZ4Egc
         vzi/HJx5/k/z69N71bROyNiGTiFT13qWTY4qNv8dVdjW0N0XROsLV8KUAZa4L4HKPAVx
         FCdjexTRMfUKSh3sVFCtdjDfT0DR8wkysskfjNvk/BBumzPQz+UbHoPdaFniVeqxD+Er
         W5AzsIVRLldUrf6sh6tK43HTo68+DoIYq1deewAuxASn3m5YDicL0kFq+LEiMH75IbuH
         oCO66YvK0efKdaevmOGWb6MbobXZO4Fq+IHbVVGDFYMXGlivW8aOrjfqpgir7+WvQcHO
         rGbw==
X-Forwarded-Encrypted: i=1; AKwUvByQZwS3FkfXc1J6dzuaMTE/bdBCvFMOCdEyxB8ZGVoN8t2nlzu/pIBh3jObxzl7s+zVnu4t7zBENg+NG78=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBNVV8du2Wg+OVT2wMxldLWBDnhyOEEQj7RwFGPmE0w9T9MzgY
	bvNsspEObU2gN/yUlNKbFHDlEeMMwFTmFfCmq3tSsU7VL0Q+SxEkYqxgK7jVJUBkrpulDHoq5Ik
	KOkJnBSulqqY76qq+GvoQk5I4fgLF9NfymhNKiSMy6GtSDs0lKGdn+74xAfU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4487:b0:490:315d:e0d5 with SMTP id
 5614622812f47-5640dcb6f71mr1007391b6e.16.1793350143466; Fri, 30 Oct 2026
 01:49:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:49:03 -0700
In-Reply-To: <CAL4WiipBVMi_fiSQVUAFxqcPVc5jR2BswOwA2iNmGFYE_sbyRg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae459ff.f57e0135.1770dd.0078.GAE@google.com>
Subject: Re: [syzbot] [net?] memory leak in build_skb
From: syzbot <syzbot+a3f21220cbbb6e14ee2e@syzkaller.appspotmail.com>
To: andrew@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	jasowangio@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, steffen.klassert@secunet.com, 
	syzkaller-bugs@googlegroups.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 6



Tested on:

commit:         d89e1d18 Merge tag 'fscrypt-for-linus' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fbf447a1375a1948
dashboard link: https://syzkaller.appspot.com/bug?extid=a3f21220cbbb6e14ee2e
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124fcef1580000

