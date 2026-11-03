Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679153;
	b=FXakR0Qx5FcxXVwFHhk3BnMBy5/UpnV+Rfbha+l0Cf4XC+/EEohEr/WsG8dQK8h5N6wT
	 7WkpsJaj2HhxSOr5IzSDBZ9zU6Ubik9VA87aU+VrOatn0Gys8O12QpPwVrV0YlmAlw1jq
	 HVGA37uudp6tGEsw0CpKxG44/fZoAHYKncFujRtjF+jxLf64U0fgbXpDDIM+2EjqwSaZ5
	 wwR9p4bbPeTYDOJYn3TovKxd/C+mk3AFCTcpe57NmgxJvbmktSfP1FkA3RGBRoxcml19D
	 p0mbomhYtfaxPKmdFle+JWcrsMl4wxymtCH6To7CQiREOAE4CQ4iSzvTGZ51gNA0CmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YqasG4hoa5HMln8cuz36jlojNM8+bH53t/aSP0CVnp8=;
	b=FoiQeiiQnRSIXR9xAFMsx/rqeX3Y6MPaQWFVFNPf368JXDN4dXp40YiszG6WyxNQ5aOj
	 y7vefMXzncsbhCdtX+VZ1hSx5UFCF+RzEnh00yvHt7cWz0q1mQc67KbGhpbd8Rs02/si8
	 Em2DCUlnJiZDBkoOphWP9mWrb6ekPKfJCDnetswMDRjRHVarOf2EesacNj35IKzMcktW7
	 b5ugTwViEh7f5uRDK1hGavtslTT8z0YFrg2RfaVBQYmxK4RIMU2sTr57712Hgsp3JRDN6
	 qJ8fNp2dD9IO+m4vXuJs+nuOAjrqJmokXdJ75xiy8r89MGOIqLaQwpaSmEHCkuTftag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzaUTNE6;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B4A606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7B4A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yzaUTNE6
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso2723691a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793679152; x=1794283952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqasG4hoa5HMln8cuz36jlojNM8+bH53t/aSP0CVnp8=;
        b=yzaUTNE6F6RJplgdhN82dhJZSzDhQ06QB5gPHmzagXtVy27eP3PELDsWY0W7jkkuHZ
         ekd5XdsvxVF032K2Gi1sp5KhDd0CBDv8vk6F1bg4wUuO4GzlOANZtOvINeO+soGra2PG
         7RZv4zAGkd0Rhz7TwXZtQHtri7lxyIdG0POr0yrjAj+qqAjSLwvsxk8+bFHtk3W//8dl
         yIxrdXZy9Q7MDJ3SkdspAPwKtjOhvzaCAwTNJG0e+9NUE0BYMZSr3jDljs2PlsUe1TRh
         lesKrhlCR72x63yIrZxo3eNy3YD/zJAOzgyXvrUoQmMybulJuN33+09brnDRblX+jwNt
         becQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679152; x=1794283952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqasG4hoa5HMln8cuz36jlojNM8+bH53t/aSP0CVnp8=;
        b=b50dQWayZpSHE/1zi4SBB6tD6M0sQK1G21y8VNYL/k4Iq/hgxGAkOjkeFJblXDLikL
         LoFfLIGkuv52pBm8ljA5E8ww297csIKXiFLJOLQ6H99xRPwC+EcxUacSkFiEwJr8h/Lh
         Nwx1xs619jozKhPjoBKDnx4zmku5O9INH0atqaCDmOZDCMFOIjEHDB8J4CKaPZGeoYYK
         z+Q8t1oUQqbtc8qJch960T1K3L9Fp7gq8YKf9f1uc7N5ZTEbs3Jcr8BcQvw8PBFA9EVY
         SeDCMBWpAhiJ4/o1bKfiXMMKxYrnxRPuaE/4qe9igkFwA++DRa/Fq4v4qfnGtmYMrrge
         DoPA==
X-Forwarded-Encrypted: i=1; AKwUvBwhonuUx09K0oO3uap6Z5x8udqF998UjI3pHHy38tN6f+00RQ3S+8QHxVnk0nddHg+6e1N350CEWc/ScXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TUsyVoAJ20WDdMLd6RnKIwSiPG+YYvt7dHVp+NAsYdu5yQ9Qr
	N12GTtpJCxTkjMXbxZQWgiJYJRW7CyAwy+bVv/qxSZ56+3kgHdzNqq9s
X-Gm-Gg: AYBFou0SXJrnzPwaaZ5TY51120BUC8U/XcVOswAl/6ylQ4N9OAEYoG8ROhyfo3E1VSc
	B62ghYE7jNywHtzjSw0NTKhLWDjCyGk0l5jRTuFz36Acf7EOTiB72he3+zblsiuv2ddfV2LGmcF
	iG9AY4jbvPVv0UndyQeu8rrJNS4xJRP8JPRyg/rX547RTgxfbDYng+fQrv21m2YMK3lWzyxa71J
	QRcvH58YKs2UnK17mhKWHL056FShBA3Kt8c2xES0H6GVZmWDfor+nTJ7bHHdV6cMBIsCzDf8L/P
	ZxnudpeZe6T6HDRVsLI7omFqYiFaVwt1/qkI7QzUYb6NHUwvxgJrBY6Np+/nS86puO3KIDmKw5D
	tqBQEAxOnaTQ3sYsa7p/J2lui1PO1pRgTpffQCmHri1LYgwuXVw8p0ViHul17W5oZ+sDcNZP0Wq
	FEKAHOkm5EvmZlM2NB0f4uImfpPbT9p/yZAjsyLKgADPyXEXvhMY5DEaDUnZahUjFvocp37hE3p
	XjI7IqbeYla1lPTCBPJL9EsDd0sgCwclj/HX8+rQV1gMHmGAywQocD1ogFabrJ2spBMG6D/SsVY
	0AVqoqz3
X-Received: by 2002:a17:90b:224d:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3ae897eb33emr9769580a91.21.1793679151782;
        Mon, 02 Nov 2026 20:12:31 -0800 (PST)
Received: from gmail.com ([2407:cdc0:f00f::117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6f010asm1941708a91.15.2026.11.02.20.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:12:31 -0800 (PST)
From: Jia Jia <physicalmtea@gmail.com>
To: netdev@vger.kernel.org
Cc: stefanha@redhat.com,
	sgarzare@redhat.com,
	bobbyeshleman@gmail.com,
	mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 2/5] vsock/virtio: factor RX skb metadata budget check
Date: Tue,  3 Nov 2026 12:11:31 +0800
Message-Id: <20261103041134.33310-3-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103041134.33310-1-physicalmtea@gmail.com>
References: <20261103041134.33310-1-physicalmtea@gmail.com>
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

Extract the skb metadata budget check from virtio_transport_inc_rx_pkt()
into virtio_transport_rx_buf_full().

The helper retains the existing condition and will be reused by a
following RX batching change.

Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 net/vmw_vsock/virtio_transport_common.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 43325d7aebbb1..2a9cfed085515 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -576,11 +576,17 @@ virtio_transport_collapse_rx_queue(struct virtio_vsock_sock *vvs,
 	skb_queue_splice(&new_queue, &vvs->rx_queue);
 }
 
-static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
-					u32 len)
+static bool
+virtio_transport_rx_buf_full(struct virtio_vsock_sock *vvs)
 {
 	u64 skb_overhead = (skb_queue_len(&vvs->rx_queue) + 1) * SKB_TRUESIZE(0);
 
+	return skb_overhead > vvs->buf_alloc;
+}
+
+static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
+					u32 len)
+{
 	/* Allow at most buf_alloc * 2 total budget (payload + overhead),
 	 * similar to how SO_RCVBUF is doubled to reserve space for sk_buff
 	 * metadata. Check payload against buf_alloc to be sure the other
@@ -588,7 +594,7 @@ static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
 	 * queue growth.
 	 */
 	if ((u64)vvs->buf_used + len > vvs->buf_alloc ||
-	    skb_overhead > vvs->buf_alloc)
+	    virtio_transport_rx_buf_full(vvs))
 		return false;
 
 	vvs->rx_bytes += len;
-- 
2.53.0

