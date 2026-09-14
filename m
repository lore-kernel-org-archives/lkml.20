Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D157C411A02
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376676; cv=pass; b=T8z6R+PWo4jUcql/BiLBlfTyGJEgFh88o4pjO/TmLdadHdWKPymzgNsF1eJA4NTyDUx/dNbrbLswRHaCMHZh5mjpQvXm8+KZuId1rsxrDo5HD5Tr7NgAhIOx4UrRTqmSPf018sfkaKl/z0eEnl3ZE0cNKNVYuEPykadrdQX0KVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376676; c=relaxed/simple;
	bh=Po+fg1JflY23iGX44ZbQ0ZPhrPVSPOWKc9ZVsNI8LCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gm+LTEm4RcGV2n2yISmBjg2CFmmTvn8SSaMjP+OhatWVEG4dK0MNELLTsB8Asbq3BcKCT0WS4NLQsZg3beMt/qQ4Pz2so/GwWBwbCvanYzh5lVAW8Vxq6b2xdnWHzRi2JR2B78DntHGcEoDg+NQe79WVCVHoPl1OvFJBSZSPK5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1kYTA5J; arc=pass smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1kYTA5J"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-8050801d337so1213843a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789376671; cv=none;
        d=google.com; s=arc-20260327;
        b=c1mTIAXXFxTHQTKDlqBmbVhh/Dx4Z302CVElRu21DL8h67MuODZrmmomwQv8OpQxDp
         2E7vftIVLAPSE9Nb4MPzfHTJnxLEKNxVfj2aGpyPZi5V1S5hbtZtGn3102SaFhRYtdOv
         uPx0YM5J5o9s15ECEQVQcTn4ZiYEgSpbxXU86708U5xOUN/Ad7fCRwLV0zdMClaentqA
         gFNSRAO8gkPntetaZKk+6pmF+BnS5RpREqzawaoSIqg3eInBnNVKQX1PmCaVNqs5hskQ
         SEG5w3Ds3qzxN1J/zEwcZhkxE0P7MEiGKtPESofIYTnfZMS1FIbLzBUcpu5Nc5tHb14Z
         PRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6hZ4sLkAvzKguvhtkssQGq15W26aLKtU+1jNPbiNdg8=;
        fh=Z+2gv1EdB5C/mSq/exNv9511s/+O0bshMkiy02XHhD0=;
        b=a2eHKVFVaztpbazxRGpN3PTWjRrEeBhLQ0FXWinQFI2EN+izxHOXZXPhXDtVqDDn+h
         44RCwlYSkpcfOEOEsbqN2XtaTTwD9U68YtHl1BQ28hXtltpB3xiZcxZpb9xy1vYylSL9
         XCz1fOIJxGgJ1O+7piNJFrGKaRr4VTyVhNN64Yb/rAWrooYNTSV+EzLPG9fbp0srcOaS
         6aUzf2EzjwyJBVhmxc0WEOfvhFZRYcQJXYf7XrOxndA8me0AUWVv41uvnhDGwTsXZuOm
         nOCUTin3npZfGLLgikkFxzgOFkflje53rmeKRbIhBj/KZF++JMsOIqtbPyILOVk4Ta6T
         uxFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376671; x=1789981471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hZ4sLkAvzKguvhtkssQGq15W26aLKtU+1jNPbiNdg8=;
        b=b1kYTA5J8E+3TBsgdRbdwHF6G6LQmqR4KpO/ebMakEJIVwOqpxyOWM2Wy4UloHu9sf
         dm4wYFpDSvVv0ytB3Z9RuMEW+eou518bKJQQLPIT0zSZzjhYAoZf2gsVQVnOH390+4gD
         ddH+OCd/xj9XFYSGSBSa20d3FoCb0GvKvYDgvtkfYmEOVdmcvPshO6lxgJwQhrVfLYDC
         zmzoFEzpwY3zWqraDAh6bza/VPNI7PpnmZgBbcVozDXWbfvina+AJDohBd/V7nvLQo/B
         nIvDECsyWBRqIYkO6JHTNpMySlRjnRf3ms8bsvVSilNMXWfTYHnB/CePvaZtyWi41a2G
         pW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376671; x=1789981471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hZ4sLkAvzKguvhtkssQGq15W26aLKtU+1jNPbiNdg8=;
        b=jImmPBpu8gkVz1EVtAxYtSio7wePYEzO1fBfocDpBJChuGYlh8pmeqT5bcEiTKVT4R
         huDN2Rsn0HQd43kAWlbSVzFs1+dw0oa9pMa+AG3z7re3In5dGcbEKxtY3JclU2U5ogzm
         0fZokwoyv5gyvgkhI3IIlS1kugztTLYzY/ib7D7B3bUCKHUX2xQPH95Pqn/Q03NOE/Zt
         a4guVzW4sxonzckvCQtTkSN3vuhOjMjyM0ABrw+zDD/fI74eIFsWHofUO4TlNmVZzsbM
         yqpMTti6mnvLmF0NgKPjDWW1ra1+CKilOw46ofKa8vYI/hmhKGPbDcfhPymXCwV0ADNw
         n6Qg==
X-Forwarded-Encrypted: i=1; AKwUvBw0Dxs61iD5muDoi5ZYXiLCHttX9qGCanz05zh2KjY3VEaO54DjNFxnIv2gsshaMAqfv8lrPUaOFAUYlUM=@vger.kernel.org
X-Gm-Message-State: AFuF++kGnR2t1btNa6rNZNE9qUK+jqAOPsWLKNWur7onVBMNkauvEJbx
	EiMO24wANvjpvau9/+D2cj7qjV++JV8DxY3Ew3dqMTpQD2w4mimr/1sslPdS4PoJrzLNYdEmD38
	zaHgEoHxasAAVErdABGGSS7J+9S9EEks=
X-Gm-Gg: AYBFou1GOoUZrDlpP1xglgHP2cbO/61XRpX21hoIy5S+nDuZYTnDKUX3N/Wc1rjOCxk
	NOyiYhubG+lJTD0iY+OgOyw28hRPNGxbOiOV9tkn+hvUSd1E/7BSMUQvvuHl73URtcS7pNZ2uqq
	pL1bOwNcVGzNHQMQrMUTn9Sj9D3BnMO3e/GtHwgpWQLmMjR09C9MvXMA3QUhzxVESp+SHCbelAZ
	JTEgf4SKlw0KP/xdH7Dr2++PDltprlax1HeuYYf7qeU5qJTHf9NDQcSXjfsRKftZ7JgTvi/uLLC
	qDJH/N+kwTJrP7NR0xJvNbCLYLrry7K3c0SCMVTblCQlfhs2Eedc7lMpe8XBRJVjqXB6FdgPqYm
	j1QLxOF6A+7Iq1A==
X-Received: by 2002:a05:6820:4cc4:b0:6c3:8216:6358 with SMTP id
 006d021491bc7-6c542537ac0mr1319314eaf.29.1789376671216; Mon, 14 Sep 2026
 02:04:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-7-amit.barzilai22@gmail.com> <87tsnxl3jg.fsf@ocarina.mail-host-address-is-not-set>
In-Reply-To: <87tsnxl3jg.fsf@ocarina.mail-host-address-is-not-set>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Mon, 14 Sep 2026 12:04:20 +0300
X-Gm-Features: AcwNN1UGx_5yKvwgvZgvxzGgxcllCpI8_ZHciIS7iNKYuuND6gS1iU1-Bj3Y5Ts
Message-ID: <CAOEgbEqtmanqwuX-hLNG8HwNn1+NMJZUzbNFavkJEpqfQAfLfQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andriy.shevchenko@intel.com, holofermes@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 3:00=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> >  static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8=
 *cmd,
> >                             size_t len)
> > @@ -271,6 +310,17 @@ static int ssd130x_write_cmds(struct ssd130x_devic=
e *ssd130x, const u8 *cmd,
> >       unsigned int i;
> >       int ret;
> >
> > +     if (ssd130x->device_info->cmd_params_are_data) {
> > +             if (!len)
> > +                     return 0;
> > +
>
>
> Can len even be 0? If that's the case then I guess that makes more sense
> to check and bail out early regardless if cmd_params_are_data is true ?
>
> For the !cmd_params_are_data case, the for loop will be a no-op anyways
> but still I think is cleaner to check as the first thing in this function=
.

I leaned on the no-op loop in the second branch, but I agree it would
be cleaner to check this and remove the edge case regardless if parameters =
are
data or not.

Addressed in v6.

> > +             ret =3D regmap_write(ssd130x->regmap, SSD13XX_COMMAND, cm=
d[0]);
> > +             if (ret || len =3D=3D 1)
> > +                     return ret;
> > +
>
> The len =3D=3D 1 case is for commands that do not have parameters right? =
I
> think that adding some comments explaining this to make it clear why
> there is an early return.

Added a comment in v6.

> I'm happy with the implementation now, thanks a lot for bearing with
> me and your patience iterating over this series.
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

No problem at all, happy to work with you.
Thank you for the review.


--
Thanks,
Amit
