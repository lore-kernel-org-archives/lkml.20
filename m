Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793915805;
	b=3MnpuekRzOL/IaXiWk77szezP5NGqeF5qMsSlsxvCxwIFJlCm7vsR19QwNP+zpYSdkPU
	 nbLqRkAsh3caQi4+lR6vc9Brjl1qxuV8kLgdillNSx+aG6xLmvE65rV83Y+A5BH7yRTd5
	 Q5k9wvhXk+q4eSBqLmEBxEDd9KFI6shr7u9LVvj33Btk3fkXUVUwNcW+WC/NA3f/sQjIT
	 DgyHYuZWKeBjv0BgG1/8/hTMS+9hEqwmHFcKTrhSgGXn+yUKa8k7dTmo85i0k0J+8SqFa
	 On5R4iR078ITFT2rSMTwBRqpiG/w0p+8axWXkfOJc/6cYFkn/ZqTFAOyX0xKGnM15WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=INhnVhFd4nT7/Uj5uaF+eYQnNc4krDM7hutL2LALWFE=;
	b=XiSVM++eF3Mnr9VU998hDZB/pvK2Y2pYTSCrxrIsWeF9vMRm2yg+Yuj0dw+r9gffSfhZ
	 5wJ3XP94jJpauyie1K/GDQeZKAzPAzK/6xfjbmOuCqV3KV+RnkhTsjFd5bhMmeIhupfod
	 ZtJMfFf6TetJDGaTrUXXux8ccdxmsa7PYbM/ztJJigWM8VxUxzwbzJyTG8/IaEj9brril
	 BvD386mGH3TEuGUhbrV4XBeDIePDd8Sx0hxAtnajlSbppYasMioM+9hKP3G5oP0qf1qSc
	 p9g5C2bqWqT+B1tbNDExr2qdPTXr4ddc+8ee4EGWqZQc2XtJKtKxO/n+BqNSCt6qnkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LTjaWOCa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69A2606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B69A2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LTjaWOCa
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2eb0a52d605so15965ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793915803; cv=none;
        d=google.com; s=arc-20260327;
        b=ocelICIQsnkyA65y0pXzneGlDWarHpCjWW7sKAjCrQP2Tutb+YAxaL9hR6ZKmtTwxn
         ne7hEkGy/PZIxd/6llSPKxmCXMhSGJQaxLSQp36wgJtVMpY4Ouopk+KqrhCFMb+UtdZD
         4Fy2+ws2bdD2scJJxTKxCvMGCuRylvi1h+Zhw3WHxfhKoY75ihn6gpB4u5lPRIh9qpNV
         sRz4AN7xciWAfpWJZIANz/HJSGoz2k9Df2GkcM1QHU9tA0MZ4vzM9/9GDCMPrmIQi4/f
         RW9+u9N4EQrYE/Q73m2m428436BIovLiD5+olIy/TBaVnGaioW+7AOMIdLIEFjQrdKvj
         QUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=INhnVhFd4nT7/Uj5uaF+eYQnNc4krDM7hutL2LALWFE=;
        fh=gZRFNYdhcEMtVZHibuXeAdhWT/nQxHkmttidvG27qA4=;
        b=mv2okgmNjdeXQ05iUic/Dd7GBF9QVRfKHKCKuAjz4ExzaZjIl2KLBGV7OOcTBWcYbB
         N5oSymLC8OWwPymWs3vx4deimbpHBBGxZrJXSGrD52JRu71BfdwT+zlWp/Y84Adv28oZ
         19FOO6hL77Yrl8WWBkmGnI9aYhPr7PTftoj6Jin+aUNz5AlhHybTbXNYmC6C1Eh0sKk3
         i2lpIZksI6Ra5m6uz9rr50yLLxyPWfqQ6kCY1Pxr6Zr9SVBu08DlnSC1OWJ8rY5+UapP
         RhHcsl5XKLzhKFEbEzhUkTOaQ0UJxbflWIPI30MGmp/BNsgjGDFq2vMuvjK2W3YjzFq3
         uWCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793915803; x=1794520603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=INhnVhFd4nT7/Uj5uaF+eYQnNc4krDM7hutL2LALWFE=;
        b=LTjaWOCad7naX2ksiiBJ/btHekFdZApACmal8hPWqhq5JTA4qdSbJMprCg6ugYPYNA
         J8eA6cx2/mRXlQh0tYfVH5FsHYog9yckNpHPxTA2W7usUF+DXqORKmPcOdBxQaPH04Ec
         JAabj/UWXm1wD6MTl+JJ6as8ddea4sbRPDknOX4MZZuRL3csCqDo6XE836dLM7/uvi8X
         n40i3QvH39VcVbV4DVpZUFrePomkRSepPLYWKpVN/vK7BWV3AlvcKBM77Paw6kuPi27P
         EASG6fnTNNRSs4tGiRCGwV56F221RPTj6p5drVd0yETUkdA5mhmbgKtrTQEPYEgmu6QJ
         sIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915803; x=1794520603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INhnVhFd4nT7/Uj5uaF+eYQnNc4krDM7hutL2LALWFE=;
        b=TFUG4q5zY86BZHaJBwDHuwRmKWQB/1tJaJ8qydZnqFSHhBvOGd/oImOVyW3Qk9URBQ
         TOQqZ0Al5/0ryUEdnaJyGBxKsZMH/gFaVH82mA+t7cS+CAETd1Q2j/W0yfBwuGdWl6p1
         IJbDGbnbO1vYw/l6orM9WDaxJKYwpmjJpuppTF7UN5xc8GkjHOSkHejoS7yD/ZidQAZw
         K454OcDbrtMy2zG3IsGPGFSN0Z/AXtYYhQf6lNzGHmEAXUbtiiRx00Z8BkPONzFKpNvK
         80zKK5k791MXDgDYq9Pj9iHdhb/ZCnzadKEbdjpPMyVMawnQ9mF1AUM+2zQrvnZ0Z+3k
         hRGA==
X-Forwarded-Encrypted: i=1; AKwUvBwyqH78PYgPRbp6KIlFP0PLfU4TGkB8PUrbhvHP/ANjV2FpgbYa2jIKcZYkZqamc7FPLI0yRyw74Y/0WE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YUUOm4RmAVo14igMiOO65YZpdHWkvCnMh6CDpVPqo8a3FPp3B
	4Fcrnvxi4o187id3BoUIkXwEfW7SQfW7TGMisyXMTksWZKK0ZUn8n+TQeHxUW66pCWSTtOQdJyi
	GeiHFukIIdLUQGx/IxzNzMnhhr7utxMgBqk+Wu701
X-Gm-Gg: AYBFou0cUaXjT/23CVxGXVYZtvpx4q31HTN82ST1a4WUjVLRA+HYZ7j8ymkp3QDGHLx
	nHxSx/tlgsXatJn7gnRlpiKuh2IQ+QspI251QvgjeNiEeE/qIP3u/hIvcy49msbUnBrAlo+HTEI
	tNTjeBpOhcP02apXluBRrCyMcZXoi1JZ8tKnmqswvcxxaFLJpLoZigTi/y9tY7883BNd5OzUEvR
	OcK/WbgUzcs4jHu4fHXJqrZM7AmiNkncPUdXzqQ0lsfMjCR+BDOpOg5wfDhHyfdg5K9K//sq1JR
	K2bStIuRR2fq3z5zHeCTS/xYkkFdSBXcpMutkzW+lBZqwsTcGAmE9mjP9sLicpxMZkLf5WOGwaS
	2qAQeKlFPtQYqBn4LhrvxzH/ruNEcgBD6Cr3NAuPfrsO6BTr+91RLaiC6YfxnRZsUyyENqHvY67
	tEsd6kEd59cEkGNA7Ea3R6UQ==
X-Received: by 2002:a17:902:e5cb:b0:2e9:73e0:2a6e with SMTP id
 d9443c01a7336-2ed45ce19f5mr502865ad.17.1793915802597; Thu, 05 Nov 2026
 13:56:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-22-245e54e87116@kernel.org> <CAG48ez0CTxGiZ-q73k8bNhoBTW7xZfWwARCKmmM-WKr6GNBbeQ@mail.gmail.com>
In-Reply-To: <CAG48ez0CTxGiZ-q73k8bNhoBTW7xZfWwARCKmmM-WKr6GNBbeQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Nov 2026 22:56:06 +0100
X-Gm-Features: AclHuK_DIYejrtAv-AIBmnyCAT6PTxuyVU_wOrebkVDOMckVu9fXadnWy_N5Wcc
Message-ID: <CAG48ez0QVQ32Fi_Hsu5ZAWCdWEXvZFB7hNOswT5Qf_Af7YzxSA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 22/26] ALSA: info: let procfs own the seq_file
 of text entries
To: Christian Brauner <brauner@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, 
	linux-fsdevel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 10:52=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Wed, Nov 4, 2026 at 8:47=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
> > Declare the show function and let procfs open and free the seq_file.
> > ->proc_open() only sets up the private data and preallocates the buffer
> > now and ->proc_release() no longer releases the seq_file. Reading an
> > entry then no longer holds up its removal when the card goes away.
> [...]
> > +                       goto error;
> > +       }
> > +       m->private =3D data;
> >         return 0;
> >
> >   error:
> > @@ -387,7 +388,6 @@ static int snd_info_text_entry_release(struct inode=
 *inode, struct file *file)
> >         if (data->wbuffer && entry->c.text.write)
> >                 entry->c.text.write(entry, data->wbuffer);
> >
> > -       single_release(inode, file);
> >         kfree(data->rbuffer);
> >         if (data->wbuffer) {
> >                 kvfree(data->wbuffer->buffer);
> > @@ -401,11 +401,10 @@ static int snd_info_text_entry_release(struct ino=
de *inode, struct file *file)
> >
> >  static const struct proc_ops snd_info_text_entry_ops =3D
> >  {
> > +       .proc_show      =3D snd_info_seq_show,
> >         .proc_open      =3D snd_info_text_entry_open,
> >         .proc_release   =3D snd_info_text_entry_release,
> >         .proc_write     =3D snd_info_text_entry_write,
> > -       .proc_lseek     =3D seq_lseek,
> > -       .proc_read      =3D seq_read,
> >  };
>
> Is this safe? Looking at the work.procfs.cleanup tree, the
> proc_release handler (snd_info_text_entry_release()) can call
> `entry->c.text.write(entry, data->wbuffer)`, and the only kind of
> reference dropped by snd_info_text_entry_release() is a module
> reference.
>
> I think the entry could concurrently get freed by snd_info_free_entry()?

Ah, no, this is fine because ->proc_release still happens at the same
time as before.

Sorry for the noise, should've thought a minute more.
