Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A09527589
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687741; cv=pass; b=ah8A6FV5SxSrVOUZIHJ/fuBlosAN1jfPsxYF7PYkfCTawvf5hUeMLmyW590W4yVxdTtcoWtiAZgsmJm2VLK4tpMTvtTM27ddQMXyCeezqex3ctIrGFmuGLclfBzFeBfLn+/vtS94XvJ3+bbaJAVTzGChYFtRY7wf6qmqMvhiEX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687741; c=relaxed/simple;
	bh=T2NGlTdtIyg8Qo2LJnioguv0ZZ4l36GX+Rd94IJDCqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iryCUrie9iwlCwTzU1om9ZIZPOxFnDeD+dlu2+MIpXMRvzCB7wO5+jad3MFS3hnfScXSV87wQ6nmgdCF1NLe/MmeeY/bB6X7PxQPlC2xYukY7+RSSS8I3ULhiOUXgvUZq+1PEmBHTSKH9jbT1KaERhg5QSRdoSaPUPxjpckKzTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0IETqRM; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0IETqRM"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4dc9e92a621so599932b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790687737; cv=none;
        d=google.com; s=arc-20260327;
        b=C66gbXI4AEKYSAuP5WyVzcd04GGmJjA4Omv6xJDFRVMl2rzuRA8wTETvkgJ4yugmw8
         chEPujugdwc8Apr1Cs/5Vod6UIgSfG17zgrRj1RTfyR3fVAdQXrFWxK/dMGMhmQW9/d8
         2xVxImT0k8QT7tWqdhc2bQ9J6qBSb0PK3nCpi1bEabPr9yiLjaBLrC8gunVq3g4GxqiV
         nFGbcCsh1dVpHLG4Zwz/yearlvZHXdQKWuPu0/JWhAXGPIVnlQs0rUsau60hxYIjt7Dt
         iz58ESLganaVhTF3EP3cgFjRBIECmDclwFl4FvdyPaKPURUG5oEQOABsPoykTkGbzFpB
         lGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=;
        fh=zSVpMgTAryAusuKxbUfLz+9Pc/2GS1CKAu7N8yaZ8rc=;
        b=UQDDq9qZ+xoKupmE5VkHig+JvZLcfnA/8XH71xwzgctD2tmQtPV6f758/NfBOpDQ5J
         TwwkQGCqeRs3y/BLA0YqPl8sMf0tC/l5N5WyOvCR1DfOWkpW2okTr0Qtbxd/6EpEHOzi
         RUIYH6nfbzWZ/aIM0GppNDdEgIJxRkPzhfhXn/1+mobiM/KyLAgxqtcybgVkDqWZO0DV
         fRs+KNyQlBjpmgD3p5almwz8YVPhmovld7T8hPVH7qOcErhfZnjCmoC0Lfw5y/FGJH+p
         t6N2CcHHwZVI27tqX9zO9UXiqTOoJBF86z+rcj3tHpz08ra6nWLsvkiqE8M0w4sD4hEX
         ZjQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687737; x=1791292537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=;
        b=b0IETqRMTvljeA5WJhWR0ckZi0bSphVRa94W0FBlgA/hjZckAv03THOOYdMhYVAEnD
         IKsMpZvC4carVpTV6PQqoVcmngRRRI8mqPE6yf2IuvLG11PanH31PI57OR9r/hSZ9a2B
         pPyI3dVdZxmVJ29lb0xajyxRV6/kKq0MPTGt10MBvUfR5Xsi6f3wULDYmRg/MDCKZrMe
         hfJw7cllKdKeCH8tloON7JqCTX68wV2AQpVeb/KNBj9vCLgACbjP/D64JmcVCSMyK2l5
         HT/C76UeMEKfj+pPmhqBk1nfTKGkwd/VNqAFyfw4wBtXHhja8Bjdj5gJg6PxiYjZTFc5
         KSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687737; x=1791292537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTO9yBJ7Sd0NkFEBQ/8VjEUd1RTpjAiKlOI1jt7xIy8=;
        b=UHR9yGM9qb+4GfwIM4N8HJKcfi9OrIB1t84fdqADG/y27AXHSvpqEwILomu4c5Q4eQ
         Poeu630AA/fqUFsmghoRcIAMgO7NqffJhPuiWoKrVruZGyFUGN1pa2QXYi5+3K4vqiEa
         dDfS+nzbYwRLmqdCXt9y4DeXIxrzgamUsB55AgIWzfWa+Dg66yjau/agNm/ti/p59V+6
         3TLpbIswIHaE8TwOW+1CNlZTerP62vvdG4Go6OawKg6lzd4Cw7rCfAsXN6dVXsaxDCvV
         LifSRFAmi5ml8R7GLCVkvR2chIqjp3TpEN8pogyqWBua30/Px3zc2xmih15ZuLVf3Cpb
         jjRg==
X-Forwarded-Encrypted: i=1; AKwUvBxiXjhDIpUU6keez/vvd+lH4gWyPwuHlW4oQt3mNGZxcxkYUkldrcW3kYIsvFOAxhM1qlJTT/PgroblIGw=@vger.kernel.org
X-Gm-Message-State: AFuF++lECx9vlhq1pVQJTEzZB4k11WKBrnwBUY1aqkThnDQOKFSpD5bH
	2kIICm9hf6qBfYIr1Kaf8NbvkXv9YrkWxE5XFAd8e94G1RcabGNuqckjVjohJtmGwq0XFgNqJNf
	lHYfBVie31F/ZH3Qaa8kArzy4a2pFIEw=
X-Gm-Gg: AYBFou1dVZuye6Feln97ULS5vDjB9ihyhA+xLFxnSKAZy2U7y5d1B+DCUZiB9oU9bOX
	5dYAlE0U/Ej3Q0eVJ4+gg5SH4Vv381yJ5892Vkf6trYTBDPjQYir3qEtIFf9CtSR0TJHUMEIcsz
	ZsUjAvQ77Q4frmVYiKmfm6qQS+GeaiSjj+q330DZI5FOM0G/QnT8n0QDhHf7LIwtpiLz9u0+ge5
	z7ceQmjiaHYsUVE6HiCqL8mFlPesmNjk/+FirbzDaXxV8rK06XbIKOni1hgxu6C4tdyeEB5irWv
	wO1yLhDcXEzq5JzIQHbiQTIVUS7wzzUKIG9v7Zir1X2nZ88DfcJ/D1EObv2yA4/gtSc=
X-Received: by 2002:a05:6808:15a2:b0:4af:aaca:7be3 with SMTP id
 5614622812f47-4edd8a63ee6mr1681520b6e.12.1790687737021; Tue, 29 Sep 2026
 06:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
In-Reply-To: <20260729114312.3947300-1-chou.cosmo@gmail.com>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Tue, 29 Sep 2026 21:15:09 +0800
X-Gm-Features: AclHuK-j6stgU1xbuVvm_ryZxtRewkbdHTBcaeY6_Bm9ZHOE5XgHrwabKhmUtJA
Message-ID: <CAOeEDyvbuRHXfeO989dvV06e=qoAYy_1xEgnicL=X44Q8YjuFA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: dts: aspeed: bletchley: Cleanups and second
 source devices
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Gentle ping on this series. Patches 1-2 address the dt-check-style
warnings you pointed out on v1, with no functional change. The
sashiko-bot findings on patches 3-4 were driver issues already fixed
in mainline and 6.18.y; I've replied inline with the commits.

Thanks,
Cosmo

On Wed, Jul 29, 2026 at 7:43=E2=80=AFPM Cosmo Chou <chou.cosmo@gmail.com> w=
rote:
>
> This series resolves dt-check-style warnings, sorts I2C nodes,
> and adds second-source RTC/LED support for the Bletchley.
>
> Changes in v2:
> - Added patch to sort I2C device nodes by address.
> - Added patch to fix dt-check-style warnings.
> - Carried over second-source RTC and LED controller patches from v1.
>
> Cosmo Chou (4):
>   ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
>   ARM: dts: aspeed: bletchley: Fix style warnings
>   ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
>   ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
>
>  .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1317 +++++++++++------
>  1 file changed, 903 insertions(+), 414 deletions(-)
>
> --
> 2.43.0
>
