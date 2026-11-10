Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343683;
	b=q3w5C4uuQ/KTHdQFW3Qzmk9wFkEK/6cFY8/TDUX+mLnfpLvsDSwgGP+zg5o5of+Z+Nto
	 B228gT2o9Fg7dyUHbl+bX6reTSrBDsOLtpbKiEjZjhW8f4R0NQRB7XLKlrb0iZt94ovq2
	 FGHq1vfZYVy2U9+kXQLT3cDvF2ivY+PDKXKil60D8hr6CpXwoJm8w9H98rxaCtxBnfYMP
	 VPqFnqFP5s+7x8ucTvvCSi+7Fv9sHzAbRSt3FaiCrechKfZTFrXLsgmvNn2/TX0F0K1PP
	 vkZ+M3qqevA2hWZ969SP9HJ/Piy7mGWCP1eSy4FVDfKnvpJeHJuSlBt/a6vamJQQ8cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343683;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=UO82q6iNuDIraHALZoCBcx9Y5TlfaVRGt/dg0S5SmX8=;
	b=KbfuqVFSm2uDgoPLcXT8Wnc3vgL2A2tA8bsDBM8f3EyjrgUOGLrP1mgxGBKW3+T+KuaQ
	 QvKZi+DfdSV0DdpdegaNdTaIEGCyc7ttP/An0qsWiXsSF3HsLftBKaXpTvGALodSn98sD
	 LprAgCKlLfxpubHViOYnSegFDhGuNYDXXl+/gPPRSB0wpxVBtAKOJyh5oBhD/4kfJCYit
	 wc+DRuiLIhbpdHVKB5LTDA5uYzIlWWYHFhi0+lReyDMmIfUM+z6S/UtUTtFTasOMYfZBd
	 +o3WagJueaG/4t53RYS6ALamCpwgcFDZ2wbVDPF4ChTEUvc8xMNBFqWXeIWpGiNTVAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF8606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBF8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-547ae874949so3162425b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:48:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343682; x=1794948482;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UO82q6iNuDIraHALZoCBcx9Y5TlfaVRGt/dg0S5SmX8=;
        b=Txua2VO/0FG34mQrxyfcLa2DTwgKuFQkPPC/8CxaGQr6XexIUP0UOrjFVNLorDISQ9
         oOEfcdTb5TYEiasD4ILLsHiqQG5RFk6y4+RUm+dLfmpmftTkGeR4rEpxFOcCg+zusvFI
         cu+3nUmeqxW3Fl4kGnKsnfr0hmar7RPSXadlKJltvoeRen+GNSAwsPuhpIs8JBBd4D/6
         qzmJvzVOB17ylvcKIaFY/KpuJRzA7/gUpRexw01shiyXUaP8Nk13QhRY/eunuxatKCuT
         GzryED1YgwlnX94oo/W6++C9AsITQI+TP6hOzt+ruBc4OrgC02DD3kIU7rzxR/+ZJJYi
         1IxA==
X-Gm-Message-State: APuU4Z8HJzDH+VMvijynYRuNIfJp8dTiPHat0TJ5Im5oGXQr4Caq2qaI
	bP76XoKLowAJWakqMvWM7BbDqftNnGBUmQX4f7U4K78wBjzgK5IWxjDDh9HmmDytUgOIHYOu8n9
	LoPL7Ry4S9F+ZDtwHTSYv5FI0Ifeiqmyamx1Dfk8jYdnHiOptYNylLT1Bu3w=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0a:b0:4cb:f21c:a79f with SMTP id
 5614622812f47-56b96197d83mr124999b6e.39.1794343681880; Tue, 10 Nov 2026
 12:48:01 -0800 (PST)
Date: Tue, 10 Nov 2026 12:48:01 -0800
In-Reply-To: <CAPVpPLv2=M8PnxHs_hba6qEhFwLF7JOXyHoEWRk9ayVjwbmYeA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af38301.6ea51c61.3838e6.0016.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	vrpcloudbughunter@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: VRP_SYZBOT_SETNS_HOSTPROOF_V1


Tested on:

commit:         02e4cad6 Record local setns host proof validation
git tree:       https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-setns-hostproof-1110-02e4cad
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
