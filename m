Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776254146E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169931; cv=pass; b=hV5KevS+7lQFv5ihhcFZiM902XTuzHxKOKM8xPqHU5t2J2LYYCpOoPENyV9GhdhRbQEG+GyhMj4t1S3sSQi5BEeEVgEgPc/VLOJpWR4sOmE2WLyJJjNlTljMjzLfb0XfV80t1jRo7rRwS0A5bzonGYb5ymBX3TByCI3AqX0KyDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169931; c=relaxed/simple;
	bh=k61iFgS+IKJHl0EJEuWZvUQY83UqouqRdjCkl8RGuw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYs7wF3EyGbINcR9caeeMO5GULapeXWysRVG1R8cBoPEjsnWOSNctAh22J26P1ssHMDk15Nf0+vULwJOF3A9xNBEnLOJYZ5ia2IDC7NWQagSt24Kpi9OCjIXwXLS03VNZbl6dOb8XqeEz4nZW5q5r01Qgks5grBWgwdj7RDXKoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFIgFeWt; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFIgFeWt"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2df8c28a0b1so154535ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792169925; cv=none;
        d=google.com; s=arc-20260327;
        b=hHseXkDWp81tLy5tQEfBJ14yS7DkPkh3DGsye/xPDTXVbkfqUV3vAcv6cWzd1+qGXo
         3up+MLmonNGJHhYLuQdNuqLcHKkBcwU4AP9C6mg+iNH1Y2EwY/qnS1cf3Wgw9AAzcMbg
         0sQd0msK9XjbkAgJLL/aZWFjM8w/t/uKiCv4Xz6+bxJncynnZGkZaez6mCPLhE7bnSf1
         ucS0C9/gwEr79+VGN2V8V7psat65AZwrkx/tV7JNKxeqiWBqO7xGdm+J0lxI02n93tdR
         eulNpUe4M8GHu2jvLct+/oKAvubQPxu/UUsArMJRuLKhVNCj1Gs336ql0skPB/qfx3uP
         Ciag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIN5PWNqxoh9H+t94mJngNpG6Duh35uUvogPeO7NlXs=;
        fh=WtFFzigrA2uLBdPeHd07RVCE/Jiw/w6OBG7jshqPImk=;
        b=PDRSTe2Zzx0Qk5gkHIXkFPGEOLZS/tY9/njT4+Ry15aUNwx2Sjz62XPWIgPBzmHoJM
         RYlEsR4I56/GLx3EfFNTouOa+j8vEfNU/Y+khdMITlEiNk3uIWT7RFarvDD+tXdu223p
         wpdGwdQQq4lsypcn0l8k/x3z2xwZf6JOuurFG3dBc1bgl7q8nwBaLbRhZejrXC42lgnW
         qNK4UWBWaIGa9iKL4eFlZtBAyskaXINEOoDQ8KPpMj6Z/qmtRGIYx2q92JmyJvEbPnAL
         l7tjq/Jz5v/fMVZrziuABpmeQ6crWuH39aESAHEc50JwqzUq7enN6sPiemN1Oe4P6Zpw
         OyAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792169925; x=1792774725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JIN5PWNqxoh9H+t94mJngNpG6Duh35uUvogPeO7NlXs=;
        b=CFIgFeWtZE5pkfdVrIbXLZNHpX0RQMyzFxoLRzVtvGQAF0ry4cuAf9KtPW3AfxbBWW
         386zszQbOcB+wsirsxJ5u/ozBImHT5J2/pGij81SIrJbbn0ewFicmQscAaHzS6Ur0Fun
         l5fGa46rgf8agTvSKMEumFCLXDte4j6gYsDnU34mFtcPgr4vUQe+qKE8BPagrsJ+bhss
         a3LhmpRvan3qMmF20g5EoarOk62clVnMCPs/nA7A/KnRX+m06L0CwCKHBsac0ZXv09oZ
         0citfcivUXRqApGoH7jZ4DLm3vMAcEtMpQx3kUZOLNWkWT9ITQQBHfs/PsqrCHGly2xe
         Vc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792169925; x=1792774725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIN5PWNqxoh9H+t94mJngNpG6Duh35uUvogPeO7NlXs=;
        b=pmcHaCkZCTqF3vF098nZplMKRWE8lMJVauZqkA5ABGAUEcbBp3n4h4MWjsC9S4sN5N
         bR8F3Xl7hj0bZQROwBxDjvJaxyXilEg7t7AGfIv34y6rKsxQr5unSx25b2irThwEV4JZ
         QrAoziil/hNMbwiLy8i2pmHsq6AH3RW24iRd919EWeK6mKIUendP8U5EERZohzWiMKDZ
         81QZk7SdOnBn/o6ZDetpX1Ip8x6ohjqxakO8/Gz/7iCzIheqNQh1WaGx2hfnKXP9v815
         5Kntjq6mJn7bk2eBuGC6hkrF7j0sHLvV+ZWQxioEpdMc8L+i2jQzK5BqpIba4Dta218v
         Y7sw==
X-Forwarded-Encrypted: i=1; AKwUvBzlF84pgBH6ejY1twDJ4SjxhyT6hIMa1cDwBr6F6FqObGM1N1LzlLS5CRHPCjr0S1VQMUTpFU/HUNvccBI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKsVkDtMwImr0TbYj9bjhg1efSjL9arDfdyPSg+KGatvx4Vq7M
	mx10ZK8QUiXrNpG7GMoN/Lyrj5Kuu998a3tvrJPi5vh4/wzqX+MUDfrbJ4HTqTEi0YhY7zLlxBx
	Zsd0riL4N7l5uNDm7WnmH+52QnuD/wiejLdr9
X-Gm-Gg: AYBFou3sTpXS8oJvuqiOk1QDvO2Unst8LvDgM9Nkg1NF2vF/WtU/d0IrygLcR2BRjWk
	EKnu5X6K1c6kc6ai9NwS4VkAf0bBDI/xeoW/REGIE1LzGNfMaSE0TNLHaFbIA/xsWuIXSZM1tAb
	ASq1np+rFNSb40feGSQIpbSnnAGvMDL31bXb2B/WKKxXd8Kyj0ihaQ8I3ACbGa+nOauQa9Inuom
	pbrhTTPK3VXfRnE8PkZ858MRwIelBQem/SlDuEDRrx4LX44M5B7/4BFoLVN0KB09sFvaiOo7BJb
	D+2Bcb3Rqk6wbVv66r7U65COUPsriupPo//EyYc/L2McTiZiYqBXias=
X-Received: by 2002:a17:902:e74b:b0:2e5:a355:56e4 with SMTP id
 d9443c01a7336-2e9a6c1bc25mr5321195ad.11.1792169924791; Fri, 16 Oct 2026
 09:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004123755.14642-1-adrianox@gmail.com> <as266is_fT232oMM@elm>
In-Reply-To: <as266is_fT232oMM@elm>
From: =?UTF-8?Q?Adriano_C=C3=B3rdova?= <adrianox@gmail.com>
Date: Fri, 16 Oct 2026 13:58:29 -0300
X-Gm-Features: AclHuK-gfESszHabRN0PS5BgGr5Od1_R3my1yeSujcE6rIsnwzhPm4ULckGMbVY
Message-ID: <CAMGU2hW2Bk7k301cjYvEQQR5jqGPCV7H5MC+rbHsTtWsXA8oOg@mail.gmail.com>
Subject: Re: [PATCH v2] ecryptfs: validate auth tok payload size
To: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com, 
	Nguyen Duy Nhat Anh <neganhat@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar, 13 oct 2026 a las 2:00, Tyler Hicks (<code@tyhicks.com>) escribi=C3=
=B3:
>
> On 2026-10-04 09:37:55, Adriano Cordova wrote:
> > Validate that a key payload is large enough to hold a struct
> > ecryptfs_auth_tok, and that the password token's
> > session_key_encryption_key_bytes fits within
> > session_key_encryption_key[], before the payload is dereferenced.
>
> Hi Adriano - Thank you for the fixes!
>
> >
> > Cc: <stable@vger.kernel.org>
> > Reported-by: syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com
> > Reported-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
> > Tested-by: syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=3D03c68e42ce4b33f7ce9b
>
> Change this tag from `Link:` to `Closes:`, please.
>
> > Signed-off-by: Adriano Cordova <adrianox@gmail.com>
> > ---
> > Changes in v2:
> > - Add Reported-by tag.
> >
> >  fs/ecryptfs/ecryptfs_kernel.h | 6 ++++++
> >  fs/ecryptfs/keystore.c        | 7 +++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kerne=
l.h
> > index 58165928ed1e..4315c18ba1cd 100644
> > --- a/fs/ecryptfs/ecryptfs_kernel.h
> > +++ b/fs/ecryptfs/ecryptfs_kernel.h
> > @@ -88,6 +88,9 @@ ecryptfs_get_encrypted_key_payload_data(struct key *k=
ey)
> >       if (!payload)
> >               return ERR_PTR(-EKEYREVOKED);
> >
> > +     if (payload->payload_datalen < sizeof(struct ecryptfs_auth_tok))
> > +             return ERR_PTR(-EINVAL);
> > +
>
> This change should be in its own patch with the following Fixes tag:
>
>   Fixes: 1252cc3b232e ("eCryptfs: added support for the encrypted key typ=
e")
>
> >       return (struct ecryptfs_auth_tok *)payload->payload_data;
> >  }
> >
> > @@ -124,6 +127,9 @@ ecryptfs_get_key_payload_data(struct key *key)
> >       if (!ukp)
> >               return ERR_PTR(-EKEYREVOKED);
> >
> > +     if (ukp->datalen < sizeof(struct ecryptfs_auth_tok))
> > +             return ERR_PTR(-EINVAL);
> > +
>
> Nguyen Duy Nhat Anh submitted this fix prior to your v1 so it is best if
> I take that initial patch. Please drop this change.
>
> >       return (struct ecryptfs_auth_tok *)ukp->data;
> >  }
> >
> > diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
> > index 51651314b7a6..7f2dbc81fcbc 100644
> > --- a/fs/ecryptfs/keystore.c
> > +++ b/fs/ecryptfs/keystore.c
> > @@ -477,6 +477,13 @@ ecryptfs_verify_auth_tok_from_key(struct key *auth=
_tok_key,
> >               rc =3D -EINVAL;
> >               goto out;
> >       }
> > +     if ((*auth_tok)->token_type =3D=3D ECRYPTFS_PASSWORD
> > +         && (*auth_tok)->token.password.session_key_encryption_key_byt=
es
> > +            > ECRYPTFS_MAX_KEY_BYTES) {
> > +             printk(KERN_ERR "Invalid password auth_tok sKEK size\n");
> > +             rc =3D -EINVAL;
> > +             goto out;
> > +     }
>
> This change should be in its own patch with the following Fixes tag:
>
>   Fixes: 9c79f34f7ee7 ("eCryptfs: Filename Encryption: Tag 70 packets")
>
> Thanks again!
>
> Tyler
>
> >  out:
> >       return rc;
> >  }
> > --
> > 2.51.0
> >

Hi Tyler, thanks for the review. I will split the changes and send a v2.

Adriano
