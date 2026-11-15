Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794754481;
	b=dzXYy2p95kjuNaIm5hTTfjU2uYxehDjUmZ/QUWAoQiqM725fZTxgIAbdBDdkx5wQZm4C
	 zFCnDBnccbtE7KUPH48Kmi1dlESYTamaWI8I6a6pfebxwwHhlCmuxpFeB97JwE6aNtjqN
	 lxk2Fa8oya7fWDWlfCO14wdf690mmuFouane/4DSqkt8p75P/KMJZhCccJTopSlPstSif
	 lAkTPufeR3AVnZ9oJPjq+plBjbUU5ZSTle5Jt1iOFRYEC4m/MjORlX2aRaFN22kGOlUbq
	 wD0hgDxi0GAOaVW/qPyO9wbctXv3TBmN4aqs9oDmcISCy/ZVMf5rf5tSoWGu7XwzNmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oqISismNDREzK3BapMQL3oVfFqMKLBzQ11G0pwa4rCw=;
	b=xyiH3rDSBN0dQTIBLxC7vHvqb31IpCcGQRHfYvEZ0hQTxbBqwhWsOZLYI9e8ULnMsgLD
	 aHneXYXV07dTRSDcE3MRGlCVPLIpRkQsba8sydgFXmhUW5syTL1qPdu8Uwug3cx/zUBGy
	 AaQBEiKWvNaoPXoK2yRZ0WQ8QooXFWcu4pilgK5m8EICxiAQ7JAB5Bk8l24s7q+/Zs4BG
	 5+s13bJVd65vmKMpfgFZuIA3Q30ZJWM3Fgp+/qJrnQZT75xGqV4chT4vJd4ChgZmg+D1V
	 WI0fIRT8mqlGQdBXvyX+fK5uUggVaN2uXHbYHAF0+gpJx0ZTsaGyFzLA80NcOczYiEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nene7tW5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286EC606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 286EC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nene7tW5
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so1521794a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794754478; cv=none;
        d=google.com; s=arc-20260327;
        b=Q5UYPsQOGb4rvdbQraNqC2M5ldbP3rj2y3YpjjWc6lWipGdUIQResrBW7crlh4Syij
         oarMCxtD0nij07DMdmby55SDxps+jxwQM5UtWMQw4rIuOO4k1EoylYO+fteyiIP5/HzX
         jbX/cA6xTZvmZqsydJ4NcESQ9HyDhigtbdcJMZpmmdY/nZsS3rtMPic+Kj2figaj5GGF
         feHeA7Q87R4PcLUeM3RTYd8Jm8Aa2UlLYyj3chcz4urKMSpBP8pzP4p7QRMvjCpXUB0J
         /T6kfucLKJS0Cq5hmKtbMKmUFxqxOEi/yb4/Bx9UA6wIdUQ12QTbeoNuyIXIKr6oNDNP
         dy1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqISismNDREzK3BapMQL3oVfFqMKLBzQ11G0pwa4rCw=;
        fh=KLEA1Qa9ElAeq6LNDCyReJYkECnjeoPXPn7ZjtsfooU=;
        b=DhTNe8vdu5Q0fnhlCnedigT6lGDogbxCuqSCHca5aZ5w7ObkfJd3eUrAMAxtsirpQ4
         rIn/4f2JfB/XypIzPbPM9l2Rh/Z1ONug7dHC6kww59DsSF01475z5lXu0aLpZa45kZ8+
         eBXcoUZ21u9V0RQnr7ButP/AHbbamup/llgiXRQSEjDxRRur9cKIvCOQVXQFybSzfPcU
         ENF/djVqqsIyR6oMcGtzE7fWjoDpqX8diCtEaD9atdrJHt2BEYyF9+YYNCpBBQXLPR8j
         Ew2ahveYUnpQiKoEcuc6RnNV3hdKQYx8oC8cOGBFLlgf9hdtk1XOZNUKulJejO0nZ6EX
         qPgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794754478; x=1795359278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqISismNDREzK3BapMQL3oVfFqMKLBzQ11G0pwa4rCw=;
        b=Nene7tW5gi/n28xM9GPcsrsbApaftwN+5VLijlNSUx682MtoFHHSTEvDl1z11fpu1X
         HvQApdaPQrGfQyiS3FbYQVWjhD4Evwt6P0rS5BC7bOQTZVXFLWaPO4OPsg6ddRko0o+q
         9oJBo3AXuMJZvhtMaEl5yxlnDv3/Y+/ZTOoPRzC8SnU76nRTNG9VsBQOFmcVN+eTzILI
         pLq9xeN6fA01RGoB9NuHnqix3fuxZlQryfHYntRw18u5V1gyWgLisGhonGsU8L2T6Lkf
         J6bkZRN93M/WAUT22qxzPXNMWojuGB568xJ5NJFT1QuthxcS4hfC3ctLRiOXitSCJ+gM
         bTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754478; x=1795359278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqISismNDREzK3BapMQL3oVfFqMKLBzQ11G0pwa4rCw=;
        b=GsDiL22/cWgUQOQ7S4XvNUItkXoYan49Q6kIMksL3DMYkSbXBEA+/8rTCGl5x9QSXc
         bm1Vp0c/UIV2CBIRTcQ8Zgo+PhYEijrD/uEw1JkqGIGBQ+LdQrauAef9n/OaWShy2YgM
         szsF+4TnnVZgH49mnsc7eZ95H5np7gIsvd4QUOayi8tjSkOIaKpTAUH8bqb/L6bcGiEV
         mtf0pqIKSTCScXgqjJm48RYLrKA/wFae/6BhacnEl6Sra2vD4kG56bwwQp4UEFjb+av2
         oBj5We58ShnXXCOAcbEVUX22ZbVj9IYDNOODUrF2gb/GhrZh1HZ+WJh9kYfNIEhTJUs/
         P7CA==
X-Forwarded-Encrypted: i=1; AL+hErEPH6DCZwm+7x/u0ddGHqa7u+FaM+8fBhd0dm5ISzxZQOdwR0e4yvKE32bL1cGv+QLc197QzPVloJGY6ic=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k6s8uedJF+TT1b7fLqWfpL2WaTnPrv9My8xMgZ4o+PeAHPig0
	bDA6k3kn/PGmtR0dhVR7gfS2Aka1YlTZnRSmTFXYbkuDwZrA1grc9XdjkiMBp3KBAWwEGmNxbIj
	ahGL2hGIpbVVapiYopQ0+tC/3X+QCT/uozFxCuIw=
X-Gm-Gg: AYBFou1+GqN8s6QRV7LDuRxALld8lAO28zBdzDt0zea4ICgbZ6X+/UKSfxdGEAX1lps
	hPw0kgXMkpzcIfTdMHA41R6rEFBHcL1aTJRcnEdxd2rJ6OFXjqIapmYdkszDDdmUGOvKBV7DHjp
	zN3N5CVRq8iuJn1LDK1VqF7ehZ1Qb7owIEh5mzp2oTqLPfRvUGENpTdmUGTQWdgUjkNdSWGu9cK
	UvBD9vKC1l/MZsdtTLuP2Uw/UvsQCapUrGJkVxFE/+dvBoe+sTQf7vFygfCL6fsmd3oZm+dOsvS
	Hml9KdINU8rEprcQjaNrn8WcLevVbXOc+rbPQLFgU8GlHkERbVhksF/Qdids0HX3bDAYKgZrT4k
	qqUUKUI/zkFkxYfx+5h6KmSfy7KvQ6FjaPm3ZFUKZfrePcIw3DEDczJMNZ3bmh0YHcHhe0A==
X-Received: by 2002:aa7:d1ca:0:b0:6b1:c2cd:db0c with SMTP id
 4fb4d7f45d1cf-6b7c0957c1emr4306146a12.10.1794754478075; Sun, 15 Nov 2026
 06:54:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-work-ovl-d_real-v1-0-ca155efbcb2e@kernel.org> <20261115-work-ovl-d_real-v1-1-ca155efbcb2e@kernel.org>
In-Reply-To: <20261115-work-ovl-d_real-v1-1-ca155efbcb2e@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 15:54:26 +0100
X-Gm-Features: AclHuK8KXHVL-duO-F-YZ8XPwW63n9hxew9z3khJWwo4KtxA0bTnHEz-HW4OPxU
Message-ID: <CAOQ4uxhkqQE+ONrcgJNw2Jah59bKruxUAsLohTtKnsgTVQBw-A@mail.gmail.com>
Subject: Re: [PATCH 01/13] ovl: don't warn when the lazy lowerdata lookup
 fails in ovl_d_real()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Chris Down <chris@chrisdown.name>, 
	Miklos Szeredi <mszeredi@redhat.com>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-mm@kvack.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 3:02=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> ovl_d_real() looks up the data of a metacopy file in a data-only layer
> itself if nothing has done that yet. If that lookup fails it WARN()s and
> returns the overlayfs dentry.
>
> Commit 42dd69ae1af4 ("ovl: implement lazy lookup of lowerdata in
> data-only layers") assumed that the file would be read before
> trace_uprobe places a uprobe on it so the data would be there already.
>
> But nothing actually guarantees that. trace_uprobe takes the path from
> kern_path() and calls d_real_inode() on it when the event is created and
> again when it is enabled. So a uprobe on a metacopy file whose redirect
> points at nothing warns twice:
>
>   ovl_d_real(/f, 0): real dentry not found
>   WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210, CPU#2: sh/27=
9
>   Call Trace:
>    <TASK>
>    __trace_uprobe_create+0x1869/0x25b0
>    trace_probe_create+0xcc/0xe0
>    dyn_event_create+0x46/0x70
>    create_or_delete_trace_uprobe+0x3c/0x70
>    trace_parse_run_command+0x1a6/0x320
>    vfs_write+0x1cd/0xfa0
>    ksys_write+0x116/0x250
>    do_syscall_64+0x10e/0x5e0
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
>    </TASK>
>
> bpf's uprobe_multi does the same.
>
> A failed lookup isn't a bug though. The data can be missing, its verity
> digest can be wrong or a signal can interrupt the wait for the inode
> lock. ovl_open() simply fails in that case and
> ovl_maybe_lookup_lowerdata() already warns ratelimited about failed
> lookups. So return the overlayfs dentry without warning. That's what the
> WARN() path returned anyway.
>
> Fixes: 42dd69ae1af4 ("ovl: implement lazy lookup of lowerdata in data-onl=
y layers")
> Fixes: 184996e92e86 ("ovl: Validate verity xattr when resolving lowerdata=
")

Nit: 42dd69ae1af4 came first and opened the possibility of goto bug
and then 184996e92e86 came later and depends on 42dd69ae1af4.
I don't really see the benefit from stable POV to name the later as Fixes

> Cc: stable@vger.kernel.org # v6.5+
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-214581@kernel.org
> Reported-by: Chris Down <chris@chrisdown.name>
> Closes: https://lore.kernel.org/all/20261114120557.4bc1eb6e57218cdc@chris=
down.name
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/overlayfs/super.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
> index 08695a99f4f93..1985b553a47b7 100644
> --- a/fs/overlayfs/super.c
> +++ b/fs/overlayfs/super.c
> @@ -58,15 +58,13 @@ static struct dentry *ovl_d_real(struct dentry *dentr=
y, enum d_real_type type)
>
>         /*
>          * Best effort lazy lookup of lowerdata for D_REAL_DATA case to r=
eturn
> -        * the real lowerdata dentry.  The only current caller of d_real(=
) with
> -        * D_REAL_DATA is d_real_inode() from trace_uprobe and this calle=
r is
> -        * likely going to be followed reading from the file, before plac=
ing
> -        * uprobes on offset within the file, so lowerdata should be avai=
lable
> -        * when setting the uprobe.
> +        * the real lowerdata dentry. Callers may ask for files that were=
 never
> +        * opened, e.g. for uprobes or O_PATH files, so the lookup can fa=
il
> +        * here. Return the overlayfs dentry then.
>          */
>         err =3D ovl_verify_lowerdata(dentry);
>         if (err)
> -               goto bug;
> +               return dentry;
>         lower =3D ovl_dentry_lowerdata(dentry);
>         if (!lower)
>                 goto bug;
>
> --
> 2.53.0
>
