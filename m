Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD17489879
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299920; cv=pass; b=m9SK8kWiSEE+m5StFTyNoUrTj1KNK+EHesrtcvCsxFu0BLl+iwC7t51hmFvZg3812rzcfwyOcpHs6si74ZzRnbIS/ICH+FYf472xRpI+dfHTtkF2X7/nBvLtJhKMHbAZQQmk5l2uUWb1F+OvYDNZNIggqwCYTeWZx/q3KzreL/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299920; c=relaxed/simple;
	bh=Z6WbsAnp0/k5TRam8CoApQG5u2b0ang3JjfGRsR4/LE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5/b2SsPOAZlK7jRkT8IZsd2Myco4I9tvWGwza6JCRNX1GKeLN7U01oCTdMScH+jvm0nfY8y6PCJ4eyGKi6ZgPCeUsG9qD0ELMgr46N74BVuQrj69g+A9xOPC/2lVGmdc2WhgiTqNNFfb7WhFW+HbgLedjdZfwGmkscmLtwJGxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vinJemxj; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vinJemxj"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6aa5d092211so4909927a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299916; cv=none;
        d=google.com; s=arc-20260327;
        b=fNLQT+LE+ys3ls1XUTCynBoY1VXpofllm3hDZfAn8yXHdT7n1FPr1RNwPk0cGdx0M6
         sIOh9RVfuFQo9k0uV3pCsLv9n0Dmi1Zc84ReEu+eNPcUr8s2ikafpDyQpT3k7UdHLF2s
         XKCvH0IKxy4cJO79lT7j9ve1SFy6rjLZyDDJtNR9L6XDJsIGW3HVhChiHn5snE99YUrD
         cKSWFFdzMPIQ9E292imrKOGJvU+PUCU8P7V2h6H5hON/6TNqLE4/tN1/OC45dmjK5884
         1gSkwTrKQAzcw7CqCvfftR1eYX/lEhePayKANfKSqzlnfwSOxoga8P9n70xC2YovaVil
         QopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        fh=CvZLCNQ1o97wcdZYA83kgW9SeByc/Mq4FV2r/RzxQyA=;
        b=SJHxEhx9nT/usnqGT8RvldF/gQPaCqUKrMw04IM8c99mjQ5Rw78upmQfPCKVx7cazu
         6kIFXyKYphYC/Y4Swj0f+RV+UCC5EyZ1hgcScDlPvhqbnGnnA0zVHK6KOOVh+nHmgrJ8
         2whNBNfsRXxo6zXclaVkTqT3hZJgTmssFGXk+VWERwuGQmu1CxcGFbD1RjCd24jOlhuL
         hJVHUcVDV7irP2fFzQ9JyIsYPIeHxtY4DGS0StiGYWuoIiBLbBCJapODU6C0hQgHdiYa
         T3RSr4PEI27ArsFvAUBEa4VN8XHC561R5oebhe0PmzN190JWJwXINoms+RGhlrdzjern
         1ruw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791299916; x=1791904716; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=vinJemxjfo0wtpRpFAgFolIEmK5h1JEjPQcX/AMCwCwhdtc+zvrWlULgduJ50Pr9VO
         xJX9/pmQZFWu0hcikEmrYOWlRLmLDMxRZuf60EZ+XAlxd8fuVz7tyIxfQcxqxTAOq021
         qh0RQqMV161mW7VccuYWu+k8wFFtFyKkK5sgM0yybLeW5h0iOBx/RmkZyTLDOY0segSM
         +24sbA92JaazYatCvTIfx3KBp2ZyoGvIwavOILBdB7oYuVHNCayu1x3d7J4dP02weV2z
         N99S/vtuJlv34K4IhkZSwh8a/JPfbU8CbQGg1p0CTAJLX0L4vsAGNozXrFWsb9OngU22
         h9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299916; x=1791904716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S8HNQKq2PFFrdWWXN5HW5t8uFb87m5DPyp4zd5PK5G0=;
        b=EItlp/Jh/EsTcBR/k1zEANVizJXJ6Mus0aT0E31ai7GrCA2TJkwWmXViznqM06H67T
         v9R4HqHlpiuvQPlWMShp4Exgsd0vl7fPNSwNCvhKvXptG1hrpYJFnEtzJEx3/qW6gWu+
         0Ij1fz3XbIBAwvgOvJXvgqMLVLXeLiFeMjaXIrv6woxGAHr7bOqEzf3gMvFAqVvmTsjM
         mpOz5pggCVjlDUXt0kGPYcQPEyZSrLwXxsRq6dKsLIgo+lKSqZBNFbXl81FYLuAy712O
         iDVxg0IFbKumDL853FLvW+iAyd2uh2LVcwPXvuqXmMs7ZayuULjzJ5z5/a0d/XQbX6o9
         iBNA==
X-Forwarded-Encrypted: i=1; AKwUvBw6fowveE10YX3Uk0y52sK1DALOhEC+O2x/sT+eo/Me9eFNxxSaM30LgN9PdNnV6WsuYbYd0P1vS+cPN9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMZ2LfUgL33BFS7FHEFwEjW+4p9WOISIrBla/N1vikvBL2K7aG
	CLu6HVs3wiye6QOWLPXWb0ZoV09RieTzt7bgp5tiMw5prtXb0OPGSH09QJOGs6FpGDKbi+VDOTM
	Wo+gLwQ/5niQJA31kuxX6XMnn21O9Y7Qd3vDlu5UlLQ==
X-Gm-Gg: AYBFou3Rqbp4Kc+c9MTB63C86VSCAwHCtTWlT7Z7Qlz4R9n2AzyTQY4n8eolM2FHg4K
	atCK9h6RoiI7w/L6Bc7UMMsW2OSAJ4XRvESFwXJAERs45icxhIq9/p1RiQ5A3+TA+S/4tmsQECu
	uRn6W6YlmSGj3DRmN+5cipB6zNc6W8XFnhRuAUgWWN2gleAYeVFzeYDi4dVJHvMLK5YMEx4dNDn
	vS6+6OAjt/WFDu03NYckrJ4EA8HB2A2enPEfiIa5Nk1siHZbR/DKCO/W+g8PTT41NeauU3sheXu
	JYTpWoqVBZQIrPLvKjQ+d60Z6A0FA/HwflM7rYtMsQo4mfVOBgTKYw==
X-Received: by 2002:a05:6402:52d2:b0:6a9:a5d6:622d with SMTP id
 4fb4d7f45d1cf-6afad731ef8mr8879468a12.3.1791299916262; Tue, 06 Oct 2026
 08:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com> <20261006030739.GA3457522-robh@kernel.org>
In-Reply-To: <20261006030739.GA3457522-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 09:18:23 -0600
X-Gm-Features: AclHuK9X3bTaGpN7i7UclAS_3sT01qVYKxTd90Hh58vpFwo0cpRNFUaLVMAbBaM
Message-ID: <CANLsYkzcqapDYvKAEa2ZjA=q07iO=RM4TVNUbSqDrB0EmjeKyQ@mail.gmail.com>
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
To: Rob Herring <robh@kernel.org>
Cc: Shenwei Wang <shenwei.wang@oss.nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Oct 2026 at 21:07, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Sep 23, 2026 at 01:42:29PM -0500, Shenwei Wang wrote:
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Remote processors may announce multiple GPIO controllers over an RPMSG
> > channel. These GPIO controllers may require corresponding device tree
> > nodes, especially when acting as providers, to supply phandles for their
> > consumers.
> >
> > Define an RPMSG node to work as a container for a group of RPMSG channels
> > under the imx_rproc node. Each subnode within "rpmsg" represents an
> > individual RPMSG channel. The name of each subnode corresponds to the
> > channel name as defined by the remote processor.
>
> Sorry, but DT defines the names of nodes. If it's a gpio-controller,
> then 'gpio'.
>
> I still don't understand where the unit address gets defined. 0 and 1
> look a bit made up. I'm sure you explained it before, but *this patch*
> needs to explain it. When you define a second protocol, the 0 and 1
> addresses are taken already, so you can't have 'clock-controller@0' for
> example.
>

I had a conversation with Krzysztof about this here in Prague.  We
have decided to adopt the bindings proposed by Francesco in this
thread [1].

[1].  https://lore.kernel.org/all/20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it/

> Rob
