Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690184;
	b=Li63DKXcLcgr54ZgIM7aYi5lIsCfT5bRWqxklXNlZ/TKM2d6B2nOgVgplhATXx25qY5d
	 q/urj082Jgme/jwiNpKurssnCTYHUeCbbLX8nLHOaWKuTW/fHBR9TC4BndtSjG6KsUejh
	 zXZgvcpvx7WNt7+aZRSQm+uYh7rB5D10Du5q7cbd+lRIbXzvB/JsBGJkyr75nbJwBcvEV
	 PAxvmltuBdrsY68utwiN+o1GMvhfhmIwb+3kNMX6Lv31OUj8UxY/VlxiOMwNfG+L3gLgd
	 UKsYqphr0TW2IKUtA0fH2xyFDdG+0rQhkXcKu0ckNAvKxKvWnH7At/yTU2WZMWGcm1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690184;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=KDhxw6ToTMg/rrCyrGsaDhCqmdR+IIK3JPW2oHogn68=;
	b=GK9Fy7d1HPlDMj7bBMGeA9wZuoPCE1zLeK/HlrAkwW9QUrDhbb5lIim01AyHEIdFGsDJ
	 jO16QGCwozLoY66bbpF9k5FU4aPlRO2j4m8+Ve37NP4qgIkk1wHGP6/wL/Wr94ZvWmeX3
	 j9XOItpu58w8YOt9JQrHkMVriTQowlcZYKeQVBcSprVX3b4dRbVA4WXhUF1jmpr2gDzWv
	 HkeCI9qNJk4u7eLdii4R4Iyj5ICK58EndzIMQdInnzabpRtlvIVMWSBuidPSsNuYr1M6g
	 EH7XHczdzSDfQCnKLfBj+FFNpihnsyeKIWWSXKHAMyS76lg3HlKzQvJw9hbt+ihcifw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4F9606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4F9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80a79b0de9eso4321944a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690183; x=1793294983;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KDhxw6ToTMg/rrCyrGsaDhCqmdR+IIK3JPW2oHogn68=;
        b=lcSHTxPG7SUltGK7oke7WWPAyxhfsislSeztXxKksVl+IhaVyb3JjvFhvRscPXLV17
         e/KcOoqDr+swgS6aIt622qR9IIHjpPk7e+xI78e7peo8D7Viaoidpfp5Ho89uo6ybYoP
         Sy6H20pVdwtbk60FlSel+XVwTgsurqf65iTUXdHOMoG4q6skS7slpO9PAV3LILdlDGLF
         5ZcK+SI56bfePQMDcAVJ5SS7250csMY2XnkFz6zSyQuqU33MNeXighcrBHEh6oIZPiK9
         qNG4neQcmn8n0H6+TBvDcAthn4/w/lD/n8byOx0KlAbxovume5hqjdVdWVkU5ePb9yzG
         ObLg==
X-Gm-Message-State: AFq9FYLWIB4g+06Cl+X4vGP6Xpoe0iK3irf6XC2EvHDr/vdbL6FPJ7n/
	1yGBMnn8wkRQDuBuQPxnDhHvah1QsW1Ps9pFWHEKezmhQsZNjUW7gI5YvgV7/nHF8u1KxGV87eV
	+KVyopD4XwcwUr8nGjY4Fvncq45Zw00Cjz6aXVRdqLUUGfuEgVxQKNf4oAF8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1829:b0:4d6:90d3:e18b with SMTP id
 5614622812f47-5535fda3d38mr4587513b6e.52.1792690183067; Thu, 22 Oct 2026
 10:29:43 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:29:43 -0700
In-Reply-To: <6aa9c7f8.a211d2ce.1a5198.02b5.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada4807.4c8f3b9a.1a805.009a.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [netfilter?] WARNING in nf_flow_table_extend_ct_timeout
From: syzbot <syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [netfilter?] WARNING in nf_flow_table_extend_ct_timeout
Author: mike.michalo@gmail.com

#syz test: https://kernel.googlesource.com/pub/scm/linux/kernel/git/netdev/net
main
