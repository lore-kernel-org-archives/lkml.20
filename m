Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504837;
	b=ZrIny0Klg1FqSUM4wh2dWBR5z5cHz8O2uCtoXAr6yPajz2PZwa3mBlFYjfFou5Dpr3uo
	 y7QNBzHunGkgJLOksVYmXbj9ZoeOsZ8mxCQ8xS5Eh0cGbmAAxlj6aWa+taXffA3r16X6O
	 iDvyCFsPKafnvwcBuYuigG84e4nor3NWCyBB5NPGVTd2rJThLXf6cIaNbaRf3LMAYHka5
	 UEEnhI/YjAth/pTutUu3dFex++zeF0upvbfidA4u8RiGv4ETDxrw25LBATDVnZ01WOMcq
	 eEBXCAC6pzwvlWtmmwUDAu1mCQXac75BJcMBCalsU4gFQTYPSlYcNLuPXDcaVE/TpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pvvWiB/HIs4H59vNoAsA0sD6AI7vR7sZ6M7N6d5Xgws=;
	b=M1CwDlUj1ZFdZHCM9JeFduh+MHZ9CWqjdo0KCF18kz4qwokO2qNBI/PvlKqOYkGZGIBU
	 3aivMBg7pyMCoqGnEzKrQ//hT+YjwT4tpZ9/ZE9UbuGxSys+PdR6ZbHkDJ9/2Gx5jdzvg
	 0aK8o7+X52g9lQQmhtJ8f2BPbCuDQdOKZu8j2Gs88BL1uXJvJeJRdzzc2MFL3/iTUKSfk
	 ZtcROwG8YWOZG9uA76ERXeYRUt+59ucPunyLMnmobfMdv0LeLkk8oU6dPiXLK9NTTM2pZ
	 w47SAtnYK0//MdJv/am2aPe1QwvzY43bJrGhuj1OpzOUuRC8aD4sRQHS8UDjslvsmSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=spStT64T;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF01606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF01606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=spStT64T
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4496173a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504835; x=1793109635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pvvWiB/HIs4H59vNoAsA0sD6AI7vR7sZ6M7N6d5Xgws=;
        b=spStT64TSdX9HNwicqMbVM8oRQSavile+EArNF1PJmJM5guZBb5z331MenwaNSGI+h
         Fwx00CGIghbLZ2Kms8oTkCLDQ3G+djkxMGWX1MIbd0ftStBUZaSZQg9rYNYvPmCON4lD
         P9A3oyDZEdeZ/QozuU13RBOh9zXUP8EVrTVnnLrjSV7KyXKpHkb2qqLLC1n/D4zCaqC3
         mY72cQZ2Ll96uqONMO3UEiZawQ4Kdg1JgraQt0Gpd0mdJJnDE/RNrRTSy/aRokPc56Rh
         mcU7nvVCV8BHtum4PuVWw+ANTq5p5e09x9l0PMv7+dLYfHNJ9Zn95sV9a9F9ZfSRm+ns
         d8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504835; x=1793109635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvvWiB/HIs4H59vNoAsA0sD6AI7vR7sZ6M7N6d5Xgws=;
        b=XbdTdbV9d0OwiOkL2y7tCJDmPxbe5A3TeqG524zAvSLi7W/INt3tUaaUCl4isSOswE
         YYyyqYD791w0KF+koS/y/KEOG+faBSQPBt9i8M+l4IxiGW0DjQR5zZLP/h0al+BKgzzp
         rV5SuvNRLNd7PJJ43ftN0arR0ti8xyvESg+Ckrnn6LShYymFqzQxCYyP3nWA+GX2tk5D
         m0Sh+wExIscYHJ8eDfvA+RfHw8AbDJyxcobbcMvSZjrq4Beb7kq/uM820uZT1zpS2sIn
         svzDIg/bg4VpHgy90sPbSUZcW2i4urU9db0BWGTNulX5oeOzVJWihrc1dSZrKODYbBq7
         V6uQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+UFQtigRDOQZ5tbjENHuI/mfwzwxCChbjEMJ2w66CYeC6uf7r2mfxpw80f2FofEHTCrz1wuAdlSWntO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGAD+n0+cf7IiRKqXaHKVVNXBS1cxIN6KaKQb/o++xs2t+0kao
	bv1V5+Iqu+o/lfa8+FqCgUprc+OeRIa+4S/07+7HEN65pl1xISlrelSF
X-Gm-Gg: AYBFou3i92L0qTSNvCRS3+ErwNuNqxscqtkUuTa+THnKl5EK9Rbp991fXzqmqYxf4Sa
	Y5Y8fwNE/uxs009+77qzA97e+88lb6gwdC8bWCOp0mjUEvdXFmLG+F8iwtnYT+0S+JdcwaH0ECm
	8/ViUYJs0rqhAhGDcr4mQi7hF6arEZ3bdlkmqLPQ0+Xcr2f2xZDnOd0VZ7MESSnIdEVnYHtD/dS
	a5+l9GYLz3L+CUOVkKlyJy0KHgli8XJ/eWIO16ZozBxC5heThPDICvifxoOKWygANSSbHUR87KS
	WSQpLSDQYyHRWi4oXYQK/GGwHRN0RJChgaVbjqfLwFTyeQF/61GlXYJJG+rGioCosC239Fdwu/i
	6dXTLI8pvOwv31rNDo/4aMLVmoe0nAXNEjjXGPBUiY3SyQWd2ifemCoAcYlq8OmcSRs6JEsy1bd
	/4aJABntEwwB6Pk23a7Y8uS2oKXDne7gDLjVWvMtKJtFPGh6L9mDrcsdvt8qmyaFH4cvqY51W01
	XeG8649WL8SAbxA2tCZObKggRtTjvD9xzarlfUUEAFV2QO+XnB8UMDG41HTnnxhzJ6BCUpREWgO
	yoxIggJAGfu0ZUc3VTOctIbxB5tCtlY4nuhNyF/lLPw=
X-Received: by 2002:a05:6402:249c:b0:6b3:bca6:b480 with SMTP id 4fb4d7f45d1cf-6b3bca6bacfmr6223968a12.44.1792504834506;
        Tue, 20 Oct 2026 07:00:34 -0700 (PDT)
Received: from Martyna-s-A34.localdomain (ip-80-113-116-3.ip.prioritytelecom.net. [80.113.116.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c6364sm5431458a12.14.2026.10.20.07.00.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 07:00:34 -0700 (PDT)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
	Georgia Garcia <georgia.garcia@canonical.com>
Cc: apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] apparmor: check address length before reading AF_UNSPEC bind address
Date: Tue, 20 Oct 2026 16:00:30 +0200
Message-ID: <20261020140030.92643-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
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

bind_map_addr() handles AF_UNSPEC on an IPv4 socket by reading
addr4->sin_addr.s_addr to check for INADDR_ANY. At that point the only
length check done is addrlen >= offsetofend(struct sockaddr, sa_family),
i.e. 2 bytes, while sin_addr sits at offset 4. move_addr_to_kernel()
copies only addrlen bytes into the on-stack sockaddr_storage, so a
bind() with a short AF_UNSPEC address makes AppArmor branch on bytes the
caller never supplied.

Depending on those bytes, a confined task gets -EAFNOSUPPORT instead of
the -EINVAL that inet_bind_sk() returns for the same request. Kernels
built with CONFIG_INIT_STACK_ALL_ZERO read zeroes and happen to behave
correctly.

Check the length first, as inet_bind_sk() does, and as the AF_INET6
case above already does for inet6_bind_sk().

Fixes: 89ac6aa752ec ("apparmor: push inet mediation into profile callbacks, and improve auditing")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
---
Tested on v7.3 built with CONFIG_INIT_STACK_NONE in QEMU, with a task
confined by a profile allowing all network access, calling bind() on an
AF_INET UDP socket with {.sa_family = AF_UNSPEC} and addrlen 2 and 4
(200 times each, after leaving a non-zero address in the kernel buffer):
unpatched returns -EAFNOSUPPORT every time, patched returns -EINVAL
every time, matching unconfined tasks. Other AF_UNSPEC, AF_INET and
AF_INET6 bind cases behave identically with and without the patch.
---
 security/apparmor/af_inet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/security/apparmor/af_inet.c b/security/apparmor/af_inet.c
index 516c9016537c..a617f8058634 100644
--- a/security/apparmor/af_inet.c
+++ b/security/apparmor/af_inet.c
@@ -196,6 +196,9 @@ static int bind_map_addr(const struct sock *sk, struct sockaddr *addr,
 		 * AF_UNSPEC if the address is INADDR_ANY
 		 */
 		addr4 = (struct sockaddr_in *)addr;
+		/* Length check from inet_bind_sk() */
+		if (addrlen < sizeof(struct sockaddr_in))
+			return -EINVAL;
 		if (addr4->sin_addr.s_addr != htonl(INADDR_ANY))
 			return -EAFNOSUPPORT;
 		family = AF_INET;
-- 
2.56.0

