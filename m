Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601EC491589
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638968; cv=pass; b=RNCPeO2K3vplu7f6/X8S9faskMr3Izfn74OiXVFZcAsIv9wZL73+9vRjq+AVYuVyCMwm38W+z9v5uUSqLtb1VtQcsL7BhZ4V+A9RI3tE+id7Fdjew4JyTtvOK386uR4tJInzound9F20qlOFh6Bbv1THnZ3RblTB/G0pzEGlhqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638968; c=relaxed/simple;
	bh=0mOLJ1qbIO4bHtL723mklyC/FW/EWWw0glxLKNa5KhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qNSlfQBPcwoV3vo1vB9MctDNbISQ1sEWzIqbwDnCF/aOsSoUCwVz/pAviRrYzJI7qrftCwC6JJXk+bB7waL+1M2/GiT3EUdPd8+ksOCOUeY0Gh9Z5UOXLNiBekZQV1k8kEDzVBkGrjTmMCMnZbmj64d/VVFZPQl5hFXS70C/DhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=ai352XnO; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="ai352XnO"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c29c6a3930bso81689166b.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791638965; cv=none;
        d=google.com; s=arc-20260327;
        b=SrWw4evyvM9Bn02ssiNU0fRgYPD/uemd2NzyqXnBR4adKsIJ066VW2m6U42NSVtlxa
         cfD4G5vodBN3kgc6/m6INtfoI1VqZfLNTEGi0Gp8XUyMP8VXkUesrmEj8mumTSimk7Gu
         W+zipaaKvbjEtK/fxjnm7yOOPkxBNocojXV5yL0hKmjjgMiXcBIWD81JkzLTjTGavC0C
         c50ZukEBA/bEihL91oheyxfYUYzeUmIL8XRpNrRNyfyOZAFG+fvnsIXULyr1ypeEkfHa
         OYY39PcpeYc5PnZ8Gm8Xm3F0X3P6fstkhuIOLp7R5U+nPrS77RRq6oDS3W0GQzCCfvWL
         FHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6/nHQi/CMAK+j6F/l0YNH4Qaf56yMgapiWA9WJPD8E8=;
        fh=j9sCHWC2hoFclbaTLFoDEAiWvebzA5W3CMFePDFAPLw=;
        b=MbhyzQIutv3OGqGbe+lUxGBQ8Ng3TcsQ4HITLeGUFltegNngCbqhetgTP1una4rIGl
         GgXJgM6UQzeYz+1UTTK6LmErJoNjoQooKLSWPM91XqL8toYL2/0IMLoxpmSNMgC66H88
         /kuXDoxcKBTxlR5/jWeYEapyWNz0ExUUEaivEKHZnVevtXvXNjvlJOSakc8oWFiauXca
         Kx8CyS0l9WbiD/NjnjL7DmXzdOYpUVnqpsOLC7E9yLNUM6mCADUeREd/azZQHbNx9CBQ
         frZTrfI9//LklXt6MlTdMvcvfIZIY1QHvoHqadrA/XrxX89ymcE9QXOk8chLqQEDF2mt
         Mr8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1791638965; x=1792243765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6/nHQi/CMAK+j6F/l0YNH4Qaf56yMgapiWA9WJPD8E8=;
        b=ai352XnOj9oJad83EhHSowwm2A3/Nku9MCiipuxmkASHamPsdOIzYHxc2Pm0zQpAKR
         ZIkh3ehe98ENou+5jWLJnIpd10hkzIdsKHZNifX2D7qlG6nHEzI1eT8Bqbklk5VFbcHQ
         fUz0T8VPIfrNJgFN3y95ztAJdkTwGhhCjD5XTRiyeNLySFoN2zGKXJfuVWBbHUiiIQx0
         gPWxb/fjjcjo/eNNhMY2Rnuf0qI3FF7pc0N10dE1fEjdc0OwlBpsHyjIZ6lZ1sogHMXT
         /2ly1nHP5e3DyJnn9S3Jz2hwkNpB5ec2yzPMv0yN5GDGtyI4R//6hgC7pqg/8flElwe7
         KYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791638965; x=1792243765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/nHQi/CMAK+j6F/l0YNH4Qaf56yMgapiWA9WJPD8E8=;
        b=c/QvQnT4XQpXi3yAav/s9ZDE9KlzQQwjMHMi5fhkmugp7sPaKxW8av+y73d6b9nYZC
         iHVqZcN6gWwvpnLLDGiWO+ZJCg2HttskjYy8e5JLW7Z7rab5C+m5ol2SBKCfhL93GBkV
         gahy57DVOlXnyGoqg2zYz00Hvqa1+bajJljjWgOGgSYBFco+kpkU0Wxmcski9bslnEey
         ssK7xapLqXXOfnJUugUoap3woDbHWMfJchvFUvyO3+tf0wxDkuazd3wJvxcwzTl8c+WB
         9sVM2OmhmGOXiIx4v+y3wTZU84vbn3I5DWneIxOeiyJT2uaMG+3oY84ZtZUzN9+JeAZj
         /REA==
X-Forwarded-Encrypted: i=1; AKwUvBxEXK3bSl/clhgEsPhk4wleHuHnTE2C4KnQNWGCAbYfVlMkB18lukPCRRF2h9BQZpoNWIDWT0oL0lM2xf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOVedkaW26Hpx92hDkLjZHyU+cwSUy4QLRlGsqX03O+0wuzfle
	kr6F2WrHD+CJlH+nhCdueSH9MSM8b0hohIb34zqRBqBpDSMm2MSOeEqIsc6o70tjYa7PKGjthop
	i0B3kwuXubylqK2vRxqqRqh9LZ+PDbmwsBigtn7cHsA==
X-Gm-Gg: AYBFou1mreI3/L21O5ydwwm+1bps/3Z7/iFwSg1YLFBx7lv417N7cIKdbdwuPfhqSzp
	95pkGBIL9SDkOfVR2sggg8Jy/cOEo9RUiG2ryaPzNrV9skLRLUso1L7Iyv5wz4cFFJt+5pDC/Fz
	9I+MSVNgetJUTAna2PDAjAtjMv91cULUXuDLuI2ztU+s2KUj2ykEThSiwwb96VaIruzJwL6n9fE
	tKdslWa03DjYlq3ajqnk014f/ko6ym6VUs0Vj5yy7q5kcXyihz7/mqxpizz3svlbSRBZtooXZ0q
	QTBj8fNqKs0v7ZtEJMvyLRTGS7gWyJ4yVvDCYxsGevZLrEbHphcKxMM=
X-Received: by 2002:a17:907:6e92:b0:c29:6400:ef8e with SMTP id
 a640c23a62f3a-c31aa0098a2mr468624466b.42.1791638965252; Sat, 10 Oct 2026
 06:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009140946.008206689@linuxfoundation.org>
In-Reply-To: <20261009140946.008206689@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Sat, 10 Oct 2026 22:29:08 +0900
X-Gm-Features: AclHuK9jyG7nhFSraKVNersbzp_MigR0JEtHr1nx66h6cqyz_SecNiHhQNS9bdk
Message-ID: <CAKL4bV57zkwfGiTzGvK5Ho9AWVJfMamrbzOctPh8RkNKZ3339Q@mail.gmail.com>
Subject: Re: [PATCH 7.2 000/428] 7.2.10-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Fri, Oct 9, 2026 at 11:24=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.2.10 release.
> There are 428 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 11 Oct 2026 14:08:23 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.2.10-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.2.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Linux version 7.2.10-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 7.2.10-rc1rv-g77b730c57839
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 16.2.1 20260810, GNU ld (GNU
Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Sat Oct 10 21:48:22 JST 2026

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
