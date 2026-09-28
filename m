Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3F82D592D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639250; cv=pass; b=M5w/YeNU7QTpRla81r7G8dTJySdke4EOgl9kk9a1jz96/03lF0ELgce7eJ9ZQTOdw8V1uapVXN2zxp+OngwW3ciRZ+a80K2E/havXH8YKMNO5Hg8A14jlvsKy4mRavn55PVsSlg8ey+wnHRS/bb+N7XhoiJNjHo5HLs0gP1oe6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639250; c=relaxed/simple;
	bh=+snkxebuBNXBZk04SdC0odseMNd9Wiypwa8wfMsQQyM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AhuOAry7YiQtfJM2NoPL2Ic5DiMj8BSR1GFzTM9aOTXTso9okIxfcipZNLOU01SSYOTkVHyS63BU49JAlsDKAn79ITkwBWOcb3lyXLvhojyC7qwCQc2g57gLjqO5NJYHEMZbb1sDQpYZga+8TY+IOYHZ5l3gl2PFLOwTuQfK78U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAftoYlQ; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAftoYlQ"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a658f67032so20073271fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639247; cv=none;
        d=google.com; s=arc-20260327;
        b=B6+RI1fG9KoGT5BFhJVdeNEjyfkVOS8SdbbQaDm+6NtxMJ/oWPfEFpbju2aMx+yHlI
         fS7J5mAFPraBXCXlnPIvlk3k/QHmwXVksQtATxO/cGs1ImK4Z2HGP93PqT10u6eiyenX
         kKnOVJLXGoVdazZfHJbzJgDyIIsJsVyEj5iwIGYGT5RYim4ISd8YcJtYJiErLjfazrIk
         XfsCscBvxuIwXR3VZaiqfDSKo8rajNS8j1/tCikbMLoNN6bXOPHcz0Kg3SPrmJ9fyvOP
         pxFz0zqdJg9siy3t2s/8YQ5DTdsa5MCaoSyDA7526xVl54CFHYIOnhRrFUnEHneXKYVe
         +kIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BXFiB3UkXw4qeBR2wwwf1ZyTmNaVLsDH7LkQypp5lJ8=;
        fh=FMpGnz1Y5hJHNeEtb9P3Jb6HalPA+PY4MI2WiEKQuOI=;
        b=hxhb3clo7aq3dW49Z9efY9UfonkYwu2bbBiKWb8oFGiPEq+L8tby21R3apbVdy44mm
         pKT2VoVf80lJ02PrOwEKWOgjLRYb6lMA4H6CSNm5zrgowBpBp8IGPlPwa8MhsaGaPTZx
         p54BFkCXKt0ldSwI6LXseULeJm68zhPJEJo1N+qoKmLEsOxL88yPWdnf9qHZifWFuQJ0
         Pb0ZjWhUNW4QTOrvnATh8A3F4bUz89SQvbJ1Hj86lwCm6qgYEeiV3PweWmhnBBFuqJ/Y
         47YuqaLnsNujhyIzRKtYydN5HVx9wlukikwKKlvikhzo7viLigWEp4jFcLnpw8b/egMN
         T61w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639247; x=1791244047; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXFiB3UkXw4qeBR2wwwf1ZyTmNaVLsDH7LkQypp5lJ8=;
        b=BAftoYlQXinmB7oaOmQSiNvjFXHHVCUcaXCQIxoH0odzYq7GNnaj1E1O8pxVIu4B2r
         t0DNLhFyChQdAYur2YlVjKjhve+E8asAQNAst46g6ywVozsHY1g6hV7FpC7BJkfQqxCG
         kOpVClNeBd1JJ0cEIP9mSgrxeG0SYEAUud4AZ7/7yffPcnuVgHawESbM5vWUvsIG6ROs
         LPN0Ddqae52tt/wIc8RJiHTV6y/ERdpD/pLksRwLfacEnVdrQ3zWCvQqlAgrAUaW2NPf
         nqcTswyJH61ygdpjFk1FDk5nsPTVfK4oypo+HQYu60CaMVD1czEpowhNtdF8LDnnYNmF
         hJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639247; x=1791244047;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BXFiB3UkXw4qeBR2wwwf1ZyTmNaVLsDH7LkQypp5lJ8=;
        b=WreQdgeZgVkN7iuhcj/lL7EGkd71essui2ww2zKBhlwO+ixiqRtD2qBKV/i7ZW+wcn
         wyEbwb1tY8RzuCsVZ3f+oM7CklH22jtExMdBa1ux9UCfuL9IatSIj+K9opY/Yp1DoyHK
         C6pYB4hpkbiMhUtnmY9nA0UVG1IpwVlbWDpD4eqBe1Jr0ttvE3jQg6N/Wu0O0UNLHGJ4
         S3wBtoTEDtlocJBQ4RnmxzddynToNzOyP6rRyZ7pJrPQQAASWoucdJH91pn0p/G+GG9R
         bvEVWXfOg0NHI8OVaqt7QfSVeFEZ1o7JtFilb/kqOEpE08gyzk91mzRuNyfrQn+XX4lq
         VdLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPt+BPV+X7K+zXZhdf1BHUZOJVeDgut/gS21Fql4Yrf3ogfiHiF+iI6F/ChzJ1uu+B1bgVQJTW2xR8r4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1D1XGdeSx4hShAtU30zydCZM8Rpj5VxTryor0fEpGIJsBIp4x
	Tz+rEvYjzneJiZBOF6A71BKgnuJB7gnYne5y5jAM/DpRyerasTFMMRM5cdRQVtMcVo+fhEl/E1I
	bGlVPoYtD4Ro9jZjBZGWSfXpue4U8IdA=
X-Gm-Gg: AYBFou3ol6v4s00okdcLLo902RjIiZhJeQwoXYdX4Kj40yvwKTcoylSh42yPfeMFG7w
	uIYdkHt+UUY+AMWz/qexGKW/mWSA3aqmNer9AH+M/pf49aKBlyBx/P+hgdVvxUY/KK33Cp4+Twk
	WRSmfb2p2evIGI39zWjugwTU3TUS1Pf+88pSiJAgTSGGNFqTn1BZ/iNJEyWjslrqFibbIs1jfNL
	nWJeS9GUyFrFP9FKhe/RiRest7+xRG2s3gz3ulLS+5U30SCC+zrG03RFWSB7TCaAovpRznJ3v9V
	GhrYYjF6a8LbslunediE9LassfU1/Q07ivjHZj3sDiLM4x1fnLLpNWlE8dVxD6ppJvhwoggiby6
	IKk64KBYNH1YlsfFoniYi0Mn/oKdlePSIcSIVlgH+lMpdDHSuQ5/mv1+8TbKUM+Smb8fhb4s=
X-Received: by 2002:a2e:bea8:0:b0:3a5:f041:d7cd with SMTP id
 38308e7fff4ca-3a63c311438mr33950311fa.26.1790639246649; Mon, 28 Sep 2026
 16:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:47:14 -0400
X-Gm-Features: AclHuK8FsT1Ec-f58jqhX1xRKXeOuLhZ2Q1xSCkGZJLLJldZLmmUEge1BcznI7o
Message-ID: <CAGLNFZeLTDhLj5bzOVC51J6Az6E1D9PWj6yzgHZO8Rg-82kpHw@mail.gmail.com>
Subject: [PATCH] scripts: run-clang-tools: import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000037de8a065c93b028"

--00000000000037de8a065c93b028
Content-Type: text/plain; charset="UTF-8"

The BrokenPipeError handler calls os.open() and os.dup2(), but the
module never imports os. A broken output pipe therefore raises
NameError while handling the original error. Import os so the
handler can redirect stdout and exit as intended.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--00000000000037de8a065c93b028
Content-Type: application/octet-stream; 
	name="05-run-clang-tools-broken-pipe.patch"
Content-Disposition: attachment; 
	filename="05-run-clang-tools-broken-pipe.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulwd76t0>
X-Attachment-Id: f_mulwd76t0

RnJvbSBkZjVhZjRkYjAyYWE5Njc4YjEwNmYwMjc0OTEzZmIwYjE4YzBjY2U2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIHNj
cmlwdHM6IHJ1bi1jbGFuZy10b29sczogaW1wb3J0IG9zIGZvciBicm9rZW4gcGlwZSBoYW5kbGlu
ZwpUbzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgpDYzogTmljb2xhcyBT
Y2hpZXIgPG5zY0BrZXJuZWwub3JnPiwgbGx2bUBsaXN0cy5saW51eC5kZXYsIGxpbnV4LWtidWls
ZEB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKCkZyb206IE9t
ZXIgWmFsbWFuIDxvbWVyemFsbWFuNDJAZ21haWwuY29tPgoKVGhlIEJyb2tlblBpcGVFcnJvciBo
YW5kbGVyIGNhbGxzIG9zLm9wZW4oKSBhbmQgb3MuZHVwMigpLCBidXQgdGhlCm1vZHVsZSBuZXZl
ciBpbXBvcnRzIG9zLiBBIGJyb2tlbiBvdXRwdXQgcGlwZSB0aGVyZWZvcmUgcmFpc2VzCk5hbWVF
cnJvciB3aGlsZSBoYW5kbGluZyB0aGUgb3JpZ2luYWwgZXJyb3IuIEltcG9ydCBvcyBzbyB0aGUK
aGFuZGxlciBjYW4gcmVkaXJlY3Qgc3Rkb3V0IGFuZCBleGl0IGFzIGludGVuZGVkLgoKU2lnbmVk
LW9mZi1ieTogT21lciBaYWxtYW4gPG9tZXJ6YWxtYW40MkBnbWFpbC5jb20+Ci0tLQogc2NyaXB0
cy9jbGFuZy10b29scy9ydW4tY2xhbmctdG9vbHMucHkgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2xhbmctdG9vbHMvcnVuLWNsYW5n
LXRvb2xzLnB5IGIvc2NyaXB0cy9jbGFuZy10b29scy9ydW4tY2xhbmctdG9vbHMucHkKaW5kZXgg
ZTc4YmU4Mi4uNzlkNThiMyAxMDA2NDQKLS0tIGEvc2NyaXB0cy9jbGFuZy10b29scy9ydW4tY2xh
bmctdG9vbHMucHkKKysrIGIvc2NyaXB0cy9jbGFuZy10b29scy9ydW4tY2xhbmctdG9vbHMucHkK
QEAgLTEyLDYgKzEyLDcgQEAgY29tcGlsZV9jb21tYW5kcy5qc29uLgogaW1wb3J0IGFyZ3BhcnNl
CiBpbXBvcnQganNvbgogaW1wb3J0IG11bHRpcHJvY2Vzc2luZworaW1wb3J0IG9zCiBpbXBvcnQg
c3VicHJvY2VzcwogaW1wb3J0IHN5cwogCg==
--00000000000037de8a065c93b028--
