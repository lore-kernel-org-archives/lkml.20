Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867991;
	b=t2z9cv2V41eQ0SL1OxCE9DedeC157iIGX8m+btO3MiEPlBBxe9WglI71mEYFc7Kj+rAa
	 z3axPqV5fOmCJ1siNLmftNbtueiea5csx4aEvB62I7cA3/oLRX2TelF72yDo27V+RRt0a
	 kEiin3BZgVq/XCFrcxxOmiSNXYaCbVFUzeXq50GA8JwfDnNehOPYmoRUFEdywFXU/lble
	 oD2XzEYXuAwJ2++FLxc4C5gSAvTXHAO76yko4GJiwftdTDmvOVWEAB+h+e4pnkJgOJxSy
	 eaUnY8nLzkLJSXrSpxi2OC5kuFQZJr+LKueNP2j6khqNsrsuppsA/IWqtNKkfKP62fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867991;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
	b=yEwg9fj8zOUWcjb79/7Qa8BVv4N7D98e6V1tBz3jOS+IXd8ycY8sWGRiVQ2bWAn+XE6e
	 rTj5I64W+SuoKqx5qJTpkkRtyQoOrKYk+gUuIV9SWmW7nkk0edB+ox9yLzXZlv1jY6lI3
	 W7dB3o8nmjDlX5lUyTt2CukaU+l9iZXZy5hxCAX5KVAodJVyzkfWGKKN/vIVOS9YzEMq9
	 cZt1xdWhMyMj5p6o7A4s2ZTHxPS8kPOhEDubqGYJskLlpclAlYIsYcfJvJ5v0O75qg0VD
	 vQYUgllMQFJT+cFPPrIMDuwuPHFW0ghkJNzf5tIOYaHZ2UOTy2QKNReeNmHBorsJzAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXVYLoBe;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F93606A894
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33F93606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZXVYLoBe
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2075421a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867990; x=1795472790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
        b=VeLY4qkKrIesFfXFLD+0lbaIQmyfjuaxmmg+wP/UQj5qDNj3GRUq2Of30dI1PoIzaF
         8BS2wMPzUkqvLo/ghvIogYEuHIQo+mZ0C9n9m5uktijFp9m9uHEK2d4BYGCLK2JSuw2/
         XpmxgAxAcrUi8E24tldoKOTcQIkEVebDlwppjy5Td7v5lO0VpYTi+Z1pwNtbIWnx4I6f
         BP+5CkJO/vpwc82C74QWIxQJDW0k8eoakwnKOTVOj8cQFDWibgQztE7UYOI2BJEZBxbe
         AUjKrtVbkBCKPvM4JAFQfOCW5rehLVkaibsufRWM4uflEKVGiVocx5hcM/b9+4R27ArU
         EOxw==
X-Forwarded-Encrypted: i=1; AL+hErFYwk2ozL6wwVzYnkww7uc0SGuMKqInLWhSlBr+5Xsq/PEJsXuB0MVbcsOrgmUs5P4ALcMKQsMTfIjdo8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z91SBjudoGrPUk/y25/vqrw5ahWflaZoBUeAaFEIVrKGlMUCo7b
	561hkcWRzJ4Xt4eYf33Rpacoaf3f7I2SJonTNs/8oXQ8RL+0zbUHHkZE6SNjLfm6RsFBpDni/rM
	cDsxP3PaOXaIj5LVMBiCEScGFRvyJ/u/Ty9JCVM5t+m/p3BXSM9z50P5emrWl1VpqIM7fYHlodB
	FlUX2gtglPbvHsD7CbLUZUalp6F8XW4auvLZa90BXjSWQ8vPZAPuDcgvSpmqak+0I2m3DGJNzGx
	TEAeoQ/vlX1o+ADcjjsbcQ9
X-Gm-Gg: AZFdTZfYWDN1Hvvaa4XwPOdn2yXQfwOJXcc+30vvGMa9e7Wu+pkmYxgGkq503RGGKtS
	8ZrLKlji1ItHTtSuh264XTwCPoUG10d1zI3NyuzDvq1Ia7Wu2hDEbSBZddOtNtMUTco79okNYnz
	fctx1xYOCfMAcEpSTswjl7NkfIhGXrpjfJS77JLuQfhUAm8S7hacGoKKvjVSMj8Y0+XSzTdp0sG
	gdqD87wTwkXZAeHtNTw0bptUP4VXTI/Y7CySgLAOSCCYlr+rwoHTOSQnWBggdszIvlx9BACMAQz
	Ai0MI367ues498FO0tuVWaZns/rhCVDVSNEcZIhDXi5R/SejDY/WYWk1dUmpAqJHQUcVCgQFiTy
	vw0BVcpdbm4gmPkR8KQSlARGyf1Aoh++Apt9hC98DNtEQgw1KvDeUZGteqYbo/y7pUQ29NoYWTq
	8UYkzS6QTFaQxwiRY8ckEizhJP80nHwU4FGWgjjn1J
X-Received: by 2002:a17:90a:e016:b0:3b1:b9ed:5dd0 with SMTP id 98e67ed59e1d1-3b1b9ed5e3fmr6860237a91.35.1794867990343;
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c4bcf708sm3283161a91.3.2026.11.16.14.26.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so3533217c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867988; x=1795472788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwgKM/LUsmyzVGglaupm2j1ixL7nRDboOcNVB38JNgg=;
        b=ZXVYLoBeyjKuwDQQHfurKC/93+dEugF/FYFfNiIwPyyiWcQZ3lc4Z49np2Y8lLqFJa
         x14+TMrqyNZ6Ljz0yqlI39wpihU5gR1eq+/T7ksrIVVe+S6b2fKwf17Df5d8L9tmqYPA
         sJZUfmYkx53VWsG9RFS0ITZvAs3EWrL8Y36nE=
X-Forwarded-Encrypted: i=1; AL+hErGwQAfMDDto5wIKQR/JbCYFMBF0YFoX5MCeIw+6KlqBxPCsVJBYWvrTGNZqCarx4zew4O81WMUWEVxhrbs=@vger.kernel.org
X-Received: by 2002:a05:7022:7e86:b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b5030e77efmr10964761c88.9.1794867988116;
        Mon, 16 Nov 2026 14:26:28 -0800 (PST)
X-Received: by 2002:a05:7022:7e86:b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b5030e77efmr10964713c88.9.1794867987246;
        Mon, 16 Nov 2026 14:26:27 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:26 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 2/9] netfilter: flowtable: reject non-host IPv4 packets before lookup
Date: Mon, 16 Nov 2026 14:25:12 -0800
Message-ID: <20261116222519.1416501-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The IPv4 forwarding path rejects frames whose packet type is not
PACKET_HOST, but an installed flowtable tuple bypasses that check. A
packet addressed to an unrelated, broadcast or multicast destination MAC
can therefore be forwarded if its IPv4 transport tuple matches a flow.

Return to the normal stack before the flow lookup for non-host packets.
This preserves the IPv4 input path's forwarding decision.

Reproduced on BCM53012 using an active UDP NAT tuple: classic forwarding
dropped the unrelated unicast destination MAC while software flowtable
forwarding transmitted it. Boundary tests cover TCP/UDP, both NAT
initiators and unicast, broadcast and multicast MACs.

Implementation, tests and changelog prepared with OpenAI Codex assistance.

Fixes: 97add9f0d66d ("netfilter: flow table support for IPv4")

Signed-off-by: FLorian Fainelli <florian.fainelli@broadcom.com>
---
 net/netfilter/nf_flow_table_ip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_flow_table_ip.c b/net/netfilter/nf_flow_table_ip.c
index 19cafae748ab..98bade1b8299 100644
--- a/net/netfilter/nf_flow_table_ip.c
+++ b/net/netfilter/nf_flow_table_ip.c
@@ -911,6 +911,10 @@ nf_flow_offload_ip_hook(void *priv, struct sk_buff *skb,
 	};
 	int ret;
 
+	/* The ingress hook runs before IPv4 rejects non-host Ethernet frames. */
+	if (unlikely(skb->pkt_type != PACKET_HOST))
+		return NF_ACCEPT;
+
 	if (!nf_flow_skb_encap_protocol(&ctx, skb))
 		return NF_ACCEPT;
 
-- 
2.53.0

