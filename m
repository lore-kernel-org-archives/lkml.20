Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A3046D566
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461127; cv=none; b=A7Vbfa4cUf4H0FaUJ3RrluZHbYQFS0iXH06K11GiLxzyCDz+MrNPxzDK19+CnrRHWNGUPFqQdxdCHJVP6bbFc+NUQfj2Gs4ejYJycO+mMb9VnMB53q7Kf9XtAQBaivh838Ii9XWl230l3NN+Vzfceh5Wsp5FGVenF1pcvI5p5pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461127; c=relaxed/simple;
	bh=Kyljv4Ok0VOKC1521YIj/5MqOlgJleHDXLfDK8e9KT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiHnrbj7QNxsogzwSzRMraYbgWBakP53WVY4lxRJO2L4Dum+9WZikoaia33fWYUaXWS3C0FGggD6jSOGXLCMKTdpwhi+/LUUR6QdMqgrELuW2C1d3n0u4JqyJNOmcwzI/wjk5jpxuJiIEYtRNAX60wIr1yE2tPr2bocX0K521CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=Rnt5tVig; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="Rnt5tVig"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f57db8b5a4so3782733a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789461124; x=1790065924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfGU+d0Ce1ol/Tm6wjF345/Jrj4e+fpsFxiynd3zRTo=;
        b=Rnt5tVigCJj0q/pFXAwYDku7SgTsY3dWgTxjngrf7YNBsk1tCg/+rtVgmmaWCJqDjH
         NLDhhTElv7TslHWuELgFXkuUgARszo1kR/eFg5CM5W5786Oc/9U9KudzH3XeAjMu1Gxh
         CSqJzZe/1w6H+8rW7Fc11WXWAMrujwIoXC9eXw936LXRuM/ruRv+APnrGUFlpUzhb4Qn
         +2QSnG4Id6X0AtyWnk42yARftwNOCtKKqPSIwMlk42xAoxEUVN2Wli379CX43la5wrZT
         CzIBotBiAQ4aJU/Wfb/ed3yNjm0YkBwjVDeJ+O0u2Kj1qqVWxy+KoS3QwNkd991HJeWs
         dKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461124; x=1790065924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfGU+d0Ce1ol/Tm6wjF345/Jrj4e+fpsFxiynd3zRTo=;
        b=2wY00sWfh7lV9sae95TAXLuP3XQub9DU5jHQMy6aiOmaDjXUAoEkTQ+ViBTXFn5rTV
         7motRjsqfPT+YhnhqN9Cqs470M2GOqaN9/bhEduBez1be4IQrvQpi5lmeyLX/1baLSHt
         L//G712bn9+2WP2s5dFJ5zT4cq/wgp2m8f61K+ENeDF/S0IC74snGM/hjLXRJnKBr3im
         Xb87wE2olDOKqlBQdmL5Fi1e4hAXmoaI4zXNxw7t4SiEI7kqAUi7hqRECU891yhe5h/c
         lCNh4UYC4B0lFRhLaezT6tJMZoebtIo4sIiq5y8Zt/z0aO/y/o7MNRlvFcFOBypxqvd2
         rtDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXWsF8ayEMPF1CgFkemP0eFkXO67Qq7tGFTEbzBLa2v0bqLMH8ZQ++GwY3GQsyo4t0yt3I3fnaQbYfZTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++miazr2KBgmhnonR1pOixcLVqCkG77HeTRCirg6xvPsGOEGjldL
	okmWtn6KLDwL4IU2P+6Gx77S5ZyM5jcTvSyKDxprXUmgmIkL5MsHAaLylss/lDImfw==
X-Gm-Gg: AYBFou35TaqDGiaDTcedOVlTd6EHDmDhhh4brVmuJomDLX9dEWIxcYcggmRZKc3T+iC
	nGgQEDAaiLbZygKWq9QvFkQwqImk8iRbNK2JNkwLTw+T4wA2zOTxRcRmxcx3Q/5XiLXpa/1XA9a
	d932BmAdg7f7Ehbr7XWZ62nu+d67gqurVd0Zkg/II1E1Tb8HzVUtohQQ2mZQqGdPR6ksmX2+uBK
	DmvpPQGNAur2USTgerEmhguEwQOV0Xyj/Xr4akXHxjfiXPHWjyDMeEOcxF6L5n6VHHwH1LcoFyw
	ztuNEtVV4BR0cPQsGcnF6F12tYUIwQwYFCBeCnksZWItUTWl2woFmTWP1kSaZ4KXQpQLKPUHCX5
	HHYv5lQ1qBOFVOjqkOzSdy6dyA9MOHA+opKHenIVZEYL/vOsHWLir6o3ZzKvr/V5HTuL1mL/lDG
	fTOJqbBnnFso6ZebKvxZDN1tEEE6DRzm9NJBQIZ/4GaZ9Acsf2CPpc+xRy8RrFFMEvTCrLHGd+a
	s3toLcqwNbKCneZJtFLxqNQi6P4jA3D/BoilhfAjTSXMwR+mJolESvv
X-Received: by 2002:a05:6820:190b:b0:6b7:83d6:2925 with SMTP id 006d021491bc7-6c5423435dbmr3269444eaf.40.1789461119455;
        Tue, 15 Sep 2026 01:31:59 -0700 (PDT)
Received: from xps.tailc0aff1.ts.net (149-169-99-5.nat.asu.edu. [149.169.99.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm13579723c88.6.2026.09.15.01.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:31:59 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jakub@cloudflare.com,
	Xiang Mei <xmei5@asu.edu>,
	stable@vger.kernel.org,
	co+0ea1ac045375cf05@bugs.sh
Subject: [PATCH net] vlan: require the MAC header to be present in __vlan_insert_inner_tag()
Date: Tue, 15 Sep 2026 01:31:52 -0700
Message-ID: <20260915083152.705309-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__vlan_insert_inner_tag() only guarantees head room via skb_cow_head(),
never that mac_len bytes of MAC header are present.  Its ETH_HLEN
wrappers - __vlan_insert_tag() under skb_vlan_push(), and
vlan_insert_tag() under validate_xmit_vlan() on the generic transmit
path - therefore rewrite the first 16 bytes at skb->data: a 12-byte
memmove plus two 2-byte stores at +12 and +14.  No caller supplies the
bound, while the pop helpers use skb_ensure_writable()/pskb_may_pull().

An IFF_TUN device has hard_header_len == 0, so packet_snd() accepts a
one-byte AF_PACKET/SOCK_RAW frame.  The first vlan push only sets a
hwaccel tag; the next - clsact "action vlan push" or
bpf_skb_vlan_push() - enters the helper with skb->len still 1.  The
head comes from skbuff_small_head without __GFP_ZERO, so each push
drags bytes from beyond skb->tail into the frame.  After three the
one-byte send leaves as 13 bytes carrying 11 bytes of uninitialised
slab:

  0000: 5a b3 62 12 80 88 ff ff 00 b3 62 12 81
           `------------------------------'
  only 0x5a was sent; the rest is slab, here the top 56 bits of a
  linear-map address

Require the MAC header the helper rewrites to be present, so such a
frame is dropped rather than transmitted.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: co+0ea1ac045375cf05@bugs.sh
Assisted-by: LLM
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 include/linux/if_vlan.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/if_vlan.h b/include/linux/if_vlan.h
index 20cc16ea4e5a..4846032bf4ff 100644
--- a/include/linux/if_vlan.h
+++ b/include/linux/if_vlan.h
@@ -365,6 +365,9 @@ static inline int __vlan_insert_inner_tag(struct sk_buff *skb,
 	const u8 meta_len = mac_len > ETH_TLEN ? skb_metadata_len(skb) : 0;
 	struct vlan_ethhdr *veth;
 
+	if (unlikely(!pskb_may_pull(skb, mac_len)))
+		return -EINVAL;
+
 	if (skb_cow_head(skb, meta_len + VLAN_HLEN) < 0)
 		return -ENOMEM;
 
-- 
2.43.0

