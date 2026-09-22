Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE9491583
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055865; cv=pass; b=qX7MP2/ginwYuW22Necxt1GKhapIz3ll8MjkKM3IZ7P0XkdcvgV3Vtgfx9hsGKiTplfmw23FESU1EAhZ+IXBBIUH6WJgGFBMV0WYMmemnv43kfP0DIHVjQT8hDfMV1pR22N6EfmmLv8kHNYVGgyoxFhgYx39kX3OEUQ5xgB+oIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055865; c=relaxed/simple;
	bh=mVQSIA+KZumLgnewVGIvAtxnjvVRKy38ae4smjKb/as=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCYYMulAVJlc3TV80tbpoMVQ92rQ2f9J6Q+cVMT3LWwTzhe/NjPzzoEO+MZ8QHUi7a8hYVWd8sRqmi6LgJmisCURx2Ub7kbj2yaOcW1u++K8VWQBp5sPN3K97EUwXECK/QK2lYdhmEWaUG+xq3qy2hozb0lqB2azqguh6jbafW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alh4MT4/; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alh4MT4/"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85d46e4cdccso24200667b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790055863; cv=none;
        d=google.com; s=arc-20260327;
        b=Zvkd3LMxlSvM5IxOutRPKDHgt09afyZhuAZPkIAqBjfyeqvZh/MuG+7i1Zpw9YtooB
         9KJtcgAj/ac3vcgD/FOR90XynAq4UhwB+JTLZdxN+33k0LC2yu6Eikp19mmusipw+WEV
         FnF1oXZYOxyricS1QpwVF2dsmtvknGEqNfm7PPY5Vz5eWvl8A1ICAQmrail/ST2xTsU+
         R9dTfzf/lnYNB6HvDundiFDoFeR7WUKGb5IATqTpIzk2+p4uX6xtHKL9du75KvvNWrog
         8zOR5qhuCUYwlT8u5v2bL6q+6BDRD1AgKS8BdatcWtnN4yse/yPgoFd6BFX6F/kM/mMI
         Na/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mVQSIA+KZumLgnewVGIvAtxnjvVRKy38ae4smjKb/as=;
        fh=a3w82IU8KBIflPKui0IxcGmpvr/7gCe5ph0NH1+Apk0=;
        b=Md9jeT8NfkgfGJh/U5xguKdNTvyUFVX/8lpSrXtAUVD+E5LQKhOyeEjOvQJgHjCji0
         2cQtEVcW4D4YAhUNQhKWrN/zGau4euQkIl9FlvswjCzHZn2Hb8MLY7eWFNUfTl3yIJkR
         LiuosF3TJYj4H1iBIsbwc5ZX07TK+UY0mB97xkG/OKYVHAeapBmdSR1rf/X8wH87rgbF
         P4cTdLrhxx/M8QW5SRkz59PVPYd161o2JT9apkZUwImexOXn2WyUcLWhuYr+t9f20NJP
         sq8Z4JjXaQYJ4yUTCcPmudKuNF+H2kIFgdhMxDP/VxEljU0sXksHkdoRhV1JgnZ4iQgm
         2Pxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790055863; x=1790660663; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVQSIA+KZumLgnewVGIvAtxnjvVRKy38ae4smjKb/as=;
        b=alh4MT4/RcYVDgAdFFUjukbEVgDAlTB0HsQ5/unsb6GgxfVrJT65Wa03qbbMYXIbrm
         aPXvMcxxZgfEa0GXKv85LwX9nFYVIWUPpOvdQLabI217ebezb6sfKev9T7HLX7+6xT1U
         AyHVFFvp6aMd//VK42Phzp5SQZaw1+bPRGZrWId5/Je9M2cmGSow3c4YZDK1i/eg2WN3
         5Z2+VyuTo+9kkn0LHgYZDoNXTIcXpKJoNGnHKtQX5MHNV8R6koILCotIyeCyPZWzTzMD
         pgYqh7FzsBiWRdrG3hLKSvUgImzUFO6Uskx+mhEr2HBz7kps7ktH4owtTqqh+8HkF6mb
         x/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055863; x=1790660663;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mVQSIA+KZumLgnewVGIvAtxnjvVRKy38ae4smjKb/as=;
        b=tR2ajie7I+pZX+G09EwOwEAJ7N6+iytL5QZBGHsRn0aRqvVMXCfG8PvAh3u76wfdWy
         b1zGmzLUXw17i8Iwowm5Zn1jnoDihw1b0uywwI96IYR0zkTLT4GyOCSYgmIjm/nFVgoP
         /m5mfgR6raR8xYqLF5VsMxwh5iYPh8xIrpBQxDXohnnHQPoh9b89wU8cEFTLycrweyeW
         sjOdcrXuYKLrJrqNiXIUq+TqSXe1x/5XPMB0ecffK8HRWhhpcfePCfKGJyswTqLSSyYc
         KRNNcD+T4d4U5knaXowXzAWeVnmcfC8q9yYGPLKk1ZXd70zL08Rte0cTvL+cIi2LcNu8
         HjLA==
X-Forwarded-Encrypted: i=1; AKwUvBwg23JEdgJUldF78MZ+oxR3cE7SxqvU505t2sv15PAM2SFBsqGZAp1Qnn0HtJXJcA90Xbdk6uxFXyvbYWU=@vger.kernel.org
X-Gm-Message-State: AFuF++lVMIfcVMDblUi7d1CfmjoFqBxINbeqIqvJxFrDvAxj95BWb18B
	Mhe57dh/8NzyGJQ8hrzJ3WavqqgpjBSknlaAPBsht9wQMx7PspzirkYWNLIPu+UMnUefObtsCoo
	VgHNLdExj0vhFcS1KgmAFcCq+JmIPhpQ=
X-Gm-Gg: AYBFou27GIBQ0q7zL/wtMdpbU8RU1o2g2+jj4kxX7g12trcW1Wr+z51AxZVRaixSXZ/
	5/Hk3qlYEp0E1MidZt7ekdMchqEiHdhHzvi/6rTLkCkGhX+E8WhVi6F1tDEKS2+Vi8URWavLhzf
	R44XGEQ7bN4mhjP4fiBSstb27Iml9P61tSnakabfPMfMdogY9+8yJnKC5lcPaVvraru/xwW4w6E
	SBcq+EliSJlBikj17Uj4X3tutVXLjag9wmG25omK0cA5yn0UFfsEUd141Muw12QtlNz0Qqgm6cD
	Gy1kgEpv2B+orgon4uVicPy45m8mg58K7EILAwuzvQkmZqsKAW8C8QU=
X-Received: by 2002:a05:690e:140a:b0:671:70d1:d6e9 with SMTP id
 956f58d0204a3-6717fe6484amr3963390d50.91.1790055863048; Mon, 21 Sep 2026
 22:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922054116.416333-1-oss.patchbox@gmail.com>
In-Reply-To: <20260922054116.416333-1-oss.patchbox@gmail.com>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Tue, 22 Sep 2026 01:44:11 -0400
X-Gm-Features: AcwNN1X4U-FOuecLC7XSWshGXMtdfg5aLnegDD7bITFGtDrk_TB67QveNxFm1nE
Message-ID: <CAGG=RgCA4kAbx39LuSRiKu1sx2CbTEAhZH1bKNCxPn5i1m=x+Q@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/virtio: Reset device before deleting virtqueues
 on probe failure
To: Jean-Philippe Brucker <jpb@kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, virtualization@lists.linux.dev, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 01:41, Yuho Choi <oss.patchbox@gmail.com> wrote:
> 2.43.0

Please disregard this patch/thread. It was sent inadvertently due to a
duplicate submission.
I apologize for the noise.
