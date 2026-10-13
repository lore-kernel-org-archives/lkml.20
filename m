Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF8A3ED5AC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791902303; cv=pass; b=Z1mYoHhB5AavftnCWRE7ZhXu0YEOVZMLgnJAR2HDAIYsKqz+anFCO2XOcguwATGjJoWelJt0l+RUp+uO+ghw60YIfPqPJ5G2mugKN3KrVP4vBLrw68YpYQEezbKkVb86Spqq0bNPzT82hS+c43CvjZJrXy3rdklnfTmO8zBCf68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791902303; c=relaxed/simple;
	bh=RbSjUQCsPJ1GB9PoxGtOVzybu2SY4MsN5p2cxCLc9iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQ2rwQq0FBcxNeO2L9HI0s72aQPOwmt5UhNfA4i6g84E+5xVbHrLfWG/lkxPOJ9DegM9wxYwQI57rpZ0kD7uLd5O0f/UkhPHjRbepEDcXZMUYqaetg0zajcaAspe7K+6k1p9zPFVr9wRI3+J5xVE2BrebM9hoY/qd4fUbyhjVVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9tuFAt5; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9tuFAt5"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0703011c2so22721597b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791902301; cv=none;
        d=google.com; s=arc-20260327;
        b=OBzSg8bLZKsDZuTcG8eCnvR8epfvMlNITOypJYLAczI0tB6d2REyUD01hjEy/Graw3
         VUGV4g4FZIUZsoWF/Ude7ZKaGYnhHKW67RQowPt0hettKxtwuuqVJSmFLZ5abx77sp1/
         eyTRk5/vN6GHI+NZY3+7UBFY2Ly0vlG68hKbop9Mt5bO81n36bjcI0DvlQKBG7Powh6o
         h0wwLjaKCEalkTdGtJ7gqgCtdGwEr3Cyo3x5mq2gExk1I549MOf8AdU2oJDPZcyL31KV
         XXvzjm8Jtj4SmP7D0LEAK6OB9lG+q+HTr4uVivbE+XUjc/eZZtqtveYZzgRpGVvOHnMf
         99XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UZvfucgE3y3Sdudr/dL/bVu22Dv23ASShFKdCR0HD50=;
        fh=r++NPZG36aMukJHdaZsq4vIp/SQ/05NBpQH2xbl0vDw=;
        b=DqHYwQl4Ij5rC9QfT01IoZ+imLKdB+yFQyob+tDJ/3CM2fESeEE9R76pK+wsaKdXnH
         xlZSWMIlG6Svu2rObKQ990p9mn6lEWiYMZGej5x/2EdKXd22TLJuhfJ6aW+MkqSjcr5Q
         SrMvpx8wimD9BplvN2eR+i+42fEBS0Vom+5GZ11j9yxIJoGC57ytgVlZ00JM9rUSMQf/
         O+j3oeocfT9zhWml7ua7TG4uo3PZpZj8RH2qJ/tbRENy9v4AvWjJq9D/KPWC8dTMQu5Z
         OcubwtzhD1mw5Qh3/yRz7+/1PVFbzqM9M0KofBDYmQAbpCRJmVn1mKlb0QzhS8xVKA1y
         cWfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791902301; x=1792507101; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UZvfucgE3y3Sdudr/dL/bVu22Dv23ASShFKdCR0HD50=;
        b=O9tuFAt5Difg6tUKGDz2athBTHnExpqxFbg3BdwCNE9MHiUoyH7A75fewTjCe0NjOJ
         MuBWZ2VzBRnWzO2m8d9oUIzPVxuRjW2b/+VC8B+fFmdfj0icIjByP42QhM/2m0XLhWYZ
         rB0l0z46Dga8svC5Lvo2ayxhBlLhasCh/ii9+tVyDaBjBAiKp2fjUOC3By1iuWReUygU
         kto2RFqbGsc3Q0KhlBgkV2O2ecsIxO2pi4O0uooVvUtRO2t47lNluuN+/llHim4dK98b
         rjLHpAUOeCvRanWbdv9/ts4gh/9cqloxMCg2xo76qBDfmAu8Wvs/67GlqHFSSpKWGh1q
         iyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791902301; x=1792507101;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZvfucgE3y3Sdudr/dL/bVu22Dv23ASShFKdCR0HD50=;
        b=Kjf67qXmShSXX2K11P/8lIqI/PPqlkfvT7TB/bb9wXgYL1wTR3JLRmDNu+GWBj0mF0
         SGdJFYx60pO7xA5S/c+/AAPiE5BtU6YIs9fOW8toN5i3Qf+DcF/yJKPaFndZw0stloWH
         rIAhBS8XfxWs781gx3dY6ck/NC6tXXORcs3vmiXsUj2vBMCcJKIQpQ1lTk3hE5llLyc6
         YNStHwmdw0gWVAftbivli04NwJvtq8cOkYWI5YzRJ0tWmfEoz8YKKpa1cGjEKFV0Aa2H
         2GoVDi671KreJbQKz16N+7WwaDhdQkLxr2k1YnEMFKQ8LJLGq9JsjiqTx7ecY8uhIMdD
         WXXw==
X-Forwarded-Encrypted: i=1; AKwUvBwbav1mDV4avxDJqEmm6IIZdK2RHaQDMJufdDy8qDnznqamhTtvr2XyK92U8sNxC1CZLwI/iPNsrnDd20g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrzTqI+od/TKVom/YNUulOkouBzMc8L3HNM8jQF1SNgd8QcEsF
	ggEX3qgzDR4wXgNJhuQsUkQvjKDgTlpfvpnmPckGbDjwWNcfWoR3ELsPurQcxRpok4DN7sE6TdV
	yApJGp9EfeNFQAS11Xw1ngm5Y5YfQJkQ=
X-Gm-Gg: AYBFou3lgsiznLXvzFQ0GkEZEa6/n7plQmwo6ZyDuszNVrxqmkiApxYc3zA7LUJbefJ
	PzTlxc1eHd0uVuZZCPP0vj+O22qGoqJhx1y3iS9QrwkV3u5eN23y4JxlM6t1ag+qLgqCGKJhlv0
	Jg+A7xmAf50XwxJnkw6GmvCo+o46ag91Tx1DlI+2kV6z+tfFFijGlpjw/0jIBAMe1fCIWQ5v0k8
	gQBIYq38EV/K25yxuMgSFqTOKdaBGk6AxmnHpMfywCX2wUGMzxugcBbNVxH+bayPCWsOBJLrIJA
	UhRYv+EMRw99QWk8diyGt/ZArDUKL+1jUvh1wAekK0PA6+HNj7YY3C3o+Ng49o5y14D3x0VZXvP
	/7srvh3XJO7yczvbiImvBquIF+VXALZ9z/LSCh4BpTA==
X-Received: by 2002:a05:690c:389:b0:8a8:889d:2ec with SMTP id
 00721157ae682-8b07f0b050bmr42706887b3.65.1791902301375; Tue, 13 Oct 2026
 07:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013031329.483597-1-cochcoder@proton.me>
In-Reply-To: <20261013031329.483597-1-cochcoder@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 13 Oct 2026 10:38:09 -0400
X-Gm-Features: AclHuK9v335onbua_Lc-ycuPInqEsyDVYv4IJ7Fyi6VC3eSDAeTiuVVQlWdv9_Y
Message-ID: <CABBYNZJsTEdKnY2V=gpn+HpVJ4dmS7j2vmi+BDV_Okm2ZZRNkg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_sync: scan unfiltered for host-resolved RPAs
To: Kyle Pepper <cochcoder@proton.me>
Cc: linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Mon, Oct 12, 2026 at 11:13=E2=80=AFPM Kyle Pepper <cochcoder@proton.me> =
wrote:
>
> On controllers without LL Privacy, the accept list cannot match a bonded
> peer identity against the peer Resolvable Private Address. Background
> scans using the accept-list filter therefore hide those advertisements
> from host-side address resolution and auto-connect never starts.
>
> When a pending peer has an IRK but controller-side resolution is
> unavailable, use unfiltered scanning while the host is awake. Keep
> accept-list filtering during suspend, where host-side resolution cannot
> run.
>
> Assisted-by: OpenCode:gpt-6.1-sol
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
> Submission review notes (not part of the commit message):
> The downstream N8/UB500 recovers an ACL link after range loss.
> No patch-off comparison or changed-RPA necessity test was supplied.
> Do not equate link reconnection with automatic audio/application resume.
> Privacy-capable and suspend/wake regressions remain coverage gaps.
>
>  net/bluetooth/hci_sync.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index efbd2e538..d0fbb3e08 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -2907,6 +2907,7 @@ static u8 hci_update_accept_list_sync(struct hci_de=
v *hdev)
>         struct bdaddr_list *b, *t;
>         u8 num_entries =3D 0;
>         bool pend_conn, pend_report;
> +       bool rpa_no_llp =3D false;
>         u8 filter_policy;
>         size_t i, n;
>         int err;
> @@ -3025,6 +3026,17 @@ static u8 hci_update_accept_list_sync(struct hci_d=
ev *hdev)
>                         kvfree(params);
>                         goto done;
>                 }
> +
> +               /* A bonded peer that advertises with a Resolvable Privat=
e
> +                * Address can only be matched by the controller's accept=
 list
> +                * if the controller can resolve addresses itself (LL Pri=
vacy).
> +                * When it cannot, note the peer so the scan below can fa=
ll back
> +                * to host-side resolution instead of accept list filteri=
ng.
> +                */
> +               if (!ll_privacy_capable(hdev) &&
> +                   hci_find_irk_by_addr(hdev, &params[i].addr,
> +                                        params[i].addr_type))
> +                       rpa_no_llp =3D true;
>         }
>
>         kvfree(params);
> @@ -3047,6 +3059,11 @@ static u8 hci_update_accept_list_sync(struct hci_d=
ev *hdev)
>                         kvfree(params);
>                         goto done;
>                 }
> +
> +               if (!ll_privacy_capable(hdev) &&
> +                   hci_find_irk_by_addr(hdev, &params[i].addr,
> +                                        params[i].addr_type))
> +                       rpa_no_llp =3D true;
>         }
>
>         kvfree(params);
> @@ -3061,6 +3078,16 @@ static u8 hci_update_accept_list_sync(struct hci_d=
ev *hdev)
>             hdev->interleave_scan_state !=3D INTERLEAVE_SCAN_ALLOWLIST)
>                 err =3D -EINVAL;
>
> +       /* If a pending peer advertises with an RPA but the controller ca=
nnot
> +        * resolve addresses (no LL Privacy), accept list filtering would=
 drop
> +        * its resolvable adverts and it could never be reconnected. Scan
> +        * unfiltered instead so the host resolves the RPA in software an=
d
> +        * triggers the connection (see process_adv_report()). Skipped wh=
ile
> +        * suspended, where host-side resolution is not available.
> +        */
> +       if (rpa_no_llp && !hdev->suspended)
> +               err =3D -EINVAL;

Weird, I thought we already captured this case. Perhaps there is a bug
in the code if AI is still flagging it as unsupported. Anyway we need
to mgmt-tester to confirm it.

>  done:
>         filter_policy =3D err ? 0x00 : 0x01;
>
>
> base-commit: 964430c038967fd06643e866f68115664e1a1bd1
>


--=20
Luiz Augusto von Dentz
