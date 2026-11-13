Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540888;
	b=0oj9DUtx8+Ek8OKnDlDqH5T73HbeKmQw/bpAy0kRlAlJvjv1TWiqTHHbBboZeaZAcdUV
	 vRO6SsRzr4MX8aZgPGfNX/hfy1X04ce3LeEMBhaFGJvgoVGEz7SEEVdDFAJebAFHSSV7M
	 wLwNBaFS6wDxxuF847svBIaGNZCqbJpdRAU39IvRVAGaG+F5GUXJ8JcgC8OJBFUBThFDg
	 HF1LLO3Z7mstG4E6xLA8QltpKGiqkBPc8bvjknTB8WVX+0kqwJAk1cPHNWr1Q9u23OTpX
	 WyDzB3mvApEEdjlhGwdvOIVAaHyUkvnsxHWVuJLCpQsnCAOZyvJrRi3NfE/s+h6sQeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540888;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=h/Lr8m+vfNgoswLkzsCqR8ajTaO/1XkUV8AGpT/rlCY=;
	b=eCwPAQgkHoCzZM0ngMtI6CiESajwnE+IVURJKEkYvS3LKhGHlkdgGq3X0LKIGKd04Tqr
	 6CKP3CyBCWOoeq0//BlyuzwaJLbNV/SlydJitotL7GkTGYtmzxYlsaOMRJSEmFSTyJbOJ
	 w6d/1kbRIAnZ/mYbPJsrA9O5wKQaeAgF9PVl06GLUEAyMvSAVY2mWGmoTtuwG1I2xQoP+
	 DW4/12NBd3uUulxaKSClvUHxgp2873NMepzWpLbbR2au/Tueqwh+PzHiCZyuLFUPCzS6P
	 U5juOGDIYCS5PBVLtPGRQzqfr5l9uHPpSO5cNLZwQBPiNkdwJNXRySorHsMiCtLX9RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.17
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F13606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2F13606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 24C08A841B;
	Fri, 13 Nov 2026 03:32:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id ECAB22000E;
	Fri, 13 Nov 2026 03:32:14 +0000 (UTC)
Message-ID: <6dfeacb309d58f153c1cd701cd31a587151e9070.camel@perches.com>
Subject: Re: [PATCH v1] checkpatch: Add context-analysis attributes
From: Joe Perches <joe@perches.com>
To: Vincent Donnefort <vdonnefort@google.com>, apw@canonical.com, 
	akpm@linux-foundation.org
Cc: elver@google.com, linux-kernel@vger.kernel.org, kernel-team@android.com
Date: Thu, 12 Nov 2026 19:32:14 -0800
In-Reply-To: <20261112151203.3129005-1-vdonnefort@google.com>
References: <20261112151203.3129005-1-vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: ECAB22000E
X-Stat-Signature: 4twzq7k9e1asrjx7r9a8kyy9dx1aekg4
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/V4AmkJ814c9fagEFiyNrf4SMT/ui1JNw=
X-HE-Tag: 1794540734-47383
X-HE-Meta: U2FsdGVkX1+gK9UcQawVEC/dw/mKBy6Y3cBabAze+spY6fYvbFs/a9i8znUnpCX5NdGIN5y4Rut/K9nJ4mYptdCGyaBFrA5xjnxUbFjAdWLpNwC3LGf4LS3c+rL/SGdbVNRtBiUd58DiHPQJ7C2ITcB/Zkve746i8wry6vrU4y2aDNHh9w6NZx6ukoDRkTOEw8LsIY+p9Lkdq9QZa036vy9VArLKxqMzU25kbXbPM6k5adMywLpLe8Ups3cPfRI/cNmdgqj4gys2foCEhBMQcpCkv+h192JTZpvQohgHsDxk+O350BsOvfWDB7W1BPp4

On Thu, 2026-11-12 at 15:12 +0000, Vincent Donnefort wrote:
> Checkpatch doesn't know about the context analysis attributes and
> misparses annotated declarations (e.g. mistaking __guarded_by() fields
> for extern prototype). Add them to the known attributes list.

Nak.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -526,6 +526,25 @@ our $InitAttributeData =3D qr{$InitAttributePrefix(?=
:initdata\b)};
>  our $InitAttributeConst =3D qr{$InitAttributePrefix(?:initconst\b)};
>  our $InitAttributeInit =3D qr{$InitAttributePrefix(?:init\b)};
>  our $InitAttribute =3D qr{$InitAttributeData|$InitAttributeConst|$InitAt=
tributeInit};
> +our $ContextAnalysis =3D qr{

Are all of these from include/linux/compiler-context-analysis.h ?

> +			__guarded_by\b|

__guarded_by takes an argument so it should be

			__guarded_by\s*\(.*\)

like the __aligned use below in $Attribute

> +			__pt_guarded_by\b|

And all the rest of these entries that take arguments need to add
that same '\s*\(.*\)'

and it'll be fragile besides, multiline uses likely won't work,
any use that has another internal () pair won't work, etc...

> +			__rcu_guarded\b|
> +			__must_hold\b|
> +			__must_hold_shared\b|
> +			__must_not_hold\b|
> +			__acquires\b|
> +			__acquires_shared\b|
> +			__cond_acquires\b|
> +			__cond_acquires_shared\b|
> +			__releases\b|
> +			__releases_shared\b|
> +			__cond_releases\b|
> +			__no_context_analysis\b|
> +			__context_unsafe\b|
> +			__acquires_ret\b|
> +			__acquires_shared_ret\b
> +		}x;
> =20
>  # Notes to $Attribute:
>  # We need \b after 'init' otherwise 'initconst' will cause a false posit=
ive in a check
> @@ -551,6 +570,7 @@ our $Attribute	=3D qr{
>  			__ro_after_init|
>  			__kprobes|
>  			$InitAttribute|
> +			$ContextAnalysis|
>  			__aligned\s*\(.*\)|
>  			____cacheline_aligned|
>  			____cacheline_aligned_in_smp|
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
