Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402128;
	b=CTrqVP9nNvkgUSGE/XFFq6v/4sFgplB1pbib9fSd2H/vAVwGX8vS2nCCfRloxQ7lLLM3
	 3x+4CH2wQRfrY7lifQQUDQ0EZ7DeYkWSf5oBrza2hMiZfeE5UmovwjHRqIOQweLdSZ7Lc
	 4JmD3wBX7yom/+0Gh8oxOECwOvy0Ox+v5LemDk0KvpbaqGnTYeJnWEfIebUpnDMaASuto
	 4yQ5iLKE1n0FNxtHsrwgFUjLYNtgsqJ+eHqjGnJpdWxBH+OyR7pWfL0nlQzQNc0fSrTgx
	 L9oXm4U3hKh/4oTb8zdS+MFzXtOBYlku71LTKr3n66Jk6j90ugNNmunjs1NkuoNwq2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J+mUwMOFoc1rkFDeVVWyJZ6BLcGmfPljJGbacS4Vtxg=;
	b=sUaGZO9XXgZh2NfO+k/oTqDQL6zGfI0kQ9Jw0ET85k/1kdBgAPwIZb+Arclof36AKVZU
	 1DRh1LbW7peOwi9gkYbo9wjSBEQ2070RzchXC8yzN5KrVKMylGTqQZy15tXAq42/qCN7l
	 SygMSmz41q039Cnp8AOcf+n4NZnOvQOiWeUtnw7EDEs21llpUKWfjnsWuxGpzpjisfqyG
	 fNv1oYEA6mBiTUMTNzcA5H5su4g+bEwQMLLOcgYsx59s5N/0cmK9T0h80M3u1lVUAP896
	 Zkqo1R+X9oc4jyZvIVfY5lewRifCRsSttfAcaa/OcDekvKsQylLgC59Oli/yLG3fsWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=soc3RaSG;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A613606A88C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A613606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=soc3RaSG
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so18363765e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402126; x=1795006926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J+mUwMOFoc1rkFDeVVWyJZ6BLcGmfPljJGbacS4Vtxg=;
        b=soc3RaSGX8AF3Q72bni9MS3wTdxcUkzbRO/rPNEsdwigVvJC7WtvwwdDg6nMGw0tbS
         68VGKO37moYrSFQBNDsOEngq/8+NI9Nrc2s3Fbbvh3oBeTVrXqZVssiaeDxvGl4cSt96
         W+Xd8CLOnygSVjmcmAWpro4zFLBHTC5pf28NmUBAOtTdx5jbk2WqFtgxR3IB0E4oxNmm
         1v4MC75ZoScCY61e0nV/DAXzhjW+a+/En6r4PhRuaKD8MNWkKxuKuoVcgRkOd6ODwwty
         M9QDLj18MzsT+BJ3LBbGrXMXlsJwHHSkqOwk4+5kVYV2tiMBhuFNjFqTKu3Mrt0/eDNk
         /lPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402126; x=1795006926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+mUwMOFoc1rkFDeVVWyJZ6BLcGmfPljJGbacS4Vtxg=;
        b=QTsiQhnxtWJUJyS48m4vFH7T86GJJ7QDEBexHslJPjYJQ4rIbHL7xpZahIt42XwRQn
         T+ZbcVwe1Jg5LEwIRP18Hbafl76/ZsDdVdTutIE2SqMHeR2CgK5xJmqgg4Cdgd1pbQeY
         OfR+M2YEErhMaXxEUntT1iy0tU4P+CsF9Vf0QH+k64+qwpyFl6/R25eFV9i5YH+pJQ8P
         L/byFWZ9JZ2GCiOT9bI97cWUX7nRgJ/IOnG3IDyXeGLACidPSFWZ49UCgPxVvm1MdaUu
         Gq4B/fY3S8FTUKwAQhVLkijklsqPCPc4Y3DwSHse4c+l/bhGUsiKQoTjgAZUPwOypszv
         lDiw==
X-Forwarded-Encrypted: i=1; AL+hErG9kBKj3jxCaGetQWHIGbxCGUIHyTL1FNH2zZeVQZZoc+YL0i9G5pr1RrvQ6XBMgyIfhS9Y3PZU9WoKQWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aTvYF5OEvzhPqs7+CgS0bBQsskf34r42+65zQeZjFBdg3DtDg
	q5eVMS2wOa38u6WQ1HVLnCik/2iEzJ/VpnNes3Op6LgbJXdpdDCBvppi
X-Gm-Gg: AYBFou3F8ZQOZRU3hM52QQeDZZQCHUPKZyxnZpSPxZ+/7At2w+FQ5zxRduNNMqYAnXp
	eI6NozVhKwT1w6iQWD3o/w0A21m3je4T2so8QcomsK5Tng9BpzZmy5sfE1svjw62r+zC9eN2sSu
	m3zrNAbPfA8fDfVbEctyvmzl81Jb2XbH5UZaYWsmRvAv1iAzlSxqRMQu7U7LSnSfwNwnf6ggHSR
	GzNY2k7mpjaLhJFIYnNFUO5fKnxMr9gOGcolFsZ9y27BJLHG4uFjFWSu4ysaBP7QB7H9Rayzf0W
	1EB2LXPodfn3IeiNcP1ItdWoslgwmlU2sYpoMkYd+R3JjYhCn0B/Oo5ncSbZQ/sciBaIspwX+bw
	V1Ei3t4Xq86ZLbMq8lU2HqraRnZ31aPxzGp42hLv8gEtkJrDMMGdMB5zG7a5tYn24L4izV4WBMo
	zeZuKGfQczOIsEQg4XHnKA//oNdzEGZv5iUsPweHv/bRmaqGAox20TF8OB5V4Hg3m71wSqt9RV6
	elZVByNXPiyFqPMnttK0mvvgpgjHw0M3n3ruP0j+5nRC/9JeVPN5e4guEnYsZBDErLKtKGZ2t8o
	4pJqaouRv4p0M6zeTQMHd0qW+c0rRfC7M/w5S25Gvrbp7U0qkR3i9uzgobndboOALw==
X-Received: by 2002:a05:600c:4f84:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4ba0931d910mr40210115e9.1.1794402125721;
        Wed, 11 Nov 2026 05:02:05 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:474b:1700:134:2b8c:c0ae:fe16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4989a2a505asm9244926f8f.13.2026.11.11.05.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:02:05 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: alcioa@amazon.com
Cc: aws-nitro-enclaves-devel@amazon.com,
	linux-kernel@vger.kernel.org,
	andraprs@amazon.com
Subject: [PATCH] samples: nitro_enclaves: reject invalid boot heartbeat
Date: Wed, 11 Nov 2026 15:02:01 +0200
Message-ID: <20261111130200.1767978-2-thnkslprpt@gmail.com>
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

ne_start_enclave_check_booted() expects zero on success and a negative
return value on failure. However, when the received heartbeat is incorrect
or the connection closes before sending one, it returns the result of
read() unchanged.

An incorrect heartbeat therefore returns 1, while EOF returns 0. The caller
treats both nonnegative values as successful enclave boot verification.

Return -EINVAL through the existing cleanup path when heartbeat
validation fails.

Although this is sample code, it demonstrates enclave boot verification and
may be copied or adapted into real enclave-management applications. Better
to correct the example to avoid propagating this false-success behavior
into real implementations.

Amazon's standalone Nitro Enclaves kernel driver does not implement
heartbeat verification. The Nitro Enclaves CLI implements this check
separately in Rust and there I believe it correctly rejects invalid or
missing heartbeats.

Fixes: acc4229c39903 ("nitro_enclaves: Add sample for ioctl interface usage")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
diff --git a/samples/nitro_enclaves/ne_ioctl_sample.c b/samples/nitro_enclaves/ne_ioctl_sample.c
index 765b131c73190..a620f81581c2b 100644
--- a/samples/nitro_enclaves/ne_ioctl_sample.c
+++ b/samples/nitro_enclaves/ne_ioctl_sample.c
@@ -744,6 +744,7 @@ static int ne_start_enclave_check_booted(int enclave_fd)
 		printf("Read %d instead of %d\n", recv_buf,
 		       NE_IMAGE_LOAD_HEARTBEAT_VALUE);
 
+		rc = -EINVAL;
 		goto out;
 	}
 
