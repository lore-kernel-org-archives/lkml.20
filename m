Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672F4562B0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755136; cv=pass; b=VGXdlHYofcbixVPqh4n/O8w0FOD/vV1D7HTUnC67gvxq73eNlC/xqQi2FjraOr+EZMWDtznQ4jN7fBZsoDjV1d5Y1iw0bJ2yIbwaiiilCJBT3jgP5wCxoUSs2580DePr5OGCsJpctpLdR0eNEGrYlwn35twUFTUFrFhgkWHyyvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755136; c=relaxed/simple;
	bh=GQ67D7m6aGzZahEWTzQMkof7xobtH+TCj5JbR+ns31I=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdYG2n0CqWeo8uYRXoCWSLwr4qBm96iThHS3JW++SQzM7jMCLbdYRSzzhhBV5ufwxvqH3NFD1z0QXpjciwziW+4c5Rgb5gHOrHSlZROu+Eosji+xvRi85LznB2UZ7sHgY6MekX2JPO0CAzPj3QK6sfk2F4aWCDgCqiEVwI3MC0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YT/tLQt5; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YT/tLQt5"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93be29bb454so723460485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790755133; cv=none;
        d=google.com; s=arc-20260327;
        b=E0aAZp/Il3nRJmoabCqyNr9zfopjm+8qxUNTy/l8W99WpWydUt+nuC+ZO8mvUl2jk2
         kwBywoWOlXPz7PlDbgPAOzi4lwVYMWbZ8U3P6g6jvGt0tTKDt8uSptnIddxcukgePkXY
         ZvblYGKECbCRkv9M0tUOCSuKDXOsncL+1ucw8+ehJ6K5j5X3VRkTVrjs+CWN00224REs
         vDNJVVJhsj2oHS9MwmWJnxvtBKE8r0FrZgdZBsVw7ubuGKNaWa74H7wjaPjHmVU9seUN
         BQDbH+jle7knvrg6SCwkOAPHioLeeymRgucvZehG+Jf/TUEWLoedIVKf+1QmQxZEzIeY
         nmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=IQcCwsO64O6tzTlMCE1fWnctbm/KS4UpXxHtRBcS6lE=;
        fh=/c4jcwKH5Ox643ToWLhB2egD5eevz8xvFPaeOEomnSE=;
        b=kKesEJk2FUjLx0GvOtsOg7Dmv04Wcb79ZFhfXs+IaUBG5GyDt5qAZUqgtgl90tsQdw
         tLawFOqPRZSOuzBJs2cMFZrJBVgV27n3E46kkLkbOJIrcNxLDRWEb6L+fCQh/MTwsEwi
         /U2u2K44sxfpM+J5rphhCxYEnPcZ7h4PesP/b3bHjfNFH+34g1Eq45cPp9iIhQHLM97S
         ypIAhTJLhhCt7J3aZyj/4xoCmLnPy1NG/EDnXDaKAUjn5+soY95VrRELY/wpaN7pn/sS
         fXBX6lctkFNe1OcDVEF9fQfavdnsjnI0JwI+n/IAPBPG6ZuhXMi8ZhXniEpt91OoWYLh
         rdTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790755133; x=1791359933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IQcCwsO64O6tzTlMCE1fWnctbm/KS4UpXxHtRBcS6lE=;
        b=YT/tLQt5toXIXl3oN0qdQ+RNrUKmGXfNh6jPUxBKmxbYkmwuxdMfhjVwcFktK9hs3F
         aNxZ8biXmtceJOgS1jZDaalcVgLM6TNs0IiLX8Vct8xi/ekOfVMOAHXssUrN/fx2ngb/
         pEpOE9zLELnXGBw5cE71nsaAuCcZ5ygOnp09ck2dqQySH9f/u+1DIdxXjVUE/iu9qVdb
         umQKos7aYuiX4EEaukshKtozCT7NvC5It4F8NEfx+3vchAQj64Cm+IZop4xyngDdug0Y
         oK4u6JovLfiWvD/54TMzZ9q+qw/7Qt60NmP3UBJeKrzpCMpCg7rEZF6sZ+m++kfQVW5f
         qWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790755133; x=1791359933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQcCwsO64O6tzTlMCE1fWnctbm/KS4UpXxHtRBcS6lE=;
        b=FtKnr56IEhACAnxTaQAnB0QtW9IDtG2iGh6+HJPkHaxP0slF1f+nyRW/VWcpIIiPRb
         15jO966lq+93PWqo+e7Bs/EOQkvRjusQValBRMAWfWfl6hF7MS/ICvX4tNpWq9bLh1Gv
         aqQqEZM7Pj+tjlHD9sv8mB6yTEHqAlEN7y6voNn+nPbsNpODocY63MHlUEr/pEL0sBPP
         3BFUuElh2cT+PLFhvANgXqpJE53eweICRXik4l6+FmMomqg6Mf67pb+A4l110768Jhdw
         MDyerb4TK76v6gJYLHw+MP5tLFf1SOJQWoU2THNTqAvR1EglZW8to2ts4XFQ5SAxtOb0
         0ldw==
X-Forwarded-Encrypted: i=1; AKwUvBy+DYvim8eCvOGVbVYIqz4UaCFu6m2vZ+AansOm728dwEnZ0KfQQpZY9jIkx1yM7lpau/Cq7uzSLEd4FBI=@vger.kernel.org
X-Gm-Message-State: AFuF++luZw7ILA3l+d1TsaxaFqlosABQV30Fdsz+N0BcA5zjM7w5Y4Ai
	FR6YcCaK+J3H+5HQ26JyKOKcCqCvqTytm8lnqca+ry6BVxS1oQi9Njop6bJzy1L1fYj3UhcxN1l
	NKQNc4vNF7sDt6rLqBcNuwu8QlJG2EpY=
X-Gm-Gg: AYBFou0ef4WmwAjaPmKZq5MNMd5GwSI3mD8dskqAK8/RW0J/hE4Xx1IUYvOglSGNXMM
	NWxvi0ZUWh6x1rWJhQ1/OycD2HA5uBHzw5WpUSCRKCRhOuzFLEHpXuvzfK7MQJZOQ8h4nI8plv+
	YfpuPukocPbnPEJqHUjHzf1/vwIVUDvjygt53R/DbUb1uHt8E0AtnX4x69LRsK8vPrzXcctKSdZ
	2SC6CVIY5HsgaOhP02ImGmSVJ1242mM5eOmNCtXeVwVTK+ygQzvDlcnnFIPQ0oT0p8V36BoDXlm
	dUjYUjfCq7NJl1H3DRTnifUuriyjlvLQCCyKHCWIflkUcow2NNJj1JE+F8C9fUFw078Y+7IcGne
	JGeRh6HX3tFfYLCfyyFHCb28CxI8Wh5ppuNwr1HhtyDEsDf/6AzNDg0YouzW4tV9LcwIwMCdodm
	lgMMlcCegClpHI3I5iRPSaXwmj9oyYDAqAnqx6UTT1mfcsxKIpn0vit1N5QlU5CJ3p9UMU5VUZ3
	JMm+5NhXT/38Y8=
X-Received: by 2002:a05:620a:454b:b0:939:b099:d52f with SMTP id
 af79cd13be357-93ca9650a87mr80148785a.20.1790755132822; Wed, 30 Sep 2026
 00:58:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 00:58:52 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 30 Sep 2026 00:58:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ting-Han Hou <ue081723@gmail.com>
In-Reply-To: <179071199261.2735405.15944114878466249879.b4-reply@b4>
References: <179017337986.52388.7943687183785012868@gmail.com>
 <179037565553.3985470.12035061965740287126.b4-reply@b4> <CA+NtrhRdnuZOOFpBXvnfOXFs-HA8q+2sLvR0BxH=BjzVAEZBzw@mail.gmail.com>
 <179071199261.2735405.15944114878466249879.b4-reply@b4>
Date: Wed, 30 Sep 2026 00:58:52 -0700
X-Gm-Features: AclHuK_l14BgBlQAEUqwBjjdsg8HswhmB8XtP7bRP6Z064JojK65_GlLOUveE00
Message-ID: <CA+NtrhQeOacYz+nGqevB778YW01sREPyndzh6QOsKxQR3ON6RA@mail.gmail.com>
Subject: Re: [PATCH] clang-tools: Import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Ting-Han Hou <ue081723@gmail.com>
Date: Sat, 26 Sep 2026 08:52:24 +0800
Subject: [PATCH] clang-tools: Import os for broken pipe handling

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. If this handler is reached, it raises
NameError instead of redirecting stdout and exiting with status 1.

Import os so the handler can work as intended.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Hi Nathan,

Sorry about the formatting issue. The diff header was wrapped in my
previous email. Here is the corrected patch; the code change is
unchanged.

Thanks,
Ting-Han

 scripts/clang-tools/run-clang-tools.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/run-clang-tools.py
b/scripts/clang-tools/run-clang-tools.py
index e78be82..79d58b3 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,6 +12,7 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
+import os
 import subprocess
 import sys


base-commit: fe2ec83746e501645709761605c2464a44fd2929
--=20
2.52.0.windows.1


On Tue, 29 Sep 2026 21:59:52 +0200, Nathan Chancellor <nathan@kernel.org> w=
rote:
> On 2026-09-26 08:52 +0800, 14=E4=BE=AF=E5=BB=B7=E7=BF=B0 wrote:
> > From: Ting-Han Hou <ue081723@gmail.com>
> >
> > The BrokenPipeError handler in run-clang-tools.py calls os.open() and
> > os.dup2() without importing os. If this handler is reached, it raises
> > NameError instead of redirecting stdout and exiting with status 1.
> >
> > Import os so the handler can work as intended.
> >
> > Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python script=
s")
> > Assisted-by: LLM
> > Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
> > ---
> >  scripts/clang-tools/run-clang-tools.py | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/clang-tools/run-clang-tools.py
> > b/scripts/clang-tools/run-clang-tools.py
>
> Your patch is mangled, so it cannot be applied (maybe you send it with a
> different client from your v1?). Please resend properly.
>
> --
> Cheers,
> Nathan
