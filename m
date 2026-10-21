Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792592046;
	b=ywZExWvjOOTk40E9IrGnFShBb7xu/+tGpz5HZA9NOcni+ixf4Laf1Pjd8ojFXKlDii+m
	 qg2TB4g210o0t3vtQ69WgQffoWVt4K9uwujkQOJ8ja80WYwvKuj7W017i+kOLqy+DAzZV
	 iSw92FiQKEpQc2MX5nrN9Sosy4B13+sr6J/L8mMAW0oLO6CiRiQg6uLU2fnG6rwvZPrG3
	 LqBRlGQ1/oJzvjk6HAyixgqdMiDjxMlc4HlRRgpkxNRGX80OHS421o8NEMjVWKevD2qJv
	 1juQR0D12kyq+WQW34qZGF3wLubay/lF6ynI+MYzhehClVTrslQQBreCiWrlxb3Tj4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UJ/A60pshTDV64EOc8/U0dsozGI6wHG2kt68wdBZvGk=;
	b=kL3N/ik/QeCFC/pYLnu7f3u2iP3XeBOAJEpeK+MYObBon5k4fwWnbVgEKiN0b6H/gT1F
	 TVpSQQuqJYiQ8/VzP+4pejzybpgD5rmNmeCDGqlghGIZAB6fzwkkgB6o8VxUxBOSWwmTU
	 Avb52LgVvaKcIXiDOROLOBUOY2gx5hEokNjefkvbVGC3JcfC5XaCG7FxhqhSU7MV/s7i1
	 N5TLx56Ciax9nRiGKtbzz49nOA6+/oOeefT1xK+xZmuDdKeLsqJ/GZhxW877XJHpLcTkv
	 SeXR56py6ZOyIRjDI8yccJvKbzBZlfonATgdyrbzjHi0FwbOqN7Sd3eJKRD13REgMVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="P5i/ZeyD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842A7606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 842A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P5i/ZeyD
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eac4855401so356672e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792592044; cv=none;
        d=google.com; s=arc-20260327;
        b=nUXiMg2r2zkD+/YuRx2OTggQ0Ru6L9BFSdN7qRy6lcYmQs75FPuqoVAu4EVPT3tWCS
         QeOehnfcPTzUpQNfNCn2+yTx+5aTNrX/ybaNDHMyVqgQhn3VDMWJMmO/ZiqDUzKMvBAW
         1KO+cjY4dkPImDS+JAYnxe6p08E2MkVYRHft9xRdYAPJV8HPS3ry+FqDC3LZljQK46ea
         KdgIPb+lPTlUHGQyU6zxFV2W4Qawlw/nWlJPVM1CaupFk8FHuzMwqqGxTLi2uRtukVo5
         hOXA5e+uDiIheRjvn6MR+LnHmV4KX9gAZLVPgywhLjqwEBCaoNALox+BbqLa11BmOXlK
         iXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UJ/A60pshTDV64EOc8/U0dsozGI6wHG2kt68wdBZvGk=;
        fh=G68rl8/nLHZFHEk3jhnQsiZ/2TYHewf+E4UCD3N5ens=;
        b=nlx+rCXkq3p5NXlkqhEpHPsoqQ+i4BBs1NaB4VQ/KdSZuOrwM9zFF9LF74GrrKC6R7
         MrKafCYAzGRIoa9KjmXuhpCyachhOCA8yg242BkIX9htorUSBIvil1ehMdepQCV74HGN
         vOSivwSOyvZXu5OaS/9oJ19ktSph0tN+JatLmTlnLl2mOBhlKm2uShLIChDvg41Hz12z
         XnDjmhr4NJns5+3gb2t6gSkFW/Q+TMtVmdzwUaC4m65jj3uozt75fGMzU8U8in4U2INl
         17U2SdoaM8YN+gtAPuzQdrBsZyjgr4O8912o72Cg2qJAZ5CL7rK1B/3sr0D5jYATNbgF
         oJxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592044; x=1793196844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UJ/A60pshTDV64EOc8/U0dsozGI6wHG2kt68wdBZvGk=;
        b=P5i/ZeyDVBkMIGuohnrHggiD4vso5z6e9mLwAvvqbmg+cZfeSijP9feo9Qf6rDuRXp
         yE7xHqSDNb0plAIhJWaSoLmsG9DZGbbb/JleA2EBPdBaDHp3wh1dG9pOwnkdcdRj9IN8
         XbO4rKntCjlm2Omf8PK8MgaxoHOrYKq9q9l9umfreEaTRiOK7FWi8O/KBGFQXg5jMVUU
         Ae9XbUO6K7OKbak/sOYq3aqvGuZ2rHWPfjtGFIyqlfFdhWZYF3SlTaatsDppaPHVBxc7
         gNQ6bF/72WNKa6B0C1ppZULgcMk88NNG5Af5kotLPdpjfSKAuXUC/8S/spHwWZC0jvqw
         8yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592044; x=1793196844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJ/A60pshTDV64EOc8/U0dsozGI6wHG2kt68wdBZvGk=;
        b=OzVzady0zRUNI0DXlh4axQXWUzvnfkLLKTqMnVD8B4UIbpDhmGqdDzV0lXLbOQ5LOG
         WCRsYpORE0oONxQy+uLANia6qyXgIzEGIjksInu6b1OW3sC0GdrsGl89MP4REED8UWjw
         8e4lw/LsPr1NmZdpNBdhJiOQc+cDkDfoH0NQ2S45BArygGHyWbIcSABV8Rnq7+amsP4n
         29YhYn8Hm3ry8WeN4yTVOQj4POWu3xhzvkGfFd9b+I2YngN36tCrBktZ0X6/NL9qbIwK
         vj6g8+X7UMGAydmBM2tyQho1NifyUfPCf45Yyb8qbm7R1MR6fEoGIKmWsjCcPmqcJJc+
         obAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO6cYJmAgoazjhpcd5IudsDInP/XI2JZbjHZ1UvW2T55u0uAjxbFCFiPivFZzj9MSKlZoXI/Fz889TeUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV89+pI0TbxqjecandNK9NwRp0JVmYbPtIQHjYCNYNifE16NNl
	j2lIkSUQtpWZ+dlXBOIRupy+spwAwCp0oJEsKJEbe5Py1vnJv0McMP2lQq0kYPDtpL+yo1VlMgP
	ERpgTqZi5GKZvFyBrciG3YCkxRL7h2sLZso3dg1yICA==
X-Gm-Gg: AYBFou0H6Ik9pZsYRMVJZ9+GYV+yXFYqSk41wxhtq8Iy1rjGH+ZRS1eIGtrnqJxoj4A
	YrAB7B9UfjaCEwLBq9UxnvvNe5yV+Zwtxo+o/IOpPaDvQVkjgfMSznBhcf0CCN5tDxcTowbpGSD
	6ny/jnGq52j+mFUZbOvyEWRh6Ja9zWW/aICcEX+xxdweE+MV7wM497+bXOXBp4dtPP1bLZK2V9k
	FgYOwcMmZySC0Dk/DYDyOkLxHegB0epJDBCh2nQH/ysZCNNPjzLrrIsLAmududJ9Ys2SgXrp/M9
	k4Zjzd6HCabGqFoy3djFmXJzPzl4aUtqOFSVkRzCCPuklzoVgb4UIgDjW8ndRxPK1hSxr0xi2Kf
	v/a1F/kRe2JweWThZyHK7lKPtSqllyYBh42TKuRAuH/1ZoGp+MEjQC0ei+LLf8YYQdoQM5Q==
X-Received: by 2002:a05:6102:3588:b0:7a1:f980:e93b with SMTP id
 ada2fe7eead31-7cc926b0bc6mr656524137.23.1792592044313; Wed, 21 Oct 2026
 07:14:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021115400.30885-1-mike.michalo@gmail.com>
In-Reply-To: <20261021115400.30885-1-mike.michalo@gmail.com>
From: mixalhs <mike.michalo@gmail.com>
Date: Wed, 21 Oct 2026 16:13:49 +0200
X-Gm-Features: AclHuK-nUd4UmTxE9F3RBMXljFNNhLJJZePwWHLxIeXwrSoZlz9LU3TXba0QmGI
Message-ID: <CAO+rqLj5rF8MGMTRSav1n43NqLbazwyuPsPKgiQT2qtP+EDxeQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: restore Kerberos logins with released ksmbd-tools
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The ksmbd-tools side is up as
https://github.com/cifsd-team/ksmbd-tools/pull/347

Michalis

On Wed, Oct 21, 2026 at 1:54=E2=80=AFPM Michail Andreas Michalopoulos
<mike.michalo@gmail.com> wrote:
>
> Commit a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets
> expire") added a __u64 session_expiry field to struct
> ksmbd_spnego_authen_response, growing it from 156 to 168 bytes.
> ipc_validate_msg() requires the response to have exactly that size, so
> the 156-byte response of every released ksmbd-tools, up to 3.5.7, is
> dropped and Kerberos session setup fails with STATUS_LOGON_FAILURE.
> The other way round, kernels without that commit, including the stable
> trees, drop the 168-byte response of current ksmbd-tools master, and
> ksmbd-tools has no way to tell which layout a kernel expects.
>
> Pass the expiry in the reserved area of the embedded struct
> ksmbd_login_response instead. ksmbd-tools releases with that area
> (3.4.4 and later) allocate the response zeroed and never write to it,
> so they send an expiry of 0, which ksmbd already treats as no expiry.
> The response is 156 bytes again, so it works with those releases, and
> every kernel also accepts a response that sets the expiry. Use two
> __u32 halves, as the reserved area is only 4-byte aligned.
>
> Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets ex=
pire")
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8x=
CgtA42XUkSsAeg@mail.gmail.com/
> Assisted-by: LLM
> Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
> ---
> The matching ksmbd-tools change (struct layout and mountd/worker.c)
> will follow as a pull request.
>
> Tested with a local MIT KDC and smbclient --use-kerberos=3Drequired:
>
>                     3.5.7      master     master + tools change
>   7.2               login OK   fails      login OK
>   7.3               fails      login OK   fails
>   7.3 + this patch  login OK   fails      login OK
>
> With this patch and the tools change, smbtorture smb2.session over
> Kerberos (including expire1n/1s/1e, expire2s/2e and expire_disconnect)
> and the 190 smbtorture tests run by the ksmbd CI over NTLM give the same
> results as 7.3 with ksmbd-tools master, with no kernel warnings. NTLM
> logins also work with 3.5.7. A test-only mountd that overrides the
> expiry (including values above 2^32), the response size and the length
> fields found no wrong session expiry and no kernel warnings in 313
> logins.
>
> Current ksmbd-tools master needs the tools change to work with this
> patch. If you'd rather the kernel also kept accepting the 168-byte
> layout, I can add that in a v2. Only tested with smbclient and
> smbtorture on x86_64.
>
>  fs/smb/server/auth.c          | 3 ++-
>  fs/smb/server/ksmbd_netlink.h | 5 +++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
> index 1b24eb3f3998..8e5a1b10db6a 100644
> --- a/fs/smb/server/auth.c
> +++ b/fs/smb/server/auth.c
> @@ -464,7 +464,8 @@ int ksmbd_krb5_authenticate(struct ksmbd_session *ses=
s, char *in_blob,
>         memcpy(out_blob, resp->payload + resp->session_key_len,
>                resp->spnego_blob_len);
>         *out_len =3D resp->spnego_blob_len;
> -       sess->kerberos_expiry =3D resp->session_expiry;
> +       sess->kerberos_expiry =3D (u64)resp->login_response.session_expir=
y_hi << 32 |
> +                               resp->login_response.session_expiry_lo;
>         retval =3D 0;
>  out:
>         kvfree_sensitive(resp, sizeof(*resp) + resp->session_key_len +
> diff --git a/fs/smb/server/ksmbd_netlink.h b/fs/smb/server/ksmbd_netlink.=
h
> index 2673522c76bc..fc6af757e45e 100644
> --- a/fs/smb/server/ksmbd_netlink.h
> +++ b/fs/smb/server/ksmbd_netlink.h
> @@ -148,7 +148,9 @@ struct ksmbd_login_response {
>         __u16   status;
>         __u16   hash_sz;                        /* hash size */
>         __s8    hash[KSMBD_REQ_MAX_HASH_SZ];    /* password hash */
> -       __u32   reserved[16];                   /* Reserved room */
> +       __u32   session_expiry_lo;      /* Kerberos ticket expiry, SPNEGO=
 only */
> +       __u32   session_expiry_hi;
> +       __u32   reserved[14];                   /* Reserved room */
>  };
>
>  /*
> @@ -286,7 +288,6 @@ struct ksmbd_spnego_authen_response {
>                                   * stored in SecurityBuffer of SMB2 SESS=
ION
>                                   * SETUP response
>                                   */
> -       __u64   session_expiry; /* Kerberos ticket expiry time */
>         __u8    payload[]; /* session key + AP_REP */
>  };
>
> --
> 2.56.0
>
