Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537526;
	b=RUphovUBrwi5BmY2eSsIKphx5KyYKHtoQn4vkqj1xqvnalkyBEuxa/k6xZMjFl7mnibX
	 uycSgDZ8PLw0iUBXWwNFM2bz+XMSvO1jEQq6OUUdTbNsYHEyOEdL7OxSoIuZM+1QS5FQh
	 iz+gnxz9byxOAJCrk2mzg8+9PrjYZ5+UPd8fP2ERCxCN8zSB3FwWWWGwFs5SQf62phC2c
	 LqQxzVs035HVhGuXyRylLuTaOlilkvAPhWeyvLaPGT/hATyWwbP4WpICvcrQt/vsZfk3g
	 B86XjhTR9byGSqyAsYOFdtrUygPnj9j+8iav+em5ElwV3PAEeasFr6uIFBMmshD/GjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537526;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=cx2rKaJbOqB/Hvn2K4CIf4NzTLrImGVIRCP3/c1MwVo=;
	b=ZqGfhN052VG1HfGHIA0qjFiO19FnMdW5n4ym2+s4avUh6hKr0T9sDyBm0AOoetMiJJZ+
	 LNOzCXNGoo6lXrSRpkQwUzeO9oK0J9sA/l88YlO/ZIIFdBZX7A3HmHe6KiQHkxzDFRPiR
	 QGfj8QetI2qK0rdpDw6IHS4GDhS23UZMlsMdkTqNtEjRFCvg0vxS6HKoKiZOBcn8m2Pn8
	 VhqYNgn4lMsjrJYmeQYhntm/0GIUHPhoyIU7G86Bg3k7kXXINdT8kZNvLX61PPeIhxHXc
	 r3dgC19B4Jow4yavNW+fAdCk7POvS768yeauD2/KG1Nhyb4KuS4yOeOvzbLOp9wi5xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=GDynaNfx;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE4D606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE4D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=GDynaNfx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794537452;
	bh=cx2rKaJbOqB/Hvn2K4CIf4NzTLrImGVIRCP3/c1MwVo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GDynaNfxnBnJGDYBnrLq7bKx8nJ0HD3tSsK1dKfcwbavj9qmIF07lDHiPwf5v0l58
	 bPWjVZ3YU2rUxpbu6RNKrPlyXGFCGRyP4UluTvbJvCKJSVF5RDPBVW8nLCla25xHAH
	 L0NPMQ7FnG6fJ1zqIHm3seVXSil5LXxnrnVjzsio=
X-QQ-mid: zesmtpgz8t1794537433t19dda35f
X-QQ-Originating-IP: c4AZLqPOFpr3nxvrVD2TCH/MbBycDcANaNZ/IKhuuVA=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 10:37:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11128085979388629745
EX-QQ-RecipientCnt: 14
From: raoxu <raoxu@uniontech.com>
To: skhan@linuxfoundation.org
Cc: brgl@kernel.org,
	gregkh@linuxfoundation.org,
	i@zenithal.me,
	ihadzic@research.bell-labs.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	luiz.von.dentz@intel.com,
	pengpeng@iscas.ac.cn,
	pmenzel@molgen.mpg.de,
	raoxu@uniontech.com,
	shuah@kernel.org,
	stable@vger.kernel.org,
	valentina.manea.m@gmail.com
Subject: Re: [PATCH] usbip: Close all listening sockets in request workers
Date: Fri, 13 Nov 2026 10:37:10 +0800
Message-ID: <351AC939AD9B6359+20261113023710.1746483-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <67b2c06e-0caa-4ba1-89ee-17cb814d173c@linuxfoundation.org>
References: <67b2c06e-0caa-4ba1-89ee-17cb814d173c@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MDy2K60+Ok4FlfvEkhX/krB7T8Pqtl6UXWUzw3AEVrD8ipoC0ZDothgU
	V8gFKqsUAIw1Ts7NOP9K30W3E1lm/IvyLIXKIgDF/LW6fOADw6UkScgOfN9SRehf7dXbaeF
	AVVupiiRXvGhAahaQMr2aUPP8gEYKXp0j/UeVOk2vtR7CFqzlC1kiK4WqX80crrMF+gAIcf
	+2mhUuNrKJfgW7zs904BUGW+IxDRS9T69M20v+uYB+NIsVDUFdcraF7H4eVmGb+RMCeB2Bu
	w+LyO7iSyAGCwzt/IQBUq0NAzksVEFcz68jlsFUmtusk4RxeukZcS9TOu/08yRge5kkEO1G
	YQEQPRMZye8/0A7+p9fv1IU6GHMSfhOSb4H3mkvz2BToIIQ+Vjwktm4NBDEPyb6U3W/qVLn
	6zat86HtzdVOYC33auPgm/LsqbVRFJF59RmKBtZbVe4K4FrCgYxfSDqapaw1piMEUEX1Fhe
	xxsY/kIeVV86UwLSQGWXeJD7aRnVOZ1cMdHNKMQNmqYPI0xLB7uxwaUWAoVJ6keippiapRk
	kWhzncQ1SHDu4G7EwZDFsc5IkGCZ9tU9vNPFL+jATzETwJE4b2GqzigdKqnNA0SyqA9DE+R
	yqisayQdrO91l5N85g6I5vgM7Vit1RUgx0RCqsXf7Myorue70rMTdYsx/QNY5bpvDCY0Hkw
	6E44TPARe+wnk/6q20gSwmAfd2qvhDhhLsKlOXzzv6T4xYxbztmLAbzM1ZQdgONErm+ZqNd
	d6kYukXpTX0E/UkGmCDEYL7TAFZwvk8TeVmbHsJsjH1nZiUpX+QZ/iv0I8+SyCqgUEYxiqC
	TOhOKUQZYKN1UWH2NTWeBoL1dRaDRwjmvw01i2MzFCgY9AE+uyXKsRcNwt0l5Kv5xRq2poy
	68N+ZxisGw7ccF2ItrJMTomsOlMinDcgndRCIlLltb5DYHAGMlNqo6PY004N6qEibyzWi9o
	KKNUKrVV+vj1wpABV5cEBS+RM4eEFMfXTcN1w53Q9ekzNc52n4kLgA4JQ3qIJCELNpWD4ho
	xHIVx/ZQj9WbDfqaG4lEwlATC8pVQEWefJOv+iCg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Hi Shuah,

Thanks for the review.

I found this while reviewing the listening socket handling across fork() in
usbipd.c, and then reproduced the issue with the unmodified usbipd binary on
two UOS test machines.

Both machines have usbip 2.0+6.5.10-2 installed, with usbipd located at
/usr/sbin/usbipd. This package contains the original listener handling.

I used separate test ports to avoid interfering with the default USB/IP
service.

On 10.20.12.188, the reproduction steps were:

1. Start usbipd as root with both IPv4 and IPv6 listeners:

       sudo /usr/sbin/usbipd -d -4 -6 -t 43241

2. From a client machine, establish an IPv4 TCP connection and keep it open
   without sending a USB/IP request:

       python3 -c 'import socket,time; s=socket.create_connection(("10.20.12.188",43241)); time.sleep(300)'

3. Terminate only the main usbipd process with SIGTERM, leaving the worker
   running.

4. Inspect the listening sockets:

       ss -lntp 'sport = :43241'

5. Restart usbipd on the same port.

Before the connection, usbipd had two listeners:

    0.0.0.0:43241 -> parent PID 62216, fd 3
    [::]:43241    -> parent PID 62216, fd 4

After accepting the IPv4 connection, the forked worker inherited the IPv6
listener:

    [::]:43241 -> parent PID 62216, fd 4
                 worker PID 62223, fd 4

After terminating the parent, the worker continued holding that listener:

    [::]:43241 -> worker PID 62223, fd 4

Restarting usbipd then produced:

    usbipd: info: listening on 0.0.0.0:43241
    usbipd: error: bind: :::43241: 98 (Address already in use)
    usbipd: debug: listening on 1 address

The restarted daemon therefore had only the IPv4 listener available.

I reproduced the same behavior independently on 10.20.12.199 using port
43242:

    usbipd: info: listening on 0.0.0.0:43242
    usbipd: error: bind: :::43242: 98 (Address already in use)
    usbipd: debug: listening on 1 address

This confirms that the worker inherits the unrelated IPv6 listening socket
and keeps it alive after the parent daemon exits.

I also used a separate TCP socket/fork reproducer to compare the original and
patched process_request() logic. The original implementation left the
unrelated listening socket open in the worker, causing the rebind to fail
with EADDRINUSE. With the patched logic, the listener could be rebound while
the worker was still alive. The accepted connection remained usable and the
parent's descriptors were unchanged.

The affected usbipd source also builds successfully with:

    make -C tools/usb/usbip/src usbipd

These tests confirm the inherited listening socket issue and support closing
all listening sockets in the child after fork().

Thanks,
Xu
