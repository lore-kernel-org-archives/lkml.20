Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=79.135.107.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793528056;
	b=Fs4a+ZTLL6lv+hrXeZWdkMqTVUFAFrwekSmEh8tItnNPZMrdyjxubgy9F1TVb+9A229+
	 Q3Ourt28lKhXMPo8lfLpwAOPj678tpkN66Hrtqm+4inv/CiHvd4fSs42V9rJ2QqXOlAEF
	 sJfAvK3vctDThGBBs3tvXtcTCgjKKccth8JKbgP7pS/f+Itf2+/etpXqyU3t4ATE3AbLB
	 D26JaxIQk17tG5gfXToyJvB6k+MpcRXlIHd7F1gPQcXfjCSiiyp7kJxh8NUGgfxXGeOPV
	 BOlPEudLbupuJYep7htKjb6b1ynkPcXDLiEFn3IoqXSFU7wcOonUdLaFQVXOVCAof0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528056;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=hSHY3WVsUBqgQAxQOpMX314E9mDDGTULiBUsGnrUENs=;
	b=l+84f0qH4PYh77Y1FU6nL8wn6pYTUTFumxaKk9C5oa3IMkGf8emTayhLa81UhAFFIRtn
	 vhHYzOuIzMoDjMfcq39OFfNvkvmHsjRw7Eurp8w/rTHBJZ6q5jwajadnMNhgJcVuqhbQ5
	 WQ682zh3wacSvfvyxEexJeNoOY1FpFz3TXyFCOWdRG3KnDP0fMlhoEBp3szlmTQJi7yPJ
	 YVpJL++RIzM7txdnwWIhpE8Kd1JQ0ifyMAxWB/ZzwaGMDjM4Dgg4x8S373P5radf6dQos
	 d0hoSR9WbbKvT7k9RoD5zlrpqJon7h57L5L5XzpY5PCat+9vDFE1tZMWr2ysEbnhh9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=UxR1rh+i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=79.135.107.169
Received: from mail-107169.simplelogin.co (mail-107169.simplelogin.co [79.135.107.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215D7606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215D7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8alias.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=UxR1rh+i
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793528054;
	cv=none; b=aXuU6JiM0fyCK4kpjvLnL4mXKTWtl2OtR54G1XJyxGkJcZk2lop/YyK1D6X4FqogO6IFJBGuNXdPvLoX9fvvRlIMQAMfODmZy56G/x4pO9o18i1qmWcS0yrb3UDdy3uqyl27fB5BQGTTEL5oL9Zrj7PcAA/8zr6fpstAiBJyIXdpXPL00p6bAYjGUkIyOzPAtYHQYtNpfJq3gxRp7r78VRnr2JiACTiP0QELzaJ5pIrrTAkrVI9wKAd+mkqfQPqVb3+CNhv0jnbYgX/+vzcE2UAssONgxvqluG8vvNb1SCOtZ/KI8TGlp328vrf703IsrNCWtqLvU0YWSUKshMIxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793528054; c=relaxed/simple;
	bh=hSHY3WVsUBqgQAxQOpMX314E9mDDGTULiBUsGnrUENs=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=ZOQ+oc/j98bJXk1NO4TyE2+GcGGHpKsFEP+NIylGs3RXwUbm3/dWrnDyxU/DuWWEuZ37JOmXF92qGZTg4B2BNFMZS3TV+p8DZa8lpIfQFWgDSfz9jeAMFO5/rNAuyQXMqS6AFQ+gl96fjzswwu2MQK0LKk4UyY0XCApVi26HoeISBHriQ5FKvo0RYPI7oIqz+8wR3tDBrpsqzZ+e2Wg1LQk081WWKKu/XFjDZARurGmealmr+W0wvT+quNEtiIX+H0UkAS2j7Hy7TDumJjEq/gJXV6vwok9HYjfnfGHprB3J3nfe+zTgfgjDhpUI1FZ+BUq23aXbJ/z1zGePJ481hQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793528054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hSHY3WVsUBqgQAxQOpMX314E9mDDGTULiBUsGnrUENs=;
	b=UxR1rh+iOADg1MBoXzQ38BpmxoqD0TN57d4DVw1lYyDMjKC9LbhqcafxS0DY7fYE2hR+Hc
	y2sDU/puH+o6Wi4IzGN7nWyDjXLue7lJ5RT7AUcJWrFNZupIBrAnernnhW2u1ZyGKrCmru
	NPWZKkAjesJ2F3L5Zl5Gey9zCtGkkwc=
Date: Sun, 01 Nov 2026 10:14:06 +0000
Subject: Re: [PATCH 6.12.y 2/2] mm/early_ioremap: Sign-extend PAGE_MASK when
 aligning the physical address
In-Reply-To: <2026103137-showplace-numerator-a05b@gregkh>
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
From: =?utf-8?q?Radek_Marci=C5=88a?= <github.unusual340@8alias.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org,Thomas Gleixner <tglx@kernel.org>,Ingo Molnar
 <mingo@redhat.com>,Borislav Petkov <bp@alien8.de>,Dave Hansen
 <dave.hansen@linux.intel.com>,x86@kernel.org,Andrew Morton
 <akpm@linux-foundation.org>,David Hildenbrand
 <david@kernel.org>,linux-mm@kvack.org,Arnd Bergmann <arnd@arndb.de>,Michael
 Kelley <mhkelley58@gmail.com>,linux-kernel@vger.kernel.org
Message-ID: <179352805420.7.6433291196676980630.1737402061@8alias.com>
References: <179346145167.7.7861216093151225931.1735978772@8alias.com>
 <179346152914.8.7838190602983146541.1735981230@8alias.com>
 <2026103137-showplace-numerator-a05b@gregkh>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1737402066
X-SimpleLogin-Want-Signing: yes

On Sat, 2026-10-31 at 21:25 +0100, Greg KH wrote:
> On Sat, Oct 31, 2026 at 03:45:21PM +0000, Radek Marci=C5=88a wrote:
> > Signed-off-by: Radek Marci=C5=88a <github.unusual340@8alias.com>
>=20
> Sorry, but this isn't going to work for the obvious reason, so we
> can't take these as-is.

Thanks for a quick reply. I do have a public GitHub identity which
dates back to 2019 (https://github.com/marcinar).

Here's a recent PR using the same name and email (see the raw patch),
this proves that I control the account.
https://github.com/simple-login/app/pull/2866
https://github.com/simple-login/app/commit/f1eb1fcf36d1fd92a3c2057aab3faf1a=
5fae1e31.patch


Here's a PR from 2020 that was merged and has my full name (see the raw
patch), this proves that I didn't change the name or rewrote history.
https://github.com/ChargeTimeEU/Java-OCA-OCPP/pull/120
https://github.com/ChargeTimeEU/Java-OCA-OCPP/commit/9e8f2c09ee34a085103d3d=
6d46856606b05e9a8d.patch

Hopefully, this is enough. But if not, is there a way to contact you
(or someone else) privately about this?


