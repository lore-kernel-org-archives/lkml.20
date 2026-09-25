Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB07848D86E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352062; cv=none; b=J0F2yy/AtM+HpRIsbWpg/OoMxcTHHqtMvJAGjLue2fLpIYaG+XqFvDhoZgqeoj8DGBEQ/dseFsKMca3gc1zelxZXVgmK3oNYEFtxI7aDqptyba6vUgsnODgWhPzMg2KTitOhIhBe51ZF3Liu/L5JbxA8TNmgwaIT1ImE+s2zYx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352062; c=relaxed/simple;
	bh=LwkiBRQLkdHrrUPlICjBGPbg8XGIp8uCBdZgKfAsGwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juDoSif39j21iaL+p1H14ZWSr0EwQ9xd3basoaTRDiY82zR7UT+94J767/ya3C2Po05DPeuoZmDXAOqR85eBWxWFKt+AEeoH6wPXSSlL3EPpcyo3c30dp2wp5Q5hg+VVaObFzaITkjNlA26Tx11KL5+Wi6UkO67BzH+slhTd5Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLET+PUq; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLET+PUq"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e36so138963a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790352060; x=1790956860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNt75hu8DqQhXGUaFQJP3Ps42RUKw7nC/8rcsC581w0=;
        b=yLET+PUq3fu5rQdAYKV+Y+wdsuL4KZeEnoOw+eL6mpH5zxmsDmGcI7Xt4Qzi2BPc7Z
         8nai/5Bodqohn1X1wxt0rX35citQlxWpZrJ+WZWcDvO99/KyybVmYQVljpYdzUUYv5zz
         VHj5JLwOK2BFkljtUc6dQlKQPU9lC54m9omozQSHs1OSD4zt3NWb0J5aanQVDXmcT1kq
         cy/8xdX9dG4hlVG0Xwm+0XjUQ051r5ZpU2rtsqFQrnSL2MA3M4dFMZypMbIgRCL+rxi2
         icU1tgSwuH/o7O75o3+YU9JkRzj5cBefmP5qInqXMBO8mOECCy3VDtF2atDvnK8AT0Vp
         v/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352060; x=1790956860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNt75hu8DqQhXGUaFQJP3Ps42RUKw7nC/8rcsC581w0=;
        b=VkzDKFC09ZVWnehtGI5acHpfL5mZKWou2mXIQEULhAYxVBdPHAr3MdijiA0NuYVZoF
         qjEZAVSJTveYpZmKOOGA5NPnS44ndnFpztasaz6Q05FewMp39FsLG3B+5JjTPRokb/Es
         iRzoVuyKY+m/tlp7afZJJrfmukN0fTL0JX4ZHwBHUtCQ82owtKbzYEtqUroKFOWUcIfX
         T2150fr1FV3UyPIG1T0hQYVN3sMyKyF32LU8yC5P+46B+WB4pyg4LWibdtZphRmiOADw
         5L4lWYq+cijyodUfWUFNXPf/tjaMFDHwoq4RIH3OsHa6crdM/AL/NkoXStcMLzjH5dcU
         OGiA==
X-Forwarded-Encrypted: i=1; AKwUvBz4lok6jd3yhblwKVfmdhs61iaROydOvnM7LEItXIM/m5iWNrp5ZkoANv+r/ZkPENe/7gm7sQQTsAe1NVM=@vger.kernel.org
X-Gm-Message-State: AFuF++kiDChunbj3pniy2GUpiQkIo9XN6iO1TapanPdeQkKAI/qGAmV1
	xi5iDLQWaSbtXmgETb64WtxVlmCSOEX/GQjEmnlqsdoNf4P1wkfB6+cd4i9ccwFD8Gg=
X-Gm-Gg: AYBFou1WBeJeHxEj/N16AjxKmEuPOa0oIVUjxrmod8+1K3drfaRal1YY7E3f93yvi/r
	BqKAFqE2Xdsnf7QuJOzMP3gbzGWKp4/nUKGW4qq3gO1SMgIdzkYfj1I/dMCGUVw0/8EntfJ1Dze
	Rqr33+5c/BI+G10ofVJjgNybeliwpJv4ofCbCleE2nxzPLxEaYXbzvmC68a+8+ctC2VIL1n/MyE
	AKDoAygIqXOhL4uP2qVDid3J8S+PC29dWW3luZAlmBj+cDG1dCYiGuQn6Dgx2EH2UNT1lJ89f/k
	hFmmAh6wQPjhizrYE8Oaj8dsJtADAshocofdotp15YPLY2RJs39pX5UVDhgVX+wWlpOSdsoPSzE
	8XWQvGwq6iDauPvDO10d9+xUY79TRaTPXklj9f7iE21HAfWeQ5k1hBD8nuMfitkKNSbvKI+sFIh
	56rXwJWp5kQ891ZsOrQZb8yaZdpSRmj1DdKE7LvK1ulJCJwDJvkYk64TMcEdpThwepyeSbi/Q6D
	8JUiZ00Nfyc
X-Received: by 2002:a05:6a20:432a:b0:3dd:a196:30a3 with SMTP id adf61e73a8af0-3de0e9b1d50mr5860898637.83.1790352060028;
        Fri, 25 Sep 2026 09:01:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:448f:6909:f2ff:6dca])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm1592606a12.32.2026.09.25.09.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:00:59 -0700 (PDT)
Date: Fri, 25 Sep 2026 10:00:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Siddharth Karanam <sid9.karanam@gmail.com>, afd@ti.com, b-padhi@ti.com
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: Add ti_sci_dev_ops abstraction
Message-ID: <araauCZDetNL85ZM@p14s>
References: <20260922191453.324983-1-sid9.karanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922191453.324983-1-sid9.karanam@gmail.com>

TI people, please review and test this patchset.

Thanks,
Mathieu

On Wed, Sep 23, 2026 at 12:44:51AM +0530, Siddharth Karanam wrote:
> Instead of invoking ti_sci_handle's ti_sci_dev_ops member directly
> in the driver code, this abstracts the property read of
> "ti,sci-dev-id" and the function pointers supported by
> ti_sci_dev_ops such as is_on, get_device and put_device.
> 
> The goal of the patch is to maintain a single source
> of origin for all ti_sci_dev_ops call sites. Any stray calls
> to any dev_ops function pointer members in driver code should
> eventually be abstracted through this header.
> 
> The second patch abstracts certain device ops' firmware logic 
> even further (such as get_device/put_device) via pm_runtime.
> 
> Siddharth Karanam (2):
>   remoteproc: Add ti_sci_dev_ops abstraction
>   remoteproc: k3: Abstract ti_sci_handle's dev_ops calls through
>     pm_runtime
> 
>  drivers/remoteproc/ti_k3_common.c         | 16 ++--
>  drivers/remoteproc/ti_k3_common.h         |  4 +-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c | 14 ++--
>  drivers/remoteproc/ti_k3_m4_remoteproc.c  | 13 ++--
>  drivers/remoteproc/ti_k3_r5_remoteproc.c  | 40 ++++------
>  drivers/remoteproc/ti_sci_dev.h           | 89 +++++++++++++++++++++++
>  6 files changed, 127 insertions(+), 49 deletions(-)
>  create mode 100644 drivers/remoteproc/ti_sci_dev.h
> 
> -- 
> 2.55.0
> 
