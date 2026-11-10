Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324184;
	b=HmVcDAvw4sYdHTAY0FysUDMbYdE6pnzkl6gVA1tirZQMwOh6/NQQ/Qj7WK09Tggo4ctT
	 i3NUU6Vkyt4LrJGRcspYTNzDUlaL4uyafqLsLA57hoNr7wc6EpGm6cMkAw8nGDPWCbpL9
	 dxb/OC0UDl7CXWiZ29zAkiGW5VvFCoMZrZJnxk5SisY2jkMRTo8gr2r4dEJn1Y4Bjr+ed
	 zbjvs+Oks41Mj+BIig2usLsO0pFjHVOw3i+J+u2QA8nVp6/qmg/x9mx71ARqEZ070VxEa
	 4HD213gw1M3tFdCiSbQCBsPS9jijl6yvBTs/7e4Jnww8EpgndtK2CzJ2RWnlKpAgBBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324184;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1IKv8y20r1vzev+9QcpCTiSM8EabciUUIoas3eSK7bk=;
	b=zkUoSAz8he5N45D6CoqzuPaW/9Dh8MqzrxESkaeIkZvymL8LC6enR5dhzhNaGD6seTaG
	 z8kQpBc+O3lblkVSiL+YfcilyzegZ4wGTztbRuUiNV8QuG9MPKULHIhLxYan/+UW81BXb
	 xm9P2Ln8fIYgKlG5OWIjVo/jsMUJP7KFkUpk8OY66VGr3LadeuklAzlHOPMfurZzup5Og
	 savX0ZIL7XrmIAcCglNsjtjEZX71n3Jdt/T1M3I93seX1sJynhQ9F7S5rIvxLyHBp97gj
	 5u8cLSci4kIcDiU4tP/NnmajE1Gf3/6Y53crjMFKwhIWH0eDd4TlKjT1sOXBuEEx3bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BHoT96Zt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=R7x1yqeJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BHoT96Zt;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=R7x1yqeJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794324183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1IKv8y20r1vzev+9QcpCTiSM8EabciUUIoas3eSK7bk=;
	b=BHoT96Zt2sFqQr0qcClSUO6tcJVWsE6nPwhwa6q+ySamNKF46fi80NgxVSreCWW/XLyOHt
	6AwM2UqUI5K7nGDvKhrVeqChCGt7e40vFH7mnhpD3uw9v5sbvzAJZm/vQlT/TFG/BfPe+v
	MHXWzrjZSw5H7tYrt05nFBzAaelxukI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-0xbSn1OXPgujS_yWBzCpPA-1; Tue, 10 Nov 2026 10:23:02 -0500
X-MC-Unique: 0xbSn1OXPgujS_yWBzCpPA-1
X-Mimecast-MFC-AGG-ID: 0xbSn1OXPgujS_yWBzCpPA_1794324181
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b64722b5e6so25228865e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794324181; x=1794928981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1IKv8y20r1vzev+9QcpCTiSM8EabciUUIoas3eSK7bk=;
        b=R7x1yqeJ0Q7GGOfljshPNbTnRsERpKl+pBCLzoU+EVy/P4QqrdVo4FFq786Yj+GXVF
         JpT8N6Tdu59uHCGT+ShI+4tIpuzoEaXyyrwOtEeo6qEO0gn4lYLWZj2j4NNf2iesxLSM
         6p3ehWMnMUWui/SgXRfK8S5OB5CQsxsUrPmWk2dh7mt7tn8R+XZmVmexGgcAyi0A/Vuk
         +KKwJqIpK9HF/6CgNPo05JrbB+F8psIuExZBghP9oY31vYItdsr8xWNC7eAzxcqvsbwO
         N3qwvoo3QUh7+DDrlEiWkMzvRidQPT6dkK9w6Ws467Zal7sIf3NEO0BxibWThVbvMETD
         uZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324181; x=1794928981;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IKv8y20r1vzev+9QcpCTiSM8EabciUUIoas3eSK7bk=;
        b=jHFyyIHK3FRJLaRUPvX2wrR8fQS/ZUzKkH3zBEAb+OyK8cwE6YWypUPxsfIdXjut1m
         SRnbtKw0bdK3SxXIhzQnKwhkwTCi5K+pmFMFKjrRRRry31vuWXojBfATTkE5oruRR3+W
         eLNhiW8fFKapAt16FfEfs00O/q9KDyZiGWcIzfke8L29YJJARHmTODSEiukJ/05+Io/z
         02V9opbkODfUy9KcS0vYULyh1Rf/0hicrZhnwCBgaX7HelWP9LNzL232CymlmEwc9mv2
         PXyG/vG/vJVsHfmsPW8lXdon2umx0o8Hr1Y72VclnDOz+7k3o5ff+6YSCT9uIQ7DpT/2
         esEQ==
X-Forwarded-Encrypted: i=1; AL+hErFzASRf53H89EI4LQ4XoL7TAEAbsxr0CCLMSjYZeOaYAUQy6reyFnnNLZZ10JMPqvDE2ylbWadfj4AAh6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NzM2Jhe+9V7fB55uvdXNYUsLSHWmqLZ3E2jHNmm22m1RRrpBl
	3F1d5MrhTAmNfqL5NGGeFDcQhk1IUvqLb+Y2IlOsdcdqRwiDhtlwD3odlGJadI71wQRt8Q77/eu
	KcqU6B84S313wNCz4rk6XQ7CJOF0+TkPK68tSfVP3sCEvAJqAJsqHXmisWXPHNh3QPcf0SaAMto
	pe
X-Gm-Gg: AYBFou2axYufGPjlNsevTnEeQUjvHfOme7KRCx0gR3ZlkVXzPPUEYmqXgyxPCCtGac3
	mQ3eE+kGfREvEH3F9+MzLL4pXfrjyYq/DyY5WHF1fysOyisiq0IJ8UJb4SESnkeJGXfVD5kMqhr
	xZhyKHHA+KTziqVff+a8qxBd9qC6MxY/qbWMMstpFRYPmljd+ei8YmYGJk7gObmK69DX5g0Yr9x
	fvhGHxx7s4LGkAFp5vFGsqBSY1F2Zco84q2Dorq9zE+GhlXvdSHuvVMXo1aMRBZtkHTYhbrQBku
	7WRPNBlC1++V4zhahTutt76jGDbjZamaCeUKmEni/vxWoZVr2E1SdvfyoVS3fjcOVNv1FE+dTdb
	UPhDHN75Kfou2R6SfZgjzhSPnq+fU75nD0DM=
X-Received: by 2002:a05:600c:3b98:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ba02351506mr60403405e9.32.1794324180547;
        Tue, 10 Nov 2026 07:23:00 -0800 (PST)
X-Received: by 2002:a05:600c:3b98:b0:4a7:462c:6b9e with SMTP id 5b1f17b1804b1-4ba02351506mr60402605e9.32.1794324179979;
        Tue, 10 Nov 2026 07:22:59 -0800 (PST)
Received: from [10.43.3.161] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba022fbf75sm58097845e9.0.2026.11.10.07.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:22:59 -0800 (PST)
Message-ID: <cf90b9bc-80a1-4905-8669-823ff80c575b@redhat.com>
Date: Tue, 10 Nov 2026 16:22:57 +0100
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
Subject: Re: [PATCH net 1/2] ice: dpll: serialize changes of the SyncE CGU
 registers
Content-Language: en-US
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michal Schmidt <mschmidt@redhat.com>, Jakub Ramaseuski
 <jramaseu@redhat.com>, intel-wired-lan@lists.osuosl.org,
 linux-kernel@vger.kernel.org
References: <20261110094350.184185-1-ivecera@redhat.com>
 <20261110094350.184185-2-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261110094350.184185-2-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/26 10:43 AM, Ivan Vecera wrote:
> All E825C PFs share the CGU registers R10 and R11. On dual complex E825
> the second complex reaches the CGU of complex 0 through cgu_peer. RCLK pin
> callbacks read, modify and write these registers under dpll_lock and the
> pf->dplls.lock of their PF. ice_ptp_link_change() rewrites R10 under the
> pf->dplls.lock of its PF only, so a link change on one PF can write back
> a stale R10 and undo an RCLK pin change made by another PF.
> 
> Add a mutex to struct ice_adapter, which all E825C PFs share, and hold it
> around these sequences.
> 
> Tested on GNR-D with dual complex E825, with a 2 to 4 ms delay after the
> read of R10 in the link change path to widen the window. Toggling the
> RCLK pin of one port while another port of the same complex went down
> and up 143 times lost 120 of 86814 updates of the mux in R10 without
> this patch, and none of 76992 with it.
> 
> Fixes: ad1df4f2d591 ("ice: dpll: Support E825-C SyncE and dynamic pin discovery")
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/net/ethernet/intel/ice/ice_adapter.c |  2 ++
>   drivers/net/ethernet/intel/ice/ice_adapter.h |  4 ++++
>   drivers/net/ethernet/intel/ice/ice_dpll.c    | 11 ++++++-----
>   drivers/net/ethernet/intel/ice/ice_dpll.h    |  4 ++++
>   drivers/net/ethernet/intel/ice/ice_ptp.c     |  2 ++
>   drivers/net/ethernet/intel/ice/ice_tspll.c   |  4 ++--
>   6 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.c b/drivers/net/ethernet/intel/ice/ice_adapter.c
> index 536923b6ae979d..aa2d8addae5bef 100644
> --- a/drivers/net/ethernet/intel/ice/ice_adapter.c
> +++ b/drivers/net/ethernet/intel/ice/ice_adapter.c
> @@ -72,6 +72,7 @@ static struct ice_adapter *ice_adapter_new(struct pci_dev *pdev)
>   	spin_lock_init(&adapter->txq_ctx_lock);
>   	for (int i = 0; i < ARRAY_SIZE(adapter->cpi_phy_lock); i++)
>   		mutex_init(&adapter->cpi_phy_lock[i]);
> +	mutex_init(&adapter->cgu_synce_lock);
>   	refcount_set(&adapter->refcount, 1);
>   
>   	spin_lock_init(&adapter->ports.lock);
> @@ -85,6 +86,7 @@ static void ice_adapter_free(struct ice_adapter *adapter)
>   	WARN_ON(!list_empty(&adapter->ports.list));
>   	for (int i = 0; i < ARRAY_SIZE(adapter->cpi_phy_lock); i++)
>   		mutex_destroy(&adapter->cpi_phy_lock[i]);
> +	mutex_destroy(&adapter->cgu_synce_lock);
>   
>   	cleanup_srcu_struct(&adapter->ports.srcu);
>   
> diff --git a/drivers/net/ethernet/intel/ice/ice_adapter.h b/drivers/net/ethernet/intel/ice/ice_adapter.h
> index c61bd645e460de..fd5585005d91ba 100644
> --- a/drivers/net/ethernet/intel/ice/ice_adapter.h
> +++ b/drivers/net/ethernet/intel/ice/ice_adapter.h
> @@ -41,6 +41,8 @@ struct ice_port_list {
>    * @txq_ctx_lock: Spinlock protecting access to the GLCOMM_QTX_CNTX_CTL register
>    * @cpi_phy_lock: Per-PHY mutex serializing CPI REQ/ACK transactions.
>    *               Index 0 = PHY0, index 1 = PHY1. Used on E825C devices.
> + * @cgu_synce_lock: Mutex serializing changes of the CGU registers R10 and R11,
> + *                  which all PFs reach. Used on E825C devices.
>    * @ctrl_pf: Control PF of the adapter
>    * @ports: Ports list
>    * @index: 64-bit index cached for collision detection on 32bit systems
> @@ -53,6 +55,8 @@ struct ice_adapter {
>   	spinlock_t txq_ctx_lock;
>   	/* Serialize CPI REQ/ACK transactions per PHY (E825C only) */
>   	struct mutex cpi_phy_lock[ICE_E825_MAX_PHYS];
> +	/* Serialize changes of the SyncE CGU registers (E825C only) */
> +	struct mutex cgu_synce_lock;
>   
>   	struct ice_pf *ctrl_pf;
>   	struct ice_port_list ports;
> diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
> index ade1fb3dd06743..5148e419f49a07 100644
> --- a/drivers/net/ethernet/intel/ice/ice_dpll.c
> +++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
> @@ -2027,7 +2027,7 @@ ice_dpll_phase_offset_get(const struct dpll_pin *pin, void *pin_priv,
>    *
>    * DPLL subsystem callback. Set proper signals to recover clock from port.
>    *
> - * Context: Called under pf->dplls.lock
> + * Context: Called under pf->dplls.lock, acquires adapter->cgu_synce_lock
>    * Return:
>    * * 0 - success
>    * * negative - error
> @@ -2035,14 +2035,15 @@ ice_dpll_phase_offset_get(const struct dpll_pin *pin, void *pin_priv,
>   static int ice_dpll_synce_update_e825c(struct ice_hw *hw, bool ena,
>   				       u32 port_num, enum ice_synce_clk output)
>   {
> +	struct ice_pf *pf = hw->back;
>   	int err;
>   
> +	mutex_lock(&pf->adapter->cgu_synce_lock);
>   	/* configure the mux to deliver proper signal to DPLL from the MUX */
>   	err = ice_tspll_cfg_bypass_mux_e825c(hw, ena, port_num, output);
> -	if (err)
> -		return err;
> -
> -	err = ice_tspll_cfg_synce_ethdiv_e825c(hw, output);
> +	if (!err)
> +		err = ice_tspll_cfg_synce_ethdiv_e825c(hw, output);
> +	mutex_unlock(&pf->adapter->cgu_synce_lock);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.h b/drivers/net/ethernet/intel/ice/ice_dpll.h
> index bce0bea9a664bc..3f9a993129acef 100644
> --- a/drivers/net/ethernet/intel/ice/ice_dpll.h
> +++ b/drivers/net/ethernet/intel/ice/ice_dpll.h
> @@ -158,6 +158,7 @@ struct ice_dpll {
>    *     txclk_notify_rwsem (read)
>    *       -> pf->dplls.lock
>    *         -> ctrl_pf->dplls.lock
> + *         -> adapter->cgu_synce_lock
>    *
>    *   - @lock serializes all DPLL state mutations on this PF. When the
>    *     controlling PF's lock must also be taken (e.g. updating the shared
> @@ -169,6 +170,9 @@ struct ice_dpll {
>    *     dpll_*_change_ntf() calls. ice_dpll_deinit() takes the write side
>    *     standalone (not nested under any other lock) to drain in-flight
>    *     readers before pins and the TXC DPLL device are freed.
> + *   - adapter->cgu_synce_lock serializes changes of the CGU registers R10 and
> + *     R11. All E825C PFs reach one CGU, so @lock, which is per PF, does not
> + *     cover them.
>    */
>   struct ice_dplls {
>   	struct kthread_worker *kworker;
> diff --git a/drivers/net/ethernet/intel/ice/ice_ptp.c b/drivers/net/ethernet/intel/ice/ice_ptp.c
> index 7980eaf9ce2535..449819cf8c8791 100644
> --- a/drivers/net/ethernet/intel/ice/ice_ptp.c
> +++ b/drivers/net/ethernet/intel/ice/ice_ptp.c
> @@ -1368,7 +1368,9 @@ void ice_ptp_link_change(struct ice_pf *pf, bool linkup)
>   				break;
>   			}
>   
> +			mutex_lock(&pf->adapter->cgu_synce_lock);
>   			err = ice_tspll_cfg_synce_ethdiv_e825c(hw, clk_pin);
> +			mutex_unlock(&pf->adapter->cgu_synce_lock);
>   			if (active && err) {
>   				dev_err_once(ice_pf_to_dev(pf),
>   					     "Failed to configure SyncE ETH divider for pin %d, err %d\n",
> diff --git a/drivers/net/ethernet/intel/ice/ice_tspll.c b/drivers/net/ethernet/intel/ice/ice_tspll.c
> index 85bacb7c3a7903..b99e02cfe559bd 100644
> --- a/drivers/net/ethernet/intel/ice/ice_tspll.c
> +++ b/drivers/net/ethernet/intel/ice/ice_tspll.c
> @@ -792,7 +792,7 @@ int ice_tspll_bypass_mux_active_e825c(struct ice_hw *hw, u8 port, bool *active,
>    *
>    * Set reference clock source and output clock selection.
>    *
> - * Context: Called under pf->dplls.lock
> + * Context: Called under pf->dplls.lock and adapter->cgu_synce_lock
>    * Return:
>    * * 0 - success
>    * * negative - error
> @@ -898,7 +898,7 @@ static int ice_tspll_get_div_e825c(u16 link_speed, unsigned int *divider)
>    *
>    * Set the correct CGU divider for RCLKA or RCLKB.
>    *
> - * Context: Called under pf->dplls.lock
> + * Context: Called under pf->dplls.lock and adapter->cgu_synce_lock
>    * Return:
>    * * 0 - success
>    * * negative - error
Reviewed-by: Petr Oros <poros@redhat.com>

