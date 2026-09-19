Received: from mail-wr2-f17.google.com (mail-wr2-f17.google.com [74.125.225.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F003230BD5
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789839547; cv=none; b=VeDLx0D8cmBweCO4lUmFuSo79ZGQXV3HWpew8YybQJ4DSLqIk9EedRaYLqeqYqSGWSBOmSibtUJp/yeNstNpBkzO+tbE8ofqVhQ6vfm3GbUuAis7I516ARwZB6WlH3sY42/C5vCAq1Msuh7lejlGqF7CoaSpepzc+5GuXeUH1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789839547; c=relaxed/simple;
	bh=aDvLfzrRHVzY7Tr9+WJLzfUguQi3Vufm2HiQHBwcIPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDzUH3o2b42uWigb+WWoNYwv8xe+yNgAnu69I6mMoKZjZGcSfoeMFXJvXXJ0FcPxvo6c88FA2z352gEFT8EUE+2AtYeeKs3+rLdwvxg6wRKrfb7Y/gvsIpNyKuEJD4kS4COXUwRrrKBjEPMGHkdttb9cdCRcBys8JR+zMOW0l5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eer6wxSY; arc=none smtp.client-ip=74.125.225.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eer6wxSY"
Received: by mail-wr2-f17.google.com with SMTP id ffacd0b85a97d-484366874b0so970569f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789839544; x=1790444344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kb3NePwhd8h9g2zyqPYSNTvlvzKmxXhHsFrfj1sSN/c=;
        b=eer6wxSYmUpW4J+eYMG9skTYNtAZ3f/lBie8PKtRcjCssfGMUUNYzXrnkdbwQ7QTE9
         RAeb07R6p3tAQisOEHb9CRLu/U4maygk0w5wg2ZmBKnKQ5+sRbby1tn3nLpopbiGr83n
         r2VlxTQ3vkZTV/InTnwK31KrxlpNmsUBDj8VpwHnGtGAJkzpO76IK9HBNtXuj4oqKDRX
         6uIS4X+Lwql/iJjrKA4NLPmkZ7uV37W/AOsm8544qhOHtKZlHjfbeRXP4Ykv7jbBXurI
         X+kpPAHO4j7lXgGnOkMQX6JhwGmXAvN0jf8bOco7Mkp79u9Gkbrg/DfcnPZOgsqaAI40
         YD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789839544; x=1790444344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kb3NePwhd8h9g2zyqPYSNTvlvzKmxXhHsFrfj1sSN/c=;
        b=Y6EjuiwVxvVnMfRh4GczuOfDRqjzZMT5ufr9ZnS5G4wUFZgzZ/wosGrkkNBSaJqaFP
         flc6hkrPRoP3fYI2YAq+/xnix4GrkCYs3fEgwOrlgxsWeZo6qTsecjjvSq/mkhlBseaN
         axWwdgq+j2dXDTnQBE9cbgxi4Kvdoth2OuI/uC0bJd3XosQyQ9l9aMPGiHhZkeuucYZW
         2GTm7cJodDKhpXjQDt0MuWA5lAea5N/t9demR0Kuk+HbyWOZez8TptR8x2+8PtsgjmvO
         5RSnvtfoQKC7vmqbJdauL+0Q+xNyrGf6iq9pZimSxR7BScdHjO3N0INCxUrwu60THA4h
         Fq0g==
X-Forwarded-Encrypted: i=1; AKwUvBzqUqeb6g9lP+fn/GW1LH3MmWGRRTZfEF8ykk4ytGMcg9qYAU0K4D/L0TthDtIgz3CVqb7k8r0ab+6NKe4=@vger.kernel.org
X-Gm-Message-State: AFuF++m1axZTSxJVvFMl6VLvUeDz/dhMhpfEOG9KQo/MTswk1enk2pNg
	nghvu5XepkhWNAlEpyOV1idmk9hCRi8g+D/Qp9LI2e9zOwmXBRQXZFX3
X-Gm-Gg: AYBFou3NIKRXSUx62TZ87Y4mAkTfoXDFniAjaiUaQixUYiGJ7yLbkFBrQ9LyzZ2UPuO
	MPpB/SdjGUhDzJaVmZgCPfIoT9sqsyltRwONCrPhx3MN71rxRFFSQY4Qq82UKcx/AVpoNWKzdjP
	Ny8xkso08ZEfun2H2a7mxhQ5e85DB/1CD+sRrB5WT/qPgh706KFFX/pwhrMGywyv5iVlO3BSAxU
	53F+yYafIB13JcTY549KjCWb5m4KoENT4ni8nfJUE8PjFBHEu8j9TfR0l0CZiS26O+rYRQjegTw
	+UPs9cwsOL6EyCKMBlrm+93cDcpcIyN1VkH0kUgqJVhpuwjbaxvyIAe6kdnDNH3DKWEXlR18ylJ
	HlJzk5c/Mjk2t+LEi5PSr1dRwQ6i880iMTtVcQNp7lxz3TztmBk+2EVPCz8bgAmG6RMWwz1/2HV
	QAUayJ2WgrAe7wv2XF289kMqJHrVVS8jtEGZCU4lnwVCcH0iDqA6tUaWYNmXt9kIKpke/QlAk7/
	Qw7LQ==
X-Received: by 2002:a5d:5d0e:0:b0:487:27f6:a4da with SMTP id ffacd0b85a97d-48727f6a725mr2724663f8f.42.1789839544149;
        Sat, 19 Sep 2026 10:39:04 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460753sm8886436f8f.10.2026.09.19.10.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 10:39:03 -0700 (PDT)
Message-ID: <2f2f2366-bf64-45d1-911d-6a769be9d7aa@gmail.com>
Date: Sat, 19 Sep 2026 20:39:01 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rtw-next] wifi: rtw88: 8821c: disable deep LPS on PCIe
 devices
To: Paolo Lazzaroni <eexto@aol.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Oleksandr Havrylov <goainwo@gmail.com>,
 Gabriel Maia <gabrielvinicius.damaia@gmail.com>,
 Rahul Kumar Rai <learn.rahul.rai@gmail.com>,
 Mihail Dimoski <mihaildimoski@gmail.com>,
 =?UTF-8?B?QXRhIMSwbGhhbiBLw7ZrdMO8cms=?= <atailhan2006@gmail.com>
References: <20260918232801.119348-1-eexto.ref@aol.com>
 <20260918232801.119348-1-eexto@aol.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20260918232801.119348-1-eexto@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/09/2026 02:28, Paolo Lazzaroni wrote:
> On RTL8821CE PCIe adapters, entering 32kHz low-power clock deep sleep
> (LPS_DEEP_MODE_LCLK) causes recurrent PCIe completion timeouts,
> "firmware failed to leave lps state", "failed to send h2c command",
> and hard system freezes when transitioning out of low power states with
> PCIe ASPM enabled.
> 
> To work around this, a DMI quirk list (rtw_pci_quirks[]) was introduced
> and has grown across HP, ASUS, Dell, and Lenovo machines. However, DMI
> matching is unsustainable: minor sub-model variances (such as ASUS
> FA506II vs FA506IH) or unlisted models (such as ASUS VivoBook X515JA,
> Bmax Y14, or modern Alder Lake-N mini PCs) leave users experiencing bus
> lockups or firmware drops unless they manually turn off power saving via
> iw.
> 
> Examination of official OEM Windows driver INF files for RTL8821CE
> (HP and ASUS netrtwlane.inf) reveals that vendor drivers explicitly
> disable deep power saving (WoWLANPSMode = 0, bLPS_PG_En = 0) and enable

Disabling LPS_PG doesn't mean disabling LCLK, I think.

> firmware PCIe recovery, while keeping standard PCIe ASPM enabled.
> Furthermore, other chips in rtw88 (RTL8723DE, RTL8812AE, RTL8821AE)
> already set lps_deep_mode_supported = 0 by default.

What those other chips are doing is not relevant. RTL8812AE and
RTL8821AE are not officially supported in rtw88. (Not yet?)
lps_deep_mode_supported is zero in rtw8812a.c and rtw8821a.c because
rtw88_usb doesn't implement deep PS and I didn't research which
modes they could support if deep PS was implemented for USB.

> 
> Conservatively disable LPS_DEEP_MODE_LCLK specifically for RTL8821C on
> PCIe interfaces in rtw_update_lps_deep_mode(). Standard 802.11 LPS
> power saving and PCIe ASPM remain functional, preventing system lockups
> and firmware failures without affecting SDIO or USB variants.
> 
> Signed-off-by: Paolo Lazzaroni <eexto@aol.com>
> ---
>  drivers/net/wireless/realtek/rtw88/main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
> index 0f23498b5..5bd854223 100644
> --- a/drivers/net/wireless/realtek/rtw88/main.c
> +++ b/drivers/net/wireless/realtek/rtw88/main.c
> @@ -1360,6 +1360,14 @@ static enum rtw_lps_deep_mode rtw_update_lps_deep_mode(struct rtw_dev *rtwdev,
>  	    !fw->feature)
>  		return LPS_DEEP_MODE_NONE;
>  
> +	/* RTL8821CE PCIe devices fail to wake up from 32kHz LCLK deep sleep
> +	 * in time for PCIe completion deadlines, leading to PCIe bus freeze

Completion timeout is already disabled for this chip.

> +	 * and communication timeouts.
> +	 */
> +	if (rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE &&
> +	    chip->id == RTW_CHIP_TYPE_8821C)
> +		return LPS_DEEP_MODE_NONE;
> +
>  	if ((chip->lps_deep_mode_supported & BIT(LPS_DEEP_MODE_PG)) &&
>  	    rtw_fw_feature_check(fw, FW_FEATURE_PG))
>  		return LPS_DEEP_MODE_PG;

However, I'm not saying it's necessarily wrong to disable deep PS for
this chip completely. I'm just objecting to your LLM's conclusions.
