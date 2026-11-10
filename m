Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311103;
	b=emvuk5KjBw5AMUnwW5dDFe2KwitUprOuBjDQfiFnWwNvYCVy5cONRTMoVQxd22CnkFcY
	 D06YVvx0wsJBaTeoEKitSb3k8JIicfHh2VaO5k+PDQqXLh9mPXs/NYgJqQ+1IpXgieqp0
	 7ptVfErXQ/YLjS7qGlAQpt+d5ajJY2/syIYIDTQR3avDjexcWn9kdlMabdkfCD+NFC76Y
	 XE0jCho+eNSqUO6q6rdG4uBNsc8zC7D5CQy/33WCmhv98u+tUasTJwb1Y0BBC/iyjvg9A
	 L8sKHIwbIMsKJdYd8SIBSW7UumCbuyd3xvfKID3cr4DH1Tdc/AMrH3NYa4zavNgB70A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311103;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=RYJzqUEDWtsGI+nfyZTzAq8cC4CcMzGaT0lF9EZKres=;
	b=pCadDLMQD3Va31sGuIH3rHcdh/VO988JoxJCe4TUcqESAxi53e8CbbAJ6Z4zoyNuaz1P
	 NIaY7b4CYR4Z2WIITG670dy1mH+OJxDYgZgmZ1yLpnmytJI0+jm430NiXXet0diEQOp4T
	 YwAOj3mR4HBUqojloCY0MMtWIwmkfxCG6e9c08mvJGCnJvYWQtXbsQp5B3GPSYOB8JzNk
	 Jr4YMTyyOEhytwvlvV/9QCj2Ip9+japbVEv4bbOLwLEWLHS6rb+j2500t302hJeIZGUdj
	 aluTiuucXnDY0x5ViN0y0Sz4qGFfCzVCg97UrvI6iDOn04J8SD9zvu/20cAcv2CRnjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046AE606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 046AE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-82315dbce25so1217098a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311102; x=1794915902;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RYJzqUEDWtsGI+nfyZTzAq8cC4CcMzGaT0lF9EZKres=;
        b=XCvgczrLvsoJGlxeGdVvQ+lIpdxZ6HIgkp2avVgGUDimBwU8tDZnLJ+aEgtmMxZ333
         lzMsmInSnzM31EntThJe1HLLc730AxduS1OqCNGE3/0un+fh6dvgDC09F7MpIhA+4Dj9
         tbMBzcOaGLk21KdDDv8TKI1r8CcJthJPJND+qiy0vAH8HRr+fZ/39FiT0Jy9xgAewxWe
         2QbESFhXp7XobkeDLmZLgjLjJOtqqvk08MSVgtAU113DchsINutbbW/YcByrlqh17yVd
         c9DphQgl+F4oDpTJPK8vjyq2V4CAquNOiMg5bluspSlbvp7lvEmbuoEyAaSpDxia72/G
         yBOw==
X-Forwarded-Encrypted: i=1; AL+hErErvvfERGsdMsB7nl0CCkDjLV83g+FkAlbS7YE9sxkAivAtuwVu+qpZ6V7yqiIkpNS4RZ626IDtLauLTOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wy7x0Er9R/AhM4ly6nGtIsykTP8Y3HOsUpKWNcZ7lFF9zPNOA
	56GvxRyRb3QK5UTIoFKw3oRUqn/GXZKwlnW/uwmF84i03GXu3PxwUMbQOB14Yv8FRXXNcrRW8Fs
	WoJ4+oMlkbtffctQu2yrqvCo0WtoBQxMb9I2yAyWGjuxAEl+eXN7NVcE/FaA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:138b:b0:539:596f:6623 with SMTP id
 5614622812f47-5683ce0216dmr1598122b6e.64.1794311101959; Tue, 10 Nov 2026
 03:45:01 -0800 (PST)
Date: Tue, 10 Nov 2026 03:45:01 -0800
In-Reply-To: <CACbwGuSWJMhOGzCnQVQv87ofNg7Dej+B8w82OjZpK-uNpgWJoA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af303bd.dfbb089a.22147f.0b1b.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gbughunter8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: VRP_SYZBOT_CROSS_ACCOUNT_NFS_verify-write-a


Tested on:

commit:         4f0f68fd add primary-owned exact shared marker verify ..
git tree:       https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-nfs-1110-b8ee9ef
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
