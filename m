Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551357;
	b=Ou15qsXAaQ6W+MXD0YwfW/F2cCxm5dBg2aVHLTPzYl6iast+BTWC0C2b4OdfDRWRFl9V
	 QRswiX9GjIWtZPEqhoG+upOSG53JevrM6bx6111ENQnmhUjNLU6rXZaCeHAejLQTxksdr
	 FKmnl+QrzUiNe3nep1FRZH2F+6Nalykd8N4cEpvvJnqK3e127FaOOAY8DPFDhRujTUknD
	 e/8ZZ14BcD0vQaVF0OaFZ/lPbV2XFfztg/XFdnFJptxZA0CvvuwUljEwcB6YI2PA4VOK3
	 J8E8W1sARqa1/KBEH9F1grkI1Qm3O7xuLL06EYwg13uS8d9vxekDYltXbpMZxRBBRgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h3piVyXKbxXF45kzvRxf3YzN7IqLeFtgxZUOFf2nvGw=;
	b=Sr4KUqNNMrLf6lGYqZG6Xx8gdhYkkTla3iMgLtC02I4oxKvxiYCsJfMDnox6yWWuqJ8s
	 mFhoS3Th65XXT6cn6WPJg5bN+RcL5mUYeUOy1JuHlFcQ+Vy1yW+Bjb1NrIMkA/DH6A/ju
	 wCs9JzNEdqQZ1cylXjUvEp4P7GpRR8Pwf5+/z1eprp+hvYj8speItPM/kTAjmdvjaiFOa
	 DH6IYrk+TvwaXZYaU8kPdp1UfWBQiy0VJvo467cu7fuJTlH5Q4LwdKOJGpWYhQtuUn/bt
	 pP8MB1505u2xgEWY3xVwJUcowW2mJsm3JJQ9kKK281X3VslxDYmLLvPQhHmpekr5BNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=r+andFfu;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A3E606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A3E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=r+andFfu
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c414e5d282eso267213266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551356; x=1794156156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3piVyXKbxXF45kzvRxf3YzN7IqLeFtgxZUOFf2nvGw=;
        b=r+andFfuYmw8tZ/lBNJViy2W2AEcxc6un9UYY5rwNr/Jhvd8dYXvktpWrfuHUdSTIa
         Rj+FTyXbSeEYNMd9WHo04RID4gHh4ToLGokARfRdSJPVtObzrE5lj4dVRoWkz3KWltWM
         tduyC8cQAXFXrR2spedEX/2jERqpZV+3PBFKzkVW8MK0Y7eq7/HYLH3WnsOqfVBxTeA0
         W6X+rBGiJYMNz47X00qO8ibKU7G/gl0eAAKdH3ePWlNQph4Nwf3hhJV64aJPGUtrWmjf
         cud50d7G7XSl38GfoPDsDhn6+PFioPVvaTuvN6TUwnavvqGREFxUNBnRG6NkGIs6fM/T
         8m8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551356; x=1794156156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3piVyXKbxXF45kzvRxf3YzN7IqLeFtgxZUOFf2nvGw=;
        b=FKkhTPIi2qV6W1n4OlnPC7Sg7x7lPPYAs7rpMZNZnsPtM1dS8LHn/0790jduYvidzc
         SwxFyRHjYkmuuAJI6pmNTerud3hGfFisE1zNfv3nERWqOy5/yADoeC2svrSgIlUdlNjo
         7VIb2HPx2zmCBBa1EQ6d+dC1Hr1hhzZ0zgv4LQZoh04icimYYdaaxglBgAAw7yvxlf7b
         yAcY+sfs/X3rUqniIsc0ia4xNLJrCSJrmpfhBXGoSiDtcyTAjKbeSfLH/DJv8LueGJgT
         b2sost8K4WAU4OiWRUbJ6psPAW8hlInE4oEYllj6AgDWjbXAL+OTnVryzi2L9Wy1pLpI
         DDCQ==
X-Forwarded-Encrypted: i=1; AKwUvBziJ5Ii+PRwP4wUmlARKu1mU9/TMONPJlYpnQvekx8JgFG3xk+NlPVYdiWAxvBJvVN+z22lnMlGPtR8P2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQGOWqYhryvaZQO4w7TTl+S5T4iAQXbStZoRnV41XvGwirRFPN
	N/QG1ayp6y4aDmQok3OcZOIXMh19rX2S3gcIaIaVWiak7628tNBW2PC7oc296eqn6w==
X-Gm-Gg: AYBFou1YmYeLAVoDcdswS29BlExtY35x0j3bZcAaQCYiLMghnT6Ar593OiJYdKBTh2G
	YXDcea0qWPWABJ9YPl5ZnFmpVFxyvlm6ud02gjy0d1ihlls/u1jQ434+uDLcuySAGpU0v9dxe34
	BSazUDYk25O9BcNki950ojIeghoIlHbGi0YRul07gqdy0iksb+KKBucSZZhxwdPeKd+zR1159NH
	stS1c1DeyKF4j/sGJKZDlYPrMhiVav7EK3Oov+I7nNkjJ9kk4YVNmcwLyRAugH+oNVtL4YZLd9C
	qtHTo2OgTAWS4zewmB1YCjg2patwu16/j40N7wk/Ax+VKOEI2NFdKYJL9VEWKIf2YKK1UIxZYYk
	sQQvMlLBuXQrmSzxanh1yPQjmRCUXcYVhwhfzBVn0qe9+x8wUv7HsFTsAD5sKl4xPjZcPu7Eikw
	ytGpvaZsTTidT1a0EjLTF3uU1zZDP89kuHPk/PDCYayiZ+XEQsSgxH8vWeKy9SCRFsmM6CTsPX1
	fSjDt6EyyKEPh+McxZ0spyQ8pcpTqHiBDGVD1zrB6F/zOHvVX6Hv9cRcpYxSVS3rgamJcVlCdcx
	aynYHptNbhrJKaJl9b8983KRYp70yy0iLGwnD8smXI80R1xNIb5dxX0/sDaVxGAwaMBXQ+2VD5C
	FHG62WfhSMjuBJRFWbBLfkXQEw7Pt2jDb8o6pVp+hOVNpab3YLG0xpz6nrEC3LQ6M7Q/yel7a0k
	H78Q0jYXHDNgbSLLcwzU/2EHaB2iSkOsxZCHlOjmXpVTPHTaiOwnAys6Jf8XE9GTBIKSIM23Hi0
	TSPIHP31im2E7JH107TfXXcxxhPyJwyzhKnYmbLrzYv0nE5FYa32F/X5mkcIgALHgnYZLxX0jYE
	Co3tQ2WpDZ4Pq2lK4Xo=
X-Received: by 2002:a17:907:3e1f:b0:c42:82ac:b6a9 with SMTP id a640c23a62f3a-c4ca7b411f4mr624706166b.29.1793551355786;
        Sun, 01 Nov 2026 08:42:35 -0800 (PST)
Received: from Desktop (p54aff88b.dip0.t-ipconnect.de. [84.175.248.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f37esm296622966b.33.2026.11.01.08.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:42:35 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 2/4] net: gso: count the inner UDP header of encapsulated UDP GSO packets
Date: Sun,  1 Nov 2026 17:42:30 +0100
Message-ID: <7b6a12fbe0853f7faf2987610e25957d2017bd54.1792838740.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792838740.git.julius@bairaktaris.de>
References: <cover.1792838740.git.julius@bairaktaris.de>
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

skb_gso_transport_seglen() adds the inner TCP header length for an
encapsulated GSO packet, but not the inner UDP header for
SKB_GSO_UDP_L4, whose gso_size covers the payload only. Every segment
of a UDP GSO packet in a UDP tunnel, built by UDP GRO behind a tunnel
socket or sent with UDP_SEGMENT over VXLAN, is counted 8 bytes short.
ip_forward() and ip_finish_output_gso() then let DF segments that
exceed the MTU by up to 8 bytes leave unfragmented.

Add the inner UDP header as the unencapsulated branch does.

Fixes: ee80d1ebe5ba ("udp: add udp gso")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/core/gso.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/gso.c b/net/core/gso.c
index b5bd269e56e4e..eb95c9d2819b1 100644
--- a/net/core/gso.c
+++ b/net/core/gso.c
@@ -156,6 +156,8 @@ static unsigned int skb_gso_transport_seglen(const struct sk_buff *skb)
 
 		if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6)))
 			thlen += inner_tcp_hdrlen(skb);
+		else if (shinfo->gso_type & SKB_GSO_UDP_L4)
+			thlen += sizeof(struct udphdr);
 	} else if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
 		thlen = tcp_hdrlen(skb);
 	} else if (unlikely(skb_is_gso_sctp(skb))) {
-- 
2.53.0

