Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480236;
	b=DiBZzrmjrPfP5KXN2PdaMJl3AfcKoW7CR4GsL8IpWM/iQn1SwXAdRkRU6WL3yOlVb5lP
	 XzUH5NF3dDDkHfDATWx9GkvNnCCUfldl8lDJ0RKGPym/neGtuD3WcM20xpFBVYW0TTvPL
	 MZXIH5zdOJG95o++R8OZ5oQakoqOPmm51vtAVorR4jJNmbDa0XMK1DhjrlY5jR79orMjB
	 aN9GY9kXerMVmxkbKcbQyECYsp0bcKmBre441vI9smvxY8DZnICGj/STYBNz8XkbFer4G
	 yubKpuMLPxLg1K5XEnMsunXb7e9vaocQ113i8yK69eF4EfRvO6jQQCGYhvfXWZ7CwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480236;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pVMhRWk8qtW+u6oBSL+Up0nK8r194VsI+nQohbgpZHI=;
	b=wUnvTV6QIIkXr6ivE3Z2VRYxKpJ4YMm5JuCBEkYRyTvswRm0T4s0ph+dXDB90rESRewe
	 zFKhDj40wlIY2LKoS/tQ2ew21wd7WK/dZWImpBY/h8Ueh9W82fF4ycz8BkYdCzxtVseSa
	 N7Fx+sg/PtwrsTUjzK72Qj7GoUMrx/HwyL35glJNRK/IIXdELeVpr1M74YUkAM+jav+n7
	 YpXuAOsaUx1EgKDl93PwPQq1JUJAFGx3kd+wU+Ge7a2E/RxFhIp92lirhp8+ko5ArAOUl
	 3P8B9HtOq2tunTNW+oXDv8qZ2so9jD+/OhTCy7M0tasvQ2ZljKlwp+9XyLVUlWlJynA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611AE606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 611AE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1904234a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480235; x=1793085035;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVMhRWk8qtW+u6oBSL+Up0nK8r194VsI+nQohbgpZHI=;
        b=MT5WNGh+8MgHpxbJHBNf9wrZ9jTB3Z3llfoQ6sireQ/7YTWATpO6TXe3k8Qzm4PNN3
         8cetjx6HkBh73+nGl6rVk/JeJhPTvUWld08mudCcGs+K/Lq7YQZM2rW/L1j/V3rkHm2q
         sPOchzP+eUgAoVVaBhETjmJ2BHKPzQ6YihzrydGrgCUFOVS8MW4KK5Nm7EWcpdUGfIee
         1UlmbetqZ8Ynn8DxdMxAQaktQfVU/S5mGBnIk0WAK1eKD/Y5xRAykwHVyaDvT/cE/JvI
         AX9GZDGgib228oKtx/wbNn32G0U17X6QBHmsSCEKNKWKgPU+E+pde5zgBn6kBwDDxKVc
         vMBw==
X-Forwarded-Encrypted: i=1; AKwUvBzXyoVkSY4Cbik1Bf1BIV8uWG0sMjCIMQ5R3ItRmZv3mUdc26su/I1zEQaq8Bn9TtjTTISe7qXFsrZXL28=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmWa98kBpSv9Qa+7Cg8Muc62YuErAd3BQ43iJp7S01H5hS+77t
	ZtW2KDkqLmWyEH2mqgXupekoTAwiks3VEs0i6qepStx7tva6Xfm3lzzz
X-Gm-Gg: AYBFou13RlslOhvq0x9kszwKmzMGUniD/sDpUPU3tTAgzhyIdFmzNlArFPLKv1KTJaS
	305BS3hX+ehORTMpAtRKYsTmNgJUmfaT78i2jlcsi2Gps+oFV9cJVFDA6cbEnPzsiOo8LcVB+qO
	qq0oMf8l3WYV6wxaX9LtXI5mfhakMaPEPim6qbMdChBMbjQ8amNa75UTd3dM/nCA9ZbNp5GaF5J
	CnLZPIWr70i+WXJC072ZYTMKNZOy8NaO/N31DfeXUOjrp8waQVU18WZRUuGVTz1Pfo+u90LeK/I
	aNxWG0wM9Z8mKV9MO2hkTASAJFbyIRlbss+yqTnKG9tstIwkZDjkItV6758PX9lAZA56zGex1KR
	ZXP3OTLEEUWsCaNOW519V6QCN3pfOcEUVaW0dWVuGeTkjT5NFa/hwY/Iq7mrOH8Jb4MYuJKGxHl
	5taBlL2KNSN+sorM4+Q9bZ7fOMZIvk5HX5Eq3EFdOkXvYw/vfTFnUBFsAnTRssrtBSKAd40TIt3
	9dEwt0R+h6ZeC5kfbTZGpdhP23tssVdHY4/P951q0xL4HL9G89NOYsiOca7gbXF/q4MiFxDscT/
	c874y1SOAeh2endLvIcYGqjxlHhCY7aewKGrbguzlVJfvYpZkDgn3uNCiqg=
X-Received: by 2002:a05:6a20:eec7:10b0:3e2:2d44:fc65 with SMTP id adf61e73a8af0-3e22d4507c2mr4709328637.37.1792480234627;
        Tue, 20 Oct 2026 00:10:34 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c5621sm4773692a12.17.2026.10.20.00.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:10:34 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Shuah Khan <skhan@linuxfoundation.org>, shuah@kernel.org,
 valentina.manea.m@gmail.com, gregkh@linuxfoundation.org
Cc: i@zenithal.me, bgmerrell@novell.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+b6f11035e572f08bc20f@syzkaller.appspotmail.com,
 syzbot+a7edecbf389d11a369d4@syzkaller.appspotmail.com,
 syzbot+bfa320b67fcbe2583c6f@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbip: vhci_hcd: time out unanswered unlink requests
Date: Tue, 20 Oct 2026 15:10:29 +0800
Message-ID: <179248022909.38718.8671761249933493010@kylinos.cn>
In-Reply-To: <bf13495a-0f70-4ce6-a2a5-77d6c1bee241@linuxfoundation.org>
References: <20261006125652.10296-1-xiehongyu1@kylinos.cn>
 <bf13495a-0f70-4ce6-a2a5-77d6c1bee241@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Shuah,

> Did you test this change with a usbip_host and client? How does this
> reproduce in a regular setup?

Yes, end to end with the usbip tools. The server ran usbipd
exporting a g_serial gadget (CDC ACM) on a usbip-vudc UDC. The
client, a v7.3-rc7 kernel built with and without the patch,
attached with `usbip attach` through a userspace TCP forwarding
agent. Once the device had enumerated, I stopped the forwarding
agent with SIGSTOP: the TCP connection stayed established, but no
RET_UNLINK came back. Then `echo 0 > /sys/bus/usb/devices/1-1/authorized`:

  - unpatched: the writer hangs in D state forever. Two hung-task
    warnings, 123 seconds apart, print the same stack:

      __schedule+0x417/0x1910
      schedule+0x28/0xb0
      usb_kill_urb+0xb4/0x100
      usb_start_wait_urb+0xd7/0x200
      usb_control_msg+0x103/0x170
      usb_control_msg_send+0x9e/0xf0
      usb_set_configuration+0x69b/0x9d0
      usb_deauthorize_device+0x3c/0x60
      authorized_store+0x55/0xa0
      dev_attr_store+0x17/0x40
      sysfs_kf_write+0x74/0x90
      kernfs_fop_write_iter+0x162/0x1f0
      vfs_write+0x25b/0x480
      ksys_write+0x71/0xf0
      __x64_sys_write+0x19/0x30
      do_syscall_64+0xba/0x550
      entry_SYSCALL_64_after_hwframe+0x76/0x7e

  - patched: the watchdog fires after 5s ("peer did not reply to an
    unlink request within 5000 msecs"), tears the connection down
    (stop threads / release socket / disconnect device), and the
    writer returns instead of hanging.

The syzbot C reproducer, run verbatim in QEMU on v7.3.0-rc4, shows
the same before/after: without the patch the hub work item sits in
usb_kill_urb() holding address0_mutex and a second attach never
enumerates; with the patch it enumerates ~30s in.

In a regular setup, anything that leaves the TCP connection alive
while the peer stops replying reproduces this: a wedged proxy, a
firewall dropping the server-to-client direction, a hung server.
After import usbipd hands the socket fd to the kernel, so the stall
has to be in the network path, not in the daemon itself. The
client-side trigger is just a control transfer that times out and
is killed via usb_kill_urb().

Console logs of both rounds are available on request.

Thanks,
Hongyu
