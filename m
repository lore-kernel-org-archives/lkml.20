Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6543D5642
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788494407; cv=pass; b=MqISevvMh9Sa6lxAYCaKLblu4OpPY7rBaqr1x+pKMeQKksg5f+rxXesJuSciC1LkLXEQatSd/GUGscJ0JInVrGQa02lJNs7+Lm+/T1GZMTXqUFeddr997VaRo7QCZ7dORDO4WgFZKSDr+/F3uYCUhzkL/MCaP8FrLXfVS08+Dm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788494407; c=relaxed/simple;
	bh=vhpL38NTQCYoHMG/9DQNSR9BiZVg0Lg7euVjakPkQP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEW1h95dZEQO6HgKk54NbHGRTtASp8aLvE6utsl91QD/8JKq1n4HTZRPzW8xHyiAPDN+67med6ZBD0cOKecclZ4fUg+6RwMo8u98e6/6vbI8F55B4M63TssBT8Ezcae6DGIeWZWPn70fYD3vUT2q98pt5lK6hEM2EiM26P2cE3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otXpgKlV; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otXpgKlV"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a34f7ebcedso5334431fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 21:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788494403; cv=none;
        d=google.com; s=arc-20260327;
        b=S7xcUk+nWKyyOzl0pNK1/ttovyrjiLQLMB2ZjDvQJLvN5bWRIrFRIMSCcpBIC8ybJ0
         QkX5R6qf847iN3Ioh1CriehLce66BtkfH7Epqc/OnsLm4hWGJ3AUzH8bhMGlcWeLRgAd
         Pu0rB9b8xBL/F8kMIc0aGMHOZek3jIFV9O0ee7QWBX5lWBsVFjr9FtYFPXBteEHOwbrU
         khuZ//TRajl5Q8xyaDjQ1gA3IdIAwZDTtjGqWUshTsue4US3ULcSdKd7MV80UGEfw0H5
         DZsCTVqg13e+h+7RQJUorV+CELBIjTfRJ7j4dKjOT7yAhEN1H7X4mfCEHmAiwRHZ5AQJ
         VC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vhpL38NTQCYoHMG/9DQNSR9BiZVg0Lg7euVjakPkQP8=;
        fh=5KeDCguiVszKuyHVgrWd0zkT9CLKlfuijjhomkjEnNk=;
        b=G1btG7Ef1/En6ToWq/JiqK//5MpcnACYScTp2iFPZ/5pUwDZ6O+pgffn5hux/B8SDy
         HcuenZIetkji8+ZpmWf6XopHviPFHprfSkWxdavZp+3crE/XmHRl3Cc/w11lFoEylLE4
         D44wyOCVV8EymkPCjNPb8tgRhw/2D3/Wuj09xwKZlBmUxvJ6HwmNZRsAhtLU+/CRJiB1
         /MhA/0RSZKHCDSiEmQOv+ZIsKEzcIAHCnnGTBHXUdrh9W+KcX3GpVqUP8vAyRGWfF+nP
         v9XcL3CyTTEMn0MYiJ2awc8VOYr1GG8cziOnGnNtXfjH12dI7m9FL3ilv6oTWSRqoTB4
         MNLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788494403; x=1789099203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vhpL38NTQCYoHMG/9DQNSR9BiZVg0Lg7euVjakPkQP8=;
        b=otXpgKlVkymNQc925O1lD/lsKCMQ+FWBz9CFHD0VTHjgDbLyQEWVXAghm307p6P04P
         NVivmGGl+WMVPi82Top7UgE/+vGO1D/g+0pOPaUhKO+B4X+uXqM093dch+MsSPEv+OJk
         8lnaES4xxXUg5Ambwe4DL5kE4epjp235y+Efhwi1v2XOao0vpQCqg8HBXH4qRMBIMERF
         qP10YttU0abyXXh9VcUvqykKL90r5rNsbWmRfUzWQ+lJgbW8UuH7+Bq1tqNikgGWvBQY
         8AUmBwwXZuWyHn7HrkHZbK4rISeRPEv76jOfOp3VCvQ2pQ3dU/1agJuC7Vs/WaZLPpH3
         +PSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788494403; x=1789099203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhpL38NTQCYoHMG/9DQNSR9BiZVg0Lg7euVjakPkQP8=;
        b=O40KG0wPyAnFgq3+9i27Af9LAsPaKGCTcxn3RFf52vHUcu/T12yWnW3+0jv3p68dIE
         DXyaAWevwH/QMUkcOlFHeNz3GBeLhgfhXiGBkFtKe7hmtjiHzi704mVofvAjcP/vKOZV
         Z3DtzIRxth/YB4DD6EC6h2hdb2S/RdzYlQb+aYgVfXWOWIP3QEMJRMFjDlM/D75EOAbQ
         CalhU42R5KvuSUHOdzKbsfbkwyqpM+klfTJuNZ1gwIkUkw+wAbl0ihDPZgw6PfkcT9uH
         edWJINeonbbLvoC7VVnVz6egYp5rmUzbY7zbbwsTmE49B5d+C7AvwWl6CpPlyv4XjcMV
         0ITQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWJjlx/hiFAbjOweCtpZqKhPfgDlBgBWS6h9KzXpKUju3lFhSAG3uwql+7a/kgFfReS+yioY0MA6PWtLs=@vger.kernel.org
X-Gm-Message-State: AFuF++nxDjbTijucO/l2DIN2Lo7I2+7CAKNV61GiqJPAJ3zeyPsYQCsW
	0/rWzinuuF9BemZRtzzJoUtCjrpejSFGQ3yGmWdzX4SUjLg/oBblbigJTZFNo/Jl+q4vHb8enYZ
	IcFmBhNrcDm48EALMRd8NgbmFGbE9J1w=
X-Gm-Gg: AYBFou25+pO3fnNc1JB+6bkqhu1bD586jVS201tWSBVqsQebOQQvJSJnQMnRO5pttvx
	d6A4S0069Bvf9JxOrgSCqAm0IInUUXupAru6jwTgdpyYE0mULp+H0gBbdVva1JN7rI6HkoLpA2L
	ybcCcZ7rfpHn3Q5mvqbgJQjJMh/56yVHTM4NGnqRevj+fFe2wTIVgc+ASmwkCAyWLLAQlVvccLd
	V2q/B69XMjWPOUTUKxD20fXL79u+OJWIAvQXDcjXzklwbGCCs1WyaT7qYe4E7EFxGnZ+jO/E3Fa
	bFJAmx4KpeIYkkvuG32QyJN+y+0kHfzOTakTLjeH8X5UuvbLtrIPjmrw7w==
X-Received: by 2002:a05:6512:3406:b0:5b6:183b:d216 with SMTP id
 2adb3069b0e04-5b6183bd400mr238592e87.61.1788494403087; Thu, 03 Sep 2026
 21:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903231641.18536-1-hhkieu@gmail.com>
In-Reply-To: <20260903231641.18536-1-hhkieu@gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Fri, 4 Sep 2026 00:59:51 -0300
X-Gm-Features: AcwNN1X0uovzUyaqwk661Z8ri8kFZYFzajo-PGzk-Nkz45p8WS6ROgDm4XS2Pus
Message-ID: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
To: Hanh Kieu <hhkieu@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

On Thu, Sep 3, 2026 at 8:18=E2=80=AFPM Hanh Kieu <hhkieu@gmail.com> wrote:
>
> The Pioneer DJ DDJ-SZ exposes its audio interface as USB vendor-specific
> class (0xFF) rather than USB Audio Class, so it needs a quirks-table
> entry like its sibling Pioneer devices (DJM-750, DJM-850, DJM-900NXS2,
> DJM-450, DJM-V10) already have.
>
> The device presents 10 channels of S24_3LE audio in both directions,
> fixed at 44.1kHz, on interface 0 altsetting 1: playback on endpoint
> 0x01, capture on endpoint 0x82. The unit contains its own analog mixer,
> and each playback channel pair feeds one of its physical channel strips:
> 0/1, 2/3, 4/5 and 6/7 feed strips 1-4 respectively, and 8/9 feed the
> booth output. The master output is produced in analog by that mixer and
> is not carried over USB at all. On the capture side, channels 8/9 are
> the mic input; capture channels 0-7 are not yet mapped to specific
> physical inputs.
>
> Implicit feedback needs no quirk flag here: is_pioneer_implicit_fb() in
> implicit.c already covers vendor 0x08e4 with a vendor-spec class
> interface and two endpoints, and the driver duly reports endpoint 0x82
> as the playback sync endpoint.

Are you sure is_pioneer_implicit_fb() isn't returning false and you're
picking up on a generic sync ep instead?

You should double-check that function is returning true or false because it
will return false when USB_ENDPOINT_USAGE_IMPLICIT_FB isn't
set on bmAttributes of a Isochronous IN EP.

Thanks,
Geraldo Nascimento
