Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEFF345ECC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789878189; cv=pass; b=GpjTgJl8NrKswxJLPNLfOFEsAsbEQhXIAWC6PxGYMOXw1vT+gURKUVQdYNvdKohFIJJQ3jDUtoXBQM8CLlzY8PbfdiORC5j69h7FIYjOero6OVXkgiY0/+GcEo0ALA2671slvLRWjgJVFv70twTieZaC81a+SlI27Gn+jQORRls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789878189; c=relaxed/simple;
	bh=AA68aMrswykmX+faf9hL7AMVgYZ0rqnpXfsUi4nLrBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjnER5RMmUFKrgfF0T38CX+nm3+t6U34RSzID86FAr6+1lJvAL49dIZIP5NN5RneMcCWp8An3NYpHzOzqjc0ne4rkaEMy5tf2DQzn5BRNIFVhigD5bb6vLNRD5Evoknyxzy5Fx0ff64uV+33+huJcYsdMJ8JIkQR1m6q0UXgejI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/dl1CPN; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/dl1CPN"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso16185395ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789878188; cv=none;
        d=google.com; s=arc-20260327;
        b=pfPwIN/u0ZhiE3d/EXKcaHXrhB3OVFwyJ3XEJt3HUJTvC09sV2iNIb8yG73H7I8xkt
         xs5z+trRXxWOjhIgubchx+L/jS2cCiQ8DzYstOjzL7q44lhhlWavTxphNa7+MDND59bS
         XvqP5dlvJCRniKibrQzFVb0IMJH+lEBD3an3MZniayagdOkZzOf0rXJu1s/Ylcz99QPX
         hJJPEQKnMwZbbMltoj2Po5RzZM74PgKvUZVzn6XeUpNkVGHrVwtxxcoTlTTSPh+LZE4p
         BFE7+cI2KLEpW8YRVTTcyFqGr69l3mRZYejpfy+zyiDkFeix6Zv3fgCqaMkiPz+ruhPf
         OEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CAqXU4QnYGB1y+rl3e3B29iEETQt0S+AEjq312CuHLI=;
        fh=VzaPtejmuJqfrtAfVdFw/e0KZSNpMg+MZxfoApY4Swo=;
        b=akPoi47kvpIzu3ivWG6qzaYLQQsG585i4gc7A89n2JNI2vRwU14gk9CqcoURM71fO/
         Ta4cNIQj/1PWGoRD2oprbf0a6hmFsjYiop0c/Pmf6tnTEZ71bcoGsJ/GTmEYs13pNazt
         qCaeR+hFIurzyObKvBhpoiA8yyEKtkaKsHQOTW/G+nA/C1u2krMIH21BiddhOrix22GB
         k0MIgFSFSiaGWEuj0NgLwR0i7LveloTyrV1yxp2L4CCVB2p6KQVLV4Xl+CP1H/O1GuoU
         vpGILNlonBQEbP4FiSC29PGYDTg3Ji8kBuMRRIZZxbhrW8Ldi560m64nt5yR3bigNzZE
         tXhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789878188; x=1790482988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAqXU4QnYGB1y+rl3e3B29iEETQt0S+AEjq312CuHLI=;
        b=W/dl1CPNEowRGf3nXAA45lGXiL+KQ2ugCE38ruHDEMLcYVVQPpQzXcuqDFD8LwpYqx
         L7TJKTCvDRnzusRUkblgZHoeNDscG1CNN+4ijSWJ40OrId1h9TLKeSiUaeqYYHaXDiw8
         u7mlSY14AH4OoiLQJBnDOTFbVQdHhBHsplvfA77JVicBXc6JJj9vClQ2yExMSjRMBGcN
         FTcSmii9uep5OxF9os7/m4eCF7ADQ9QHBNTEoJ6gVCr3srDQuooKYyEl1KkzT6Q0ZFSj
         IfJnDmZnJa4qkS8kfB936vR/JVVUyf1KZPBFy5ZW54JA3H+kEInMT1pEHhuQTQqXnL9U
         CmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789878188; x=1790482988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAqXU4QnYGB1y+rl3e3B29iEETQt0S+AEjq312CuHLI=;
        b=VSP31BNMcdQz/L8hCSggGQe8Fpm7C3ydGxj+qXdj4Mt8nnL/QAHwQBpQS2EyWgDl9m
         w8/fE1JYn68OHo9mmeSucoMPMACzcy0jv9apKY0VXGtVpT+IYUDL7M8f2+4B301ehtwR
         SGyUEOM0AX+0Il2LSiamnb1IDmMs/Tf2trU8FqxL2NO4cGdTNw7o4638GkRyAcxuf+Ug
         xM1v26xmKu7tU2GwqufduKbHcPxCsVC3LdT743UVsccEMPWn4Qqf90mhQVr+qAN/iD3O
         zyE6Dls1R/SXC3AKUq1yBE6KLgkKuVE66opZvXtT5SJNLJ/TlU3SH09GVWeVR9ef8/0r
         RCbw==
X-Forwarded-Encrypted: i=1; AKwUvBzp1UC+CPIB/nWQxnH27Fbgt+7Uiqj7ANQE/45GTEQaObO2WV1z2jfu2/LmdaUY4AZkfwpvJkcle9pvWbE=@vger.kernel.org
X-Gm-Message-State: AFuF++kAqwPFlVEuVPsPo3TEPUr0IBd/sXNsQFIkKTA3A1nR7X/bR3GN
	TrzDX0rRq8bdhE+Df4PqOgP+FZfN/kp07Q2jYjLc91eLJpOoZhQpS1EGqwxUzrOcMyffNAmqJ0G
	EMe4Byc1VgbDqtUJiR05YaGeMtQj41xecwebXtUrGDqXG
X-Gm-Gg: AYBFou21feJxC0B3ZbaT71KuuEdI6cMgfwde4Z+4S1s2OsIWFY9g8vKbVhHD58LnLyF
	yUMb3WHqF5BTTmiiRniQUbSW+5rrq8b165aUQNDwp8r2mhcGdoc2aXq2o5RY7qiCQqV7KRaNe4Y
	JR/4EslL/0AEKr/OO0Gud+d/T/v7ZiadpcYxhroGUmqszCjVQz4UwOAipWQkaS388q72348g5vW
	dDmYSPLWf+1ZZ8Lz6rpVDgm2VKD5XL1ZY7HGm8VPN8K3RF3GQFboSy+WfT4StIONYY7WlpP3M21
	CYkYsJ46RI2mb9UIvoISDZsMlOs1EmcnJhek0tXiez71fEYSWPCI9u4ZqInk6RINRxMZCHX4zPN
	EkCLQN0qKbhz+z995T0joV+Fine8iz5JWLSf1Dc50
X-Received: by 2002:a17:903:2349:b0:2dd:c100:424e with SMTP id
 d9443c01a7336-2ddc10044e2mr49362715ad.50.1789878187454; Sat, 19 Sep 2026
 21:23:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <20260920030512.50f4f988@jic23-hlaptop>
In-Reply-To: <20260920030512.50f4f988@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 13:22:58 +0900
X-Gm-Features: AcwNN1VuWoGeMmwFK8SO3q72J6yDJn0kccWHOWzv4mbLn2uAKQlLLK8lfaxPlsY
Message-ID: <CALMSewJ4ATy9eZ_GrHs-+Q+9yosiwhu3rtQUfxAbzOmR4R9cNQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/8] iio: add Open Sensor Fusion UART support
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Any reason not to push it one level deeper and put it under IMUs?
> I'm not that keen to grow the top level menu for this as all the
> other entries are about type of sensor, not one specific sensor.

Yes, I agree that adding an Open Sensor Fusion entry at the IIO top
level is not ideal.

My hesitation with putting it under imu/ is that Open Sensor Fusion is
not intended to be an IMU. The current Linux profile exposes
accelerometer, gyroscope, magnetometer and temperature data, but the
hardware/firmware architecture is a general sensor hub and fusion
device. Other OSF hardware variants can aggregate sources such as
pressure sensors, GNSS/RTK-GNSS, motor encoders and LiDAR in addition
to inertial sensors.

Would drivers/iio/common/opensensorfusion/ be a better fit?

There are already sensor-hub/common implementations such as the
ChromeOS EC sensors and Samsung SSP sensor hub under
drivers/iio/common/.

That would avoid growing the IIO top-level menu without classifying
the device itself as an IMU.

Thanks,
Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 11:05, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, 19 Sep 2026 03:24:38 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Specification status: OSF-D2H 0.0 spec-1 has completed project technica=
l
> > stability review, has been adopted by the project owner, and is publish=
ed
> > as a fixed specification.
> >
> > Canonical specification:
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9c=
dea1ae550c2b4d6f29f87877adae99470744/spec/osf-d2h-0.0.md
> >
> > Errata process:
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/ca9c=
dea1ae550c2b4d6f29f87877adae99470744/errata/README.md
> >
> > Current adoption/publication record:
> > https://github.com/opensensorfusion/opensensorfusion-protocol/blob/0cab=
ccf63ac01d0eb82dd9882739ff58eed4a76c/reviews/publication-record-20260918.md
> >
> > The specification was frozen before adoption/publication, so its embedd=
ed
> > status snapshot is intentionally historical. The dated publication reco=
rd
> > above establishes the current adopted/public state. This is project rev=
iew
> > and adoption, not an external maintainer approval.
> >
> > This series adds the Open Sensor Fusion UART receive path and IIO devic=
es
> > discovered from capability reports. It exposes accelerometer, gyroscope=
,
> > magnetometer and temperature data through RAW/SCALE and buffered scans.
> > Device Tree describes the sensor hub; its individual streams are discov=
ered
> > at runtime.
> >
> > The receiver validates supported descriptors and sample scales, keeps
> > discovery open after empty or unsupported initial inventories, and chec=
ks
> > repeated inventories before allowing new data to use registered metadat=
a.
> > A supported descriptor changing meaning faults the session until an
> > explicit teardown and rebind. Existing v9 cache, scan-layout and buffer
> > lifetime fixes are retained.
> >
> > Based on Jonathan Cameron's IIO testing branch:
> > 69fa76f0af3414cc189c3b0b807cb59e327ecc00
> >
> > Changes since v9:
> > - Publish and reference the reviewed/adopted OSF-D2H 0.0 specification,
> >   errata process and dated publication evidence.
> > - Tolerate reserved padding, validate descriptor/sample scales, keep
> >   discovery open after empty/unsupported reports, and compare repeated
> >   capability reports.
> > - Fail closed on changed descriptor meaning instead of publishing data
> >   with stale metadata.
> > - Add focused KUnit coverage for these lifecycle and validation cases.
> > - Use managed UART/IIO/power teardown and dev_warn_probe() for the
> >   controller baud-rate warning, addressing Andy's probe-path feedback.
> > - Split the former combined UART/core/IIO driver patch into transport/c=
ore,
> >   IIO registration, core KUnit, and IIO KUnit patches following review.
> > - Use validated/unvalidated terminology for framing/CRC results through=
out
> >   the stream/core/transport code, tests and diagnostics. CRC detects
> >   accidental corruption; it does not provide cryptographic authenticati=
on.
> >
> > Prior validation on the identical source tree:
> > identical source tree evidence reused; no builds rerun for DCO packagin=
g.
> > - All eight intermediate apply/config/relevant builds.
> > - Independent transport/core and IIO module link/MODPOST.
> > - GCC/Clang W=3D1 vmlinux and modules.
> > - GCC and Clang KUnit: core 16 + IIO 2, all 18 pass in each run.
> > - Core-only intermediate KUnit: all 16 pass.
> > - ARM64 Image, selected OSF module and Pi4 DTB.
> > - Targeted DT binding/style and IIO documentation.
> >
> > The terminology-only diff was verified mechanically. Wire semantics and
> > data-path behavior are unchanged; the receive diagnostic key is validat=
ed=3D.
> > Hardware testing was not repeated for this terminology revision or this
> > post-DCO packaging audit; previous hardware evidence remains historical=
.
> >
> > Human DCO is complete. No email has been sent.
> >
> > Jinseob Kim (8):
> >   dt-bindings: iio: add Open Sensor Fusion device
> >   Documentation: iio: add Open Sensor Fusion driver overview
> >   iio: osf: add protocol decoding
> >   iio: osf: add validated stream parser
> >   iio: osf: add UART transport and core receive path
> >   iio: osf: add IIO devices from capability reports
> >   iio: osf: add core KUnit tests
> >   iio: osf: add IIO KUnit tests
> >
> >  .../bindings/iio/opensensorfusion,osf.yaml    |   52 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
> >  Documentation/iio/index.rst                   |    1 +
> >  Documentation/iio/open-sensor-fusion.rst      |   77 ++
> >  MAINTAINERS                                   |    8 +
> >  drivers/iio/Kconfig                           |    1 +
> >  drivers/iio/Makefile                          |    1 +
> >  drivers/iio/opensensorfusion/Kconfig          |   27 +
> Any reason not to push it one level deeper and put it under IMUs?
> I'm not that keen to grow the top level menu for this as all the
> other entries are about type of sensor, not one specific sensor.
>
