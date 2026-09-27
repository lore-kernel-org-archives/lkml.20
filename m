Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E62353A6F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790493207; cv=none; b=XRyP5/DzPXYiIGbApYdFuCdVnN2i/NU7l0WsDFFkUwjlaoLfpCSdGN+Z9KPuhNfB1UTL9C0BMVcFAoIXSXmKeWqJe45O24NN+iCy3VBwoKhPk9LbOv+m14fLgRG0vr184ReGDgI2bEH61a+zFlduAk6TtqqE1SmWGZgZ8b6Zt3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790493207; c=relaxed/simple;
	bh=xg9lHnytUzsMhYvQw2F+l2AVinsLb0BZEX6RnZbrPP4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bs34oFx540J+fOfXtugPAaH4tU0IaVY3LYVEYdmARd3tyEILNgaVZAzOZSCXNIo4rHyrhWGG7Dgb5+YLjdQkji/Q5Goa9HJFDwHpYD70f1EOpPweT/Eh9Ut1HLPoPpNdV5JdCzMpYgpov7QsbnjJDQpid2fd2FbMpfFs+luVMTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GB04Ulte; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GB04Ulte"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso2733355e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790493204; x=1791098004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DPJRgPFxwFWO+Our8bBm+hypHKB1wwy793XTUIl22u8=;
        b=GB04UlteI5u9iYGkvsWHJ37XWB5bbdBhO8hI0/Te2q9PldPVZiyAYsE/zu45LQ53qy
         u6BrEy0JhKjtuH1M5zNuroQMOblXAo5qk5/n2IBbhSEYPpX6EsmBbw1i+8jgLPQaG0yl
         z7j4DROmtwUw35HwKfKITUqOJOYRPckF6aJxsGup+iWiUAr2JN0LZ2YIzyp1MHXLEQcY
         V0EPCH8Sg7bwvQrFNwZ8JSN4iCFwygMqObC/368E2H84ImEyKXzrWEla74gxlGAlQZ2L
         gyy5Q6u15yU1WiTlH/4xVU/DwqkLmait+mRv+xNrF0UvS7IAersz3SgCb1myS4NIGEbd
         /sBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790493204; x=1791098004;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPJRgPFxwFWO+Our8bBm+hypHKB1wwy793XTUIl22u8=;
        b=N43D+K1r5b8sHLx7tV8ytBOoxGYKTmNsEwzjHsih7lCfW84s/j1H20lz0DBsioCpin
         3s0D3KPiIqHNleICUCQGCuEM8vBiwIA/VowC2IGHPSA92DbxY4bDQC6nZAbTasktan39
         b2ty1DuL0RtDQEDfcDWiKeY2lj+MTSNEW8eSMC1PNHsbwuUE0wpeMVFZCpeZF4VeglrK
         Wd43B5LH1WpIRDr10IG/s9niCiYXtWnziN04NcjfMPFUaoSbEflI+muPQO5GeCEOzpWm
         E0eGFqCuuEoem2osFwwrj+2jCrd4HJBQ+4pN9T3EZLIhT1jr+vUXcn6tGJJEGvXK/buZ
         3W3A==
X-Gm-Message-State: AFuF++nf1F1GobwX0YXOelMzuT+BmA+HP1J66bhMZE5ZbVHFRtCXruQc
	VMb/wbW/SWBLTQnjEEKnrP5Z8h7boS2Gajyi1nEYVWjFOfdBjAPoCNXF
X-Gm-Gg: AYBFou1krdrFEz/Ya2JtROFhIFPk6ajH6yM29omVo585wV1MvAwIe7pGPpc9brfiaqQ
	OZHZJ/9hUmzi6aAUgSEV9ULC2nsdV0D5MhgkqDHmTpxkZNKbWIEbgJ618w77M+5V93WlNocHHOI
	nYe/y03BJANcEs41cpcnVCYCjxwNcRZFWPcUCG3LsGN6NlO0t3kFBAYfMZL9KfL3Uzq6qpLS2v3
	MrAZQupgp/Vocm6mpml4Tu+qBJdvKnaChpaNlQpkSBXUBHEc7AdC50a1bfxTK3wXzWzqkvnU3o2
	+LjfAMMXwyB0FmzBC9VyEweP3MGD+S/pdwsGBgrjOULj9sxKMM1heOYZlYLNhvVNE24eDcrGj59
	VK2nxOQaxCVfcSwGlMO51rWCq0M/BHolTX4dYF3S7VR4Dg4SGRFklrtfm4UTmMfhEZPL8A1VNdt
	W9KPttHT/qO1fxPkv0DWojKS5+z47hcBMTzyodX1oGZK+zzVD26QidwXhfbXdeVJGlPryF54F4Q
	ENA8tewlNnJCxhp57NqC4gIc0mt/dpflFU=
X-Received: by 2002:a05:600c:1385:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-49fe66fa5c2mr173695665e9.24.1790493203588;
        Sun, 27 Sep 2026 00:13:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f3e68sm35402675e9.9.2026.09.27.00.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:13:23 -0700 (PDT)
Date: Sun, 27 Sep 2026 08:13:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: iamzayn19 <iamzayn19@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: bloat-o-meter: avoid shell for nm invocation
Message-ID: <20260927081322.26a44ce0@pumpkin>
In-Reply-To: <20260927053441.86594-1-iamzayn19@gmail.com>
References: <20260927053441.86594-1-iamzayn19@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Sep 2026 10:34:41 +0500
iamzayn19 <iamzayn19@gmail.com> wrote:

> bloat-o-meter builds the nm command with string formatting and then
> executes it through the shell. Object file paths containing spaces are
> split before nm sees them, so the comparison silently reports empty
> results for those files.

Where are pathnames with spaces coming from?
Make doesn't support them.
Even some windows build environments don't support them.

David

> 
> Invoke nm with subprocess argv instead. This preserves paths as single
> arguments and avoids shell interpretation of filenames and tool prefixes.
> 
> Assisted-by: LLM
> Signed-off-by: iamzayn19 <iamzayn19@gmail.com>
> ---
>  scripts/bloat-o-meter | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/bloat-o-meter b/scripts/bloat-o-meter
> index 5868a8b..72edbb7 100755
> --- a/scripts/bloat-o-meter
> +++ b/scripts/bloat-o-meter
> @@ -7,7 +7,7 @@
>  # This software may be used and distributed according to the terms
>  # of the GNU General Public License, incorporated herein by reference.
>  
> -import sys, os, re, argparse
> +import argparse, re, subprocess
>  from signal import signal, SIGPIPE, SIG_DFL
>  
>  signal(SIGPIPE, SIG_DFL)
> @@ -31,8 +31,11 @@ def getsizes(file, format):
>      if args.prefix:
>          nm = "{}nm".format(args.prefix)
>  
> -    with os.popen("{} --size-sort {}".format(nm, file)) as f:
> -        for line in f:
> +    with subprocess.Popen([nm, "--size-sort", file], stdout=subprocess.PIPE,
> +                          text=True) as f:
> +        if f.stdout is None:
> +            return sym
> +        for line in f.stdout:
>              if line.startswith("\n") or ":" in line:
>                  continue
>              size, type, name = line.split()
> @@ -49,6 +52,7 @@ def getsizes(file, format):
>                  # statics and some other optimizations adds random .NUMBER
>                  name = re_NUMBER.sub('', name)
>                  sym[name] = sym.get(name, 0) + int(size, 16)
> +        f.wait()
>      return sym
>  
>  def calc(oldfile, newfile, format):

