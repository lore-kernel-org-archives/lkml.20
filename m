Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7396476072
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531823; cv=pass; b=MWhZH5jtg2zXPllkdNZkdhuVdVE/nBzfgNjLdzXgwM7jEzEyd++t9+CYTnYwP4brGmhtKHLx+SjEfVTXwA1WItOR2f+Dg3ZS5UYMJUtrKP9DKHt+YP+5mrMSZkHMuQ2Tj04I9kV7d+hncYOlWE+ZcNRI6yFlGp2mY+lLWroxTXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531823; c=relaxed/simple;
	bh=DqWYMz6T6MwhxfrR8L63T0AJfuhb70RVs8VbzlNN7CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xzrgzc1o9YcHyzj2HAIzRGpi6KXp2t8Phs39Hflk7B8wa5yaaX1SNmHiRRDy+JJydVEeZoIIl9A6EHR/DnAx2KzcDTOiYnPYDLAMsfBhiXxcQMJNXB4CgYTXpqBYOXwVafJl50iEHfxuOsFYk5v2NO4C77BZMcu71Bg1kmwAYy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SE+m1Uz7; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SE+m1Uz7"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed441so138283a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788531821; cv=none;
        d=google.com; s=arc-20260327;
        b=SlzUx1PibtS0EazdtYqkKqsRWBxsu8C8MtWCOoeBzQGg/z4V7BmaTAAwz3dHtx1gdZ
         4ubt2QnPd0LMq4uszbzXhxW1vE57WuTw8jpdRY3jgG2Rdcn0Mgxng77KfYFZoHdMwbkP
         PuKA/KsNIezsou/UzP5s1HLW/KWjgPEoy6WZrY/57r4jHQ+1sN3wSUYeRE2JCw6rzqUQ
         mH55QqDqqvO5Qngm6zjLLO/swc1PRZE23HU6QWbTljIX+fvkwP6447HBcCPg8bHd+ZjA
         jVDMFvFWXgH9Ccj0w1lj1tnS5O1m7Gqtxcw73gRI2n5dVdVSNtF0A+0ef70qA0m7YxbA
         KKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v/IdbLiGLfNJWgT3may7e/Lmqs8svlFsWUM1fARTmC0=;
        fh=s/2fKFCSWI804r2w8YReXPDTzO0rnmwIJHSOlGIDUe8=;
        b=s01sX9E7KbdxSU9IDPBHN/O6o2PAEGOoDbW1ALZ6w9DWaB7lZaLWE19Xl5vQ3Xv1Ke
         vWsbXpWhoELdX0N4Y+akZbt/Cvd6qmjM/2N/ggySJZt4RL80w2ddCEo52h0EKS4dTbtE
         NpLXxA9gqThHe2TO355K4fL6zHXqwe6zB1U1tXvyJGMAs9XDRq3TlSwgyZgMC3jOTIA+
         AFPRdhQowhauqJTN1McW6psJxgvlWc/XhiGBLklqlyu+LP264yquhO3iTZW5bImKV6yd
         tGW+z3hIGkf5mbxF9vV6UBqw9A5ivbDNuU+qzmSWMNcEU4peSRWWE+abOREOrPiJPH8s
         iTqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788531821; x=1789136621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v/IdbLiGLfNJWgT3may7e/Lmqs8svlFsWUM1fARTmC0=;
        b=SE+m1Uz7YHhKdLgyFemVCPJwdWmGT+jX73T1cZfJ3v6kaRe5prDNO6LFrnVTT/41Ou
         Vq0SnmCnjhbD9VNtru7qb74ZSgqnW+3a/qMP8/U+8ZcJ3jZSjKJ//2rU4m4mSKEDMxZf
         50J40VySG824d5qo7w+oa/si5Q9x4Rhd1s/c0R8K6RYBPZ9gpvvxiOH3UxjPYM+Nhsi2
         Xs3t9oznZmgOG83M9btaGT5SJpgTTYda9gx9dJxND8HMJg5+FjMTC5/Ct2T2Q08R4x+d
         E9BEyH28d31OsSLgygbiglEiOO43OYIugDISmAJ9O1ZRXMpsk/Zoc1qj+lv5GCbCVNr5
         5+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531821; x=1789136621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/IdbLiGLfNJWgT3may7e/Lmqs8svlFsWUM1fARTmC0=;
        b=Jnoq9DtWs9+RG6BKIbW5sXuVcLyPTIRrTCushNCawPYB7AmfCGV7b8XrA8yCtHyTIM
         ZWlwKs/vSHhHOR4ITnDiX3vJnHUXP5JtyXIFVQrOeKj+p1P1aNRfJVMwPqElo2xLvR5M
         9M2vjdqAHo8OoOmVTt9C2tFY7hBkv0igCJbbRHnNYMqExlKzcvNNoNUl+EfSXw9aM2eZ
         1e2mYUsctaF2z78j2crToWnO06aTpfkyr8KaAli98r47Gz9NazNR/HwzoVS1Z6/B/WVF
         h/WSUjK8Oej1f0OLkF+5bJ+1HkSsmfrypoJ57mZWBcKf/rSrTTGuSVmaOAjhp/NHmFYo
         PSeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7OyTaVHQulvjJKeU4PbB3qc1DJNjdddhfD6TaQcZxyyfcCjA3Qk17UEj2svQ340heTTF7BmFHNwDa60Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kmwIHsXyIIfzwf07slcnNpi5rKVxxiFK1g/nAoLD0R7pint8o9
	LD0KbV6s8zhdZbyECNisSKQTA5//JLUyBuH/cgEsXRft6aYyaeL1gtuparAYwxF7G6ETI6s2Z5S
	0VMta4dOIspHBRH/xOu4SRDYtgQcXFMh8DPPIPxI=
X-Gm-Gg: AYBFou3HlGWEdmnJUcQRi+TJRbjSWLak6xXE8q/I1no2gaaOZxvKq+qkDagYbYNYK0t
	+FMe/FwfydaSCGJqDi/miYrwmPO5cPGDAhbSEBtZUJo+Iwat5OP+zsy3C8iiD8+02rEAfFmjZy1
	DkOxNoPKZdYawegQzsSSj9GCYWcvpszrfnhTLRXKeDvoJifeUI+gt7BC/lZMmpl+TjeqWIp/23H
	kfyskq9T05SZUECULt7FTwoylDI3iXfEN92lgFwsuOuailResMK5GnTgTqr28Zb2KqM5XrbQaEE
	ZZg4cXH/09nQHIDQbl0WfIhyuLffDoua26whwvkTMYB9Jqaa0nMMLu8WzfHpUnhiAarr7wKGxEn
	GTLd1e363Txiffe9J7BPlq9waZBb0zVuL0P1ewTDNF3GqGRV5r5TpUWi0dB9FNsuKlWF6k7M=
X-Received: by 2002:a17:90b:3bcf:b0:396:d27c:8696 with SMTP id
 98e67ed59e1d1-39b2693597emr6435720a91.4.1788531820989; Fri, 04 Sep 2026
 07:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904122002.27960-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904122002.27960-1-hemanth.selam@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 16:23:28 +0200
X-Gm-Features: AcwNN1WTRRMr7Y3iQTAP8AzxwhPX7ZjceOE95KyFxklhpavQwwkWcnNoQDcihuo
Message-ID: <CANiq72=QNpuvP01TfXEkjj4i7p4QU5WGj4mjHjrKyrUMsjEwWw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix typo "funtions" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:11=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Correct "funtions" to "functions", reported by scripts/checkpatch.pl usin=
g
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>

Welcome! I noticed this one in my spam folder.

But, yeah, it looks wrong:

Fixes: 5270316c9fec ("kbuild: Use -fmin-function-alignment when available")

Thanks!

Cheers,
Miguel
