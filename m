Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709512;
	b=e2YSZ2Z951MEJiCdRL1MrKTJBfABaB3QpUYuCiqLQMit6aSudKOwBixkvcM1onuzIeZk
	 8Sgqdy+Y80MjaDmiMu8jJ0MUbUoIQfNa14D5wctKFpgcf1CKJ8RetIWS2hXRM+El4W1hh
	 QmKZto5gnY2+dMswSbRDRDGJkI5jmB5KZiJAnNjDZtdiue85JVCIPWl5wXRZOEcOx0PA9
	 uTKm7nqj6YmutBzwREneih9eBgxbg91ojL+PzSt6Ccis/pMvp2cRLfSnh5a2Wfxg8P6Hl
	 X2vcdnTn8RF57J3rdNOooKAYnASi9XftQygFGWnRIgpt1OzeBnmeX51Awnw2YoOT/OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X6mPg6UiwEtZQv33ZuddKbr9Vgpx/S+VOXpbm0Wczao=;
	b=l2tBgzPxeVAs2HdJ97lFt4dXUe7Mt8juH9Xx6M8rKsQLDfun/v5deX9ov5GVMO1wXaRk
	 iqoKJ1zj+5iGX2Tgb6EehuWaJGv9I96QNIfBKMzQ5L+nZPCk5x7PPFyvciqVABuQA1QZy
	 +Uu7Bne69cxoUIdNu41IQT4eRwwBu+hkieNkE4cIHHTOWoWqUnVv/hH2j7Uy22nZAg0qx
	 4iqsYIvlCvbEw0RSjGyrgBwyVub/E4TiO24dXQWCVeNh3681KgmHh6D/H3GPB3UASv4j/
	 8nxS4TaCNa0igQMORgcTolt0tdkjs6B/BMxF1rfyCtsf91wchfofxbHZ1D46BAMqiHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=acXV3egG;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED74606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED74606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=acXV3egG
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso537182eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792709511; x=1793314311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X6mPg6UiwEtZQv33ZuddKbr9Vgpx/S+VOXpbm0Wczao=;
        b=acXV3egGoTGYDjhdvrmZk497EKmTNRskbF9WlLcG7GYMYMFF1ksn4VI2y7BZGpMJCZ
         SwrJOiYphQOIuAHhJrkM4WmIKjioss1sLDSUBi72gPDta58g5qXAoWl6R8biJdB8dGvU
         A3vg6/M4WwR7KJRZqikZ4deUJnjrt+Ngt87dL6uJ16ObnnY8RGiKI3Aau6b5HcUaAVd8
         JhmSgl3bNjAaODm64JbQTBHDJdY0zDM3obmTalXqc6cYPRs+rc+YE4tBCyltdg42g1X9
         yg+Kmru7yX8g9EF+eGMF56pXr7WfdyPuJxdHgulU6ykalltNNB7ciJ9cRPVlIXkeGkyb
         aqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709511; x=1793314311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6mPg6UiwEtZQv33ZuddKbr9Vgpx/S+VOXpbm0Wczao=;
        b=vTcjQGVH8Ciaxve8b7pgJLG02kgXSyrAYyfurMqTegYvgQ6Fz0bkFsWJzp8Pcc3aOE
         NnVNqHDLVC8wWixwYzgJ5sA/ajhzsIuFr8qeVXbAufRFHoBEQrhY3F+CzvUvqc3C6ZtI
         TDERRnlomRsAJXTQ5pG5IEhnyDQdC/N5dD4cX9GkDoFqVROsob67FA8MZ+42Wm5q+94R
         eGqqQDRE4CyKyaxuFLD1l+oKtUa/COzn5PPbD9ECmY43siCCHfVI1LIEH5Ti89N2tlzb
         RDdHli2RGs0aOdg5rSkqfagbpuNDBleGW4oH8JksUe/7iK+rnfk1YZvMlL0enpuCMLqL
         E73A==
X-Forwarded-Encrypted: i=1; AKwUvBxWhbJ1HEBKMBCVzuidbuZcA4xRCcDRZ2AVUVlTmceuwEJtkZKYUU62jxbj4OqS0KDX/8YDPxISKGY0B6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuU5pY8tztb4QuZJyjVDSJDnGua380BoduhBU9ymfjjKyMPIW3
	3/dfpcxtfSvuhOAeaJ1j3UexVd655FecZEF4SobFriVdytdb+e04ngYw
X-Gm-Gg: AYBFou3eUpimy2jDy5BLDqX31b43toXncay0gfoOrtL39f5DEMiDDOm4F98rmF/eFt+
	FDMXf1E0BQC/0uJBPw1aF2aTZza4yyWhFyIkBhcyAF1p0S943puujRTHog+0L3BO2szfebJffrv
	qkK1QQ54vYvd7DJa/F1jX+OpXecutqoxLmQpcMyTP51fkqd3d8smLCLwilKumT5lP2L/80lLb57
	R/4FVsP/dmVdufTk1jQ9pji7zlRxGfgwxgA1jw2d5LCe3P4luBQRZkJgDFchMfaqAb1KZtt1gFo
	UvqZjYyVvLdouQtsqspwIF1xc3nSi+zLprJB95880x9CWpcAHZBZCIgmxsOl3qgFN1NNXZgNZV0
	4wb58XFFDmuzjD+WIS9vWaPm2avA+0ko8rNxw4o8wwZ26eqJyJ2/CkLk4i1RXKhbayxlTTnjz8a
	J4adlq0On4m/uTLNZ3AmokwVWrBdXklmHZhh5ifhGAFQ19wvDkyltgu5WjXV0AXBDKJlRsbEGDb
	U+/Uibw8fI65ZQwbDITFAsixCkJXmd6ch3HZGV9YCr9z34E+3xqxZ/BY41RjD2N7LGbqJcixpk7
	+weioBdA87K4c3oJia79sw==
X-Received: by 2002:a05:7300:ae21:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-369d90e3646mr708317eec.1.1792709510886;
        Thu, 22 Oct 2026 15:51:50 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9db6865sm1071997eec.17.2026.10.22.15.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:51:50 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:51:47 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, 
	Miro Kropacek <miro.kropacek@gmail.com>, linux-m68k@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] m68k: Fix atari mouse movement
Message-ID: <atqTLxkEusWSS-wf@google.com>
References: <20261021000338.2160223-1-miro.kropacek@gmail.com>
 <20261021022336.2232886-1-miro.kropacek@gmail.com>
 <c77944ee-f170-ce57-9065-d7d49fcfed6e@gmail.com>
 <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXWHXjbCNojoukGq4OWvLSibk-goJo4quLdbOj01neOew@mail.gmail.com>

On Wed, Oct 21, 2026 at 09:32:00AM +0200, Geert Uytterhoeven wrote:
> On Wed, 21 Oct 2026 at 04:51, Michael Schmitz <schmitzmic@gmail.com> wrote:
> > Am 21.10.2026 um 15:23 schrieb Miro Kropacek:
> > > Kernels are built with -funsigned-char since version 6.2, resulting in
> > > the signed 8-bit position deltas reported by the IKBD being
> > > misinterpreted as unsigned.
> > >
> > > The hook is handed a raw IKBD packet, so take it as a byte stream and
> > > apply the sign to the two displacement values alone.
> > >
> > > Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
> > > Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
> > > Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
> > > Cc: linux-input <linux-input@vger.kernel.org>
> > > ---
> > >
> > > Changes in v5:
> > >
> > > - take the packet as u8 * and cast only the two displacement values,
> > >   as suggested; this drops the call-site cast v4 needed, and with it
> > >   the -Wpointer-sign warning
> > > - add the types include atarikb.h now relies on
> > >
> > > The same cast of the two displacement values was tested on an Atari
> > > Falcon030 with CT60 in v1 of this patch; v5 differs from it only in the
> > > type of the hook argument.
> > >
> > > Michael's Reviewed-by from v3 is dropped, as the approach has changed
> > > twice since.
> >
> > Dmitry's reasoning makes sense to me, so we're back on v1 with no change
> > in functionality.
> 
> If it's just a byte stream, one might not bother doing s/char/u8/, as both
> are the same type anyway... and then we're really back at v1.

I'd prefer to have u8 at least in input.

> 
> > Looks good to me, feel free to add my Reviewed-by if it helps get this
> > merged.
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> for the arch/m68k files:
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Could you please re-post v1? Can;t seem to find it.

Thanks.

-- 
Dmitry
