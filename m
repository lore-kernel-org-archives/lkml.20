Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447541;
	b=YShtb658KsRiTVMcW31WjP2Lca/JXt6XLV2DaadCFN/+L5qQCgx32u3he19v4JvDiQdg
	 dwG3mSsxzSSN+k6vTkXjNFvKwpWP1hRQJzajFH77K9WGErEiNwj3JM8eBecemMns5aS7N
	 lUo4jp3JODGnvWp4ck1SGTjJBc7wejj7GD1LE+Jfp1fZhMAguMz+bD87ytEDml0t+zr/5
	 N1Tqs7q+0jiVXGnrRZB1Qs1NcMoSNH6wVYUpuNwDM17NkM9Jf9zCIRL0bcwuxv/fT4aD+
	 faKcxjBI5BPYlfwPgGy4f/KH+zZA4oURaD5jAC7NBFznXr8KhcEJ+WON5rP1+PVjKYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447541;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=xsdCoEibwoy1NxuDxgFKTF/am55eFx20hHPhTk7J8c4=;
	b=dPzkyW/Oc22VF54/wRrVYjkCdx+HkATMMpByBAFgPgWeIa8eGQPFsTSRdUXdzeUBDrob
	 rEu6DqBQpb/E7lMFhSbhnlQZOO2+5C89RLdMH5lMS8Gh08D35wUglLtdwD3aYE/Ng4qzg
	 VRpQTgA2YWQKi+QiXsZnyogVANUHEtdAfnyNcQI7cdzlFhS/DsEOHS8E70whc+s2lx2vX
	 OZLj51Aa2XVtO+IyRIol6QUlWt3fcloQi35khZ3kSJaHoJANPVYr6UMvh6s0jvKskuYaX
	 NI+AxiOgFuTCu+yYlxiAO4kk0sRUqf+iNiDmMnvpERWlum57XQNGphbu3Aom+a3F1mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b="AhF5i/kz";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pcyC7CO2;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F5606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3F5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=AhF5i/kz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pcyC7CO2
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id A894BEC012A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:05:39 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 18:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792447533;
	 x=1792533933; bh=xsdCoEibwoy1NxuDxgFKTF/am55eFx20hHPhTk7J8c4=; b=
	AhF5i/kzBSK7XP3ykzXhkGgfAkMFRl76jCu9zx8oNU99y0SlaXIX1xTkdt+bZ8z9
	EtbtgMFTMt/BGsrQUgrmGDfw3NPHrXTGJeu+tDtnn9sjqA2QnV0rAqV38ZR9saDn
	0KoBBRqxEh8j3RkIPg+v4LMe4a9AOLkhkJy3APz3MmS6tIg3Gfpe5OorDuqkG/FK
	FxZLmI3lYhnV1KRe1cdhbM08zABdXLmAodqIJuasXaYl5wO7hVKDmxTid/lDlypL
	RnXTeyaxfK/eUzxZ432jxfcOzYD69hOt2yDoYBStWm3X86qoeWcpwHVXoaaKLh+P
	D+0GZ+KyDC96/F6b3X6Z+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792447533; x=
	1792533933; bh=xsdCoEibwoy1NxuDxgFKTF/am55eFx20hHPhTk7J8c4=; b=p
	cyC7CO2Fm0jFvUu1jWcQTr3h6U3EHCxZizIp2xqg/W3GexovHYFHkcsVOxTsxQsM
	36wFgFtA52lGPVxLFpY4DO7yJ7whKAAHV+Z1+hOPG2hdL14b3afPLW+ROyv7meSH
	lWtsM98rfCSZZPDmqQGy0fC0wHcOH7NTGqjXMlbwhIdrFnKqTS+7NtW/D5vpJBxG
	cqY/WDY6p27ueAPzTMUOj9hqWAixPZmps5YjqVBuSy1QNZrYEEyIh1dqj7x0UKJY
	+GWN4L9l0aGTwr6tBszjEm6JY35NLG5bTwwzB2S4ZLMs7Xiqy7Aw7eOeyBwMLzAE
	vQgC8hlDfGqa54o2T6vRg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792447533; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:V2eNQRdhZr1PBjYuikLnA6NPAifNDnsV722u/5EsR06YI9D
	wfg8S/bseXjEwoE+UBWnbcim4uZokQUV5uGcJEHRhLqy1+yXINWvwJ2eWa0OBhsi
	K5iOXVLONryn8x103Yrhe8BXr87jz86KURN7sZ/fKF5lPaNa1enz06fZUmFmCYZd
	SyllqEB++vcwLMxsq9WzWC+BAva+3GvtnKeYO+UEGOefrTXuhlIwlHLuFXydIFBN
	RAkbmEjxYmMxF9YgumKKXwU7+nTztt30G84f4mjwE1rv+TjaSl8fOcy/GCfJurk0
	Rd4oNySI384q5JjU2PKffYIKucLZLCoD8CXsUmw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xNyP9/w+hYBSzqXemLBDZJAeA2PCPPY9OpfzNrMdnrc=:0W6T/zM5FomFR9doZoAoxSJLYYZaAzQg6EEOS2muvKs=;
X-ME-Sender: <xms:JpTWatEqxnNs-djXt-Hgbz78NLFTqX0ohkf75g0d6fhZ3fvPKoEuPA>
    <xme:JpTWatLUEuhYQZ6VR_p4LAKzwJxCiZZh2xqLIr0bvOdwifb43a4uHUsk3iPdp6iRM
    vIMb0EatGly5CZDwihTJE3MvUfUlH2CCKKQ-kAWvWZSSiYdwkHi4bI>
X-ME-Proxy-Cause: dmFkZTGXZ6rafHYn12JO1vrIwWBr2YXMSunC9wObGusonUaYAdu9baG/linioNtpDbh2P+
    fE+yg9Nnz3wVdBrtDEjabeUerCkEykDcA6nfrPIQjyn/jS+Echzo5Z10l4rkBVYD/XLppk
    Hvdv75qoZDX511mlqBbltsa1CF4Xi9d57ieFY2yUwraJ4CPAvwCJiApXlnx5jaihCuhPjt
    6AzQ133DagqcOpC8PVYB+7xzKDtuslso247PLO/EKTzoB77TvgsInDVvfQWVkKC6YTEbt9
    qgczqsVDBIkUKnXnKkfM+PJsgXL5GneUq5zMGolo2HK71LnK6roY6iLyGll6wb8ohu2CiG
    YxzW2c4dSlE7S41ERwwQye9S0Mwqu+I2lpYgFtg0h2I3LFrp7mSwLWVf4iSMofvVpTyFvH
    uQQaoZSz5I0Aj/g6ZCnPF6Sv/1Lls6r3l9MbdVGmRXYjjA5dIQBntqEeIgKS5e07MhAI5I
    n/90pu3eJJo+5w37p2xF4YMwhvf2IhP0qY5BdWJd8yxmLAyCbpN9XEjgEAvB9HE3paz2l3
    f8opIow7Mv8LBZtroBmAsZBd96AHTIx4RSGu463M/Ps8iO+zoPnm9M3KxQrCEH6KVKGn2o
    Nhi7wcKsbYh7GaykdcLFltRToEWe8gtbJHXwczwssaBFebbolr8nk/oUlIpg
X-ME-Proxy: <xmx:KZTWap9TRmQE7RoiiseXi8mYuFSJCJdSZbUzpL7QlTbtAf0d8mOiuw>
    <xmx:KZTWalREODBAXlP4uFrWEH2z-T7lD1KeEfeyk8WI3zZSeZFfMDJRVw>
    <xmx:KZTWamqacwUiT3Z1Hy45-ha9o5boZqMA7N0iNZAmlAJa_4ZfG_fpBw>
    <xmx:KZTWaqNaXygEQBsqqrs4XImkzIG4EvWeykjs-eXlKEtPchfrKh3Vew>
    <xmx:LZTWahyaPIzGgPndSzcF9tWw4MQiFiA9-94ugz4SHLMYtgDe_jL9XAON>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C4EFE32A0096; Mon, 19 Oct 2026 18:05:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AICZ2hJ9SF6o
Date: Tue, 20 Oct 2026 00:05:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>
Cc: "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Stefan Kerkmann" <s.kerkmann@pengutronix.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Arnaldo Carvalho de Melo" <acme@redhat.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Eric Biggers" <ebiggers@google.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Message-Id: <fe4c1225-d5bc-444c-b457-001799a3f648@app.fastmail.com>
In-Reply-To: 
 <CAP-5=fWHDR0--hMYM5UHXaDfggctPbJKxNUnM0hjpupUSVNQ5w@mail.gmail.com>
References: <20251016205126.2882625-1-irogers@google.com>
 <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
 <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
 <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com>
 <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de>
 <CAP-5=fUwDOv9k1Ptz22h9kKYFJowg9UPa+LzWnnswJ72ptF8tA@mail.gmail.com>
 <18c92ae1-deaa-4c09-adca-157819cf005b@app.fastmail.com>
 <CAP-5=fV5OBeri3T5U9BsKyjDRUiFr7bgFiV62yQr7fO7Hf3rvA@mail.gmail.com>
 <c049b368-9cb5-44a9-8172-fcfc842e79be@app.fastmail.com>
 <CAP-5=fWHDR0--hMYM5UHXaDfggctPbJKxNUnM0hjpupUSVNQ5w@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from packed
 struct to memcpy
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026, at 23:14, Ian Rogers wrote:
> On Mon, Oct 19, 2026 at 2:00=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> =
wrote:
>> On Mon, Oct 19, 2026, at 19:04, Ian Rogers wrote:
>
> Is there a reason that the compiler's instruction selection can't make
> the same decision for the memcpy case as the __packed case? We can
> work around the compiler bug with a config option.
> The intent with using __builtin_memcpy, as opposed to memcpy, is to
> avoid a library call.

As far as I understand, the only difference between calling
__builtin_memcpy() and memcpy() is the need for a prototype
for the latter, I would expect the compiler to behave the exact
same for for both otherwise. Whether any of the string.h functions
are replaced by an inline alternative is a complex optimizer
decision, not something you can enforce by calling the function
by one name rather than the other.

If you try this one on riscv64, you will find that both gcc and
clang use the byte-at-a-time version at -O2 but the out-of-line
one for -Os (regardless of __builtin_*):

static inline int f(void *p)
{
    int i;
    __builtin_memcpy(p, &i, sizeof(i));
    return i;
}
int g(int *p)
{
     return f(p);
}

> It looks like all the unaligned code is using void* so I'm not sure
> where the low bit concerns are stemming from. If anything, type
> punning seems to be a worse problem, but the hope is that the __packed
> attribute avoids it. I know this assumption makes compiler people
> uncomfortable and memcpy is their preferred go to.

The problem with the bpf_kfunc_test_uninit_alias() function is that
passing an unaligned pointer into it is undefined behavior, and
the only way I know to make it safe is type-punning to a __packed
pointer in combination with traditional aliasing rules, which
tells the compiler exactly how to access the data behind the
pointer.

Whether memcpy() is strong enough to have the same effect in
that example is something I don't know as I never tried to program
with strict aliasing rules, so maybe I'm just be overly cautious:
The include/linux/unaligned.h functions are all 'inline', so the
compiler still has knowledge about the alignment of the accessed
objects from the caller and with -fstrict-aliasing may be
able to assume that the object is aligned.

        Arnd
