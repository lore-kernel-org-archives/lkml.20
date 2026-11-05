Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793915605;
	b=pQqach51bmWH/3AmviuBAnDJQe6aT6jLc+W6UqkNmRNbapKOa9p6lsvccnIGAr2ULw0Z
	 Tg+UX4IeW055gYnyQ/8zG55p2vQdcmLtOuhYfyIDnD7ajlPoc/WNHQIUQ2vXy+asZa4Xp
	 EiEMKDMlVXPovbiCwxXExMv8wtuJcyqPaScm0mJK5mdV1JvLIceq1vqA2Zj1hooEXWzjv
	 46cSDVQDP7KQdGin857Wjq4i2iWn0AftuiWSSCs/R3+yz0nxBuwN7GRXHdCtYQ8S0ivwz
	 mqKHtlKzarAo90KZCtqJBMzNYHfRG4U7ezVs1A0poMcGN62/i2OY3G7NcW9uJ/mZ8JA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T1Goy7xxYTpLl6iI5Cf/SMnYKLYp7F0i7eE5R2yNQC8=;
	b=iPaCHqgv/XfKVXbITaWO/vNjjygDYHc1DpAq7CXX2GbdgmsRNU3+QZtsY0Kh1YE1hcvT
	 OYLq9LucHyyYZ6O22mxnBuQUojuNbRpY2+sYEZsgRvg78cGL6ZYu94VgQ+s4thdwyrSMK
	 zOp0Okh43WvZDhfmUr1Sg/puAa0W64wjEhwah/YTZYir/MTPgNS9Jk8H8VufWYQdxe/br
	 YYU5U+u2XI/1KLtVffssLvwiQjUsqfpC+NTBapDe/tKA5rWUkrJqiwo7lylhQcoss7qbf
	 lu4itrv7YnA67GhpQOuXvUIQHPDf8T/CXl9ssJ55QpWeLJaXsmmN0CzTPb1ThjTJNQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BvKY6e2X;
	arc=fail smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C6F606D831
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C6F606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BvKY6e2X
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ed3f563739so17125ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793915604; cv=none;
        d=google.com; s=arc-20260327;
        b=eQgcgDpkeyGRCi8ccLieep2LKjO6lZr33YfS8Exj4yIJTCEUKam7KDQbXRVkfzLr4P
         HwR07YO8BorK4rbl2+Fxh+oHfr6UfhkEsKeenWchYpO4obv9kVda9nrn+Nn81HK5f+SW
         6Py5K0nJBCJ89NZKWhT3dQ34oLJdOr03UvA79e2dHjc+ZheycP3OzVj7TrHGd/Pq7oni
         xc4DTZpCDRp3J0Bj3hq0BUFVTB2vyiNA9JHQ6kddZwpHYWz+5+VRRQl0dgjMJeWwr8e3
         47wCITCfAJkmG6fAoXhItGRs06gACyqfYsrsSIiVcXWfoEvPYWf2yQhC4r4z40gP6I+V
         8Lfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T1Goy7xxYTpLl6iI5Cf/SMnYKLYp7F0i7eE5R2yNQC8=;
        fh=i4oUNFoFZU/7hJhthxG7yeGtakLbokoeeOh9Rz4jSfY=;
        b=raiJiBaL1Ire1pz09JmTn4KplzJvsB2LkZBLEAABEUufm1CS0H2ZEFNDdKTepQoWX5
         PbDJ97FSGPa12lLSSM0zL744kW5N3ZbfppOVCB6SwmvmrxsCMC/saZWj8+vtkCPUNZaf
         KEfraO4qdXLtI1eSFxoZjnLR7HioYv3bA9rTlDvWNFiF/u3MmhQ9niqhhce8VAaVHsQL
         38si/OYN1gfLuPUnsYZORJ+W0otS5mn2hN/v/7HdVFiJeRCNph70yYa7UPQrfLEwnLil
         /CthY3eW31Q1noz7kYr+Dz0zbteriMXdA14o18fma8igefMR45t332RA2jS8J4qJbe9O
         3EBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793915604; x=1794520404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1Goy7xxYTpLl6iI5Cf/SMnYKLYp7F0i7eE5R2yNQC8=;
        b=BvKY6e2Xp6Ln5F/x7uNfqdzKgtfxq1IkJFx3pmCOe8AAZ8lEZ/Vyof2i0EbXWI2Kev
         o0vJTBuh5IlEZrN+FoMHcWBASIlx70c9/Adv6yKBmkGLu8NvECmBYo5BWv+20zsjaZTP
         BTJWvsdkA+A89jdxh3/XR6JKPs2jlvstBhYvKqkg694XZwu0UlHnD2bZPsyJlMu/FqI2
         5rVfmYKb5EK8qZa8eRjwlef2Q/zF4LV+SdOUFeg/3SfNdSqzrjKqO+STiWOuSDJ+5YbJ
         mpmnN23JttD9xkcrQy5mN+cuuJMA0UZNHbYctSe8k729RY9Dj4GCfWEXEAue11TzHaPK
         /Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915604; x=1794520404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1Goy7xxYTpLl6iI5Cf/SMnYKLYp7F0i7eE5R2yNQC8=;
        b=XpK2JIgMSevK6mCHdRbz3zfDNO4LPB+jFxnYw9lJakD/KheIoVzQDUHEzUZ+gB9zVD
         qh9Uzut/YfnG9E8tNJ9KGXgvDLwYF9kvCzfQEwBd8wkBiwpyIqroTQjwVQcGBgbFTIB1
         VnVhyhlarKE8c1yCKHwoEaNLbO18qxy9S+DrZUYxaORn8lfXDnI1jDJezSq6oV0V/UcA
         Clyx5TPjhW7MnFv29AFJaM+dNx9FLpMggSniz0vr5kZIezIKm4X8WS8DVJk9HJaLDJ/y
         JpZbmrbh96d4IdrJVDpHkSrwx4csrLEcQC5mQKLlNhDV/eNRs8kK/wnoCCxB6ZI1wfBb
         BiwQ==
X-Forwarded-Encrypted: i=1; AKwUvByYYsBTBwTZ7q7ndGzADH2pSUZE2Q1pF9QTQ1dL937dQHXKSF8T+Ut2/PzcA2CIc9Yl8Vq715MWvK3M2k4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1kE6QtDTyom+aELgSmU/e86xNasn3QTIn60Zmwm5RQE85P0Yq
	hpcUOWfyFW/LrOQOexPbN/I31kgi9Ne9nUb0jssWjVzfXMB4UcLdOH0EvgprByBUBEQ0WLMLXU6
	cA0z30wnVM4aJ2k2SxMKdC3MpATtKtSDPc8nMiWOO
X-Gm-Gg: AYBFou3UNOzOq95DhAbKd+zvBEjzg5M6W5CUVsaHgim5LmB8r9LgjGAW/VZmzz8fpq4
	zy3nHCfw2GtxI4I++h7TlIyKH9hKPqwyUWYGyf/uEcGji2enE41ITaElJQesaIc4eiVfkk3wcfd
	W5midIuQtyeeqFICZFyVFqF+iMq5zspeDdxGAmN1Pk9yzuQZ8elXNmOQYZS8LEYo4/37p+goM/H
	slR9pgLeYUidY9MECk4As/Dc2V/wsPUvKp/Vp9SFNjgdUT0X6RNCWW6apkIyW3HrbXFQ/KYGlwR
	3WdXx5FoaDvGYvDNthvieTAb6PwDzODRJh8awjPaQaTiyLHX0R+uJoZXC6jbZyuz/JdOVKCIfsZ
	TgVBr7xEJBM0BQbijcly67kkmeR/7BregAd2vwM6XhUtSae1O/40lQVjmVQJuW8VMWvuhNJKKlw
	jq3qCM13qDBq9o11J/LjsYTQ==
X-Received: by 2002:a17:903:2984:b0:2ea:1fa0:8068 with SMTP id
 d9443c01a7336-2ed45dc8242mr607525ad.16.1793915603342; Thu, 05 Nov 2026
 13:53:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-22-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-22-245e54e87116@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Nov 2026 22:52:46 +0100
X-Gm-Features: AclHuK--g15JMQpiUrOd3ScDdiWIvqDdktQBZHdY7lnmUTwptYJN0x-mP6LviEE
Message-ID: <CAG48ez0CTxGiZ-q73k8bNhoBTW7xZfWwARCKmmM-WKr6GNBbeQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 22/26] ALSA: info: let procfs own the seq_file
 of text entries
To: Christian Brauner <brauner@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, 
	linux-fsdevel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:47=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> Declare the show function and let procfs open and free the seq_file.
> ->proc_open() only sets up the private data and preallocates the buffer
> now and ->proc_release() no longer releases the seq_file. Reading an
> entry then no longer holds up its removal when the card goes away.
[...]
> +                       goto error;
> +       }
> +       m->private =3D data;
>         return 0;
>
>   error:
> @@ -387,7 +388,6 @@ static int snd_info_text_entry_release(struct inode *=
inode, struct file *file)
>         if (data->wbuffer && entry->c.text.write)
>                 entry->c.text.write(entry, data->wbuffer);
>
> -       single_release(inode, file);
>         kfree(data->rbuffer);
>         if (data->wbuffer) {
>                 kvfree(data->wbuffer->buffer);
> @@ -401,11 +401,10 @@ static int snd_info_text_entry_release(struct inode=
 *inode, struct file *file)
>
>  static const struct proc_ops snd_info_text_entry_ops =3D
>  {
> +       .proc_show      =3D snd_info_seq_show,
>         .proc_open      =3D snd_info_text_entry_open,
>         .proc_release   =3D snd_info_text_entry_release,
>         .proc_write     =3D snd_info_text_entry_write,
> -       .proc_lseek     =3D seq_lseek,
> -       .proc_read      =3D seq_read,
>  };

Is this safe? Looking at the work.procfs.cleanup tree, the
proc_release handler (snd_info_text_entry_release()) can call
`entry->c.text.write(entry, data->wbuffer)`, and the only kind of
reference dropped by snd_info_text_entry_release() is a module
reference.

I think the entry could concurrently get freed by snd_info_free_entry()?
