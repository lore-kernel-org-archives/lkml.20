Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310454;
	b=co44LnKy7DmZEUMiLlgtfVoCygnOOV3drsYUSIEox+BLkmwmM+wcNjBQD7fq48MFgYgh
	 Da3F09XTr3e2uZ8EMmiaZkSfJWVkjVc8zn3w+FiIccmHhMcLuvoO8Xvygc+Iz8eHeDQJX
	 I0MKqJHe5V84CzGTSY/LpjF1oCqxMMB08gI2COkiMYifcOcXYtb7s6NOpxNLaOSAVi1LQ
	 5TNCYsDYqOytmQJqKICNDIfTFlwogFLIpnl58uOLuF2wvz+1K2XdJU0isdmgXsAg0fLZ6
	 rIkEWDdnSSBzcYI9CNhBNmsBH7vuamTcgK9gzKYOlMVIsPGgaP8vgYtx2zLAtj6DuFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310454;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=LP1JJWFqckiSbwneonbW0UUwPHduz/LFH8DNG3f1WuY=;
	b=KmqM1JLFfZqLs0e5N2juNcmSBFLyjUN/AaPrjgb26XRaoWiiizh/Sq9QK4u3CAvYxB1v
	 E3nJ6U23HRsntNZDfBUDAEPd7PmZxQJykce/S2PhGjoFn24A3Zcllfk6BkoCcrgDBf609
	 nBeOR20gq6eTK+YokgMOwwNp4uN2KM1YyL/GbhrcHbDvm8ho4cxrWRGFwvYhaV+x/CZnn
	 CuRY9szMfeq1AibHs1EWDKSrq6bBsZ5xn8Z+O1zE3VMad+Ib8dz+mDC70dCOYzvebhTFo
	 EuGoYeJeKnCALVT135bjbiuhvXXIfmUw5CUoDwuWX7cA5iSG5KqbXn4rPZmTNKgdY9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D27606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-83c2311eb1dso2768980a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310453; x=1794915253;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LP1JJWFqckiSbwneonbW0UUwPHduz/LFH8DNG3f1WuY=;
        b=PgY92mzGYBRe/xpNqJeSFV0f0J+JsuFbd8jMs+gUh/Dr5zFUeiO0z03f7ZmIOaMrbw
         XUCdrPx5CVVrkEtYYCuOlz+GULaHkf5tHO8un8OMxD8IiUvyxhGM56/xFP+f8t+vJLhO
         158bJPPjdsehKk+NDvJ1W9Hzp9/lwLAE3LKHo7y/drFUoomMvBwMR8GIRkj+7ptlj8/2
         EPhOTiL3DjJy3wY+KMSQyuKsp8WinIhdIxSrMevJ4Sixg/WKxz5SDU1jahMQ7f7WjLAt
         4ERB0T8UNC4XjQjdmgLu0qUnhV4dAhzX8bu1yPzz9zt3smkSUWBJESXmXIwtn2Qo4O+D
         0eHg==
X-Gm-Message-State: APuU4Z+Oow0sJeKpZ1h40M0bhfjj2EUmeJfRkd0XWf9SUvtdDrr0rSgi
	BbDUyzQq8bVa8YkYdXpgCwDzABxrFiWsOE88qaRKCh20SX4pTxR5fDE9SkuwXhRxv8QljDCv62C
	JAPjYA7ZcuBRodaXxvzB5lRNC9n54+SaKOaAjq/BLaYp3lZK5V/1CxjcKKrY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4feb:b0:503:8f9d:f11b with SMTP id
 5614622812f47-5683cde8478mr1952293b6e.43.1794310453100; Tue, 10 Nov 2026
 03:34:13 -0800 (PST)
Date: Tue, 10 Nov 2026 03:34:13 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af30135.c2a1e073.10a5a1.116d.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
Author: gbughunter8@gmail.com

#syz test:
https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-nfs-1110-b8ee9ef
4f0f68fd25633fe8a8f1f884e3618736e116f1f7
