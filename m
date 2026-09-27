Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C2228505E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790505138; cv=pass; b=HxiqIggTkbiIgvBcpcrmOMCxUixeIIQWKc/WLO9nEUyWrhxE7vwU0hh82ckOvw3F+FQuaUOftCWvFSvvhcHmN5sxSs/4ujrrA4+lsPz42SKYwc4Rivf3hKQG+iJhcKdTLUUblE6X6GpNytd4Szc9/0LL8pJGZXge5Gj2rztL3Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790505138; c=relaxed/simple;
	bh=SHQk7gkbO2ea5uysrJ1Kbk5JIPAf5arZPkM7Am5MOaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+4xTAJJ/Y29YuOeVBPy7I6/bPjuA0n/jF84UyNuoVaDjjXj59ufmz2K3SBdGcYR0Sukz1BWcPv8g7q4gODPM5TUc4KaTs1gQ/4ymPumNdwhMgRIPVv2Bj+PgBB8iMtGVnBvRitiDpd/imw/tspLY/dITMnjo62QfrMyW/yDv+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XR8V/29B; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XR8V/29B"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343697ad877so46912eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790505136; cv=none;
        d=google.com; s=arc-20260327;
        b=Gl7Xr6CeLo+C+nG/bzuHO+24dOELYVPSyZ2Di38Ex/iMpNjP0+whi3TZ6WChIxBFPU
         oLLM30F+WmEOUQM3mEstk/FQRk5tTAWPq1j3JpK058pxzYksWwtDHU2zhzgCJaMw6hZx
         41nceJHoUtLo7NZNrb5kUNQgC/FUZVoJTnVy3I9Bo4LIVo+vPUoqnGryJS2yby64QElk
         VDpBFCg3zozaTSWeO9lSRph7sP2N9buqmmGEOoOwxe6w2s2fPPD3vEnAL84LhOw/YtN+
         7WssX12yTp/aB6IOJHXhMQSRvObAHdkVbtuEKuJr3KIHZlF+FkvWokJblS1bjTfDZtr6
         xNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T0IBN3YB7gkpyxIrrQJOq1rE0sGtI266Z+5OM5H2e1o=;
        fh=khcb14i6ukm5itDMebnFyBUcVUR1xO+QNLXmQM5H6bo=;
        b=YAsjbP0SW4Mdv7lfYfqtSE8EfNay8XeVhFbp71z3WyzdB7/wJFk7czlrT2YYqYVF/P
         GLrGd68MAZBobCK22K0Nu7tJ1WWuxCWg+bXsqpsZPN+mC386RakkoZAnJ5wFFcD8x1Fz
         GU7sjNBtzu+LjanhggWmyEX6LDeJHrhoQg6clRzygSLwSS2IEEEqbI8AoxRPQ5yp3Azl
         o2jB3bdMMes47n5iDZ4th7evssXcSlX4tyfPTw1MoD5j+Z7jBnzp3NHNSjdG37d+909I
         ZjptkY6CH1OxoYUEc+l0w4ZOveMuvb1UkCV0zQ25Hk1Yq44f3MclxlzKnLvXC5U49QIb
         GcoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790505136; x=1791109936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0IBN3YB7gkpyxIrrQJOq1rE0sGtI266Z+5OM5H2e1o=;
        b=XR8V/29B9a9xrBzbZ9Z07pBSu8kygEYk1F4B9tNxOY8Um5rhoyAAZfXwJWiVfVGDP3
         kunng5LM1yHVR4lJUZyrlKIJCz01Cup3XyedgCw3yctV9GEi77nhq9zUVuWuaSiJyrB0
         hjddBEWyARrol16/uAZZBTifM0nxlZdiQ/xBdRR350jXv1kWqSRohsiz/8O9cZhLtg2Q
         EHh6O9zKit6cagm43HuArIxUJLC/nSrHHBq4VOb7/QPNA2/1hP+QXycnwEAlhRrV0VEu
         MFC9vgc8kfQblA35P7MZeN78MeM8QTd98+bU4ooxF6Jnhk0SiyiXjyqzcF4P5jQwjNqT
         oczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790505136; x=1791109936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0IBN3YB7gkpyxIrrQJOq1rE0sGtI266Z+5OM5H2e1o=;
        b=xFrWHfL6h687XK48zrgWHdzFtn2XnLRBJJ4nU3vjz6OcXvPxMlJ5Ku7RwBA2kPvM3L
         vgET9xsKOx8b9et0dQGFwUrrdxgiq/mXbbCeESu47P/TmF52tKdW5fG/KN6iMLZyOb9f
         17okDNcqpjAMXTb6YemZuNSHazsPZH/tQFLRwSXewSmlghsJRJMQcL6bNlyrxt6DOrPg
         LSQgOelX2eCwAAvBirjfPVZj8/vLafeCMjVEaJBJCGLmXKehzwWgTgQ1n+Yqkg4ABirJ
         FkVtSez4ljyyKdRfUZV96IW8hOzIym4UIHfvYSHo6KaZCkq3ZF71tj/HB1K+C9b+ov/N
         zAOQ==
X-Forwarded-Encrypted: i=1; AKwUvBziXvGfatYxKIfI5r5G8P430rqJRAon+i0h3NM2J9COyOjZz22CYT1r1evzojtW+Ch2EZApHHkFXjnTcB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBdLLdQ0qJddP3lb/BHcseXOtCWnvefqO1v6l21KdJOIfNX2yu
	Iw/RBU9OKJBkBPqPTyaCAwbfc//NME2JcMa53h4FJLPbbEe2BVu3fH3S+X7LXNmOR64Bj4mRpoR
	fATBToLI671Rv/43Ih932u2xh5j4tKDw=
X-Gm-Gg: AYBFou08o9ksVP7/R1L43NnVjV6NnuVnV39TrA3FdKBU6KqSrrUuv0YxV/p9HoJZmP+
	W97F2U30EwgXs3jZ5E95V4JftKTLASWROP6iZ9fTkDHja9XkUZRd7EpZMUscqBV6EK8Y9fyVF+9
	aWCRM9580t8ZlGN7W/zWKp+bDrZBPiQiLDISiUU0lRXgk+4fQuQHzJqBs9839y9lqQOkbqTf4R1
	kaWfZCPb+gxYhTUQsEa4L00AGH4GebVnmOjSsmbfBmlQSRJkph/DfWgbvy32LK+uwDcTXnuehJS
	hj/xeHUoB8nwPi/qpazT242G312E+eE8PFZ2rU3AZBrRhFXHvc68bAXJHHLy2awt/iku8S3ltR4
	3jgD2oQtsCt9uaZw3DtUKG4ny0NiAwz40oJlnsBO82nW6XepWgEb8AkIlM437QEi9i569fuM5cJ
	O0843+hRTtRHaAjmFd9Nx4OuYJfGNeMbfOOJoeKa7Z/wyb5HI8FgJ4LXe9pRnXSXjZb/pVQ6YL
X-Received: by 2002:a05:7301:dd97:b0:33e:6a79:5a81 with SMTP id
 5a478bee46e88-3427179721dmr8395927eec.1.1790505136091; Sun, 27 Sep 2026
 03:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909064506.910162-1-apopple@nvidia.com> <20260909064506.910162-7-apopple@nvidia.com>
In-Reply-To: <20260909064506.910162-7-apopple@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Sep 2026 12:32:02 +0200
X-Gm-Features: AclHuK8iLs1xJry90CQ3QvtDKTbcAUCAThEBu2i1dWjYp5xrWZkI9Bh3mU59r6M
Message-ID: <CANiq72nFAbA_uEuUfWvdeMQeYJ+uMcAn7z-FWcQOPUcbX9CkZA@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] rust: uaccess: add UserSliceWriter::write_truncated()
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 8:52=E2=80=AFAM Alistair Popple <apopple@nvidia.com>=
 wrote:
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Nit: if the suggestion happened in public, then a Link tag after it
would be nice.

> +    pub fn write_truncated<T: AsBytes>(&mut self, value: &T) -> Result<u=
size> {
> +        let len =3D self.length.min(size_of::<T>());
> +        self.write_slice(&value.as_bytes()[..len])?;
> +        Ok(len)
> +    }

This could reuse `write_slice_partial()`, though it would need
`#[inline]` to make it generate the same code (but we may want to do
that anyway).

Thanks!

Cheers,
Miguel
