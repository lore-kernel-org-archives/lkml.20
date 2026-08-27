Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F147D3D9025
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872134; cv=pass; b=dw+Ky/uycCzFhLQP4uce3xAsnN/9HYseW8Am9marWCJhAgF6dTpbt2KVpm8EN6TSZ770y6vZ07eiAO3OIeuuI0RkQzKzcJT62kRZb4SIzQOMgkIAC3RtOFa+B0uBLZFb26HsQ/IrxVegrlJSoYyb1CVjZmdUtfO1GxawRdMAxJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872134; c=relaxed/simple;
	bh=QE5r8Hefclm76uVhId1kbMmsj7Fs1WnSDJQ72lFByhs=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=DqNIkppfVi2lZGJV35md5nI/2nPpB6mmVKpgbor+SOf0+ymh3h3ehBrYIi/ZdLxRxdvbCblWS57lXFC7YbZX4ORARGmXyZxEtccSUhfsoYLxvni2VUm4NaNPzqEjYfC7XeMJSWaeUcGh1FaWvKf2IBQ1MVPv4CH+R/26OtcT230=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=MzrwqrSM; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="MzrwqrSM"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso572051a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787872132; cv=none;
        d=google.com; s=arc-20260327;
        b=fr35BUOvPsiWn7utlWMZ/mt0D0Rilyq+mKlzrQSlMkwjF5Nb1xUjUBd8KMNWRa1cD/
         jwNene91SCzIOYY2CxTqnpUcs7PIYkDCCWJIh7alVr9ARkVY2Qv7WSYxlO48z/nmDoDq
         ggp6mseKHUOVKAyGcCaDD8mCCc+9dHhARJrJMCDLH9KLSQ5YdVVXYbyE0ivlRKNlvoxQ
         xCaRHAa3ud0Xl9x4AqUNek2AtUV6JxXwD5deTqN94Pbh+Sagosz6XgDYzo/xHP81GwiB
         losgKRnxiPui0E9/8QbC+DwTgHsUi6arxKJScSt1EcWTWevRXt+AMiXZlH8H22Y9UFya
         Z/9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=JdtPX2uer4IOAQhgeqeDxfMKbOSrBGipE39HlDMAV7Y=;
        fh=fkH+W/SWFpb6e2eYLP+Xmk3/HhQAoqMv0QYjJe7LEXI=;
        b=WPt+IADXwK/392Gl8Pq55LikJGlE/eeRG+dSoxtM0dYNKrZgejLtjcRZ6dLP784iLP
         +8qhaHfpJvns4ekKXYxeHuKhNK5HRczzx15QLNqj7KCf23lBaW6vQfhWyRYv6DjryUSg
         8Dk+/ZZFMZ+gRsaBYrXf7tJ66ujcNagQP6L9T03ihDv7vYD9bYdsoTkohBgPgGbxdmfa
         64M17JWBgjQjRsIE1rKVqpqd39ND1j68k3OiLLViBBd1rj/a34ibdMRbbm58sSihJ8Nn
         tDrSjpRSBRqZpcaKN2V1N4H0uUeAAedRAarE7ojUa8MBkg2QRyCoZhMus6dof3zeN/Z4
         57hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787872132; x=1788476932; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JdtPX2uer4IOAQhgeqeDxfMKbOSrBGipE39HlDMAV7Y=;
        b=MzrwqrSMJuh1MCLtMwBFoLtEj8HIT2tiVoE4pFY5qBN/YJW+qjRRpA3WDjqyrFc+wc
         uZUGzc8k+VHe/SA7RE2JfnKPh66Zg8N9SPLJrkb8Gi1gpvscxjMZ6K1E0hBvtsEmlp7n
         +NBoWrjFREqpUAixvJOHJpVXz+8/8sh6CIWiPiVQEEk7XGezwJTzqmHullWeEL2UpMQR
         YDlD70oq+N+ZDrU9E+0XlZ3018QL0nOPrO3TBYP7etEp4l1cOO9ldkSltDUWh3RVXWhZ
         8EMQGmNeR0Ya0Ma5fivmIpPZdClK/audSCbdY/v3tLXJ8UDm1dpVsvhKuJJJ6Gumkc3Z
         1dlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872132; x=1788476932;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JdtPX2uer4IOAQhgeqeDxfMKbOSrBGipE39HlDMAV7Y=;
        b=tWxTaD+IiHmyEsNAK8eJJP8NEvzm8IczhuAbj2pq05ofCBntJ1Ra7gpvdySwi+hvo9
         IkMhu+qRsYqYzNYHOdoiFxQSobTygYbRc3qMnkVwBU67aXBoL/Dk5gKyiGRUiq71oMlQ
         10WWs0nSo2le7I3RsJ+W3FsjNi/bBP1s64PST0REdiW41eqsSQpDRwU66MV9hCtnKuMi
         r7+3TvuTN+4HqMoNxixJ/1P0oMX0J2ne/hSb6k0glb6g8w4/di7xIf28cLjnxtk/5vAH
         EEzSfAgitg3ckz1E669sfkKJMpftGrBu/xyxM0UOMKT8IF/za+VhH1r3VMcM+/x/gNpj
         NaZg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1npOjRUdJJJYpUhVk9B15fKSmyznD6yHc0yQogdFo7toiON1+rzUdl3nJaxt7679HK2+z+0KP22JDftg=@vger.kernel.org
X-Gm-Message-State: AFuF++mt7KQ82YBb3I6vd3aHHKEgvJFbcY6tBLIYd5/mx7qWzI0y13kr
	3eIm2ZzNzPPLll1xcbONlxxYAhfYh5qtxaGwgjXWNs+i1yZM4Gashl5cFQG1VPRT1T/HPZU+DiN
	Dzg/bG2OjpUwxJhey0yJ36zbxV/RCjVPrsjAh3+2hfu3Gbv5Jqsq3Tw==
X-Gm-Gg: AR+sD13NL1eIIMtsZNBBCBMExOltuPMtsRTKasWrxJulw8iDai+0pMQaWk1xrztUB4e
	Z0v06arB62KzIJaPuxg/k4S6PfKlcsDHANkBnR55sqW9/W6F7rwhr50gdr3EVuZyMnfwjc36tIG
	C1vcH9YS43ih7k6nEDX1C4ymieXDY61LBdF6YV5G8luCULs7BidgosdGdzdsLNhoujOaGKjM0HN
	GA/CgfcR+G3M08U9HIpPpaDlXjMS9bQYe4faqhM8p6uaM3EQdGzLD/Iyu6BCRCo19iqvNRDfHKe
	y3/TnJJpFok+myiBIdMmqxL6so6sYTvcYKoZ6a2ha1qpRhDe5jj1HfWQRRoGarGrqfI7tNGrgbz
	T1xtS38ARvx0p0gnY1oU34ClIUC/RuOyX
X-Received: by 2002:a17:90b:39ac:b0:38e:6f90:eabd with SMTP id
 98e67ed59e1d1-396d0ea5451mr3577011a91.5.1787872131206; Thu, 27 Aug 2026
 16:08:51 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:08:50 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 23:08:50 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 23:08:50 +0000
X-Gm-Features: AcwNN1VbtQ_TKORfhlFpdsm_n8MBcq9xHZjdMpqeltBevAURlMvwXQR-2yvryik
Message-ID: <CA+0ovCjUB=g+56ZCrT4MPfWjqBJX_CO=vfp12JLOrh7B53uVWQ@mail.gmail.com>
Subject: [BUG] ksmbd: use-after-free on iface_list from the netdev notifier
To: Namjae Jeon <linkinjeon@kernel.org>, Namjae Jeon <linkinjeon@samba.org>, 
	Steve French <smfrench@gmail.com>, Steve French <sfrench@samba.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Cc: falemi@asu.edu, linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Namjae Jeon, Namjae Jeon,

While fuzzing Linux 7.1-rc5 with syzkaller, as part of research at ASU's
SEFCOM lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/117-ksmbd-unlocked-iface_list-uaf-netdev-event/

  refcount_t: addition on 0; use-after-free.
  WARNING: lib/refcount.c:25 at refcount_warn_saturate+0x9f/0x110
lib/refcount.c:25, CPU#1: kworker/u8:3/9983
  Modules linked in:
  CPU: 1 UID: 0 PID: 9983 Comm: kworker/u8:3 Not tainted 7.1.0-rc5 #1
PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: netns cleanup_net
  RIP: 0010:refcount_warn_saturate+0x9f/0x110 lib/refcount.c:25
  Code: eb 66 85 db 74 3e 83 fb 01 75 4c e8 db 45 27 fd 48 8d 3d 04 03
1a 0b 67 48 0f b9 3a eb 4a e8 c8 45 27 fd 48 8d 3d 01 03 1a 0b <67> 48
0f b9 3a eb 37 e8 b5 45 27 fd 48 8d 3d fe 02 1a 0b 67 48 0f

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,
