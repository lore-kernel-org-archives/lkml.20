Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C264A2E19
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488218; cv=none; b=dD8pl0lbz2RJUWFJYXhPFvyeMZNGPWrCD99wiTGpP6M5Dc1cglwVDhlEER/LLfAK53sVbHEwIl+GA7oTZYY9Wm+ZuFIAXRK8e3z/bok6f3j4GUMdgRwp5sIXq8IcFXRWq9aJI8jRB9I8QtoujPRiN94VHYKLrXqCqkcvGFisOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488218; c=relaxed/simple;
	bh=QlBta+H5mNjq+dbHXbi+7XyTVzhQ/G0m8qgfcGULLxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0zLVQci0P1l0Di8wX/FvuiJcf8jBthjTlICrsMV+gD5YKgPYe3yOjE/+FvZaRXyAlpIksflEUHUfZjXK8qZUoaizF2PXvTXctbkRBG7CI/kDhSyVXus+lZZRlxbKvBHZaxAlCpajVQObgN5gpC8pZn5bmOIqTIz9o5o7RkHIqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cpmIPRxE; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cpmIPRxE"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so1867705241.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789488216; x=1790093016; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=cpmIPRxEcempory3SIxkdFSf86aOfHsCBohpcyFrugH/tFxsOAQPqVAvh/7dbLjqW2
         97oW1PGcdrumnot4eERq3IQdd0qP/TjiWSgTN6N6E2edaEQTjkqaUWmWZOlHJniGJowQ
         p/hLCUXMJZ6fsTjIaN1PK7YygNskpUxjCFSW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488216; x=1790093016;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=KMfUML4SCKQT6oTjn0v39GuUYtqM3YXJzJTol/9tS9er8OCzQDeILf72Q3D2SzoeoE
         hu7uGXa4Mx0c/1ikT5iQLWfyjhPzkrztJisoKbYW6Q/xIHOUpwvWXDOWH/DQCdAvpDxM
         Q0GUutPMDccm7OwXL36c3IBRJy9pc/7AKYGnju+GNgWmt/Lo+OQwImHDdz5Whvm/9GC3
         ZV80mfQCpIeo3WPgA7m8ODROk+osuVN1Qj+6azSt2+zXH2onFcowI3PskUC1aGkz/pgm
         N50PUQBQ79mPjZ7aNfw449v0XZ5bb6Wszso8qGK8Pami/EcOB7FxGvqjtQ/W4tyUlM3y
         TBOA==
X-Forwarded-Encrypted: i=1; AKwUvBxxpLcNqQXOFfIeUIqmANTIckVCZZZ/Qg2+WkoOyKSXKBidE4HgFLdZ2UFFt+nh5EvbwYuBKXku66fZ1Ds=@vger.kernel.org
X-Gm-Message-State: AFuF++m/BYVoEYzwPOGk68/s+Gt5RaZVNrnnpBqLejpSOJi4ivMpSog7
	LzAjWZJc+wqnEdOWDe0wUDy566n1ORsu10j7dADeNXJgofBkT1hZZo1EDUqjv9qFCpe4Kt912gA
	s3jGe+Q==
X-Gm-Gg: AYBFou0Ocj24y1DYjSAxY/LbCe7CKuRHv3Sy2mE8ywiwOjKLfn4Qn5HBx+1Rl+fv6z3
	0IWfw+GkQncIgGTAy4b4UfGyQPrpGFRxvkGW5ZD9A44S9hfHe3mabWYrFXeNUzKLlvj+oGd8xSM
	kBvuw5tOlDKSTtDjwW4FLM2SPIWEkCNaWTWTVc9CJ5DxgkkNtAcVGXWqToXxrhKi9NAeeP5lrTn
	ONG93R9GyR+OwFis4gQdK29fMmV+z2Gm2yocuHUfEMaAcCeG3ElIMAKzjRO8UqG3zPoQZIUl02k
	5qR+4D8Bgg76nsBB4M1D7rMUOlj9lYrvxBzZ2nOvYPVhGWdUPA13T0+xhd2L+YcwLZmoNRPoy5B
	Qsb2Tbv2Ajayhe1sAjJuCdS8YPQSRW6IeMJuiyVeRXMcj+2Pk+De5TIvBmwK+sZCQg5i8Aau/X/
	pp9x1se0XHXnWyRQV98qB19Jo5T5QFkxqVmnnXay2X3epd9g9izW4Kgd1mbehCmbreBn8wmZnnB
	jA95sZ+5ntC8tNtcLefsnZ615q5IAe62Mau
X-Received: by 2002:a05:6102:50ab:b0:786:4822:308f with SMTP id ada2fe7eead31-79b5c02d67dmr3908871137.13.1789488215808;
        Tue, 15 Sep 2026 09:03:35 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c84716a167sm16312230e0c.18.2026.09.15.09.03.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:03:35 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a7003f9f5so2508006137.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:03:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz7z9x708MNwI+9DOvtxwvmRdfCqGWX1MZikPvqUaOJj5NsGi4YLMO9weliBZBn9beUyqHzx3UHsWYiArI=@vger.kernel.org
X-Received: by 2002:a05:6a21:3315:b0:3cc:3d08:da2b with SMTP id
 adf61e73a8af0-3db405ca519mr21103752637.15.1789487816474; Tue, 15 Sep 2026
 08:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain>
In-Reply-To: <aqfyYSagcejWb4xD@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 15 Sep 2026 17:56:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
X-Gm-Features: AcwNN1VOeS6uL0_wTY-nR6d_j0OJAaYWMrSrW2geaFCqxnwzMq5M1mnIaCQWjMI
Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Dan Carpenter <error27@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan, Hi Sakari

On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
>
> On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dumitru, Dan, Ricardo,
> > >
> > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > Can you check this
> > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > patch into that, otherwise v17 it is.
> > > > >
> > > >
> > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > that branch yields no warnings.
> > >
> > > Dan: any plans to merge these things to master some time soon? Or:
> > >
> > > Ricardo: could we use devel branch of smatch for some time?
> >
> > Do you know what patch fixes it? If it is easy to cherry pick I can
> > add it to our list of smatch patches
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> >
>
> Commit d12183645a31 ("precedence: silence some false positives")
>
> Sorry, I felt like I was close to merging devel but then I started
> another major surgery to the core and got stuck.

Thanks for the pointer. I have added the patch to media-ci
https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351

Now that I have your attention ... :P

May I ask you to look int
https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
in case you have missed it?

Thanks a lot!


>
> regards,
> dan carpenter
>
>


-- 
Ricardo Ribalda
