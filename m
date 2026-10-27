Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090283;
	b=YxU3h6MZVUvfNPscRG1UPT1SdW40IZplGqIMzem0ra0NsbwVaI7MsYj6FXCUBqsr9N5E
	 WLInOm1FQTE4uZhviEjH7AHgxPQZycl69noGlU6T2YLAH3zXd02VXUaU4AppLNVGoohBl
	 dgC8xisulvNMfrJgFRb/mzomlmqZFTLXHkdg4HwCzRXYgTZ/KB7RFWMu7pp+LYwjl+9QL
	 AW9vO5V3wV7auvo5rpM7FNGSY6uIvfT18S3GPFLPxfVsBcsSKl4y19/4sJAdulEN6lBz8
	 9r1/bOq0ORo9Soym3GBaH8Xm2CbkdpZxLFIKvNKvhriRvMwvmidniuwuPcCiG2zL7eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090283;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=jNJPEoL5U/5VLL8hlR6W3ScSCIUX6VlHlnxZpHkw+mo=;
	b=VOcVvk+fBoAOyVbOfc2akSO+GDZJRkbvlDQLm2oo2vdRVFoxjfFEMf5eLDan3RWrgNq6
	 x2jaJI4KzohvvKVptupEJwaTEJ8zL1S+sNRzxmXogVSWJ4rgSSBn9LYqOfppxxr/3yJX6
	 UaIIy7h6Kacji5lBmGck4s0MlNsiZ2Ko3K4yzJko+dtXWeHrcVZlHTX+N8kkziT4e0NSw
	 fTcwsYlHRnU2rGuEHJnxv2cYIpLlXEoYMYJxzrn2r9t/O/g3VUorUYaRjR1Taguki6d0G
	 9Co1h6e4Jv41LJGwF9XyScrWhkcg/EQ2u84gvOprTOnQm06+WLyd0QOK4ZOSEeQTfXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B6D606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B6D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c734afb8deso5567914b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090282; x=1793695082;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jNJPEoL5U/5VLL8hlR6W3ScSCIUX6VlHlnxZpHkw+mo=;
        b=I6SEOtVh7ASyt9wx/fe+zVbRr924UntcsbvK56M7GnvyL/PTAbR6EORT6UHyeA8D+q
         ou6LwiGImMlQmWEPB3Wol1aFTUQov/VWPSEn8XZxEsxGk73APZZtprWUvQWDFJNDb005
         jKmQTB3UAIEodHQER8ViSduAMpNvKWyVCxoZFD1PsBPqFtUydt2hcTY1vUuF7r+dTN6z
         YYHUmO+VTpMUySFIN8/dKQvrUAXg8oC5XPIUQ4Bo8OECqZLbqRD2BXdZfWyEjwCRdvU8
         ZUIfpz8U3aeNnfZ44KWxNT+LsMbbhN2xdilS13LnAqU4Rk7iQd3TLJiE+I0AYcuxxPX/
         tHqw==
X-Forwarded-Encrypted: i=1; AKwUvBxUQCjfk/ubq8LXm2o+dw9vhhvjjjXU32Nhzp4IQxy93WG2FMQdfkJGazgCySOojiRe1uCQmTe0+Tn5gTM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxsVRC3+mMbghXS/awTnIJcte9UhuxXJNpfuDvHEgBEt8MYx4a
	9MijBqf7sioYc0b0D3XNm7xb9vunrOtbCfAQToMQWX1tHp3cF8ncT5QnteXWkiggHvcyEfU4+uA
	Qj5KJRUjl4PZrJPUnbFRw99V6tkEIiOUGVzZQFSLmjz6/TT67A3XYdX8IYO8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1786:b0:4ec:d521:9124 with SMTP id
 5614622812f47-55c002e11f9mr7685555b6e.30.1793090282527; Tue, 27 Oct 2026
 01:38:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 01:38:02 -0700
In-Reply-To: <2c286014-3bf8-44b0-b569-be362115010f@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae062ea.768774f5.3237ab.0014.GAE@google.com>
Subject: Re: [syzbot] [media?] general protection fault in mxl111sf_get_stream_config_atsc_mh
From: syzbot <syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com
Tested-by: syzbot+ffac2da5e6f8ad2671b2@syzkaller.appspotmail.com

Tested on:

commit:         d135ab45 Merge tag 'backlight-next-7.4' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=165b2d31580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2f2b6921ca0f717c
dashboard link: https://syzkaller.appspot.com/bug?extid=ffac2da5e6f8ad2671b2
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16e93721580000

Note: testing is done by a robot and is best-effort only.
