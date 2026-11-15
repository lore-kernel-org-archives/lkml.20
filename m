Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736684;
	b=SCdgJGV8XoMA1QKnzxUXLt6SttZndMcp0fRUQENlB+X5JCWH3ZCJ77nNayPoSuFFX+c8
	 UBFCdeKZbATqAVB8od0HsVAWhG2t5oGqV5OwoctoqmQhxlOvQXlpemoAJfAK8J5cE83mE
	 AqUDfvM73T7wTUKFPwBK0wvdLUQsfeVE5Rc1oxl2e3R3TmNhhEGdHGplWtg7INVaU5zIz
	 JCUziqoaXtkOKHtWE6gqPyByHGW8Sfj43LyC20jkLfTMOKztMkpqXIYOJ5p++zepbWB7o
	 n/Ln9ABrKig/1gpSqMClaiZy6mXekvqE0R1O3gW8r4FLGkZR2Bq+iEWoh0Z0FmwYd+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736684;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=COD171vyvKxxKpwb5czI8gQ1mbPD23UlzxgscZ3Oayc=;
	b=eGduvpiDzH5kyEvJ5ybTyy4S7Oxm2UKZNz9B+zfA9Dc3H/sE+zXlPgRX+YZeO1uS5Fcd
	 r1TCx+yPVv+OjnjrgOKHahKDCs3CUfOx1jIcTO+rJt3FrR/5vM9hmP5dWqGLe2Dan4lGB
	 Il4ZkGhrtcSTO80l39sC1qUgzxYDF4ajJ5y4tvgwB0q1pzYU5LvoYAxaNqS/kdGb/QIAv
	 SBRJmp20gi9O2cmfrdPZ05pBc4lYpFnn8s9bJ+nmNvKUAn3v5JjYtbx0btYt4++oAWrMl
	 pfdlCmjJ9AXDkLR/dfreTgYaTDAB9mbx/BjrRq+vKwuLnyN6Z4jI92mvRdQxGs1bf4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=maryasin.name;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B05606A8A6
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B05606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=maryasin.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so3108173a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736682; x=1795341482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COD171vyvKxxKpwb5czI8gQ1mbPD23UlzxgscZ3Oayc=;
        b=U5+fxdwNS3uFm2jk7i8Z2TrgG9wlHZ3PQfrVwc+nsF7aP3VFgo9LO0laf446JmeQ8c
         DME8Nq/9TPf8ETKptcJ1M/mbyU9PMV62jZY7LQpEAOEb1mErix487YiXwFXDHjTa6Gs0
         bRtlJ+5KQhSNj63mKedfHY77F6SXQNOZtzgl+EpvKSvtWXwDGGEm/eFZIMwpxVUCQ0BV
         qShJF5i3b9efAOSc6olHIp2dl1PSkOM8/QFntCKQ4Bk76aH/2WbPiWxL0cLqJX1J1dJe
         y8tbqlSdyQcWtqUFPEaWPIVF2tQN4REVzxDYa/N46gnmtRNGR3f9a9anxe8nbJZ4T7DM
         M1Kg==
X-Forwarded-Encrypted: i=1; AL+hErHZe5OJ61uhI3HxDooNIXOxNinMBmwxNY+/TK+tWuVPE6UdchGhrD+xtKwikfk1oEYD/XeXmZdaMLUn6QQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EMr73aidtx3p978yt9z1mRld+0jzEEdn9gQxqG+2Y+7cbHvug
	0LgDaWqkxZ4SQOZgMIeey6PEXS24ZMsYO6obKtSzgstsEZSn4K7Tu07LMTXuYeUS4+k=
X-Gm-Gg: AYBFou2HkSxEKbnonuEBSULPTn0rKjhWlgp+1v5+47biwzA4giAOo1ik2uUa0gi3QbU
	B1/G9DG2/cfscLFnHtHf23VXt96ADq8qR+kwp4x+PUg+JjZcoowfnWq+ZJIJl9u3f5Jb0phyyY9
	vg+9dDeHcuWQBAeogicG8iuacPhje9DTuIlLqCjl/vLjP+0br8Pf4VTVvnx0FnpBJY2+UDXNeOj
	4VOVd19d4IGsOj1yCLrcs4GIhqy86YuTkx7n3Wy4hCb3HDD8V7o4WqOhnKW74Wi/TFkiwONORiD
	ObF9DXOenJTkKHSspZwRgv8+u+YIKFn3b8eaHhyjEC6FksUiSbryxuy3g+ITQiT66PiOAngB8rV
	GwRPLgtvg2D1KkT5trelOLlh0d1hglVQ29hj4lf5hyj4WYkU5PK0WzVgUXvKY3YO6JiJY4SGyIT
	ZYgJ3/s2s3ujpp7mEcDnlHHeANK0egr6OqNZFRrWug+nHSAfdEgL29j8df9ww043IOiai1cwsAQ
	HQKLzCbNMTmHzgfn1Q6WvC7PSjF1frTh8lQvcRmkH5EAZZfngXVBtlgWBBO0iGWxN62qyrgBoN6
	4ZQ5hJ/Rg/hh02kqpGO8wOD7pq91nWxBt1AiI3B8oEB0LWXBV1zkVcjqjvK7+YJYWPxOrULpZ/1
	Lqh7Jg/MhOpKakHvdNK7nnoYp3chUoYcDaFE+CMLPQe5xtcSLgrHc1pP0e0VZkOqNVKG+
X-Received: by 2002:a05:6402:2106:b0:6b8:854:da16 with SMTP id 4fb4d7f45d1cf-6b80854e0femr742316a12.18.1794736682158;
        Sun, 15 Nov 2026 01:58:02 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c25deb10sm3198416a12.30.2026.11.15.01.58.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 01:58:01 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3756583a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:58:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFPC6R0I3exKJ/qxGsPJoENFuEpEJ2HBR3XD47TU1URauDvEHQJKHGh+elcWbd2qRaqrpOumRPf50UJGBA=@vger.kernel.org
X-Received: by 2002:a05:6402:c892:20b0:6b4:21b3:a407 with SMTP id
 4fb4d7f45d1cf-6b7c0bd9233mr3786660a12.22.1794736681074; Sun, 15 Nov 2026
 01:58:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109195949.384888-1-srinivas.pandruvada@linux.intel.com> <20261114222827.4213d48b@jic23-hlaptop>
In-Reply-To: <20261114222827.4213d48b@jic23-hlaptop>
From: =?UTF-8?B?0KHQtdC80ZHQvSDQnNCw0YDRjNGP0YHQuNC9?= <simeon@maryasin.name>
Date: Sun, 15 Nov 2026 12:57:50 +0300
X-Gmail-Original-Message-ID: <CAM2dg7fDiAwbyJ6MdmbEbzCORWOvw3M8PA=DizDVW9dqJ41YDg@mail.gmail.com>
X-Gm-Features: AclHuK8YKYYd7hTDUaScS4yR4PzTj4mTm3WbiHpGDDzYY5tPmdTHWffr9PweY48
Message-ID: <CAM2dg7fDiAwbyJ6MdmbEbzCORWOvw3M8PA=DizDVW9dqJ41YDg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] HID: sensor: custom: use-after-free after remove
To: Jonathan Cameron <jic23@kernel.org>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, jikos@kernel.org, 
	bentiss@kernel.org, linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lixu.zhang@intel.com, crofts@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Semyon Maryasin <simeon@maryasin.name>

Works much the same as the previous version. When I do `rmmod
intel_ishtp_hid` under an active reader, I get several Timeout errors
in kmsg (8 this time) after which the module is unloaded and the
reader reports "No such device".
After reloading the module, sensors work fine again.

> kernel: hid-sensor-hub 001F:8087:0AC2.0004: timeout waiting for response =
from ISHTP device

=D0=B2=D1=81, 15 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 01:2=
8, Jonathan Cameron <jic23@kernel.org>:
>
> On Mon,  9 Nov 2026 11:59:42 -0800
> Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> wrote:
>
> > This is v3 version with changes suggested by shashiko-bot and Jonathan.
> > Also rebased on top of 7.4-rc2 kernel release.
> >
> > This patch series is essentially the same version that was sent to
> > Semyon for testing.
> >
> > Following a feedback review conducted with various AI models, it was
> > suggested to break each change into individual, separate patches. This
> > makes perfect sense, which is why this series now contains more patches=
.
> >
> > Additionally, these reviews identified issues in the adjacent probe and
> > removal code when active sensor instances are present. I have addressed
> > those issues in this version as well.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
>
> Thanks,
>
> J
>


--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
=D0=A1=D0=B5=D0=BC=D1=91=D0=BD =D0=9C=D0=B0=D1=80=D1=8C=D1=8F=D1=81=D0=B8=
=D0=BD
