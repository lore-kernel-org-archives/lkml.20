Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544786;
	b=Zd+EqP84VDnckfT3TM6RAPxO7JlIxQau7Tisq1jI0ViMSt+GvBmwfwt14ENHWNtaXrce
	 EiieRE3PPe6/lhpnIKiRExfKGIU/u9YMAIfugekN5F0TaqCGE2ZLMs/BXj1sT2a92PC5w
	 ls6Ty1wIJFnOGdIDe2VHxvkgRsDA3/6c4vf8uPCmgIsGtHIWaQj2T30Z0f/ZqfvQWYSER
	 j05P24U6kimhxmU7nWcvR0giQAWwX+k0sJe+E3P4oQ0Isyxe606uTUY5Ogi12YvCX9qAB
	 opxH40n1r2P2qEEdumgqVrneDWt7SdRZ8XbzUiOwWAsFGVKHnTvFx9UuKdZT7YjkfCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544786;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=mYvfifkh2cRh4ADWZM91A6IieNu1Ui2i8vEHoXTtKBg=;
	b=kdm3omjp9YEJ+MLWCDQKIvTptSgwhy/v+K1cHOH+Gr1hbzDUvzbhNi/BXKe6v2IVMTLn
	 6Tr7Vq5I3yUY3xZglLO/3mNfQzV4UOlFhTVRunQVAqH3LuOIJDjQ/R0X4QjSsv1inUFXH
	 5dFY7KPXkhdYn0EiH4uEL3i0YQZAbg7xqo2ZvqMXxr7IlHDDF1/bPOhB+3l6mmU2mABhR
	 2HFtSApsLKJRr9kygd4auZZyrdLcUqgUJLtRypm+elS4sCp1/+Hgo2U1TiCA2EKWMG3kO
	 RL2LVmZvvUYOKYZbAvZPskUYFl9eH+8uJVFHxIVK2hUOmtWyxZey47v4Qmox40ZFydA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA81606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA81606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso1825141b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544785; x=1794149585;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mYvfifkh2cRh4ADWZM91A6IieNu1Ui2i8vEHoXTtKBg=;
        b=uV+EWIM066Y3anWFGK5j/66Dw5cWRoZJ/Sh5T5QiAOsHn9R+/at/ahaalXvZTizg2H
         jRQVsaAXjbRpDiWjAjS27+kI1A4FbsCLyHv//jkIA0d0G3vMRMiJ3M9s8ifaLvbhckpo
         BR0cRBH8xqOZ3GC8GFEjv5YNDU8rxtqx7jDTWyivuwc1bA1iwK7yV7PlaMyP0yoP197q
         Xc75hBt19UnRLMh0CkmeEYqHwSaSvkycQypTawxAFPu6GhFLQRDBr1eUoyjerIU+TmAW
         dOjT4YS/iYwI9mzdG32LOEpU/Cb+gc/4SnJPVOsq2KvcXLIf5m3iD6O9CkuwaB7hf7FW
         jVDA==
X-Gm-Message-State: AFq9FYIMwMSCYAkiq+HuZKjXnIXmEIi17vh4udaXocrBfEJZ46/IsOIs
	5zFyaCmue5Ho7XzSpxP9er3oK6gz7UOfe1hFAZ6Sf3/W6bRUcEhMu+yQhkUSNge2kOCFFDG/iCr
	8EiYkl+OS4e3CO1ukmvYPVwQh4qcoVN3Btwz7GRsR8J0fFe7HL5HHnXL1GAg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1524:b0:4f5:4ce8:7e92 with SMTP id
 5614622812f47-5640ddc0cdcmr5367015b6e.48.1793544785037; Sun, 01 Nov 2026
 06:53:05 -0800 (PST)
Date: Sun, 01 Nov 2026 06:53:05 -0800
In-Reply-To: <6a830720.dbb3a75c.20434b.005b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae75251.64e51036.15cf6a.000d.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
Author: varun.singh10011@gmail.com

#syz test
