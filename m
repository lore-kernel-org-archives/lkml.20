Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE1C33D4E9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378606; cv=pass; b=twj/YqlbXEzilcm7TMK4jDoJ1J4dQOszpMeFhGuezotkqdXvJwFo7Y6lHE0qlQf2mXb3f2yCIrYc4oiVQhOr4UDdWpIKzDqmqFYrNc4mp+0/93Nta/FrHG0SBDttg6cL0cgWjA0by462Dx9I220OYCNI9R/h+1Egv8/jhOIlJlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378606; c=relaxed/simple;
	bh=10plZnvJMhdXNsmI90PPzAB9gg2/WU+vKhsLPvgRwP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TomoIGD9UATWOw7Vi/qJTKxgjG/djJ6VuqUFAjuvRKAgG5yeh9EEN8dzasNcvWq8haWKrpXyVjb0KzfoAbn7sanMVTJfflYQyDXEXpCyCjsiJwoH98WeaGYDmkj+J6J9fpsafv52r4MhOKROGc0nvbeKyKj7QpNLjhuCJJjW0Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGXZ1ekT; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGXZ1ekT"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a75f960be3so16808411fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792378603; cv=none;
        d=google.com; s=arc-20260327;
        b=hh/1d3pLSfkRchY/LiNvtGiQ0a4DAMx5Hrw65/QVvdtMo+BUP+/A0b2wdKUPRPao73
         1gqksC8MFZTrJzjj9+hsXx6CCPm4ee1lQk9Tr/aa0H60jjw69R40+HiyBZyjbcVBtbOr
         iO8o0mfMIMxOxP9LaCpsVhsi0qdLa8p4cRHIaultLn8zdgo06/npI1z+q+CWhBugzu/I
         gU7EYULMIdgD7NdBnk1XXoyo6CHB4jWgclPOKL9v2gWda6UZ8scwav3jDO+d/+0M2h/s
         QvsCaxNiOPy3gfQ+0kXcNYXfb444bycRYGotAcNQldoqVSPzA2YLysOvpHdw04qBuq12
         7bJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rEXy3zJHTBuMv4/u8qe2uCzOwS6GppmHMS1cvnhJedQ=;
        fh=vDwYLzkEBu5BU8BP936D9iaJ1odziR1o+GiefRKag74=;
        b=J7keoNmhrkI0+2T1b6jK8z9KE1oZi5z3vWRqF1bGIhszdQ8ayOkIkYIAg0BaboYZOZ
         AdqEY49xJAy3orau7pQLliEALl3rQBbaR+Hy5Bp0gxrl90MgyyqXVqaiMc/dyKWpratM
         FCJPquA8fCtnmQHsxLX3bir8PWO0MJ/k2EetaWbmpMNjwPGL62TA1JusXS+jtgBWrkWl
         JWEu/OqEpDyS5HXsqimPXd49kz1/7KCJAjJjyqKQzhvGQpoW37I1470E0NP2HPz+ZTHw
         wyRiLJ7//t2/OFS1vUJE7Rchc2OFwxVwwOp1Cj+zusa/jpJrTD2aZmjio1cufFwb3Uz6
         VoIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792378603; x=1792983403; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEXy3zJHTBuMv4/u8qe2uCzOwS6GppmHMS1cvnhJedQ=;
        b=lGXZ1ekTbDPnyPV9bWbgEY7WSAOZSj0yf8B73tH3lAqV5YoFq2jjHP5YmMOa2StNn1
         8gBOBxVUQirlG1RIZ+7iHlrmwlM7lU77s4Hf4YiJSrT7beAIuwUprymPVkNIK1Ij+VjR
         u1cbHQeDFpb79/AW5eGRcurcP2LsUYuJTyi9l8WbX2NkyB75Q68x06YweCloQYxWzDn6
         wC9D7JFoLBQWJFOhHosfANk/g3SOAtO5WWbmLLBcCykaomHjkV8yw+Y8JkqAKxeebH/h
         KHZwASl052Fqk8M73bJS/T5GyUhVLnkYW+StI14+mBfh/uFMuAmhapIHQfa5ExIyr9H+
         yspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378603; x=1792983403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rEXy3zJHTBuMv4/u8qe2uCzOwS6GppmHMS1cvnhJedQ=;
        b=fa/1wUnp8pEbrdqDOZTeFb67BEi1KIER5PWHo7eWBXztSReHrcCD1w7cxTskraYXcR
         EEw5uGj0OQ/4MzRLMgRmsC7Q+tFOJs08Eb3neyFwScPW2cxmR9qNM1ySNCeQlbkbButp
         0h3NM5uXvvROhTWvfynJUS36ZvUYNgIyJGvqetInd9T+RjT87LYsR0ZSKX4RH56IeCah
         W7PDNn8jrCL1pcw9gIfTizS8wn9h+xHXD2PNzlzjnS0Fh2Tl1yNnaTHOwTCir75Yjy6r
         icCQJup3KwD2sGO436zOukPSLtg2v4EsR6h8NMdh9Er3a40419TBlIgd14Yi2lam3qzL
         EsUg==
X-Forwarded-Encrypted: i=1; AKwUvBxvcmPWE3nonH7AkuLzGPRjpLpYKZ5yZxepKtm6FjMGk18AujJQpQgfM3MjCxY9WqeENCW0S7xP+VI5f50=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRwO5njX/iZmxIJmf8e6Rfp4X5NFUafm/Lo0w9vRUIELksL6j6
	5zzjm0R0Du414OYhO9gfPvJDRHVUgZ/AXwcfPdjlfM+clVpwhzu6MnxaDvswI4qTUpjPmgrbZIo
	jfg0LDCnm/5PsyI2jdX6+l899BUvJnKk=
X-Gm-Gg: AYBFou0vMNICMEk/aSQmi7xcrjEqftU4H1ZO6sodyKYsIiJ5R8LREWGJ2mZ8Ix/k5yV
	4WLuqVpgofX/mXkZORv0lgs6fmf0/dH477kndHDyfdOqWzbK3m6vS6em1rIidO0Ly4JNXTrQiTr
	yOSSzP77KhbBpMUue5PWa42Sv7txJAVaFIT7F2DKwUKhEDf20F9WB/j+pWE+Fj0zOa9NMXYJ++e
	H2sjjGfp7d+5JGA9iXl2Ewf0vVy+5S3FLZuqHfLeXTtMOzGHZaTbrAWX+cSO2Jw+JNyUN7jhCXW
	2R3u2R1gxI6trFjxEr2XylosZjFf8AqDxXeKmoMDFq1LxoJt8YQj7PA=
X-Received: by 2002:a05:651c:19a4:b0:3a1:476:74b3 with SMTP id
 38308e7fff4ca-3ab29121df4mr16100801fa.9.1792378602626; Sun, 18 Oct 2026
 19:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016035851.771496-1-oss.patchbox@gmail.com> <a7ed450b-5dce-4485-b4a0-9349e75e4c52@nvidia.com>
In-Reply-To: <a7ed450b-5dce-4485-b4a0-9349e75e4c52@nvidia.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Sun, 18 Oct 2026 22:56:31 -0400
X-Gm-Features: AclHuK-33whnZxqMRpG7_qtTL-IVLp_9OZjQHscnm4NOXyKbUUtioZXEGPyA0lc
Message-ID: <CAGG=RgB2NYmjugQrVOiKyfPF=_aU47CY_JXGmCLQ-kOe4Cxp0A@mail.gmail.com>
Subject: Re: [PATCH v1 RESEND] vdpa/mlx5: Don't free QP buffers if destroying
 the QP fails
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 12:01, Dragos Tatulea <dtatulea@nvidia.com> wrote:
> This commit message is long and hard to read. Could you make it
> shorter and more readable please?
>
> > Fixes: 1a86b377aa21 ("vdpa/mlx5: Add VDPA driver for supported mlx5 devices")
> > Cc: stable@vger.kernel.org
> Nothing against the change. But it does not deserve a fixes tag.
>
> > +             /* The QP still owns its buffers */
> >               mlx5_vdpa_warn(&ndev->mvdev, "destroy qp 0x%x\n", vqp->mqp.qpn);
> While here, could you improve the error message please?
> mlx5_vdpa_warn(..., "destroy %s qp 0x%x failed %s\n", vqp->fw ? "fw" : "sw");

Thanks for the review, Dragos. I'll send a v2 with a shorter commit
message, the improved warning, and without the Fixes and stable tags.
