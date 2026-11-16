Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794800028;
	b=1Guzv3zbUrEOL0J3WSatqqrVBhpa44oA2PwJzAu7NzK/dL9V6FOm0Oc+mxpRkDkHnC31
	 D/dTd9m3tzXHs0xHF9ZY0wj1ghSuyq8Ti1zefi23zsTcrfaLeHP/Dm9Txl5WOf+mPj+I+
	 LaBoPQHJ1ZtI36XhIMnbFTl099TXBLcaIFREQcV+lPC3U/m7mErrqtTm+HL2fQ6sAdPKc
	 ZrohVfaFIx5xSUHrwe8oDWGRubf2FGUOA43x6nQzJ/SwTmxevClJCVPb2yXTZ42UX+dJO
	 61426QUbNaudnEDmibSsclCeb3RzcKvsIsdn2IBB+ly6AcRYNkUb8q4pPAtYu+g7hdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794800028;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=B45yjcfnptlnlcqmNZCy5HK17otolp55BP0zobTOdGA=;
	b=c2k6pYKqygW4qVm4feq1Z2vwolchyD/9UDOAsthmiKjR1Ni6ev6vx6RwMptM7NxEnNuj
	 yqXNFb8DHkuSrd+1WBU3GvTdGKbAqvXNzEutZH5D5q+Gb+R2haQoJ25dKmTs7ll9zQA8W
	 p2vCQaPcLRbJGIXvy+mLXaUU1ZFRbRC7QP5TO8JTt+92OfnksudNlL7F6S8e44PpZhYdQ
	 KH2sBglCN+WRJmNTZDaLOYP4dXV054mW6KUFEPePmzCx2MIPhWDKpCyEkvHfPcjMGNaMx
	 I9BaXQqtQYGSoNie20L9jnH1yIlm+8y4OozVEaODlE9U9Nw+7J8oeQu/Q17l8ENx/Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5EE606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF5EE606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-574ae6cc614so189968b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794800026; x=1795404826;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B45yjcfnptlnlcqmNZCy5HK17otolp55BP0zobTOdGA=;
        b=OOpzpqkvBX7X6E/Mqa5YMArlcmTk1jZ8unwPovAoIHEAS8pTExp51690vzVui40L9Q
         5CMgllHfp0wTJzOGYuW/I7tQY10XYukz6OluSrmoLqCSkkqO7xh8qPpseAJq6GKQlpNX
         oPiS24W4Cuk/9aOhZCmGU3f66yl3uJI2pPqv9XZot1NKYS9kK8mtND/6S+cffamoNazR
         3RkAFmALKCVc4AvSuC0nWGGrFMShjdDXrMVmAGfkrp8L7nKxHhp7MRNO0l0+mDGSfFBA
         ampqY3gbhh9H8fy0fC+JP6nOMnXbf9i4ShpfjF0Jr640igKMZzVTZcFeYV1iysmprgGu
         ncKQ==
X-Forwarded-Encrypted: i=1; AL+hErFRCCAgDmPokeb2ShWsBq9roU4qyviRvDTqNW5nVyGLtem9xtsjUutlU82aYZOpzPadfQOKsfms8154vS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cW3IYcZj96GZqcLi5BkMN+PpBg8cB52miKcUOWRRZ505Zd5hW
	4iuEDZFghiia5XgeHLZyt3Nw13trp3G1DeuLx7smZrWApmI0bjTdNqtK/X+p/lkezZXDetQIiGX
	/B5ZOPCBhtBTHAsZ7lZZreZPjJDaDLKt91V5D0PEXiMCrcGoxS4ABOHEtuIU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6711:b0:4b8:4703:db92 with SMTP id
 5614622812f47-56cd8304ff7mr8388872b6e.27.1794800026772; Sun, 15 Nov 2026
 19:33:46 -0800 (PST)
Date: Sun, 15 Nov 2026 19:33:46 -0800
In-Reply-To: <CAC2RYzJ=mi0Jpj69bb0W7tpRErZGzycTRo5ux4JZCBn55J1Jew@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afa799a.e7a28f0c.12aecc.000f.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco [hcidrain v2 01/12]
From: syzbot <syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com>
To: gservice341@gmail.com
Cc: gservice341@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

> https://www.google.com/url?q=http://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git&source=gmail&ust=1794886423273000&sa=E
> da3cc02587c629420603df4395179ec82955c941
