Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99783DAAB6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164773; cv=pass; b=pjzYOWzdPSFikRB+ecdFQ8QAGnbniDZB5KcMIkBohs83f4SvhGoTOxd1vN2DtmBL+pQ2wnjIzc5iIcnb5SihLRJgKWeyoJ4avzQuYIcIxvoFKOKxcJcSPMjbXBoft5x6Lr6vGVxTazre8UXN5cvxzHbUekaW5Re+mUSSW+poYO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164773; c=relaxed/simple;
	bh=L50lYICP106cKUnxwcy3VRTlzI/KCvX3m5TcfCKQ+uY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=te/VGDQqMloo3vv+b2uf61GKnvl+Qu/iehxntJMVsdeGaR2j3nTief2uB/hTYbl2p7vRTyRILtBwRAj93TsZcAzAvCB6YC6ZELHFEYCF/JFIGCnFLW0ab3zvif9TZTVZELngdv2gPfF7jWWzpLvrIds8lpeAKNdaoB1abrUYgv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p9nFZFb1; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p9nFZFb1"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-52fac937235so264691cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788164770; cv=none;
        d=google.com; s=arc-20260327;
        b=m8+nMXdhwHTAlvYHMOwgdvW5X+iODTtVaEjZ0Q9OBWsiDVvq1wVn1ItqNm1l3+GTT7
         n/L9zG5bwfbe20depeeT9rg3w/1piEfh0iIU2bFFtwlmHwJerWtgFFxtl1d+N8fmRDir
         feLrjiS2/B81SNkBOHDVTQ1yetpWzaCDKa4qc4o/ZceSwF4h8sGv452jYqqtx8NDsHq5
         BEX+hd1shsVhyI2KV7Ui/uDOnEP7vMO5BWVfJ6a/8MaRAOAbewgZNG4dGTXhylV6c9r0
         kD8KgerVt+jJI/s9kQgEJp+kyjB7sAT0JACpw/kdkrIKYA90vQDGDU1j1uN9XluIA6+e
         nZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L50lYICP106cKUnxwcy3VRTlzI/KCvX3m5TcfCKQ+uY=;
        fh=TlENiqdP++rWQKoFImRUgUPbw1XhFkCrgZLXP3iY3lY=;
        b=B8fEScQpaPp5DOsTH+yVlLNk4Zn1mMHfrygs+ng2nAv8BcBsGKTsuuPY6WNt/Dy0Yd
         bwiK+RpdpktN43/x6BPkBSlW2puPtStJZ87CLyB7LfcYy3iJb953REd2E83vbFUK4SVZ
         eCcc6Rqg6gGC82xPHTLYrysfqxxEMKGmJ2c30OA6z52MhzymK/QwjhrUJEXQNyXTTe60
         59zSHLpDF6xFMG5vqZU1A2LnWmWFFaY//jNQMQOQSkTGSpi4Jq0RnxI5sgCEpNI1T8Rh
         5H2fkoBYNR0MZJpBPeaXNo9VwcJLv7/yAYZqzgxJXwgJoJyOyf0KW2KkqIWTKiJgtxBy
         F/dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788164770; x=1788769570; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L50lYICP106cKUnxwcy3VRTlzI/KCvX3m5TcfCKQ+uY=;
        b=p9nFZFb1cs9OHaM3+e5GndK27xUg/3Dqt18UoJDIrIF7fpm8/AOB0sBZ14jASYzo/a
         2vExHxx8ekBpg0WU8QvqBOC54FUJFOdk5igNxQfjtD87uykzqDpGB3qZOY+BIprIAD+N
         8XyUgyzvtVEJquzVJkNWoSNdo2byyNjiFKSJNbo3Pn8pp0MuhHVhVvg2tx/eVIQX2iGS
         BJx84QeBVB0n0UlGYaTfZdNfBMtxxKzb9cjPjKnYKZ1RnR6iavjsYFP3jjugconMrZcd
         5wc9Hrh8AiC57fg/b05t8XVeF0Y3FvifTFg0HkTU0lIBd+8mssG6jF0Bf5+bVwN5r4TV
         Z3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164770; x=1788769570;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L50lYICP106cKUnxwcy3VRTlzI/KCvX3m5TcfCKQ+uY=;
        b=FfN2ZQHEvmcDbEe+OehHjdi1xmv+cOEokBqvJVyZXUmdF+cF6zCh1mwNQbLmT95evL
         w24vn/jqWRrFSytTyNvjAq3xvDqNujTCtQHp968Zeljqt8n8KiZoRQXKdar9S01QzImT
         ohL/SdFThfXV7cCfvKyOpgSv4zSpyUioHKPAk5N3Ac5+cAkPRA/aHi8TJz08PGm8gyO8
         FVkIRyY215LqHvlD08uFzSHFz2RVcghmmLgnboFXnhG9lO3TX92mkvICM4Wq0p2aIKhA
         uX9VM/fXYeAICIY5TbpZO35qp6Ff562ie5vgpepzFxnQi8epe5KfDdC3LZX89Vszm30+
         4rDw==
X-Forwarded-Encrypted: i=1; AHgh+RoiT/iaR/VaL3kCrOqQNKIaKANg4vODyXOs70xCkNrCfrYP+F7ynogmZ0+tOygVi+US5pIt1LFhEJCRSuI=@vger.kernel.org
X-Gm-Message-State: AFuF++nwjY+m8sgxT4K0gCFAckBE/wIfwvsxkFg8CIS0gD6a9TFJjIpX
	nxgOiV2EBZ/EDV6UkAdGrREqUrTe+VQrfSK9vD+lm/TvJLkXK1CwZC+v6MMuDIwxyvy6GxA3lC0
	XXSSUszAlY7sxjyxBGfFePuBd0qerC1EYpBZzPC8A
X-Gm-Gg: AR+sD13/qUGwITitSlfJZDZ6u6FiOyZ7zOOJiR4n35jJI2m5nhdh4Gz8SvHRGiWiYQ8
	JDvmjwnACd0VQHZIGde8zZuSQH/uPvwNloQYuFsri2gUCvBBB44nDfjupd2z5Rsvm6MTIyFUHwJ
	0MjX81NwQhKbb1zKXPloYiLdhHDRlAs9tRGHkSiBUtUINxQKcbC+bSL5wXsavg/8j3QLst1Yc3K
	g42JX5CqEsI7vK+PZ1PM6m7NHNsqsmvwNkKp5Kr1W8918UC/SVAZXmoczbjA6OR8L1V38Swjy2e
	7ieWToJrhxCf/pvlrKEr36RAlJ7L+B3/Bax94JJx1TXZjlERfNDZ7UrFRShTflOvX5Cb6GJeH5V
	djg==
X-Received: by 2002:a05:622a:90b:b0:52b:806e:2633 with SMTP id
 d75a77b69052e-52ff716a474mr28081931cf.1.1788164769903; Mon, 31 Aug 2026
 01:26:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827070345.2853821-1-jorge.ramirez@oss.qualcomm.com> <20260827070345.2853821-2-jorge.ramirez@oss.qualcomm.com>
In-Reply-To: <20260827070345.2853821-2-jorge.ramirez@oss.qualcomm.com>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Mon, 31 Aug 2026 16:25:33 +0800
X-Gm-Features: AcwNN1WVv-1JxNRBi1FdqkSyKkrL3KqIt4GooQUTfRRAXFQqWs_ZljDsUxFdizM
Message-ID: <CAE14pdejGMw-4hpj+nydgMi_Ff0WiACEEisa6Y=wp5cV1H_NnA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ufs: rpmb: retry power-on UNIT ATTENTION on the
 RPMB WLUN
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, beanhuo@iokpp.de, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	beanhuo@micron.com, can.guo@oss.qualcomm.com, sumit.garg@oss.qualcomm.com, 
	jenswi@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 09:03:35 +0200, Jorge Ramirez-Ortiz wrote:
> After a power cycle, the first command sent to any UFS logical unit
> completes with CHECK CONDITION reporting a power-on UNIT ATTENTION.
> The SCSI core surfaces this condition to the caller rather than
> retrying it.
>
> For the RPMB well-known LU the first command after boot is the first
> RPMB frame, and RPMB has no earlier, guaranteed access that could clear
> the condition beforehand. The power-on UNIT ATTENTION therefore reaches
> RPMB and fails that first frame, breaking RPMB on every cold boot.
>
> The RPMB WLUN needs the power-on UNIT ATTENTION to be retried so that
> RPMB works from the very first access after a power cycle.
>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>

Reviewed-by: Stanley Jhu <stanleyjhu@google.com>
