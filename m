Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB50A391E58;
	Tue,  8 Sep 2026 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852174; cv=none; b=q+j1OMrLzOg8KsFas6HavBUF/uf0c4e+Ik2NhRItKyYwul3l2tyDUp0+vyQla5GBfDYXmJ+jXglnZQiCjsOYATnj89TUBukGfZKmttuipm7wjwNenXOMEf8L/g6lG1Xom6k1ejOiM10ixDdJUDUmdb6JHgGv5IIR5x1SFDCLBso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852174; c=relaxed/simple;
	bh=+4Uu9UEcxeOsHBEBCgcDtRZbr14P5InKdafDY9BK1j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlAy+76IPTZdpJupDyNNi6bSa2skXuIK3SxZ0TeiMiV4b7ggWeNA+Ui7KAWhB/zMZBbkedHRl8pcVTT3zuPFOTsotZf56GtTeZHnPlXoVWYo9u3Y7FLAWYi0fJUPhs9axP0jAWLDQJ4PaI/mS+D0/7VdeLMSXv/BBYBdjlHOfI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B+1q3Mis; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B+1q3Mis"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2037AC2D;
	Tue,  8 Sep 2026 09:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788852075;
	bh=+4Uu9UEcxeOsHBEBCgcDtRZbr14P5InKdafDY9BK1j8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B+1q3MisJ2fW9TID7dRHOjnrEaKLJzcbiJ4EuqhQNnSEBwdNCNe6AciO4pVB+P6ib
	 i/c09ODcxgyJ7wtYuSo5+vS7OBdCXtekWl00Qk0dCOOzIipPM8Yllbf+/EitYYksb5
	 I0ReGNeXShESMfm2taw6B0Yzwhz/1KhRpdbvYGQ0=
Message-ID: <c0694ac5-cd29-432d-8d7f-f4363ac4d2d9@ideasonboard.com>
Date: Tue, 8 Sep 2026 10:22:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Mark Brown <broonie@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <apbbvQSfUbzYRFaw@sirena.org.uk>
 <3076b44f-b499-42cc-92cf-f4a7a470fb2f@sirena.org.uk>
 <72674692-9c3e-4f7b-a3d0-00df85ef938f@ideasonboard.com>
 <c25601c4-1b82-4565-ac85-53496c2ef794@sirena.org.uk>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <c25601c4-1b82-4565-ac85-53496c2ef794@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/09/2026 17:08, Mark Brown wrote:
> On Mon, Sep 07, 2026 at 05:03:22PM +0300, Tomi Valkeinen wrote:
>> On 07/09/2026 17:01, Mark Brown wrote:
> 
>>> This issue is still present today.
> 
>> I have sent "[PATCH] ASoC: ti: omap-hdmi: Fix build error from a merge
>> commit" (20260903-omap-hdmi-fix-v1-1-b0447a1d35d5@ideasonboard.com). Waiting
>> for a R-b so I can push it via drm-misc.
> 
> I saw that, it is probably worth looking into what's going on with the
> process here if what should be a relatively simple build failure fix is
> taking this long to get integrated.

I have pushed 836a0bb73c17 to drm-misc-next.

  Tomi

