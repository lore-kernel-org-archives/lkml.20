Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794104205;
	b=wh108jXvg/7LPELnsMcgiKvaNZ52Y5o84kp+D41DAiXZqBxbcRYU71VrQY95GgtpKV8R
	 DWk/UPQplIXHnwgBzPT4mpgfZpCjZwR+PWpdnps0WYOjS4IQpA0o+O3H8uzhoocYWx3L9
	 w59veohTTizCekoanNdkPPXBHrMNFBVixAUzhz9gKvPRWuUFPY3+Tczpe8WYSSQxFzonU
	 z7FGdRU9/zS0hxlzBDqi1TfJfmV4kXIQd8BkLLpHY+Z+F70EbXd2BUdGbbyeW5nyFDRT+
	 8KyEkhBXxGoi/ypsqroZ0RvLE0PyGfUBmdEL2yViDT98ga4HNpvNp5RDE1HgREIgxEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794104205;
	h=DMARC-Filter:Received:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:X-HE-Tag:
	 X-HE-Meta;
	bh=aisVsid9E0p4t2IH80WlOxa6zGBD+4xeavWz7iRsU/k=;
	b=bGhKVmOlNTP5Qu/mYW6PB8VuUeEkOqES4pNJd6ayPWaPgsO5On+a9A78Zs0YRb7HvqDC
	 VXn/cji5weMyymFg1vY6TVapbTS+6bckcymQRPknxh11g0qUf/aZDDjgAq8LrJ6+ISmln
	 ecHDumgUozxLhgoait7Fs8F83YjHp2zomx3ZhGk895HFJ5uEoQ5gypdFn2q+YPqLTmadp
	 DNboXCRaNrE1Ly7FxUInCa1TNG/RMXrS8KgCJqPChSRFr5KZres3He7DWH+KJlEjM/Zr7
	 klFtnGEY/Wfx/zhxhK3OCLx+pHHhkfTolCPrFeN+LpfqjKzKEJAxwbED4TCiQU7wxJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=perches.com;
	spf=pass smtp.mailfrom=perches.com;
	arc=none smtp.remote-ip=216.40.44.17
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C87606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 02:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf14.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id CA6B5A7FDE;
	Sun,  8 Nov 2026 02:16:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id E53D132;
	Sun,  8 Nov 2026 02:16:40 +0000 (UTC)
Message-ID: <17c32de7bab37b0a005f35c016aeb85da8c5f116.camel@perches.com>
Subject: Re: [PATCH] checkpatch: Fix bad COMPLEX_MACRO on asm volatile
From: Joe Perches <joe@perches.com>
To: =?ISO-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>, Andy
 Whitcroft	 <apw@canonical.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Date: Sat, 07 Nov 2026 18:16:39 -0800
In-Reply-To: <20261107-checkpatch-asm-complex_macro-v1-1-9a7b3c69fc28@google.com>
References: 
	<20261107-checkpatch-asm-complex_macro-v1-1-9a7b3c69fc28@google.com>
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
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: E53D132
X-Stat-Signature: bkdt4hip631dy1cpkzykcfnbnmziohkd
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18NP+YNNXBmOVMZwXx+YDMusZQ0CVzvy2E=
X-HE-Tag: 1794104200-939489
X-HE-Meta: U2FsdGVkX1/o6I2L+9/ETczOKScpj1NTO/a/r4IQUkxuXT4N8Gre6yWO4kKpkaS05vKpCj3kRke3elimPmPFRKbjKMg/taqbNBLdawIAngV8L0fCfzsCx5ht5bnkVxfEgN1eoVMPyJ8whZZT0ixlIG68iS7MaErYAq1mTaFeeC3cj+wuw+vppWScN0dN4euoYiv2JjYx8D0hiy8tijl8ZPE8Nwewv5KzkHV16CWcma8s/W5uZ7FB1uuFLLCVSL8gU5jjaRworuQLbXpdS4lKJlt3AenjKAgqFFZb22SP3Fc6jaJHnBOWl1725VYbMUnG4x3exYxjChjlhizabzWCx/wTObIWX7BbEbGWQfUC0quZqWUfvm7Hm/eAuB69xjhf+WynkzlEJn7UcOxPjNjKcA==

On Sat, 2026-11-07 at 15:57 +0100, Pierre-Cl=C3=A9ment Tosi wrote:
> Commit 42e152931deb ("checkpatch: exclude asm volatile from complex macro
> check") added a substitution converting "asm volatile" into "asm_volatile=
"
> so that macros expanding to an asm volatile statement would be treated li=
ke
> a single function call and excluded from the COMPLEX_MACRO error ("Macros
> with complex values should be enclosed in parentheses").

Thanks.

Acked-by: Joe Perches <joe@perches.com>

>=20
> However, that substitution was placed after the loop that flattens
> parenthesized expressions into "1u" (originally "1"). For a macro without
> whitespace between "volatile" and "(", such as:
>=20
>     #define foo(x) asm volatile("..." : : "r" (x))
>=20
> flattening the parenthesized argument list first turns the statement into
> "asm volatile1u". Because "1u" starts with a word character, the trailing
> word boundary (\b) in /\b_*asm_*\s+_*volatile_*\b/ no longer matches afte=
r
> "volatile", leaving the space between "asm" and "volatile1u" intact and
> causing the macro to still fail the single-lvalue check and trigger a
> false-positive COMPLEX_MACRO error.
>=20
> Move the "asm volatile" to "asm_volatile" substitution before the
> parenthesis-flattening loop so that "asm volatile(...)" is first rewritte=
n
> to "asm_volatile(...)" and then flattened to "asm_volatile1u" as intended=
.
>=20
> Fixes: 42e152931deb ("checkpatch: exclude asm volatile from complex macro=
 check")
> Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
> ---
>  scripts/checkpatch.pl | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index b8b64f720191..5319a8ecec50 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6050,6 +6050,9 @@ sub process {
>  			$dstat =3D~ s/^\s*//s;
>  			$dstat =3D~ s/\s*$//s;
> =20
> +			# Make asm volatile uses seem like a generic function
> +			$dstat =3D~ s/\b_*asm_*\s+_*volatile_*\b/asm_volatile/g;
> +
>  			# Flatten any parentheses and braces
>  			while ($dstat =3D~ s/\([^\(\)]*\)/1u/ ||
>  			       $dstat =3D~ s/\{[^\{\}]*\}/1u/ ||
> @@ -6063,9 +6066,6 @@ sub process {
>  			{
>  			}
> =20
> -			# Make asm volatile uses seem like a generic function
> -			$dstat =3D~ s/\b_*asm_*\s+_*volatile_*\b/asm_volatile/g;
> -
>  			my $exceptions =3D qr{
>  				$Declare|
>  				# named exceptions
>=20
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261107-checkpatch-asm-complex_macro-75ee815da528
>=20
> Best regards,
