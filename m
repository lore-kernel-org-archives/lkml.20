Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5777F530DF7
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188956; cv=pass; b=BQrzUf2mNrl6luQ+IyxGeb3d0xMRcOUSp1Cj2qzZ0QQtW+gZzMIjt8JZe47Coxfb0TFvlAglM6d1kvQfPiPQ2M+ry+0+gxOrWQ/14E14agmdIHcHRxTp5/6y9Hcj2FqhAcQPCsvvT28R3vww1B1YT8T0l1176p2+sydjtOr1QQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188956; c=relaxed/simple;
	bh=cwJf22VLRgJ4mnooTR3ZZt/LF7eumDZMkCcLNRtvft8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7ObmwnvTHbh1cyoNy6I8FQx777+vmPvRryo5Zwi49kZ/x+uPFShFSkAXv6wd+ftUtd/P0F9bgTtPVQzPm2c4omyivzC2hu8vtRCAuMzQgDJ9ZnkV29fETWmD+NGNua+Ha2sYizpGChd8F3kzNZTQm2xiLeDZBzT4g9Yz8ribRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYBK18MJ; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYBK18MJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d3b445a84fso141085ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788188954; cv=none;
        d=google.com; s=arc-20260327;
        b=LSooZwV1cAWPFJ1yArVr0qxsfnslFd9rnrTqE9sMWfogh6OtFBaP6G2XedNmSuIEAQ
         xxgPa7x7IO8OJL1jmzdkzs1Z7/8xQM60bf2HffIW1L5qSHse39N57tQH8LrD32RUl7SV
         hv5fi4iucZEw/W+Zc+MWn+peY/8TvVuI2JO1jIa4r2vJcsnaSC0/VKEBsS8n8kZA/bvu
         ZH3FnzyG3TMtuNdt1AtyCcGu9YPUJhVSO+TZKTZ4vIVOJDZm29XlEenqN7Ya+n4qm39C
         6Vw8ArUlS2jieJ2Mc4lHdRxfAePHPiLBnIWcf0QpZjSJfFN/L5mhg3r95C7O7wy/Z9V9
         a5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u0q5v3dSQ6qISD+Je916/B623UqYBZrUBVMWQLY3tpM=;
        fh=g/QB00sZiKyYdX34mpZo+vxbkB4NkuHPnwNvR2dCcLg=;
        b=onuS17PIzKdonvwqbOz/egxxQaPjNmEuuhmZJ7Vxgw5FaseNx0xggPtyNNacCWmHjP
         tJItIoBuWpfvuBMZEgIxL3Gv8UMyD266YS2bOMrNRWCSKTtplkR5SzeF9hWgsB3SdLeF
         Ccv345Q8lpcAfAHKB+frsvCZ6USpLdCYSwIc1OYVltpNzp2JOtW7C/MI6g1MBnrjEGr9
         Wr5PbiLfRrbJBOi1mhBXhmgfk/hHpgGDUaSYUsZ9xvlnZAkTeiOXfdj6HJMEC23XTFlD
         osn4PKq5FemGNMv1WL1lqC5lrSLc+euAjlqozOPf9Nx91+Se3V6at9aDuQ1gUFTM7U9A
         UdvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788188954; x=1788793754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0q5v3dSQ6qISD+Je916/B623UqYBZrUBVMWQLY3tpM=;
        b=bYBK18MJvMce9cST8I6riNshKkOIdnTcffH0y/QdSj6k2dhp6XRolBVgPzCpKEs2UY
         aJ64nFDLyzlPEzM6AXQlrRZiK7AtDh7MPP7azelDRNu/G9OhfzV6ALDm3Qlq0gZ94yC/
         UJY1akYBPLKj+D+YqTz8JrVIvyRdCqBRb8jVuZg4xYKWr2qdn/3x0gxGE/JW2SMrTG6V
         TKiJGdQnjMIIoXpmtIPoLCh3zYcSggbPhX4O72L8DjvSwk0TGfUOVfJFxBLDjQNbX5bz
         Ty33Or9Zo/2d0FSmr2GRcl9nufm11BBF3ToEgC2LQlEDrcWXabRLY82lM1FyC4pgAULX
         98Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188954; x=1788793754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0q5v3dSQ6qISD+Je916/B623UqYBZrUBVMWQLY3tpM=;
        b=fmnMUb6oo8V1OTjEWPEcjq0niz/dm5+pFDik08fnvRyIn2Qjj9EZV65KslexKTsUTu
         Wr/0I9gqIspdRbO6mvpbvLuVf9Jo+nFt5hlaMBkYOdvlKrLIue06gfmnRQaX5vvo7MIT
         DtJK6cHG9jgb9PEm0cBv4gRIPdvq0xiFmfNL5/zkKIPI6UnP6CZcL5K1yZYJ6vfiTTVS
         eDRjA1xGHWr0P+FSWLyOcajD0YX4bmv0dTAI0kJMrTQbt4P4opaia2gGT7PaZO2I8x2r
         Y+BvAzzhs5tWUKOgF1oxtvGcWezQoWmd+ZJiFUtUcIdPO/EKcpTc3A+1534WQRy6hirw
         fm8Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/ZUP+Rx9SDPgVrx02Poo6e4Xzmq6z6sSuAPYnLDmVtw3S9VWnVhcZbc2+ByihKZ37Ag20JaqAsJPzq0s=@vger.kernel.org
X-Gm-Message-State: AFuF++niqKf6cEv29gVz8/zCEUDXH5AgvKgQh/xJ3ghuObVHvrJYF/iA
	ZR/t6mQP5fUj38L9F5fIOXQs8otU1l0LapXqokWT1EctWtaIS46GG0ThpSQYw76MLBPtopiKhno
	LJOyQ8Gzz3iyQSwFPxPUQ8TkUdkWBUqqMqOnPi9nLz+a7PyxPK+Rzpzc=
X-Gm-Gg: AYBFou3J8Lh00vofv2r776COdM9/85jGEqV++KzhkqQvB+94hKiAK4kIQQ31+v2b+tL
	c4X1OKMl1vI5nr8ltYNBlcGZcfdH8gXfsDoMihvbG+meR1jkGjwSRFzKWtG4ZgtZqP7LngkrUhw
	cKwojratxUvjQtdud03rypSjaKNIbSUsg+GxXnpFsaeNTbreygIGGvxcrdy/Catp3cfR0wC4eeh
	IDGGXSZUvWZc/sUtKmpiF95E/c2sT6VsipVoLBxvZBQtqkSSlLXuTvazriAJDVKKJ87MoXixin1
	S5qsL81CsHVnyfgD8Lwf0nR/HNi9dbtHw+tHoNWUbzU=
X-Received: by 2002:a17:902:ec8f:b0:2d5:cad1:a2e8 with SMTP id
 d9443c01a7336-2d8df402aaamr10743115ad.6.1788188953604; Mon, 31 Aug 2026
 08:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424123123-mutt-send-email-mst@kernel.org>
 <20260828180933.743887-1-briandaniels@google.com> <CADSE00KB6g7Qya2H7w4hjczZBWtdrNR=hhL9X1c10uOTZd1ZAQ@mail.gmail.com>
In-Reply-To: <CADSE00KB6g7Qya2H7w4hjczZBWtdrNR=hhL9X1c10uOTZd1ZAQ@mail.gmail.com>
From: Brian Daniels <briandaniels@google.com>
Date: Mon, 31 Aug 2026 11:09:01 -0400
X-Gm-Features: AcwNN1XLoZxxmKqTZ2g0OS5eXuRtKfbM-0ITCjBS_YNiSW-b2z5ALHt0tVSbNjM
Message-ID: <CAD4i_GTGCop3=B5Bzw-9JpbrMr2vQWwJkcdrvUqUfE_5sNi=3g@mail.gmail.com>
Subject: Re: [PATCH] virtio: Add ID for virtio media
To: Albert Esteve <aesteve@redhat.com>
Cc: mst@redhat.com, eperezma@redhat.com, gnurou@gmail.com, jasowang@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
	xuanzhuo@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, great. Thanks for the heads up, Albert. Will rebase.

Best,
Brian

On Mon, Aug 31, 2026 at 3:00=E2=80=AFAM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> On Fri, Aug 28, 2026 at 8:09=E2=80=AFPM Brian Daniels <briandaniels@googl=
e.com> wrote:
> >
> > > On Fri, Apr 24, 2026 at 03:37:14PM +0200, Albert Esteve wrote:
> > > > On Fri, Apr 24, 2026 at 3:07=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Thu, Apr 09, 2026 at 06:53:41PM +0200, Albert Esteve wrote:
> > > > > > Hi,
> > > > > >
> > > > > >
> > > > > > On Tue, Mar 10, 2026 at 9:41=E2=80=AFAM Albert Esteve <aesteve@=
redhat.com> wrote:
> > > > > > >
> > > > > > > Add VIRTIO_ID_MEDIA definition for virtio-media.
> > > > > > >
> > > > > > > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > > > > >
> > > > > > Are there any thoughts on this patch, or any actions I need to =
take?
> > > > > >
> > > > > > Thanks,
> > > > > > Albert
> > > > >
> > > > > Create a github issue and request a vote as documented in README.=
md
> > > >
> > > > The inclusion of this ID was already voted and approved. The device
> > > > already appears in the VirtIO v1.4 specification, with the same ID =
(as
> > > > linked below). This patch is only meant to translate the decision t=
o
> > > > the kernel header.
> > > >
> > > > >
> > > > > > > ---
> > > > > > > While the Linux driver for virtio media is currently under ac=
tive
> > > > > > > development and review [1], the VirtIO v1.4 specification has
> > > > > > > already been published and oficially defines the media device=
 type [2].
> > > > > > >
> > > > > > > Adding the device ID now allows other components and tools to=
 reference it
> > > > > > > before the driver lands, and ensures the kernel headers stay =
aligned
> > > > > > > with the specification.
> > > > > > >
> > > > > > > [1] https://lore.kernel.org/linux-media/20250412-virtio-media=
-v3-1-97dc94c18398@gmail.com/
> > > > > > > [2] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.=
4.html#x1-82200022
> > > > > > > ---
> > > > > > >  include/uapi/linux/virtio_ids.h | 1 +
> > > > > > >  1 file changed, 1 insertion(+)
> > > > > > >
> > > > > > > diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/l=
inux/virtio_ids.h
> > > > > > > index 6c12db16faa3a..f9056af0c6223 100644
> > > > > > > --- a/include/uapi/linux/virtio_ids.h
> > > > > > > +++ b/include/uapi/linux/virtio_ids.h
> > > > > > > @@ -69,6 +69,7 @@
> > > > > > >  #define VIRTIO_ID_BT                   40 /* virtio bluetoot=
h */
> > > > > > >  #define VIRTIO_ID_GPIO                 41 /* virtio gpio */
> > > > > > >  #define VIRTIO_ID_SPI                  45 /* virtio spi */
> > > > > > > +#define VIRTIO_ID_MEDIA                        48 /* virtio =
media */
> > > > > > >
> > > > > > >  /*
> > > > > > >   * Virtio Transitional IDs
> > > > > > >
> > > > > > > ---
> > > > > > > base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> > > > > > > change-id: 20260310-virtio-media-id-b31179fcdc44
> > > > > > >
> > > > > > > Best regards,
> > > > > > > --
> > > > > > > Albert Esteve <aesteve@redhat.com>
> > > > > > >
> > > > >
> > >
> > >
> > > Oh my bad. I misfiled it into the spec folder. I will take care of th=
is.
> > > Thanks!
> >
> > Any plans to merge this in soon? This is a dependency of the virtio-med=
ia driver.
>
> Hi!
>
> It was already merged:
> https://github.com/torvalds/linux/commit/2187be212179243f33da1271248571ac=
a3e99a3f
>
> You should get it if you rebase.
>
> Thanks for working on the driver!
>
> BR,
> Albert.
>
> >
> > Thanks!
> > Brian
> >
>
