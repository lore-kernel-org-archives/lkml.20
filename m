Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313550;
	b=mGTl9VBlJqD4M9+DUPWN+sLjuYNTP+GVdU/f4q3WHVfqmGxFeBn/k6UZWB9OXmKOwF2a
	 NI8ne0JDr9qiHv+pEArSLuAbWPvayGoZswRqn66XHan/E6vNJJKQazsFcyFV7nGBVM+tX
	 A9fC88BePvBVNYXs3XWsuv1wYeORRBULPHHYNSubvCYwaWMktRM3JTy8UoBx/18FcctOn
	 +UYjLuz6DMNVQeDcevTIl3nX3visuX/yVUMupEgQYb+ehr5mJo5a97npOLZ9pYBOftCSq
	 MrG/WgE+WcKFJ1q7zxTpu3hgej1pEwId1tH7/r2wOVcPghfPh6NPpk/FUhzKYWG2N+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313550;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2z9Dq46PGzc1DYcTmA3bznslu78oudIXu01vR14qyUQ=;
	b=EjaejKfZIgJcsE9IvgiW/C8ifjCxCIbSqn1omrjYeEq38fva8Qk5zTf1qJIbWyQQnsq9
	 mBMqcab2irYj7Ably6t0WkbU3C+8ZweP+dXQiWAQ0IsQq3tjujYed6pyR47EdWnlYIYFy
	 fEB7/Cjv+7q14WXHYRBDpnVtEKMk8PDPKcMDf6XVSHg1/cvTfFw+YrejWNc9cisfM1f7E
	 ZNf/XxIe4LAIWLZ0g019c3GPHzIlcJtgKl2w10ndipPrzcP+VrQunqkijgZXWoZ/38E7t
	 GO9fpQypCYB0InjyFwIysmeQfvNcsGT6860Iu/7FfY6pnv2X6s5DBdJHIqStg7GR6TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hIBLyuSZ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfeKsHM6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E22606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E22606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hIBLyuSZ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AfeKsHM6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794313548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2z9Dq46PGzc1DYcTmA3bznslu78oudIXu01vR14qyUQ=;
	b=hIBLyuSZmBPf+Pv0AGd16NxIq9NSp5f9bxJSyqqxB7dF5aqZvBOI7MyQ0LugBpBe7KQdrE
	KtBWoeRukKyIMEdFYMCzUL3S4EeeQgSYh6Snr56D2XTjZLSPyVChQ4RfYKZyFNAclX9+5x
	Z5peaTxvr4U5iv0DXtohphJhUBq21i0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-WvGTSaSCPjaAOhORLR_Bmg-1; Tue, 10 Nov 2026 07:25:46 -0500
X-MC-Unique: WvGTSaSCPjaAOhORLR_Bmg-1
X-Mimecast-MFC-AGG-ID: WvGTSaSCPjaAOhORLR_Bmg_1794313546
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48fbcf023dcso1189839f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794313545; x=1794918345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2z9Dq46PGzc1DYcTmA3bznslu78oudIXu01vR14qyUQ=;
        b=AfeKsHM6C8MWJB45WMqPOmdAOipH1qlYxyu7+E3KKQXo8Wm7dSwjUfdntfy8cvUDaS
         bYIHd1LV6S2glpKy8TpYZJmUOfyHCv/HCfDc/RocUXtyTP91ZRqaAEVZuXBose98x8cD
         LCywM8hz0dOjX4qQJv3Lur07xIkvxMSzFNq+sBPS0645NZ4jSdQyu6UhqerhZFf9vUKo
         lV75BZjMvtX0se34MTeSbmeEmqODKkHAbsS4Hywwo+S2PmU6MqekKqn4yYbaJOEvCGqG
         7wk4Ee79ez8h+oaUfRuejOftkwdBtBBDb5TCkqoLXUVt3Y7m9D6UWpItVSG40LKWn3Yq
         EByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313545; x=1794918345;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2z9Dq46PGzc1DYcTmA3bznslu78oudIXu01vR14qyUQ=;
        b=SIHJwhNG3Fy60fPomY42g2Fr59sSiEMk/L1a4NCmmUmaKcwu/wGjO3UxmBut6YpaOE
         C/PYHU/HBz386L2Cv98idjkf32C/p5hdhYEHC2poKeBCEn6Eujl58WFz4sboensSlu7p
         ADm1t1TmYfJDpqG735wAAG+uNJ8Nb/D9XMoArTpNzM+qNo+QMvkDfyALNBu+MQQd4OH9
         zA3h8vIX4jOy4gb8glNv7bOpN61P2swaQT9AsCwkG6s5Wbaw+TBhm43G3H8ojnV0UxTQ
         umMCkkB1EhMNqRsudb+ORWskRAH1MhTr0TshpmWuCre/3G5pA41FPNla+marpUIYsfFd
         ijzQ==
X-Forwarded-Encrypted: i=1; AL+hErH1FYCFacG/G9AkSFQ4FGya4RqXlz9ERczUbTM0/4IyppABvpyLd7HnnBu+No2pbTHw7Lq+8cSUruay4oU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MmWzBSc/7u2R7KzxaDfaSspsvHOhLWfhLzlQShkGXD5WmryAJ
	lxOxXN6au9TcyC+3uQBc3mdCrZufcKh4AKS5oGKOCRh7FVgKnKjrTf2572ZUbptaswd3Ka3kUz+
	Gwq8byY0QFOZlsh57WR1o6vxZICNqvd5dN/Dom/gOo79OAxC62nPxuA/O66LMuBHtnA==
X-Gm-Gg: AYBFou3LYvyIU824C6wjXK02n9SYFAZsa+3ZPQCWOsNISGVLnQL/ZXdCQ2PMHlVxMVF
	pVv0/J2Vp0E3dUry/h1QnrLa9ZCjgnnr1G5CGZuPWWqjcd+UqvP8KI0hNMreOXmtqyhFfxzlZc1
	gHoQXWPbLotFrq7uVHfb6Tu1X2h2U/MZ8KaKTEHg492CfnVfwbU3Gl9XOK0Fp/1s+vbEU5CAvaj
	g6kF8n1m5ABQWVqlfPJtkgshmY1uWpZzQWolpImasBdxPtkmWYiS9NcWtYn5bUUuvlHc2MepyXI
	GdvwqtNcYoT1UnK/7g5X7QV1xb7tMymp0WAArjf4TY59LSPRweDTlJrhbhhX6KD/4W20w0nIdI/
	/EHkET4hauz7aHRXhHT6kKEW7H1N7QriNZws=
X-Received: by 2002:a05:6000:29d2:b0:498:88f:14c8 with SMTP id ffacd0b85a97d-4982fb52546mr2653572f8f.9.1794313545516;
        Tue, 10 Nov 2026 04:25:45 -0800 (PST)
X-Received: by 2002:a05:6000:29d2:b0:498:88f:14c8 with SMTP id ffacd0b85a97d-4982fb52546mr2653511f8f.9.1794313545005;
        Tue, 10 Nov 2026 04:25:45 -0800 (PST)
Received: from [10.43.3.161] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4989a2a505asm3264342f8f.13.2026.11.10.04.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:25:43 -0800 (PST)
Message-ID: <f73146cb-fcbb-4263-90d9-b5378faf30f7@redhat.com>
Date: Tue, 10 Nov 2026 13:25:41 +0100
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
Subject: Re: [PATCH net-next 10/10] dpll: document locking rules
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
 <20261106121005.1327603-11-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261106121005.1327603-11-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:10 PM, Ivan Vecera wrote:
> Describe the lock levels of the subsystem, which domain a callback runs
> under and the rules device drivers have to follow.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   Documentation/driver-api/dpll.rst | 44 +++++++++++++++++++++++++++++++
>   drivers/dpll/dpll_core.c          |  9 +++++++
>   2 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
> index 7c117ae37cc1bc..40d5037ff3bb0f 100644
> --- a/Documentation/driver-api/dpll.rst
> +++ b/Documentation/driver-api/dpll.rst
> @@ -675,6 +675,50 @@ In the error path we have to rewind every allocation in the reverse order:
>   
>   More complex example can be found in Intel's ICE driver or nVidia's mlx5 driver.
>   
> +Locking
> +=======
> +
> +The subsystem uses two levels of locks, always taken in this order:
> +
> +- ``dpll_lock`` protects the topology of dpll devices and pins and their
> +  lifetime. Functions changing the topology, for example dpll_pin_register(),
> +  take it for write and send the create and delete notifications under it.
> +  Netlink requests, each part of a dump and change notifications take it for
> +  read for their whole duration.
> +- A domain lock serializes driver callbacks. All dpll devices and pins created
> +  with the same module and ``clock_id`` belong to one domain, in practice to
> +  one chip or card.
> +
> +A netlink request addressing a device or a pin by its ID holds the domain lock
> +of that object from start to end. A notification holds it while its message is
> +built and sent, so messages of one object are sent in the order they were
> +built. Only one domain lock is held at a time, so domains have no lock order,
> +and callbacks of different domains can run concurrently.
> +
> +Callbacks of a dpll device run under the domain of the device. Callbacks of a
> +pin run under the domain of the pin, whichever driver registered them:
> +
> +- A driver registering a pin of another driver with its dpll device has these
> +  callbacks serialized with the driver that created the pin, not with the other
> +  callbacks of its device, so it has to protect the state they share by itself.
> +  A callback stuck in such a registration stops the domain of the pin.
> +- The parent pin of a pin registered with dpll_pin_on_pin_register() and its
> +  dpll devices can belong to another driver, so the callback must not
> +  dereference their private data.
> +- The frequency monitor belongs to the dpll device, so only callbacks of a pin
> +  of the same domain registered with dpll_pin_register() can include
> +  ``.measured_freq_get``.
> +
> +Device drivers have to follow these rules:
> +
> +- A callback must not call dpll_device_change_ntf(), dpll_pin_change_ntf() or
> +  any function changing the topology.
> +- A callback notifies about objects of the domain it runs under with
> +  __dpll_device_change_ntf() or __dpll_pin_change_ntf(). Other objects have to
> +  be notified from a context that holds no domain lock, for example a work item.
> +- A driver must not call dpll_device_change_ntf(), dpll_pin_change_ntf() or any
> +  function changing the topology while holding a lock that its callbacks take.
> +
>   SyncE enablement
>   ================
>   For SyncE enablement it is required to allow control over dpll device
> diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
> index 84377f8ba16036..6ad40fb9eee855 100644
> --- a/drivers/dpll/dpll_core.c
> +++ b/drivers/dpll/dpll_core.c
> @@ -932,6 +932,10 @@ __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
>    * @ops: ops for a dpll pin ops
>    * @priv: pointer to private information of owner
>    *
> + * The callbacks run under the domain of @pin. If @pin belongs to another domain
> + * than @dpll, they are not serialized with the callbacks of @dpll and @ops must
> + * not include .measured_freq_get.
> + *
>    * Context: Acquires dpll_lock and domain locks
>    * Return:
>    * * 0 on success
> @@ -1049,6 +1053,11 @@ EXPORT_SYMBOL_GPL(dpll_pin_unregister);
>    * Register a pin with a parent pin, create references between them and
>    * between newly registered pin and dplls connected with a parent pin.
>    *
> + * The callbacks run under the domain of @pin. The parent pin and its dplls can
> + * belong to another driver, so @ops must not dereference their private data.
> + * The frequency monitor belongs to a dpll, so @ops must not include
> + * .measured_freq_get.
> + *
>    * Context: Acquires dpll_lock and domain locks
>    * Return:
>    * * 0 on success
Reviewed-by: Petr Oros <poros@redhat.com>

