Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828183;
	b=ceHoUfOu2sQSnSyhMbDQe6CScVCuDfsICCSYd870frJzCgKmzwYdKxIPVdqGXLJN36WA
	 vcCww6xdcPgC/sKbC5uc44F5u2GnVmQKcq5CGb3j5QYHAyLdXKAJi6u0gJovv4dDt1+hh
	 tngqVE5QwFyrwnCR3WF08sQ1QwGxbPRs25+nG1vEOSYl+9CrMtTd7FnwhDRiUHKAKn0ry
	 5ALMFx7lk4w/ULROrNCtoP0Y3e3jNDZlAL8mKP66Jx7LwWC+CWcRK6NHGFaATJx7UhJ3v
	 /EWct+QOlxzoNsL0Lfq2+lTJA7gAmtCUSCfvuq7F6OeeRb6ShbCv5Wo/Surt9ZmlL+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828183;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=buCi/l2S7wNdD5Gx93ceNLd1RVCUo3nM3HyTS/pW7FE=;
	b=qcehzL+SDAqEdFI1XU/NDvJGjT1R6vfkiue8ezqq2gV2hjM1TDJ/COPx7AcQD9yTQC43
	 Sfq+7Dxb3Bchu6oSeH2QWfkXXw9rKbkdJsQYjtM/a5EcXmhQUNcHYsBjHebCBi+ryZJfb
	 yH8SM8G1hSCF+rX01NiBQaZ98EstT4CRcW7TRTUkPeNceDV73ShQTav+YjGW4fXMOiJAm
	 pKxwgAWzyFwY/LaYKf+s2wvekismD+fQz3+mzvftNjUPrrf8ON1PW3nKmzAiT1z6NFrVA
	 cNuPFbEmVYerU8sZG5+N91t1PH5Ebxz8SLjZ+P20RxdlXeFcRYOe4yfMfMC9sV0mpog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e2/KIk2p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8507C606A332;
	Mon, 16 Nov 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2/KIk2p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94881F000C4;
	Mon, 16 Nov 2026 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828183;
	bh=buCi/l2S7wNdD5Gx93ceNLd1RVCUo3nM3HyTS/pW7FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e2/KIk2piJcTnCueKuj2crc+cyighqDYHfk7ZFPSLqp7cvbgpXqBlQYEGKDudORBS
	 kzRZ/nCbxSeYd/M7+WwGV6IUxsfSuOJKUfL0sTBn5ZrCjORONhYvQ17/mzvnhQy8oB
	 pNhlR6bYwGdciEByE6VMXhlm1Ff5m/i8dmogZDCb0VGQo0i8+0QU3LsIsQh46cxAGa
	 Rbeub/Io6hX9UCCpq5avJUc6Ld1shIekA9s64/K5G9X26banjja5Qmaqtp5Z1IbEsU
	 ghRmcUgKnKlsaUv6+GKNwTWQi4JuFbbqm45zxm1EnJGBOC8YKGzktWzWN1ZM7bU+uT
	 wTteYySRqHUnQ==
Date: Mon, 16 Nov 2026 12:22:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yanli Yang <yanli.yang@bedmex.com>
Cc: linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhirun Liu <zhirunliu@aicsemi.com>, 
	Dijia Xu <dijiaxu@aicsemi.com>, Chunqiu Liu <chunqiuliu@aicsemi.com>, 
	Liheng Wei <liheng.wei@bedmex.com>
Subject: Re: [PATCH wireless-next v5 2/4] wifi: aic: Add firmware protocol
 and SDIO chip support
Message-ID: <20261116-whispering-camouflaged-capybara-6ac813@quoll>
References: <179481380235.4.7388336477392853157@bedmex.com>
 <179481380237.4.13158213034346823800@bedmex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179481380237.4.13158213034346823800@bedmex.com>

On Mon, Nov 16, 2026 at 03:23:22PM +0800, Yanli Yang wrote:
> +/***************************************************************************
> + * Messages from SM task
> + **************************************************************************/
> +#ifdef CONFIG_AICWF_FULLMAC
> +static inline int aicwf_rx_sm_connect_ind(struct aicwf_hw *aicwf_hw,
> +					  struct aicwf_cmd *cmd,
> +					  struct ipc_e2a_msg *msg)
> +{
> +	struct sm_connect_ind *ind = (struct sm_connect_ind *)msg->param;
> +	struct aicwf_vif *aicwf_vif = aicwf_hw->vif_table[ind->vif_idx];
> +	struct net_device *dev = aicwf_vif->ndev;
> +	const u8 *req_ie, *rsp_ie;
> +	const struct element *extcap;
> +	struct ieee80211_channel *chan;
> +	const u8 *ht_ie = NULL;
> +	const u8 *vht_ie = NULL;
> +
> +	/* Retrieve IE addresses and lengths */
> +	req_ie = (const u8 *)ind->assoc_ie_buf;
> +	rsp_ie = req_ie + ind->assoc_req_ie_len;
> +
> +	// Fill-in the AP information
> +	dev_dbg(aicwf_hw->dev, "ind->status_code:%d\n",
> +		ind->status_code);
> +
> +	if (ind->status_code == 0) {
> +		struct aicwf_sta *sta = &aicwf_hw->sta_table[ind->ap_idx];
> +		u8 txq_status;
> +		struct cfg80211_chan_def chandef;
> +
> +		sta->valid = true;
> +		sta->sta_idx = ind->ap_idx;
> +		sta->ch_idx = ind->ch_idx;
> +		sta->vif_idx = ind->vif_idx;
> +		sta->vlan_idx = sta->vif_idx;
> +		sta->qos = ind->qos;
> +		sta->acm = ind->acm;
> +		sta->ps.active = false;
> +		sta->aid = ind->aid;
> +		sta->band = ind->band;                 // ind->chan.band;
> +		sta->width = ind->width;               // ind->chan.type;
> +		sta->center_freq = ind->center_freq;   // ind->chan.prim20_freq;
> +		sta->center_freq1 = ind->center_freq1; // ind->chan.center1_freq;
> +		sta->center_freq2 = ind->center_freq2; // ind->chan.center2_freq;
> +		aicwf_vif->sta.ap = sta;
> +		// ind->chan.prim20_freq);
> +		chan = ieee80211_get_channel(aicwf_hw->wiphy, ind->center_freq);
> +		cfg80211_chandef_create(&chandef, chan, NL80211_CHAN_NO_HT);
> +		if (!aicwf_hw->mod_params->ht_on)
> +			chandef.width = NL80211_CHAN_WIDTH_20_NOHT;
> +		else
> +			chandef.width = chnl2bw[ind->width];  //[ind->chan.type];
> +		chandef.center_freq1 = ind->center_freq1; // ind->chan.center1_freq;
> +		chandef.center_freq2 = ind->center_freq2; // ind->chan.center2_freq;
> +		aicwf_chanctx_link(aicwf_vif, ind->ch_idx, &chandef);
> +		memcpy(sta->mac_addr, ind->bssid.array, ETH_ALEN);
> +		if (ind->ch_idx == aicwf_hw->cur_chanctx)
> +			txq_status = 0;
> +		else
> +			txq_status = AICWF_TXQ_STOP_CHAN;
> +		memcpy(sta->ac_param, ind->ac_param, sizeof(sta->ac_param));
> +		aicwf_txq_sta_init(aicwf_hw, sta, txq_status);
> +		aicwf_txq_tdls_vif_init(aicwf_vif);
> +		aicwf_mu_group_sta_init(sta, NULL);
> +		/* Look for TDLS Channel Switch Prohibited flag in the Extended
> +		 * Capability Information Element
> +		 */
> +		extcap = cfg80211_find_elem(WLAN_EID_EXT_CAPABILITY, rsp_ie,
> +					    ind->assoc_rsp_ie_len);
> +		if (extcap && extcap->datalen >= 5) {
> +			aicwf_vif->tdls_chsw_prohibited =
> +				extcap->data[4] & WLAN_EXT_CAPA5_TDLS_CH_SW_PROHIBITED;
> +		}
> +
> +		if (aicwf_vif->wep_enabled)
> +			aicwf_vif->wep_auth_err = false;
> +
> +#ifdef CONFIG_AICWF_BFMER

Heh? What is this?

> +		/* If Beamformer feature is activated, check if features can be used
> +		 * with the new peer device
> +		 */
> +		if (aicwf_hw->mod_params->bfmer) {
> +			const u8 *vht_capa_ie;
> +			const struct ieee80211_vht_cap *vht_cap;
> +
> +			do {
> +				/* Look for VHT Capability Information Element */
> +				vht_capa_ie = cfg80211_find_ie(WLAN_EID_VHT_CAPABILITY, rsp_ie,
> +							       ind->assoc_rsp_ie_len);
> +
> +				/* Stop here if peer device does not support VHT */
> +				if (!vht_capa_ie)
> +					break;
> +
> +				vht_cap = (const struct ieee80211_vht_cap *)(vht_capa_ie + 2);
> +
> +				/* Send MM_BFMER_ENABLE_REQ message if needed */
> +				aicwf_send_bfmer_enable(aicwf_hw, sta, vht_cap);
> +			} while (0);
> +		}
> +#endif //(CONFIG_AICWF_BFMER)
> +
> +		ht_ie = cfg80211_find_ie(WLAN_EID_HT_CAPABILITY, rsp_ie,
> +					 ind->assoc_rsp_ie_len);
> +		if (ht_ie)
> +			aicwf_vif->sta.ap->ht = true;
> +		vht_ie = cfg80211_find_ie(WLAN_EID_VHT_CAPABILITY, rsp_ie,
> +					  ind->assoc_rsp_ie_len);
> +		if (vht_ie)
> +			aicwf_vif->sta.ap->vht = true;
> +
> +#ifdef CONFIG_AICWF_MON_DATA
> +		// If there are 1 sta and 1 monitor interface active at the same time
> +		// then monitor interface channel context is always the same as the STA
> +		// interface. This doesn't work with 2 STA interfaces but we don't want
> +		// to support it.
> +		if (aicwf_hw->monitor_vif != AICWF_INVALID_VIF) {
> +			struct aicwf_vif *aicwf_mon_vif =
> +				aicwf_hw->vif_table[aicwf_hw->monitor_vif];
> +			aicwf_chanctx_unlink(aicwf_mon_vif);
> +			aicwf_chanctx_link(aicwf_mon_vif, ind->ch_idx, NULL);
> +		}
> +#endif
> +		// atomic_set(&aicwf_vif->drv_conn_state,
> +		// (int)AICWF_DRV_STATUS_CONNECTED);

What?

This is junk. You send us dead code.

...


> +int aicwf_send_tdls_peer_traffic_ind_req(struct aicwf_hw *aicwf_hw,
> +					 struct aicwf_vif *aicwf_vif)
> +{
> +	struct tdls_peer_traffic_ind_req *tdls_peer_traffic_ind_req;
> +
> +	if (!aicwf_vif->sta.tdls_sta)
> +		return -ENOLINK;
> +
> +	/* Build the TDLS_PEER_TRAFFIC_IND_REQ message */
> +	tdls_peer_traffic_ind_req =
> +		aicwf_msg_zalloc(aicwf_hw, TDLS_PEER_TRAFFIC_IND_REQ, TASK_TDLS, DRV_TASK_ID,
> +				 sizeof(struct tdls_peer_traffic_ind_req));
> +
> +	if (!tdls_peer_traffic_ind_req)
> +		return -ENOMEM;
 

 ...
 > +static inline void aicwf_radar_start_cac(struct aicwf_radar *radar,
> +					 u32 cac_time_ms, struct aicwf_vif *vif)
> +{
> +}
> +
> +static inline void aicwf_radar_cancel_cac(struct aicwf_radar *radar)
> +{
> +}
> +
> +static inline void
> +aicwf_radar_detection_enable_on_cur_channel(struct aicwf_hw *aicwf_hw)
> +{
> +}
> +
> +static inline int aicwf_radar_dump_pattern_detector(char *buf, size_t len,
> +						    struct aicwf_radar *radar,
> +						    u8 chain)
> +{
> +	return 0;
> +}
> +
> +static inline int aicwf_radar_dump_radar_detected(char *buf, size_t len,
> +						  struct aicwf_radar *radar,
> +						  u8 chain)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_AICWF_RADAR */
> +
> +#endif // _AICWF_RADAR_H_
> diff --git a/drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.h b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.h
> new file mode 100644
> index 000000000000..aeae5f1ac833
> --- /dev/null
> +++ b/drivers/net/wireless/aic/aic8800_fdrv/aicwf_resv_mem.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 AIC semiconductor.
> + */
> +
> +#ifndef _AICWF_RESV_MEM_H_
> +#define _AICWF_RESV_MEM_H_
> +
> +#include <linux/types.h>
> +
> +struct sk_buff;
> +
> +enum aicwf_resv_mem_id {
> +	AIC_RESV_MEM_TXDATA,
> +	AIC_RESV_MEM_NUM,
> +};
> +
> +/**
> + * struct aicwf_resv_mem_entry - one reserved buffer
> + * @used: Whether the buffer is currently handed out
> + * @skb: The reserved buffer, %NULL until it could be allocated
> + */
> +struct aicwf_resv_mem_entry {
> +	bool used;
> +	struct sk_buff *skb;
> +};
> +
> +/**
> + * struct aicwf_resv_mem - buffers reserved for the lifetime of a device
> + * @entry: One entry per &enum aicwf_resv_mem_id
> + */
> +struct aicwf_resv_mem {
> +	struct aicwf_resv_mem_entry entry[AIC_RESV_MEM_NUM];
> +};
> +
> +#ifdef CONFIG_RESV_MEM_SUPPORT

What the hell is this?

What are you sending to the lists? Windows code? 10 year old fork of
kernel? What is the point of such code?

> +void aicwf_resv_mem_init(struct aicwf_resv_mem *pool);
> +void aicwf_resv_mem_deinit(struct aicwf_resv_mem *pool);
> +struct sk_buff *aicwf_resv_mem_alloc_skb(struct aicwf_resv_mem *pool,
> +					 unsigned int length,
> +					 enum aicwf_resv_mem_id id);
> +void aicwf_resv_mem_kfree_skb(struct aicwf_resv_mem *pool, struct sk_buff *skb,
> +			      enum aicwf_resv_mem_id id);
> +#else
> +static inline void aicwf_resv_mem_init(struct aicwf_resv_mem *pool)
> +{
> +}
> +
> +static inline void aicwf_resv_mem_deinit(struct aicwf_resv_mem *pool)
> +{
> +}
> +#endif


...
+
> +int aicwf_sdio_flow_ctrl(struct aic_sdio_dev *sdiodev)
> +{
> +	int ret = -1;
> +	u8 fc_reg = 0;
> +	u32 count = 0;
> +
> +	while (true) {
> +		ret =
> +			aicwf_sdio_readb(sdiodev, sdiodev->sdio_reg.flow_ctrl_reg, &fc_reg);
> +		if (ret)
> +			return -1;
> +
> +		if (sdiodev->chip_hw->need_flowctrl_mask)
> +			fc_reg &= SDIOWIFI_FLOWCTRL_MASK_REG;
> +
> +		if (fc_reg > DATA_FLOW_CTRL_THRESH) {
> +			ret = fc_reg;
> +			if (ret > AICWF_SDIO_TX_AGGR_MAX)
> +				ret = AICWF_SDIO_TX_AGGR_MAX;
> +			return ret;
> +		}
> +		if (count >= FLOW_CTRL_RETRY_COUNT) {
> +			ret = -fc_reg;
> +			break;
> +		}
> +		count++;
> +		if (count < 30)
> +			usleep_range(50, 50);
> +		else if (count < 40)
> +			usleep_range(2000, 2500);
> +		else
> +			usleep_range(10000, 12000);
> +	}
> +
> +	return ret;
> +}
> +
> +int aicwf_sdio_send_pkt(struct aic_sdio_dev *sdiodev, u8 *buf, uint count)
> +{
> +	int ret = 0;
> +
> +	if (!sdiodev->func) {
> +		dev_warn(sdiodev->dev, "null sdio func\n");
> +		return 0;
> +	}
> +
> +	sdio_claim_host(sdiodev->func);
> +	ret =
> +		sdio_writesb(sdiodev->func, sdiodev->sdio_reg.wr_fifo_addr, buf, count);
> +	sdio_release_host(sdiodev->func);
> +
> +	return ret;
> +}
> +
> +#ifdef CONFIG_PREALLOC_RX_SKB

What is this?

> +int aicwf_sdio_recv_pkt(struct aic_sdio_dev *sdiodev, struct rx_buff *rxbuff,
> +			u32 size)
> +{
> +	int ret;
> +
> +	if (!rxbuff->data || !size || size > AICWF_RXBUFF_SIZE)
> +		return -EINVAL;
> +	if (!sdiodev->func) {
> +		dev_warn(sdiodev->dev, "null sdio func\n");
> +		return -ENODEV;
> +	}
> +
> +	sdio_claim_host(sdiodev->func);
> +	ret = sdio_readsb(sdiodev->func, rxbuff->data,
> +			  sdiodev->sdio_reg.rd_fifo_addr, size);
> +	sdio_release_host(sdiodev->func);
> +
> +	if (ret < 0)
> +		return ret;
> +	rxbuff->len = size;
> +
> +	return ret;
> +}


...


> +static int aicwf_sdio_suspend(struct device *dev)
> +{
> +	int ret = 0;
> +	struct aicwf_bus *bus_if = dev_get_drvdata(dev);
> +	struct aic_sdio_dev *sdiodev = bus_if->sdiodev;
> +	mmc_pm_flag_t sdio_flags;
> +	struct aicwf_vif *aicwf_vif, *tmp;
> +#ifdef CONFIG_AIC8800_NO_WAKE_COUNT
> +	int cnt = 0;
> +#endif

no, that's some bogus downstream code. Your driver must not have ifdefs
in general. Variables declarations depending on ifdef is... not close to
kernel at all.

> +	int sus_abort = 0;
> +
> +	/* Check host PM support before changing network or chip state. */
> +	sdio_flags = sdio_get_host_pm_caps(sdiodev->func);
> +	if (!(sdio_flags & MMC_PM_KEEP_POWER))
> +		return -EINVAL;
> +	ret = sdio_set_host_pm_flags(sdiodev->func, MMC_PM_KEEP_POWER);
> +	if (ret)
> +		return ret;
> +
> +	list_for_each_entry_safe(aicwf_vif, tmp, &sdiodev->aicwf_hw->vifs, list) {
> +		if (aicwf_vif->ndev)
> +			netif_device_detach(aicwf_vif->ndev);
> +	}
> +
> +	if (sdiodev->aicwf_hw->testmode == 1)
> +		dev_err(dev, "sleep cmd is not supported in RF test mode\n");
> +#ifdef CONFIG_AIC8800_NO_WAKE_COUNT //move to when set supend is received
> +	else
> +		aicwf_send_me_set_lp_level(sdiodev->aicwf_hw, 1, 0); //dynamic switch
> +#endif
> +
> +#if (defined(CONFIG_AIC8800_AUTO_POWERSAVE) && defined(CONFIG_AIC8800_SDIO_PWRCTRL))

You need to stop inventing stuff.

Where is AIC8800_SDIO_PWRCTRL defined?

where are any of these bogus configs defined?

> +	aicwf_sdio_pwr_stctl(sdiodev, SDIO_ACTIVE_ST);
> +	if (sdiodev->chip_hw->auto_ps_support) {
> +		dev_dbg(dev, "auto_ps enter\n");
> +		ret = aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg, 0x8);
> +		if (ret)
> +			dev_err(dev, "sdio enter auto_ps fail\n");
> +	}
> +#endif
> +
> +#ifdef CONFIG_AIC8800_NO_WAKE_COUNT
> +	while (&sdiodev->aicwf_hw->scan_request && aicwf_hw->scanning) {
> +		/* move to when set supend is received, the theory does not enforce this condition,
> +		 * and the code is retained for now
> +		 */
> +		dev_dbg(dev, "wait scan_cfm\n");
> +		if (cnt == 0) {
> +			aicwf_send_scanu_cancel_req(sdiodev->aicwf_hw, NULL);
> +			continue;
> +		}
> +		msleep(20);
> +		cnt += 1;
> +		if (cnt >= 40)
> +			break;
> +	}
> +#endif
> +
> +#ifdef CONFIG_AIC8800_TEMP_CONTROL
> +	timer_delete_sync(&sdiodev->tp_ctrl.tp_ctrl_timer);
> +	cancel_work_sync(&sdiodev->tp_ctrl.tp_ctrl_work);
> +#endif
> +
> +	atomic_set(&sdiodev->suspending, 1);
> +	/* Publish the suspend gate before checking outstanding activity. */
> +	smp_mb__after_atomic();
> +	if (!wait_event_timeout(sdiodev->activity_waitq,
> +				atomic_read(&sdiodev->activity_count) == 0,
> +				msecs_to_jiffies(600)))
> +		sus_abort = 1;
> +	if (sus_abort) {
> +		atomic_set(&sdiodev->suspending, 0);
> +#ifdef CONFIG_AIC8800_TEMP_CONTROL
> +		mod_timer(&sdiodev->tp_ctrl.tp_ctrl_timer,
> +			  jiffies + msecs_to_jiffies(TEMP_GET_INTERVAL));
> +#endif
> +		dev_dbg(dev, "ws active dont suspend\n");
> +
> +#if defined(CONFIG_AIC8800_AUTO_POWERSAVE)
> +		aicwf_sdio_pwr_stctl(sdiodev, SDIO_ACTIVE_ST);
> +		if (sdiodev->chip_hw->auto_ps_support) {
> +			dev_dbg(dev, "auto_ps abort\n");
> +			ret = aicwf_sdio_writeb(sdiodev, sdiodev->sdio_reg.wakeup_reg, 0x8);
> +			if (ret)
> +				dev_err(dev, "sdio exit auto_ps fail\n");
> +		}
> +#elif defined(CONFIG_AIC8800_NO_WAKE_COUNT)
> +		if (sdiodev->aicwf_hw->testmode == 0)
> +			aicwf_send_me_set_lp_level(sdiodev->aicwf_hw, 0, 1); //dynamic switch
> +#endif
> +		list_for_each_entry_safe(aicwf_vif, tmp, &sdiodev->aicwf_hw->vifs, list) {
> +			if (aicwf_vif->ndev) {
> +				dev_dbg(dev, "suspend restore\n");
> +				netif_device_attach(aicwf_vif->ndev);
> +			}
> +		}
> +		return -EBUSY;
> +	}
> +
> +#ifdef CONFIG_AIC8800_TEMP_CONTROL
> +	timer_delete_sync(&sdiodev->tp_ctrl.netif_timer);
> +	cancel_work_sync(&sdiodev->tp_ctrl.netif_work);
> +#endif
> +
> +#ifndef CONFIG_AIC8800_AUTO_POWERSAVE
> +	while (sdiodev->state == SDIO_ACTIVE_ST) {
> +		if (down_interruptible(&sdiodev->tx_priv->txctl_sema))
> +			continue;
> +#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
> +		aicwf_sdio_pwr_stctl(sdiodev, SDIO_SLEEP_ST);
> +#endif
> +		up(&sdiodev->tx_priv->txctl_sema);
> +		break;
> +	}
> +#else
> +#if defined(CONFIG_AIC8800_SDIO_PWRCTRL)
> +	aicwf_sdio_pwr_stctl(sdiodev, SDIO_SLEEP_ST);
> +#endif
> +#endif
> +
> +	atomic_set(&sdiodev->is_bus_suspend, 1);


> +
> +	return 0;
> +}



+
> +/*
> + * TYPE and STRUCT DEFINITIONS
> + ****************************************************************************************
> + */
> +
> +// IRQs from app to emb
> +/// Interrupts bits used for the TX descriptors of the AC queues
> +#ifdef CONFIG_AICWF_MUMIMO_TX
> +/// Interrupts bits used
> +#if NX_USER_MAX > 3
> +#define IPC_IRQ_A2E_USER_MSK 0xF
> +#elif NX_USER_MAX > 2
> +#define IPC_IRQ_A2E_USER_MSK 0x7
> +#else
> +#define IPC_IRQ_A2E_USER_MSK 0x3
> +#endif
> +
> +/// Offset of the interrupts for AC0


What sort of comment style is this? Windows? Doxygen? Certainly not
kernel style.

This is like 30k lines of unreviewable downstream junk. Last time you
send clearly undocumented ABI, now you send downstream build options.

Go back to the drawing board and clean up all this from such downstream
code.

Best regards,
Krzysztof

