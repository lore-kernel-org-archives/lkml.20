Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0823E49C7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176149; cv=pass; b=ZcLXgLKx0SoSNsf6ZJy7zoaZGG0pPE8ICOd2riL7+6iSaokiErWy6+HONi197shS00BD9nUO4zS5g4YuhOHYdm3DXYSwBZTJQaVpWpQyLJMr5pCH/INM5nzSPm7HSqtQ+5qOofL+Ww3+0li8hBL91WagTn2gdFwW7BC/Vv2ULtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176149; c=relaxed/simple;
	bh=iVsFzxcjtXpLLAPWir7xOZsYFnrqAkLPip0NYRBrV0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0++Eszal3Gp8Fl0vOwtkw1BhmThqp9mKf1cc9WLMA4PLLDXLnz/MlMHqkbB58Gjel3V5G9dn33YQWefr2fAqK5ouByQnqifJHyYwy2+FlmKmoDy46m3Fu2Vcbysq7tabUP/89TfnXXc0dXI6oFH4558LhpOpG9v86DofHRsGAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F5P5uRTu; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F5P5uRTu"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so3348125b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788176147; cv=none;
        d=google.com; s=arc-20260327;
        b=p1KdICcdHDf3oS+TINMOgd/B4fvAHXCQAevOLUxUUeQnTCfEhBMVQ8rfnsM4W6Bki3
         eYqxEHSTaolxDfYt6fBJltau9qi8Gh1CbojrDUfWLQAacIeJsknHhJ8lMmdyNnlqhGP7
         4tlVaPE1okfq2oLqUoKCm8syZJurndFNLX7118v03VO1jTZ1hnLGqezk7aISxotQQv35
         /WSJUomco4dnVVN+/FGVRIqtjWGaFTIVsgTAZlnLD7TeO9HJNy4LugGNSXTGMWC86RQJ
         ZrA1qTkUbDW02tvu9Aj+kbuiRparZ216YbjE1lpaKIXzvrQ7P+9uKgJ/Fl8YWpeZHfVx
         VRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v1+kYYpmqjR7YioulSNP/VCyRhVs3EIdV4wSWvdX0GY=;
        fh=3bfDSgRrQFQYpC0LyJBMVvrUBuxXnqy1cx9IxICN8d0=;
        b=TA8c1NVqIGuQi3pycrvzVhRHNuF3zMz0xvutEPRbmDxEPBWV3LQy3g/HojU702Qu7U
         lPkm719l9LWwo6FPwsngRrE2qSvkWNl8LJaP27k4KwBG7pg+wgwBVfhid6SCr+5M3vH9
         mZMbMrVUZVF2d+xocctPe4UKZRXrr4f2kbQ5UPLnlmY62S9b5SpJK9hSpFmLfzr3IWar
         FfxbTWhO0LafR3m3FG/8IoARF+NVaLaBW0pnEGG6nN6N6nDYCz345phN5G4h0mTzF1bC
         HlpIDDQNB5+3NBmV0CaAbF8Ymn896iB8nsjd4V7VPLP9OpKB7dH0xEdDKWyNBgV+07Nh
         ggPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788176147; x=1788780947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1+kYYpmqjR7YioulSNP/VCyRhVs3EIdV4wSWvdX0GY=;
        b=F5P5uRTuy6Gr8DiIlS+YqcTbkx0JynRSTtPY/5B9qaEDclVB4axwWdZkjkR5INgKkZ
         7XpD4zJi98JBjHl2Z0Fnb+23h6VLc09Vs30W/hhwmorYvAc9evyznQOlTlywqv9sDKO5
         dQ4KIozJWrZnxq+sOiZh8Ohzl+VVMDqyQNM2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176147; x=1788780947;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1+kYYpmqjR7YioulSNP/VCyRhVs3EIdV4wSWvdX0GY=;
        b=k8paKZgXjR9CnosEPOA73fFmTpCVu6PxyvDBe7SeqkWLTX2uBXYDmlO5b20usjZ9cx
         xETYDbbdyzt84gkKpWhLQM8HItF9nvORlXF8Wx5gRI+09MGE9a64GE3zowK2/0aXCRXe
         FTs9y00u6efstzfWt1mNpzOZ+vZNBtItEkh5zjlMpy1MgFKBjreBHUSaJ0U6BC4Cfoi9
         e6naqMFnyJHfcVNUaqrmT1FOnIkd4KOVZA34EmajRkWUZKV2yaIs6LGEaLjvWgsEXhsI
         ZKjQtqN/OGdHq1d2s7YMAMRKCCwO6takYBi4P8TCITkPR86t9h+OfPJm3lNRG026P/Qz
         M+LA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5nvaBSavKBk6aRgILSHU4tU86VRmbPAaGgT3i4SymZN56ieUbKPlgGpKOLx4JVWI41ucQ6Y3IT4/j6p8=@vger.kernel.org
X-Gm-Message-State: AFuF++musB38w8ZBF7EdTpdWBRLAmEvOSipHo1xQLEJblNE/JZ2mUF2T
	uYPlNGNLd7pLGiPjkEuue8L1q1JRbnlwkiFArGAFuvPBKxqgPIRoQUZoShzEnsPsWcVlq6BNsfj
	N6RCQMiTz+3H0P/hCGBBUVJp6CF84XiaqcsG84By5
X-Gm-Gg: AR+sD11Yf8wjPzAh9h/CfG+nNZhzUtRl2RK9caMm4lM4FCEbshb3VkQGnIjH+fRtBGM
	v7AS5XGYRgd4NZHWiXBx38qym86HgiOkdZsVD5v1Hqrp9eKM8JxWwrFQmJkcIKy+Zbx3f7ndKZU
	nezev3MalyPCYd/359YmsfyM5LQ0rPNWE1KbNZRX0U+/KrGP2g9BSsn9sXM5OLCgCcp5to2yYTs
	gBj16LePgrmLgz9b9bDLyuu1pvcjLHClXfxfd4wxnsSrWFsRi2p4x2UVv9Sxa89eIuYKQ+kqhrc
	+C6hTthOHXxJuV7bwRCJeBmmMneWM29s7MaLi9pNMRfmewk/u3FdQrI+Sv1HdSj6ZwwY4q2rL5k
	=
X-Received: by 2002:a05:6a00:9090:b0:853:50f2:9c03 with SMTP id
 d2e1a72fcca58-85b5a546d3amr655244b3a.11.1788176146691; Mon, 31 Aug 2026
 04:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825234545.2076049-1-jthies@google.com> <apVZVCzUEXp1Ahv2@black.igk.intel.com>
In-Reply-To: <apVZVCzUEXp1Ahv2@black.igk.intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 31 Aug 2026 13:35:35 +0200
X-Gm-Features: AcwNN1UG8a3e-ri9A1fYCTOuTDVKemg5UPzTBUYjlI4nabQw-8x155-qLxr9oOg
Message-ID: <CAMMMRMdiAF1Kx9CAwZrWCiLGjrzVnoQ_Rm-m-UXSAF+fhS+y2A@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 12:37=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Aug 25, 2026 at 11:45:45PM +0000, Jameson Thies wrote:
> > The UCSI displayport driver indexes the connector's port altmode array
> > with the GET_CURRENT_CAM response after checking it is not 0xff. The
> > port altmode array is UCSI_MAX_ALTMODES elements long. If the PPM
> > returns an invalid GET_CURRENT_CAM response above UCSI_MAX_ALTMODES and
> > not equal to 0xff, the kernel may crash with an array index OOB error.
> >
> > Update the UCSI displayport driver to verify the current cam is less
> > than UCSI_MAX_ALTMODES before accessing the port altmode array.
> >
> > Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mod=
e")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jameson Thies <jthies@google.com>
> > ---
> >  drivers/usb/typec/ucsi/displayport.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/u=
csi/displayport.c
> > index 7067f2561b84..8d2032d0762c 100644
> > --- a/drivers/usb/typec/ucsi/displayport.c
> > +++ b/drivers/usb/typec/ucsi/displayport.c
> > @@ -74,7 +74,7 @@ static int ucsi_displayport_enter(struct typec_altmod=
e *alt, u32 *vdo)
> >               cur =3D 0xff;
>
> Can you remove the above line while at it?
>
> >       }
> >
> > -     if (cur !=3D 0xff) {
> > +     if (cur < UCSI_MAX_ALTMODES) {
>
> Shouldn't that be the other way around?
>

Looks fine, but shouldn't we return an error if an invalid value is
received, similar to the Thunderbolt implementation?

        if (cur !=3D 0xff) {
                if (cur >=3D UCSI_MAX_ALTMODES ||
dp->con->port_altmode[cur] !=3D alt)
                        ret =3D -EBUSY;
                else
                        ret =3D 0;
                goto err_unlock;

Thanks,
Andrei
