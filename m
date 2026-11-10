Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313432;
	b=OsoIprJi1lNWmcIVX0wpaBWHE90CtpWCdwya12TNyce61PVxRy8FuIUclr0twWvb140D
	 bRmc/KN1A9iShKfOotaxWdIRRb74oOncROiPooYeQlDwNHXvfUwybCXmPdk62T4s5/PBh
	 XYPHnOcFm8XBIk/IkHbFbnzBJFEhVBPx03Rw54Z4K8LQ8B3ZaEGS9GPNPKYEEigiCwc14
	 YKCVa9o/L/0dYbUvCzEyTBfwQyPcPQtC4OCbsPtz4VqHFflFDmGcmAR7uiVNXFlmOKXA4
	 gI7xNlViT/TuK5b9cB2mPfQ/8EsuHWFfLARqTpuPtX4Uvp25u/9IaT0Lfa4vsfLY4KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313432;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CSgKi+aMTYN0njuIxn8oWEHOLjbkmau8+4SbC4HMNdA=;
	b=hfIx39G5n7poXf867sfPaJTRCZ+gCj605XUy7trX6uI/ph6zBDw/3wD8UimO/xTsIO8Q
	 IE8DfC7F/ndh5mRvWqTAeCPN5Drg+PXMb7C+jZ9hI8qddXsbkdEsAazfv+UfaUd/m/44S
	 2v+0pUCCIqLAFE4HSID+f7xLWXJohZ89zDX8kzMpNE15TUtTFnvxWBIRDnk9zErzXHh/W
	 v4iavcW1Ae97tLohwA+4/CZ+IBv1AU0hHIVHxB2MV/v03P3pRSLz9TjI4+MlCTNnkhvlx
	 cYlTjkvhubDMFDFt2aKiqJt6QfYb4F7BOyVFbBNiQSnGPOAJqFQowkLFK8/XbYNaw9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bG3tvmBH;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="Em7/ppie";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42AF606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42AF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bG3tvmBH;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Em7/ppie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794313429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSgKi+aMTYN0njuIxn8oWEHOLjbkmau8+4SbC4HMNdA=;
	b=bG3tvmBHO8Y56aVlDmOPuprhxC5OdNA8ULlkrEYpT/+YZ0YRv7erpF5KjmbjTi87gk0TSj
	eSd2ZanuKf/lHDxDR7w5eeoNkWqF1G65Nx4nuTPPbSCPauUmx2gjHpJrAnMzIjKROdLBn8
	nAMKbNRhwk2/A79DVglvloqbJ/KFUrg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-BdAkLKYdNuOfMG5MspmtLQ-1; Tue, 10 Nov 2026 07:23:48 -0500
X-MC-Unique: BdAkLKYdNuOfMG5MspmtLQ-1
X-Mimecast-MFC-AGG-ID: BdAkLKYdNuOfMG5MspmtLQ_1794313427
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-49337a224a8so1815136f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794313427; x=1794918227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CSgKi+aMTYN0njuIxn8oWEHOLjbkmau8+4SbC4HMNdA=;
        b=Em7/ppieeAIq6SLGwF1mbmxLy7OAcsY6mHMstyHsjigreWbu+ZM4IY5qpip8ik4jLy
         A+ooDd4b64TPrOH4W9INarE2951MPC8Ovf4KbM7343K1PLl+q/xVVhumZNDpv+GFh4cO
         SUKCQckw6j8uMuy4KWRrLYjjjDyQKoE5zzdm4NQQlDOTlgoVSbjDYh31aakn3QCCQQ/U
         LNnrhn5d7qAsKZPndbLFUfzP/GRNQG6qzNZtovAXdoJKrs93E+wMfcW9BDi7/FlR+xzO
         qSbtOHsDrPrEpYS5DLxpbmPRn3Ry/omPMwtN9v5lx9z4btt2pKUpovQGdKnTjBa+NS/I
         JQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313427; x=1794918227;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSgKi+aMTYN0njuIxn8oWEHOLjbkmau8+4SbC4HMNdA=;
        b=2ENoiOWFXbWuBwTpCXUNp3VasnZ7kynI6e0IwXqMnaTdHgt3NLU0RQwRmeu+tHDqwb
         5CJDXasLAOcnmaSy5WixK8VlmMxjWZrLxbJK+PRPhXw6gSPfV7jekgwzUdnR/6Dz3BGC
         ruAf/IQnR+qjfItY4xZxFE5Jt+xuwN8sjoAlojL0ymb3bwaLZNi8SSJhYIOX9lGDCYHa
         dbPQR7MEusrW+IuBZjB/hWVK6jfwdLVF/3bU8bUfseCLaYsNm0YdKhoxSQWHC0R6La/r
         xbFh7BibbkjtPfTKlfVnSH7A+Ql43KuTnuwhR3oHeZcTr7CIbg+Y3E8Wz1zQaRsYvwqB
         n8vQ==
X-Forwarded-Encrypted: i=1; AL+hErGfNCQCCXbv1QEijYav33ZGPTUp2soiXk/MGGXjPiFWZzO3Q9SFf9bb56/cxXUP4Ug9//sEgRaplPXolDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ENBrCGymJ34RDKOG/qnvcsJjH7AM9588p2YPR4c1XDoRfpP4y
	ooBZaTaXT20/fsW0ulBWeDaBC4umK2XrGMxhP/DYzf4bvIIfip+ITqe/IuSDCTEmGV8Jn7IckkJ
	NOkLAzFCe0KAA9vvMrJE8F8VD2sMmrr4t0hb6oZ0H4u6zQlu4w5ssWuu5hlwBWVklKw==
X-Gm-Gg: AYBFou2LikwHxZOgiQjrLcYDBxeA2y10y8n8teAXGD9pm+G1bHh/f3uq+h0lov8YFig
	q0HIQqQu/lQJDRdpGfagGB0Alb4pSqRX0LHNMxJdEKqx/GwjOuQmALoRgkXEkXyGzaTf6NupWmG
	7ABTi0Uv+478mcu6bLiNZrojJmMrfgCy2+8PhjKGGfJoLg2SbwypANtDarGPz9sbTx5ocqnioQA
	r/2muVg8V1t3Dnl07aakcaCMiAntikoviSRrwSLxzrf7Yug+qBHAbIONG6aF5hEdbtIMHndRhHf
	GTTO4qDO7Iuxs1C2Uwypb8Ds1LBiTsqhtffNSWt5LkeoqJUgpm2WGAAH+4r8+Atgpse5wuyXKiN
	XhUsvLB3gUCiepHYS0Giy3v1EZkBGgiQyHm0=
X-Received: by 2002:a05:6000:611:b0:498:38b3:55a1 with SMTP id ffacd0b85a97d-49838b355aamr4136335f8f.15.1794313427044;
        Tue, 10 Nov 2026 04:23:47 -0800 (PST)
X-Received: by 2002:a05:6000:611:b0:498:38b3:55a1 with SMTP id ffacd0b85a97d-49838b355aamr4136279f8f.15.1794313426580;
        Tue, 10 Nov 2026 04:23:46 -0800 (PST)
Received: from [10.43.3.161] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm4836441f8f.46.2026.11.10.04.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:23:45 -0800 (PST)
Message-ID: <d4b6e270-044b-4181-a3a9-fd906980b0ed@redhat.com>
Date: Tue, 10 Nov 2026 13:23:44 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 04/10] dpll: take domain locks around driver
 callbacks
Content-Language: en-US
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
References: <20261106121005.1327603-1-ivecera@redhat.com>
 <20261106121005.1327603-5-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261106121005.1327603-5-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:09 PM, Ivan Vecera wrote:
> Hold the domain lock of the addressed object wherever driver callbacks can
> run:
> 
> - netlink requests addressing a device or a pin, from pre_doit to post_doit
> - dumps, for each object
> - notifications, while the message is being built and sent
> 
> Callbacks of a device run under the domain of the device. Callbacks of a
> pin run under the domain of the pin, also when another driver registered
> the pin with its dpll or under its parent pin. All callbacks a message
> about a pin needs are thus covered by one lock, and only one domain lock
> is ever held. Domains have no lock order, so registrations can connect
> them in any way.
> 
> A request is atomic against other requests addressing objects of that
> domain, and messages of one object are sent in the order they were built.
> 
> Requests resolving an id run no callbacks, so they do not take the lock.
> 
> __dpll_{device,pin}_change_ntf() now also require the domain lock of the
> object. A callback can therefore only notify objects of the domain it runs
> under.
> 
> Callbacks stay serialized by dpll_lock for now.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/dpll_core.c    | 18 +++++----
>   drivers/dpll/dpll_core.h    |  6 ++-
>   drivers/dpll/dpll_netlink.c | 78 ++++++++++++++++++++++++++++---------
>   3 files changed, 76 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
> index d39c4905172f2d..dd09f528170994 100644
> --- a/drivers/dpll/dpll_core.c
> +++ b/drivers/dpll/dpll_core.c
> @@ -520,7 +520,7 @@ dpll_device_registration_find(struct dpll_device *dpll,
>    *
>    * Make dpll device available for user space.
>    *
> - * Context: Acquires a lock (dpll_lock)
> + * Context: Acquires dpll_lock and the domain lock of @dpll
>    * Return:
>    * * 0 on success
>    * * negative - error value
> @@ -579,7 +579,7 @@ EXPORT_SYMBOL_GPL(dpll_device_register);
>    *
>    * Unregister device, make it unavailable for userspace.
>    * Note: It does not free the memory
> - * Context: Acquires a lock (dpll_lock)
> + * Context: Acquires dpll_lock and the domain lock of @dpll
>    */
>   void dpll_device_unregister(struct dpll_device *dpll,
>   			    const struct dpll_device_ops *ops, void *priv)
> @@ -928,7 +928,7 @@ __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
>    * @ops: ops for a dpll pin ops
>    * @priv: pointer to private information of owner
>    *
> - * Context: Acquires a lock (dpll_lock)
> + * Context: Acquires dpll_lock and domain locks
>    * Return:
>    * * 0 on success
>    * * negative - error value
> @@ -989,7 +989,9 @@ static void dpll_pin_ref_sync_pair_del(u32 ref_sync_pin_id)
>   		ref_sync_pin = xa_load(&pin->ref_sync_pins, ref_sync_pin_id);
>   		if (ref_sync_pin) {
>   			xa_erase(&pin->ref_sync_pins, ref_sync_pin_id);
> +			mutex_lock(&pin->domain->lock);
>   			__dpll_pin_change_ntf(pin);
> +			mutex_unlock(&pin->domain->lock);
>   		}
>   	}
>   }
> @@ -1016,7 +1018,7 @@ __dpll_pin_unregister(struct dpll_device *dpll, struct dpll_pin *pin,
>    * @priv: pointer to private information of owner
>    *
>    * Note: It does not free the memory
> - * Context: Acquires a lock (dpll_lock)
> + * Context: Acquires dpll_lock and domain locks
>    */
>   void dpll_pin_unregister(struct dpll_device *dpll, struct dpll_pin *pin,
>   			 const struct dpll_pin_ops *ops, void *priv)
> @@ -1042,7 +1044,7 @@ EXPORT_SYMBOL_GPL(dpll_pin_unregister);
>    * Register a pin with a parent pin, create references between them and
>    * between newly registered pin and dplls connected with a parent pin.
>    *
> - * Context: Acquires a lock (dpll_lock)
> + * Context: Acquires dpll_lock and domain locks
>    * Return:
>    * * 0 on success
>    * * negative - error value
> @@ -1099,7 +1101,7 @@ EXPORT_SYMBOL_GPL(dpll_pin_on_pin_register);
>    * @ops: ops for a dpll pin
>    * @priv: pointer to private information of owner
>    *
> - * Context: Acquires a lock (dpll_lock)
> + * Context: Acquires dpll_lock and domain locks
>    * Note: It does not free the memory
>    */
>   void dpll_pin_on_pin_unregister(struct dpll_pin *parent, struct dpll_pin *pin,
> @@ -1129,7 +1131,7 @@ EXPORT_SYMBOL_GPL(dpll_pin_on_pin_unregister);
>    *
>    * Once pins are paired, the user-space configuration of reference sync pair
>    * is possible.
> - * Context: Acquires a lock (dpll_lock)
> + * Context: Acquires dpll_lock and domain locks
>    * Return:
>    * * 0 on success
>    * * negative - error value
> @@ -1142,7 +1144,9 @@ int dpll_pin_ref_sync_pair_add(struct dpll_pin *pin,
>   	mutex_lock(&dpll_lock);
>   	ret = xa_insert(&pin->ref_sync_pins, ref_sync_pin->id,
>   			ref_sync_pin, GFP_KERNEL);
> +	mutex_lock(&pin->domain->lock);
>   	__dpll_pin_change_ntf(pin);
> +	mutex_unlock(&pin->domain->lock);
>   	mutex_unlock(&dpll_lock);
>   
>   	return ret;
> diff --git a/drivers/dpll/dpll_core.h b/drivers/dpll/dpll_core.h
> index 6705e81bc11de9..630c5a1ca572c2 100644
> --- a/drivers/dpll/dpll_core.h
> +++ b/drivers/dpll/dpll_core.h
> @@ -22,10 +22,14 @@
>    * @clock_id:		clock_id of the objects in the domain
>    * @module:		module of the objects in the domain
>    * @refcount:		number of dpll devices and pins in the domain
> - * @lock:		lock of the domain
> + * @lock:		serializes driver callbacks of the domain
>    *
>    * All dpll devices and pins created with the same (module, clock_id) pair
>    * belong to one domain, in practice to one chip or card.
> + *
> + * Callbacks of a device run under the domain of the device and callbacks of a
> + * pin under the domain of the pin, whichever driver registered them. Only one
> + * domain lock is held at a time, so domains have no lock order.
>    **/
>   struct dpll_domain {
>   	u32 id;
> diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
> index e5380d95f238b3..1b4e3a0166a744 100644
> --- a/drivers/dpll/dpll_netlink.c
> +++ b/drivers/dpll/dpll_netlink.c
> @@ -861,27 +861,39 @@ dpll_device_event_send(enum dpll_cmd event, struct dpll_device *dpll)
>   
>   int dpll_device_create_ntf(struct dpll_device *dpll)
>   {
> +	int ret;
> +
> +	mutex_lock(&dpll->domain->lock);
>   	dpll_device_notify(dpll, DPLL_DEVICE_CREATED);
> -	return dpll_device_event_send(DPLL_CMD_DEVICE_CREATE_NTF, dpll);
> +	ret = dpll_device_event_send(DPLL_CMD_DEVICE_CREATE_NTF, dpll);
> +	mutex_unlock(&dpll->domain->lock);
> +
> +	return ret;
>   }
>   
>   int dpll_device_delete_ntf(struct dpll_device *dpll)
>   {
> +	int ret;
> +
> +	mutex_lock(&dpll->domain->lock);
>   	dpll_device_notify(dpll, DPLL_DEVICE_DELETED);
> -	return dpll_device_event_send(DPLL_CMD_DEVICE_DELETE_NTF, dpll);
> +	ret = dpll_device_event_send(DPLL_CMD_DEVICE_DELETE_NTF, dpll);
> +	mutex_unlock(&dpll->domain->lock);
> +
> +	return ret;
>   }
>   
>   /**
>    * __dpll_device_change_ntf - notify that the dpll device has been changed
>    * @dpll: registered dpll pointer
>    *
> - * Context: caller must hold dpll_lock. Suitable for use inside device
> - *          callbacks which are already invoked under dpll_lock.
> + * Context: caller must hold dpll_lock and the domain lock of @dpll.
> + *          Suitable for use inside callbacks running under these locks.
>    * Return: 0 if succeeds, error code otherwise.
>    */
>   int __dpll_device_change_ntf(struct dpll_device *dpll)
>   {
> -	lockdep_assert_held(&dpll_lock);
> +	lockdep_assert_held(&dpll->domain->lock);
>   	dpll_device_notify(dpll, DPLL_DEVICE_CHANGED);
>   	return dpll_device_event_send(DPLL_CMD_DEVICE_CHANGE_NTF, dpll);
>   }
> @@ -891,7 +903,7 @@ EXPORT_SYMBOL_GPL(__dpll_device_change_ntf);
>    * dpll_device_change_ntf - notify that the dpll device has been changed
>    * @dpll: registered dpll pointer
>    *
> - * Context: acquires and holds a dpll_lock.
> + * Context: acquires and holds dpll_lock and the domain lock of @dpll.
>    * Return: 0 if succeeds, error code otherwise.
>    */
>   int dpll_device_change_ntf(struct dpll_device *dpll)
> @@ -899,7 +911,9 @@ int dpll_device_change_ntf(struct dpll_device *dpll)
>   	int ret;
>   
>   	mutex_lock(&dpll_lock);
> +	mutex_lock(&dpll->domain->lock);
>   	ret = __dpll_device_change_ntf(dpll);
> +	mutex_unlock(&dpll->domain->lock);
>   	mutex_unlock(&dpll_lock);
>   
>   	return ret;
> @@ -941,27 +955,39 @@ dpll_pin_event_send(enum dpll_cmd event, struct dpll_pin *pin)
>   
>   int dpll_pin_create_ntf(struct dpll_pin *pin, u64 src_clock_id)
>   {
> +	int ret;
> +
> +	mutex_lock(&pin->domain->lock);
>   	dpll_pin_notify(pin, src_clock_id, DPLL_PIN_CREATED);
> -	return dpll_pin_event_send(DPLL_CMD_PIN_CREATE_NTF, pin);
> +	ret = dpll_pin_event_send(DPLL_CMD_PIN_CREATE_NTF, pin);
> +	mutex_unlock(&pin->domain->lock);
> +
> +	return ret;
>   }
>   
>   int dpll_pin_delete_ntf(struct dpll_pin *pin, u64 src_clock_id)
>   {
> +	int ret;
> +
> +	mutex_lock(&pin->domain->lock);
>   	dpll_pin_notify(pin, src_clock_id, DPLL_PIN_DELETED);
> -	return dpll_pin_event_send(DPLL_CMD_PIN_DELETE_NTF, pin);
> +	ret = dpll_pin_event_send(DPLL_CMD_PIN_DELETE_NTF, pin);
> +	mutex_unlock(&pin->domain->lock);
> +
> +	return ret;
>   }
>   
>   /**
>    * __dpll_pin_change_ntf - notify that the pin has been changed
>    * @pin: registered pin pointer
>    *
> - * Context: caller must hold dpll_lock. Suitable for use inside pin
> - *          callbacks which are already invoked under dpll_lock.
> + * Context: caller must hold dpll_lock and the domain lock of @pin.
> + *          Suitable for use inside callbacks running under these locks.
>    * Return: 0 if succeeds, error code otherwise.
>    */
>   int __dpll_pin_change_ntf(struct dpll_pin *pin)
>   {
> -	lockdep_assert_held(&dpll_lock);
> +	lockdep_assert_held(&pin->domain->lock);
>   	dpll_pin_notify(pin, pin->clock_id, DPLL_PIN_CHANGED);
>   	return dpll_pin_event_send(DPLL_CMD_PIN_CHANGE_NTF, pin);
>   }
> @@ -971,7 +997,7 @@ EXPORT_SYMBOL_GPL(__dpll_pin_change_ntf);
>    * dpll_pin_change_ntf - notify that the pin has been changed
>    * @pin: registered pin pointer
>    *
> - * Context: acquires and holds a dpll_lock.
> + * Context: acquires and holds dpll_lock and the domain lock of @pin.
>    * Return: 0 if succeeds, error code otherwise.
>    */
>   int dpll_pin_change_ntf(struct dpll_pin *pin)
> @@ -979,7 +1005,9 @@ int dpll_pin_change_ntf(struct dpll_pin *pin)
>   	int ret;
>   
>   	mutex_lock(&dpll_lock);
> +	mutex_lock(&pin->domain->lock);
>   	ret = __dpll_pin_change_ntf(pin);
> +	mutex_unlock(&pin->domain->lock);
>   	mutex_unlock(&dpll_lock);
>   
>   	return ret;
> @@ -1780,7 +1808,9 @@ int dpll_nl_pin_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
>   			ret = -EMSGSIZE;
>   			break;
>   		}
> +		mutex_lock(&pin->domain->lock);
>   		ret = dpll_cmd_pin_get_one(skb, pin, cb->extack);
> +		mutex_unlock(&pin->domain->lock);
>   		if (ret) {
>   			genlmsg_cancel(skb, hdr);
>   			if (ret == -ENODEV) {
> @@ -1999,7 +2029,9 @@ int dpll_nl_device_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
>   			ret = -EMSGSIZE;
>   			break;
>   		}
> +		mutex_lock(&dpll->domain->lock);
>   		ret = dpll_device_get_one(dpll, skb, cb->extack);
> +		mutex_unlock(&dpll->domain->lock);
>   		if (ret) {
>   			genlmsg_cancel(skb, hdr);
>   			break;
> @@ -2018,6 +2050,7 @@ int dpll_nl_device_get_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
>   int dpll_pre_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
>   		  struct genl_info *info)
>   {
> +	struct dpll_device *dpll;
>   	u32 id;
>   
>   	if (GENL_REQ_ATTR_CHECK(info, DPLL_A_ID))
> @@ -2025,11 +2058,13 @@ int dpll_pre_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
>   
>   	mutex_lock(&dpll_lock);
>   	id = nla_get_u32(info->attrs[DPLL_A_ID]);
> -	info->user_ptr[0] = dpll_device_get_by_id(id);
> -	if (!info->user_ptr[0]) {
> +	dpll = dpll_device_get_by_id(id);
> +	if (!dpll) {
>   		NL_SET_ERR_MSG(info->extack, "device not found");
>   		goto unlock;
>   	}
> +	info->user_ptr[0] = dpll;
> +	mutex_lock(&dpll->domain->lock);
>   	return 0;
>   unlock:
>   	mutex_unlock(&dpll_lock);
> @@ -2039,6 +2074,9 @@ int dpll_pre_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
>   void dpll_post_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
>   		    struct genl_info *info)
>   {
> +	struct dpll_device *dpll = info->user_ptr[0];
> +
> +	mutex_unlock(&dpll->domain->lock);
>   	mutex_unlock(&dpll_lock);
>   }
>   
> @@ -2061,6 +2099,7 @@ dpll_unlock_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
>   int dpll_pin_pre_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
>   		      struct genl_info *info)
>   {
> +	struct dpll_pin *pin;
>   	int ret;
>   
>   	mutex_lock(&dpll_lock);
> @@ -2068,14 +2107,14 @@ int dpll_pin_pre_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
>   		ret = -EINVAL;
>   		goto unlock_dev;
>   	}
> -	info->user_ptr[0] = xa_load(&dpll_pin_xa,
> -				    nla_get_u32(info->attrs[DPLL_A_PIN_ID]));
> -	if (!info->user_ptr[0] ||
> -	    !dpll_pin_available(info->user_ptr[0])) {
> +	pin = xa_load(&dpll_pin_xa, nla_get_u32(info->attrs[DPLL_A_PIN_ID]));
> +	if (!pin || !dpll_pin_available(pin)) {
>   		NL_SET_ERR_MSG(info->extack, "pin not found");
>   		ret = -ENODEV;
>   		goto unlock_dev;
>   	}
> +	info->user_ptr[0] = pin;
> +	mutex_lock(&pin->domain->lock);
>   
>   	return 0;
>   
> @@ -2087,5 +2126,8 @@ int dpll_pin_pre_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
>   void dpll_pin_post_doit(const struct genl_split_ops *ops, struct sk_buff *skb,
>   			struct genl_info *info)
>   {
> +	struct dpll_pin *pin = info->user_ptr[0];
> +
> +	mutex_unlock(&pin->domain->lock);
>   	mutex_unlock(&dpll_lock);
>   }

Reviewed-by: Petr Oros <poros@redhat.com>

