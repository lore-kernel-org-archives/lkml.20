Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7DBC8EB
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791119757; cv=none; b=r9RwOM/LFoTe8bpltKGtfc77Kf+XmSjQ8FvZUxN77NHXk9d4EdLAD/KLgA4nZVsL/LNJcj5rgJjX/JByP53hABfkvyKTXKDx7qUtowvEp31UvVyQ6ZvAYvBKiSkYJHPT7SfUYU6g7axnjXV6SzSWTim1lXREO8yksiMO8Ux6xfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791119757; c=relaxed/simple;
	bh=Z37sBq+GULPZQBdj2pLH1xVzQ2cG+s3dgYG/43x4hWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBJivWTy49nrnjUOFIrS4V69e4/6BFvj5T+F+ChbOa650Y2n4b4fqSW/9DmopWUrWDNloyvYPcHRS/PzhU9JPINVFOcSXrOQW+1itFd+1vKpcmHuMZKGwKR/4K677UxGj5+pxzYzzUgyg4RqXq3O5H31NJCX36h7wrP583UJfYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cilFOEWQ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cilFOEWQ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so140627366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791119754; x=1791724554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lz7ZQuVL2QlQLC2HBaA5paqkkqSZXbcEdbEfMxzIFHQ=;
        b=cilFOEWQmlV7vqYga3ppvhtgLdoXU9I9G2Z0M8aGFjsHL9HndHpl0FTs1YHkCEvBH7
         3D8lfUNA+MvUIPDnAlL15NqWyJPIX0S+fwfc5cOzdNqtRf3doydL8EtON09LgjXTwO0e
         t1TOV+WntbYmFKuCS/j1oWiXC4ZnsPOwGc85c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791119754; x=1791724554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lz7ZQuVL2QlQLC2HBaA5paqkkqSZXbcEdbEfMxzIFHQ=;
        b=OvZxoQx6NreU4bwg+tMIhMig3amF9T3U3ls1jDcFUlewpK8sZTSNnDn8zqX05+eYDK
         faSqb03Qg1MwhNDVk4GhBcpGbg+EnwQ+kLTe0yab/SoXdfjBzkzLxd4reMr6pXo090XL
         QsTOIQb89p4Y7WtNv4r73HAT+73l7ifSTqsdc4DBabkmGVPdthN60BNyCNYKxiapkrHu
         3xUeT9S4G8kZO1G9AtS20PZwoy8RutTvlkd8rYy3zK6CFEZjG7RYfcNGHombZismZ73A
         P+2yyzok2ksy7o+R8o6848tZolC+s/NXyj+v9YnHTggEpqRdUrtcW+LuQiubmVCMekWz
         KyaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlJb4tknLlZShbDQFEc9MIvL/U2QNZhC89LXaLSgq2m62HbEPbRvzEfVRhCdMpsbA71i+K6M8DDN3TLD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvEqYwyt6JkOk76FbxQ3Ucaa7Rr5mECdOBzl0TV9/oA6Ec4QYE
	j03vh9rd5blaqrnetonTiqyHTf7ozaDUZv5yEV5Wex0FLcznNSgiPpfravM47mqRTzdcRDN9bV2
	d58Fhsw==
X-Gm-Gg: AYBFou1Oq1ZX6mS28d/nj3O8nkJaQbJjuoUIqSAtZT4goJLGOMGGOqnlV9VRpZ7CjgR
	kXd+zkgdIeyTxEMlx2ocCkSCQcZwSLE82yhCpmrivHBtO8LVa30ooP3S4MGQhJ1HvYxuSnf1aak
	xBauoQNHc35HAQvn9f1cHPy6Ey35jSvC9J/k31c25YNVB8Aqr4tlutVNMW70EL+3zhOns61pzVT
	KAHwgBxLDoVb0relaFpRLbDhg0bm6Wgz+Kh0JiRKB4mb16OcyNaZFokV+mXww8CRhNTo5jXqOWE
	C0yeAJDdoaIJjrQpnjC4J75QPKblhsAxeLqr1nyjbOJCPqz99zPkTWuYhygH6BZeuGN+lYGzyVN
	hRKe3V9ugKU+h6yu/y1oSTPa16/i9dG3xgSI8esaBw/TyfnTbnXI09VqkcGh3RTDKKmVxxQBi7c
	yGZqOCPmv1+2Wt5eK+qQBvV7SMktk7tG756bdG/hFmUHj/YhN3eNpso4SrOd8HlWrzF0t3I7bUr
	CRbNmxMNU/oVSeHE/XHwhDZFqfd8TZHI8Bub0kpDIfWC7a/
X-Received: by 2002:a17:907:7290:b0:c25:91bc:ff55 with SMTP id a640c23a62f3a-c2e6eddde2fmr375036666b.23.1791119753798;
        Sun, 04 Oct 2026 06:15:53 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cd05f80sm305235666b.20.2026.10.04.06.15.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 06:15:52 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afe75f055so780107f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:15:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxWZIPpmAUUvvqUsSu39ua6gvVWoKNi4fjU7uIhtELp0kZHbFo9WMY69j1yAKe7LQB+AcjwZrHymanXKYg=@vger.kernel.org
X-Received: by 2002:a05:6000:25fe:b0:48b:f08:8159 with SMTP id
 ffacd0b85a97d-48c47ff6187mr6768724f8f.40.1791119751485; Sun, 04 Oct 2026
 06:15:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003110200.3-brads@mainlining.org>
In-Reply-To: <20261003110200.3-brads@mainlining.org>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 4 Oct 2026 06:15:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbP0HFmKTZEQS4OMDHtTt8WVjoi3xuKrA=VtGOrFMOAw@mail.gmail.com>
X-Gm-Features: AclHuK_mSciWEetQ2ucyLqsTjjMXO9fV6L6hbYAaYGGWj5-sk5Te80OH7bL0w68
Message-ID: <CAD=FV=XbP0HFmKTZEQS4OMDHtTt8WVjoi3xuKrA=VtGOrFMOAw@mail.gmail.com>
Subject: Re: [PATCH v3] watchdog/perf: one digit too short in the raw event
 config copy
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, blum@kernel.org, tglx@linutronix.de, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 3, 2026 at 3:40=E2=80=AFAM Bradley Morgan <brads@mainlining.org=
> wrote:
>
> Commit 6164be01f179 ("watchdog/perf: optimize bytes copied and remove
> manual NUL-termination") swapped strscpy(buf, str, sizeof(buf)) plus a
> manual buf[len] =3D 0 for strscpy(buf, str, len), and that count is one
> short. strscpy() keeps the last byte of the destination for the NUL,
> so the config loses its final digit, nmi_watchdog=3Dr300,panic for
> example ends up with buf =3D "30" and arms the raw event with the wrong
> config.
>
> The empty case falls over too, strscpy() with a zero count writes
> nothing at all, so nmi_watchdog=3Dr,1 leaves buf uninitialized and
> kstrtoull() reads whatever stack garbage is sitting there.
>
> The old code was safe on both by accident, it filled the whole buffer
> first and buf[len] =3D 0 then stomped the comma position, so the worst
> you got was a truncated parse failure.
>
> Pass len + 1 so the copy includes the character the NUL replaces, and
> reject len >=3D sizeof(buf) like it was before the optimization, which
> also turns an empty config back into a clean parse failure.
>
> Fixes: 6164be01f179 ("watchdog/perf: optimize bytes copied and remove man=
ual NUL-termination")
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> Changes since v2:
>
> - rebased on pristine mainline, v2 was cut on top of v1 so the diff
>   carried v1's hunks
> - the intro note moved below the cut, it ended up in the commit
>   message in v2
> - dropped the Suggested-by, review feedback doesn't warrant one
>
> ---
>  kernel/watchdog_perf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Other than your changelog being "before the cut" instead of "after the
cut", this version looks right to me. I assume it's easier for Andrew
to just delete the changelog when applying than dealing with another
version of the patch. He'll presumably yell if he wants you to send a
new version.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

BTW: have you considered using a tool like "b4" or "patman". Those
should be able to send the email directly for you, resulting in fewer
goofups...
