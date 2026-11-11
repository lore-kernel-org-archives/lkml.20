Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397378;
	b=howbUAmyYTf051hMWSoKTaHkYtZBGW5pGQ14nd4LZx2+lv26A8jmKYj2Hqlo8kwZMHTW
	 whtoimGKe9KMVEiK831GdptRy8sWNrwsVx+gfys3x8Ys43GibIop0qpz1IAjaAh6Bs3C/
	 IvKzksUvT1NwrqKbugunenBlpBF4/3H+Sy0FqoXkrCR0EwVLthj9jdlWP8LX1Wv4yuNx8
	 7rIMGjNwuky4LCMf9VXzrHw9jhP9UOlWrQqDJrwqK5gRf01OPeg/3+ErmpfirI55SeMyY
	 zSs24lepE4HHpdnjHQ//iv+SEXDGidE3xO5uZwv8dh/bzgGRhnJxOHW++6bDF4kF9/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397378;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=94CroDfqi+2DC97R+U3J2lTC4+eumsoUioziJHzv1d8=;
	b=EhL3hZFAv/A0+VLSkV647HHbLC3SkVqjvRv3hml7sMvyW08E95AbivT0qVywbMxxAeF8
	 +PhrxfQvWERBw13j2hPRJxqP7jO8yLjZceVPBvsUHhI5pDPISJQ2viBpWhq6pAtjcZo4M
	 5MsCCQiZh8qj3uvpdIjc3pKYATliKvtMxYfDXZia6YYYucDpq3MRNv64RX3i0irBCBOtR
	 bSRbkfqnOzztoq0deECX1JmBfz34DVezOm6hjiRsqHaUSD84uTKUfFTg7n88cWQEl8Mpl
	 Hh3PWOkh6whS6I4eO4PqWk7KJqIHGy+N6CXe4y22PcyfpLMF6Z9RLjcld3JzW9fhvNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A97606A882
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A97606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-568249fbf5eso4082315b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397377; x=1795002177;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94CroDfqi+2DC97R+U3J2lTC4+eumsoUioziJHzv1d8=;
        b=25Ts9/2Po8IGktQntytmzyOMuZmuf8KIOKPRj1L3Ufngf57WpUZFgKVOieSmAPNLTa
         xJV6sYVlW2vqLBr3GpY9LVMm5KF+z51Ru+jVVlp6kd/l69vKPGfAjNd9WfKe7Z4b8G/l
         VwgZgCtsjCxmmu8rUzEWqMOclSNLGAbbII2JmiHN3xvX5qeBQJ4pcfUZ9JinlT/q1Gtn
         5EvtFdtqvGUOndSkza8I3A7WF4L2Wd58NQ8jhKyV29nXN7gmukeWXwXVEowtop6S0y7D
         38weNXpyoMKR97w8Bl6j+VIeH7Ar0zn3Pig0wZr8ADbIUc1qjXCqnfjxmkjwnwo0WXs7
         RWzw==
X-Gm-Message-State: APuU4Z/3DA99z/tjLGkvGFNNVelT+7KmUeczOi4e6d7gfSuoPhh2A3At
	6p7tvMHblVowUwa8GpPtpD0Zd+yEPnGATVSfIMOhEbJt2Wx1OuH4huL79vfnlMmQOgEK5w1GqFP
	YAfYKwFUoIN0/kgLezJvSP2UlRFCMWbEGe32C5mUIGL9MfodXxoQiZqcJbCA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2443:b0:4f4:3790:660b with SMTP id
 5614622812f47-56b97101d56mr1527476b6e.29.1794397377202; Wed, 11 Nov 2026
 03:42:57 -0800 (PST)
Date: Wed, 11 Nov 2026 03:42:57 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af454c1.9cda8233.15e390.0004.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configurati=
on
Author: gbughunter8@gmail.com

#syz test:
https://storage.googleapis.com/vrp-syzbot-owned-fixture-811055272945-1108/b=
are-repo-clang-host-71cd2945
567fd6945ef9446c53225ce8ad060fef27af732e

On Tue, Nov 10, 2026 at 4:48=E2=80=AFPM syzbot <
syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com> wrote:

> Hello,
>
> syzbot tried to test the proposed patch but the build/boot failed:
>
> owned.c:1: error: VRP_SYZBOT_HOST_GOOGLE_CHAIN_7F41EDE2
>
>
> Tested on:
>
> commit:         2424fa6f add bounded syzbot host Google identity matrix
> git tree:
> https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo=
-host-google-chain-1110-2424fa6
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8bdeea7ee6735=
f91
> dashboard link:
> https://syzkaller.appspot.com/bug?extid=3Dc22bb42560ec86726aba
> compiler:
>
> Note: no patches were applied.
>
