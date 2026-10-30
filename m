Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334170;
	b=EVp2VsO0aMt9TUEyaNEkmDnogcsXeL8QtgFssp81hBPpk490pT2CBQ2J1MmFZLifZSnj
	 4f0dPRbpKCrZkJ/pJXt+7si7XBaV3Brm1VcfgUW661G40Fz8MSsZLgGCzU1FKz7Zx9CF4
	 kihM08B/sskuQsYdLB4MsGGTkd6ZnIWOlriqoJft5PdjU8P4I/mk0cdPg86otPRRxugHe
	 Zdo3ckYLbizcCVYNOZ006P4cLQyGKP4vmCViggg0UuDg1ui0Asi5XcCAOdRby+Kqm3/mj
	 e+MIzQXNWtpwCDDUBXkw7ySRn6LpTOul3XKZop2Rl9yiUO0Eb1I7I26DCYm4O5OKTqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oPIl+2oEPHabOjWk4tVLNrKPICyr6qT8RKDg7WJU7ek=;
	b=v73e36ZLWHjGn1x6RQpX022f1fHnuew394RpnZo6PcYK6dnPLobcCnXTHXKACRr7eUCv
	 QGwJf6nK0iD/aCyalCrFZ+R/5obOqZ7XPJ+g1MoPW/T8zNh903JgNqaxV20WpRRx0O9gO
	 w1V+Q7qMISTdfmVGucnM2KYTdF1L0ofs6fHI+yN9yWhaP5Y4X3NQAokkQwCWxaBoJ+KHa
	 vhnJ9AoN+Jqzitj3vKgA+r6RBsw79KhUWMxyRJQrwVbh1X+w+0rBQtfD9Pg6TNynNdOZu
	 K9Do8C20pReHRbRjDeDnD4zDnwl0awBFcH1x/AztrrP7rHMScOR6QfZILUYXgwtzBgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Set+tV4o;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D3F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9D3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=Set+tV4o
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-705cb6cedd5so1013094eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334169; x=1793938969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPIl+2oEPHabOjWk4tVLNrKPICyr6qT8RKDg7WJU7ek=;
        b=Set+tV4obQ7M7+4r9gKQeiwhgOCufLMNr2KdJwsQTj9HuSGBAA6de41f359kIORSUg
         0F6ccfZDW0xSvbKtVK6dp1TMou/jhe4DDYq9dM5YJBxk4fj435JuJhEwq09ORWmZEc1g
         9XkHelDcwfnmoRJT6CC6birnv/uRC1W6h1SlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334169; x=1793938969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPIl+2oEPHabOjWk4tVLNrKPICyr6qT8RKDg7WJU7ek=;
        b=BCVKaM15OAvJMyiV5t661CNdIm9F+f9sAHJWoTIIKzZRlWpCN6jkQGVFlO0iNN/KXA
         U8GcNlOJvgdr0+3wAgIWZEm8AH+uPIiebwRjj/eT69/OBiXjuaTVNyHzeokRIKO+fcT6
         i+BsD3HLAPvJWB3nWtgcQY3NbS5ZZAzq7VnKXU2UZAeV4W+cYz5CEcsa8MN1m6V887PX
         gd+socLH1Fr8X5AugVYigWqJxo8RLzbW40CJ1Rwdan3oiwE2H8ujtrizLa/Uqg8wRKnD
         bEwIMR8krV8bir3SjmMXooS5mqzL7dwc3AX4dEpOk21VcCe/HPxj1YSOEVnsXD9Cuvr3
         QmKg==
X-Forwarded-Encrypted: i=1; AKwUvBzqqlhcdc/NQoJiSHC6+IDRdRCFpSfm4EXOIUi1N/yb9nHxo6nc/AZoxfNJGhNAYudmQqDn+SasN2f8RTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVI2qCJItyPNvJU2BP0fEKW5fVkSQMxtblLtB/OPLq+UQXODCK
	T0TjCQwGZ9h1IVZ7KIHra9soLHmy5y/rrPZRnRzCZyLHKMLeyPPhBePVV5KCYeTrmm4=
X-Gm-Gg: AYBFou0VnW88lDmcmswZqN8LvJ2a9OXrZdqb2ox/bZaTUAOuB5sK2qGjRIKfa/TcuuQ
	Df4ODDw1ukoq5ptnSrAPOTLkVczvEFl0oSRR1oTjlFFKd+Bn47pQ8B27a+UcYOMn7eqPFdOMd0n
	CESGZH1GZtCz1oR1pXFVO7ft9NlnRzGGkL5qYqFzGO/eaCQxi50Rd7hLFthxjhUbvqN0oNSJt9k
	z2lcoOXOBNTt1xxozP8xO2Cg71zQF4rpjslTA3rOLmy5uMy7QfRFofzOnHKTUedheaUm5xfM9jZ
	ZFTb/rnjnO9ucXQNj3X5vMLI66yftBI7cvBCurjI0zdlFFUp4Kc9VwWtEy97SObf3oZfAiNxsrL
	IZU0Jhkpso8tqcGVPt7LY9nFOHit6jxnhBO046L3ORIqCQ4YXXz4hHqiUcPLuQbckdoeVr7dx0g
	OEhlYBHg7Ab6WpBH6aqyHzH2kJtL/iEwcdCKzN4yCoVFPS/2jTN2XK+cAtEXPP5agUGlCLFm9ZC
	udWaSfWG7eMA18ROE4Rt5vbyMD1mHnFJObc1az0zC/+v5n5SxompVCambqBNdEebmkqX0yfUCXU
	AT+ov7dxgIOP15JBFZmWQWj4qQkElu/wFoUDo2IjlOUIyBIYZcYv9u7Jvzw8OT4sucM3n60T3rT
	cAgpiATnwX+Hws4Lnx+wmcUQvHKWDsg==
X-Received: by 2002:a05:6808:bd4:b0:4e7:f052:460c with SMTP id 5614622812f47-5640df5a6c2mr657364b6e.23.1793334168751;
        Thu, 29 Oct 2026 21:22:48 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm691718b6e.12.2026.10.29.21.22.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:22:48 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] mpls: reject headroom that overflows skb header offsets
Date: Thu, 29 Oct 2026 21:22:46 -0700
Message-ID: <20261030042246.74144-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

MPLS output reserves LL_RESERVED_SPACE(out_dev) plus the size of the
new label stack with skb_cow_head() or skb_cow(). The aligned expansion
can leave skb->data more than U16_MAX bytes past skb->head. Resetting
the network header then truncates the offset, so mpls_hdr() addresses
the wrong location. The subsequent neighbour output passes the negative
skb_network_offset() to __skb_pull() as an unsigned length and can write
an Ethernet header outside the skb allocation.

For example, a netkit device with needed_headroom 65488 gives an initial
network offset of 65504. Pushing one MPLS label requests 65508 bytes of
headroom, but with NET_SKB_PAD=64 the COW adds 64 bytes. The new network
offset is 65564 and truncates to 28. This can be reached with an ordinary
non-GSO IPv4 packet in a user-owned network namespace.

Check the actual headroom after COW, including its alignment slack,
before installing the inner header or pushing labels. Apply the same
check to native MPLS forwarding, including its penultimate-hop popping
path. Use the existing transmit-error and skb disposal paths.

Fixes: e3e4712ec096 ("mpls: ip tunnel support")
Fixes: 0189197f4416 ("mpls: Basic routing support")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/mpls/af_mpls.c       | 4 ++++
 net/mpls/mpls_iptunnel.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/net/mpls/af_mpls.c b/net/mpls/af_mpls.c
index ad4ad6f2001a..4bfdb7c81f04 100644
--- a/net/mpls/af_mpls.c
+++ b/net/mpls/af_mpls.c
@@ -453,6 +453,10 @@ static int mpls_forward(struct sk_buff *skb, struct net_device *dev,
 	if (skb_cow(skb, hh_len + new_header_size))
 		goto tx_err;
 
+	/* The aligned expansion must still fit the u16 header offsets. */
+	if (unlikely(skb_headroom(skb) > U16_MAX))
+		goto tx_err;
+
 	skb->dev = out_dev;
 	skb->protocol = htons(ETH_P_MPLS_UC);
 
diff --git a/net/mpls/mpls_iptunnel.c b/net/mpls/mpls_iptunnel.c
index 1a1a0eb5b787..4eccbd911fe1 100644
--- a/net/mpls/mpls_iptunnel.c
+++ b/net/mpls/mpls_iptunnel.c
@@ -109,6 +109,10 @@ static int mpls_xmit(struct sk_buff *skb)
 	if (skb_cow_head(skb, hh_len + new_header_size))
 		goto drop;
 
+	/* The aligned expansion must still fit the u16 header offsets. */
+	if (unlikely(skb_headroom(skb) > U16_MAX))
+		goto drop;
+
 	skb_set_inner_protocol(skb, skb->protocol);
 	skb_reset_inner_network_header(skb);
 

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
