Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181924;
	b=EZZ4xN5zgePhwg76wpo5RoqH9nN8fcw7O7uPInOMJ+3d2KiV0xX1yyuXJfKo3439IsXK
	 tDulyGaYKpc8U2s4RjcsGzYvvJmMC5bcQqostRsanFLKE9ayaD1Cs9mY2rdlP//FgIGdl
	 6KOHZ31jVKHYJDx4iIV+6bN9irpvz+hBpUDS/hrYXJPfyF6BmBgpDiQmG1/FZrROUgXNl
	 2XJBON/dqh5TlkzfsEmjFPzmOhjfWanzaWIy6N2sEp27d3HB9ik+/YiEGxRRirNQtN6Ur
	 PLRdAXOlaZnLmzsvzOP0eMYhKrQBOCQ4GwcwnHRAyfOblW9Bo4FUIRKg1J7OLZSpunQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181924;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0vb17hKvfg+UWrOPX/R7QP9QB+Z1mQuaDjo0KL9LsfU=;
	b=oE2844gm4in/CL5/nplv4eYSJCVNJsJSVQ2zY5ns7DNy2qLiwBCSMLq2vzyq7TWyjok1
	 ldtgzHBxm6A2sWOmAY767TIdK9+/3fTT4GNETURPhA1LqiqNGAkNfx7WqxgGYVX9F2Knz
	 eJNJmfaZVZvpdKOakjfeRTz3s+iKIUZkNawGmSTY39CBH7tv1+RmvZDuRVEdRa5NG/cZn
	 RP3cvKXV6GLpekSNF4Ae24DzAUPs+ksZC/aZfC2c8aycw5GrzpuN0plfVBlxOzrNgr/In
	 h8LRdjgTuvCqdkCzttqNB7d/lmTBh1w7R8QtZ1rjoyxe5nXQj981D2VzOM+djRjm5xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=f3jwf44atjacpoekefdhh7bv24.protonmail2 header.b=jfsUh+Lb;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E3606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9E3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=f3jwf44atjacpoekefdhh7bv24.protonmail2 header.b=jfsUh+Lb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=f3jwf44atjacpoekefdhh7bv24.protonmail2; t=1794181920;
	x=1794441120; bh=0vb17hKvfg+UWrOPX/R7QP9QB+Z1mQuaDjo0KL9LsfU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jfsUh+LbNvTSMFRH58+wejZX5c9QiRpQ9U/orr4agm1YTPe6RGWg06s9PsZoCLt5y
	 +tX0rnHMCYfBTKUiPT8kcXeG/uK7/9UCK3Ht8oCX83N0+sSPRZUSLYpQ5TpWmJN2+P
	 VZkuVITF2tGNZLtuMjc9y+nFDTYs80hE8BBaYPotR2O05H9wAWOw5tqbkQPXgYrRT3
	 ZY3vX69tuSHScPi9VeK/wWBEDmXgHV9D7hOhmD84cvMXvosPKQNB6mCg0BcEWfBotG
	 jUCIm2WmjE+eS45C5HJgyvhFsviDs88NW/GGut/FonLiZyT+2gxFSr7oXOrtUgcsPl
	 06BCS0eRPJe6A==
Date: Sun, 08 Nov 2026 23:51:58 +0000
To: "jhs@mojatatu.com" <jhs@mojatatu.com>, "jiri@resnulli.us" <jiri@resnulli.us>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] net/sched: cls_u32: pass classifier flags to u32_replace_hw_knode()
Message-ID: <G6G67uw6DgjbtH1wkw4KSuzSdb7PAa4ZRBCn2Edb3aH851tValS2jOq3CuKBK2Hht2qqD6FcCjEFOjG5lsmIV_ctkuIr5l4kPN_vU5AeQ2w=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 465310ba9fe0456bc226852c78c40a50a390464c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

The flags word cls_api passes to tp->ops->change() is in the
TCA_ACT_FLAGS namespace (REPLACE, NO_RTNL, AT_INGRESS...); the
classifier flags (SKIP_HW / SKIP_SW) arrive separately as
TCA_U32_FLAGS and are stored in n->flags. u32_change() forwards the
action word to u32_replace_hw_knode(), so inside that function

    bool skip_sw =3D tc_skip_sw(flags);
    ...
    if (skip_sw && !(n->flags & TCA_CLS_FLAGS_IN_HW))
        return -EINVAL;

can never trigger: skip_sw is always false. As a result
TCA_CLS_FLAGS_SKIP_HW is ignored for knodes (they are always offered
to the driver, unlike flower, which checks tc_skip_hw), and a filter
installed with SKIP_SW on a device without u32 offload is accepted
and then never matches in software - a silently blackholed filter
that the dead guard was supposed to reject.

The patch passes the classifier flags (userflags) on both call
sites, mirroring what u32_replace_hw_hnode() already does. It also
un-masks the related hardware-failure error paths (previously a
no-driver environment could never reach them).

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), net/sched/cls_u32.c:550-587 (u32_replace_hw_=
knode computes skip_sw =3D tc_skip_sw(flags) and gates on skip_sw && !IN_HW=
), :954 and :1200 (called with the cls_api action-flags word), :1028 (u32_r=
eplace_hw_hnode correctly uses userflags), net/sched/cls_api.c:~2460-2468 (=
the flags word passed to tp->ops->change is built from TCA_ACT_FLAGS_REPLAC=
E/NO_RTNL/AT_INGRESS, not TCA_CLS_FLAGS_*)
The action/classifier flags split predates the reviewed window.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/net/sched/cls_u32.c b/net/sched/cls_u32.c
index 91f4e64587..bdb131b172 100644
--- a/net/sched/cls_u32.c
+++ b/net/sched/cls_u32.c
@@ -951,7 +951,7 @@ static int u32_change(struct net *net, struct sk_buff *=
in_skb,
=20
 =09=09u32_bind_filter(tp, new, base, tb);
=20
-=09=09err =3D u32_replace_hw_knode(tp, new, flags, extack);
+=09=09err =3D u32_replace_hw_knode(tp, new, userflags, extack);
 =09=09if (err) {
 =09=09=09u32_unbind_filter(tp, new, tb);
=20
@@ -1197,7 +1197,7 @@ static int u32_change(struct net *net, struct sk_buff=
 *in_skb,
 =09=09struct tc_u_knode __rcu **ins;
 =09=09struct tc_u_knode *pins;
=20
-=09=09err =3D u32_replace_hw_knode(tp, n, flags, extack);
+=09=09err =3D u32_replace_hw_knode(tp, n, userflags, extack);
 =09=09if (err)
 =09=09=09goto errunbind;
=20

