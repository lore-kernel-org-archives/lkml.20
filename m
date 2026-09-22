Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F00047D44F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076796; cv=none; b=PaFj0pSqev6JsxjS1l0zm4Yq1Zgvigf9HVos5cGi1TE719VTUOE6Bo6ONr+Z764SPbWuYBWYSXX3sxc3G2eO+0Vyc2xuHA4Lwveqcu4mOR2Sz26ljy3/ZgITkP9BaAGBtICyxe1iStNOVA/Nc6gkB+dCL2JZZTtEy8P4koL4KM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076796; c=relaxed/simple;
	bh=vAqHJkJK8NybKzUEyFkNm7wHMeyR870vyueLoGzt3yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhvDLLPHMBCjixx4WYzV2sQvCd0J6lubjXcGubNK7j1EL15S74ZWNk4S8XIz5DoTjkdQpzbYuNtaXZBYC077V1mD/hIkD8+pT88ikT6ZwdDEuljVme7h5GwcrFkvgbbp0lrE/e8KjiiWQNc/qZbC6mFGfTZkK0RDGAZIJyfPzOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=boFpp0hn; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="boFpp0hn"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d9004a1ac0so26235285ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790076791; x=1790681591; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=boFpp0hnxtVmMwKd1XF04JeyJRLiKHsV2LY2OHi/YdmIz7nnpla3zJX24n/ATy10Qi
         BeAJ0Psj4Mw7QhMQ2ZM68TK3Kd+2TmkKD+1S4g35sUblsBmUh/SZhlsZl+3OYZ7Mfukr
         WJauVjl/ksQu4u/DDUny06YI4vLb1jwedjg2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076791; x=1790681591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=0ctu4S6io/pxJxQ01RXIViFkOaUKT/sVgm+C0frjBsRcWFXmHFUcmbEcndHRyG/cuq
         Qn3Vl6puuhKA+TJKLkP9JZSr45gkbB0EYcd75V9MWQMrtsOjG8nI41XH/cYBrNGoXCOC
         O4mXeJ6UjcA+CqgDphgquUYMeRdXr/sCdBcaEEGJdjOXBk+qW01OSrFsM0BeQF12J7m8
         SV/nrzfrPFaj9j5vSDyTMJUtyL5an6kAQ4nMkOAmcCM4jzzr4Bjj5Yfu2Wa+4qSOmq8x
         NwqNwPnqDmgzra9F9Xd5bZCjwWTnRsPl+Vb50Vy2OsC2GXa0a7viPbCP/HMd1U8+EBM5
         7KsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqHSqClcjNXE39jNquXK8yVDHBRT6rlEmMY+PymuzyBx0oyu9Rqv36BImaQc7h+KjYDjmfhPoL1g1T4Pc=@vger.kernel.org
X-Gm-Message-State: AFuF++kxDPk+AvpiyTMldIpupF5zObx2Y4xJeOpCB5ii5xKrsy5K3VDe
	Vq8tD2kcI0F+Wf8PeUAxdozHT9JoV0MwZjb0FWYeQG2xveLoR3zdRXLIwuRQz0t0nFrfZxjXJvO
	LqDOugA==
X-Gm-Gg: AYBFou3KIlYqqEwHJ8k0cevweL7SWUL5kL1RP5i4XJ3wY5FT6ECwwNGWeRI9VBOgSMw
	znNjpuR25NdLj+odlY4imXsOXvv5ZoHKQkDpOPAr4eB3xlqef33IDHeast6aoBryRwPPAJh02Hp
	3JjVziZ2r8yFOShvLwaHnJ+7UUm45B/LHhAQ+0e+Zp4SLnW8WqbJVBauvAPsjDR0NfOpqM1BIbc
	Hm/PDx6sYCfyQrumau1pp3nTIlP4vDvWqmZFMC9FyH3Gg1Uqi8yvNxMmsyTOQYenHKZCponG5+g
	dETr/oEDnnxWuX4ZwFjCO/dQ7WZ5Yiqpplcn9SKCK17CYBeMMnAAOMoE/Xhg2prnv+9S4CAGsc+
	UneDYljMke+DA4Pvb2fCLDRf21j4lfZCfK50Ewh6n4VKDEjFIY08snXNhchOidQbA5S2CiLSEvQ
	olE56GgVpsLr4U3j55Tx897+L0ftRlomqNh63aTM/IAGpI7v6N0YBlnRPPPSOX5sdQnwd+/bcbj
	UW2mogvmO4Nl3sMwFS6VxgyUnX7EHYxTwZhk4D9BnlFASU=
X-Received: by 2002:a17:903:b48:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2df609b207amr10567715ad.12.1790076791238;
        Tue, 22 Sep 2026 04:33:11 -0700 (PDT)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com. [74.125.228.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d030ea6sm8477385ad.44.2026.09.22.04.33.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:33:10 -0700 (PDT)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso1742827a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKwcwjX/Mr+NtqHvtuMj0syZlzxlElB30JS9vhVeqaQFwRMlOop5LEwCMcra4uKflrM1fv/M1P7D3Ld9w=@vger.kernel.org
X-Received: by 2002:a17:90a:e183:b0:39e:6c6a:209b with SMTP id
 98e67ed59e1d1-3a0732aab47mr857626a91.60.1790076789532; Tue, 22 Sep 2026
 04:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain> <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
 <arJjxjiWVlnHhioR@kekkonen.localdomain>
In-Reply-To: <arJjxjiWVlnHhioR@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Sep 2026 13:32:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
X-Gm-Features: AcwNN1XSEqnhRqXFFRQlQKzrgp_us5KopVV821iFq_cxHFRxG_Sd7N3TpS2PoSA
Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <error27@gmail.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
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

On Tue, 22 Sept 2026 at 13:17, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo, Dan,
>
> On Tue, Sep 15, 2026 at 05:56:43PM +0200, Ricardo Ribalda wrote:
> > Hi Dan, Hi Sakari
> >
> > On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > > > Hi Sakari
> > > >
> > > > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Dumitru, Dan, Ricardo,
> > > > >
> > > > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > > > Can you check this
> > > > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > > > patch into that, otherwise v17 it is.
> > > > > > >
> > > > > >
> > > > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > > > that branch yields no warnings.
> > > > >
> > > > > Dan: any plans to merge these things to master some time soon? Or:
> > > > >
> > > > > Ricardo: could we use devel branch of smatch for some time?
> > > >
> > > > Do you know what patch fixes it? If it is easy to cherry pick I can
> > > > add it to our list of smatch patches
> > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> > > >
> > >
> > > Commit d12183645a31 ("precedence: silence some false positives")
> > >
> > > Sorry, I felt like I was close to merging devel but then I started
> > > another major surgery to the core and got stuck.
> >
> > Thanks for the pointer. I have added the patch to media-ci
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351
> >
> > Now that I have your attention ... :P
> >
> > May I ask you to look int
> > https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
> > in case you have missed it?
>
> I understand the required commit is there and I tried to push the Maxim
> serdes driver again but I'm still getting
> <URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/110822240/artifacts/file/junit/test-smatch.log.txt>.
>
> I wonder if we could have the devel branch there or some more commits...?

I managed to reproduce it also in my computer, so I do not think that
it is an issue in media-ci.

I would prefer using only tagged versions in media-ci.

Dan, how far are you from making a release?

>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
