Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB233E49FC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819709; cv=none; b=WjFF2xGJWzsy2m3AN+UnRV38o3osjbNWzGdXaJtso/Uhzv+EaG4AWkOnIjJy8nLzCkdKMw4TpTsetxPmqmz2JjgUWQBJZRzZt+R3G+AZa7/DPfUd91vu+3cRxiMVTSc8KlA2x89Puukhe33O2nKyzhJuHuckvRezH5MLHXeSppU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819709; c=relaxed/simple;
	bh=aY6nh6kFnaUy0X3Gx8FdRy6Aa/JjqWlqST5uY5iu/GY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWlRWusllt4t2hJmnb78mNwCqDNvlCNM5e/0MyjnYfh2ObXLta+ReoerDkySLJBsPxuKDYNW5SmfR6mgTk8q+D8q5mSkIMJxYfkbMh1zcn2E/WqYxwVr8QTYU2a057+i8rGE4u0qkihW7speeK98l/cDxiOeM7u5PCmlhLo/Y9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oh6w7USj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oh6w7USj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fde295992so617209f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819705; x=1788424505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dik6jzlimTu6ELuxYKoIuh8koP7biCebfRQVKpaWB38=;
        b=Oh6w7USjGJcvsHhR5Gefd19vIh7AuedVrpYGq6j0LhMitETgGwNw6U/UvLO7RjVzNB
         60dS8QWCzi100D2/fhVMG47lQhq3Sx4t//ZgzeAqAGLwpsl80QwkkyP4Vxf+m1/Kwmzi
         URq3ybmzWd0CM3EHeuFoZaze/f8I9ueTdXz2+E10Gzv1F3qoPHI9fTs9xyBt2ueXjSlv
         mDlvpdoZhBfWm1P0MMcjtRg6ridCiqlOMCZnLwLsjmqwsjrYl/U38+yTNPwyuQGfZ1PZ
         vo75ZUXaeRI5wP4El2MH8nzENIK4dCvlPgLj9tu9o/pC5Ry5TfbjmIgUurle6wEpuQ4n
         Dolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819705; x=1788424505;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dik6jzlimTu6ELuxYKoIuh8koP7biCebfRQVKpaWB38=;
        b=muisl2OJVWY4ZqlCmd/ygBj2TmWSXOItVPqYTurnM1fo7J5GjKEHMaqT0umS5OI/m5
         HcamLWsfOsEBjxRG4rsq1wBeCNOPZy7OMjpq56mgJqRqSSnr5FrhqPUw8gTwTnUitZMG
         ADnWL2fvv3d6FTxWDugbr2VpdMD/QXEPl9D9+vtaZpnb9Dj9VkzjJsd69mxnzFe32yzn
         0qzibQLYe4dXCTOa8NUdIHuHnRrBq/hBhZbx2MB/AsIcXo87LYwO5wANmpKNh76A1kfJ
         qztgwwOaxt049gv+/IOA3W4SaFSM6tA5k/mIYimVD/Nj8BlExmq2E09/Eja1WKQnbxq9
         foZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6hu8Z7woVj26YGnJT3lxWI5sNWwMnmb8CajMudxvtlnwGLQc+ydD8dBxCEaD/XwGdcBK4YBtgm1eF0KQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nFat1nxbF76thHGON4x3Gj9a3dlYNF4Z4jVR7Pg89jfVsFBTfv
	bdbsr2aykDpVB7EEZdORBm1kLX6pwcptz4V6q4uRjNVe/CDkgW+ikf0bJUk7OCnK
X-Gm-Gg: AR+sD12iJ9z+qgqBjjx96l6s3u6uKpaLYoUgNDps1aX+4NcwXZirbyFkbhLDt5Vw3WG
	VgLgWAlA/uGa8grYiydiDr5j4Xibdio/+7HYRduyyV4tiIq5e1EPBFxZNhl5bvisEMxMsOxQJqZ
	CuK4VCEWmOS7XWEF1Eb0f3ZbCfLHJ8eOBXdNyofKTrSPdvCFRUfWfBfp9gAajKW9125/yrbI7go
	RHEDetatxqPaF9Kkm6AQiPOLC2s3HSm5qOqS1vq9nMC/CHnsIl1dpdOMVWUWUSB/Zqs+2qbtJZ+
	D7+ocGm+uZ6zHborCE8xJmDhaaao1/XBQyPtnI3Oa0teeSpvvjhGODi/3Abe5da06DvHkxdVFJZ
	vEX655M/JxOEWsnbHVDUZSicYHG40sSyAgg87fXyhVAYBJnRMtf2gWY3CqtzY4dJs0FPuWKmXXL
	qAd013fguPFZu/7fRrJqBSSnXln5lCyETNEcMKRz0CRJM9H6zUpTX2W7l4b/4ge6GW84CjQQUkX
	X+Av79fEePY137LGjjiyAr+eSHHFdxfhOG0
X-Received: by 2002:a05:6000:644:b0:482:e658:7a39 with SMTP id ffacd0b85a97d-482eaba7f73mr5971287f8f.11.1787819704450;
        Thu, 27 Aug 2026 01:35:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28e81besm7082559f8f.25.2026.08.27.01.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:35:04 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:35:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vitaly
 Lubart <lubvital@gmail.com>, Karol Wachowski
 <karol.wachowski@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] issei: INTEL_SSEI should depend on X86
Message-ID: <20260827093502.23b6b062@pumpkin>
In-Reply-To: <CAMuHMdWDcfrUM4tKGOO3fHJQ3FnYBu-tPG61BY_069Yv_TxXKw@mail.gmail.com>
References: <7145ead76cf7cf399eb4e1e6039f51cae07b49b4.1786009079.git.geert+renesas@glider.be>
	<20260826100848.12eaf40e@pumpkin>
	<CAMuHMdWDcfrUM4tKGOO3fHJQ3FnYBu-tPG61BY_069Yv_TxXKw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 16:03:11 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi David,
> 
> On Wed, 26 Aug 2026 at 11:08, David Laight <david.laight.linux@gmail.com> wrote:
> > On Thu,  6 Aug 2026 11:46:55 +0200
> > Geert Uytterhoeven <geert+renesas@glider.be> wrote:  
> > > The Intel Silicon Security Engine is only present on systems with Intel
> > > Lunar Lake CPUs.  Hence add a dependency on X86, to prevent asking the
> > > user about this subsystem when configuring a kernel for a non-x86
> > > architecture.  
> >
> > Should it be X86_64 ?  
> 
> I don't know. Can you still run 32-bit kernels on these CPUs?

You should be able to, but there is no need to support new features.

David

> 
> > > --- a/drivers/misc/issei/Kconfig
> > > +++ b/drivers/misc/issei/Kconfig
> > > @@ -2,6 +2,7 @@
> > >  # Copyright (C) 2023-2026 Intel Corporation
> > >  config INTEL_SSEI
> > >       tristate "Intel Silicon Security Engine Interface"
> > > +     depends on X86 || COMPILE_TEST
> > >       help
> > >         The ISSEI (Intel Silicon Security Engine Interface)
> > >         subsystem provides a communication channel between the host and the  
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

