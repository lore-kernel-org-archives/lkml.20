Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080662;
	b=OPOTFvZOFBzg3dQVPVCB2xUSivovq5lC6n1UU63cRFhQN0MUW8IrC0o1XDbrIlHUPfJq
	 4kF9syBXL8DavUnaWk2uj4NAgAUt9mNhXmr7+Foa0xRvqG690GHIjsq5vFM0h996QtEBu
	 nxiBpYfoX78ipot53P7pS1fNN28e3WMdx/0UiGhY3Uk71UgwOfECgJfn/ygxW14An6xj4
	 1BFYx0YUWQ5pNpHrjXPYzDqfZaPd0c8OLLKhlVwBGcKOJHzp78nPY6TAYusRc+P+TNaPo
	 iMdGNbaehSG3mrwKacfy1XAFzccLD+sEv1VY3BkAaD+MMO+05gQxQrsF4p9qxgv8XfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/52ToiBN9dNVSBlBF6GOm1T2xgM8Y/pYcMIFz9gueFc=;
	b=j1qwGHdSaOlkNBCF0D6OObdjaqQHqnmKR7SZKqpeb8LCd/4vbHCDnwBT54w8NqLgKlfE
	 ZEHWjRKQ5BnZ11GTfDxmsLzwmJii8ULmgGLWcgJHvuF8zCFNZuaz1wkM3ojMMlIl6Pv8K
	 Sar4eAp2oz4Gq4zrCYh5pfWJ4Mtrp7n317xrKCyA1TWC/+6ndLi6ZigKu+pL1DmHqdpin
	 q/O4I4M646cJwsCHUWtJkfE7Sq2JKIJBuJbM8CnAH72a7TsQlV9iBfjKaeyv5Uh3CfDt3
	 ipINOljcycDEK641aoA59VCeh1aw+gYK8YuMjZP+HgZQT519HbaCf/UBvHOwwJNcAkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=ZWpfhOgL;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E3D606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9E3D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=ZWpfhOgL
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6dd7070699eso1168834eaf.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794080661; x=1794685461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/52ToiBN9dNVSBlBF6GOm1T2xgM8Y/pYcMIFz9gueFc=;
        b=ZWpfhOgLiyeMYaDDDQoCQsJRcKE3eMyWHW9t57rDdQXxoshjMWoKuWHZ7f9wg4f7WT
         ASaI+pG2VRgjqjkqgywLvKcvhLK3c/SmEHqiTvAL4QguzGdlJdq/qN4pBxtMPA1HfC4N
         ChfLMROpLbkH0s1HjuhlJJuYxu2bYrWZUKyLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794080661; x=1794685461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/52ToiBN9dNVSBlBF6GOm1T2xgM8Y/pYcMIFz9gueFc=;
        b=fjJTcWKrFVVhTgogxutkIxWaRzQJXbLmmm8Uh29vwGT+KbchsK+CWnp2KJYOF4t1c2
         lPGbp9Nn1enN7kqaYqtlO+sZe+xRUZNmlI3vpGOOh5tZ+WUh/y2rG7sH+OvNKQ3zeCW/
         TYw/a3FS7I62jd1WMxLzfTrQkSPi47stn3ffh/xZ29+dEu3h8NYVMcaJI0ofL0Oz2EDX
         tQBf2Y0QI7ZLPDWx6G+Zdhr3QAIGfnm3mTu5Od2A7pmX2gqSRgemPcnNyGW8k1gHMUk4
         a/x4xvdsDd5timQRUm8u/u3m+nJSWiu/Xcq3YGs3lMl7OzOtkappQTHJ4hDLNcFZ1CSo
         K16A==
X-Forwarded-Encrypted: i=1; AKwUvBwPUcCIMjnbGJgRvxGlpObQmKvGd3e6RsG4QhuArGb1zLUwaElhBrtKlz6qYxF8iIqmPtoJEV2Pquuvh0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NF0IADf4uiDToHOk3RwrE5ob4fh+7y36GplYAS2i/a5j9EiBo
	2YBYyLtmOH02NC6o775OTJCpLXw6QqPeJh0NlUIWr0Pm+6/E72Pb8LpT+cm9JjpH6TE=
X-Gm-Gg: AYBFou1axacNwA5Jag8DgvSdsOSAMwZ5I9rQYt936kkIz1bveZh2i9eXMOAC8mUe1CW
	ky0/CqCk/A305xHo7GQA6YJx/rFd2uOwxa50g+CnWDzUxeDzS7GMY0KXbFAdEWb5LCiip3wob/K
	/r7Y6c+OKwRDNtMCD7oLn3CRiaGtrti0LjtQfEYoe7EvLfr76hZIvoLCBs9RwdTCZb/kg3hyBal
	7/bTpZVf7+dn+rA/puF3Uc55Ik5OLx8GvA+2KPTj5haAOldiD37MCEzIak+GWGK5D+Sg0u3EBM4
	DMg+IgIXq+gBUC8UH4yf1t7koSYrItEd6YwPR3VF2NMFAP5o30aHXvnfMbJN1bndiwOmPP0TBH8
	uPGutYl8n/0h90xXFHs+vZlHccrC2P0XNkRcZDHidedZRTHgW9wLp10yr2PloqKCOdlTHSXVAr7
	7XzW5KylRDf/n45ZMS4EDfyHNzIuJyTadaj75DJdjI8YGGUbg7kdDt24nUGUu4FZtSa2uKHAhth
	2glbOUHBbl/CsPKLr25Q4DkhiMJY2bvIjLbX+N00DFISSU8FYS/T5uROCOFq9OdMY2OPviXJjDk
	GZHuKXDSnmUylEXUb58vTLnv9+NDEZkNM6lNtIbq0F1G+xQfC+9AsXn2NoAAw6p9//n9NaPS0Wm
	Y8162nYbFoZWnJfyQQCQy/9u3bdER8Q==
X-Received: by 2002:a05:6820:4a02:b0:70e:1dd8:6695 with SMTP id 006d021491bc7-716e78e810fmr3171706eaf.37.1794080660666;
        Sat, 07 Nov 2026 11:44:20 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e9fa7ec0sm4210706eaf.3.2026.11.07.11.44.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 11:44:20 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] netfilter: br_netfilter: reject unsafe neighbour devices for DNAT
Date: Sat,  7 Nov 2026 11:44:17 -0800
Message-ID: <20261107194417.99328-1-kylebot@openai.com>
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

The IPv4 and IPv6 bridge prerouting callbacks classify DNAT traffic using
the logical input device saved in skb->dev. The physical input port can
have a different bridge master when prerouting resumes, for example after
an NFQUEUE verdict. Netfilter reassembly can also combine the first
fragment's bridge information with a different fragment's input device.

br_nf_pre_routing_finish_bridge() replaces skb->dev with the port's
current bridge master, but looks up the neighbour using the existing
route. This can put an skb with skb->dev pointing to bridge B on an
unresolved neighbour of bridge A. Deleting B and resolving the neighbour
on A then causes a use-after-free in __dev_queue_xmit().

Before calling the neighbour output method, check that the neighbour
keeps skb->dev alive. A neighbour holds its device, and a VLAN device
also holds its underlying device, so allow a VLAN whose real device is
the bridge. Release the neighbour and drop the skb on a mismatch.

With bridge-nf-filter-vlan-tagged=1 and bridge-nf-pass-vlan-input-dev=1,
the logical input device can be a VLAN such as br0.100. The earlier
route-device comparison then succeeds with br0.100, but this continuation
changes skb->dev to br0. Comparing dst->dev directly with skb->dev would
drop valid VLAN DNAT traffic.

Doing this in the shared continuation covers both protocol families,
including a queue in the remaining bridge prerouting hooks. Leave the
cached-header path unchanged since it does not enqueue the skb.

The issue was found by an LLM.

Fixes: 2948d2ebbb98 ("[NETFILTER]: bridge: fix double POST_ROUTING invocation")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v1: https://lore.kernel.org/netfilter-devel/20261030042155.73844-1-kylebot@openai.com/
v2:
- Explain the bridge-nf-pass-vlan-input-dev case in the commit message
  and the neighbour-lifetime comment. No functional change from v1.
- Add the Fixes tag for the change to direct neighbour output.

I have a reproducer for this issue and can share via DM

 net/bridge/br_netfilter_hooks.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/bridge/br_netfilter_hooks.c b/net/bridge/br_netfilter_hooks.c
index e15355ff215a..1f5c7f284e0f 100644
--- a/net/bridge/br_netfilter_hooks.c
+++ b/net/bridge/br_netfilter_hooks.c
@@ -307,6 +307,19 @@ int br_nf_pre_routing_finish_bridge(struct net *net, struct sock *sk, struct sk_
 
 			ret = br_handle_frame_finish(net, sk, skb);
 		} else {
+			struct net_device *dev = neigh->dev;
+
+			/* The neighbour queue must keep skb->dev alive.
+			 * With bridge-nf-pass-vlan-input-dev=1, dst->dev may
+			 * be a VLAN device, which holds its underlying bridge.
+			 */
+			if (is_vlan_dev(dev))
+				dev = vlan_dev_real_dev(dev);
+			if (dev != skb->dev) {
+				neigh_release(neigh);
+				goto free_skb;
+			}
+
 			/* the neighbour function below overwrites the complete
 			 * MAC header, so we save the Ethernet source address and
 			 * protocol number.

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.55.0.openai.911.g06873a30d2f3

