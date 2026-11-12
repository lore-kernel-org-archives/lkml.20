Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794498582;
	b=IodVY761SOS6TEZBzGKoeFxP6cT5txYg6xxHUfkQBP2r/UW6vEsSPyZYfVF8MEcnbGQA
	 jHq+n+gucbxDxczJmx/XSHNi4yKaaypJ3apaBX+BHSp1kqtnNSPqFO5b3cyg599HBBYte
	 lA2Dg9ufgGapR/IonU4q4uUc9Zc3A2BwRhktgR2Z4nheeGP04HghJWQLe+wG9mOK6BJG6
	 bIcwjH74QqX1XFGISwGbKjzKsk6A/AOfrJagGm8vexUq3rFUQV5MUqZXMWtWAEJ8K81cF
	 281tnLkLoQxxe2dA8Vpm++0+TlVaxVjQJ4MslPMOd5xtMoM0xoWJ12M5xQBTQpjLqWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CxFoK2bKFif4r5nTuXcKQcoyXDPnIP5aTxYirQtgrTk=;
	b=ddc0jvGLd6DRXAmVUg4h0R3ZPEQ56EbWnFbadAabBw3nw9sf6tcNeZiQ1jlO3LDvMXZ/
	 yi83Yl6fvJs1M6A+6WuAw5DHsbQz1xSGUSemfDHSX9NCKhzKAYeQPfYdgJLeywQBs2Dd0
	 pqj2Gryld+C5E4mVXSIphfHRgDZOSyMWKbednTw16X0HYIWVqML8+v0LweHZohbXqI+Tn
	 Q5j9k9jZ59fWRY1wsUDOyHTwRXdL5btBMGkYPENUDlsIDSC/PEteq9S/XoKNtCdtpk6+9
	 UTwVzfOD0jp3nasfxT5F21q9/ha78cnfECxMr7QDpcmzNOPDNzOkhjnTBRbrlAzeu5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfKRugOW;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D642606A8AE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D642606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yfKRugOW
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so37986105e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794498581; x=1795103381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CxFoK2bKFif4r5nTuXcKQcoyXDPnIP5aTxYirQtgrTk=;
        b=yfKRugOWfcfaIv6xP1t5aR7F/giQtXW7S6EIguozBBemQNiM0fVWzVLqUK6OaXmQsF
         iDvbnC/g1w6KufcFXi893HkN9mtaOgotq3QlyHfkf6o/t/3iF9dNb07YxO/xYmqlUBfn
         gjupDXlhxlSTlL/KRv6AzN6mBWqrpWLIBu9nMF33r/gbWwnFIaMBjrkGT1SMrv80Fzv1
         NoBH55GLomb1ycxpKxTjRX2a8YAQv3vIc9oplTc0ji1+AXrDShpOuStMvwZA+ZAVr3lL
         AuQi6hjaYxQ49niKOUc3dUihin2HgykQeyo5tdVA4rURwYj+rJFKZm/9YL1qUcFhq7s+
         RS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794498581; x=1795103381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CxFoK2bKFif4r5nTuXcKQcoyXDPnIP5aTxYirQtgrTk=;
        b=nBOql/jUGo2FIRDSqb3jgQTqdwGhyNMUrsBtt48F9XXO/Ofo3Q4g0f8bXdHLU++rCv
         MgnVpBAtRV3ECM5jmLd7eQFNbN96Qb15OeO8W5pZSKgd7VyGNJgRtMtBZj5734f0LzaB
         M1zTEqIATF2ZhdVt3YFWxZYR1oSPx+5IB3zHRCZy5uU+MWqkSPsGr0t4nzvlcLqJ/iOH
         B20++TB5tLcGkmc1VMipDDPWZ4q+gWpbzV4UBdFrkaTznxn9J1maszZPIyCpdFEp4zGO
         pTqdL9yK3Id5A2qk2vbgMYS+PBEnM8Pj7iOxzu33cWBXs2Zv6ZTQ/eXS6i2U5eSyFIaU
         Hn0A==
X-Forwarded-Encrypted: i=1; AL+hErE+Sk2vAilKMA9jwiBaJ0SHHktXL7aSA5Ely92vFRTcfu7D8fDMrDBf6/HYFb2zE9KI5uA7SjTmoFf1YFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z88VMg4wrD8P8VgDaO/fmPHCtEXPtzX7B4YymJ2NCcB8ADJu5Kp
	p3gdvJxn5EPNqUzkoO1w5T5SBfc8zbJL0GNiaNM2v8oY7FLmheA7kbebyLp0SxQBmCI=
X-Gm-Gg: AYBFou2wnw3HNSo32WYE6R5q2MVap4/jnKwBo5cCJNghAeP2NRz49/T8gtUtp2hPQgY
	CwhN0E8Iuh/HmWhDAh1JyHs/noHBQVg/r6bFfXeDPJ71DL7j2ROG6J9dArF6rQ9I0jeKAebJJvX
	4bEb+Nd9le92bB8M+NA+qg0qKcx/FO/qd+3/FNtJaUdm2tMH7bZj4oTcbhYW9WljbM0MNyMXuiP
	67QCzpyH1Fcwpg3DP+NYkXFucoXSFHvvHK3okL3Kblp3Q3TlyCw2saXOvC6b5mOP5Z0GrVRZ6gg
	trX28vSTxflRA5hdLCRAiVllDHWnXpZDKhZsCMRXrkPjrEfbjgORXENyNBwPrg8Fhfpjxg+StW5
	KeC2iGrxNjhPbgXHC9h77H9Oxjh8wTFZnJHrPAMAhFWW+sevyfUy+x/UudEg+Qka6ver6Gpptlc
	H4JosZqWjNH8G6vSfrbdjT8P1qJ0U/9z2oA4lpY0y6oOhw45kzAzPlD0xR2kay/ahgtFQFY3h8s
	qdZjglc4qyrgpeaVJzjSiO2ddfgrE7QEmDTupOEw0weGCpbfiDNmK74WzrJgTWRL8l5IiHJBr1+
	R06WldWJMNYsnsfa9q54T+WCsk4TrTwmKcXmcR7Rh3CIkNGD4ax8qG+opp2f3KkgKZhFJswJG2U
	=
X-Received: by 2002:a05:600c:34c7:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4ba09391696mr107327305e9.16.1794498580905;
        Thu, 12 Nov 2026 07:49:40 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm139337155e9.1.2026.11.12.07.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:49:40 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Francesco Valla <francesco@valla.it>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] tools/virtio: vringh_test: check that a split ring must be a power of two
Date: Thu, 12 Nov 2026 16:49:17 +0100
Message-ID: <20261112154927.4004184-3-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
References: <20261112154927.4004184-1-stjepan.poljak@gmail.com>
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

With it, vring_new_virtqueue() prints:

  Bad virtqueue length 255 (not a power of two)

and the rest of the test runs as before.

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

