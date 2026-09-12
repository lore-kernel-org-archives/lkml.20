Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A226237E5D1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789220535; cv=pass; b=F2F5bxs21IdLOoID8jKbHV+8VpXpCXjqqPzfxjUqETY/xDMWAGS+AWvkXqxiugzLb+HgwHU4Uq4xB6rCERSxLFy7kDyQZsGgQlHFS7sdAipQIaId9Afv+jIlE5t5boltxr5i8GEDxQ6bp94XMj5oVk1EU/a6aR4qr06N3yVXS9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789220535; c=relaxed/simple;
	bh=vsuwVSiplWlIRMCHW7Lp26gGoJvpEBBWupkUOScc2fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPuPKGY0nimtGH4s3ZCsqrr0qk6WiCMmVyccYGdUTM8MR6NKQjVqRN33gNqROsJgac4yylB6S8karohybe9ZSHdKPyhpnRsi+wm8RAWE28b/xRI5qSnt3icd2nl5StJ5Hu52GEqgHz7duoVRVYCYU3GnUCJixJFVQ97E7yRgLAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NhCYm9Xe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rZA7aInE; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NhCYm9Xe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rZA7aInE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789220532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87yNTtGOMF0MCh3k6ypybUnWZA7MEZgOnf1EeaRqydY=;
	b=NhCYm9XeymYBXjnAqeDjlsq2rc9iNpeQVKn8jinn/KsqWSkuo0yOMYqWf5y+/n9sRd/kCJ
	TfaJ5y/b5GwVeR0N97ZkAvy7aebebjZZ54RZAgf+DEIgdT5JODlBSl23FLGqEwi3CF1sti
	IyqB0L1aVjettNV+3xr5V/BnEJXEKrk=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-dhLyaFRpPRCqCZX8XVLI-Q-1; Sat, 12 Sep 2026 09:42:11 -0400
X-MC-Unique: dhLyaFRpPRCqCZX8XVLI-Q-1
X-Mimecast-MFC-AGG-ID: dhLyaFRpPRCqCZX8XVLI-Q_1789220530
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66cf1803125so2405296d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789220530; cv=none;
        d=google.com; s=arc-20260327;
        b=EOhdlUuH7iaXSBbYV/Md68ogFTugZZeeWJw1/UypY2Za/zTY9YEOMj1reeC20sw40L
         pjyYP+lVfHOKsjlH4dEc77jFaZvZFic6+lzZnVs07haevHSU/IFV82XPVX0UR3BG553H
         kumJ54+vepNZeD063ams0b6skbdRegQd2VbVA1SwxWcQNnwGouSkjiKmQ65ALZGjRKSE
         lM6mpORoHXuvz2LtkZRJwL23Ft6FG9/jyRDcPq483+SnPb5nTHrxVXDcFXKvEbBYwQVE
         YpFsaYAypVl7jdsTg8YegvZx3fFO7QGA4QsPsMHznYKOJt2b6pNM9FP4ofHlh8GPXKs+
         Sq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=87yNTtGOMF0MCh3k6ypybUnWZA7MEZgOnf1EeaRqydY=;
        fh=ovVnzDQwzzDZEVDZmTZ3S1rFZH/NUsoE1hHetdoWrYA=;
        b=So4L/qRVKhtE2rtx6xxUwOpj313C6yHZaJLHgfgWxKyiGv6eUYA2qXorbtMH/JJJqZ
         61rJeMl4Xx203HcM5WazvaDs+c6jgyaS+foQTqGCRxux0gljq2OMQaRYWWgR1S7SO1dk
         M3atTp37XUENODIerPRxQqXkbF/jLyKBGiV6HjlR7DVnsF6JLl92POoPjXWa/4kp6uX/
         ZQ5j5LRrBJCPYqw4K4z7l0og9vx7i2s/yELX8EblOSDvQt5dh+u0JHIPs1o2OE6oVrjT
         lVX4Qec1MGv7BZkQpGPED9tYn/QRY0PnUuNLJZmNZGSmwyC6ie4nUCnmXjHlnb9bsohR
         lLvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789220530; x=1789825330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87yNTtGOMF0MCh3k6ypybUnWZA7MEZgOnf1EeaRqydY=;
        b=rZA7aInEk5fYu9Jamb9N7LTF6nPgjhfdNm3Qyf8RPngsmmy0DzGM9I7fl+DQc0TAyZ
         c+0Cw8UKpw4QVZz2JgvDbkAQf5OVZmK7Pquw69FUeDjDK+gFhM581Zd3X5FuwzE43Vh4
         C4FYyZf5IkJcSdZS87WiS36guEFn4v5SrTE8HjAlvG/7GRe1VGDjfK508gH6WVNqFxtt
         nY+2NMXbF1r4zdZ6wNQn73bLrbtZOXjYNE4OgRzAfj2trcyxw5ZfRhSg6b1LeHW08h69
         zXKymKqr2LJVLTeCVoZbxxK0jXUASma5l4BSmJIJc9kBNQIcaDdNKCnAAoVrvZY7clIP
         oIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789220530; x=1789825330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87yNTtGOMF0MCh3k6ypybUnWZA7MEZgOnf1EeaRqydY=;
        b=e15QVZUNH0GyDOC02fHVPlI+IV5JnhVaKdJ6OTtBJNOZOHDU/qpZB/mn10eOOwQpRC
         hJN/+5quHDW7xRTdtMJT73BQsRt7Nf8mephaC27HGkJcR/zgpQ4hI2gOQFMQBgXiBtRL
         4d4rg1DQyLyuUHaXHsS/M6U8jn45CwykqC336COhoMgyFQW7EEYofdc5MdadRtWnWXLL
         2t8Vw/nErjLDEyG5Gt3Eow4Z2cUcJ8d1ZDogau9TEkbVjAE8UlI1jyep1NUbhn3foGc3
         jGOGRF/H4mJx/CualH49ZYazFCv2rplR1v976218SvMMens2TaDgnlvtjdMfwRDLRhC5
         eN0g==
X-Forwarded-Encrypted: i=1; AKwUvBzGvdET8bb+AmZwTpFfTL7Z7PzJfuXyOw4IYKpwWjF0t0gesjtfHQcHOwjm/ONY6EeMNbe6A0FXWkPOoBc=@vger.kernel.org
X-Gm-Message-State: AFuF++l2o32vNYaLJyCsDZEC1H0Idz0qDc+qEfnIiV8kfbWj1tiuDBJ/
	V4FBVL2hlBImWCxhYxGzEK92T9p4RKtJ8NWDy/gOQNbdbXq8PMA7nftmDAzXGl17gagp2+A03wG
	WrPM0glvqqUFUty1bijGSS+iG/w0ZPqfage0DzEwtojztzn2WXPkJZTCwI9iKdgACs0t3k5v7wu
	w8SZTXcvpC3keKfjoziwLJ1pH59Oa4KD3AuAIlASYNt+yQClf5SYY=
X-Gm-Gg: AYBFou1c+oQXQOoUVw17CRg33BNCffCMx7ZK5XObUpjFBoI57EeCOVKE9gY/iu1fJVA
	Ut8txJ5I8XXqPNTE2dtgfwrGs4RHFoLFAEcUZxcz7CQ8YqtY5QT3+f6q3hGQMlua9DW13MrNpOd
	isw859SQvAx/NsZo/F5LPpxQ+NhmSIDGOhaj3krs4UG0ofKa/b2IMNEPPXrz2foY4FYaI42Y0Yn
	ySIvXOyt2RsReftr3z26Kv6QsXqOrNfxkRThk54NJNT
X-Received: by 2002:a05:690e:d43:b0:66f:c1bc:c077 with SMTP id 956f58d0204a3-671246cf55cmr3181930d50.63.1789220530502;
        Sat, 12 Sep 2026 06:42:10 -0700 (PDT)
X-Received: by 2002:a05:690e:d43:b0:66f:c1bc:c077 with SMTP id
 956f58d0204a3-671246cf55cmr3181922d50.63.1789220530046; Sat, 12 Sep 2026
 06:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912062614.42899-1-kmehltretter@gmail.com>
In-Reply-To: <20260912062614.42899-1-kmehltretter@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 12 Sep 2026 15:41:58 +0200
X-Gm-Features: AcwNN1VkqudTxhzQveFbYQ4CrzcEuW6UG-ETzUb6nXW2-0Rd91KL7t0znM0RfIM
Message-ID: <CAHc6FU6QnSb2fzqJQtpdehiE9DRfCoJY50Nw1YJBo4An=gkKig@mail.gmail.com>
Subject: Re: [PATCH] gfs2: Fix the return value in gfs2_get_link() kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 8:26=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
> gfs2_get_link() returns the link target or an error pointer, but its
> kernel-doc still describes an integer status. The mismatch dates back to
> the change in its predecessor's follow_link calling convention.
>
> Describe the returned pointer and error value.
>
> Fixes: 680baacbca69 ("new ->follow_link() and ->put_link() calling conven=
tions")

Actually, the problem was introduced in commit c177c2ac8c5a ("Switch
gfs2 to nd_set_link()"). I've updated the description and applied the
patch to for-next.

Thanks,
Andreas

> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  fs/gfs2/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index f361876c5583353a1196ed35be1c95af33a90c02..d5e03ec89127254654dceaff5=
6322ed617a3400a 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -1900,7 +1900,7 @@ static int gfs2_rename2(struct mnt_idmap *idmap, st=
ruct inode *odir,
>   *
>   * This can handle symlinks of any size.
>   *
> - * Returns: 0 on success or error code
> + * Returns: the link target on success, an ERR_PTR() on failure
>   */
>
>  static const char *gfs2_get_link(struct dentry *dentry,
> --
> 2.39.5 (Apple Git-154)
>

