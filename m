Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B881FF7C8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404857; cv=none; b=cEZvXI1CmfszDI394FUehec1S6zYcYHzOrc8vqE7RYuuMrOj8DFtApRgAgP7b0rF8dME1nC7lIPJswZ24udclfMC1LlfCy/0k6QEU9B7MBbPB9HoQ4DFyKDcPKtG9VNF65U9eIfBbLkDoBvL9fYVRf8sV4tPOwJ4yw5yad0K5Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404857; c=relaxed/simple;
	bh=0igNHW9KWwU/TPEF+aZvV3HFuCuJXORIVJ7Cqwp70Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AM6e281D0vilQEgzDl9XpjDko2fFpYzYvdaCe6WB9kYpbevgV6rBYkMAjvNw+PeKyfFWG5YZ3Uz/YAFiI7/Y+HDsXqCR9VY/uMq+nDdMOGMhILIux/UF/lEjg84S0Xei2ClnLDndk+Lah1wKhC2UfBMLNNJDUcpOnktNnXmUYq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qz95Lv7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTocwD+b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qz95Lv7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTocwD+b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xgmU3547083
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 03:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dkUpL4IwUW3ZUTI7y6UDzwrF1aRbG8miuQ1bitA8zM=; b=Qz95Lv7k3vn/x5po
	jdbiHdF9u74ERYqObAg3IK0X3jRhM01ols52vfqhm6hW9dZi3YmDUJmQUfGB673v
	g0flqSfvoVpdhvFHkogd+FMqjXt2may8VNZRphYQZMVIUgMCx0AG2Y7iSludmzn0
	odzAZHAH5mvNlZPMEJBIXPDbA/HKP0gZlKWrHoyWTp/uomF2Z+TA7N+VmsCyBPEd
	HhJi79z/ZhbZ5ZBzlLHr3bof140oVlnI9+GK0L8mlV3Et1qQWWK0nTdBByO0xeeT
	Tx3YPvubOjm2R5eCoJKZUn9pFDYKsh8jw/04yn1L6rKNjHbSFhDvIjVBeh+PjsEe
	VJbIrw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8bmsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:07:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8553305b7c7so1450649b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788404853; x=1789009653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dkUpL4IwUW3ZUTI7y6UDzwrF1aRbG8miuQ1bitA8zM=;
        b=BTocwD+bliEO9zHiiCf12u768IoxzH/zd02DjbNYbMXQ4vHzudMZeAE9LNowNEzPTR
         HECkIWgD4N/kwj19vXANvc7qAIxZ2RnRM+2UiPg9kXu25c/hRUc7hJxf4ww9R92djJ4S
         oTBVJjqsi5jqfS5scie8Ii4p4zafpYrUbRwksgyRzoi6I9sDp+lJ3jqIsKacTFK4m42l
         f76Lyr+fOUQAMimdUUYH4onMeAquySoWba4DiXGsLdfJGX0CbKSfByCc4Trkq16orHcc
         YxlcOzMxqD/GFNshzXP+26HLJqf4mP1xYlbZ5YrFgWqgIkicbLBguD6ua5cS+kVIT87N
         PQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404853; x=1789009653;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dkUpL4IwUW3ZUTI7y6UDzwrF1aRbG8miuQ1bitA8zM=;
        b=W9PKRFozX0n75Eu66kPBnhMcu6qBnx+CjZU7CZ8GcQ41AQ5XnhxP1Bc3TudSFD8Itq
         mljYUDa/ipUkHfKXxZ6x4UKKmxn8j2LPZ+qGO/D1WaU+KV/Jjrb8hwxB0iLfIHvz4VXH
         +3D4xNXODVidPDP9vL/EAdFio7ihMfGXNptDD2FPOwGeKZwDTEYeqovjLJK2t1xLbgq0
         wu6evFMD6M7Z/Wc58H1oOPuS1WViypYfsWSkUNCcStJaGqyW9rwAwXr2thn3BOSnXfB0
         hwMGxD0SD/R74ZYxVS5VY0p7AfcWAolSmWD0xKeMD9xQKAuMj/IQgPwYsQk4/vNUFqEt
         ZYkA==
X-Forwarded-Encrypted: i=1; AKwUvBw+h2vfZeqSLR634Uqbtq3/3wTHHCQY4SLR+UOM7StO8HcqtfjTrNpRf0TUGMj+dnshAeV4x2lCS5K+rQU=@vger.kernel.org
X-Gm-Message-State: AFuF++mkPhh/+K4OGt9utR0ADrHU7/P/e5FgMQsP7ITW9UoMKcCOCHHA
	iIggAEDMbpwLJ1H9xCtwm7DENGdwRcBeUEmxLaspouHk3GAdQ2YU7AXUwejBaz07O0AKSC6kwJN
	TZjQLCrcTPl1Jub6eN/7rzBXk8xtUtPL03zePWm5hvpUOJTthR1GoQYWKGyJZF+VT/JOjqWWMp2
	g=
X-Gm-Gg: AYBFou3up0hoad2YgsGmquAEyGcGXRvTz1swY7bweqLKa0tXS+Be2BY0ybM82mGrqks
	8aWBB44pt3UguukvmPX6lTw5DCyeJgxSJ4EjB1Wa9a01Ijg5+tuyrQGLtmYTf6WgkB+0xfyGXau
	nLs1bHTAl9WT7FKexo2HjSu/pLZhZBsMlCpKZKYRAiYOvmcXCUml+EGoPrchFXFWP4GfknfDr0g
	mhd9/bC6Vtq1KxUqQS4eO/2uD+4I0foVDKoMCISvUCDBer0uOS58nWl2D9BRRYI2iKFeid9rgL0
	jmh0pzev/qyb8LneAyo7yIN1bTcU5WGIncKwXUlq5LxxRTeUhpmPph+J236qIpmpGpdurwebGKV
	8bXh60ogfzs58OOWHPZr+zPFW0aaRWOluXcKn+iA2Fm4xXhEjtoTbbE62qYG4MmuEDanx081W
X-Received: by 2002:a05:6a00:2e9c:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-85ed3c7d861mr12149927b3a.12.1788404853425;
        Wed, 02 Sep 2026 20:07:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9c:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-85ed3c7d861mr12149882b3a.12.1788404852906;
        Wed, 02 Sep 2026 20:07:32 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003a82bsm2078731b3a.33.2026.09.02.20.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 20:07:32 -0700 (PDT)
Message-ID: <265ee3ce-b953-4cef-a34e-c2f51a86ec26@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:07:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: flush REO queue extension descriptors
 before freeing the qdesc
To: Sebastian Salmhofer <sebastian.salmhofer@salmtek.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831151011.2336305-1-sebastian.salmhofer@salmtek.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260831151011.2336305-1-sebastian.salmhofer@salmtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q_f9V2K-y-r_Bvci6U9dYPTb2MpVzm9z
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a98e476 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=urdA6OnrAAAA:8 a=zcs0KYa2kuF-uyBAxWkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=vQ8IPYms0FRTZDs_xDyb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNiBTYWx0ZWRfX2iI7nGzphYts
 /nLp1TevJMjYoJjFzvDKKfojcRVNahoy/9F0sNSBMthzJJ1xnk1lHiY4QFvO9Zy39fsYdaHn7be
 8pewa5mTlif/QL7vLhx550pH4FODeRvZIJRslo4vXef2UwY4CZtUmD4gtpWZZpSRiFOiuFKPOlc
 kbgQ6I3N3Rvr+LvK85jQF1coroO1R5hsmSkK+YEzpCY3jCxBz9aUxNi6iDKQI8snhh/OtVs25ug
 xpM5Ju6KPXpgi98ekZxU7m6r1fjxqupijDw34UtJuAhTreCM8Q948aw3CAddvzcOuEXyPIM1J/D
 P0atGvlTbU/YDOmjMhusfXtm8pVUTorNcStIbtdT/bABNsmCC7XYupUJtGBUKd1XwgkHmFvAPvf
 t5GwJvWTJA75PaImrRgEDaYRWyDnNa+wOERKdc+Mvxv0jX0QaxLNFIdNCTE60XrMo53PleJ2r7j
 YoXTti4wvlX0aezaupg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNiBTYWx0ZWRfX16r9+JCCzfaS
 sPAJgd/lJYArbwkksz5MAfJDUoadRvqj+RfGJe1GGlXg9ObUMKSsXRzbziCsmhPsuYm3wMaThP7
 VOXWdTGs5ru3d2ADQEL6xW16g9oLBb0=
X-Proofpoint-ORIG-GUID: Q_f9V2K-y-r_Bvci6U9dYPTb2MpVzm9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030026



On 8/31/2026 11:10 PM, Sebastian Salmhofer wrote:
> Since commit b706fb4e580b ("wifi: ath12k: Use 1KB Cache Flush Command
> for QoS TID Descriptors") a QoS TID RX queue descriptor is retired with
> a single FLUSH_CACHE command carrying FLUSH_QUEUE_1K_DESC. On QCN9274
> that command does not cover the extension descriptors that follow the
> queue descriptor in the same 1536-byte allocation. Those hold the MPDU
> link pointers and are written by REO on every enqueue and dequeue, so
> they are frequently dirty in the REO cache when the TID is deleted.
> 
> After the qdesc is unmapped and freed, the REO cache controller later
> evicts the stale extension lines and writes them back to the old DMA
> address. On a host with the IOMMU enabled this shows up as a burst of
> AMD-Vi IO_PAGE_FAULT write events at 128-byte spacing, e.g.
> 
>   AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0038 address=0xf6e7a100 flags=0x0020]
>   AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0038 address=0xf6e7a180 flags=0x0020]
>   ...
>   AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0038 address=0xf6e7a580 flags=0x0020]
> 
> The faulting addresses always fall at offsets 0x100..0x580 of a
> retired qdesc and never at 0x000 or 0x080, i.e. exactly the ten
> extension descriptors and never the queue descriptor or the 1K bitmap

the queue desc offset should be 0x000, and the offset of the first extension descriptor
should at 0x080. However the IOMMU warning starts at 0x100, which does not make sense ...

> descriptor. The writes are triggered by later REO activity, typically
> a new station association, so they can occur minutes or hours after the
> memory was freed, and the blocked transactions stall the data path for
> several seconds.

then what happens? the new sta association succeeds?
> Without an IOMMU the same writes silently corrupt
> whatever now occupies that memory.
> 
> Restore the per-segment flush of every 128-byte line above the queue
> descriptor, as ath11k still does, before issuing the base flush with
> FLUSH_QUEUE_1K_DESC and NEED_STATUS. REO commands execute in order, so
> the status of the final base flush also confirms the preceding segment
> flushes have completed, and the qdesc is still only freed from that
> completion. A send failure in the sequence leaves the descriptor on the
> retirement list for retry, as before.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Fixes: b706fb4e580b ("wifi: ath12k: Use 1KB Cache Flush Command for QoS TID Descriptors")
> Signed-off-by: Sebastian Salmhofer <sebastian.salmhofer@salmtek.com>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 39 ++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> 
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> @@ -225,22 +225,43 @@
>  				    struct ath12k_dp_rx_tid_rxq *rx_tid)
>  {
>  	struct ath12k_hal_reo_cmd cmd = {};
> +	dma_addr_t paddr = rx_tid->qbuf.paddr_aligned;
> +	u32 off = rx_tid->qbuf.size;
>  	int ret;
>  
> -	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
> -	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
> +	/* The REO cache controller caches the queue descriptor and each
> +	 * 128-byte extension descriptor as separate objects, and a
> +	 * FLUSH_CACHE command only addresses one of them. FLUSH_QUEUE_1K_DESC
> +	 * extends the base flush to the 1K-window descriptor but does not
> +	 * cover the extension descriptors, so flush those explicitly first.
> +	 * The command ring executes in order, hence the final base flush
> +	 * status also confirms the extension flushes have completed.
> +	 */
> +	while (off > HAL_LINK_DESC_ALIGN) {
> +		off -= HAL_LINK_DESC_ALIGN;
> +		memset(&cmd, 0, sizeof(cmd));

unnecessary cleanup since all required fields are refilled in each iteration.

> +		cmd.addr_lo = lower_32_bits(paddr + off);
> +		cmd.addr_hi = upper_32_bits(paddr + off);
> +		ret = ath12k_wifi7_dp_reo_cmd_send(ab, rx_tid,
> +						   HAL_REO_CMD_FLUSH_CACHE,
> +						   &cmd, NULL);
> +		if (ret) {
> +			ath12k_warn(ab,
> +				    "failed to send FLUSH_CACHE for tid %d offset 0x%x: %d\n",
> +				    rx_tid->tid, off, ret);
> +			return ret;
> +		}
> +	}
> +
> +	memset(&cmd, 0, sizeof(cmd));

also unnecessary

> +	cmd.addr_lo = lower_32_bits(paddr);
> +	cmd.addr_hi = upper_32_bits(paddr);
>  	/* HAL_REO_CMD_FLG_FLUSH_FWD_ALL_MPDUS - all pending MPDUs
> -	 *in the bitmap will be forwarded/flushed to REO output rings
> +	 * in the bitmap will be forwarded/flushed to REO output rings
>  	 */
>  	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS |
>  		   HAL_REO_CMD_FLG_FLUSH_FWD_ALL_MPDUS;
>  
> -	/* For all QoS TIDs (except NON_QOS), the driver allocates a maximum
> -	 * window size of 1024. In such cases, the driver can issue a single
> -	 * 1KB descriptor flush command instead of sending multiple 128-byte
> -	 * flush commands for each QoS TID, improving efficiency.
> -	 */
> -
>  	if (rx_tid->tid != HAL_DESC_REO_NON_QOS_TID)
>  		cmd.flag |= HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC;

HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC is used to flush all in a single cmd. since we switch
back to the per segment flush, do we still need it?

>  
> --
> 2.47.0
> 
> 

