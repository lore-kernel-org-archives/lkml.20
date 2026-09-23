Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC0A40D574
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190883; cv=pass; b=KUWK1BsiJDy17JpHovNkbtyRWOgpsScPxaLhIUqfNuAXb/tq4/syo2R/tsoCH1CBkZnR8eCL4bPUp7MOKiFNeZ854KWp4gUBs6J6Ehd7INNdT6gACYz/rlT5jmy3w8atn+CdKm3B644u2FfDOQrO7hwhjcvegBHYHXe0fov5XsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190883; c=relaxed/simple;
	bh=7gPCH1FawZYUr4HVUW56LhKmqq4sdZ/hZDa7tEp9rEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNZ1aVjcBsy6eshXZx0z0VAUxmWAd3J1162yos/82QGglT9SHEnNr6TOUVQyEb/0+hisO2rIHHid+eOJgtsPr7clHbEcJBQzIdvIyt0GbdyLT7g1aEmcM6NT32ufSaN9wkkNbTchTdxwPKRMhYK3zTM7AQXtgRjS8g8Rh4ZDxpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN6/y9qs; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN6/y9qs"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52f9fc510e1so1254211cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790190880; cv=none;
        d=google.com; s=arc-20260327;
        b=fbM0SR2/tXlPWPORhIpkPqfNwS/rlcQzs5ANXgF1NGJCwLl+vszU77sZlfiN6e/9Yb
         ZhDWQkO3JxIhl2WTeigTGmDvXZQE132VgTL6wyZd16F3bGQtJEnQJ0DZgBKMkasLSkxj
         GUNQGLi7oaE5pM0Acoir0x12uEWXZzJ04fwmIgCiK8VGox0LqgeqxiQAo8UpuE1yuBtG
         H+Wm2rsBRHQ5gxTY92FzVJaZd9kenPwxXsG+16wFdy1a/eK50x7xxPcnvCFZQqj49viO
         Gek2kNXG/mcN9Ugj5edIeNNDglvZaeyYNZsID59TddATnvwJHlWn+isAY6rIYVu77Ti0
         MsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7gPCH1FawZYUr4HVUW56LhKmqq4sdZ/hZDa7tEp9rEU=;
        fh=1soW5h6FZNyeE3HeQnwte29LMpCYJY3j2BbHWkoNqZY=;
        b=UUSWfGbR8nx3p+iVLp4b7IxRHpbcX6F+MHPyJ77zh8BEWhuWCfOSEcZTXR2PJx/2Ec
         cUFXtZ8OV1dpSziiWnyLf2QgIh3EfnqIQsM4EOsR7bpHW45K8Ln9papOwZgM4o/fAApR
         ZeX17vBp/WzCFqZxjAPjeRyYQTSKHnpGWJGdWQrCK2P2nRryxO2rg4T5V0Ogb3tw5Ih3
         ZUZ7ZTyYGp9Wxt1Xwma472ZWY1B5STXWqF+flLBkpvot3cC4PdV3jGsU+79GpIcpSBZf
         bSIO5FTFSrQ3WfoqXhkF9ttZczO+b3yGQUDZlywOzhyIgV5ydvrLshPK/PPYew+jPjyL
         VKpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790190880; x=1790795680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7gPCH1FawZYUr4HVUW56LhKmqq4sdZ/hZDa7tEp9rEU=;
        b=PN6/y9qsQJrB4EqOwn8c1Bbz7EoraFGwL3VZnlCG8TVJ4sZ+uCfICKKOORm0DRvGzf
         zdrNOTG7UKDaQ7Kt6fR0tKYcqpbgMj6DxubsD+KX+saUnnMtJzc4KLceNgspEQUWge9a
         vzyRWiAuFBNM4dRsHw/HBH3XF6vtiWoGtFLKhb2yFaSwyZ7w9rsqgqXJ3eyaIRoQ2I88
         kr7uSVLlgUZMGBtRD+O18htCpxTdNl/w/hwyeqRP4qF4XJ+GcZfVFGsbtiv/RbYcT8It
         WP/e0q2gGoRQ+Oj3EFOrvY4Z3tG60yOf8/IS8K+/orOvEo/a51h6ZE9dE4Yx8Fc0Wu0q
         ph1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190880; x=1790795680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7gPCH1FawZYUr4HVUW56LhKmqq4sdZ/hZDa7tEp9rEU=;
        b=FN8b04XrElT8FnE1KoaANLzbjK6TCXgBEqMMQZlF6eMPQN3MYBknUbbLT03zdMiEvv
         DjrIPKpRVYtixYlnDnvO/Ib63pu68DhMe7p+oYUgOFxex1uL+rTNUMB0f5AYrWOGIJM/
         LuzaN33nQbK5IVqnTZqWcWhOhXSnWbF3WXloFMwla5iPisc+kQf35HnbfbTFPd51Ywup
         1IQ11v1s3pq6D4FCaKx9h00CYq8MTNv57Sd1EmaSJzxGUr1kFFf19Y8BNCpbPQAgrvwE
         qEo071nzPnMslyZ2E0XgThgs3COj5oaoU4aQyUegaOkZpN0aooqr5EYQ/4U1G6lC+flb
         Bctg==
X-Forwarded-Encrypted: i=1; AKwUvBzgdEfMp4KnughEXXZ1pmpiTEURAhZfm2/bLxYmVPiTCzNzmKKiO5WgNczszLPuVuoW2RZZ447NgcFldjk=@vger.kernel.org
X-Gm-Message-State: AFuF++lBLJNghCN1c+9iKpQLjAhNMdSxb+4k58rv4lecPen6GlS+1sjp
	7Ai2RNBF79ijeZwn91KPl4ne3Hfm5cU4aFf5K5vWYOpiI8Rw6KT5zUL4OvOQUsmCtaIQTXamHsy
	BJOv7yjnE5vD3nb/nE6rjwVV4jgrbLJo=
X-Gm-Gg: AYBFou1bDYmU96OsOU38QS0IrUBpMe8Ylxz+ZLNu0c4jkW6Nm5Doy0VrE3VUfq/1tC/
	H0KUMkqQKBrWFwbRFsZ6OriB92PQdreykAIE6cLvdHDObsRLFp2RjGl2lGxywwtxL4PGTmH2DAb
	f0e3Xg4aIoVFyBbBscIs5kYP5bSjB6hmdCWeODk8T6zJMYx6Sv2rTiBmtiJ/m1+wKKl/+akjiRI
	R33PBy4goic4kq+zeB6pokZoESaYLKl47xISc+Bsz8BnNgRZdFV7+qZjrQpgjE+tMLF3oJN8/JZ
	fPcKs8qGw01cDvOVNFFjVNSLK3SHC44Ed4/Kp/pbpOL18r+8vwN0uKWV05Ns9qr2/juTJBVrH8Q
	qSP3nYZ6Q0JAaR5sWxkIr/juUNVwmqRo=
X-Received: by 2002:a05:622a:408c:b0:531:2087:63a7 with SMTP id
 d75a77b69052e-532fb7485afmr1858331cf.19.1790190880383; Wed, 23 Sep 2026
 12:14:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915150739.284189-1-daniel@iogearbox.net> <20260915150739.284189-5-daniel@iogearbox.net>
 <CAHC9VhR2Zp9LzDRwDOZoesOC7o8hretfgRH-PRqQRXA0EES2vA@mail.gmail.com>
In-Reply-To: <CAHC9VhR2Zp9LzDRwDOZoesOC7o8hretfgRH-PRqQRXA0EES2vA@mail.gmail.com>
From: David Windsor <dwindsor@gmail.com>
Date: Wed, 23 Sep 2026 15:14:28 -0400
X-Gm-Features: AclHuK9d5OdaJO5Ll7iOJ6jpvdM_SUqGbTaoCVRmfsl2t7C9t_IuciwujiuXmkw
Message-ID: <CAEXv5_g1XQAwsydnbu9SUvxNBdYQf+xXjPaZMeC8hxgfThP+pw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/8] bpf, lsm: Let BPF LSM provide xattrs at
 inode creation
To: Paul Moore <paul@paul-moore.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, alexei.starovoitov@gmail.com, brauner@kernel.org, 
	john.fastabend@gmail.com, memxor@gmail.com, kpsingh@kernel.org, 
	matt@bobrowski.net, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:57=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> @David, simply for my own understanding, did you ask Daniel to do
> this, or was Daniel operating on his own with this patchset?
>

Daniel and I work together and both have things written on top of this
kfunc. He reached out to collaborate, I agreed. We're also going to
send bpf_set_file_xattr shortly.

This implementation was chosen due to its immediate mergeability (it
only touches security/bpf), but was actually suggested by Kumar in v1
or so of my original series.

That said, sorry for any confusion about this appearing as a new
series rather than as v7 of my previous one.
