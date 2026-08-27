Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB92747CA87
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851892; cv=pass; b=j0UP3MPX6foLLmKa+e9I+NciW3AXOtk7ETVM7PNQUbr7wCq/kDRf8ItTyYutkoybFQYo5dfsHzYVw9q0vyd5JeaQMWFLb8CS2Q8TFpYQOqrNuJJrW3oYHDl6OfkBjo2Mg52JPCdIKQFfJK4C1wGnhcgFcaYNtoZPqJfeT8yAVZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851892; c=relaxed/simple;
	bh=fi3xXx9lmMzosKdhDR5Rz7ejkV2wx9RBdSDmpnPGy/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQu7WYvwyZIrlHbT0x7IPloZtKdXE/I/W6FXjN4kshb0oEZkWuDmMHAiHFWHN9+iLEjaT7DGKanYw8+JWWpoOHBzHSzmV/dpwSRVz8BOU7Fp77lXUPxGxE49mqVzT9SZ5UAN+6crlp/Quxw9chse35aqEDX6D2w05c9W36YSnb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=jON3D1qh; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="jON3D1qh"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so122127a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851889; cv=none;
        d=google.com; s=arc-20260327;
        b=TL9BtVuRvruwhzV3rCYCSVnwljZtMQ0J2XX2QqD2i9ES0AISqD1peV4tkpKRKuMgKg
         Q3IDwbMIIv3v8VBWjoq24lIy15VbbFfLUe6OhkjJpWthcpyPjZHSAFVrWWOJpf5WEpCA
         O8FVleJCkQGZzxWvzpVneIctV+6+teE5+dCOvPr2QY86utjC3fjVWAH7sVzD3sIJzBZs
         nNGonJCdElaNNVTX4YnTDWzyrjSG6YpQAqSb+8G0B1g1z54BJlxnrWNngQZdOo7TCpUV
         stWvrzXdMwQ7Fe6dMB/l26KVv/wLEz7i2rhlsZtwv4DS8CxLjcqPXByJ5tcV24yRpe4b
         0P7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkgVLt4NrfCVE7i/NEEAS+hRQSbquCyjXQQNoGs7LPU=;
        fh=w9eRCr8xSELOX2xMzKV84jLOGHo/ublroTfvxhgpqO8=;
        b=J3Ucpfrq1UAoTyyoshLeu0xjL7araKFsSn7xR6ZP8Ceb5K3QlfYbmD3TNID2yghY1g
         Vn6q84+tXzGoYwDac9rIqVVFUPOtCQXk1IHYs9Fw10pDEquqiSby891V3GsDZOzjphWF
         ethMt9p7+erVuM7tADIJiBMyV8DvGPl8e4MkQpB/rfH/E3+V7LDbg46K58gddWRpV/D4
         MahYs3AW8IVpRVIbNrdeAnGs8iTArEUJTelgUM+3MPOR/LPjHu6q1w7T1tA+UDbkkFAT
         5lvgSLCVv5zyzuGIM+C7TuW6gXjimVqRhXC1rRqfJDk9iUf/Sy7wrkdsm7l1OpxIHP1P
         LU+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1787851889; x=1788456689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkgVLt4NrfCVE7i/NEEAS+hRQSbquCyjXQQNoGs7LPU=;
        b=jON3D1qhVdf0/iNyzFEtCCbR9adPrP+3opOujs0W6rCQhssamMz4m2arjThZYqzDRv
         J5b+raZS5sNUAFLXlYhOrmq9IXNCysRRr/4apVXLhTzsYVvqPVq8QgmGsHGd8fSrbgm9
         L0W5e+9cE6pb3PHxq6PibVUcPjldw0Cl13mAGJuFQJnsGmja9j1w0qJ80yrsSOPsMn7t
         nOCwLE5pm/NJv/MnaN6qeoxWmOW6d2Wlz7fTMpznZX2tWhP0xIDXFpxcVa9m2d0VxRhs
         yya6eZ+Hxmx4y/kuXUqxIQqQsl9QWsrK8m2wBjCQklx1Ps5lhyPNBA1OFwWcpJv5jbzi
         Q1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851889; x=1788456689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkgVLt4NrfCVE7i/NEEAS+hRQSbquCyjXQQNoGs7LPU=;
        b=cT6QfEvWWu9I3JtV6q2RYASwxJ3oIS/izmvsBOZDhvoRCKHxgdF8QfBFT3jEhlal0L
         rgtU/UZN+BsSdycr/JkSacU9U2SLiKSDI/4KwV4LG+ByqPvxWhoyc3Q+1R0K0WUlO90Z
         6TqPBbvqNKx3cI/8aBVlCRVpZSy8GuoCaIItI8ZvSQsSWpRF/IgH2y33Y0s/ZUAvDrCp
         NAG2cTC/1UJ8gIIhGOL4waIM80QX+WzCw1eRqiFaO6YJNvx4IQ+ajfKTHI3NSJWESRp5
         HM4JZhZr1kEwB9kVtTftQg5DgquJkeRszypDxvA3VUGMEYx7QJsZwNMcRK0GBHzWqbAK
         EqTA==
X-Forwarded-Encrypted: i=1; AHgh+RqFYaBGP1Bp01vrS24y1JqZEWwZXXBwVC1NS96tnGAw2ugqkofZi8+IzIOTFSkbQb8IdZrBvyftaHWeMlE=@vger.kernel.org
X-Gm-Message-State: AFuF++kFf0wIn2l15LsFYSWy9x+IwNOrnudGy9sY046ay+10xVD1fphf
	uLLZB/v6yivs7mjANxcW3RsUfRUyE8T8mX6nsWkSNKT8MvN27YIfdIWE5XX22+Mc/yMvaigkezO
	WjDEWvwpKqFXcjMk2Dy7YK3jEQwHOQZOxDFfNLBiw
X-Gm-Gg: AR+sD12ecaL15Z9hqNnhlL0HMqtIr8CCvi3DITCJ4+kdWbCr8wELiTGEqK8Y6xR/nme
	dsHc6aGbjI1ZTIdcN3NHx8MDJfW3RPYrVhE7UIkzTzFSF4F7kzw7W32FGSch6DesTn8Hv+Hbv0Q
	GQrq80QKSmRm+T7wyv0IS+KIf/Mr86JdfiFkndy9oeDW2JyLSkwkH1YzSG9HEq8et5Vf36NjDia
	/n+oNvXR4+2X+Uo6gxKRlLhXmsp8KvFEs/pyHfWkgioV6rga0koZktOLhbes5K8mXKGFh0OnJig
	Iw1MfMAS4UiSLCLK4+vP+oqeylrSYmIC6MmnHwqFYIoYoxP8WYCOD9eVbukvezCXi9/UbY6eE43
	PT9TLtE9kSEy1AIiyIvG40b8Lcm2yIkr8lMU=
X-Received: by 2002:a05:6a21:3390:b0:3cd:7ba2:e669 with SMTP id
 adf61e73a8af0-3d2686a3386mr834940637.10.1787851889149; Thu, 27 Aug 2026
 10:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh> <2026082732-flaccid-overpay-0985@gregkh>
In-Reply-To: <2026082732-flaccid-overpay-0985@gregkh>
From: Xiang Mei <xmei5@asu.edu>
Date: Thu, 27 Aug 2026 10:31:18 -0700
X-Gm-Features: AcwNN1UH6rQHNXhcYdg99UoLIjWRDePA68176IBEWq-kIwPF2BtV8uwj4x4omdw
Message-ID: <CAPpSM+RJKziJf7enrZ5FMy-uxJp1Fy1M_acVXy+v3WskU7jJXw@mail.gmail.com>
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: co <co+fd80bc5967eb22c3@bugs.sh>, linux-usb@vger.kernel.org, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Th

On Thu, Aug 27, 2026 at 5:50=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > We found a bug reachable in:
> >
> >     path    drivers/usb/host
> >     crash   out-of-bounds in xhci_queue_bulk_tx()
> >     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.=
org/pub/scm/linux/kernel/git/soc/soc")
> >
> > Config, environment, the sanitizer report and a C reproducer follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     If you patch the bug based on our artifacts, a tag would be
> >     appreciated:
> >
> > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> >
> >     Everything in this mail is validated by the reproducer below.
> >
> >     We also hold an LLM-generated root-cause analysis and a candidate
> >     patch. The patch passes an A/B test: the same reproducer panics the
> >     unpatched kernel and runs clean on the patched one. Neither has had
> >     human review, so both still require validation before you send or
> >     apply them. Available on:
> >
> >         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
> >         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md
>
> Please validate and ensure that this is correct before sending this to
> us.  No need for us to dig through random web links, right?
>
Thanks for your feedback, Greg.

We are working on making reports public. Sorry for the inconvenience.
We'll stop sending bug reports before we fix the issue.

Xiang

> thanks,
>
> greg k-h
>
