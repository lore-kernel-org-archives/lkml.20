Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FE841F5D1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024985; cv=pass; b=h5RfmiOCcsqNWwcxlMRwZvOhj+fGKdjB4aRj0EpmHAnP++iaDaBtY3mlKLFPFMo8ttcCdgyR8SWiolza4HWmc3tCWa6bpjsJ4iLPDyajEriLpnyBwIUfpa7cfPD85ARqkeefjH0KlIF6M5KoIX/WgdgQh/n6ZNu6YvNYYHXd294=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024985; c=relaxed/simple;
	bh=ZwEucItwPkIzMpHVNGio/IFk9gQoww6BJz6Z2WZSxEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqqMOqAAsdVTgfwNNh7r+0R93lbujvsY1jdpR+3wxvOC8NBlsu2WgFncbuNvO8/DrP83X6zecEp/oBzn/oIxFcnDxBTJIB1BKLl3NiryeZMPkafWL9b0GO5BnG+lmRhgAZP2ZP7Pu25lJTWPd6r6HkFqpzHiT4pAAisO8gaWnKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZB7vMzz; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZB7vMzz"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677bf06de21so258327d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791024982; cv=none;
        d=google.com; s=arc-20260327;
        b=UYkhbKRxQ5bCh2ZWEX3ue4NSd7oZhdei07Z4qZaiV+lWAS8CZenQBeHdmJM0uBZNYt
         ZpkhHCjaLi9I39+2zqQvZ+5fwSxFWOEuGEbRmk19WJXMALVC9vZKb6q5T0qHOm8DAiE1
         6qxzeraZ7ZFB7WKVW+mYK+RWtpOk9JbDcEZYckm1HcKNr7GvptFs3K7/7G1pahMFQUC4
         NNDOxV3bDAscnaSbHMOiostP715qqz4zXVpZSsk5X836foMNaHW9g1mN5Cid9MluShyH
         NEIjYyInA1705EVAszqhXnPRvbjVdcFI850e7XOQhgrK43JC4zCtsQz923LWpV006X0+
         Jy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zbg8OteiwvS+x/wtCL2LxCsJ9p1/QRFcp9NTsqN57Zo=;
        fh=lDl5bZzq693+mkQPUiQKmmupNfy71qwFgc/q4+5uo4I=;
        b=s7DkEAaLUPkJ35Ja/Z97bVOEGKq3DPk5qT933r1jwLWnu77/yhJDEK/zX8myUvaJSq
         ZgzrHzkfxoWI75DTFP8vr4HuB09NgRtiMIKOynjQXUZ1HppdOHueQlXaRDX55j7W2BxI
         sIIJ0QsdTSoDiNQVy9Cws6culwt72KO4c+1xuqtkaqXA412ScteU2bIe6GOTVoU5v+Qo
         Ox1mg+E1+ipKarwPMBjrwzqPb55kbz2Lm5gg8SzIDpQINzub0YFVYn4ErBO0Uo+8D12C
         A0SmXQl7FPx31PWi5/tQC5ZXbAm9XqiYOq0fc1p1WCm2S0rjz+LITvptCSnPz16ecn7z
         7yDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791024982; x=1791629782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zbg8OteiwvS+x/wtCL2LxCsJ9p1/QRFcp9NTsqN57Zo=;
        b=TZB7vMzzARQbQgOZ4en8AHoNzaiXHsTf1441qvDwcDUTxhnaOl3HDXiie5p5Pok0MU
         IAC2jctLY5ulUXSc9pA76l7fqbHv78ZLwiQnTVX2Wr9XylAhIsx/4Pl8Vu4x9koP6g2A
         4uDosnBvS5vmlA5+5wwgX1ZT6uWZDqcQxnDizZt3TAYjR4GLi8+R8Yr/o1Adij6jGk/K
         vHkXXCWAYN8YAvdGi6w07wPiSEYeBERoT3f29q4Movbuj2dndrupX017RL98Nf7C5n9D
         FJtLEHeg88iUWa7syHIpDWbunJcc4H/SnYbGVdsraSiUYOP+LOtl/Nb5z2B8EzcndSXC
         UK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024982; x=1791629782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbg8OteiwvS+x/wtCL2LxCsJ9p1/QRFcp9NTsqN57Zo=;
        b=vIV4eazxG5TCjh2WG/tOonM5aSD9tmWSB0L2wzAXAIf12wGPviIkKQqo187214Qpi0
         yyb2o8uKzo2R1iTTwLCvi24UMKvF/ksMA3eurmEU8aS4ZGdLc5bqDQvUiiNmyjoNdHeb
         1GPpelDO+1oTa3eSGndTCt7CKJ0kOldAjvBqnSjyJO6tfBAgEx50HUOgz/UANyB64vKa
         q8SLT1Pu5d2ko21hn35TvHtqzK3Cw0R8eDN5g7yo+y25HeOvsjQ/hR7DosZrzx208vdE
         XkkBvirIlTTDoONHtxC/Ae8LXcUDlO3pgZtWSSd4+28xIWYATBQdoANbT/8FSsgCXbNZ
         ttaQ==
X-Forwarded-Encrypted: i=1; AKwUvByJRYB4ExOx0iPLdwPB4rk6/YDAOp92eBuxETi+IFglKxkjfr6VVJtrkVPYHoZNyhcwRJ2EMk2vwZXbhTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR/LGliOwzl6NhiGF/AdEzxBz2Z0x8aOiOZ5g8Oc0okaoVBp/h
	9C1DcM5OMUD1dyuzS7PXfha/HawTJRd2XNMFpmawKZY7FsczjxDVvrQZYB7AzgnJ9lA2hWElBHT
	iwBQ5Jl82gVf/icJ2CTFKrSSHHniCnhc=
X-Gm-Gg: AYBFou2ufciitzbDZEfDLjUe8T6Ip9zknxvbEJcG1uniwx940YOL8EK6ETHl/fHKSR+
	qvJD88ReE8VV7BBPm9e9GPLFPH3ieT20A1F3dIf8DRNjovd9T8CozQWeFylKNlHBRlXMupxpLoX
	KMGc7ASNl/IrHSAjJAJURR3AC/FWA8nuxWkpym48z1E/imnCnI0d+GabD1XiyB4WonWrA9ltC8w
	HtiPa12K4WW4PRJqevxkmjNIN82AnDsXwO9wnjUiLH1ruttInd1LO3KX7CmsualqJmNEesr9fC0
	1M9ZcB8ozmvors1vPgFfPIGuM3uwv0qzVNDB/8KV5uIRBgZ7fhPNsQ==
X-Received: by 2002:a05:690e:4292:20b0:677:bb91:9d59 with SMTP id
 956f58d0204a3-677bd3cf5c7mr500139d50.80.1791024982612; Sat, 03 Oct 2026
 03:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-include-mmu-defines-only-in-mmu-code-v1-0-291eadfde23b@imgtec.com>
 <20260930-b4-include-mmu-defines-only-in-mmu-code-v1-2-291eadfde23b@imgtec.com>
In-Reply-To: <20260930-b4-include-mmu-defines-only-in-mmu-code-v1-2-291eadfde23b@imgtec.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sat, 3 Oct 2026 19:56:11 +0900
X-Gm-Features: AclHuK-QrvdqfD516PD01m-QBeGNl95QKCuJiW1zDza5GXZuHIMEOz8rjjkV0VE
Message-ID: <CAKbEznsAZ_7cu1rYauniQAv9eAfZMAvjzNUkB3k=UA0bfa6gkQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/imagination: Don't include MMU defines outside of
 MMU code
To: Alexandru Dadu <alexandru.dadu@imgtec.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Gyeyoung Baek <gye976@gmail.com>

On Wed, Sep 30, 2026 at 8:43=E2=80=AFPM Alexandru Dadu
<alexandru.dadu@imgtec.com> wrote:
>
> From: Alessio Belle <alessio.belle@imgtec.com>
>
> Usage of Rogue MMU defines is already confined within pvr_mmu.c.
>
> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
> Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
> ---
>  drivers/gpu/drm/imagination/pvr_vm.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/imagi=
nation/pvr_vm.h
> index b0528dffa7f1..266d39f5c444 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.h
> +++ b/drivers/gpu/drm/imagination/pvr_vm.h
> @@ -4,8 +4,6 @@
>  #ifndef PVR_VM_H
>  #define PVR_VM_H
>
> -#include "pvr_rogue_mmu_defs.h"
> -
>  #include <uapi/drm/pvr_drm.h>
>
>  #include <linux/types.h>
>
> --
> 2.43.0
>


--=20
Thanks,
Gyeyoung
