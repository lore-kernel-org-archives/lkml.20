Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1249235F170
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788083617; cv=pass; b=PkhVYtNMvxqYKjR8d+IIiOZ/Y361MLK+JGJk0uhzcsrLfkwaSm1FEJC/7bAswcsSDW2+C4hF1xU8UHHfIoUKpX3WPsRRO+DJ0V7+6GsbYVDtQ1dWBNWuccN+LxFjKI27rfuelCgFqZW9HD7UTNUU0gaBVvR6VheXDKwd1aYBMDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788083617; c=relaxed/simple;
	bh=noOHtdEDHEPP5QeHRvdNfehU3w+1cJ2qwt7n8s1SjvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/jJthwRm1v5nPeU/dCRuXVbfgiztPXTkTW8SOPYdt7MmXZPxofOOZJFeBVfpwDHXnD0L6Bj5kOBo8zSP13be4nphXHmFODqQjCraeoqhjAbmz63+HLOaBeN4MtyooCuFgUQM5ZzQPWzf9F+6Pq8ZYWWSzzgSUdmCC8+Gm/8JA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iK1YSEwh; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iK1YSEwh"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52fac937235so155361cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 02:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788083615; cv=none;
        d=google.com; s=arc-20260327;
        b=dkL4r4kV2VD0oBCMRiKsXJjIUPccD4LxfCjUXZ6ng5mNAkHMU9PK1+U6Ayu4QJbUPQ
         qviRGkjodSpf5GKm3cqe2Hos8gejOz5uLMGiNBzaFIsfYsu92x+G2fV/N4BOeUkuTwrc
         b50u6F6wZPIR3Dt/o9eCp8/M4y3LAlbLNLleOccfb13keQWOw+ADBDnd6yYMVEb1TbLF
         dIyBO0wIeL/yt8fgQhoThuohnz1MKnBeh7a9/dSwalAPkUu2FqPYp8mfYMkz+knsw28+
         WP/n7BZslTso98DDrJtGlMQETIUFLLPB9jr8clP1c1p/xTijHw2hM/79cnCsFNmCP9bO
         O7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=;
        fh=eMy5i1NOf6nTuAiwmyYa7gOIrBkrfmwPqXXNQnMt4Xo=;
        b=Yro372BBCdgCaNeLmyQxZo6UB+fPT3xXOVL9a57aZSmI1xc+PbKTelL36rM3iCYmQa
         ChToX2BQLvHLDsuQgsbAKhExDDTr/kIjTl99nlRK3yvmNwXr88crZccmXkjLOBCBol4w
         Au1Xd3BZ+oxOT69xZRylqMv1stf+J4lB82duoqN06hfAXUUuLmYhkj1tn/9atik/k6pz
         +MGqKCpiUs0EsnMJegD3Q6sMx3vynsSgUoI0a8kqEGXK9Q3jyb4ExoVcIsd6QgtrXM7S
         nVtVUzSF5rj5P7gJXkM+ft6o6nojc37iqqKlMbSFwXhnOpP5lmfPOFeHnZjRKnO593UW
         ywcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788083615; x=1788688415; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=;
        b=iK1YSEwhvz2bARYqHaACpd71HzuzrHQ/qpMzh1CTGxpiLis775HXkl2e932mrDkKAT
         vcGlLVLf45tf1/iPYBi4SXnGB8SoECgQTDlUm3nqtf7JytOO2OtBBkaozi1ydDm7TFXF
         pm6EtX6WxEDDJBcGMwEVnUk7AogjHa5+QvF3aRvelkvJuw4EOC8CJ2AsQMHdcwrYAxTL
         QFpnn1DvGA8a4hprOQ/3JgUowQ+hTacqd+11yn6KdZcKxZqNqL1C1vIpPGlj/ILLvw66
         /yJVERsrECDVieqoK9m/xBm11OQzh+YPO9KG1wzwSNZJkno/OvwLlDjve024LAFxfNuG
         OSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788083615; x=1788688415;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5S6aFJy+mT5uKBC0KX5FwDzSqvoGmSboVBAKwD0uv/s=;
        b=YDZg/oM7ANEg6eJTomIsVgyNdAekdUrOqD9yvWq7JcsPgWtcy+lR1RB7WbsmATDLB/
         nJowZcxEV4xJ40Imf0/ieqPwM2hQtb08V28UiEojWF9LlyjUKWGPJHNSEPEMDWrRo0if
         mBJyjoxBWNnCwQ6ZNRhb8LD9QkQBB+tPa5pd/2SiKchenY/b25Ei3dKibT9BlocQk+2f
         4ZK2I/oIOHA03StuSXv9B+RsXhl0yvy1l/uqBc1TLd2mhVcDF83UyCkTkxlKfvBV+3s4
         /eSjFjfePWhqV27Edntp+wfkDyGerT8qgK07y5zGR6Nzn6PtzUsDGb1X+i6pU7OzW01J
         ULsg==
X-Forwarded-Encrypted: i=1; AHgh+RoCznIlOKyky2ruz+MWaPJMSh3q6fQPkAddNxr8V5gEiOsdtZwsIuCGF1g9sPGs/SNSpJ2JWFagt7CaJxw=@vger.kernel.org
X-Gm-Message-State: AFuF++lpWyErQkemvrW17+IPrlti+9tmxoxSzyiZHoZL+fmXA23Wojh3
	+rfdhrKpexB/LmWhToaN5oY0zzc+Ry1xG9fzbC61bA/dD+FAw0LHeyBkss8nt2ABDm6ugg2eLBJ
	WbmWovUIMoyUUU1ghiDUGv6WLOrAC8nM7lfQUgnVW
X-Gm-Gg: AR+sD11eExPXg2q/Y5AGsvQs97EpakgVK7XfL9sZuQjyt+TNs0STrL2k+qXNFlqfk+a
	xS/HTDKt6qfLVkh3USM0TQs/FZxSlrqB6IwiwC3woV59ei+ETE5lIut5vDkPJ13ad9Iccv9+PNP
	pSdLiGaCHHny5MPxPs5cuvPF1AhoRhRc+4uKsLojBwboTv7Nrpq9BYgBLyKQQu+V4ijI2XOfp7+
	W9pGaSitVe8oLFjxXG0gNXTdtt25IUgybUNN9Ilsi1aELiWsiToAT+vb7rOhZwMzvm2tvDp17l4
	iNpaOreqPwUuJsGPJkLEpl+YiIwlAusQYebfdb9KR20reSi/KS3S2uG0tpEb7Mono1NeKtSmJIq
	Maw==
X-Received: by 2002:a05:622a:190a:b0:528:38d6:71b4 with SMTP id
 d75a77b69052e-530100f6b84mr249421cf.11.1788083614253; Sun, 30 Aug 2026
 02:53:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828092311.10774-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260828092311.10774-1-pengpeng@iscas.ac.cn>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Sun, 30 Aug 2026 17:52:57 +0800
X-Gm-Features: AcwNN1UaiSHb4F9fUpqjBR1le5QyODKMu5bAeRX35ytqP7PxUTTdcqYqoVRCkRc
Message-ID: <CAE14pdeXt63__PW0Md6Vp4hfh-HTdhG=LGSRtYRLQKWk0phxew@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: mediatek: Handle mPHY power-on failures
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Peter Wang <peter.wang@mediatek.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>
Cc: Stanley Jhu <chu.stanley@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-scsi@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 17:23:11 +0800, Pengpeng Hou wrote:
> @@ -509,6 +509,7 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
>       struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>       struct phy *mphy = host->mphy;
>       struct arm_smccc_res res;
> +     int rollback_ret;
>       int ret = 0;

`rollback_ret` feels overly verbose; a shorter name like `err` would be
cleaner.

> +             ret = phy_power_on(mphy);
> +             if (ret) {
> +                     if (ufs_mtk_is_va09_supported(hba)) {
> +                             ufs_mtk_va09_pwr_ctrl(res, 0);
> +                             rollback_ret = regulator_disable(host->reg_va09);
> +                             if (rollback_ret)
> +                                     dev_warn(hba->dev, "failed to disable va09 after mphy failure: %d\n",
> +                                              rollback_ret);
> +                     }
> +                     dev_info(hba->dev, "failed to enable mphy: %d\n", ret);
> +                     return ret;
> +             }

`dev_info()` is inappropriate for an operation failure; please use `dev_err()`
instead.

Thanks,
Stanley Jhu
