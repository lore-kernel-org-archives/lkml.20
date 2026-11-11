Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390309;
	b=ftfXYJVflwxIN6G8zGooqbYn17Cl6bxZiCQ6tzYoPSlrEI1dKF8HtgVq5F5S6hiEd4qJ
	 dBInjTM6gvgk/ZmBsN2K0hDVFJ+bcD/YvXLuBBcAsSwo+pxtqVHZ3+Vfyc8tlVP9Dd4xw
	 vDiZ2MjdYIJ86fLppFfcEO1yJNrsHD2UXavVbrLl1Izxw8rwSBLpdUuNy6LiF9PzyCG9o
	 /SZ7v2JHnklYMzEAEZDBEaDPXe/fA5mv8bL8ymyxV+VLWE20brOZMxruO2NySnx2/qSQW
	 p4mkzT4fd8YdzDuER54IJAEo4USxqgOTPX8n/lyfig/dtztc4f4loJrtHsvVzozPhgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390309;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=DM4h2lDzZp3tp/QUxgywp2f4AF19bVDY9ONj3eT09Po=;
	b=WUBzzsueTHKhDIqXreet0xZ85bwTODgpOCJTu9TWNZHjXvudVZPEdeRm43RCSlAwiXEK
	 Pb/XRr5wZnWj8dUDLCGw77XVtrxejf4h3uA5lwjLjL+/8UBzZneRfdAPU+01kxxG5pVGA
	 Qsx+1bP8hzeHLgXG0Dg2nV7X5WE5wHV4GEgTMzfi5Dx3NZlHfygmVomkkdAJecADFmQOC
	 DWxhE0MCPvZGijufMifyW10g/u6+hxMrxCh45gA7szD5T/n059681lhWCBK01JlbooCmd
	 kmzdjfFGEcc/Ro5sn0ZIPma35IbfgtYvxdkuNQPUjIqMb9Br9TvmSs+HdvA2GLPaCAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE309606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE309606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dc57e2a3f2so4235015b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390308; x=1794995108;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DM4h2lDzZp3tp/QUxgywp2f4AF19bVDY9ONj3eT09Po=;
        b=T5Whr9aCelzZCeFJGRKh+XrlUm/Sl0QHzbSs6lNcZ4XabO6F02O+2P+8h/0jsmeFp+
         9WFzfB/4oUopXgc3vd8BGeE5ahWitIUChW9dE4V/lc3+FQi7GTc2UwJi7RZ0wb/NuDIG
         X8+b1VYi78sr00d84s9eTMXJPECGT4UYJjmoE+Y9Eo2FW+ZPpgnrlM0I8aEM+kXAaEnB
         LuRC7M9b3mzNYp97RqdIl51k0RY8uvRabf4T2HDl6eQVPSFXa8P4N15ASpEy1ipzJdtO
         uPqhuH2rNRh0+gNhMDFMpe+Fnkgug/WbBD9vcv8cQBN5yn53H0mIkrjXsYtY7nFbCTmB
         61BQ==
X-Forwarded-Encrypted: i=1; AL+hErH9iTXCffnbvo+DrVu/YqH39IhF8VcvJlzUQ1tlRRirb7J/Auf+3a6EtX+Zka1lyU7ZZqiep69MwcrQjdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8CdcSq5ySHsYbrJ8PWOVeWIjw/kwKNTj9pbEcBLliJB0UghH+
	w/glTMqljLTPrMesMCjHIJS/0cOGzpXCi+nIff1mHALs88w0dUcQme+RLNMGM/n+tYuFyq26tVX
	rs67TbT0PZPPtu73g6mzy2WJMMwnj+9XVzjSOPAAqOgXSB5kPn23E6vaS8nA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1691:b0:4e8:e664:f268 with SMTP id
 5614622812f47-56b96ac9cfcmr1448267b6e.25.1794390307862; Wed, 11 Nov 2026
 01:45:07 -0800 (PST)
Date: Wed, 11 Nov 2026 01:45:07 -0800
In-Reply-To: <CAM_RzfaG9L9yjvLwcd91+ARDk9899-7AYB35mhNMQEqCY+CPRg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af43923.926a6ce0.263fd.019f.GAE@google.com>
Subject: Re: syzbot test: fix circular lock dependency
From: syzbot <syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com>
To: trintaeoitogc@gmail.com
Cc: trintaeoitogc@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

This crash does not have a reproducer. I cannot test it.

> master
