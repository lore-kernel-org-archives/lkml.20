Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661177;
	b=cvM2pP91iOQ25flWnIJEMCWbAsavy4AE/fTZig8nhtyCxkzNahHBOIthwR09gIpux7Wn
	 E5RdlEeG7q6JPe4V6dBw4iqGdd/jnRz/YLRUXh+h/MITy3FUBtSBvrYKPzGOiElLcAY2i
	 ePREYDZ1qMYjnJ9H/KKKWHJRfnKG4zyOZAx49IZi9Aasea+0aI30kgWvOPusk2CV3hDfj
	 B1WkMS3oWv6c5MzE/egC0PF1FWrl634qzylkXMe6K1OMlhFYZy9RgnyvAhwRKfS6drtwz
	 AlHcO1tg2vxMPqBfWoh4PBkY6vBhmo30RLWxZrdkA1FLOiZ0trMoE4krXGp7iG6rHjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=EamzdbmCJd/tsLqc1Uf5xYkgzwxHOHLxwnt7C9IRutQ=;
	b=MIG7/6j1H1KGQp2RU2zyyLa4T161veKt2/Yy9YSa33NSfv6oKgC1UkdxMMNg/tCE0cfe
	 43tHvs3KEgmQ+MWtfLjDf1GGpJFz5VtYjVDNLOs6P4Wwc11fHCNhONhQPhxJG1uM7UR6a
	 xhGTj1nVr6wH5DPfJhH1bMKMusN5TYTrKvZGGpUdWbWj0VlN/qCIa6oU3EvTQWErU17Vc
	 boCTH7wUTXp313Dpp4/MdGWWE7tOz06fop23sdn7T8e43bHhVRN6vUJDEXjm3XmSSHrjU
	 5YQzDOJ/jrPZVxvX9ANCq4E608KUEV6A9GxnS/qIZJbZie+gwvcm3WFd+IGOC4uWpFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="rx8b/Fy+";
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C00E606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C00E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rx8b/Fy+
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b05bf699easo32373867b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1793661170; x=1794265970; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EamzdbmCJd/tsLqc1Uf5xYkgzwxHOHLxwnt7C9IRutQ=;
        b=rx8b/Fy+NjWKy9Kt9BkYBTAgAdfsrCjtSJw8M4hgKdPwSbdNWSPDWS+qzcv7PpS2X0
         5GpXVRoxUaZ06rvZROEMQEK8Mttmw9rGPzF93KOiP9W3KhIAYixd7e7GNOgC4Fr334R+
         ZMd7FukI1GTj1DTuhU9+GULRf5Xbb/LNWXhyf+MMw2FwhCJ82Zi4Ko0jgs9VZCKtAS5x
         oaNuyuW9O/UX3/pzgRC6JwSMVmrAnNCPfmYE8DdZzfw6boqxFs9vrYo7Ge/Mx04wtHt3
         oH7W5UO7A+o2/swON24J9mUTxAOGRp+JLyPEKuWH7Od/aF95WucAzIhYr4/n/eokeaGH
         ubDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661170; x=1794265970;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EamzdbmCJd/tsLqc1Uf5xYkgzwxHOHLxwnt7C9IRutQ=;
        b=whQzCJs1sB2AvWULYtCtdOm1JqDNyBluoT1uQp/3StSM9q6E82OOcDUYPtbAJckYMm
         ZHW7bPlQcQLjlTh8FZsGVeIO6N3GGoEtUIfIcrSHE8HUj9IBFBFhzVEz4jlfywg/a8EP
         au2sR5mDtSsjeowl64N3TisFl1SSWwde1mXLfYnWucGdhoGUslrcoVWmSggIwXmwZINm
         586FnirxgOkgc6f4m/EcwR/J0njD+Fnl7tHP4XMO3gUSTLJ1sn5QVnZPyYQgq+B5a4FG
         lZCBZIGPkC0yx11qPtPYjvEfAb1KnLgbcYWmU7T2MTmCgmvLijPPHDb9Smm8q+Xa3sIJ
         3mTA==
X-Forwarded-Encrypted: i=1; AKwUvBwHMUJvSc4bKQmzKMx2czmG834lOj6GUNG42x8XMW7B2oYkPBvjO2Tz7ThEYa01l2N7RE2YHZ6N/MtYfXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ebObMNjCUV0a4kK/3lizyrzbJLfNAV6Ht2sJBpwTFQdUYsro
	u19Kk7sTgdK/LaB3fJyHu9UgmluDXxCcvamF8B6BfnmTDYZXglvLm74ygJAEOXg9sFno
X-Gm-Gg: AYBFou1lMEEPgR2flFRIWssdHvMMCeriqA3IpJM+7jXPC4Kfgn2uMjdpgtHSGc039xN
	f/fVv7fpnXhXhZGWOKfpl45aqb3BFgJtClYxJNmtm2uyFSdIeU8KKpbBJvbuy7gzbJN24MA3ime
	g8bkL7kE/+7Uxp3pOQwVvye/2Y412Kn0qic4r6DR+AN1v80vJD1QF5e8HbjbIg4JFY6XVIUjyc4
	/61RwIZ7q08DhAfzHYyvnvyybmbOfX2lPODQHQjvZ8RTngjKzGQ8DrLHp6F2yNHZt1Dax5mhFki
	WG4B0wgqeT78d4a2Gq7A8SYu0D9a6ERPZsSkimHYjr1MU9tWgzKLCcIft9ODVQxS5eS0NDPxj21
	xLslktyOSsK+3Lh1jCY2J4QY3BA2evsbi94Ebj3Ge4o3ZWoxAxGiGuHWjrIx+fqLpP0IeJxyasq
	5/0sa5emwuuL5mjiyCUwbgUoH2KvxLuQcqP8fJjerzSu/JunX8V4ET9AnKEJ3NyUvNVDQvrugul
	87nWSyWOJfu49nwRB0ZMlMJcJWvHsBoNVXpK+OnsDa1DPlHGNAMRZASFDWLvJHIMN6OYHr0xzVc
	+USGj700yNbS8V+eL6n9cgmelHZZPlxRsY7MvJ5WlSAwwklRyyxHotlJ/vyMjxVd4RS+hf9lKbj
	gj2cX08Uxudm8OqWwuHH8l5iztzoFdms=
X-Received: by 2002:a05:690e:1094:10b0:66f:c1bc:408f with SMTP id 956f58d0204a3-67ba50187demr4711928d50.82.1793661169876;
        Mon, 02 Nov 2026 15:12:49 -0800 (PST)
Received: from [192.168.1.110] (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf3303ebsm5946481d50.18.2026.11.02.15.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:12:49 -0800 (PST)
From: Andrew Halaney <andrew@amutable.com>
Subject: [PATCH net-next 0/3] net: add SO_PASSCRED_THREAD to get a
 thread-specific SCM_CREDENTIALS
Date: Mon, 02 Nov 2026 17:12:33 -0600
Message-Id: <20261102-halaney-scm-creds-thread-v1-0-0b4d75dbf35f@amutable.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQrCMAyA4VcZORtoC27DVxEPJc1sQKMkRSZj7
 76y43f4/w2cTdjhNmxg/BOXj3bEywBUsz4ZpXRDCmmMISas+ZWV/+j0RjIujq0a54JTnMI4h2W
 mK0HPv8aLrOf6DsoNldcGj30/AKCaSmZ0AAAA
X-Change-ID: 20261012-halaney-scm-creds-thread-7170680f8c5c
To: Kuniyuki Iwashima <kuniyu@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>, 
 Willem de Bruijn <willemb@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
 Andrew Halaney <andrew@amutable.com>
X-Mailer: b4 0.14.3

Currently, SCM_CREDENTIALS carries the pid of the thread-group leader,
despite carrying the uid/gid of the actual sending thread.
SO_PASSPIDFD_THREAD lets a receiver identify the sending thread, but
only through a pidfd. If you just want to know what the tid of the
sending thread is you have to do something like:

    1. Setup SO_PASSPIDFD_THREAD on the socket
    2. ioctl(thread_pidfd, PIDFD_GET_INFO) per message
    3. close(thread_pidfd) per message

For example systemd-journald wants to log the tid as "trusted field"
(aka provided by the kernel) but doesn't have a great way to do so
right now, unlike the options for uid/gid/pid which are covered by
SO_PASSCRED currently.

So add SO_PASSCRED_THREAD as a sibling of SO_PASSCRED. It delivers
SCM_CREDENTIALS_THREAD whose ucred carries the tid of the sending
thread instead of the thread-group leader. This is completely
independent of SO_PASSCRED, so a receiver can ask for both. Use
a new cmsg rather than changing SCM_CREDENTIALS because users
expect ucred.pid in that context to be the thread-group leader.

As with SO_PASSPIDFD_THREAD, recvmsg() on SOCK_STREAM sockets stops
merging data at a thread boundary once SO_PASSCRED_THREAD is set.

Signed-off-by: Andrew Halaney <andrew@amutable.com>
---
Andrew Halaney (3):
      selftests/net: pass socket options to the scm_pidfd test flows
      net: add SO_PASSCRED_THREAD to get a thread-specific SCM_CREDENTIALS
      selftests/net: Add tests for SO_PASSCRED_THREAD

 arch/alpha/include/uapi/asm/socket.h            |   2 +
 arch/mips/include/uapi/asm/socket.h             |   2 +
 arch/parisc/include/uapi/asm/socket.h           |   2 +
 arch/sparc/include/uapi/asm/socket.h            |   2 +
 include/linux/socket.h                          |   1 +
 include/net/sock.h                              |   4 +-
 include/uapi/asm-generic/socket.h               |   2 +
 net/core/scm.c                                  |  32 ++--
 net/core/sock.c                                 |  14 ++
 net/unix/af_unix.c                              |   6 +-
 tools/testing/selftests/net/af_unix/scm_pidfd.c | 229 ++++++++++++++++++++----
 11 files changed, 242 insertions(+), 54 deletions(-)
---
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
change-id: 20261012-halaney-scm-creds-thread-7170680f8c5c

Best regards,
-- 
Andrew Halaney <andrew@amutable.com>

