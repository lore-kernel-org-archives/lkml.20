Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793465430;
	b=n2S4+3yH5wlLJHfA4oaKNO+kJviozdlK3c30PvW08vjq8P3HqcNa1bNTvf/bpL5J5kgK
	 SNLlG7hugjg1N1SBbYu5Ews37M7vSe5kulW25KtmloEj8rbF7pXPVwEkKKanZLH1aGcIp
	 4Lh4tYbFdtvyTXtFW57bySUSCwmyd7vxJMLHJyU8PRAvC/Gi0oVD0+qT63la+8UDLc46a
	 gm0A+ZGpw4MZB8XHxn4zeGrFUvW3Q9xCmHG3md08bhLu7qmiMZOobkz2jbTneCRVIFDft
	 Q9g435VZ286IjBxBlED+t5rosWHGYF8Es61Md02nelf9PUFUNTgoDCrlK5VofCpA2KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=p7THrwOGLzbplnbkF72+f87VrPU0qVDjWjDR7mNS6ek=;
	b=m/fHtwMo74+ZlcaQIgyPxbi9mgQstBNVlKxZELLaLlcqR2K8S/IjXJM9IBC3ti9iat9t
	 UH2nqLoGZ69TZzDmdy4dzydQ+9CngBnJFm3pByNlfxHAL4iCLxmj3SJ5/iSOKbxIOy6uf
	 mrl0GDjcZA+A8GBay9SrVAfYqC7pWWNm/6O0+7UvAg6UZNbd0StgaiP+t5lfE3BJHg9Pf
	 2iqDmIEPp4A7tz/o6kA4iN1NPgvl/C5zpcqNVWvESTMpPO4VBOi0Ilz7W2HCvi2u/NutX
	 WicIST/zkNW4IcZJvymMN09d8Mj4j4Ojw9NwYkCdfh0mVvDDuimwooNmLw/uQpEmPjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xU/989yO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13923606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:50:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13923606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xU/989yO
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48ed0b68895so1221967fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793465429; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/WfC1zx9IA+3ASh3FeZ0PkMz2Y/ox/YnuL4Nikd1JVgvRu/gMhGvRgBQCrlVTxh47
         5KkW+OWRK5/nj0Uxg9QXv9sDv65GRV6RY5g5ukmwFo9kA+6Vjiqdxmt8YH8ig8b8aFPM
         Jz+m3HI0Jki3Zjh/ZKaBz0OEUC009/ritRcbDTQ02vfmUJ6G/A79sg5cg1SIHlP4Th9d
         SyfYVnSdaq9sxaLgzBwX5W5Mk7iUJ49fKQzbQe8rtGYLDEafoChvTRDs19hCi/ccQyzb
         lsD0dz4lG6wZTL37izLTEBSM+EC5OvQvR8LYvp7viV6OiodiaWghwmx4zpVR9xC1XNDA
         IK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p7THrwOGLzbplnbkF72+f87VrPU0qVDjWjDR7mNS6ek=;
        fh=XJauy4/DwaedyDrwY1pNMYR+WxSPafiHAux5QyuMm0U=;
        b=XzUO88o8BKqVbWLD8QFljDY8qUIx5Xgz/Fxb+roRQxUrvhSVJsx4WoGknNM9zO/4b/
         cqaCf6DcJSmQUU14m+pVzprraLeH6s5vL25VPWZrthaO5EcLLoSha3CEHix4pYRsYyFB
         nr2yPnj+wKo5UiPSQOj55UCIejiV7jcUfij4h8noPl64ETZcn40n8AGmZpwqcP+T+t93
         aEpB4/EFtSgFqS8pFFuWpC31TeqUpErT4XQhU5UDkC7jRoGqPMuNPemsMuUEfKdpUw94
         AuSA5vHOAsidSIDP+NBf+Ghl6ty89Cg6nR7oQ5bp4ZJNVCGoY65NmZadVgysfnzJh4pv
         yrow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793465429; x=1794070229; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7THrwOGLzbplnbkF72+f87VrPU0qVDjWjDR7mNS6ek=;
        b=xU/989yOodyTP9zIdhLr9aOv6sWCWIBE1VClDUpQLlePRo7VRMBqTNi6eOjbPAPu54
         mYEcfRm+u1PKEkOTpXkvePHM7nxebemIwPy3mGmYk7Sm/RX6HOBCO+jKGUsAsg655OsE
         1vOx9J7QeUe+MfjEPG2KdwDk/1blaXpiDqo+hMtdxDf6RBhJ6mJ6SoFtT0Yo7Yywt7wX
         SMaBsCd/ZaSFceR42o++LgP7AzBwmO5fJVq5WV1cXuArYg9R1BiBR/fPBysPOSlZDQrM
         rx+7BeZqHcjtqzK2+jioOQsaLt1WOY6ZebBo6AUE3NByHTkrGQ3dL/uIykYwtcFUoAF5
         SGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793465429; x=1794070229;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p7THrwOGLzbplnbkF72+f87VrPU0qVDjWjDR7mNS6ek=;
        b=BMN672CvRV+2qV/BFwJ4Dk7yDQlDenbvBn3ztUXsU+d9U13n03g0Eex5FmQV4ECmQK
         YWii8NkRVR81+kA0pgdz3BMAoErdQFyarRxEmxrCnVBbDgQZq7Km9uPje8gXGhVfvsBa
         b1w+inA0OD/dis38/P6Bm4P1FAri92VtE3jIj2gIDVSO4V/NcAL1Lzfc4dNZrLGc1NuJ
         WroVQWft0UDf9RACwMyPgeKPzt7iR5qnKSV0qxhzkqVZa+9w4hwM7+2HnZpgsxuWN1Ou
         VMHrhppEgtKHzAQUxRuWP8be6byX+Be77kwHM6YSnMB51Kag9DdpWTE8irjl+is2SCT3
         j2Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwMZ2BM/KZIHkN8qqcYaElrdsnKqMA6EgFDp7Trm+cTNm4+Xv/sLEOiX7ZncJqUKT19Z3FN/vqXoP5iyM0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbZGdFg+ZZDLKS60W2YR6dDrW6PifBDOXfS7v5c5xVxiZYS4Lp
	Wv3SoIZaUgzhEZUttNlxm9ZTYKMNXB28rfQNoHEicPpKHdjiZV/xVLdCZcPf45RyD3jB5vkBeSc
	d0LDdYqG67rNPQas2/NQHIyWaNp6hDNI=
X-Gm-Gg: AYBFou2Fv8FliGVsEl0huwPir7zDxvEYXqhuTKhRgLJtLY0L1mzSAIlDdqRLuzIwO+w
	fUXEPCGWP7H+wzKjQbleHjd6wMPsfBdpZqyJxNITFcDNRlndTacbfBV/f/e6B6m+2a7GVeQ+kz6
	n8RBk2526SHdNNVgNlWV4zrTyoU1++Vt912NdEvhtiFlBKDAEhob8MxN1/DK8UxCkxYnlUriMa1
	2ki9I0KODr4QcVg7nisLOR0KP6tS2dV09ol0r0QKJjQxH3nawuDBNAQGdXYKEqLZDt5OmvuR/pM
	X/SYhKTKuABobKl2Jx0k59llGoo39r/7pI2A4xYInwTYZaVcwXtF9h5FSN9/zY91ocvKQ0JmQbZ
	E9kJhV/yhGQTYce07QGxsot/pvWiWwVi5cQRZbF/yCHUJN4FpstctccY9EnTMnK4MvCdBXM8=
X-Received: by 2002:a05:6871:ed4e:10b0:48f:e3f5:c41d with SMTP id
 586e51a60fabf-4a942ec0e6cmr345290fac.62.1793465428799; Sat, 31 Oct 2026
 09:50:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029134752.1299130-1-hjf3108@gmail.com> <20261029134752.1299130-3-hjf3108@gmail.com>
 <20261031105217.GB31143@wp.pl>
In-Reply-To: <20261031105217.GB31143@wp.pl>
From: Jie Feng <hjf3108@gmail.com>
Date: Sun, 1 Nov 2026 00:49:52 +0800
X-Gm-Features: AclHuK99EmjXHytrhAXfUc1juGAzdAptbINp4Vqbhf42x0phiWF-brtKCtwlhmI
Message-ID: <CABOQOSXEDgrxy9+J7DmrAdSz5esprHdX7nK4+2H6ehf+DMKyVQ@mail.gmail.com>
Subject: Re: [PATCH wireless-next 2/8] wifi: rt2800: calibrate the crystal of
 RT3593 with the beacons
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Oct 2026 at 18:52, Stanislaw Gruszka <stf_xl@wp.pl> wrote:
>
> On Thu, Oct 29, 2026 at 09:47:43PM +0800, Ho Jie Feng wrote:
> > On a Netgear WNDA4100 (RT3593), as the adapter warms up, the
> > frequency offset drifts enough to affect the link quality.
> > In certain cases it can cause the link speed to drop
> > to 1Mbit/s or below.
> >
> > Add a frequency calibration step function to RT3593 to use
> > the frequency offset obtained from the beacon frames of the AP
> > for tuning.
>
> Presumably this is based on vendor driver? Could you point
> the sources i.e. a link for some Github repo where the
> correspond code is?

The code is taken from here:
https://github.com/boundarydevices/rt5572/blob/54265ac82ece4a1c6008a3d44d4abe96bf445479/common/frq_cal.c#L176
