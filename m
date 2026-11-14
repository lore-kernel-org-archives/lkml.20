Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648513;
	b=wrCNEzyW6i1zkFeFbMPLeV0jh4kQ4e1DiJps5QpwIjS3IQwWVDoX93SX6N4Wj14Iv3zm
	 jdXHJU+qguG8KIOWt92FJxGfcMbXttj0qnllD/UcRggs1+yf08RaLaI/vPU66OOVHJ/V7
	 lORR1BbZUM5Bj9tvl6OFMH6vtUQB/CTqv/n9658AADpaRIMSopBl2NejuekIO+httA9Pd
	 puLKFx7q/oMQZEjuwo4C3+Pl2xfalqJHPoLp71CNd+8PiVcFan/DUThCkCJ8CKfNP/iSh
	 t8Sahhlg/m4knPdTDPMXnuZqn7KHcAKk+QTDle/9ZBOQjKkO0jCZnqhUVMqHMWUPADg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648513;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9q7KdoPOJAUBkHe+eMsuTBs/HDctpzeS5tV4z1fwdIE=;
	b=5pPhBzJv2GyY9UHbw7lFO9+qtjFIqeSMcLmuduWvRnSBHduDCPlwWWDbzGlewjK7G7by
	 0FVbmJv/F7wJDl6BoeOCTW1tEf60FwCCOndEcxOEE+Z08daHurJ9TEROVtPcu66PiJXri
	 kPPY9Ny427TNpCS4wsdsVhsPZmhXscEjo19GfiuYG9Xi8phjOVi5LMnd+dan4SeY0e0PJ
	 uu6y1RQ+GboBvtnrG9d8czBV7Rk9lpbxhKb3/k0OxhFJ8OdJeenLanMyx+G2ieZQFRXwl
	 QjHKXya0nWufHg9JyzI/AbgSpGG2r9OQCvht3jRhbk3gTEYCaLo7XJPY4HfA+z7q3rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLQXIPCr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF73606A89C;
	Sat, 14 Nov 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLQXIPCr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84601F000C6;
	Sat, 14 Nov 2026 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648513;
	bh=9q7KdoPOJAUBkHe+eMsuTBs/HDctpzeS5tV4z1fwdIE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TLQXIPCrbbgGPHmtwaZDTOtNoyDxyw6RCmNNHWW73nor1V9LhhExKAhoEN/2th2ma
	 2VOsgpGfNipo3ILFUuhg9NAFZqVRy3SQlRzQZwz7d/NVGsf/3zcIPVjXrxy3Z4cJW1
	 VIyQ8ocXcBd4iQMNpf8XCU1ET4XM4R+1EyGo3znIAukzmt6CYeht2MjN6zGAicnr/+
	 xMz3TqD7xQxuqbk7N2RERy4cH+xoMq0UzBMqZYy9cdb6QJB2X09JgeWXVcvctgZiq8
	 OMGwxfDoEILQTig5C3vCWaccfHt1bZOznvMb2A/eN24vV4d6HnbWO6AgVTcKAhWe5W
	 NP1pd88Hyz+JQ==
Subject: Re: [PATCH net-next v8 03/11] r8152: add rtl8157_change_mtu() for
 RTL8157 and RTL8159
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Sat, 14 Nov 2026 09:28:32 +0000
Message-ID: <179464851229.2199510.6886290228452142765@kernel.org>
In-Reply-To: <20261110032416.16968-4-nic_swsd@realtek.com>
References: <20261110032416.16968-4-nic_swsd@realtek.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] This patch carries two Fixes: tags, so it will go to stable, but
  the commit message gives no user-visible symptom for the old behaviour.

--

r8152: add rtl8157_change_mtu() for RTL8157 and RTL8159

This adds rtl8157_change_mtu() for RTL8157 and RTL8159. It sets
PLA_MTPS from the configured MTU (max_pkt_size / 64, at least 10K,
capped at 0xff) instead of the fixed MTPS_JUMBO that rtl8156_change_mtu()
uses. rtl8156_up() now calls tp->rtl_ops.change_mtu() so each chip gets
its own helper.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index bb4106f238a3a..1517753f843ef 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -6800,6 +6800,28 @@ static void rtl8156_change_mtu(struct r8152 *tp)
>  		       ALIGN(rx_max_size + tp->tx_desc.size, 1024) / 16);
>  }
>  
> +static void rtl8157_change_mtu(struct r8152 *tp)
> +{
> +	u32 max_pkt_size = mtu_to_size(tp->netdev->mtu);
> +	u32 ocp_data;
> +
> +	ocp_write_word(tp, MCU_TYPE_PLA, PLA_RMS, max_pkt_size);
> +
> +	/* Use at least 10K for MTPS */
> +	ocp_data = max_t(u32, max_pkt_size, 10 * 1024) / 64;
> +
> +	/* 16 * 1024 / 64 = 0x100, so the max is 0xff for 8 bits data */
> +	ocp_data = min_t(u32, ocp_data, 0xff);
> +
> +	ocp_write_byte(tp, MCU_TYPE_PLA, PLA_MTPS, ocp_data);

[Severity: Low]
Could the commit message say what user-visible problem the old fixed
value caused?

The patch has two Fixes: tags, so it will probably be picked up for
stable. The only reason the message gives is:

  Per the datasheet they need an MTPS scaled from the configured MTU
  instead: max_pkt_size / 64, at least 10K and capped at 0xff.

Before this patch, RTL8157 and RTL8159 always wrote MTPS_JUMBO to
PLA_MTPS through rtl8156_change_mtu():

  #define MTPS_JUMBO		(12 * 1024 / 64)

That value is 192. At the default MTU of 1500, mtu_to_size() returns
1522. So rtl8157_change_mtu() now writes max(1522, 10240) / 64 = 160,
which is 10K instead of 12K.

For any MTU below about 12266, MTPS is now lower than it was before.

Did the 12K setting cause a failure, such as stalled or dropped TX for
jumbo frames above 12K? Or is this only a change to match the datasheet
recommendation?

Could the message also say plainly that every RTL8157/RTL8159 at the
default MTU now gets a smaller MTPS?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110032416.16968-1-nic_swsd%40realtek.com
