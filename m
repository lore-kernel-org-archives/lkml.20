Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182439;
	b=i7+P/16/gArKAwte9xijvd8qXQvxuAdDsTaAB19lke01ZEPma8PCZ4N50ECgVEIhkSNW
	 ry6cD+twf4zJAhuYWhzaPSj182zgCxu1+qMmARM8AJ4welFo5D39RKQxDFB2Sf9Wk/ZXA
	 Eng80K98uTIOYXimhIRfooLij1ruDRzTti0mmONV+JyMxJH9n3hq0WGFftLU/NQfissWr
	 tw4YjFLOiOzhgwaKZGLP/o7jeXKmL83iweNzftfm8dlGLh8/74XMBN6rYIhq+VwauhEmC
	 fTUf1ZCWeUwlF96x77jl1NpGWezp4ppL1Lkx5lJWtAmrM4bxtQjeWXo3lKhavKOzqQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182439;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Dfihs26Az1U1GPeabpD+h0pl41KlE1VWE4KCr5KtUm0=;
	b=kMAbXGxkMiyQuK/Z+R4/MNuWVtb4R2yhbnQHFYarF0O7XqC7H9vzPUvrfWyESc5otWkV
	 TI4FdcIKlWNTy91ye+zDaLRPAHRMA8cZ/2FkdLa3DBFoudFjeqvnGmpiKQrntlpcUPA4j
	 JWeKk3KsX/7qINBZQBRHANdbuMkCQKT5AMTXS4RWAYcnHm6eMHzPHB+cT4NwkvFmuynxl
	 K98Du6OQtyFrLnaIn9IehcMy3+X0jeAsHMldBwTwKCo65v1TUqQFO/TVlKwQleuUwrtfl
	 qUYskCGENYsTKtvOnbfWGVMdwPMj4L885F+JbQ/fFMx5FJccHgXR0R74ERoPKJX0RKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=hsb7tdqpynhzdjopzdno3frw2u.protonmail2 header.b=mfqLCDAI;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034A1606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 034A1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=hsb7tdqpynhzdjopzdno3frw2u.protonmail2 header.b=mfqLCDAI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=hsb7tdqpynhzdjopzdno3frw2u.protonmail2; t=1794182435;
	x=1794441635; bh=Dfihs26Az1U1GPeabpD+h0pl41KlE1VWE4KCr5KtUm0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mfqLCDAITL97zbAvNGGht/czO5AMuF2N2M6gADzXYA9U0DrEIEhSGjGnNJUHBLJpT
	 st3YXG0DxnI+ulG7nefRkB0YL6i9tZrbxfBTk6aeMjoudQOW2W9YZaexkXMbRp9KQj
	 3AgmQPJqQs8sXr744SChgBVWq8O1nySgduqJX2uOg5F7QKGjXR9zXH64SK5c98DgJk
	 qvsRO3Fwj+eGzrsGrIma1cAgDygyCeYk6diH/xs+m0kq4tfhySZO4kQHwiJ/zCjljj
	 ByimwNSTH7Kb+laDeCUzvY8TVGa9RC5UdGMwmgqwM093/8ZAiTCboSlebB0P//odpp
	 lERc3Dx+YpJJQ==
Date: Mon, 09 Nov 2026 00:00:30 +0000
To: "dhowells@redhat.com" <dhowells@redhat.com>, "marc.dionne@auristor.com" <marc.dionne@auristor.com>, "davem@davemloft.net" <davem@davemloft.net>, "edumazet@kernel.org" <edumazet@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] rxrpc: rxgk: round up appdata length when sizing the authenticator
Message-ID: <JrWd69mSmEJgT9k1yQauJtn5wGc0t2kIPWgYvvdhPK8GWvW9gVVXG2vYHZAGqFlH9eYznO0o-gq9OZ-K9jWE_iLMoiXheWlCBGSPh5cnKzA=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: 23938beba02b4a55eb3e7c6944a5fa51a99ccc23
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

rxgk_construct_response() sizes the authenticator from the
unrounded application-data length:

    auth_len =3D 20 + (4 + appdata->len) + 12 + (1 + 4) * 4;

but rxgk_construct_authenticator() builds and measures the
authenticator with the XDR-rounded length:

    return sizeof(a) + xdr_round_up(appdata->len) + sizeof(b);

and that rounded length is what gets encrypted (auth_len is
overwritten with the builder's return value before
rxgk_encrypt_authenticator()). For any appdata length that is not a
multiple of 4, the encryption then runs past the space reserved in
the response buffer; the krb5 layer's bounds check catches it and
fails with WARN_ON + -EFAULT (a panic on panic_on_warn systems) -
memory safety is preserved by that guard, but the response path is
broken for all non-multiple-of-4 appdata. The patch rounds the
appdata length in the original sizing, matching the builder.

Affected version/commit: mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 =
(v7.4-rc2 window, 2026-11-08), net/rxrpc/rxgk.c:939 (auth_len =3D 20 + (4 +=
 appdata->len) + 12 + (1 + 4) * 4 - unrounded), :893 (rxgk_construct_authen=
ticator returns sizeof(a) + xdr_round_up(appdata->len) + sizeof(b) - rounde=
d), :971-975 (encrypt uses the rounded length within the unrounded-derived =
buffer), crypto/krb5/rfc3961_simplified.c:560-561 and rfc8009_aes2.c:193-19=
4 (cksum_offset + cksum_len > sg_len -> WARN_ON, -EFAULT)
New-ish RXGK code (2025-era), unfixed in the reviewed window.

This was found during an assisted (AI-supported) static source review of
mainline 8a65162514fbad21a2c58ffed65f42b27e92b163 (v7.4-rc2 window, 2026-11=
-08). The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

---
diff --git a/net/rxrpc/rxgk.c b/net/rxrpc/rxgk.c
index 77a67ace1d..a4e767ad95 100644
--- a/net/rxrpc/rxgk.c
+++ b/net/rxrpc/rxgk.c
@@ -936,7 +936,7 @@ static int rxgk_construct_response(struct rxrpc_connect=
ion *conn,
 =09if (IS_ERR(gk))
 =09=09return PTR_ERR(gk);
=20
-=09auth_len =3D 20 + (4 + appdata->len) + 12 + (1 + 4) * 4;
+=09auth_len =3D 20 + (4 + xdr_round_up(appdata->len)) + 12 + (1 + 4) * 4;
 =09authx_len =3D crypto_krb5_how_much_buffer(gk->krb5, KRB5_ENCRYPT_MODE,
 =09=09=09=09=09=09auth_len, &auth_offset);
 =09len =3D sizeof(struct rxrpc_wire_header) +

