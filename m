Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177217;
	b=EFeSyH7w42Oza56OWJlkuqBc4NAmC0HiBtW2ZPibCY/9Dvz4YF2YqoViFM3+PJw3MFNB
	 JwiTFpwiMCpN9auVDd+7OsOQRTc7iYdSl3euh/+/xV19sEGqHb+qTbd7zRPRjWMswgU+P
	 G2ZX0ir97x7PZQ0ZUWAmc1TMy9nWi5KmoQinseiGth0jok19v8kHsZl5amDEVRCSl2LPJ
	 V4aXfbNbAUKj0a2ZG/YQdjTOjzkuoC6w0AfShLT0F1GMladwiIGf0eTXVpRehcK9vFdxb
	 ioOa/K5S4HnNMFAM1jWqNuD75Bzxkl3Kuf6hyX7UdaAPKkswBJJrQbQ0VJwMrFKJ4pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177217;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gvbSaS7GyP0cnYD5s+wxI51RSPVN+a6vxoEzW8zoP3A=;
	b=0DtRG0KrzwbBJenqZz9Hn1RBUcvX3FXG1SZR+6aRS2o7ECbDK55g8i3QhSh30RoHsenc
	 03qilwSljEGjBA8Gwr0wnxfEBA2Siz8X6Zas3wk7u+pA/hGwltnwwWuvvJfU7n6/iAlS1
	 dT9x3RRu4YA65R6mu9HBImoTB7QSEi85LLd1JXTtCCBJwxnEkXOaGm6YaP7WrvI3nrRiZ
	 wWDjHYNRriMrdzEHiITMcTaKpWA4llloLQYJOOk+/huSiO+BwsOGxgV8aS7L6VdsdWf8R
	 lNYJW96QETAaP4H1az8AL3kgR/3YgofhFmX+PmK6xm6ytaUiKGKoFZh5O/rQCliCP8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=4vvxxerpwbagjmsxqnscve37cq.protonmail2 header.b=BWz0BAFE;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1F4606A335
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1F4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=4vvxxerpwbagjmsxqnscve37cq.protonmail2 header.b=BWz0BAFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=4vvxxerpwbagjmsxqnscve37cq.protonmail2; t=1794177214;
	x=1794436414; bh=gvbSaS7GyP0cnYD5s+wxI51RSPVN+a6vxoEzW8zoP3A=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BWz0BAFEu2MuRTV+Vzqi32XqValaWjwnY/XLc+TJBrozYmhwz2J/LSk0Y8s8MiZ6v
	 xSeixP3zJ+6guxb7NCy0pcSWNjfxDEtUFxQEV/JJkukqKmzUZPK75Uyc1Qq5e8E6iy
	 H4YWS0KxZaShQ5V2XjfFgf3ThUhXOoKgt6IzVYchsiN5XcLAPG9rbLt8u9K6oqHQ74
	 inUMN2MgIXijXqjGH5H982jRHVlleNOrMLgjZkiNcpjUOoCgvHYDX3mKzP7I+q8lx9
	 /TChEJluhB34Eo3pFmb5pnzHvif+Ehn/95pGG48ZEgBxGFS7SauHRHB6dJqQvI802M
	 J1WeWdh1ZhdkA==
Date: Sun, 08 Nov 2026 22:33:29 +0000
To: "pablo@netfilter.org" <pablo@netfilter.org>, "fw@strlen.de" <fw@strlen.de>, "kadlec@netfilter.org" <kadlec@netfilter.org>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] netfilter: ip_tables: propagate compat_table_info() error
Message-ID: <YEo_4lnonRc0-_Jotuzk7hOaWl3QockF3xDwJ4cE5v8uBvy1KW27Eku0fWDJycuoZ9AgGFxsxgtSWI6SE2kNJ38eVnLx-HtApOhBw0wxXGg=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: cad6e748cbba3426e6e2549fa89e6176241586dd
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

In the IPT_SO_GET_INFO compat path, the return value of
compat_table_info() is ignored: on failure (vmalloc ENOMEM in
xt_compat_init_offsets()), private =3D &tmp is used anyway, and ret is
overwritten with 0 after a successful copy_to_user - so a 32-bit caller
gets stale or partially adjusted 64-bit-layout size/hook_entry/underflow
values instead of an error. The follow-up GET_ENTRIES then fails with
-EAGAIN. tmp is fully initialized, so there is no disclosure; this is a
robustness fix. The same pattern exists in ip6_tables.c; both are
patched.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), net/ipv4/netfilter/ip_tables.c:968-987, net/ipv6/ne=
tfilter/ip6_tables.c:989-1008.
Longstanding code.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/net/ipv4/netfilter/ip_tables.c b/net/ipv4/netfilter/ip_tables.=
c
index 809441c..e11a5af 100644
--- a/net/ipv4/netfilter/ip_tables.c
+++ b/net/ipv4/netfilter/ip_tables.c
@@ -968,6 +968,8 @@ static int get_info(struct net *net, void __user *user,=
 const int *len)
 =09=09if (in_compat_syscall()) {
 =09=09=09ret =3D compat_table_info(private, &tmp);
 =09=09=09xt_compat_flush_offsets(AF_INET);
+=09=09=09if (ret)
+=09=09=09=09goto unlock;
 =09=09=09private =3D &tmp;
 =09=09}
 #endif
@@ -986,6 +988,7 @@ static int get_info(struct net *net, void __user *user,=
 const int *len)
 =09=09else
 =09=09=09ret =3D 0;
=20
+unlock:
 =09=09xt_table_unlock(t);
 =09=09module_put(t->me);
 =09} else

diff --git a/net/ipv6/netfilter/ip6_tables.c b/net/ipv6/netfilter/ip6_table=
s.c
index 313c4aa..1d5749e 100644
--- a/net/ipv6/netfilter/ip6_tables.c
+++ b/net/ipv6/netfilter/ip6_tables.c
@@ -989,6 +989,8 @@ static int get_info(struct net *net, void __user *user,=
 const int *len)
 =09=09if (in_compat_syscall()) {
 =09=09=09ret =3D compat_table_info(private, &tmp);
 =09=09=09xt_compat_flush_offsets(AF_INET6);
+=09=09=09if (ret)
+=09=09=09=09goto unlock;
 =09=09=09private =3D &tmp;
 =09=09}
 #endif
@@ -1007,6 +1009,7 @@ static int get_info(struct net *net, void __user *use=
r, const int *len)
 =09=09else
 =09=09=09ret =3D 0;
=20
+unlock:
 =09=09xt_table_unlock(t);
 =09=09module_put(t->me);
 =09} else

