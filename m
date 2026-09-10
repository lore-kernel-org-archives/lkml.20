Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3117B3DDDDE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032087; cv=none; b=cOJCO6+iKAGC0HUMykEPXyUFF+i244NZMXsJ7ocldzDXjbwXqfXLsZpWnj3rzrrIIFnvQl1WaYBvssC4E19r6VcpHmaWG/O/TTBRgP2Tsx+7qtjaG/xGSvs16Q0DPeIeSxlCreaCg5hISlbRahjEkCfrlsgXOvexsnqGjhpzihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032087; c=relaxed/simple;
	bh=RGqXXGSwXhjsMD88DEwbjnX3i5ywJ/XDcVssiguJaaU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VbdjJfELaBD9nGdnavd5gkeQGBpSOAIRsQ2XEyEyoiHje31V+cbBqhHrQr7Izl9yzjlJEMfwSDTNPTnogiI3gzYjkSATLr0XgADs9xrd8SNEM6wp1FIM01R91gWBnDaxSlVKi4PuKIXmwHE/5VsTp12uwmAWGPqfW18vvXgLS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EM79IyR8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EM79IyR8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F601F00893;
	Thu, 10 Sep 2026 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032085;
	bh=RGqXXGSwXhjsMD88DEwbjnX3i5ywJ/XDcVssiguJaaU=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=EM79IyR8mF//eCB+qEW3gt6VcUTFeO9heW4KFNfDxQtLOx7H+8w4Lf8+EDsUkyHn6
	 0lk+89wsu8DLQzuvXWLvrnaVTc7kZbAqhtYOoVCcNggU/Qicaadwf9ueDUpqLNtulQ
	 lSl/S/GeEH8PHr0tOrl/rFS6eT662TVsdzVQTraCu8/EOrHwQaRWo/ZfFnt+jie+ry
	 7LemhGSzlqXiQcXQY/e1aZScHs+azxH0HPgTcEgqHRSKu50FlLDDxS0tw+SedAOaxn
	 jrS3IYpqC8f+GzwgmijDgZLRybgJqzbNyo8BI5K3RTs+JR5lDKYsFYomS/6aGgN3k3
	 fYmrQaEZIanvA==
Date: Thu, 10 Sep 2026 14:51:21 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Andrew Davis <afd@ti.com>, Jens Wiklander <jenswi@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tee: move tee_ioctl_shm_register_data to above IOCTL
 definition
Message-ID: <aqJ2kXdcapQI-RCQ@sumit-xelite>
Mail-Followup-To: Andrew Davis <afd@ti.com>,
	Jens Wiklander <jenswi@kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20260903175730.1909952-1-afd@ti.com>
 <aqJ0yCHd03ZLsSMT@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aqJ0yCHd03ZLsSMT@sumit-xelite>

On Thu, 10 Sep 2026 at 14:43:44 +0530, Sumit Garg via OP-TEE wrote:
>On Thu, 03 Sep 2026 at 12:57:30 -0500, Andrew Davis via OP-TEE wrote:
>>Most of the struct definitions for a given IOCTL definition immediately
>>preceded that definition. The struct tee_ioctl_shm_register_data is an
>>exception as it is placed above the TEE_IOC_SHM_REGISTER_FD definition,
>>not the TEE_IOC_SHM_REGISTER one it is to be used with. Move it down
>>to match the others.
>>
>>This is a non-functional change for consistency and to help prevent
>>someone from accidentally using the wrong struct with the wrong IOCTL
>>based on the struct's location.
>>
>>Fix a couple small spelling issues while here.
>>
>>Signed-off-by: Andrew Davis <afd@ti.com>
>>---
>>include/uapi/linux/tee.h | 40 ++++++++++++++++++++--------------------
>>1 file changed, 20 insertions(+), 20 deletions(-)
>>
>
>Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
>-Sumit

Andrew,

Please check your get_maintainers script, it's too old to pick up wrong
maintainer's email ID. I have updated it now.

-Sumit
