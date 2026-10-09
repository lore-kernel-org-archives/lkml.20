Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C7551A138
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570795; cv=pass; b=FHYZy6j+MlBkUCHoEkcu/hh30r8JqYU/ayLL1lgjbRqa/D+MTO6DS6Nr5KQzvA3oHH+TAfDfPuiWuOEK3RVwgaqZxrWEB3pwRW2lV2nbLOoamFdJ24EruTBVJbMuoGrjSFINhSEaxgvbx4JqZJwK23gLe4zWV5CMGat1XuTHpRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570795; c=relaxed/simple;
	bh=4g/6CVrwg0Lwo7LEtRCBHTh8Tr1JFDpIIq78efvE8HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9+otN8o1WiMCKVLBRnnPqfQxM0Qz49xcAJLI6l912fCffc2rqstwaELaYC2Aq7i3ITE0oSdFr3kn1UrT3aTROYmdWeeoPm3IE93sIiTJBR8qdzBfiXS2YFZT9wadFDLejdG8ckEQLZFiwFTYIM2Ul/JFFsqmHgBt7k6GVFF4N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=LXgUIK4u; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="LXgUIK4u"
ARC-Seal: i=1; a=rsa-sha256; t=1791570779; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ndIOPv8r0Hu3BFCMKBBrrCeakt4nEErRREnecNyS2TD0emNOMXOgEj3qaHSBVT4IEJBp21Yn+w/EmgPMrPhruiRUnqIL9/hrAHjKNGovL5h+frJb1Kuw+JvQglHVjnJFCtenJNm4N1PLYOmtgHR/gDBes6fKRr3f37Kvf9JBmOg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791570779; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SNDtFTIyhLZv5ilCpSSEHjpugz1pSbUUO54QyH+Q/rY=; 
	b=Lcw7CPUxK4WV5N3wsUGlD6JKtBwQyje7X88VVly6l01BnF85vQbZb+59u38fVliJi0T9dvIIHKB5WYKo2C0fQuBIWS4OjljUY1cOUhQ9E07/jq/FYlpFTDoukLP88MoockrU0mZaCv0gL2900U54iwmghOhRiy4G12CSS6uo0P8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791570779;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SNDtFTIyhLZv5ilCpSSEHjpugz1pSbUUO54QyH+Q/rY=;
	b=LXgUIK4u2x1Pvt2tgngFsxStsuP3qyLB3SAQFibqGi6n//mxCqKNKLq4EJ80Fwg9
	Vx+FozcIJVndIouC7AlWshTIBcQ1d9QZXgawV+0/6FNk5hQZIK1732BZTwIrmy0NDYo
	MFWihW3TGZEih6iQ2YEe1hkzgWOuEfBvdNQ+0CFw=
Received: by smtp.zohomail.com with SMTPS id 1791570778259984.4383563393213;
	Fri, 9 Oct 2026 11:32:58 -0700 (PDT)
Message-ID: <69e33ec9-a0bc-4d02-b20d-9c0c03236a42@collabora.com>
Date: Fri, 9 Oct 2026 21:32:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v9 3/4] drm/virtio: implement userptr resource support
To: Honglei Huang <honghuan@amd.com>, odaki@rsg.ci.i.u-tokyo.ac.jp,
 airlied@redhat.com, kraxel@redhat.com
Cc: gurchetansingh@chromium.org, olvaffe@gmail.com, Ray.Huang@amd.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260924095556.1326164-1-honghuan@amd.com>
 <20260924095556.1326164-4-honghuan@amd.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260924095556.1326164-4-honghuan@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

24.09.2026 12:55, Honglei Huang пишет:
> +static struct dma_buf *
> +virtio_gpu_userptr_prime_export(struct drm_gem_object *obj, int flags)
> +{
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static const struct drm_gem_object_funcs virtio_gpu_userptr_funcs = {
> +	.open = virtio_gpu_gem_object_open,
> +	.close = virtio_gpu_gem_object_close,
> +	.free = virtio_gpu_userptr_free,
> +	.export = virtio_gpu_userptr_prime_export,
> +};

Is virtio_gpu_userptr_prime_export() optional?

-- 
Best regards,
Dmitry
