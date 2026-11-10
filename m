Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317525;
	b=W5oKrzHVZEe2m1QnxJkLOM/VJwbFPXUhN70qrHAFJRxHS8EL030Msbvq8tEcRmN1Alcv
	 rpKq/LHucFKM/+OYtj2Tff6sQRfRmTwrQH30dQRveBCIRHX4x83yyFKOxO/fLvns2hJTF
	 vRO60czrhNtNeGeLQoWNNKFpyGCypHP6f61VDU4b3wnR+q+kIdv11K/Saxw5KKhW9P18s
	 k9pgvPkvELEjpKyu6iLiSGkeHtVQwX4FKoaDz8oG8K/0yVH4uUkLOyU8yoZUbP62R8Ig2
	 kbZgQ/F5HRLEsy3zcznO9QwgrotZZRPW/U4MhavX6OJxO/xncGPNrJAK1bMl4EIbCYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317525;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=2I43wIPgqT/72vc2kja5giUsN0j6WX0qKK82wYkih1c=;
	b=oZm3cXJc5OTkdqs019UHDIjU2QosC/cSW1Q9R0ByOKqbVmtgWOF7dVstoHuwpe+m/dGF
	 dehPS0dQLz9A/JoUzfk2F2NHvlO1ed0h4PYhxQHfWA2nnqB4Wyr+gVRxzfIXSknK8YlZP
	 2vpsnkQrSxSh+9GRSensPSTmW6dta6XCzhhQOZGa3jbz0cxSD+qU61vpv3ly5O18F5Z5g
	 q4GHovVMUXL99B9/ppF81ypxdmbWGm713ImzTxZSvgB0dwA50rtciovcKdIqmYzoM8DRI
	 C/HMMjqD7zCm3X1w5UV0KPn1LMGq3P44pUOvh4KSjMUa7816Hs/clP6Cm9uhlOFxGVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D88C606A768
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D88C606A768
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5384e381fbbso1615819b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:32:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317524; x=1794922324;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2I43wIPgqT/72vc2kja5giUsN0j6WX0qKK82wYkih1c=;
        b=gP3phLzNVFViQ3Ya/mjX9veoSD7ksjNXD/WSe9KYI7YC5aV0Vwv8sUnOsI1Q5IOfrP
         HpZuV1HODA0MFwRkbmdpGpIkPUxhKk1SninfdeZSwM7ZP/9KO/vl9OKRvloTvxYHvaL1
         M9j+LDm0SjKzlgMq4H9qDSE06F5WCIxNb610f+l3GPQ/RDeufIz3VBwPYaQ7tC9Hgvd3
         MMnFe5kiHwTX9DLy/QA0TzEeT493+6YP8d7wCOOYhnYfWOYLxtx1GhQtPdB1e1KSWDS4
         baiiOGR+lGAZOmes+H8oc4dkQRKLfPiKy+uLe65LdbS9YLmU9YpgCL88h5CZmDK17kqG
         F3ig==
X-Forwarded-Encrypted: i=1; AL+hErFv9Eagz4y136vZiR0dmUACRWyoNilHUHOL5H1v5/k/wOW2/kOd04EBnw87pb/mmEls8oh9XFOtcNWBKrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1xDoURCgoQNnGb5d0acyCC3q59PU/izE5Vr7S2mJwqG7syfeW
	ZrJSkK8jeu7DjnfS8JbkdzqKDxI1UmRfutIRzMJStF6GeEPsWzRpsr7NFuMfSRhGMRjG2lnPiai
	j2D5uyfUR68xYzQwOy04mlm3w8/4Fvr4vi8dSss7P/XmiD6a8kPLYeRy1KT8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fcc:b0:4d6:90d4:6bc with SMTP id
 5614622812f47-5683cd3d91amr2543238b6e.46.1794317524408; Tue, 10 Nov 2026
 05:32:04 -0800 (PST)
Date: Tue, 10 Nov 2026 05:32:04 -0800
In-Reply-To: <CACbwGuQHE4h9pWATqoebXfj40irARjBYLrV8j_raHiTDS1upUw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af31cd4.4e78ddbf.1cb0c7.0005.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gbughunter8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: VRP_SYZBOT_HOST_GOOGLE_CHAIN_F185C233


Tested on:

commit:         7e78fd28 rotate owned identity matrix nonce for retain..
git tree:       https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-host-google-chain-r2-1110-7e78fd2
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
