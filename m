Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781878;
	b=VHRbreNOG/ftg29JYNeP2kVMo3YOms9VMxWO9DX5O+BT95JkqGbP9xYFyvPt4KxVjdVs
	 ttaZ+2aO+4FDI/Yo0v/wGfw3Lx0aba7Ybb+HCrtXi/XK05xaH2enV+qB6HrnaPZhX0YAS
	 zt/Vz6rfPFjHVxJGM5ljyAUHInSqkIFOiC40yXx4rrKkBtfxp+ChQvddKRLw0qsrKgAoM
	 UQC/aRlMKoopRxAUuPUnl3XN/w9ra4X9yIUx5O7V1drC2DYyQzuZ0M0MBIPk9Lkwo2bIb
	 aTwjaRbYVYFdqVExPCkv7wy5VaDEmvjlzTRMTxmLW+bylODUJAth8navsI67GI8wECA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781878;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=cxrCkQFSuOyT2sjaoiQVObpyFNJLzTlcWOT51iAX9JU=;
	b=ivHgG46CbN9hdoIYyHOpaaPQ1w55qQ/CeSZ95PYGwiE8qJjBYC1wPQcDoPGPL3Zb2jCo
	 lIGPK4I8dwgu8vS1L125Mk8hHljep3rGRKrs+4J7yrPj8ZPLDJ0FsUgdLtqDzBwGnbdcU
	 M6DxOPWJjxq83SBjPSeOGgUJ4T3mL4afMn4hfUga7cm2WHEK6pX7xeRN7zurNrV4RjCwu
	 WGmoyA4ygQtnJhhpe2+5PAj8D37nql01GdZPLaNxfr0p5sYfct92h08K261QhmNQIPi8b
	 FQiXcj1Z+55uh1keYiE5jgWLiSpFJtdcxylBlzaxaHuxkTBx/dyHj9xiLP3d+hxDCpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kYLOlPsd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C142606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kYLOlPsd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56EE1F000C1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793781877;
	bh=cxrCkQFSuOyT2sjaoiQVObpyFNJLzTlcWOT51iAX9JU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kYLOlPsduBjpIXnoNusXVF/cXOEOFqqKNv9+1VSUd4RD8x6bk5a1K8x8z2gGjc1VZ
	 cizbM0P0cK2PKYSVlgWcm/rp181SBKz5GnuM86soqg8vsDvhE7z3nbs2zADxdp9a5e
	 OwMvQQza7UO2zF2uhqdNpcdumUIExnKjfyKWozC+GFnsiPTwr0V1rPgAGTFL0/5c7/
	 ifnAu2Vxw75WJ/vsfEMRHheJ0yP+2R/ocsUoDU6SgmitE9pACSkwJwyF3wFlPb9QbX
	 2a1qxNkf+q1NIsYn8Avi6Lwn9v7mnEF7DZFgmkFD0+TYsinXc7d+DoqhH7/uZFrOjj
	 SlF4IzZLxEHxA==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c450ab1483cso65873766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:44:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzAdJ3vDFwSRnG/a4En0jTm4pPZn+m2thev4dqbNPOMRCPgOcwj6keZN58sxV99pENZWj0mOduxp3w8h7I=@vger.kernel.org
X-Gm-Message-State: APuU4Z97cg2YzYbbWmsc5BfchLV3BSpjt8+aIqD52V92DWB4WA+BCf5g
	1KLjh77YxsDwu9S3pqkBFjm5eN5ol4Ttb9Hb+d+OGjhOk/ips+U2XcsomMQZnuURtUcjqFHuRaK
	CL2vYvmCiVkjD7A4Ax3okVe3PL6Ax1Pw=
X-Received: by 2002:a17:907:fdcb:b0:c41:f29:72b1 with SMTP id
 a640c23a62f3a-c4ca7aeb21bmr1310103866b.47.1793781876535; Wed, 04 Nov 2026
 00:44:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103150458.11591-1-icb@fastmail.org>
In-Reply-To: <20261103150458.11591-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 4 Nov 2026 17:44:24 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9xNLn1Nk1QzD_Kep1TcgJmGNsT+UTg6Ed0DjjmRRW4+Q@mail.gmail.com>
X-Gm-Features: AclHuK-JcfuZ648DJ94l5sf55_9ZhNmAEUfsKztm_X1MvB-PgWT_Vi8TDrhO1D0
Message-ID: <CAKYAXd9xNLn1Nk1QzD_Kep1TcgJmGNsT+UTg6Ed0DjjmRRW4+Q@mail.gmail.com>
Subject: Re: [PATCH v3] ksmbd: grant a caller what its groups and OWNER RIGHTS
 ACEs allow
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Aamir Ahmed <elb12345@hotmail.co.uk>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> @@ -1531,7 +1557,12 @@ int smb_check_perm_dacl(struct ksmbd_conn *conn, const struct path *path,
>                 goto err_out;
>         }
>
> -       if (*pdaccess & FILE_MAXIMAL_ACCESS_LE) {
> +       /*
> +        * Evaluate the DACL in order (MS-DTYP 2.5.3.2). MAXIMUM_ALLOWED takes
> +        * its result, and so does a caller that only group or OWNER RIGHTS
> +        * ACEs name.
> +        */
> +       {
Please remove the redundant braces and unindent this block, as there
are no local declarations requiring a separate scope.
The rest looks good.
Thanks.

>                 ace = (struct smb_ace *)((char *)pdacl + sizeof(struct smb_acl));
>                 aces_size = pdacl_size - sizeof(struct smb_acl);
>                 for (i = 0; i < le16_to_cpu(pdacl->num_aces); i++) {
