Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794553151;
	b=RNXyc9GmkOMgOuO7b/ENKHk/dgSWDSfG6tU4xvShUSY+St5ZogKWE2tQ9WtLtBm8GwZ/
	 V00aOpNrD+ig+gO11yb8cgLB7Mv3etsc0RjXlEolxdTXH6sqwZvEOZkd81CKKx/3R5bVb
	 davq1qHiS4AByJ9dxbSruFp4vPRkT3W2r8MhVRL23braiEJgt3EYfBBLM24Y13Ye2EM2s
	 aOs62L7OdLMPxb2JLuFGyL+ytsAVPJ+M2OYqysidogql6JF8GEjW9tGb5H5+i8EdVSEK+
	 Yx6No9yjgFdNCHvSHHEG0XyefoNlyM2vjDwJe/XWdYB6J+SXDpVIjsKiFRcK4CS8y6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qeIzGejgUnOZAJR+NUnKQWT+JLX+S3iStcqz+L1EeNc=;
	b=tOxH+wdVOhB+UOph4xv2CSknQiQisqGDgSZ1xNZS+mudaZQ8O86XNrirkXGyksweOjWI
	 nrBV88KbgkRHuYo/fNQzuAgBGzt6oEQE01uMb82BX46o2471jQBQ78XK9j5bfrf/dy+8+
	 GmEPHNSW9aJwACudr3XTbY4DsIE6gL3ScMmE2qB5zwAku+I0QyB8+40tUL1O8Zq2bt7XF
	 qokZHf+Unn7yrivdqCwTV13FPcNhhUE/PAFzlpqt8S6f6vR3CFP7aDn1HWTs0tIOQa0/j
	 HmYy+fnNtTlG634nmI7eTWVhev2XhKSNuvxNrN/RM/Bz+iGI6W5TV3CTRkXpy+TkKpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=yv8UBWw8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376D9606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 376D9606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=yv8UBWw8
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d427836e9so90939066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794553149; cv=none;
        d=google.com; s=arc-20260327;
        b=VmjfJ2VEXT0LWkpKEjajeYOV1okjtR/O/cTxsEPpgOQxUfx4P0SP7FTDo/Dt3HvsA8
         ZOYHU2pUkGKhxKaw/g/qTS5z3ouwvD2Gk+4h2NZ+vFDXJq7xIPkUUrbd2wRbo5dCn1je
         OVHTwwWJwQnUCB9VCv3g6iacRU0mX9Ohc9AGgZ4xH516cm/6u2g9LcDMgCk4cLYJquzx
         i/ShsPubAlC7MlvzdxOGUsLk/S55OwDtB5aoFjNAD1Rg6XtXoV653ats3r4B40ytrDQu
         +5ohfnY+3BbLRtuD7o26afi2grdhD3Yw6qZIywfFcOGL2oKzV5zPKuN++ebEnVr1hrW1
         iZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qeIzGejgUnOZAJR+NUnKQWT+JLX+S3iStcqz+L1EeNc=;
        fh=LcbHaQz1eMC0Jsqhji/m58AESMcuQRGPfxFJIqHWd28=;
        b=CvGjP+Q1YRapdGhYkgHhMd6ssEe/EIsC96wfTbx8APDWmK0+zGaw683pcPnL+HDvnO
         b7YFzIYA3wi1cqhDIMxTHfjJG/0neQNn4ytBNpA9thbG9ehjJ6Ii1T52aB/CcwOxZe9J
         YPIEetLt6yWI7RuvlocTxGtufF7g5rL2NQ9PcebSGWgb2zLXwOxKTQpL56e31CenUi2d
         voMNNrAfoHISeRwHxWviQEnAfNlet/WvC74g5IAiTUIoXaz+D7DkUTSgS37YTPeZhhZf
         rDoa7ZqEb4SNlAnvOKk5y0/ASoClh8sepVFxBF0E5xga838dsDcOLkRV9dtVqFgaTPAj
         MRfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794553149; x=1795157949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qeIzGejgUnOZAJR+NUnKQWT+JLX+S3iStcqz+L1EeNc=;
        b=yv8UBWw8+3wCTR92+nxE0nmLMArTGzE6Ezdymo6t2L6PVidgmuf99L/gf9wApGZVLF
         MujXKE7gtXTDvh/VTttvmrTZVmwUkWND5tw0R+mmAaHlSi6KAQNCjzEoE8a98Adih5zg
         OR25M5gaZD3H6FazwL5UKFl/Krjsm2NlIkoP9B5noXVIdYZ4n154vlYzpYg23HvcakLH
         jisUu+HO8fIGQi3l2MNGLeEjhz74mAZbrMh3TwYvP4ji8KAQUZMsWof7/1w9QRXt6fdi
         s103+8hy9Ke58DLD8w2P+diercjuAwQqHcvCZdZCvfz2uOq1RgnghI0ljrEgpUbJ/K+w
         gBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553149; x=1795157949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeIzGejgUnOZAJR+NUnKQWT+JLX+S3iStcqz+L1EeNc=;
        b=egGXVvbuHGl+5du4af6pyx+Kad4HRCdRK3IIltGU1W6UvE0Dj9QHz4Qsbd5bfU7p77
         4vp4JyZivWvJVNdYFFTt49Kby1Cqmg4WRIcd1w0K/MK02nMkgIj7QHTEQLqhDQRDVWGL
         P2P4j98xkVU04vv2mqtH1RE8BDWQ5mSx4u16dfsvflP2EMglxD3CDyJxwXKsoaZhgJHi
         mJtNMUtCqq+SkCQ9ewCsKm2jxW2hj7Er2ui27unnRGckYR7TiHutDt7HpXupyRi3sY2S
         Ns0kQpFxURYRs9gYiDT4FSe6ryyoSTMKpKMdrG3UXAV7/QdZ9A2fZktG2kiQWRk4cKMm
         ORsQ==
X-Forwarded-Encrypted: i=1; AL+hErHHSYhgwSUfoVve2TBu1SZ3hbbKMXpXkRckLM8TwYnDeujxRmaxl0YhmhudLJOs1gYjbmnINRDE+pGyx6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CNWLbwoO+cowyTRVRzFQoI631jG2Jew3BG6Xr42hw2bRHJF3G
	97bO+0SB1XYH+VlZoPks+K1RPxyldZY92C/MT/hdjAndt6PURhk32315Eg2VtLq1OX1odAUDLec
	zfHY+QvsuKscM1Pjxdgdn1Xxu1nDVG1GcaoeKkpwHQA==
X-Gm-Gg: AYBFou2t9gM9w01++73vHymOplMlNZUgfCrqLKNubGoyDhnonTPAj8lXL5tNuqmT0ij
	ugKpolCJJNgFY0vLuHz4p+Zqus5j99OaiblQf1w1ni/x6U7mcCwg+C+9FZWjmTwWlFVfLn25i9N
	ivrl8wqw9yYMIV8RpvQDKrTDkUJGrYkyNcN02GnKf/blwIcPQA2OW7eNW3lV6gPO9ISVaXhIQTE
	U2LJ8hHBTutSjkq7pA9xOvbcBQBy/iS4eUFQZwzOdVKxB6zeXZJNO7H2gMSLorhNuhmz33a+FDK
	gJPrlygF+HetHcEAfh852RN77byP4yio4xEFXAkQ5H1+TbjO/TeM0pF4I0ujlsQ46rK9Ay/iTg2
	DcIMK3UFu6kYNVCJ8PEby8ctTruoTTU6PWt14Qc2w5SiPDOy81L4mMD7mfbYysEMzbiBI
X-Received: by 2002:a17:907:96ac:b0:c29:3c97:c994 with SMTP id
 a640c23a62f3a-c50963bd677mr113775466b.35.1794553149505; Thu, 12 Nov 2026
 22:59:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-udc-connect-v1-1-03c73259642b@flipper.net> <57e83596-03c7-4406-b01c-db2ad2298413@rowland.harvard.edu>
In-Reply-To: <57e83596-03c7-4406-b01c-db2ad2298413@rowland.harvard.edu>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 10:58:58 +0400
X-Gm-Features: AclHuK9vJOW-Z7MYq2yRXHeCiiCDHnszsRMvz5_5l2FLX1hDAYnqlpu_XsOjoZY
Message-ID: <CAKTNdwHb4ahziiFLDCCWsi9_65toGx=HTkvaB7bv3vhqzuCc6w@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: Clear a pending connection when
 starting the UDC
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Fri, Nov 13, 2026 at 7:36=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Nov 12, 2026 at 06:31:35PM +0400, Alexey Charkov wrote:
> > Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
> > connected"), usb_gadget_connect_locked() returns early when
> > gadget->connected is set. A connection requested while the UDC is
> > stopped sets that flag too, without enabling the pullup. A later
> > gadget_bind_driver() or soft_connect "connect" then finds it set and
> > never enables the pullup, so the host doesn't see the gadget until it i=
s
> > unbound and bound again.
> >
> > This happens whenever a UDC driver reports VBUS through
> > usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
> > Type-C port controller switches the controller to the device role at
> > boot, seconds before userspace binds a configfs gadget.
> >
> > The pullup is never enabled while the UDC is stopped, so clear
> > gadget->connected once it starts. The bind connects according to the
> > VBUS state that the core tracks anyway, and a function that deactivates
> > the gadget during bind still has the connection recorded for
> > usb_gadget_activate().
>
> This is good but it doesn't go far enough.
>
> The UDC core has gone a little overboard in the ways it allows gadgets
> to connect to or disconnect from the host.  Along with the automatic
> actions associated with bind and unbind, there's vbus_event_work(),
> usb_gadget_{de}activate(), and soft_connect_store().  In some respects
> these interfaces act at cross purposes.
>
> (There's also usb_gadget_{dis}connect().  Those two routines seem to be
> EXPORTed solely for the benefit of
> drivers/power/supply/isp1704_charger.c -- is this really a good idea?)
>
> In addition, there's a good case to be made that soft_connect_store()
> should rely entirely on udc->connect_lock, not on
> device_lock(&udc->gadget->dev), and it should check
> udc->allow_connect instead of udc->driver, and it should not
> call usb_gadget_udc_start_locked() or usb_gadget_udc_stop_locked().
>
> And of course, as you implied but didn't state explicitly,
> gadget->connected is being used for two different purposes: to indicate
> the current connection state, and to indicate whether a connection
> should be started when it becomes possible to do so.  There should be a
> separate variable -- or none at all -- to handle this secondary purpose.

Thanks a lot for looking into this. I'm happy to look into a broader
refactor and submit it separately; however, I believe this immediate
targeted fix for a recent regression would be good to merge
regardless. Without this patch, the gadget doesn't come up at boot for
me at all, and a larger refactor would require multiple review rounds.

> The whole situation needs to be straightened out.  I think the following
> approach makes sense:
>
>     1.  Connecting is never allowed if no driver is bound, because
>         in that condition the gadget can't do anything.
>
>     2.  Connecting is not allowed if Vbus power isn't present, because
>         it would violate the USB spec.
>
>     3.  Connecting is not allowed if the gadget driver has
>         deactivated the gadget.  Note that the activation setting has
>         to be forgotten when the gadget driver unbinds, since it is
>         driver-specific.
>
>     4.  soft_connect_store() should be able to force a disconnect,
>         but it shouldn't be able to override 1 - 3 by forcing a
>         connect.
>
>     5.  Whenever the state changes, the gadget should try to connect
>         if not prevented from doing so by 1 - 4.
>
> In addition, the gadget should be started when it binds to a driver and
> stopped when it unbinds, with no changes at any other times.  (Read the
> kerneldoc for usb_gadget_udc_stop_locked() to see why.)
>
> And the proper way to test whether none of conditions 1 - 3 apply should
> be to check udc->allow_connect while holding udc->connect_lock.  All the
> relevant routines should maintain this invariant, perhaps by calling a
> subroutine to set udc->allow_connect whenever the state changes.
>
> Have I left anything out?
>
> We do a lot of this already, but not all of it.  How would you like to
> implement this scheme fully?

Let me give it a try and send an RFC series.

Best regards,
Alexey
