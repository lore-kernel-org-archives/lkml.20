Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440770;
	b=2N8BdxQESRIWpblHLpdnMRA6rop5TR1mFoIoUiKVxGsR0BsvKzXZsH1eZWvDfDo4pLXR
	 46w+f3xywNwavnfvITgWxzFhK348H1iWq6cAB14g7tZ8DsVF5QcD0T5c8mdKY6lik4uUz
	 H1c/KGnNmom4Y8vtTxP6b0Ta6coOjgpQgPs/ZdnwkTIbmFiP1kYSWUXgk8yJgRZMe6HKy
	 mrz+4IXEzEw/Skgz8wyMhZbHiLLO4CSzOMc+ok0ieU4yELeRZpAxo68S8mKt9I6TXpXEd
	 eWeBUFzX5AWQi7Caj2XaeFjPuBxtj9qdoXjsgeLXAWIVMAuRZ7XWT2mY2bRWdcux7TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lrg91VXppCw++dPJi09YCHr1ozvZZtqaDezxwuYyj1c=;
	b=Je5njRXk5bN4BkBIbKOUaUxVhIwqSw9gqj8Vy/VV1Y6SdOhiZdWo32iwV4rAD0SYYyfz
	 VdZ0T7uk++xRfoL9M2TbZFreEqgtiMYGX/Syzi3DxQV312bJbTPgCdNrk6c4zEtGeIheg
	 /oGU0hwasjyoWAP8OLN1R4vl7op0z/Vv6Qny4yWplqn3miMz5vevkO1XDJ0xZQ68VDfhK
	 iVfuepF8/dTir8zwnA64Wgej2ru/MkzkXFpypCBqUow4JKfkFIfnBGpxnoeD75+83hZ7z
	 QFsLSluGSYZvXKspp1gezP+rDIMu1Aah1Hwcoso+eKUQM1DcnWHMuQv+cR7Gl3wA6RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJCloE6b;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0606F606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0606F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VJCloE6b
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso10195605e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440768; x=1794045568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrg91VXppCw++dPJi09YCHr1ozvZZtqaDezxwuYyj1c=;
        b=VJCloE6b86yvWABy075rF+peJ+s9iHi9Oj8A8xN3AKg90+d9lov+D2SVeH1MIqS5U1
         fZMPNtsj1CDhKMGFKUhX/Y7SioiFJHDFZxK1BxSniSDdO6XkDzaNITmT2/EfHCNE/VCu
         EEp1yBILY8uUu/44qbbq0HxUgf1g8gKaFstU+2foeow9x0g5wfA98wGXpn83HWo/jveg
         kibon7+vRr0Od96+ZX/Uzr5kKCEc3JBcwuMkag/EL2OvqxbAlZU9AdfjPuK2nNyWgA9H
         33vDNRwhXbsSV/htjoVhUdVWpO/imuheL2Z2PUKcle3/hLWR08BQO1L5n0lsoWKiy37T
         nb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440768; x=1794045568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrg91VXppCw++dPJi09YCHr1ozvZZtqaDezxwuYyj1c=;
        b=st6cNr6ncc1Y6jMZSp0qAoo/gXaDni8NRugZBL/s051iADcuJ6MODr4jl4yeoL/n1o
         o6L0CalaqBpx66/wI8woeBuVcqCPp8yh1dxpXYrR4RTkXE/I9K+GUjB5UW8dAS0yV5bP
         i8wANCyFeGsDbG9xF9gmnwq/Zxy7XlgIOMuezzK0XT/m5m3Xt/7fSZE3ERl+UcQMNBNt
         YIHTISpVWGnzro+Xng6tPi9zItbc9JSMreCL9jgreTTIq9yUM3LSkS0UUPTiV+LWRBjo
         wI1cOxHZrZw474trPA4D1IEHEJbmlefMIZEDWlecfxzW+uid/kCIaJXzexgFpW6eZ6dZ
         Bg3w==
X-Forwarded-Encrypted: i=1; AKwUvBzdwdWPma0G/vAm376bURmLl/Mrf1SVlM1g2c9hONCsexgQgL5K5rMPzLbMVBG4Cz+mSXKVtu5/A5UAU7s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoWiip/YnXSEQ/Z29X34rRHahx4OdmpRDt7+Q0QQTFlB50fKCq
	QkWLjDJ/gtOnYmUDArouI3W9O0YOhe37taHjVfVppda3q5zLqmwrzUxk
X-Gm-Gg: AYBFou2TPnf8Ixn9ApVkch7OaFwnQwETFBXlgaVOfHAusqs9R9uZmZKiwsBCbn8PwZM
	bdy7m1jDqFDlEEVP1HxyKedzmrRFcwdU3Vluf45Pg0P/DmqGthGgfHChHUnqfEVav5Nd8ekjh/3
	K4PvHJ9YJG9HreQLoo6FTqQ2+oWYaAypvSADrJR8oo3aYI0+f8bq35cwWLCrZzKM94Kq8/8JsFj
	8vvbLNlEuN9GxJqONquGr3wTSts+63nWfLO8nXws4WXjk37eEYW/S/PRrM8HBFlrCuoFhVEdm7M
	lye/X3tIs1XFbRuTGoT2t0L77d7mGOKgo1WtX4mgQmhzHjyFDmH88NKQinWhXRMT+my5gRABH3T
	I/ul51GgxYxSl5tcaf4/1XWKHRpA6+WDRmU8xT1L7ADmLgZ42LmdwIvOTYRkizCEbrC/3dB3O2u
	TtIlcj2SUUtOmoAGntErZg8wXiJn3EUd12g+lPc7ghewelPW7nDvqXCvxVmWHjiZTxbXSHQ7/yR
	c3xqvPn2uFAddseMlgoTDpXGqrNUx0j2zvCwx5rBUrJLidq2mSTsSAgYYoctLSKhvR/xd1FtyTn
	WUJfB6DfSS46q/c78UDZjh5yhfzT1FYF5088+8+cJBZe
X-Received: by 2002:a05:600c:8b4c:b0:4a5:1cf1:b7b8 with SMTP id 5b1f17b1804b1-4ac17b2cf8amr106495125e9.28.1793440768232;
        Sat, 31 Oct 2026 02:59:28 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:c8d4:ec29:293e:f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm55354435e9.0.2026.10.31.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:59:27 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	dhowells@redhat.com,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] splice, net: avoid MSG_MORE when the bvec array fills
Date: Sat, 31 Oct 2026 11:59:23 +0200
Message-ID: <20261031095922.3577591-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

splice_to_socket() leaves tail at the last included pipe buffer when
its 16-entry bvec array fills. If the requested length exceeds the
available pipe data, pipe_occupancy() counts that buffer again and sets
MSG_MORE even though the pipe is empty. Small TCP transfers can then be
delayed until the cork timeout expires.

Advance tail before checking the array limit so the occupancy test
counts only pipe buffers that have not been included in the send.

Fixes: ca2d49f77ce4 ("splice, net: Fix splice_to_socket() to handle pipe bufs larger than a page")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 fs/splice.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/splice.c b/fs/splice.c
index bc243ab8dc43..7c67e0375ae2 100644
--- a/fs/splice.c
+++ b/fs/splice.c
@@ -863,9 +863,9 @@ ssize_t splice_to_socket(struct pipe_inode_info *pipe, struct file *out,
 
 			bvec_set_page(&bvec[bc++], buf->page, seg, buf->offset);
 			remain -= seg;
+			tail++;
 			if (remain == 0 || bc >= ARRAY_SIZE(bvec))
 				break;
-			tail++;
 		}
 
 		if (!bc)
-- 
2.43.0

