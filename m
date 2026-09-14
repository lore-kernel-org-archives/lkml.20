Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B20E493658
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407175; cv=pass; b=cmzQ8s3oUzW1FbbR85oVnHNKS29Ledy4WrgltwYCiRSPKf+/a5VnqjYSIYZgxFmBL1Ti5DwzXEN5tXfr2P8mGuqdUIhTdHBoSaENZ3IH6+Bx30axjKfUVGRI7zqzA0QM3JYZrij+xu6+/xiVcKB0FFTVvY7jNeqoP/eDmzkfwD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407175; c=relaxed/simple;
	bh=gCtcRw+qNHNStAJYTVYJOoSF1vMwsMIbo21sJaqXQqw=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwJPtC5trOk54HRRNVG8O3uMuEjZmqZeWekAyPFj8fzEpCDKOKI3yVLFFfK9Bq4/u1L0LurKDgDaJmFk9ScfDt0w7aK9KumG7rgSNfVoOhlLagzkyAbyXqJXrqgm+xa6Q/y0lupstCMp14kKv2b5tewKfoO1xb7mMyP1kg3DecE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POQUs0QH; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POQUs0QH"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae45so4878495a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789407168; cv=none;
        d=google.com; s=arc-20260327;
        b=izk/gi4r/e6FUzwm6u7P7BVJweFFDMkUL3DyYZv/EmzkszFKRltnxe4GBG0lzezHCJ
         kDu8Of3s34ErPjJAM/YBDqdVaLZBEcNateQIf9RuB4U7TrdLpnvxP2czzJzx9d0vt7RX
         OSuME6Uh15R/uVMULLvNsb0NPacZl4sYxsH1R7pSaDDKm1gcaLb1y2SSYZVeEtqQiCv8
         rgR0SPhrAtVsVl85NAEMDy5+mWxAUmp8ZehfOIBFTntDSuETeO6H/CpNsbMVxal3W7Mf
         s7O3WHQ3V0i5Thb2r+GqpG4iFzQNBquq7ujm4bn3SY0eolexF//mt/Lo13DUg3Qltyo5
         GxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=gCtcRw+qNHNStAJYTVYJOoSF1vMwsMIbo21sJaqXQqw=;
        fh=aShFb3lf2yadIeK0MWlIkvZjqIa8tge9hWSHKA5GuaM=;
        b=bk7wFmMmkOzF3hW0Z7fjWsUlXBxp/wLAvO2Y9KKgztUNqR3NFn1RmWbijZvpuGukkC
         ieU/FzV6X8li++tAB6Nqokcu6mpNtjmbJ1D0O+n/Y0hB+1Z5XAt5Sd2/O4RFEq0FK2zB
         qlWIaBd79OtefhoSBedWIbKbJx0SSIm2rPDMEFzw1VnYKQXC3JPq0l5KdakWPJ4GL34O
         4E5F2QFz7bqqSE04gUQwK1sa5X0uYiATtKtE2rNioeK9tmXBpeHhBEf853xaj1nVlSjB
         N5CEzIQVuYw1vhXBQpG/KbHew7tKqfX5rdNZmWtNxQhTCoCVOVW/SfntZ1GTtFWIDLUI
         AfbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789407168; x=1790011968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gCtcRw+qNHNStAJYTVYJOoSF1vMwsMIbo21sJaqXQqw=;
        b=POQUs0QHEvLkF4InMVkMDvXrmA1vA3QH27I7JAkFGQEwL7UHrV1FQ569DV6Jb1a8xF
         GUCH+HkbUWAgB6E9Jjqf8ok2m7ZMYCh+pRBHtOjPQW8dBB4EqJ9IpmsRFIJZ6oFu5rtp
         RagZhY/jNfQxd5UyCMo7bEVfo6I5jct9KcPMQ0nkuUckWGxiqHLqSlHepIfaIlXEm5fC
         XbG3taBBv9d0IHPMePAhDdxL5l0n2Nu0gIt7njKjgLX7Ca1Iz5lkYlVCedvGJVBAoMAG
         6RK8VWYrNkY2ratB395tkD2q4RxONYks9HzyFoj972EgUfrOjzSPsAj3MwT3ZAa3USXw
         fLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407168; x=1790011968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCtcRw+qNHNStAJYTVYJOoSF1vMwsMIbo21sJaqXQqw=;
        b=JrU6/Bna1s/E1sifLI6ZIS8KoDBd8tf0xqHOskkkikiIZ+AZBQhjCIIVXXbf/GT4G4
         2RL6Sgm7Qx5nsmYrn85SgSCeoubZcXMQtvIMCrixZv6gakK74vi1iA44APDzTGtQpteG
         mIFo0dQNanemONQZguPm2shA9BDtxKmBBxGYAIHOBWsjJuE7hFaXzeITVn0eZ8vLp8dq
         Yir1rmoi/4d5ySZRaBBa5fZx/r1S79YbQZi9ABJQ5reORS7n0m+ISGC7LUMuo/RA6+z0
         +3IF7lxhd0xLeBv2iqcxYTffxmn3TY0QsdjsUJwKuDJZHttptz3c9Cq9Rip0fKMXvBc3
         vXbg==
X-Forwarded-Encrypted: i=1; AKwUvBxN98ZJ71w0YdQUaPyIx8WoFQWSdM16wdp29IlMNaeoQcn1GsbKlISPXBNyn/dxajobjCGD4ViPN6Oi9XE=@vger.kernel.org
X-Gm-Message-State: AFuF++k/fSH2QkDpeGxydfe34XRPYg+7uy6GSJyZgQ7fiEA4O6V4I3aO
	SS0VQbUKp7fOfwCEatXzKTqmrLUc0SjFyEjWISDihOGDxPXEDm5h0k8RaT/ph6GiQ06B8iy6WJa
	4cbxWw9FMQqsRhrj46pK5xGJd6UQU2j0=
X-Gm-Gg: AYBFou3ZsHTkTKSsMsdPtiAXxovEdalNJa0MxuRt+uQpXKolBSK8YC7dEEECqNcRvon
	JfyUb/UnIF10hEw1OvWg+tzJ0VH2XKDTt9e5qiO6B7LjWLlBQ2mQx/Hb+9jdTqkV5v/9ZqLR+V2
	Y26H2EsIrjUEhnkVhDye23cnDJ4TAjUtRcje4pUhIdo6NhJrNKah2UYtQYqNZX8C3MIfarcu5LL
	UzXrjZa1j4Voh+/WF0rnA8N8co4HjFZY1jJ5ydFphp0zItFlnibx6gYFAS0yhXUnt7JjzAHLLJ/
	S6X18D0ztAs49w/WERYHz5aybfY8KHWAJ2YkDUyGvjulW1sQun1+mBzFF2A8pLAsRUGsWW/wdVu
	qb+w8KK+ljQcA1GOVWIEo/XhWmRV8VLNiknHRV40=
X-Received: by 2002:a05:6402:24d3:b0:6a9:a281:ca8a with SMTP id
 4fb4d7f45d1cf-6a9f6379705mr4277384a12.20.1789407168020; Mon, 14 Sep 2026
 10:32:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 12:32:46 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 14 Sep 2026 12:32:45 -0500
In-Reply-To: <aqe2K0nVppBFSidV@stanley.mountain>
References: <20260913040140.4517-1-gaberashawn@gmail.com> <20260913040140.4517-2-gaberashawn@gmail.com>
 <aqe2K0nVppBFSidV@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Gabriel Changamire <gaberashawn@gmail.com>
Date: Mon, 14 Sep 2026 12:32:45 -0500
X-Gm-Features: AcwNN1WpByfxKhF0aBLisXpqJcCGb5hY09UxTHQsDO2h2LA-o97HI9q9YhD-9kw
Message-ID: <CACKJOpCHzkwX3G=mrbe0i8Xj79RK7648EoD7BXuKqLM9JuPe3w@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: sm750fb: remove unused definitions from ddk750_reg.h
To: error27@gmail.com
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the Acked-by and for the feedback on patch 2. That makes
sense =E2=80=94 I=E2=80=99ll drop patch 2 and leave those register definiti=
ons in
place.

Regards,
Gabriel

On Mon, 14 Sep 2026 11:54:03 +0300, Dan Carpenter <error27@gmail.com> wrote=
:
> On Sun, Sep 13, 2026 at 04:01:40AM +0000, Gabriel Changamire wrote:
> > The sm750fb TODO asks for unused code to be removed. Of the 1203
> > register and field definitions in ddk750_reg.h, 1046 are referenced
> > neither by the rest of the driver nor, transitively, by any definition
> > that is referenced.
> >
> > Remove them, together with section comments that are left with no
> > content beneath them. The include guard and all VALIDATION_CHIP
> > conditional blocks are preserved.
> >
> > Build-tested: all driver objects are byte-identical before and after
> > the change. No functional change.
> >
> > Signed-off-by: Gabriel Changamire <gaberashawn@gmail.com>
> > ---
>
> These macros are just documentation and they don't hurt readability.
> They probably improve readability.
>
> regards,
> dan carpenter
