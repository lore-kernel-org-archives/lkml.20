Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652996;
	b=QyppUD859gFf5Y1j8TngewqdrmHeCk7m/LFb0b+CPBwbRDwYOT1MyPitxW2F8jwTBUIP
	 IczUGti6xbpbBMRzFoiZv5BzJVF1JO4Xi+UAcutH8Ifc+uus2reJVX5WXphbGtW/mMoFF
	 iC1g9RYoesJsMu1oCcLKvGT4Y54el4rPeMZcVyFVJ1xZM+6gD8oHCaNdjdnWJZJ/BGcYW
	 KdXaQ4GfpHCrZhcvNSy8NmLXQKbuWjGa9+j9vzo3YGzWuI15ZKuTMKvorqlQpfaXtC4bd
	 cnzf8IJKr7rjhSBGxwIrp5Gkp/GprdYUdvoVDKGjA6citNnRzYVTvyQ4UC8qkfayKUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MuZG+yo1i9wq00dPRZWOVqgpb9Tqvqe/v2iOsNIIXZQ=;
	b=ZU3XZ6E7QRsPBnag5C0i34C/QX9ur/EArUbHQLaF9iTvxEjf6xA/HP4NmWYtf+KeGiVH
	 rXL9nGLydL4bs/BVhDauVdusoK1yqOx/BYDAzE/FgMC00zX0At5wrFoFLn5L3ONtQfGKg
	 oYv36QxoWIExqSPfUQBvBEY6nvQHQopNBXRf1Z1Apfs6C4WyIj6/+pHzk5yPMoRVqIAs9
	 upfmQW5ROdDtKvSlUKfh9+x7tTITB4FgcpWZjF7T5tmzq3j+ZB0kt2zTjfLHXX3PHpWBm
	 E9tOqtQURuPQSUS2l269vQxfgVISR6cRpYJkmcKKrbZHP3qPJ8brrY+7tWNwWX5oVGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYkvJHXS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF07E606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF07E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hYkvJHXS
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so2724367e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652995; cv=none;
        d=google.com; s=arc-20260327;
        b=oVGgUj41lrFsLKGNSteION0PjRE5jWC2QWLQbs3x8thz2Al/AuXH4iwInZM0oskMcm
         GraSrp1AoTfTV2mGXG5lxCXrsHN7JkPjgn6HJSn4I6zIQCaOWR/dROwO7degvsuIvSTp
         M4FQsMvHWxIYiZW0aACCnbn4/xDVXPxmnksRd3mSRDlJnR86gOzfxJ71Z2PnRz4EPrI3
         dC2ajTPvrxGoaEsgWYu0VldKZsW3nyU+Q4EGGsgOOP1o5CMkoFjHIwhja64C6DPJkdED
         NBtT3/lZ9VmOdPt0WybH3z05fvMg6CWgdPRvcd9oaemPjcs0UDwRmtwj/Fie3IN3ZOHe
         2wMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MuZG+yo1i9wq00dPRZWOVqgpb9Tqvqe/v2iOsNIIXZQ=;
        fh=vrIfZ1OeunbNxOX4kAz4Rms6QdvOM9NM0Iy884UTr7o=;
        b=aqztmcq/9ip+PKblAwkJ8AD6ipbsFQxmLobdRgWykKoDyYPg+hfLkS0HAeWkw+Xrcs
         EneflGaJhmzhf7OLCYdKxYWEtfFDAXeg0DU5uqE1SfW5pn5F+wCdHxLdt/9qQBKMV2Kw
         u+U8JGc0f0jy6xV2OcGTUGYKwAf5OxcxY/5UwqYqh06KIANqu9Ez6nc0KBJ/BUI+wI4K
         XqLENyZL6c0NBSth+KmpX7XRRCsNZe2ahx9/JAyvBM1IKzgAu3prtqc18XMF0oZO8mOs
         eekGYqeEyx0HKhBPIjbzEUbXlPU+sDSJjPZYFNmpDQsOdwZfV6zo0UtjAM37XcuvLAeI
         auQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793652995; x=1794257795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MuZG+yo1i9wq00dPRZWOVqgpb9Tqvqe/v2iOsNIIXZQ=;
        b=hYkvJHXSoV5q6y8O9WYhV8I2DU4cdS7icGibkw7QpcnRH5M299xUqxmd7OUI/m9w2v
         jqoghhwx3vDfBtv+ksWLV3mnqF09DW/NiM7u1LXK215PzfRRyeFSUKAuCktx8I5hiA+s
         ut8k3BKq8oYRMleYsFT1Gh1wmidLIi+vWt51OYE8Oadx6vLC0PpUidomacJ0XhMbWP7c
         aH30buZ1YVrqVvKQuGCcyzkVeCIbcXGod5KsFY9yaRDnfaD9axP+EMXq3kA/nN0OuvKE
         IvEfygIpM4qH58XfXEMJ1baQ1mddYFsL9GpWCB+PfBRcdMfjf2tiXOsDfOln+zeoeGN7
         GvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652995; x=1794257795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuZG+yo1i9wq00dPRZWOVqgpb9Tqvqe/v2iOsNIIXZQ=;
        b=ajQgem8PBUdpYDzoUTvyTfm6pJQvQOW+72zg7pKAmlKeIHcRUF85Tqc880x02vU7QU
         lnt+FesM+KuvGEhmHR0a7RRDFVJXtCfJGzTjtcIen1tbzEDHZ37wifQ7leTXf8bPUVnH
         izgtQKfNkj1JHF8FtHTzeIUVqFGl/qc2APF0NovuBQONvAEW3n4JV5SxQsNfud0VUMY7
         8MwoRE59BZF7pjY7/L+SsJJ9qW4ARJLmWb8QcGrrT6UFX5xKiUzuJzs7Dafc3DM0uuKd
         /+v0C8jRL2JPS7E8SJDXHExABXdPWQCzTs8teIqijsdV1GkBXUr4a/1wgt4uLW/skTKj
         IIxQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1xmARyVql7wyyybDbxJJZQmA2oLgKvQjiRloa2d6KYRi4k9JI7PLhcozC3ikCVzqt3W6x6UMaLXmrA/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eSK0v7POnGC8+nCEiOtodNV4vAmfUka8uw0JO3hWH5XZV8GyL
	dWZLp9P7pugydcABIlJ1RhtkYJ5IT+ezXmoyVA8GLZsXOI0lAzl5o8CddolbPiKmeTF4IfqUJNt
	TCMBhwD59pkS4booyUbU9tRVYwhqv7nM=
X-Gm-Gg: AYBFou3xVdasGg2eM492efNzvmhheLzAQRcb94jcP2DtLq5i5SYwMtqrKi+aMgLQxH8
	zV2x0TjtS4rR4NNkmbZ/9660ZvS9oGHf2MPCX1GN09kzhOAaXrrU7qu3rx7rHohtA82Gc5Uc99F
	9TEa+2DeYWql/qpST8ii1m6y9Yx+nKxN0og6OlWInYR3ULEMHCkuIKevx8O2zK0HAfPG6Nz+rhT
	U+01nrmvMn91W3t2ljwIBo6lRm1ddlCdfBw2kt/hQCzpxq4p0kjIv76dk6qzeddyp+/eK8fHGED
	8rEf2V/6aLPnZpSlNfvtmPIQNUIwWaEkbkNnA1x0eaF3acU3Ky84K1Bhrd2pUuDU6UPGLwTucnk
	D1gSlYLuZL1+spNXJrO+Itcoe260yVXsnRqoNzwWJ4V7Bx61F00IedbLNOI6moUF/DsME1JQQAk
	sdYKxI77GrFssU3RJ8
X-Received: by 2002:a05:6102:358d:b0:7cc:21cd:9b68 with SMTP id
 ada2fe7eead31-7d07267043fmr5737257137.15.1793652994814; Mon, 02 Nov 2026
 12:56:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260824184159.240821-1-max.kellermann@ionos.com>
 <20260824184159.240821-8-max.kellermann@ionos.com> <CAOi1vP9nBoxBD9VTmMm5KnWj4zp0mdeXxTkzLR5tdBrmKrQ73w@mail.gmail.com>
 <CAKPOu+9C5rWF4mn6t660C5YxrcGHWvTFFEMkHeXWba0L4Ca=Rg@mail.gmail.com>
In-Reply-To: <CAKPOu+9C5rWF4mn6t660C5YxrcGHWvTFFEMkHeXWba0L4Ca=Rg@mail.gmail.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 2 Nov 2026 21:56:22 +0100
X-Gm-Features: AclHuK97uyDQ3RYpQzzUnogBK34y_2RNaw7d0TMM8K1oxMHm0Ojp2qbRWh1Ln94
Message-ID: <CAOi1vP9soGj9zfG4D58+RQHhmZ7F7jXadgudB7+FLra2nBkPpQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] fs/ceph: remove i_truncate_mutex, use
 i_fragtree_mutex for both
To: Max Kellermann <max.kellermann@ionos.com>
Cc: amarkuze@redhat.com, xiubo.li@clyso.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 7:05=E2=80=AFPM Max Kellermann <max.kellermann@ionos=
.com> wrote:
>
> On Mon, Nov 2, 2026 at 6:35=E2=80=AFPM Ilya Dryomov <idryomov@gmail.com> =
wrote:
> > Only 8 bytes?  struct mutex has got to be at least two if not three
> > times larger than that.
>
> You're right, it's 32 bytes indeed.

Good, I have tweaked the patch description.

Thanks,

                Ilya
