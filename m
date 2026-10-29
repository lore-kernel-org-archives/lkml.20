Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280217;
	b=A4UAd6zTsmANPDbd2f6oCYQ2e7PIvzOB9NMPFMLeOkTOzW65LRR9jCKoob2nQtTSRMnO
	 5V6C0v04+mKPdVON5SJfTRqoRODlX5La8SXsr9g7CP9nOx1Z/9LYXYh2Uyhwy+MaSJUaX
	 mmDJcrDzdRTvJGWHcXeJHprmk7S1Gc/CiCmOXx5DXltvXC1MmYBSPJSEhX+qqwmbfp7nQ
	 j0Dc4fgu8OJ8OvSdkg5jpjjpCmCvu21RhZsQryQcyV7jajL8IONTtOHXcdrPfn7zqLFK/
	 2MOYTwVf2+m9/JpL8zCR9e0aWO5Oh8NM528jBDFFZzFp9BwkOG3+ZF5AqxiwCQJqdIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OwYCnrVFV8I2f8pmllBeUgdIyQq7zFSBdo4u/NvHzyU=;
	b=labn0Q2iIcflNYOYjkZqfDljaooleJvOMZvBI2+J3wFkUcSB0DLKwvd1yokuA33vwa09
	 DH+Pa2kDEuQp1STzYuk/TC69V9sMAS6Ycu/DUYpCOYPPltmpk0NbYYSW2651XdeeKFoK3
	 XGsokA36g3STKwLvHSgnAzXHEB6T7i6DMUe/CiG/CKwc5rDnag6mpGr7XplwFut8Pisdi
	 CYaeP8zepVyvwjQiXF1e9nV1/FvE9obyv6ETqfMASMCctxY116DBHoofn/WD2l5EmgCFX
	 ZXRgwSf245l/UGiBCWReSLaCMpu66hak8mFiY4Viyk2I5B0FPdVdeKr+UkwRGV6gaKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7l8njuq;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D7606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7l8njuq
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso19049575e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793280215; x=1793885015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwYCnrVFV8I2f8pmllBeUgdIyQq7zFSBdo4u/NvHzyU=;
        b=a7l8njuqabjLOu3Axh5c75S2bujHGqomCqi6oSZhYiqD2PoV6CSGJP7Cg23y2I7H67
         0dh5r5ABiXpI8C3iNFTbm0i5S1nIibCDrZOkVG5YmQjdmbLoZYyZlCHVY++R4EKgrpq7
         0ApzNSa6B/Bkh/mBLFP48YCnBkd06W+7+JBRL+q0V7S+g+6Ijg3XsArz5HyefJOR1Qe/
         S6vsxGjK8nJ4SHe9IhGJ7QrpxwETIMqvftsJO/AAKDEYwukFWFNHnEbuNQXfFfvYvMsC
         dYoVgt7T6yYJlY6K9tVwfTwW5wCu9sbBIS149ybWXsyfEjiccN+aEHCR9TqLXNcPtWFK
         wf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280215; x=1793885015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwYCnrVFV8I2f8pmllBeUgdIyQq7zFSBdo4u/NvHzyU=;
        b=ULDRoLN49zWfQ0D0iZ4sG6b+Yg7IiQnTIyhMaRB7NoQcgiV8jY7uPVAKJlMzepHZu0
         md6xQNkZ/bXBKenoTpulWcBnnlbdDdV9NSJSwqGHKIZaBigra5zCJSNgWyjBMAqUaGUa
         v25B/NXCG/8PzJByCrm3X6U7As5HvZ27QqUYy6/BsLoWlsb1fLAlki1HA7Vv85HyHCB6
         IPCtokp7xNswquae563EbtfMpalA4v9G1MzBftQfRvunPESKAIdwctGzaxIMcyJmDL/4
         dUje8brp99uI+sRpawtFWE3+cPU5ibwcMFEylbEgiyGNMoJhcwzlFEUE9CRT16pqDN6i
         fkHw==
X-Forwarded-Encrypted: i=1; AKwUvBwNenczctUhQZ3dxYaAq0D7dPKKBrFYPNr0gY4KHYSqDrkCmETvgMXAROXTLzfI840jbpY+t7O0iyfzhXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHvH+4zuqttkM4FeP+8kREb/19AgKg1O0vJSVR6C5kyxiUAqsQ
	ItGdBW6jnA9YxDKxRSVVmOLn7pcyd2yfzQh3RZfiIJ2kCMIkBGw/tUzr
X-Gm-Gg: AYBFou2egtxcbIFWBzpuECfB0T6S+qIG7xGNhXd5NMloPxby0uwHnoev1oRbfRwTIou
	elR9VMVzt94+o6J9vEqnnhFPbUNmheMmXGX/BZh2m3h+Bu66SDv/cDsRtG+0Md+PHhOBwoBGsbk
	W8CrE5e4oSOyXLBWSXdl4qJaNMHx/6hGw8KZkiGCLGZvqVYCWG5vuhOl2w50qoC2orqYr4x/BPk
	K8vMATH5wTx55/QwzZcpW9w6rLRxeY5qtEEhSLOP6T++hMZRqLKgLWi8cz14nMQerpon3vhNFmL
	pr7LFLPDdXrK8w7O3Rztzgwf5Yu5Itw5A9MWnGrZgEUN4bVBlXZ2vUVhH9aaQppX2hF/DtIwPna
	hjXzKsYrjybiOUZej1DOgCbRJueCF2khCPP/+amn/OnU7IRtEldJGvsfrdHZDP1bZoHvuLDN4ju
	xnCSksq4s+tAlWGJCkNRDuIIPiVoByjjQ8mYuvpWQEpGFd9/G8ulzV5LFCZloLIxsxWQJaS409v
	bC8UkkeWadIToTS5XGKbmmY3WnGFputBC3cMYlyQqZDo/2YrgPbbqEA1bkEWTCUAUVpXwUG83sx
	gSa9WCIPXwAtNMQll3N9ClgssFDzOQe9+9Zn+Q9akNx9aP4lIfkjqWrGhgwzSmbwQI0WRinJXzt
	R7zb/Mm1xzRAaqg37mtei3WHpADWoc5dTkeu9tPj+tm/ufnJXt+JhozjuESRp6pl0O0qcJ9qF/a
	E8N1gehevU090L
X-Received: by 2002:a05:600c:354f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a965ec95f6mr130057815e9.10.1793280215255;
        Thu, 29 Oct 2026 06:23:35 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm23216785e9.12.2026.10.29.06.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:23:34 -0700 (PDT)
Date: Thu, 29 Oct 2026 16:23:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jose Nieto <jnieto.alaber@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: add missing newline to
 sysfs_emit()
Message-ID: <auNI0owLeK0gwOxF@stanley.mountain>
References: <20261029131122.167464-1-jnieto.alaber@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029131122.167464-1-jnieto.alaber@gmail.com>

On Thu, Oct 29, 2026 at 02:11:22PM +0100, Jose Nieto wrote:
> The sysfs show() callbacks must emit a trailing newline. Commit 14c91651df34
> ("staging: greybus: audio: Use sysfs_emit in show functions") converted them
> to sysfs_emit() but dropped the newline. Restore it.

This would have been a convincing argument, but it's not true.

-       return sprintf(buf, "%s", module->desc.name);
+       return sysfs_emit(buf, "%s", module->desc.name);

There was never a newline and adding one now is a change to the user
space API.  We are allowed to change the API so long as it doesn't break
anything but no one has been able to check.

We have recieved this same patch over a dozen times now.  :P  It has
become a challenge to keep rejecting it over and over...  But I am a
stuborn person and the whole point of staging is to teach good habbits.

regards,
dan carpenter

