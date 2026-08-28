Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2233A4399EE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916629; cv=pass; b=LjLZbQ+RRVekhznuCqU8WO+cQ63XpUmg5/IuccwrjyNU6ZHxfcd6h/1hbxLGINnbjrOFVu6TEUChYyDGaaxPdSZfO/G4RNGhvrCMt1aiR3I0gHtDez/nIWYLYVNJkz1kMZx3uvoIapMweih0B/3gR3E3LU5OU7i9K4DNNKmIKaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916629; c=relaxed/simple;
	bh=E9IzD8tLZ4atOCJiLq5vH4xKm19d5mbqDq35ouwu4+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hULLo4lbvFzszwDmLJq5dU2Lg/iO3HpLSgy6e9FG82NIdAIedMvbnBIWxG6eCaAUfhphN1dJ0n9iFTPf4MrIIp84ysonJh37VBifalB4cT+q1yQ/tNfsW4v18vUblI72l1B2JfIYID4mvdYrhvre7vqiZAaRTU2PKTOieO6oGnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b=ib2v5/GZ; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.b="ib2v5/GZ"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2531423556so9188566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787916624; cv=none;
        d=google.com; s=arc-20260327;
        b=RAG9NTr/mUjwf0MUWSo6b5wAPmvoep7C5tMRvPfSK3DYwDKzTncgakgDZDkq7yju0k
         U/3qV64gvFOvulm5Er7hgr3ke2WlZKVAPHohrRYaofUQT7M1Wa47Uz/eveFuKP4TFPnr
         D4V+o8h50S6OXmC3C8m8kngWjcs6sRV3SHqu4M4viHDGs6ppUoCqQRReFwWJlrUikPTP
         t4ltzQZA8uQYLMLHzCXkLwahEFN0qw8NCQGuDATmJVJE2rvpv+VgcmYLvue8hbKGE/Hu
         JD8z38e2I14Wntfcxpg/h4QSHE0y6ibHYEvr+vOx0/YdAIaqFkAbbQkV04+tTz78yoPl
         HSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UKuFtJJZMcXxiN1w0UPs9tMckP3rl1Ohl3fu+26vt3I=;
        fh=4y5dVDcYwMuz9KnfYifZLiqxyCYxaIM6Up/aBNfCQfM=;
        b=GiTILbvdAp2+L1nOGs+p4dLNLfv26nIkOnHS/Q7Ba5nAbxH4Fui/EsE61vj31mKvGA
         a1tXo+91EZDNmcIQCvPXZQ12FZFSmXHVkUD4rQRRMyAblvqFF/VJ4b/Bb2W75O9YdoDw
         zO3183v2QCRyC0sQ+3d65jMNjh9e6o1hFOqOLe5TziV4XwDBe7X0t+8raE7POn0/RzQB
         oS4jQROE7aTf/XlD/U2HS9iZvXIL2V+bytakBstBDVPWvdIU9SONPXY23EjRfVG5xsCG
         /BkWBmgnqBp3uqNlPrNHE8ZBnz8HR9XA2c1tYER1kVtNnPpsus6Eo3eMzXwFRHTTqyLd
         1F+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1787916624; x=1788521424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKuFtJJZMcXxiN1w0UPs9tMckP3rl1Ohl3fu+26vt3I=;
        b=ib2v5/GZ1Nc8t4VSX612fiUJ9J7pMQnTsQbSZBUiEKsFkltv2vQ3Mq1Mwgv69RB8v/
         vExjnTI1VuWgqqm4BSYCnwghluDAGxwRfcHAtrnvBGeOlpR7Hrs3j69ow9EsM/fmtClu
         1wZ6COw7PfuKTZEQIguRnfG48iA3qYXsbZB88ZEekaoqJcY+mNSjQmMSBeb1g7luQICk
         7o1/EAepOckYegGruuoI1lM47MuoOutDhVtOnFBhK32DbturOW+R7MHi31MHANAUHtkZ
         PYotkYMwk85d5Rgnv+gh4yLYaMpM3fDKtTIWJL8/9Pf2PsEQOb0/x0l5lqJUBhtdHcvQ
         V+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787916624; x=1788521424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKuFtJJZMcXxiN1w0UPs9tMckP3rl1Ohl3fu+26vt3I=;
        b=qiZgoAnJm3R7gjsvhZ/H4KFJYfI/XdddSaIlZSSPer0LY1uXRkikjIVhQ+2J6uhTab
         aNv/azRQ1EyVW6NQPUCTqG0WU9XqlZe7N1dcN4H6tgPxRyv95m4razooT5IFiodcbUCz
         cs5lEH6rtSA9jDTigbAJanaliJ+w4LQUbOoMHUdzJ5hN1DFBs5afgDRT0lUoHiGSxNNh
         MZ0zCyhMAFuwFjhGIAB/Ybp62Eh8nMxgjBO4B06otVX4EkzCz9DTvEWHy7EL5KyZBMNP
         FPtk9SIHo18tMLGb1UolhZCuIH/M95YhwWfwqgRHOKoAJRJdo5a18IB3CKPePtqk24Fm
         gCYw==
X-Forwarded-Encrypted: i=1; AHgh+RqcCgj4jie1ACnmcKJGdYNP5xCkGClBX9WgG9vvz/bLGHOFIceNygRFeubE4b/bQv1brMGvX2PK7mzDGNM=@vger.kernel.org
X-Gm-Message-State: AFuF++lSBusj/2RSclMfJ12EkU2ItFjXuSxRDI2ZOjCGTw09d/CrcYIP
	3MRRO6rBo8uBG59sWg2Tzc6TWuqpBmK5dOxHbOPkKoiqYYx1+APlMkqWlmqzPBfgErYC3Cr3cjj
	X96Sacp7+5zsz45tcJqRKeHqmC1w83Y0C7UJ3EBToonNcr6uEmirKzRc=
X-Gm-Gg: AR+sD13sdjLJ3uH0CJrWyf7qma8MovTO8z9W6EhpJOa/125KOwPROGPZEhiRqdWX+3h
	8JLibbHNoLDzVVQC2XblHssvYKaLTzqD2Ou0P2Jp6ArvLythxN3bmcMiLYYuVEBhJWn33RcQ8i0
	gFY4dYqi0gKiFL0NHOI1GAUvlouSioeakEJQKC+KXCp+cKDIYFsbhchI6E/uQQyz7E9+NgQysfd
	bs6dL8iysyJGZuxzhN+fl+7kIwl4FDC7lCSqcwTxuZ8qbSga/F54HFYleNaFjMUEZD483E275AP
	sFJzelVFsBdrI41kLd4RunTyzGlXmWsH2rYKQI5blCRFFHfeQqQSjqDTaQZx5oK9jy1MiY5LyAN
	cMA==
X-Received: by 2002:a17:906:ef05:b0:c12:732a:fe52 with SMTP id
 a640c23a62f3a-c2557464543mr209561966b.4.1787916624371; Fri, 28 Aug 2026
 04:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824113618.2239100-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260824113618.2239100-1-runyu.xiao@seu.edu.cn>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 28 Aug 2026 13:30:13 +0200
X-Gm-Features: AcwNN1Xb1tEMQdHfmnOobPQMaAG_j21-E4c60KKb3LfDE3LUDihv3S84LK9hgZM
Message-ID: <CAMGffEkZNCjOskmQ+0gXs3Ezw-q3jAxiBeaJUN2t4nhrnUHw4w@mail.gmail.com>
Subject: Re: [PATCH] scsi: pm8001: use rollback index when freeing MSI-X vectors
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 1:36=E2=80=AFPM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:
>
> pm8001_request_msix() unwinds previously registered handlers with
> free_irq() when request_irq() fails. The rollback loop uses the
> failing index i for every iteration instead of the already
> registered vector index j.
>
> That passes the wrong IRQ/dev_id pair to free_irq() and leaves the
> earlier handlers installed. Use j for both pci_irq_vector() and the
> matching irq_vector entry in the rollback loop.
>
> Fixes: a76037ff3479 ("scsi: pm8001: switch to pci_irq_alloc_vectors")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/scsi/pm8001/pm8001_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm80=
01_init.c
> index e93ea76b565e..21419e46c16d 100644
> --- a/drivers/scsi/pm8001/pm8001_init.c
> +++ b/drivers/scsi/pm8001/pm8001_init.c
> @@ -1029,8 +1029,8 @@ static u32 pm8001_request_msix(struct pm8001_hba_in=
fo *pm8001_ha)
>                         &(pm8001_ha->irq_vector[i]));
>                 if (rc) {
>                         for (j =3D 0; j < i; j++) {
> -                               free_irq(pci_irq_vector(pm8001_ha->pdev, =
i),
> -                                       &(pm8001_ha->irq_vector[i]));
> +                               free_irq(pci_irq_vector(pm8001_ha->pdev, =
j),
> +                                        &pm8001_ha->irq_vector[j]);
>                         }
>                         pci_free_irq_vectors(pm8001_ha->pdev);
>                         break;
> --
> 2.34.1
