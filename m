Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1A3C8713
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788393396; cv=pass; b=elj4QwkttlK2v9WAGo0U4uveS3WpgcAMakP0JlwzK0LMy79vTD05p3cZcXkbqCAMFIKP+S1jmb8VJRVlQmvT+jB3NdipEDyJGbyiAi1d6trPbG37TFI0j5Blj7cyLMEe7yNpHckQsh288D6sMCJqXMSf03fPRYmDDp0JXVz2pT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788393396; c=relaxed/simple;
	bh=IJhDGleDTgY91qpLvvE+dNdvhrQblJ9A1FgCmk4NQj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzczCmuj132vkyv+/ehz/6Fum29+3QAoIY1Z9Ck5eGgJpmRHzYoto3Xyy4Qcyz7ZQeJZhnEah/3yOPpYoXf6LAoBgEhCuTdPUMmnWZ6IXl49IGpu2E1pGeyBSXot1KmXEJY1h70fXj30WbbK3y1yT33u4Di7wUNNPUMHEsFLORE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLXKUxor; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLXKUxor"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97ea365dd68so760079241.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788393394; cv=none;
        d=google.com; s=arc-20260327;
        b=o0htGiuqo6Sg29/lXjsvUyyczWjG9avXyfD9V1sKCIk+29dt880BI6pFfgCkq5qrFY
         WpvszAHkOA/kREa9ApeB5tbweaLssLDgL04GHTIqN2GLlUKn4GDs0BBnCKWSigLUFv6z
         TXxqthr8grxZ3Ohrwl9JEiAKjA5TNjVNxPr30yYJG3PwNTnSnF5/vJeFSAQlqJw7pmGX
         qbSVxWVKjHLrHM7I2275LehoIvGgLGw5WP0Il5ZBXjtOUDdkIf494wCorXs5hS99+8g1
         /+NVenR38u9/uNaqdXzx4SnfQNZaB0QGzANwZXimMtFZY6rEqQq4oteMRaN2uUc84yVS
         DPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UJZSL+LFGxz2Sekirt7LIG9bYUqyGPk6CPn0ZxX1C8E=;
        fh=QeuafHJlVet2Nghp1ccF/bz7vkaGlEsSQTy6JJcxxKg=;
        b=M6V8hgJ9xnTkIZwjqnnDFSVtHViqHgdBIX/Par29z7pzbgsBfQSEEjWcNVtGVkZIJM
         kBDx32YfN/iI0J9Ez30/19nAzGn60N3Freny5dvk0iKL0xIcM7G0070TeaeCm8oOGm8B
         gMTFPlZCMJmGQVvZECjXBn6trQppGt7+ubG4rvLb/xxAkEmef2/nySBUynveW+CGTiqR
         GC2ueTzwhh5752nK3EsUs61afdfFqcCNfcYJ/mMYRgpKlXEF4+99XaKqzuMqJ8TIBL+m
         sCj7aWckD2Sc3ATfP9hKWx0Udo5CkRPq055rkoeLo/NZQlfK2AKCnzG5wkdzUW4Ja5/N
         tndA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788393394; x=1788998194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UJZSL+LFGxz2Sekirt7LIG9bYUqyGPk6CPn0ZxX1C8E=;
        b=NLXKUxordYUWHxGMlOvnnCatP122WgGsb7IqHJ7IxC6FstavyqnUOS7faXIOjABSRt
         6J54Rg0S4grLZD6h9nOCTUn/kIdvJjA1BUVSt7+BeiFs9jIyM3gugRrwVPjF0mEb/kf1
         EJs5ixYiEH02LSyCaGuX5ngg6OC5zf/auyuHwrIS5kt8XhV8D3IeBof8X9+7m0Xkqz9G
         XU7QwMLNelqJcBt3Vapli8Iu0mx5a+ZQ1FSDPtVY/LyOPk7uDjMHsfjbeyPuk3EgBD8J
         kgeEKkhpeg/d7EC0eCUkW7fp9M6zjNzQc1AhW+TxF3kDnwZsvmLIICOjO/68JzA7ufMi
         bAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788393394; x=1788998194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJZSL+LFGxz2Sekirt7LIG9bYUqyGPk6CPn0ZxX1C8E=;
        b=F70LPFqol+DZUKLbxm0yW+zWR9Uqii80apX9zfJKSbdf6OyNq1GaPLVbnKr+m3j6LZ
         G9jKwchCg+LfqBK9PK/1jEqKLM2ZhShr8MnGl0lBH+BJYL+WOMQSswQKeqppLG/Gtmkx
         TLtjJiVH84f7w40a8XrUPE8k/ErTEGeZRGPadZadg9ZMQXsli6MpFF6DnIgrvO2S8gdr
         O8lukvT3e9HlTxnKKJqNZuI2forBvAJzqFlrCGLZ9v9ah/TAvREvzCMs+BqdOPOI7vjG
         2YPvl9EsEyhtTabCi62gJDu1LTDObYZLMhze+qi273nEqe+h27BAUD16I8uZcutSa7E+
         hAnA==
X-Forwarded-Encrypted: i=1; AKwUvBxCcSoqmpsUzx84Jl903SgTifMsGS/fk9Fg/DpA75+XHx7M4ZXIzs97B4tClv6F7ikJNn+vD1KXjkR7KlA=@vger.kernel.org
X-Gm-Message-State: AFuF++mT+b16Ueg1vzrP+2gfzl6ACSGunHs01oSLjK6IzjD0i5dVHX8A
	WW41NxNHgd2d1h7yiJdJiD2hI1Bh+4HkLiChrdOMRxStCiG1x97cwZKZ+pxvbOhrQHUl57IRGUh
	geEon7FZFdKCMLR4OTytPB0jhKb0QG5I=
X-Gm-Gg: AYBFou2/TCZaWXnw4oOsI/5tS9dTrgGzefY2Cy6SuHdrrl8rQNYgdTqaJz1pDzMgw9b
	GgWa7Vg9+xP/IfxUN5tPG7KQgUKV8+CJnmnRJ/+E+yuh9z7ljz9RClBktfMFETFg5uvRPeWeor2
	Nz0ciueLgfGk0Su5t710eFUajh+48UodH1kpKO9SlkycRnDNJaR2N0AmKPkUHUp/Xq6JOtk32CE
	2zVlRpNDMm2TjZlGPbCVnNZjSLXKgbEyTqri5UurWeb1agVwQEZMw9g4uReCMMM9Jvw9KjQpDf1
	h8BzRb6sRS8ExyNjH9QKFNBxjSNuOQqmx3N9d0Wvxk7pbg==
X-Received: by 2002:a67:e704:0:b0:77c:6bdc:824f with SMTP id
 ada2fe7eead31-78a1f1d4903mr3745636137.1.1788393394099; Wed, 02 Sep 2026
 16:56:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826191033.162320-1-fredric.cover.lkernel@gmail.com>
 <20260826191033.162320-3-fredric.cover.lkernel@gmail.com> <7f87f15e7136147297a33a540f0880f3@manguebit.org>
In-Reply-To: <7f87f15e7136147297a33a540f0880f3@manguebit.org>
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
Date: Wed, 2 Sep 2026 16:56:23 -0700
X-Gm-Features: AcwNN1XDlDR860Z9DX-queudep_V0W64AlYD126lzdzAWwbcoUccmxpaxtcDA0s
Message-ID: <CAAk_H6H=YG4+ZpJRHGaNJC7AWBEHFFJrfy3z=93sh4-rPHcNJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] smb: client: prevent out-of-bounds dfs_info3_param
 access in copy_ref_data()
To: Paulo Alcantara <pc@manguebit.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	Tom Talpey <tom@talpey.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paulo,

That makes sense. I originally added the check as purely defensive programm=
ing
because refs[0] is accessed unconditionally at the end of the function, and=
 I
wanted to guard against potential future caller bugs.

However, as you noted, parse_dfs_referrals() already guarantees that numref=
s > 0
on success.

I'll drop patch 2/2 and send patch 1/2 as a standalone v2 shortly, which wi=
ll
also include the removal of the redundant ce->numtgts assignment in
update_cache_entry_locked().

Thanks,
Fredric



On Wed, Sep 2, 2026 at 10:48=E2=80=AFAM Paulo Alcantara <pc@manguebit.org> =
wrote:
>
> Paulo Alcantara <pc@manguebit.org> writes:
>
> > Fredric Cover <fredric.cover.lkernel@gmail.com> writes:
> >
> >> Currently, copy_ref_data() assumes that numrefs > 0, and unconditinall=
y
> >> accesses refs[0]. If copy_ref_data() somehow is passed an empty list,
> >> this would cause major out-of-bounds write and read problems.
> >>
> >> Enforce numrefs > 0.
> >>
> >> Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>
> >> ---
> >>  fs/smb/client/dfs_cache.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/fs/smb/client/dfs_cache.c b/fs/smb/client/dfs_cache.c
> >> index b0388c460499..b51c8355d73d 100644
> >> --- a/fs/smb/client/dfs_cache.c
> >> +++ b/fs/smb/client/dfs_cache.c
> >> @@ -389,6 +389,9 @@ static int copy_ref_data(const struct dfs_info3_pa=
ram *refs, int numrefs,
> >>      struct cache_dfs_tgt *target;
> >>      int i;
> >>
> >> +    if (WARN_ON_ONCE(numrefs <=3D 0))
> >> +            return -EINVAL;
> >
> > I don't understand why this check is necessary.  All target referrals
> > come from get_dfs_referral(), and in case @numrefs < 0,
>                                             ^ @numrefs <=3D 0
>
> Sorry for the typo.
