Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9C447C103
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233501; cv=pass; b=olfXH6ruEU9VVOUVoCebwyF3jC/LHJdJLs4Hb4kKPW+XIvMVLtDQAHO2HJFwnui87cJgWTAn++Db7phbwUU+3GCXsGHGaHAf3jUFCrAP6QgXgV/ZwlL0meyOfAmWal7ze9LPXvx54XqRWNIYiLlVfducW3g3S1RsMSn8NCIGeC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233501; c=relaxed/simple;
	bh=rUjDD6U/Vk2sVzndgzGKR20/1geXd0fQlZah3gocmXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvqjgvMJbUkdMAp80us+sF+vCqB4+BdLojap7CD/ETTqHhPj8Hrk45ZXPnqH2c9SDzS25g+x8Bf6oQcCqq+tytklFHJJ+QuP/v1Dvft7W+jjifD1rCjuaUXoNvqxYeK+r/4nJTOZCM32USIrpq7te43xh0iTo/Gheo+FIoJQWhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=j5FIfqGu; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="j5FIfqGu"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-679a2297c55so573816d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:38:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792233498; cv=none;
        d=google.com; s=arc-20260327;
        b=d2wkpInIT5RBdABAJXo+icVGmtFeF0ojFVVSZGchxbLH4MTV1NSC3l2sX+7B0BKRRe
         8JByvLiVIqMQ4On1QEoBJbqgn3g3stMtUG81CdbVX0pJTBFDKufPB+OZ1HT51aI2KWqA
         +oLeSSWlFvTVIb5mPuECsZ8bpT0oGAZ1bo9AKSG/TrZKwXWOYKRvBZDL1zEd5yr5aacl
         Fs4X32fYfkX770guckiHwtjgWOFz5s2zl1b4mMalIOdBWPCrun+KgZkarSFOvJVmSu/2
         x4ITo31SQyITeShPVRLSszucJS0BhQMT6HcNKLsZwHCxlxy2cC7ccP0MnX3JTwe+9Qbp
         owdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F5snhMS2ueW2Cl14d0N6Rs5a/KC8OfBoDlKdn0Y41pQ=;
        fh=R85QFbWXMAd9vCUxMnvJR0XsglZ1gmoAt2/WJG5YwJQ=;
        b=e/rf9MqXbvS0XTDzYJ0eD+svcPvRUJv9W2pESGmg/2bBelf+gIKeei47HBK+6jr5qH
         6ySGJhYfF/KLjCOmJcoOQzm5Yb295t/Zs7ZuW0veXSdIt8iFByzdryOLRxh/QcsNOrU0
         rY3LbTPpx5/7tkClOezj0q2B9JhAh6HoafCyHth3crPSIJ3ZiXwMLMbJpWOFoeswKyiy
         BxFLEE3tyrsNiCQcOVQMRBPYrF8Ct352lprj4CeCo66IGPmZi3CfzkCCA6IZ9XCA3wGt
         8PohcBSHn6lnfKQie2AMpFR34P0zBcJp860tWB08DToo8yXIKRLUzZ7Xu/aryrl/O369
         QWEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792233498; x=1792838298; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F5snhMS2ueW2Cl14d0N6Rs5a/KC8OfBoDlKdn0Y41pQ=;
        b=j5FIfqGux3fWPogqh9AjX7mbsEajb8T3Hc9zBPl1s2yym7aHtAUq1iQb9AHiWggeCU
         F2QNt/qbXONFaIC+kFNWeGATOeYftLvZJn4VKyIKS1B9pKMnnFU3roPVajtluDBLSeKf
         /purfHugOIFBmK+Ii2pHRfCTZJNpKg60OB+QGnRv4PyuK7573FBLEEhPHmDdQYV277FV
         VrQE0xbsvgJkdGCBvl4NWNO5J/GeCzuZkfFqU55QiQQEFhrVtd1r/TJTCOsKBmO0E7y4
         62axBcQWHkTljhPY7MptIXDcEOEttFCRUbKBt2fU/rqtFfyR5kTSc1zaRLdPjG5ksN9x
         yhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233498; x=1792838298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F5snhMS2ueW2Cl14d0N6Rs5a/KC8OfBoDlKdn0Y41pQ=;
        b=zx6m7T7LMx7QSwNXVewbqWjVE6EfPFC1uLmbCEiMwyla6ClHH4SBvpZV1floUnyrQp
         7CLOwcX1A2CJJylv1DRHm0L39aXmdSJWKQBE0zseKqKijhq47GVZLg9+YXi2e2xbEP8F
         FJBUWxA8gPRyDGbbLOZz2qzLBGN96plt8gze78y9US8oOZnjggtxqkZd43tu6tMd0yhq
         Xvp50Kkfnwdof947RPhQCaM8XhjBlhkOLhwxU3c4dJLX73tZ1qO2da37pNpaGvRxk+R3
         DaEkpJhuCue5HsW7FGsPgVwOY1WYXTMQisKxHBWn1/luhv6Kt8TNwWHjToXXz7UA1PLW
         FZkg==
X-Forwarded-Encrypted: i=1; AKwUvBwlNW2COqnUy18EHAFrzMs9zxXz9NUQhKWnWF1qoOOQfNb4NNhoq8CEZd05SbuqFlLOrc4p+n/RWDRIVMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU7nM1kTGPqwoSJdV8oUqdrgkJrFDFUHdUY40gTzP4vr2ibT18
	PZ0x9yr6zYFy+K7XTLzAY1atWu9H2rPFZk0J6jK1dOrPxPEmZHz0sf3zJ6b9b9DmzEYrtJbsbc/
	67Z2NhRCzVlFl0k+jZQDnKaOjOzKO40sbJaxt/BRE7RxPaV01HlBM5KiT
X-Gm-Gg: AYBFou2ooEtzKasyC96qE9gd5V762jQOyGj7lsPcyN7FxTj670/f07dwveH4TIaTbyS
	T6SZlWV6ib5h2+uV9hZMuCRaf5U0UoCXN0KKhgp9nAJ4f4b3eJoytUzRrTcX1p/Vi2KphbaQpZB
	ttgnfFwr3nN0Q0d0kRpb+svEL6MYURZBh6Ciadf9fu59V6S+6WPnTiWb6g4P+0k3U5OP6gOLgNj
	01NSVlDijYJrNUohNOpHQ4wRoBrUj1C6QEqOMcyFG1aaOpay+B0llXFZNnfb0Fz5W1haM1IfInV
	GSjiFK6+PWg2tqAhEGs6gDQPEijysXx9TKVwVGEjA/VmIBVbz8Imo+G+pBIIA4ry3UQfWggbzxd
	J8P6x0D6VkH75pOimpjDFDKCvq7sydktyBmyh9gzFXoQcqfdxxspRR0NDX+NJ+VD01cZp4MnqJg
	zykWAlM+8/bmIGx7JNLxylUTUAi3UZOZIGoW9zROn1+upnsG8HC5VdZqR5B0e3X91TwWq9OHDI0
	lbzppOjoWDDXhgzWdQmVLbZdGRTZNv3QfLAez4ZBWR8HzF4GrmkKMHZS2vOHnDgb2PvnxxRMIXH
	Y8pwB2dbMA9HSw==
X-Received: by 2002:a53:b547:0:b0:679:aa23:4150 with SMTP id
 956f58d0204a3-679ca906735mr433421d50.107.1792233498275; Sat, 17 Oct 2026
 03:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910071838.1983652-1-julius@bairaktaris.de> <CAC1t37+f7+CJ+kBSe25g31fMWE65hme1m1gvB7ZZ_Ydvmce4vQ@mail.gmail.com>
In-Reply-To: <CAC1t37+f7+CJ+kBSe25g31fMWE65hme1m1gvB7ZZ_Ydvmce4vQ@mail.gmail.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sat, 17 Oct 2026 10:37:42 +0000
X-Gm-Features: AclHuK9YPhV95_cGbl4XOUUVArJb9QpR6dXPUyjfRBwMk0R7v_0JU9GGfaOaYu8
Message-ID: <CAC1t37KfVf18kbwDqHkVgSFMfAykqbh8th33362Sw07vTt9sMg@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: request firmware-2.bin directly
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jeff,

gentle ping on this one. Would you also like the same change for
ath12k? I can send it as a separate patch.

Thanks,
Julius


Am Do., 10. Sept. 2026 um 07:25 Uhr schrieb Julius Bairaktaris
<julius@bairaktaris.de>:
>
> Hi,
>
> This doesn't change functionality, but log lines like
>
>     Could not find firmware /lib/firmware/ath11k/IPQ8074/hw2.0/firmware-2.bin
>
> confuse the average user.
>
> linux-firmware does not ship firmware-2.bin for IPQ5424. I don't have the
> hardware, so the fix would be unverified there. Would you like the same
> change for ath12k?
>
> Julius
>
> Am Do., 10. Sept. 2026 um 07:18 Uhr schrieb Julius Bairaktaris
> <julius@bairaktaris.de>:
> >
> > ath11k treats firmware-2.bin as optional and falls back to API 1 when
> > the file is not present. Request it with request_firmware_direct(),
> > which does not fall back to the userspace firmware helper.
> >
> > Closes: https://github.com/openwrt/openwrt/issues/24743
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> > ---
> >  drivers/net/wireless/ath/ath11k/fw.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/fw.c b/drivers/net/wireless/ath/ath11k/fw.c
> > index ef1b4c81843a..88ec2ffd9f00 100644
> > --- a/drivers/net/wireless/ath/ath11k/fw.c
> > +++ b/drivers/net/wireless/ath/ath11k/fw.c
> > @@ -16,10 +16,12 @@ static int ath11k_fw_request_firmware_api_n(struct ath11k_base *ab,
> >         struct ath11k_fw_ie *hdr;
> >         const u8 *data;
> >         __le32 *timestamp;
> > +       char path[100];
> >
> > -       ab->fw.fw = ath11k_core_firmware_request(ab, name);
> > -       if (IS_ERR(ab->fw.fw)) {
> > -               ret = PTR_ERR(ab->fw.fw);
> > +       ath11k_core_create_firmware_path(ab, name, path, sizeof(path));
> > +
> > +       ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
> > +       if (ret) {
> >                 ath11k_dbg(ab, ATH11K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
> >                 ab->fw.fw = NULL;
> >                 return ret;
> > --
> > 2.53.0
> >
