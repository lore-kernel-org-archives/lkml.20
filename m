Received: from mail-oo2-f9.google.com (mail-oo2-f9.google.com [74.125.231.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A31F12FB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023612; cv=pass; b=V4yszPSorypu6JRZsttiyPsFzvQdiLC46XQrS1ei3LqXbAt0l7MYvYUJgP63D/e1siiI8WiIkd0b6QE55QJpS0GP0fjy3ObRpnXU7qlfJU9gUjGwN4M277CkZlYH+CNx4Az7CIkIlvIMQlJbIGYXr5U5LDbkfGN2a9YSVeYyaj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023612; c=relaxed/simple;
	bh=ZfGhT2Jr+2O8ROlVSInvFbbLTE0fR8G5uMhgAbwj5M8=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=s8TBPziWhYgeO64XPsHrJ2WATXWRApc7S1w34Vrx+xyz6KCmWGxDBtQrfak/5t188T+iECpQXp+nsvGsnQL4YIkHFJ3Guwa76pr2sGlrlmNUmvR7OqjTfnX+Xv2iQgq3QxU3lheE4wkaAiIc4YzRexsTS6pH0Ag8CQvWAS67gAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com; spf=pass smtp.mailfrom=trukhin.com; dkim=fail (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b=WlZs6pVA reason="key not found in DNS"; arc=pass smtp.client-ip=74.125.231.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trukhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trukhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=trukhin.com header.i=@trukhin.com header.b="WlZs6pVA"
Received: by mail-oo2-f9.google.com with SMTP id 46e09a7af769-821a4a69647so2048014a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792023609; cv=none;
        d=google.com; s=arc-20260327;
        b=Zu/DrKaq1yvziK0tgFOWkWTao0WCgDWFKY/49OQvotaASa7Rjv/+M97M0X7U32Vys5
         +HRG7LvImM2XMgTdwlJbsfzo2ExNTviOZczcHTWwGM7oGe8pBAjfvrR2GkdwYbyDI/+G
         WTkDknzp4CCDYen9elQox3y5kWToCMB/8Ztkr/oIgSbjybSTEn95hsxzU1pe9F3yUwuS
         Deu7v+dAfWdzUykEuwNDO/A6dKeuUA9mNn3YZcb+izoJzuo/70z/mS55CQY74Mqv+9xO
         o3VmIYfJJDiuVl2vrPV5nNdf3yD4u3TWvdhJkvwgt2PSjQlyYyAbcFXudNDmeI8rSNu4
         se6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=JaQsBngKHxTZEacWBZCQKm7YBXuRdNkKZ2aKH9fBHn8=;
        fh=sgSf5FlklXWxcQRP4wkMxjAWfg0Bz95LLe68W8kKras=;
        b=m0rOkduxSDO6DtCIlkVgIRLuFk0vyms0VCn4xk8OJkcP3kkVwfst9GbdB1rHjlmVOh
         944LvI5XwmL0t9cgDOC4LtEtnX63o6DNYewiETpgclvRYZtYnwrICWb/Wj1riqNp7twB
         ru88JVr7ORYCpji+bnOkucZ6re/4Em8fzcYNQrz7t1pUzWumdq62D9vskDif/yJYcJjL
         b6vfC3/nwrHXOmydIKaBeAVq16F2CZWh+In/tcgW9qOS5h83wnXtJb6S3SWhxPegoXQt
         fR/ME8KjsKLj0bX+sLlvoVBb6EbuLI3yt9/XvrlpAk1qzkHs3RXmYIZwvenTGfAwQL4C
         6yzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trukhin.com; s=google; t=1792023609; x=1792628409; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JaQsBngKHxTZEacWBZCQKm7YBXuRdNkKZ2aKH9fBHn8=;
        b=WlZs6pVARRm6awarvri0q53sMi9oDggMqafs8zD4xJmZOllBKr22motDWK82LidmRB
         bIS+REnn6T35uQyDiDb9skkfwp+Lx3lZpWErEF1iz5etshtdgWI80bzt0ee5AgJFyjgJ
         L2P1XVP2uAWjiNzyf5WEq+SKxC3m2N9CB6gMU0EcYmOMzunx/Sh0KOMIIOnnya9RlX3j
         V46ghNboqcxD0NS9zQa6iXnPUlZ40yu+WT+Y2qynMwQZYP3uskTmrG0J6rpizTsN2W0D
         5Td3lkh8RDIOWYNsOziKUofXRhirz0AeJTrcFyyGBb2YQc27ex3E0O4OB8pY22Hn1KPC
         m37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023609; x=1792628409;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JaQsBngKHxTZEacWBZCQKm7YBXuRdNkKZ2aKH9fBHn8=;
        b=L0iKSmiARsyx2y18JgA8tEe4Ln06eLwkLvZLlI3pxpjHiHoMbqi+dhV3sm6PI6uo11
         08VqiZpsa4cF+w2UvnuW8fTTVuzmXgLKdum4n79u33qPUPoNI/4N195Q9GmVspBBEWSv
         fUz+y80vt9UlDkuHd5AwTMhflJ2qOQ1lgbj0aTjWro6IFn1k9Ciz2Rc8Povr1wWyByYD
         F0goKZi7Q35H4FL3SxojcmWnBL1UIMTqc78JLof/kI9SjWFZHozZe/NEAnYx0/Q2DAfH
         jR/vOlOG/1o9fw8kfZbwDh1rn7C6YJWNAbyq39ux429cAy9Hc1wWfE+83IgVGZfdg8i+
         xArA==
X-Forwarded-Encrypted: i=1; AKwUvBydwLiKaYLITSmJ7QA37HxKiYgu10KtrnFwlNiVyNtxtM+ZJA0l5apYwpUWWb8vYkAIvq2PNp6GMbRKh+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ3DBUilKFtcTaWQzm/aHwjCy/cWTejKLjM1YS0X9ELR/aVPv+
	hQyaBICBoXyDnTWo8480q3OuvvXNyhgB/pMoHFWALuwcEIjBM+dsvlxOM8iEVtQnuj84ucxm9XY
	EvVsg3U7CdExfMQIJbeFlXCpBUbHTsaSN9PrzRNeZwEHuDz65RavAjWyNhbwriwEjpQ==
X-Gm-Gg: AYBFou0R4Zdo8tqwqbBEONUOUwOo1q4YSihIXlfzsAYdZoHXvGpbn7lbqghi9i2ktY9
	HC/xDM4sAPowT8QIhplAquqcFZX6jtPc9xKbAa3mbs9fKhG+3vDdy5XsafgrqEmK5x3KHZO4wUE
	bVXQKeWgWiEze3bDdv1sGtyfvRB8qRWyh8S5WKcOBIhi2lfNsYP7XRz4NuNoCEh+0Os+c+8Cfru
	TD8sS7ZmGpwN2SuELCr66oqtZ5L7rKFO1GaIkdOhYNpVkNaueSE2cAHXKzgv6OBlVmJ+sOfQJL1
	f+UwEer//vhXXf7MEdPkiDKtV5BmeY85AMtE4a6YFmAqsWHh8qE9fLPbHM/I7vc5sk8Pjln2h1e
	xYIWlf6AZnTOtTr6YnaT5lHQ=
X-Received: by 2002:a05:6808:f88:b0:4d7:17d5:6c9b with SMTP id
 5614622812f47-50c40a3e034mr15534514b6e.9.1792023609360; Wed, 14 Oct 2026
 17:20:09 -0700 (PDT)
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 20:20:06 -0400
Received: from 121308794542 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 20:20:06 -0400
From: Iurii Trukhin <yuri@trukhin.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 20:20:06 -0400
X-Gm-Features: AclHuK-R2VI3EMAmxypOk8j1RNgr0sS8TKkXhCdHLAm5TtP6ChLUvq5ggexLBu4
Message-ID: <CAOx7e9K707oLMN94TC=FBBZYKnwACsN-8mDVjsL+N+BBCmWTOA@mail.gmail.com>
Subject: [PATCH] checkpatch: add vmalloc() and vzalloc() to alloc with
 multiplies check
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Iurii Trukhin <yuri@trukhin.com>
Content-Type: text/plain; charset="UTF-8"

vmalloc() and vzalloc() have 2-factor multiplication argument forms
vmalloc_array() and vcalloc() in <linux/vmalloc.h> that protect against
integer overflow during size calculation.

Commit 070580b0b174 ("checkpatch: Suggest kmalloc_obj family for sizeof
allocations") updated ALLOC_WITH_MULTIPLY for the (kv|k)[mz]alloc()
family to suggest kmalloc_objs(type, count, gfp), while vmalloc_array()
and vcalloc() retain the (count, size) signature.

Extend ALLOC_WITH_MULTIPLY to warn when vmalloc() or vzalloc() is called
with a 2-factor sizeof() multiplication and suggest vmalloc_array() or
vcalloc() respectively, including --fix support. Also include the 'v'
prefix in ALLOC_ARRAY_ARGS so swapped sizeof() first arguments to
vmalloc_array() and vcalloc() are flagged.

Link: https://github.com/KSPP/linux/issues/342
Signed-off-by: Iurii Trukhin <yuri@trukhin.com>
---
 scripts/checkpatch.pl | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8a7787d228a6..651a46f1fc40 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7355,10 +7355,11 @@ sub process {
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
@@ -7366,6 +7367,8 @@ sub process {
 			$newfunc = "kvmalloc_objs" if ($oldfunc eq "kvmalloc");
 			$newfunc = "kvzalloc_objs" if ($oldfunc eq "kvzalloc");
 			$newfunc = "kzalloc_objs" if ($oldfunc eq "kzalloc");
+			$newfunc = "vmalloc_array" if ($oldfunc eq "vmalloc");
+			$newfunc = "vcalloc" if ($oldfunc eq "vzalloc");
 			my $r1 = $a1;
 			my $r2 = $a2;
 			if ($a1 =~ /^sizeof\s*\S/) {
@@ -7381,9 +7384,13 @@ sub process {
 					 "Prefer $newfunc over $oldfunc with multiply\n" . $herectx) &&
 				    $cnt == 1 &&
 				    $fix) {
-					my $sized = trim($r2);
-					$sized =~ s/^sizeof\s*\S\(?([^\)]*)\)?$/$1/;
-					$fixed[$fixlinenr] =~
s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)/$1
. ' = ' . "$newfunc(" . $sized . ', ' . trim($r1)/e;
+					if ($oldfunc =~ /^v/) {
+						$fixed[$fixlinenr] =~
s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*(v[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)/$1
. ' = ' . "$newfunc(" . trim($r1) . ', ' . trim($r2)/e;
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
@@ -7397,7 +7404,7 @@ sub process {
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
-- 
2.56.0
