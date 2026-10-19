Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D734ACC9B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402218; cv=pass; b=f3VUPKNTAxZ3dKCy4MEwppjL3qvFixI+Jw5r1HEa/Vb7wyI63zI6SC4B6sPpb/uzU+7cGXA+s/Pdv0mASZmEucRSKuGDBVRNdPnUiy4YdNrv6GLONzNyvB6KplsyvkjAI9REPOB4hLDFjLU+jz6xSnagnDeT42bARkvBZgNfc/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402218; c=relaxed/simple;
	bh=jAUHDM6KlIGBMEUV2aGs13eN2XOdVupRHbMZRHltREY=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGGHBfcEmlPsO8yp6RlLJNq6htIYUeeB6nLCSywPN9ysDerm+jDfsfrgokVvcV7iIyNQvp2I1eBjT3NtA3w3ckemtV1wVANn5I7HBQSQ9CCGmnqbANv6CT75IwZ+6X+IvXmebV37Li3hsDK1k5lYLJYsqK8lqL241oUxDAuhMAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com; spf=pass smtp.mailfrom=trukhin.com; dkim=fail (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b=I4UOy0JJ reason="key not found in DNS"; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trukhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b="I4UOy0JJ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8439fe796ebso1110981a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792402216; cv=none;
        d=google.com; s=arc-20260327;
        b=Eg2P6pnN50z9L1hU5/8P2jdqPVgimwpaPClzQHqNLYScKGU0TWm/GW2rdum7V37daI
         GbYfSpIGEfOQJXCiecTeC9odSoWiBioeYDNItfKJOUbEAPSWs7zOpVK2eTB+YjkrSwZg
         NEwb9anzuL0kyMNz7SvrqnJma9ugMrf3wi3qjdHkWeRiXZkPinMGEXnZ8qCf8q9sfCrM
         CH58USB3VDmvGTzInLLnj3TKZgMQX59dtK2mNLM/sInF87fG5XbPMud2f0Yof9ef+nnh
         //TAN9ETvSIzlysKEw/crO+T7mkF96vSyUCWcxrvpvAqpEZ+uEl7UAFk/+CV8xN9C480
         pbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=Eh/J8sa1ZXlP+J7kkqHC8pH7/PspxhgOMogC7EkDAh4=;
        fh=p0VQM8AMg2t+g5TxEFbqImAgMuZ2dU0MpuAuA0qdyEU=;
        b=rP7c7m8RafzG1sX49eshOn0rOVV0BhDH0ti5BOJBbEZ2tTZxW2PYeCat9QZpOAOS4Z
         WWwXuNJB33YZ87C2G2QGtJtWhN/o8TxHk2KDUZC06aiBNAxGqyhCa2ZJYXX5Lb36rfku
         7qQqZ7T03w/OsKU11woU39/8xeMvlcCdg458VMoL725XlBOAFxlSDbSOoYPZlw7T4Vqp
         5MmK3M7DXOPLurfWUGCIjCG9mTgcSReiYtwO3yxGshe3e00d/n/DQ2zJKawxYyu57040
         c33O3se6frcFYmxoAZjIdPNtyu2f3xx5hNUm92EHlXeKkMwtNvSzHlrfVp+mdMbtpQbG
         S2Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trukhin.com; s=google; t=1792402216; x=1793007016; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eh/J8sa1ZXlP+J7kkqHC8pH7/PspxhgOMogC7EkDAh4=;
        b=I4UOy0JJIhSmIwWc1xYOX/85SYl1KhLFBg/Rk1Oia8jqkO/OIeNmqfNWcIeU9aiPje
         V0vjyyt/F+ZISsWd4FA797Y2mT3xjkrw394bAtNQ9RBKw8tU40YiJmeuFfUAH9kWUTOb
         TN0vbJjbj59LWuPRUosIe3RpW+PUBF2/2e3Yzac1lxrrzmNcBQVNU3ykQDpNdLhWftXD
         LVkr79/9i8FZ9TBHB3QtZCgPlHHUvWIqJHc2QNEOA0YKS5P1TFbAJGMxIcx43RrTj4Qb
         6QlT463mxPf3xlBKEyWd82XnGtwf6CXoqMDaQiVeazXKvK4TGCQKSI/7ytnBaDcHjMK9
         5cMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402216; x=1793007016;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eh/J8sa1ZXlP+J7kkqHC8pH7/PspxhgOMogC7EkDAh4=;
        b=qoBc4yEaDg14ErrVyKOJlNXETP43/1sT/CaqFSOv8EewXHDEozo/hHB9N9+sB36LI6
         ihFm2ZXpVakGdFkAorOoH2qaBDbUVjSguxo3o3gYFoBOswpMm3xznBpw0FGyzYw1ksG7
         JipJbRPWDJHJjc50qFJruPOrTBustVG7wEKEDwYo8rC5+k88Ma/bSFMt95q0iHA1ZDmE
         Qks96YdgZkRddKyBQN8Im/NUqaJ0u0ZNhqaTL9/FGOkYuhK8nXfKFrVCsmVAURoAN+Rs
         3xZsLb8gd9sPvtn4/RUGJoz/I5BXEh7wjUXGKtmSjBAnGWS42xJlc65ueOIy3MtSZW0a
         ELMg==
X-Forwarded-Encrypted: i=1; AKwUvByVg7k03zIC8NYqbFtB/ikbc2i6yvNqskAEYpX5b1m5E1GO0zrU6fE95T5JUWowHo/yEpqApH1d6PtArG4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8LnlDBsYNuCzTL3E5GJGdOg8cJ+plTEVieq0mzlwnzISJ0Ocy
	SXy4V3ljURTYdISymfLpimioOQlw9tIwpDRkxSz4zgiqatvB3szEEfny8eWb8Zb62gGBc79s8bk
	a5q8D955WFFTiMmhPOxAy13zHkkMs498vHBgjojmxuApzmuF6le9AdH+DeA==
X-Gm-Gg: AYBFou0Xarx+Sf/vrrA+BTGy8dMYi46bgV3tcHc1mVVElC9564YQX5i6425Frpb8AsO
	/zsGlxhVKYriArb7reZzQZJ8BAEpnkevtB1CY5Y79h3QLrb3R63jnu5jQHxBsIRFpuaxecaLsG7
	X7QWqRPe4x2e9cIH9ANLg54Pb9G5Pl2WAo+Zv+hJ7m+2BhpIQpybrr685lbp9Kae5fGWqEdz6+N
	BIgxs5rfCzHxbGaOBE7WaJzMEIIxZBB4Rj2XgxjC99+Cf7lf4v3QXsEItvDdOICDhOtkpR3YQzx
	8i3w9WWEZR0oziHtKyIyExYyrDj0z9SgTbO/g8bIcqa7i3F3H7qfV4HVNo1bIGRD/MFVbnrLI7p
	qF/ohqsGF+a8YVM+z9g3UghOYpwg3BmviZz/6NrB/Ks+7NK2gx+a/luV5GYUL91Bx+Ho=
X-Received: by 2002:a05:6808:6b8a:b0:4d6:90f4:48ab with SMTP id
 5614622812f47-53ccfba424emr5467777b6e.45.1792402215962; Mon, 19 Oct 2026
 02:30:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 02:30:14 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 02:30:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Iurii Trukhin <yuri@trukhin.com>
In-Reply-To: <CAOx7e9K707oLMN94TC=FBBZYKnwACsN-8mDVjsL+N+BBCmWTOA@mail.gmail.com>
References: <CAOx7e9K707oLMN94TC=FBBZYKnwACsN-8mDVjsL+N+BBCmWTOA@mail.gmail.com>
Date: Mon, 19 Oct 2026 02:30:14 -0700
X-Gm-Features: AclHuK_3S2Q-iqOejvzcO_gf6XMyi3PI7nTaK6nu8aXVLn1sYlRVjmfZBuhTZpo
Message-ID: <CAOx7e9KafYk03k-5vPLm=ud4NKxm5kw79uYaci2qTEWFNknPtQ@mail.gmail.com>
Subject: [PATCH v2] checkpatch: add vmalloc() and vzalloc() to alloc with
 multiplies check
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

vmalloc() and vzalloc() take a byte count, but ALLOC_WITH_MULTIPLY does
not suggest their overflow-checking array helpers for allocations such
as vmalloc(n * sizeof(*p)).

Extend the check to suggest vmalloc_array() and vcalloc(). Unlike the
k/kv object helpers, these functions take a count and a size, so keep
the sizeof expression when generating a fix. Use the original source
for both factors to preserve strings and comments masked in the parsed
statement, and leave the fix alone if another check has changed the line.

Also include the v prefix in ALLOC_ARRAY_ARGS to flag sizeof as the first
argument of vmalloc_array() and vcalloc().

Link: https://github.com/KSPP/linux/issues/342
Assisted-by: LLM
Signed-off-by: Iurii Trukhin <yuri@trukhin.com>
---
Changes in v2:
- Preserve strings and comments in both factors by using their original
  source positions, instead of the sanitized statement.
- Preserve allocation casts and skip the fix if another check changed
  the line before this rule ran.
- Acknowledge coding assistance.

v1: https://lore.kernel.org/all/CAOx7e9K707oLMN94TC=FBBZYKnwACsN-8mDVjsL+N+BBCmWTOA@mail.gmail.com/

Testing:
- perl -c and checkpatch --strict.
- Allocator regression cases, including factor order, nested expressions,
  strings, escapes, comments, extra factors and multiline statements.
- Compiled and ran 12 generated C expressions to check that the rewritten
  allocations preserve the original size calculation.
- Compared the existing k/kv diagnostics and fixes with the unmodified
  script; checked application to mainline, linux-next and mm-nonmm-unstable.

LLM assistance was used to extend the rule, review the change and develop
and run the regression tests.

 scripts/checkpatch.pl | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..cf2dd0b7c372 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7355,17 +7355,22 @@ sub process {
 		}


-# check for (kv|k)[mz]alloc with multiplies that could be
kmalloc_objs/kvmalloc_objs/kzalloc_objs/kvzalloc_objs
+# check for (kv|k|v)[mz]alloc with multiplies that could be
+# kmalloc_objs/kvmalloc_objs/kzalloc_objs/kvzalloc_objs/vmalloc_array/vcalloc
 		if ($perl_version_ok &&
 		    defined $stat &&
-		    $stat =~
/^\+\s*($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)\s*,/)
{
+		    $stat =~
/^\+\s*($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k|v)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)\s*(?:,|\))/)
{
 			my $oldfunc = $3;
 			my $a1 = $4;
 			my $a2 = $10;
+			my ($alloc_start, $a1_start, $a1_end, $a2_start, $a2_end) =
+			   ($-[3], $-[4], $+[4], $-[10], $+[10]);
 			my $newfunc = "kmalloc_objs";
 			$newfunc = "kvmalloc_objs" if ($oldfunc eq "kvmalloc");
 			$newfunc = "kvzalloc_objs" if ($oldfunc eq "kvzalloc");
 			$newfunc = "kzalloc_objs" if ($oldfunc eq "kzalloc");
+			$newfunc = "vmalloc_array" if ($oldfunc eq "vmalloc");
+			$newfunc = "vcalloc" if ($oldfunc eq "vzalloc");
 			my $r1 = $a1;
 			my $r2 = $a2;
 			if ($a1 =~ /^sizeof\s*\S/) {
@@ -7381,9 +7386,20 @@ sub process {
 					 "Prefer $newfunc over $oldfunc with multiply\n" . $herectx) &&
 				    $cnt == 1 &&
 				    $fix) {
-					my $sized = trim($r2);
-					$sized =~ s/^sizeof\s*\S\(?([^\)]*)\)?$/$1/;
-					$fixed[$fixlinenr] =~
s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)/$1
. ' = ' . "$newfunc(" . $sized . ', ' . trim($r1)/e;
+					if ($oldfunc =~ /^v/) {
+						# Preserve strings and comments masked in $stat.
+						if ($fixed[$fixlinenr] eq $rawline) {
+							my $raw1 = substr($rawline, $a1_start, $a1_end - $a1_start);
+							my $raw2 = substr($rawline, $a2_start, $a2_end - $a2_start);
+							($raw1, $raw2) = ($raw2, $raw1) if ($a1 =~ /^sizeof\s*\S/);
+							substr($fixed[$fixlinenr], $alloc_start, $a2_end - $alloc_start,
+							       "$newfunc(" . trim($raw1) . ', ' . trim($raw2));
+						}
+					} else {
+						my $sized = trim($r2);
+						$sized =~ s/^sizeof\s*\S\(?([^\)]*)\)?$/$1/;
+						$fixed[$fixlinenr] =~
s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)/$1
. ' = ' . "$newfunc(" . $sized . ', ' . trim($r1)/e;
+					}
 				}
 			}
 		}
@@ -7397,7 +7413,7 @@ sub process {
 		}

 # check for alloc argument mismatch
-		if ($line =~
/\b((?:devm_)?((?:k|kv)?(calloc|malloc_array)(?:_node)?))\s*\(\s*sizeof\b/)
{
+		if ($line =~
/\b((?:devm_)?((?:k|kv|v)?(calloc|malloc_array)(?:_node)?))\s*\(\s*sizeof\b/)
{
 			WARN("ALLOC_ARRAY_ARGS",
 			     "$1 uses number as first arg, sizeof is generally wrong\n" .
$herecurr);
 		}

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
-- 
2.56.0



On Wed, 14 Oct 2026 20:20:06 -0400, Iurii Trukhin <yuri@trukhin.com> wrote:
> vmalloc() and vzalloc() have 2-factor multiplication argument forms
> vmalloc_array() and vcalloc() in <linux/vmalloc.h> that protect against
> integer overflow during size calculation.
>
> Commit 070580b0b174 ("checkpatch: Suggest kmalloc_obj family for sizeof
> allocations") updated ALLOC_WITH_MULTIPLY for the (kv|k)[mz]alloc()
> family to suggest kmalloc_objs(type, count, gfp), while vmalloc_array()
> and vcalloc() retain the (count, size) signature.
>
> Extend ALLOC_WITH_MULTIPLY to warn when vmalloc() or vzalloc() is called
> with a 2-factor sizeof() multiplication and suggest vmalloc_array() or
> vcalloc() respectively, including --fix support. Also include the 'v'
> prefix in ALLOC_ARRAY_ARGS so swapped sizeof() first arguments to
> vmalloc_array() and vcalloc() are flagged.
>
> Link: https://github.com/KSPP/linux/issues/342
> Signed-off-by: Iurii Trukhin <yuri@trukhin.com>
> ---
>  scripts/checkpatch.pl | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8a7787d228a6..651a46f1fc40 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -7355,10 +7355,11 @@ sub process {
>  		}
>
>
> -# check for (kv|k)[mz]alloc with multiplies that could be kmalloc_objs/kvmalloc_objs/kzalloc_objs/kvzalloc_objs
> +# check for (kv|k|v)[mz]alloc with multiplies that could be
> +# kmalloc_objs/kvmalloc_objs/kzalloc_objs/kvzalloc_objs/vmalloc_array/vcalloc
>  		if ($perl_version_ok &&
>  		    defined $stat &&
> -		    $stat =~ /^\+\s*($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)\s*,/) {
> +		    $stat =~ /^\+\s*($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k|v)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)\s*(?:,|\))/) {
>  			my $oldfunc = $3;
>  			my $a1 = $4;
>  			my $a2 = $10;
> @@ -7366,6 +7367,8 @@ sub process {
>  			$newfunc = "kvmalloc_objs" if ($oldfunc eq "kvmalloc");
>  			$newfunc = "kvzalloc_objs" if ($oldfunc eq "kvzalloc");
>  			$newfunc = "kzalloc_objs" if ($oldfunc eq "kzalloc");
> +			$newfunc = "vmalloc_array" if ($oldfunc eq "vmalloc");
> +			$newfunc = "vcalloc" if ($oldfunc eq "vzalloc");
>  			my $r1 = $a1;
>  			my $r2 = $a2;
>  			if ($a1 =~ /^sizeof\s*\S/) {
> @@ -7381,9 +7384,13 @@ sub process {
>  					 "Prefer $newfunc over $oldfunc with multiply\n" . $herectx) &&
>  				    $cnt == 1 &&
>  				    $fix) {
> -					my $sized = trim($r2);
> -					$sized =~ s/^sizeof\s*\S\(?([^\)]*)\)?$/$1/;
> -					$fixed[$fixlinenr] =~ s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)/$1 . ' = ' . "$newfunc(" . $sized . ', ' . trim($r1)/e;
> +					if ($oldfunc =~ /^v/) {
> +						$fixed[$fixlinenr] =~ s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*(v[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)/$1 . ' = ' . "$newfunc(" . trim($r1) . ', ' . trim($r2)/e;
> +					} else {
> +						my $sized = trim($r2);
> +						$sized =~ s/^sizeof\s*\S\(?([^\)]*)\)?$/$1/;
> +						$fixed[$fixlinenr] =~ s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)/$1 . ' = ' . "$newfunc(" . $sized . ', ' . trim($r1)/e;
> +					}
>  				}
>  			}
>  		}
> @@ -7397,7 +7404,7 @@ sub process {
>  		}
>
>  # check for alloc argument mismatch
> -		if ($line =~ /\b((?:devm_)?((?:k|kv)?(calloc|malloc_array)(?:_node)?))\s*\(\s*sizeof\b/) {
> +		if ($line =~ /\b((?:devm_)?((?:k|kv|v)?(calloc|malloc_array)(?:_node)?))\s*\(\s*sizeof\b/) {
>  			WARN("ALLOC_ARRAY_ARGS",
>  			     "$1 uses number as first arg, sizeof is generally wrong\n" . $herecurr);
>  		}
> --
> 2.56.0
