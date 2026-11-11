Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418197;
	b=SyreaulsS+/B/oCra1LUD9dLrHzGRqWjDs1lnlV3YMq5YoJaXX6C54bBppzyd/UH3Ddq
	 d1HqQBP8Wyh7W+hu1apdNW4lhzhgCQ9pxec7/lAIWIXn7b75ViKjmN3JlQJ/GIfO+v8rw
	 VhkPkxip22lX2XdAjAsRSa3Df7k1gL+1npXevlLiryt3xtv+7otLmPZtunib2Kxu5sadd
	 Xvwr2XDBUbxq24bDdOHRLUEBDXFHOTP+ukbyS04w1c596zeAUgBx/PUxI0CKZ1gyECvsm
	 y3ObKlFdgajltKcljLxSBJBSwa3pmC2s//Fpda4rph3QGs479MGMu0jBfki19PE5Enw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qb4IaH1Y+NwiJfbuO8J0Ntl3vMKNwARo+dMo50vQgyw=;
	b=KniPBafM8zmyG6tgzXDvubTex+4uVhQC7zDRTjkqrMYoFrXHwzXtm5jmVI9kTQldR3ZR
	 lycmLbO6X0YRdF1qIr6bjatk23r8eTI9oum0vfRtdwnAHXMEnxMbvFC+iSNV8PVYjUt7i
	 +ks+mriFAm3wqH1t0aZ7wgoEX6GXFigDZN/qKBucvk8OTVHx4qSqjq/RZLQZ8ktDVKcaH
	 yyhY9wvyt6A0YDQmI5XGCGx79fYjrKNQ2v8FUqYNdt4AfKDp8ntUJqUBzjZ+XY7J/KmzV
	 kV/QX9Xh8w+xhxRHHePag5xeXecmjwpYlf6MNzEWCo39iMmtiym38wS48e2iRDc++/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9XSG3h5;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A62606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A62606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9XSG3h5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so19986125e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418195; x=1795022995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qb4IaH1Y+NwiJfbuO8J0Ntl3vMKNwARo+dMo50vQgyw=;
        b=r9XSG3h5Je/HFS7aFMcrtFIGfZZ3qyVK2FrPcFyAGpM/Xs6JS6b+KI51fyUH3ltU2t
         8VvkwGfhWdEusR0GLd7zx2rpPH/60ntIl3pbD89mnMqJP9fImjsLj9/3IHj8wIyYS1lP
         4UBGaBPvMzKwzbpiwikdR4SwcCfFDOpOBrPGdVfqDwso+IuFGOvT96QTxM2QGS8vkKN5
         2/yFWtg6iCMH4hLjxC6wGvkA/tdj/v/raNiaWih52u3bZhUOVE8l7cw6TmiUdPErMi16
         NL5jbQVuON4kU7n35ZQLM+5B4iTt8MHzSgXIvMC9f+ZHGcuDuLXmETr805kBHA4bjats
         M73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418195; x=1795022995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb4IaH1Y+NwiJfbuO8J0Ntl3vMKNwARo+dMo50vQgyw=;
        b=fOcFxWZfmlXgm8G3xQ75iAr0NH1ynHyzGJMzeey20JMFfG0xx+i5y6PawGnp1Z/5uC
         CjMWVkdsURFdghKZHwkd/Sf1PlEUlzG/0XLtvP2xGYpu2ewurcTvokc98TBctFlt8NOh
         z3FuxWeKEEtoo7s7zCwcJlp3bcbShCnoBJaxDQfhd72zfOhhDjgVFymMl8fIXPrE1jkk
         GVcNr3Bv+gXRz29AZlE6wz5GhoowRKWUktsp5KTycq/Vnn/qYjmFFAWnAYnAMMHL0mzM
         02NAKwWTYmiKyqOvskM4qILsXa0MgH+JviKol+9NpOaCiwgJG62ljLADPU1N7mhKBNKu
         TNGg==
X-Forwarded-Encrypted: i=1; AL+hErH2L664fHh7Fx5IkubKO7MAKtiYrVZwVOWNPbjiNaoC+CtbRiz4ZH8L4tA+eG+5ZLs8Nk9nRJ3O1ST9w3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FUz0OZ8ZdGQWDb6q6/K/0vWKTmcOtCDjNTm4eSaLBBXNXfDHd
	s1fdP2I1Cuby9udGi4H6c46nBn2d3Ttj60BgayZK1qgaayDyeo0h4iWk
X-Gm-Gg: AYBFou2Sqn+yvzZSG8o908uxr/PdkPb35fD++b3oeFgTprj9AsfCzzAiWtmxf40OBDX
	W5T/1aM+GSwlIqSE++SPm6jvVa/LdSXLdGtIlD1zn5AJp6laYmFJaekZD66IAn8t8AM7caBBNnx
	Sn//hQU1VLYUnvYXismlDVGW4vGnIT+dH0Bp1uEcDMgLFQPX2ahP0EhALIxSJLNbFllLupSd304
	JrEh9ilEhjRMaWA3zzmDvgcUA9R5NXo5cn1Lvtp/Zm1GjQZcabGkrm8IcQvBW167JrgXz55Y9Je
	wRGUEVQUTahf1/rL0BYOdNEgJcKB472odLkA8qJ6p9DLiI4IqxRCSyWJNOzs/onJIIyWAf+gaiS
	1k7+h3pjO6VZDfWCgjjhnn4QuUzUrlSl/qiFdmY1J8yFbP8gLj20fVWo2DvZHdKOb22PpI+Ihgk
	7iN3t2Kf36pOB1ONmx51mjBgsDLl7DtOEqz8m1Xh682keLL5aC+F21tLl4DdA9wCdhy3lruQ4VX
	F/2ujijczhKHVtJwoZq7EOQF6ErjNODl7U+jJ/b82xwVy90hARSS2KPg1CuqyddPZRmLBXImOty
	Odgx7RzSWjL4Mn2COyyqHIzu34EQBctW1Qg6SoRn/ZZ67XHWenN96zMtBhidN6lbS8knVKbG7EC
	3
X-Received: by 2002:a05:600c:3144:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4ba0939ccc5mr56490335e9.20.1794418195313;
        Wed, 11 Nov 2026 09:29:55 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:d655:6a9b:5ab8:7f68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm3134525e9.10.2026.11.11.09.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:29:54 -0800 (PST)
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
Subject: [PATCH 0/2] virtio_ring: reject a split ring size that is not a power of two again
Date: Wed, 11 Nov 2026 18:29:36 +0100
Message-ID: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The split ring indexes its rings with num - 1 as a mask, so its size
must be a power of two. vring_new_virtqueue() lost that check in v4.6,
with commit 2a2d1382fe9d ("virtio: Add improved queue allocation API"),
and remoteproc passes it a ring size taken from firmware. A firmware
that asks for, e.g. 100 entries gets a ring on which the driver and
the device disagree on where the buffers are, so the device can read
the wrong ones. The only thing remoteproc checks is that ring size
and alignment are not zero. The other caller, mlxbf-tmfifo, uses a
hardcoded size of 1024, so it is not affected unless that value is
changed.

Patch 1 puts the check back; patch 2 adds a vringh_test case for it.

Tested in userspace with tools/virtio only, not on remoteproc hardware.

Stjepan Poljak (2):
  virtio_ring: reject a split ring size that is not a power of two again
  tools/virtio: vringh_test: check that a split ring must be a power of
    two

 drivers/virtio/virtio_ring.c |  6 ++++++
 tools/virtio/vringh_test.c   | 11 +++++++++++
 2 files changed, 17 insertions(+)


base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
-- 
2.53.0

