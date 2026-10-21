Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605933;
	b=qE3MDEprPeJRqXJnknSe6aFsoQX87CqnoxVXfXW4hQDYffUCEG8h+sy9mQGFrzhCbSxG
	 dUpMMi53VRAkljHia7X1MLZsZvf7i4h/PadGWdbKbM0gJaLpDq56Y+LupCOhRclRB7L92
	 lV2A0PZFPtBsg4KSyZ+7/cWxEilhAsQVTFolbQBxl/bZT6D+wFrvDo2gR5YtffgjNH5bZ
	 OKxhAnIOBa+fgTyU3BtIIsSC2rxdeIcLhgzFCzcQibZ9mAC7+BL/ZU685GICgY0veiQil
	 zbL6L8+EhnzJyOhu/NUHSyYJmMbJz8TN/k1zCiBAtptjN/jo2a1O9m9S342Nc6mRYyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DS+qpxy2NKuBUhINnKtH+4oZ3tQEN68OVLg0g7A1lmA=;
	b=FHyRMcDJyitwuBTHv3nYUqqxy09Y3S9xlKZZ1GXhwHsDvC2ERgCMoUyyS8zfUJdQH5Tl
	 /bROUNyIGGCZ6oQKnxKmb1xxZdGMKSolFTfbWAmGXynbEgndEhZ+P8KANMuyxm24LsBKg
	 zadof9ZXMlWC4F7TkHqBqhmQs4EUXvu8PQiMWQTWXC1iXjMBIChc9O4/K7bv42qnf933S
	 DIEiB7x3Rk0us6hcVImc3LL0KN1tfv2ix0hrQQ+KiyKVgbWzytYNcZcnh4O5JVHThASwZ
	 wc3Q2QctdKuXF/e/f33GB1v2IrVJX9Odl+sF+JyEKCbIHPJky4blcc3XJTjS/4tMgmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ii5B2VWq;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC294606A334
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC294606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ii5B2VWq
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so12191645e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605931; x=1793210731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DS+qpxy2NKuBUhINnKtH+4oZ3tQEN68OVLg0g7A1lmA=;
        b=Ii5B2VWqfwQW5rzOGgccwN0tkdmw/e4rjES1c5Zo92Eo0X5gjyDyp5PY38u63ZPztE
         uVtGhuu47sjcZgNH1Wo/jaIgCeym6Ms8YT9fEnibOKNBnQRdevlo7AO9rtWlYUIJIsqy
         x7i9wy67Yb/MnMKsq9nAG0J+0gIMNOB1eaLKhYtLYHSlrhUXRxA3nZimCsJRByF1QNlY
         RsVQJBPzWToj8ihKGmpCfsecuceIY94Cex4ogp5ahaUKwiHB58wCl9xgJCQz+9Fzp1bC
         Fes9WVUmPxSIFuH27OMYhcrpYJGSU9mA91jOKK6lqOTpzSrK6eb7HK4i+tuWFf9fp5OT
         RGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605931; x=1793210731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DS+qpxy2NKuBUhINnKtH+4oZ3tQEN68OVLg0g7A1lmA=;
        b=1a/XwI/i1ooqT7iH+jniTTxpa7Osd6mnRpEHtYBW1ng41NBvGKEkDYGStWKNl/wtcV
         AbgeoZrHSPFr9Xv+oGUR6esxrLC73xg8cqjKj/zF+rxhrQA0mJc2JP/lin8YFfPwXR3+
         4MoQfD7E2uYygl8WWBzLgrBcfjfT099S86WjyMwwaxjE12DCUV9Q8OETXoBVrnTDocgW
         rqxuE36ldT5oHs61Y73PkWWWAH7xdUF9C9rh/bMwM+KFVQ+8Vh5ZEFtnrPb9kZ1V6Nia
         FqZJMtL9QLQKQB3TmXmsZHkPxxzaydHjQosVpFC6M8rUjgPXhIzCLOWnnVHdDC7AwcAg
         EVTg==
X-Forwarded-Encrypted: i=1; AKwUvBw20d7AByN2dxvzBGkgxRStmZLMvf0EDTaZxTnccRYuUhq5yZMVzkHRKbUIKCYOuhaLKxyDSS6UpGg7Vk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgB6CacF7VDUmaVaNshwypYEgRWnJNaQ7eurQACDx1/DZZV29R
	qVML3DyFFj2ICJssW28y7Yqci2AnBzcefnIM5Kga9hqleRIBOANL1u2s
X-Gm-Gg: AYBFou05Uz44/ulRAItxDAZDxMdaKEPLpr/asXX+LY1GYlIEuICqmkw+bTNss70EVAX
	8V5sbtJrrBDF1Eh21X7m6QEo1eG/EolIjCp01b7bNjL7odvzHP9CWKmmk/5aPfzHl5RD8d91rcC
	WUbrXjc/XZDlxRIc2lXnNAIACB2XfCZgJwFjv69F9ibMX6sS52GczJ80D8khZn9ZJkxnKjvSuPc
	pmK24K2qjgK3DINlOoNX/Kf0MmDj6hxtVjN8zI7N1bEZMmydj+i7vW/Vkx+ZHdWQBK8BpWP9P7D
	I+52k20NzXK17i/cyr3+IZ330B2xwNaOu8VCiw5furWfWlHrBPv5WF92Eby4/iWFYB59fpgZFQP
	hvNwRQHImj87W1HE+k4ZrRecJarWirQOjtlp8HffJjHmI/Khj9RTlfvSdb3oerGCiUTibaYTSZ2
	289zZcRlXd6c4pmlWlXiaYnQXE0FwJQxIv4Z9sIKRYKspeiFYsIVIUlAKxTttJcY+w5870uLgCA
	mF9TGgHq8QMpYi2vg2WDMvHNxpKl3PPEQGz5AV5/z8iOPCi76JvFVnxD4rQB5HlSBJ+dDcNFnJu
	ryhsus8/EJ8OdbAkPPEejiHsASMOLtD1+q8CTR+Pj6I8EFS5HQLdUgAJQJb2I6rI75BxzwQmTcU
	kNOEVQ5kBtOE4r3ac5/ZHO/GbHuGh/QK9
X-Received: by 2002:a05:600c:1d0f:b0:49f:faa3:3ca2 with SMTP id 5b1f17b1804b1-4a1fdd14249mr60316635e9.13.1792605930927;
        Wed, 21 Oct 2026 11:05:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c6:e6ea:6401:f04a:ac6f:988e:f33d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd13891sm47007775e9.2.2026.10.21.11.05.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 11:05:30 -0700 (PDT)
From: Nick Simpson <nick.simo@gmail.com>
To: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Sridhar Samudrala <sri@us.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] xsk: document checksum offload handling in copy mode
Date: Wed, 21 Oct 2026 19:03:28 +0100
Message-ID: <20261021180329.26358-3-nick.simo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261021180329.26358-1-nick.simo@gmail.com>
References: <20261021180329.26358-1-nick.simo@gmail.com>
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

In copy mode, XDP_TXMD_FLAGS_CHECKSUM requests are now left to the
device only for the TCP or UDP checksum of an unfragmented IPv4 or IPv6
packet, not IP-in-IP or GRE encapsulated, on an Ethernet device; other
requests are completed in software before transmission. On devices that
take skbs without a linear part (IFF_TX_SKB_NO_LINEAR), every request is
still left to the device. Say so in the description of the flag.

Assisted-by: LLM
Signed-off-by: Nick Simpson <nick.simo@gmail.com>
---
 Documentation/networking/xsk-tx-metadata.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/xsk-tx-metadata.rst b/Documentation/networking/xsk-tx-metadata.rst
index f240930ca1df..028564dba43d 100644
--- a/Documentation/networking/xsk-tx-metadata.rst
+++ b/Documentation/networking/xsk-tx-metadata.rst
@@ -50,7 +50,12 @@ The flags field enables the particular offload:
 - ``XDP_TXMD_FLAGS_CHECKSUM``: requests the device to calculate L4
   checksum. ``request.csum_start`` specifies byte offset of where the
   checksumming should start and ``request.csum_offset`` specifies byte offset
-  where the device should store the computed checksum.
+  where the device should store the computed checksum. In copy mode
+  (``XDP_COPY``), only the TCP or UDP checksum of an unfragmented IPv4 or
+  IPv6 packet, not IP-in-IP or GRE encapsulated, on an Ethernet device is
+  left to the device; other requests are completed in software before the
+  packet is transmitted. On devices that take skbs without a linear part
+  (``IFF_TX_SKB_NO_LINEAR``), every request is still left to the device.
 - ``XDP_TXMD_FLAGS_LAUNCH_TIME``: requests the device to schedule the
   packet for transmission at a pre-determined time called launch time. The
   value of launch time is indicated by ``request.launch_time`` field of
-- 
2.53.0

