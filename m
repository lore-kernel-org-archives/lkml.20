Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418201;
	b=m7L0T3wgwu0WRAJeM2oXnnoVJhnVMJ1vmxpTjXIhsRj6B5hmdS3PCWItI4fazcVY+nD2
	 4s6Tsx2Zm9BN++znrVOEVKoDxPLgfM88dHwDzDTmBaKFrdeLz6A7pvVjLpmp9Uu5yku7J
	 GSPXoQIkWUTgd28vbIfjurGqKEHYxmfML7/mXUHzF8Jas76K8mDT10ikGxzE0lDqgHj3M
	 SxijP6ieGmDpYWorXhhoPHHdVDAs8eprexkB1nenC92zefCH4IrKssqG0rUSBdymcHsY8
	 QoU63CH6Kpk2GMB/hxh7GmO2K2Z1te3Vhsdj2P2Jyxa7D5+ZQpzRLtZVBmNV7Z+lqlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IKVepiIWQTpytFczV61SNR3/LqMGsWtSoR5eXQ7P2qo=;
	b=Ybu8KfzUZUYXGtMeIzCYJHYi/aSR/UvTmXfBdPkGTvpUwmJCeo76o/vBkJK6mgFeijAH
	 Jm4P/xpHMcrEKAEa1rnxBThldxcIAd5Z7bxz9lxgjc4wa5xZA2ey8GbvD5b0ZXJl6RvSq
	 VhjyEdWBBV8/WZhmnrfwR0tFN5LgRbGj/u4dLM9I4r3dhAdHkz05K3YxYKuCoYGoHFClE
	 TPqRFc6s2+Gt2K0ELMfMsvSiWlRoupmy0Nt2KA/A2osyedyybcUQkfxROyh6ivg3qfxNy
	 9BnjI5/oR+ghlcAVPP4rRG/EjCL6nfOU38M9goBjJVCn4s52fxEBn5WjxinBNhb95ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFYIA7rT;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDB1606A88E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FDB1606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bFYIA7rT
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so21275605e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418200; x=1795023000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKVepiIWQTpytFczV61SNR3/LqMGsWtSoR5eXQ7P2qo=;
        b=bFYIA7rTFpVLFPJXTWF8QK4+hM2Or5vOWroxph9yVjplrAoN/vP/bKUIl/pYcuK8JC
         YJbwsvJ5yTovuXwHRm2uxofSk6xWm8mCfnfHYXLqy0GQ0goXqs5a3Kjbd03Q3hL7sm4N
         0svMgeGguAZEHU03OiXJFUwgylI2oxgB5rJVoZi8gQwxSkdtfm6u1evlwYjfUuZiuYME
         pI2cdIJKdrwWuZ41Mbszl+PkrdDdMFQ67zc1NQk1FYzszNscI591YdAB95skQA7YsNyW
         7QEVRz0wOGA2TYtddYp1McFL13EtoR7HT3tu1wUFaoCrohyKyLcCz9W//Amf2m0pwKOx
         mczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418200; x=1795023000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKVepiIWQTpytFczV61SNR3/LqMGsWtSoR5eXQ7P2qo=;
        b=Bz0GkgmIAMqZp8RDoo36rDFkXYXjMgXO/91wdO+kjB3bxPu3XyXex8gyqLiaqRJBiB
         Zy87QQ6STWb1VjkC1V0OxUjW1SRJ4W2t1c/XfsLod52QucVj18R/x/dS4eYhp3AhHRuq
         5psIsuyU3MpLKstEdkMIRmP0cj0nIlN2vy9WGSDyzks7/aOGipdK8ldNj2tASPcIRP0I
         FXc1NgUvadiVLk+hhWkmYQ1d8OOk6sxNcD64rs2KInL/LxHWMYHg5BwvFelGGcb7dYkF
         C3RtdQjmYOviLlMr0bKq5sVRbD66AdWmyRy+pahTe6ey4tvK1uX6nBvD6ItywV/OBWos
         9P6Q==
X-Forwarded-Encrypted: i=1; AL+hErHwy7lOOHFDIG1lPhYFeXIuf9t2NeG0HRUgOlPbGOBiZwj8jLARrWlli3kLSzs38CXaFavxnppKA+A9RVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oIF5cYa8W6oVfA4PDlT+WRfeYLP9gVWt4zKCO5UzTFaYakh98
	4Hx1gg5xK8E8CDl4yU3oPvxMBLjfi4TSZwLcq3R5APczLTc89ppxiAV3
X-Gm-Gg: AYBFou025o6dVfykoBowmrVk/GKtqZyTMxYg9yLBqk/s9/fZOV3/iriurEvohuLA8uF
	LaVp4Dwr3NgvagITuHAgounviGBcFppVDDhY8RF678zUF7Zi8x5P1T9c+ClSKY0LKHmmw1WJ4it
	/nmXOiggskYO7tir2S4vylaI6D29A9ObTpoq8qNkBA+Pjit0EB27RO+zYmJjw+/SQiwuKiszBms
	hZf0kTVLcELmsaY6ORoUhpa5VTNMu9Mp6lG0bdrA38VjAbPCGCxQQ9Spn8gsHzfpT2xdbFc2tkX
	i4q6R0fX11bhBDr6aU98X+UGTPope8KCYlPeUoYGvecTK1J3eJNv+ScZH5PB9zmt0YF0SCUFA49
	gf5c9HGbIHThsA0nBxRHtapOFh94OLCY3Xs+UYkD9/XF2sQf67h9AxhB4AZOkSBeYPuAGuX9kD9
	fUU1ZRPgw9M4rGFZrMIztJQY+8v2No0WPLRqyxQP03ZvxVePo80T33Dzmr0K6c6mwGfK2UU6Sy9
	Vjvbg+2qXW08nzn1Ts9IgkMSW2fvW60H64DpQJbiJxfqOpCotHkl2WAdxdzCcrMc01zGzqKjSRz
	Tphyp8TBqnKQmb6ptDh4odogZcVJSmAeb4k/8P/dIzNfQ80N1FTXWdvC29xNpA==
X-Received: by 2002:a05:600c:1e04:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4ba093b9702mr55946345e9.19.1794418199918;
        Wed, 11 Nov 2026 09:29:59 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:d655:6a9b:5ab8:7f68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm3134525e9.10.2026.11.11.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:29:59 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] tools/virtio: vringh_test: check that a split ring must be a power of two
Date: Wed, 11 Nov 2026 18:29:38 +0100
Message-ID: <20261111172947.3579982-3-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
References: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
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

vring_new_virtqueue() used to accept a split ring of any size, although
the ring is indexed with num - 1 as a mask. Check that it now refuses
one size short of RINGSIZE.

Without the preceding fix, vringh_test fails with:

  vringh_test: vring_new_virtqueue accepted size 255

With it, vring_new_virtqueue() prints "Bad virtqueue length 255" and the
rest of the test runs as before.

Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
 tools/virtio/vringh_test.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
index 2a5d7f7d2d6c..75c66385502d 100644
--- a/tools/virtio/vringh_test.c
+++ b/tools/virtio/vringh_test.c
@@ -494,6 +494,17 @@ int main(int argc, char *argv[])
 	__user_addr_max = __user_addr_min + USER_MEM;
 	memset(__user_addr_min, 0, vring_size(RINGSIZE, ALIGN));
 
+	/*
+	 * The split ring indexes its rings with num - 1 as a mask, so a
+	 * size that is not a power of two must be refused.
+	 */
+	vq = vring_new_virtqueue(0, RINGSIZE - 1, ALIGN, &vdev, true, false,
+				 __user_addr_min,
+				 never_notify_host, never_callback_guest,
+				 "guest vq");
+	if (vq)
+		errx(1, "vring_new_virtqueue accepted size %u", RINGSIZE - 1);
+
 	/* Set up guest side. */
 	vq = vring_new_virtqueue(0, RINGSIZE, ALIGN, &vdev, true, false,
 				 __user_addr_min,
-- 
2.53.0

