Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181883;
	b=plGw7KHrhtv4dtYTOv5lS0+tpZwQ5tM+VpUKra3IXdmws4ZesR1zqXnJ5oCLO3wVR4cE
	 /sT6h2L8LpKevZ1XZjC1gnExYSwLVw0UutlZvICNiMwtUeoz3sYXY0rqLl88BzPsn4HsP
	 k7ckyKID6FnMxpxr3gKjxQrUWo6+tcR7Xxs5YaRg7osCj+36ZGxrPxZf9UTlKgZkjTJc8
	 LAX1aFCl3qAIpg9+dcftMwykGk1BP8pV4pu+29Iv9Y3OS7w2tqISQeitC0Q/STqDqyLMs
	 IZOiWO7GgGMHWvmwiX9m5fBa/3UkCO348AwtcOkMCbI6FW5qd5izhNy1JjsMpnmiiig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181883;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=RxoX97usnlKPjzqSx1gqdHyErPFxwiy+zxZuWDx1DPg=;
	b=pG7EpXUTnV8FsJJnPGhx6vNL+oab07XhNM6+vOWDo0A64qkn57/deK3oIP8cOhSD8A3M
	 x3ExxS2C0j6lO26WYsx1n0UyaGPLFAx9vTF9YuOX1onqdVNuSI2+Tp9Oob6D7PV0Lw7ir
	 zbZFCObCnfPvL47lO3j1rO+YKVm5wi4EXZsNTuWgA87WGXVPfPrO9JLdlrwWcipDUzP4h
	 UiHKBA63wXTB4l2ETDXmU4+15BW5mBgEhmFBWWefMqgp2J9wiLEWnrlR2X1wBqJajaDk7
	 HxkRglotMHpF6xwiPycacmSG301VBLBuE6WVijK3Y80KtDjiz9hq/74xWKmUdo7ya1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=pb6qjxebdndqlntqepcpjgijvq.protonmail2 header.b="Qz1/OduT";
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EC8606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95EC8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=pb6qjxebdndqlntqepcpjgijvq.protonmail2 header.b=Qz1/OduT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=pb6qjxebdndqlntqepcpjgijvq.protonmail2; t=1794181880;
	x=1794441080; bh=RxoX97usnlKPjzqSx1gqdHyErPFxwiy+zxZuWDx1DPg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Qz1/OduT1AlQn4CLyCcsu4Tr12MG2DE3XwWthOA+q/nTwSljFJCs2dc4RXB28TPA2
	 l5WgcasQDtRdPpK14a3/B1fP40Uc04SbI4QpVb7X/fLYPy9JaQESQMdQTAIRFEMOvG
	 k8jx1m0aYs+CnmEoFV6P1/0I5N9Qh5cog/Emmb8Sxo8mYE/wm7AFFH5GbZAOPlrp7l
	 BA96qIRxXxVX+TpCQ/TyWNxvgcSnrVO6fh9c1Ut3cVc6mixRxX3Y3GMUci0UPKdhRl
	 JtHjpUYx1m66sdF/gerOCHFsfN8pl9pwFIeJW+/7se2wjpMVKAlBxMOXDxnbmW6IYW
	 cY68yQaFC+0mA==
Date: Sun, 08 Nov 2026 23:51:15 +0000
To: "jhs@mojatatu.com" <jhs@mojatatu.com>, "jiri@resnulli.us" <jiri@resnulli.us>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] net/sched: cls_u32: drop ht_down ref on hardware knode failure
Message-ID: <se_YnKsUIDyPpX0CSaIOaKht61bpYFwFGdmOcphFkus7Rk6NW3JnQsqMNGmDOjF1R4yTPaR_yeEK8clojDnh5Orl93J0kiHNJT7R3PkCxWQ=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: cbb6d2813dc525c521adab5c04a2b5b1794da474
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

u32_set_parms() takes a reference on the TCA_U32_LINK hash table
(refcount_inc at the end of the link block), but two of the three
paths that can fail after that point never drop it:

1. Fresh knode (u32_change): when u32_replace_hw_knode() fails, the
   errunbind path unbinds the filter and then frees the node with
   plain kfree(); n->ht_down keeps its reference forever.

2. Replace path: u32_set_parms() has already re-pointed new->ht_down
to the newly linked table B and dropped the old table A, but the
failure block then takes an extra refcount_inc() on A (the old
node's ht_down) as if __u32_destroy_key(new) would drop A - it drops
B instead. The extra reference on A is never released, and since the
old node survives this error path holding its original reference,
A's refcount is permanently one too high.

Each failed attempt (a TC_SETUP_CLSU32-capable driver rejecting the
rule) therefore leaks one reference; the linked table can never be
deleted afterwards (u32_delete returns -EBUSY while refcount > 1) and
is never freed with its hash array.

The patch drops n->ht_down on the fresh-node error path and removes
the bogus compensating increment on the replace path, leaving
__u32_destroy_key(new) as the single place that drops what the node
holds - which is correct for both the LINK and no-LINK cases.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), net/sched/cls_u32.c:794 (refcount_inc in u32=
_set_parms), :958-965 (replace path: compensating refcount_inc targets the =
old node's table while __u32_destroy_key drops new->ht_down, leaking one re=
ference), :1191-1202 (fresh path: u32_set_parms then u32_replace_hw_knode),=
 :1222-1238 (errunbind path frees n with plain kfree() and never drops n->h=
t_down), :406-414 (__u32_destroy_key drops n->ht_down)
Longstanding error-path bug (the compensating-inc pattern predates the revi=
ewed window).

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/net/sched/cls_u32.c b/net/sched/cls_u32.c
index 91f4e64587..82b15ce312 100644
--- a/net/sched/cls_u32.c
+++ b/net/sched/cls_u32.c
@@ -955,13 +955,6 @@ static int u32_change(struct net *net, struct sk_buff =
*in_skb,
 =09=09if (err) {
 =09=09=09u32_unbind_filter(tp, new, tb);
=20
-=09=09=09if (tb[TCA_U32_LINK]) {
-=09=09=09=09struct tc_u_hnode *ht_old;
-
-=09=09=09=09ht_old =3D rtnl_dereference(n->ht_down);
-=09=09=09=09if (ht_old)
-=09=09=09=09=09refcount_inc(&ht_old->refcnt);
-=09=09=09}
 =09=09=09__u32_destroy_key(new);
 =09=09=09return err;
 =09=09}
@@ -1221,6 +1214,12 @@ static int u32_change(struct net *net, struct sk_buf=
f *in_skb,
=20
 errunbind:
 =09u32_unbind_filter(tp, n, tb);
+=09if (tb[TCA_U32_LINK]) {
+=09=09struct tc_u_hnode *ht =3D rtnl_dereference(n->ht_down);
+
+=09=09if (ht)
+=09=09=09refcount_dec(&ht->refcnt);
+=09}
=20
 #ifdef CONFIG_CLS_U32_MARK
 =09free_percpu(n->pcpu_success);

