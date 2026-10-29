Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793286940;
	b=f/Ir0SU+j8wVG1f/lDwO/WUh15vgWztZPZRD5859vWSGnhRFiWQieRswY8HUnIm/bRcz
	 L5MCGuvSm0FiqWHJpHDRdh9/T3KoGo37IHOuDQYhV5+1eCumykrHru35gDrZO+xjqECp3
	 EFD3WmwE+OnAaecsiMkLLGF6zYBYlqvrGAJxXS4xmBZ/P785t5ODcb/9o3lff7x++1XX2
	 85IxZGtcl+l9YyNFK+XMNjF587MsuTbO6N6c1mI2QRcTI/OBys8UKOOCcBisiBPPpBtgH
	 VmwdIADIfC+r0dC6CNMUdWOMfN3gwjaSbBATRELg1VX3J2g4i6QV3jp+UR0jzzOV1TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286940;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hl9lfwLuHEFaKD2DgLZgrLN/YtArxi+yA6ah0W4bMX4=;
	b=VDH6ukaS4kzgcmG2tmK9bW9mUXkJftxTncAZQUi5XFtXFttd9ge/Q0mj16dW5tyhUHz5
	 vdkhoWExWO5e1j0unBfnaaLajgRcf1/h3yKMZ8vN1O52HNRyGckeUVi4oTorL3jpYKcjm
	 VAoG/sNwWXzJEBrCxMZ15Qn2dsziRWKSBM88ptSl6CtAnnvvsLVC+UZSHJXhbRFyAhLWO
	 MqCcmnJ8jRT4bjqC9Cumj073h1SFnQeHzhwBJBB0yVDhzrVjY+5bQK5gsR0v9O7fWmxcz
	 tFfh6Q/+eWlMXUcfde1OJJBjwKqfNaYj6o6sr1CmxCcg6qB46PCynS2WEeHwOHaMYpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eb/QGXzT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C907606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eb/QGXzT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED501F01828
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793286935;
	bh=hl9lfwLuHEFaKD2DgLZgrLN/YtArxi+yA6ah0W4bMX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eb/QGXzTOjsYyyO9gEdeK9O+EiB554RYGWgB4GcNUam8VNP7WTYV2oTEpDxQuxt1v
	 yfM3HZfoi5mxiBMzBry+MqIEvQx4nc1SARi/Duw1ptmJ2QRRWx7I7vPxXfL90OUczc
	 38feY+1ez+g57/bb/RgeXmtxDwXe8HERMmQLGgWO+RsEKp4KyWLY4jiSwdJEmP/gt/
	 fql+8a3lu2C+aj67Z1g5AGpF+dtHGn+85cXxwOBI6W8wqCk7jDY5Xq7KVwd+zeizy3
	 Ut118kjtD9IQtzuXb7QbexsX18VerSftE0TpqUctknfdRjkRtlge2pJCFEZOyifJO8
	 bZHOg8LMItYgQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a98fc80925so26640191fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:15:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJUflQtzmVBtu+HvfLe/dm8uDZU4fsq+m32F7ezgWSpp/hLdsw6hroUSIwioAGHDLX/TetYdUb+Hlklt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRvJvtpR0oz/s2/IJrCiIwCTsZEwFljv51z5iODNIUxtB3OwNY
	kVWqsfZksx1JUw4vadzq/1VehI6ADzYlVjjeN8SMIrZjdrXVovW+/PbS9J/VL5I5cmmycIe/hx5
	J29JJUo2pPQWzvS6zzVCB/BrmusNcdNQ=
X-Received: by 2002:a05:6512:230e:b0:5bf:b249:375c with SMTP id
 2adb3069b0e04-5bfcadc4e8emr2545141e87.13.1793286933521; Thu, 29 Oct 2026
 08:15:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015204450.1270-1-atharvatiwarilinuxdev@gmail.com> <20261029151051.1124-1-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261029151051.1124-1-atharvatiwarilinuxdev@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 29 Oct 2026 16:15:21 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jv9VQhZKbQcWYHEU0sQUPn5sLsRmqHzEtZ4T6GY0t3ZA@mail.gmail.com>
X-Gm-Features: AclHuK_a1SI1w6G7Vs72CVoh28cwrTfqKIrzBtQ66drVFyZJNdoy668BuV1QZfM
Message-ID: <CAJZ5v0jv9VQhZKbQcWYHEU0sQUPn5sLsRmqHzEtZ4T6GY0t3ZA@mail.gmail.com>
Subject: Re: [PATCH RESEND] ACPI: processor: Use Apple-specific methods for P/C-states
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: lenb@kernel.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 4:11=E2=80=AFPM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> Hi can i please get a update on this, i sent this patch almost 15 days
> ago.

You haven't provided a motivation for the change and I know nothing
about Apple platforms, sorry.
