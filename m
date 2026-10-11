Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC04248F57
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791732799; cv=pass; b=HtL82kvMoKAvnUvkrM2fYuX4h0ag58ubD4onK9HuQzmq04+EjD6kXlR/dY6qC77yrSJAOfbDT/xB3q0hr+gkfkDRgoPf6H2sDYUXX6NR/Pvi5CazzJjWSvqI2iwkC0m8TVoVyCR1CKC6fFWPjjSuT9lxKAJBd6gtQLWZUTS/QNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791732799; c=relaxed/simple;
	bh=s7CDEOu6ovjW9RfWhQGLcOlEG+04KKcEFMU2UF6N6E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KC5oZeQHkT8XYREfjEbtJcbBhcSKe7hFemyKucM8ZUO6KWXG+Am7d5uMpAZIAYBT1/5o/b6U8HOuJL8G2nJl7k92EVq5A8uk6NL6LeR6mYYVXO9ilC4OyT2SLIuuZT7aNYXLblthhqasJZ/Wuiw+Lwv61uNN9iHywtF7HhbeJFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa8u2Gr9; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa8u2Gr9"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab37e44643so5982347b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791732797; cv=none;
        d=google.com; s=arc-20260327;
        b=eDTeVeGxQXGD3I3JKcdL/2WA+ueM1i6RgSYWy/S7CSNJUEo0u9dGERdCiMiK+qvydM
         LMvMhfFMZbps3rdgDMX7+B91fDojINLI0aDTT4VLJW1hC+L88NtEtW0eUnPQyG8iB3MZ
         iJ279zThFRAsPO9jDATR6oYXI46i93sMaDtH+CnSb8oFwybGlr8YQfoAa0AWt0Fcm4wb
         +D+hpL7ehoV6OKI4BfwaeOqFipUptNNivc+9VREtrdh3PXf3O9isvYcWjWTtszVUh7CJ
         OzvLbj/+99yyhsG+tn+gQxjdU6MTF7jhRoytkF6uKB2Up3ZfQfU/ER2NZEfSA91ccXNG
         SJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7CDEOu6ovjW9RfWhQGLcOlEG+04KKcEFMU2UF6N6E8=;
        fh=Z+7fWN2bt1v3Ohg2rAsd77PdS3jQ+9idcbpFi6w1Pco=;
        b=fSFVpqntB9QXNWSt3Ndn3OscBbbqqYL06G1rAuDMUKc1b+A6somHkLwn9kU/IbBR2+
         uBv/PjZ89USP7gYEIt6pvDtgoy4BTwqIdFZt4RIwmcDrLu6AsIuoRKIHmZUlyGw3iAnO
         XM4PhIwURFa70v7Zekd5HNbNLS69bJq4HtXq/8/EYP/xeLhzPFFsWR+4moZEBMQVWyC7
         mmRldQvXxb/i+McCd155PcsrKKl2IEhunn5+sN8R8Sw3cjrKu64rOt5rZHu853CPChUj
         p9NeOFH41UH4qrfHn1G0OaAnk7SJKa/0PBc4MHuVZf9CLWwyE3Ht7efl0Ad4QTyRKLRU
         RRmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791732797; x=1792337597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s7CDEOu6ovjW9RfWhQGLcOlEG+04KKcEFMU2UF6N6E8=;
        b=Sa8u2Gr9wyz66yQmQyj4/teIPKEfYM2KmO1YuC+81RQyWNEatMlhIf7LlCvRRZWQiL
         AXdvN5ZVgLO4WD6Gwwuq6IBfj0aYYI2UW4W4dQeLBI/HyERHrPOUtpjpAsPHH6kG7EKd
         KtjpLXdoyb24BfjM9j6sr+jnuiYGFZFU+NkPueUnIVXYq8r1i7vd4h/CGb/90+IElfMK
         ZpGEBpMYvsaAbQBkB4BAl8R8OLHh2StnPD4h+sVco22Mxh/DH/MSoBAZgqdaZXvp+hB+
         RkUNVnHFNrL6ShxNJj+8DhGsEPPOYj4EqzzS7SDhCyhE2wRLdxWOdKzvznPTGejBnNth
         +A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791732797; x=1792337597;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7CDEOu6ovjW9RfWhQGLcOlEG+04KKcEFMU2UF6N6E8=;
        b=fRWvfzmfIUlTfWDJnKLvl+LyeYqbFFSaVXL2UrBavmIuVhMsM5JeY4DzuKO3cU7dac
         1VrnByPzLasFzZV3OV7zNWF/Pbo2O9xWHOVSCbBkN34rbqfk2krMHdZdpSPhlgagHt7z
         DF77GKIY+h2mMxJlA4y9VoZY0xTacFMkdUtBzjrKBOjOSs1gOdGXTjyCvByQAITf3Als
         y2DghxyQUAN33BMnztbz+rtu314oDBrd61tmje/gxPCSRUnWjuQOdhcZkBBqmiUbMKrM
         3MqBIicVRWeQ9uRzS8hiXkK9ET3H3DA0yTG728v65nUNgK/UPCxLzuqnTc8dAf/2SqDz
         rMEg==
X-Forwarded-Encrypted: i=1; AKwUvBxxjFqtwpxayslbL4IEwRfaTnYEnurNbmBkUI+BE8QHKl/ApdQYEcWubjJX8deC7Ywbud1HohtQvRjaaEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAGjEBq93e+ADtCm93/FMHSGgCPgSySqvBXXS9pyZj539CxXSE
	b0DTJPeS8G4dTgFqwB6uzgVeSIlXT7RcPWH8z2KXS/+HCMYlOlzkdhHOtZXDEE8gYYYBKfldXPh
	iimijlrCgok6tc+dyREa3Xx2JeiL//e4=
X-Gm-Gg: AYBFou0GDKdoZ0cJ5yKB1w3jxiroLf4eHpKYTR+S3T9Nu4PKQ7jXT8Qh9LczieU7qL0
	/VHDKtaKXEBRRNeL6oNckDiV+iSrb+SdMaOawmDoPhg4+BTCA9ZAEOMcmiM6W+UM7HO2mEVHPr6
	xJGb2/Nd7nr5+uq0SggbHOhjlW5lVsLrsLuNr+aCfZBykxbk49/afnf47tNLEvOlv3u+xIpoZwA
	J2dzpUNhlT21ztPcCWctW4rYcV7d0EXQy7dFinC9mR3HNVuZJQGKhY68tTihWSSAc1B2AzyPIuE
	sW+q3ct06RBqGJH49YTSrh3A8KqXG8GYgBKEZWu2/9EFr00XVxNU4jRbpQ==
X-Received: by 2002:a05:690c:7108:b0:8b0:6722:6739 with SMTP id
 00721157ae682-8b07ebfe3ebmr23637547b3.9.1791732797587; Sun, 11 Oct 2026
 08:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0049-v2-a5d5091b8900dc3f9849@gmail.com>
 <9227ec1d-0de0-4e43-830c-fc60d5f8b2c8@linux.alibaba.com>
In-Reply-To: <9227ec1d-0de0-4e43-830c-fc60d5f8b2c8@linux.alibaba.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sun, 11 Oct 2026 23:33:06 +0800
X-Gm-Features: AclHuK99tTm5H4HFpawLz3h54s0hNa8_2ptxeXmPO3b0n81uHbquxJ8gVQte-Eo
Message-ID: <CAFRLqsW-DH2Bao_AoB_vqA9xTDom58PoEmV73JHs-FP-o+cd3Q@mail.gmail.com>
Subject: Re: [PATCH] ocfs2/dlm: Serialize recovery list teardown with debug reads
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, kees@kernel.org, jack@suse.cz, 
	rppt@kernel.org, hexlabsecurity@proton.me, sunil.mushran@oracle.com, 
	akpm@linux-foundation.org, Heming Zhao <heming.zhao@suse.com>, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joseph,

Joseph Qi <joseph.qi@linux.alibaba.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8810=
=E6=97=A5=E5=91=A8=E5=85=AD 16:48=E5=86=99=E9=81=93=EF=BC=9A
>
> The race looks real.
>
> But I don't want to involve dlm->spinlock for list dlm->reco.node_data.
> While dlm_reco_state_lock is the designed lock to protect list
> dlm->reco.node_data.
>
> So why not add the dlm_reco_state_lock in debug_state_print()? This
> can keep consitent with all other places that access list
> dlm->reco.node_data.
>
> Also it seems also fixes the potential list_add_tail() race in
> dlm_init_recovery_area().
>
> Thanks,
> Joseph
>

Thanks for your review.

I will revise the patch as you suggest.

Best regards,
Cen Zhang
