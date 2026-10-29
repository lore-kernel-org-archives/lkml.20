Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272864;
	b=nNi+5JB+c+3zHe9RN0ZnapVTyTG9E7275zMaafPe+c+WDeXK5JrlZqf49+QPrd7FKXkS
	 3+PTFGR/drAcoZx+8ay2AuaXvKVknUtJPBXRQV/YfKL9iBRiAMA/SEeeJNVACt0QKyhqm
	 LqP1fipatildiWDL6IE1kZlxBNqXPImh2Xm1RL15FCwR5FYIEraFoIcsWNX9GSvb9F2hX
	 q2bqQEg6oBjKjGMoFzdWswUmN3FPXIeGkQ9icU+N9l3jcoBVcR2DZxPnvoFTRSnOALCEq
	 fDQX9hO5moymw8UNFIN2s6E6LG1hvR+aY6eMhpNJXaAcahw2euXjWxE01t0ixWCZiaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272864;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=4p4/kFrkyHUIINWPNlhC9AOVApu9Y8DvELY0JuflMMY=;
	b=4cVc0zwFFHR6JQP+Dd+/M5kuDG3gawxOk6oq7nqiGUO9U1KrDiLiyrY3E8j7XZEue8Lt
	 bS3Fo8SYlfPALDAXzta1iB53NP9w3B+Htx2B8TnDXvW8FwQslfJyVX+9Sq1+TBruUCkQR
	 UDk1L8QBmHeAPFJXaesgQXrzJiwKxsLV+tS2JRaAFw1KRXnlh7Px4PAE3P5hIFpL/dOxq
	 /EcRaIqVAXOKI9sTYw1h2ySSEP72rpr2GR4RtFnSrZ60c2Tab42+1KPpliCmbd+J7hJGr
	 jrxEA2Jq+1Fl5GBkpO8u0Mf0FCjDQeE8GGFX1DEbAHJewXGJ3pYR+souKQnqQPX/wpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3F1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e9eso2625614b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272863; x=1793877663;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4p4/kFrkyHUIINWPNlhC9AOVApu9Y8DvELY0JuflMMY=;
        b=c9b1fYyNkGKW65ET2xqluvutdsQo/QBi9xGVhCvfisow7v1Kmb1z1RhRVaA4W7jnrj
         chLJ8BX5zVyb6d+4Lf0cSndBcO4HM05f/bWNL2nXv1VlTxMYjr80vYlAl98V6OXkCLwp
         OBttYaN+peOH5cp5NXe5cCxqsuNUTiC0GuTnyDd7z1QK6ohWcdqyEMug0WieHhx+r1ay
         2wAEtAu1xGn+L63I2l6df8qLYNNEqnexvQ2OT6htxwBF1aOxAba4+0nlaBhn4vsR9PmS
         vRRZCJykYatSL3KvNKOv220ajjLi1I14et0QVQgyzilCDETZyKqnS2e0WR1puQPw5sO3
         Ny3g==
X-Forwarded-Encrypted: i=1; AKwUvBwLiSCNE5gqXM10Ew0bFyeXI4sc258IPKdw+oszt/ZbnvBW0+hJLMTJSje/Ip4dmpb2oS4PEXjUBh7gwBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyEQnEFPPLdB+kybvjwPfEkDbI3vqDD96MFyM/94MDnU6FDFvE
	Tr4qqvODMWUVqbWpA+YqMnuPkd1AYK8HqZrJA1QNhBDzt2cDhqBDgHOSVm1Rar8c3iK4j32tmSN
	Pv4ZSawP2LgHuGbnl24ECZAh8jz5q0gaw06zG7wFZ42Vs2jg4Y5ieBsu0t/k=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5394:b0:4d5:27da:a496 with SMTP id
 5614622812f47-563830923b6mr3557264b6e.48.1793272863342; Thu, 29 Oct 2026
 04:21:03 -0700 (PDT)
Date: Thu, 29 Oct 2026 04:21:03 -0700
In-Reply-To: <CAA=drAoyordgj03YjOASd3i9PYVxT8dmMobQWTyTbhmz5A37SA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae32c1f.aa6a6ce0.47d1a.08c0.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in setup_conf
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: google-kernel-team@google.com, gowtham398gs@gmail.com, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 11



Tested on:

commit:         c339f401 Merge tag 'platform-drivers-x86-v7.4-1' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=129d675874dbf896
dashboard link: https://syzkaller.appspot.com/bug?extid=75f49ec552cc74d9d69b
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=125bfaf1580000

