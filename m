Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313217;
	b=boPvrAxqNbRBf6gIbni9EaU07K06b7rIOEqCEKikZ01AduwBeIRju3QtZ4l50a2cDlxC
	 fu3fkMnJuR0aMuqtNKlUGO6BMvz85zfBjJM6LeS27XeE5W6zLsr1k3Ze0hPSzawR/Ojfy
	 7TwLmke1TWMzVQoz9X+msUfPiI7vbBtHO3ZEEQxvMDFjmnnhzMh2QZSvtL4Ul2iDWR/NE
	 XprJTUHgkPf2wW0em5b438g6F3x5lKdwZmawfJ1bI/9z1vgNvdirFJm5bPcvZ6GW+vgLL
	 OalcocOmpx3tks5tXl6S3gb0bqhynymA/QqYKlGELJa6TI/u7XuKv6s+LaHgoGCVM8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313217;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kPdufsPBJpaLhkzWQqqT8FSuhylKhYmUXeIW0aMLwqc=;
	b=Wc4VYtgeUcCbzQeaTXJbsQ4ng6gveHOwIa/cRTZgbNsHt1MWr8LzwhaKuExC0iVfeH/8
	 LGd6zpJ4e9s64pxSZgyb73jZ7jhu+t9xW/PFcyo8IDql+xbrJX7JExx0gZ79iACe2C4Xz
	 fgCBWmOcSLT7PW6XRrObWqiwTwqA2rKZOK+tvWkBbguIPayKAGpQmoaXqamcCxiMHEfx8
	 wXkll5hjx6TIF/vb2DssB+Idk6fvscgZRSEPTRiX8nmYdehSNJNCdZerIbahkWtGxSRwN
	 92OMaRV9U8KyFqRN6o4c1FUlCeuC+Ahb0wP5cUKaar0u5xAIUR35Kb3G207NAK1QHww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LGkizSni;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ovaevFci;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B7A606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B7A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LGkizSni;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ovaevFci
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794313215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kPdufsPBJpaLhkzWQqqT8FSuhylKhYmUXeIW0aMLwqc=;
	b=LGkizSniNGYF4hqBVCtIB8IV798WGc5n7tl9FrMTCMWuyFJqZdqk706zaCf34QgvrjFrlW
	0tyc/rb0x++w82Ug5QsmQTXDiojsKxaBoGXQ9kYVjpEvkyqA1lyEugZEIVK0m3svATSUgU
	iBMSWTIJrMu9XhY1jJJFdJ/N2U5gjZs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-YYetXe8hNQ670WHt84vW_A-1; Tue, 10 Nov 2026 07:20:13 -0500
X-MC-Unique: YYetXe8hNQ670WHt84vW_A-1
X-Mimecast-MFC-AGG-ID: YYetXe8hNQ670WHt84vW_A_1794313212
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso16290065e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794313212; x=1794918012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPdufsPBJpaLhkzWQqqT8FSuhylKhYmUXeIW0aMLwqc=;
        b=ovaevFcimn2HnEBjjZ/NGwI9bTwKxnGNmYozXjxjutP/+44svBl3WI0nrxw003GSU5
         QQPmjOgGO8Ot+VFawHXgtbSi+i59M+yI7goxfir4Kk2nysNV91nr8XgtWod6r5IqyTX9
         NeSvpC71yJNnakGxqD6nmm/dbvsL4qGNF5Xyf/9ewEUwTIn4Bs1ImutMRuadkz4pop80
         1HdmENo6P5iHz0VEUoqeYbgce/bBgZJysPJokj5LXIQNYXsIzU28xrucgvCkulJwLZAF
         kxg3osvKjQlY0Z4+xanBxp67BY6br6ReKQs8CVQKIxDA5bGE0VbiSI209tR9eZwnCV3E
         GwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313212; x=1794918012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPdufsPBJpaLhkzWQqqT8FSuhylKhYmUXeIW0aMLwqc=;
        b=1IAskrtQ2KpSNHrx26WwRkc8bZfKHiSilAQzGnrnrdvNVl9wXKC8AafRsk8jG7FHyr
         6uqxU94VhebY3tDkjc16C7wwHqB1rE/rSNv1ooE91ja45TPlvF1VgJaTtrxNd3Dbq+zF
         Q2VAk7A9J6XMbmep+DxcnJFHkAZhAqI90GqveodB1Qj+XfgkL+2SFTQzS6xzHBLQNPU+
         Vn8UlbCKq+VzNpwS2vUvB/YRLNeo+dFq9QqR34+m8eX69T+CiDpILaBfcqreyYw5MksD
         S6Yqq8wIni0RiLbN69ihgyCP1b2AXoDdA4Nu4NYOTKknFLwIKtkLUFXYVowzcNcOtNjy
         8fuQ==
X-Forwarded-Encrypted: i=1; AL+hErEVvjhRbrYWqfzxPrO/RYw1RNcAVbCnCmQcu+N4RKu5zAXyLUtzr5UlVIgd8+f+9JJSDZiCUd5pb5FcN2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GvLAop+NrRAOTKd3CEiNO9CLUTO/tfnh6I+CYfV0NEDJJ/lGl
	PAv+FPzTOiXu3tIU+O6GdJfaBgREK28/5Qq7H+CAm0Cg8iXl4uAfaxmaL+nXae9emjQ6psj+x4q
	M+Bv33lbTLfKX1ABAvLnk5AglLACV+Q3uzS5K/LqFnWR+zcWnqPACe+SkXb7GTUlSdQ==
X-Gm-Gg: AYBFou0SNsRfUZk+rBlydYH2jVhKCVjmn1AI3V16VkjTMf4pZgOK9fFzVCEDAKkYnp8
	cWgHeRsnEs1pvbCSWFocvsJIwr1yi/sfLgNmqMp9Nfis0ZtDBGIqSCmvagRmXeBd+mo7BPDYwTk
	zP3lyUVuiQ1S33tprGEcIcN2Hf0XD1J0nq2ZZU0/AeYOEzoqFJBDc8eaTLlo6gKYzjtx8bvZQHr
	OHI7EXDQOR1rNwCND5aeWy3l7SmyjHP6lbEFVhUZbvMJ9a5d++Xx609/R3LaaGTDtR14YRGGD2Q
	CZNhgQqxJuPkCzZvi7hxGhGsSnfVfV6ds6Bx30psTWnzpOVZ95n0xYlcc3ItGDrPUJT4EEpzXzv
	cWiyv0B2N56/NuJMF489stfr+o0g4o1nr6Gg=
X-Received: by 2002:a05:600c:1c0c:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4ba0233e877mr44340965e9.13.1794313212283;
        Tue, 10 Nov 2026 04:20:12 -0800 (PST)
X-Received: by 2002:a05:600c:1c0c:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4ba0233e877mr44340455e9.13.1794313211833;
        Tue, 10 Nov 2026 04:20:11 -0800 (PST)
Received: from [10.43.3.161] ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c377fdsm3961339f8f.21.2026.11.10.04.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:20:11 -0800 (PST)
Message-ID: <a873e0f1-ead6-49da-93af-d2c2d79c9741@redhat.com>
Date: Tue, 10 Nov 2026 13:20:09 +0100
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
Subject: Re: [PATCH net-next 01/10] ice: dpll: notify TSPLL lock status from
 the periodic work only
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
 <20261106121005.1327603-2-ivecera@redhat.com>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261106121005.1327603-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:09 PM, Ivan Vecera wrote:
> ice_dpll_tspll_state_on_dpll_set() notifies the TSPLL device from a
> callback of the TIME_REF pin. This pin belongs to an external DPLL and the
> DPLL core is going to run its callbacks under a lock of the pin's owner,
> which does not cover the TSPLL device.
> 
> Only update dpll_state in the callback, so a device get reports the new
> state right away, and leave prev_dpll_state to
> ice_dpll_periodic_work_e825(), which then sends the notification. It now
> arrives up to 500 ms later and after the reply to the request.
> 
> Refresh dpll_state on every run of the work, as the state written by the
> callback can be transient and the lock status can return to
> prev_dpll_state before the next run. No notification is sent in this case.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/net/ethernet/intel/ice/ice_dpll.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
> index ade1fb3dd06743..bdbcf7af296eb4 100644
> --- a/drivers/net/ethernet/intel/ice/ice_dpll.c
> +++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
> @@ -2914,7 +2914,6 @@ ice_dpll_tspll_state_on_dpll_set(const struct dpll_pin *pin, void *pin_priv,
>   	struct ice_dpll_pin *p = pin_priv;
>   	struct ice_pf *pf = p->pf;
>   	enum ice_clk_src clk_src;
> -	bool changed = false;
>   	struct ice_dpll *tp;
>   	int ret;
>   
> @@ -2947,15 +2946,12 @@ ice_dpll_tspll_state_on_dpll_set(const struct dpll_pin *pin, void *pin_priv,
>   		WRITE_ONCE(pf->ptp.tspll_locked,
>   			   new_state == DPLL_LOCK_STATUS_LOCKED);
>   
> -		if (tp->prev_dpll_state != new_state) {
> -			tp->dpll_state = new_state;
> -			tp->prev_dpll_state = new_state;
> -			changed = true;
> -		}
> +		/* ice_dpll_periodic_work_e825() compares the state with
> +		 * prev_dpll_state and sends the notification.
> +		 */
> +		tp->dpll_state = new_state;
>   	}
>   	mutex_unlock(&pf->dplls.lock);
> -	if (changed)
> -		__dpll_device_change_ntf(tp->dpll);
>   	/* TSPLL reconfiguration may complete before lock is reacquired.
>   	 * PTP periodic monitoring tracks and restores the final lock state.
>   	 */
> @@ -3372,8 +3368,8 @@ static void ice_dpll_periodic_work_e825(struct ice_pf *pf)
>   	mutex_lock(&pf->dplls.lock);
>   	new_state = ice_dpll_tspll_lock_status_get(pf, true);
>   
> +	tp->dpll_state = new_state;
>   	if (tp->prev_dpll_state != new_state) {
> -		tp->dpll_state = new_state;
>   		tp->prev_dpll_state = new_state;
>   		changed = true;
>   	}

Reviewed-by: Petr Oros <poros@redhat.com>

