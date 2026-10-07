Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A531218E025
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384703; cv=none; b=FZIpoFzDCpnVUrIayYeNKCcKLZuNlQ2k0kxF1tboQaYyHKIwPfxQl9AL6wYvNgadb8Y2+LDPxOcA95qvTUd6zYwp9qKU3igm+2MEadJOXtPPenW+9mAmziPr4ib9f/Vbi2W/nUjjFuZVrNJ5PuRXazVL8w4VRj7mM0dRTeaKuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384703; c=relaxed/simple;
	bh=64sH55gGEwMY+Fw2KXIImqn0GDwpwS7PI7uWlPJf1Zc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWOizQYP3sTTWIt9CanYhHn4yzKFgTken4hbWkTow8qlPjWn+3KCjHlcHpsbAFqacKsTvKYZ2aUEghyvOLIRzBpUg98+TZFfG6FvnI87Ccm3iw0FetWYQyRVHxYtxkG5YAg4GG7xqwnZ/xkBQyvBgq+EBQl2+wsYoaMaQDMQC54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWHIwmCB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWHIwmCB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8D61F0089C
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791384694;
	bh=dq7PEjyV2HZQoJ2a7ZdJJNJjZ4wuz8neRmWl6VRJ6QI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bWHIwmCBNQ5XAF7T4M3OSYYT4dHBLDuruLb5jv1h+NJBpbhPsb0VeEOrZgmIF9MvU
	 vTsoUKnYBJPU0rdhbf1IoDsYP5Buci8kf/QupsIciR4wWwjwg/OcpfkhM/IASbbk33
	 v+hST5EVirD4bsbsreM/5xMZBy+5sn2nGk/1EMhH/LdjwlEhUDJ8D257ZzeOxkwp99
	 a4VIRVew7EeXovW1h/pMbXmohJTvGVhmYBHXm1ezzPPz6LY6mkOJEWbAct6HxHlGTo
	 4OI9PWrFKN/DH67CVBnDMJZmUlMD/YxHLQvnXFZHiD7Sv+ia37rk6WPCRV8Zhm+47G
	 IKnSIjRzenK9g==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2a832c6554so293497866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 07:51:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxH/+ZK36xKlFii3tfSDpnvCJZeKQ3YSw67GJASKhpHQgWFQx/tih/jcaqhhTpf25AycN2+OqgP6D1bVXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfDOFD28+X5bKxAff0tiYtDkt3c5IzAzMk8Ibh/oqmEe/NqOFA
	hZCHt990/PRz9WijiGsxhczo92C6T07aAM5q75+i/XWnOYMDMhwtBiXxeOkXqqV66hpjeuNo9DL
	7KxPDKDBP1eHN+ZRsXlFXW0ySYmm9mEk=
X-Received: by 2002:a17:907:c1f:b0:c2a:f1f5:51ef with SMTP id
 a640c23a62f3a-c317bf5fd97mr245414766b.20.1791384692658; Wed, 07 Oct 2026
 07:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007074444.84875-1-tjdqudcks0424@naver.com>
In-Reply-To: <20261007074444.84875-1-tjdqudcks0424@naver.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 7 Oct 2026 23:51:19 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9sNGp8G8N0D=4a_SX89L7zGGGcH_kN0r7WUhvur=fc=g@mail.gmail.com>
X-Gm-Features: AclHuK_bkq-JfZGVCFr8SYhVctpq1iWXVLnpTj4qGEFOmeQKJ5bY589IIitve58
Message-ID: <CAKYAXd9sNGp8G8N0D=4a_SX89L7zGGGcH_kN0r7WUhvur=fc=g@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: validate share path for batch oplock reconnects
To: Sung Byeongchan <tjdqudcks0424@naver.com>
Cc: ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -2489,9 +2489,10 @@ int smb2_check_durable_oplock(struct ksmbd_conn *conn,
>                 if (opinfo->level != SMB2_OPLOCK_LEVEL_BATCH) {
>                         pr_err("oplock level is not equal to SMB2_OPLOCK_LEVEL_BATCH\n");
>                         ret = -EBADF;
> +                       goto out;
>                 }
>
> -               goto out;
> +               goto validate_name;
SMB specification(MS-SMB2) explicitly skip path name validation. The
filename mismatch check applies only to lease-based opens
(opinfo->is_lease in ksmbd). This violates the reconnect semantics.

>         }
>
>         if (memcmp(conn->ClientGUID, fp->client_guid,
> @@ -2528,6 +2529,7 @@ int smb2_check_durable_oplock(struct ksmbd_conn *conn,
>                 goto out;
>         }
>
> +validate_name:
>         if (!ksmbd_inode_pending_delete(fp))
>                 ret = ksmbd_validate_name_reconnect(share, fp, name);
>  out:
> --
> 2.43.0
>
