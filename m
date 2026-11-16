Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825151;
	b=2Yb6InCTNlg3zTL7NgwYyz5B/bc2yJ93ltueMp+nS880nVV2hn6bohXE95026Me8S37U
	 HlOX9Fi1PkO/4u77risZjpeThB4xJ/fGBcbSZ22J6kh/0X4eXXa59UQT7n+H9/tM1e2eS
	 PS/UlQZwg70MZf1ZtC5t/FuBXuqvAs98QYyI5YUWUtchB+vqnXkOY/oC1gsFe9OAlRYCp
	 9xSuporaRhajjY7RO04mCH+NaM1DPBWnuKkZMJFzaF3frH3rI71G3e+GHZaDCd02WMMaQ
	 yumdreZD9BGCyjtxYWZ9DHo7MqdyCFpjtHD4iEG+bm42n8d2nmAgZIhtldyvaX1xk6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0YW8PA+wzviZIV7gLvSi7w98vAeEHHR/1zk731Y72iw=;
	b=XQxPeIfpFcB4RZGjV79F35DhuBDX5Ugu2tF69ilP6va8VP/0PanBs5Kgd15uvedzUU7H
	 xPyqTiRiZKkNTPY9lG3lDcoHPp8rZC4xr/Gd11MMWrGkopClzIxXSodHa3SSGqXwk7Qy4
	 JpXI8pzfabT9EPlIe/nsLQBK8RGDBFvp5HPz44uiX3IgMqO4YH4wPe3eGyTEayezVc5uD
	 AN4/B2nZK+CeNsCU+QAMjOXgTxJ9KQMplVPfDuEwSj73BKQv8CKUWkn8MsRiA2oCQ100l
	 MP/E6Jz3+BRUEgx0i40dwlhwq3aRHqt7H24EeP0bPojG4oVfr9Yae7In7F3V/KyEPgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vx02WRbu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59574606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59574606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vx02WRbu
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b7ddb99db4so2168990a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825150; cv=none;
        d=google.com; s=arc-20260327;
        b=hvEINEsASDn9/gNZ7rYiALFlDnsVtcjKoc3JoM9UMOAZsX36zCwaLu2ZasdsLt+kkn
         zBhpsDNhO8YiFwKBqYat+F/r6wt0LgLFCI8a2Iz500l9lILJiTM7ea8h8oQXdMWMGsNT
         E0DVRqX6MbYfqWX9FPqavbsOWXi4yjbmg6NjRzjeY1FZfFQoSkh/3lkq7H5llaZc/D29
         oZj2l8VlX5RGEbdblwZZzKNdNBKyUwI3KBwC4hBHQiaex5jBKa8C6MzKml72G7dIUqeg
         bgOIbLwx+EiefSPPpVjsqZDKldmPk4sSsVJv1L9mNWVpTfPoYA0YXIZAPO1ibz43gBCv
         r7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0YW8PA+wzviZIV7gLvSi7w98vAeEHHR/1zk731Y72iw=;
        fh=2u64S8e3VqZO55gxs003kswmpCqrbAMHPjksJhP4+NY=;
        b=YbDIAXHF9pcrEe+dUtgdUnNRzszt6RCU36P1vAIzGuACjuVOOUahc3FJ7qAzGUnLMe
         eAFPcuoRHnh/ZiU2SaowGHnubcHnZQT/wFtw1S7NlS74VFV/M6R3YRyWHkVKGUCv8uV8
         3U5m7Xp3lXQkrgmFCUpg/LUvG583RvkCWiGswcDpq/RZ0ar0k6VVHBQaunXLuCk2mdJk
         bs2c8ZgefS4ZYblF5APMgAhwrSFMfg2LIiffM8GXr8nqbuBe4GQe5E8SqXHTzY8+fxbi
         x6G3rqzi98oDTvsK/WcDHwQWljSZ2A5qgkn58ipiXUFzfdPeNqZijEvmnEuUbY3Ky9+N
         L+vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825150; x=1795429950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0YW8PA+wzviZIV7gLvSi7w98vAeEHHR/1zk731Y72iw=;
        b=vx02WRbuy3m6IuoTmZLjbXEH1SVf/+s2e5NYMP8zLIkFB7TDuM6FN77vlgdxymLlm7
         7GxcqalTg78KplnStO5kUr72C32hXL+t09BYxJ8ovOh5oqhyNx4iSVbeNwcBqRTR9yS5
         cBqGMAsFjR3s+grQoLxemWsbgtL2IkczGUUizL9DjmxiUAGGEWoZgF4vC4xcKDDWry10
         Em0NZ93TUoj4HGlvAS+ffvhR4v9we+WvcUTf9usRaSJNiE2Qk+VB4XlDBb5gX62pUHEj
         vtUOTc/E1vyTbCYb2PH0vA6MlhPqaCmjuVELDgD5prTge3q2muHag2AnKU0420jXFrPG
         MniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825150; x=1795429950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YW8PA+wzviZIV7gLvSi7w98vAeEHHR/1zk731Y72iw=;
        b=iCwYh5kikGofkr8DfhnnDsvX7IO2JIHvg3Cxh1IMMAPv/USLMHxi+VKDla0tobrzWQ
         VuHBqX8oWAgIDvZJyT7NdFO+ta1Ad4m7NR+4PG97/j8YGQwLI/tKH7VYAg6AKJm6e8dv
         UBQ82RALgICh0sFUVXXzNn/4hH4qRSnj9ptJLohximGvwSGXMsAH1I90IJ+gQXnviqCE
         UDL9w9AJvcRdRoQ59RmX4FvRCQYQE8CrHIeL81VKGEmOqxT8sbEaobzBB8kKxPXFT28I
         eZTlSnGu64+WnJnmb/9hX8ar3UJCC68QA/O4qvaKXQI7nb8ZKgfu1kWUcNSU3HtoBo/I
         3xhQ==
X-Forwarded-Encrypted: i=1; AL+hErEAXt9lKQ4qw1Bd31JlVyz/v8fQduPv/gITGq1dgYUtYbxA3LDn7quAhdTtSTzK9pbtO27Zfx4kiaZh/+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i9EF2yKXSCIymbEGx8E/FvK/F3XwgbrQLfv2ONF9wRqoiLKgX
	SRMCUQUNg/A2aS+hCROsB+rWJ17pp1wc0atWOwUO2/n1G2GvtchpJiFDr42qIlWOC+i1oxSKonB
	XQg4v/1AveHZYhyXi7xQYKynMnPDf+dE=
X-Gm-Gg: AYBFou1qwRmH+hbaH1/tITNuxRaJ1saiThFv35TMsNzJ4m+DsIf2sZq+EPxsoY5tQdD
	g0yDZ6FFS4J5Nm3wcA6vwDrnQ9Csys/XU5U/gtWi0FK/lVrme/TFpZZsl7HW1vKqkoZ+Mjv8kfx
	DZIPM9yr/sEUDV42Xb4k8lpY0qR3gQOqW4bUWcN0P7pvZ1GoPunPTPRFfOsmsh5UZyUevcDW/5m
	iz/4Gzk6ZOAJl5gvYn3E5whpVpUJ8hvG5ODfxsnJvOFoBvtNi1+vjkc9DF9n2EiBiDiDz6g+om/
	Ghlz23PhKWu3cplqEue6p94HoQdA0L4+WxbC8jlQscepcPz20je2u/eq5JH90tCe7iuD0337CXi
	w6KLTtfojBhSCkTNSzuP595uXnKyJEC+9NkP0FZtAveeqdF46bAlMC90u4vuKmmvDlcR4uQ==
X-Received: by 2002:a05:6402:a514:10b0:6ac:9a44:d3ed with SMTP id
 4fb4d7f45d1cf-6b7c08954bbmr4966094a12.5.1794825149341; Mon, 16 Nov 2026
 02:32:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com> <20261115210952.2140036-3-graypanda.inzag@gmail.com>
In-Reply-To: <20261115210952.2140036-3-graypanda.inzag@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 11:32:17 +0100
X-Gm-Features: AclHuK8XXyhaCAgxTbITMp8zV3Fd6NqncgeiQCT2joxj7Z8uLLH7t09QB68vJSg
Message-ID: <CAOQ4uxhR=ERNBYsxQ06-sKGrTXvePpzv-xi+62oceNff6Mzzbw@mail.gmail.com>
Subject: Re: [PATCH 2/3] inotify: zero-pad event names after an embedded NUL
To: Junyoung Jang <graypanda.inzag@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:10=E2=80=AFPM Junyoung Jang
<graypanda.inzag@gmail.com> wrote:
>
> inotify_handle_inode_event() allocates the variable-length event with
> kmalloc() without zeroing the name buffer, sets event->name_len to
> name->len, and copies name->name with strscpy().
>
> If a dentry qstr contains an embedded NUL byte (for example, via a
> crafted FUSE READDIRPLUS entry aliasing an open directory), strscpy()
> stops at the first NUL while event->name_len still covers the trailing
> bytes. copy_event_to_user() then copies event->name_len bytes to
> userspace, leaking uninitialized slab memory from the tail of the
> event allocation.
>
> This mismatch dates back to
> commit ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"=
),
> which replaced strlen(file_name->name) with file_name->len, and remained
> in commit b8f2688258f8 ("inotify: Use strscpy() for event->name copies").
>
> Switch to strscpy_pad() so any trailing bytes up to event->name_len + 1
> are zeroed.
>
> Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"=
)
> Cc: stable@vger.kernel.org
> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> ---
>  fs/notify/inotify/inotify_fsnotify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/ino=
tify_fsnotify.c
> index 6e3af6452dcc..78eb1e92a14c 100644
> --- a/fs/notify/inotify/inotify_fsnotify.c
> +++ b/fs/notify/inotify/inotify_fsnotify.c
> @@ -121,7 +121,7 @@ int inotify_handle_inode_event(struct fsnotify_mark *=
inode_mark, u32 mask,
>         event->sync_cookie =3D cookie;
>         event->name_len =3D len;
>         if (len)
> -               strscpy(event->name, name->name, event->name_len + 1);
> +               strscpy_pad(event->name, name->name, event->name_len + 1)=
;
>

I am not sure it is inotify/fanotify responsibility to hide awkward names
which filesystem emits.

First of all, I think the solution should be consistent with d_path(), so m=
emcpy
instead of strcpy here may be enough to avoid leaking uninit memory.

If we want to be nicer to userspace, then we could for example pad the
garbage bytes with "???" for here and for d_path(), but I don't think
this is worth the effort and also don't think that hiding the fs flaky name
with strscpy_pad() is the best way to go.

Thanks,
Amir.
