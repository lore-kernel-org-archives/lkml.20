Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CD7453A29
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788391248; cv=pass; b=FBnTV0C4mEczUJzn2OTThoJ5aKeUDWdGimGEiA8uccSIHuR2CnFM7tQXRPU/H7s/cVaRi3CjqonLTirwes+SHYg7hyhPhUMGD3QAWsjDOxv/rS+t4TzoLCEvfqZeKONWD/+t2ZCJsX9uQMTnzAokdMc68Fx1PYv0W9gfNEiTr6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788391248; c=relaxed/simple;
	bh=iC4igTMpMA0vt8N3OLjewU/xk9zTtezvRPa2jfDrV7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrYitgWPWvw5Rn8rw2+4Qr8RWMvguK9wNBRsFrBoHGT5iCHAcDqoSM+Qwj3Hlb1DYt+Xnu0QVWAuZhSN0p1W7P3Ijak4jjgHytcLrxK8tflR90eA/kIcB7j0IH2vm76MBT3MMNQuWtW4KunLx1ofqYBy7giQYpdZGAoUU12VrPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=awtVFJwL; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="awtVFJwL"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-75e2905c09aso450060137.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788391246; cv=none;
        d=google.com; s=arc-20260327;
        b=LJhyHlR/tPPmUA54XOJm4f9QRBcFxoC27iDuIzeX7xZiL+F7p7Qhfq/g6DEOLm7dQD
         l1+ywi6HqVxs56hvNkrEemSl4NccaJJAifYwlY5wY0t0bE9EtogBEn58BfdtzYfMEmng
         LIeT81v9mfhDrNxfsIv1JzLBUXEafRGNsxbbJs2Wmov/1UB1OpkEwDf8ZhHR+0gMSzv2
         kveC7Z4OE2cxnftqb2aQgNsOmOr2aQX3P4UQmCVhIukwr7j6nuTKUP75idTyVUKFihtz
         2MYAsQQEPsrF6wz7FDAcWEeFtim9+TfxvpKQYtBsADHNT3WgIPCHw5jOyKCGnBpoeLIh
         634w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctfyWmXku01u+4qfsuLl+OcUlV55EiVZqHCl5DVKyE0=;
        fh=PZsdEd2+3qvY4XCX/XHhn4rylhFn92r58zzENVwilys=;
        b=NVBFYkh4wfGRRrXhY12mVYmSPRJvApRQKeMwqbCVkHParbZVgCgjJpu7eaeQrfp/Gm
         SW6pqj2gHtlau+F1wo0pOAFvoSPtV0eU7PBkwZfeZH5MghFOkArXsDpDZXviayIppMeo
         MTnmwCW9/hpWk8pCJaTvkvci7680fHVh5gEtAAXva9G0sZ6KAPQqenuD68Hv8E4Gj5bA
         Dac2/njEW6gC3m4CqnQ8kbgTc7mnlZBmEjbxOpJzqJV6oNqJPZkxTExNvpgySrdvdcw2
         cCVRsbA3FWawkCPIW51fpKQbulsIwbwn1LnQviWuK9BfB1lIF7/5wkBdwx1Zp8l6STtA
         aKEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1788391246; x=1788996046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctfyWmXku01u+4qfsuLl+OcUlV55EiVZqHCl5DVKyE0=;
        b=awtVFJwLOPvszdd6HdFM0Hh2xVxGOnfUic8ciOWfb1nrHPJD/so58cYf+Qs+bkwU0m
         FTMxFlMhyak+JbEchb2SMb+0hjyojustqKOqDn21TmSi84sa7aYEF4Zbwpa/uwCPnTt8
         hACdH4AQfVFYpf8XJlSXindwYj0cKm+PmQpyLRYvCBHbvzxz6xL4KncF2wAn9DeS7gwD
         nvn2Di9rJjOPVh45oIsZi4qgToRObEhXC14cIs3aZPEhvHAyw1hZnn1WY0xdClB79JZ5
         IyOKV9ZQLqpIuoEc8peGw9XoSfwytxXNO/7yns1eZUnimOryymoRekl0l0s8rmfR0+P9
         /EIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391246; x=1788996046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctfyWmXku01u+4qfsuLl+OcUlV55EiVZqHCl5DVKyE0=;
        b=h1fSjC80Vn8HAWJjdJh2Su0EITs/AJ9YjYfVXD8Eagl6eFyksahnCW6lQf/0Pd2UEs
         yRZtZU+NIYa/QC5+pr8jQgIwd7XAdeLQ6Vlm3xgsl0b954DCptf2teUXtUcc3jN7HWaJ
         mJbdIBYRaLKJblTqI74LomeBTDwMsHb61BfPVJH5L//eu08Qoq4zlrIx6wfVU8h/XU5O
         E4Vxdr774fU0Bo5XxP7j5HBC5D4hGyn8XtZed0WYJUQZLyQmTAFq8qI6JVBDdTsWvbJw
         Tqf20vv9xxuXV11qC09pOklz8NXw+raJFc9zcOfCCQfQvA8YQGK+96xSpJG6wPqeDOP2
         dQVA==
X-Forwarded-Encrypted: i=1; AKwUvBxPINcFIZRPMoYZkkqWTTOVEGhtpDpz9oAq9zsQOS2mtxSKezxVfRg3+ML1oP0Fq6cc4cCFMkEkCF5oGv8=@vger.kernel.org
X-Gm-Message-State: AFuF++nVTjf+jRtkSInVNqbw/RP+eXd28P3Zv1DUDGrb3DYFSUlLgHTB
	sWT/eqFMbxd42evbGZgdHNtFerVeTs+mpCSCFlrNTT8BsyEPXvMX+prl5T5iNDTKY3kFIO0D30Y
	IlEfrCn8J2RRP3YFJv1r9Xyxc86ZgPK8Y/0agxwB9z3E=
X-Gm-Gg: AYBFou1QnDGxKZzfOV7AxqccwJiTlDAOFKvNTdKRGk63c7m9ptJ/aVK4RqxoE8nvHE/
	eNcF4hPeP1Rhc1xH204UGovYzQn88DE4GblIOWgZzzI/MTrtCtrJcugS0IKBfFsTQ+ftrE5u1Xl
	6cjmRRA+r/HyfKodt/VqC68dv5vuW6LeR06Mpqh8GHrzgSzCFT2pWxidsYNs+5V+6VNc/kbBjre
	EhF5uh984tmM/r0o5FmVRKNcN79yIiXuEQCcO0CPIGSFUxiRFyH9uPd6eag997I+l+5FwSVnHaw
	8YwjUv3N7CrPMufNUfS+SzVwg7Da7oR96/50i+LLp5vkCofct0UR+Y7dfny0m49CO/R8hjcSQax
	Lu/M=
X-Received: by 2002:a05:6102:158c:b0:784:b9ec:913f with SMTP id
 ada2fe7eead31-78a1f1e91famr2790327137.5.1788391246032; Wed, 02 Sep 2026
 16:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902104207.1820332-1-diego@bynar.io> <e5dec57a-0186-4087-9de4-5037f0a09879@redhat.com>
 <498fd2508ad66ac9d8fd19cbd4b4a02b@manguebit.org>
In-Reply-To: <498fd2508ad66ac9d8fd19cbd4b4a02b@manguebit.org>
From: Diego Oliva <diego@bynar.io>
Date: Thu, 3 Sep 2026 00:20:22 +0100
X-Gm-Features: AcwNN1Uq89CVK9SEpAncgGJQrXQWyiuzoucQNLEbuPZ4hbh-lgr1YZwMIHkcJc4
Message-ID: <CAExJZk3gfbM4LkvN-zJGt6sQ3AKN+huZuhEatMswx2nYHyu7Og@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] smb: client: fix out-of-bounds reads in CIFSSMBRead()
To: Paulo Alcantara <pc@manguebit.org>
Cc: sorenson@redhat.com, Namjae Jeon <linkinjeon@kernel.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:29=E2=80=AFPM Frank Sorenson <sorenson@redhat.com=
> wrote:
>
> Your patch 2 checks that data_offset + data_length fit:
>
> +               } else if ((size_t)data_offset + data_length > rsp_iov.io=
v_len) {
>
> but I think you may also need a lower-bound check to make sure
> data_offset is at least sizeof(READ_RSP):
>
> +               } else if (data_offset < sizeof(READ_RSP)) {
>
> otherwise, the data would overlap the response header itself.

Hi Frank, that's true, thanks for spotting the missing check!

On Wed, Sep 2, 2026 at 11:32=E2=80=AFPM Paulo Alcantara <pc@manguebit.org> =
wrote:
>
> Diego, do you want me to fold this in:
>
> diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
> index f3cba16f6e17..f9aff0712794 100644
> --- a/fs/smb/client/cifssmb.c
> +++ b/fs/smb/client/cifssmb.c
> @@ -1742,7 +1742,8 @@ CIFSSMBRead(const unsigned int xid, struct cifs_io_=
parms *io_parms,
>                         rc =3D smb_EIO2(smb_eio_trace_read_overlarge,
>                                       data_length, count);
>                         *nbytes =3D 0;
> -               } else if ((size_t)data_offset + data_length > rsp_iov.io=
v_len) {
> +               } else if (data_offset < sizeof(*pSMBr) ||
> +                          (size_t)data_offset + data_length > rsp_iov.io=
v_len) {
>                         /* check that the data lies within the received r=
esponse */
>                         cifs_dbg(FYI, "%s: bad data offset %u length %u f=
or response of %zu\n",
>                                  __func__, data_offset, data_length, rsp_=
iov.iov_len);

Looks good to me, thanks Paulo!
