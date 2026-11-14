Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648512;
	b=SwhCFIPS70dLyQXGqnl0UEnm2fs0C4jp74heTfSUe8z/V28Q1nCIRJ+hiEOjD8DUyZU4
	 TtI8gbF1oxsSfaIzD5K6FmrsTOqYYlZO0FJF+s0s0ZhhSw7K6mzmjsSOJ3X86HRkXgynT
	 Tax08gMQFInD299y8ywFyc8zl/wBMQSqqg/2YbELDWO0pIGHoGHO46tU/PKGvJEoGfEKp
	 ZQptTfyP7bd6h7R3bRHoFrHMd83dRF4bJjAV2J39Y1IDY6ufB5+6GPv6fXbI+S0DloBau
	 8kbhiT7OBP0Pw6QysdGk+vk7HN0gjKKXAtrnY7FDHfCgi7KtbhDo94k6RGssiQxUmng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648512;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=BK9OngPoVpn+XwC4wZt1mFgJn/sKmMHZUCgyt9uLEb0=;
	b=1gXvPZBk9998r5IkRyK+wAJAlU5qGQ8vA8iBFuUm8t7C9tusBZ+7MJc6kheMes+CyNOH
	 0g+/IcIS7QFcbHZ7eOH0Ul6tGNMkrRYfityz7PLlAK3WxTIxiSXgb8wNJBhvRsoy6rlhB
	 Sudd47ST32rEOsb7F3eF4n2ayGkIkUSoX0WAaFQ4zNg91vJZRMTL5HmjU243P3xEdX5uK
	 mE6CMT4oZrfUP/LKcqtJJK6dA+Ek9f+QHnT8Iax/DUEMRRfpnzpNjVEeYpizEr0eJWcIY
	 zH6iODeFM/igwZhnrVyErKOw/MhfYGksDbcudqGKIuk3TvVulicEQcPA32rtNH2hSXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6M0VhQg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42891606A32D;
	Sat, 14 Nov 2026 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z6M0VhQg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CA61F000C5;
	Sat, 14 Nov 2026 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648512;
	bh=BK9OngPoVpn+XwC4wZt1mFgJn/sKmMHZUCgyt9uLEb0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z6M0VhQgdub8BoutuQaCN3wyNO0wUQyem4J+cg6lGuJCEAPldf2QuFU5TK2oBo2Pp
	 Hs8ZXPf7Ty1CvbBT+kHrfegJ29bVx9nobPxDL2BtjL1gh2407ZLlyItCDpHDtsUIvV
	 k4B89zBaPm6kh3Rrhjts8pv7CtC+x+CK6taWk4pQYAXUbg14EhFHH/97pTdcYTLe+U
	 qx70285hssf9roxxG8mCO84GWKS6WHQpBW6+CYs1/eLdKAeR3EUyD5g/k1hhYN98rj
	 sQqiomqTGJs9+DYd2A035oVv0nSkTb8h81HwcLIIf/HCnqKnnGmao1t6pilfv59Uh7
	 gXRFEAHfq2FLA==
Subject: Re: [PATCH net-next v8 02/11] r8152: add rtl8157_unload() for RTL8157
 and RTL8159
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Sat, 14 Nov 2026 09:28:31 +0000
Message-ID: <179464851113.2199510.6038830098036518229@kernel.org>
In-Reply-To: <20261110032416.16968-3-nic_swsd@realtek.com>
References: <20261110032416.16968-3-nic_swsd@realtek.com>
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

- [Low] The commit message for "r8152: add rtl8157_unload() for RTL8157
  and RTL8159" does not say what goes wrong for users.

Pre-existing issues:
- [Medium] This problem wasn't introduced by this patch, but older
  sibling chips have the same init/unload mismatch the patch removes for…

--

r8152: add rtl8157_unload() for RTL8157 and RTL8159

This patch adds rtl8157_unload() for RTL8157 and RTL8159. On unload,
power cut is now disabled with r8157_power_cut_en() instead of
r8153_power_cut_en(). The Interrupt Mitigation clear of 0xcf04 also moves
out of rtl8153_unload() and into the new helper.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index d00cc911ae135..bb4106f238a3a 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -9711,6 +9706,16 @@ static void rtl8153b_unload(struct r8152 *tp)
>  	r8153b_power_cut_en(tp, false);
>  }
>  
> +static void rtl8157_unload(struct r8152 *tp)
> +{
> +	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +		return;
> +
> +	r8157_power_cut_en(tp, false);

[Severity: Low]

Could the commit message say what goes wrong for users with the old
sequence? The patch has two Fixes: tags (fd3c7d080df5 and ad2a55b63b41),
but the only reason given is:

  Per the datasheet they need r8157_power_cut_en(), which r8156_init()
  already calls for them.

At unbind, the two helpers change different registers. The old path does:

r8153_power_cut_en(tp, false):
	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_POWER_CUT,
			  PWR_EN | PHASE2_EN);
	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_MISC_0, PCUT_STATUS);

The new path does:

r8157_power_cut_en(tp, false):
	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_POWER_CUT, PWR_EN);
	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_MISC_0, PCUT_STATUS);
	ocp_byte_clr_bits(tp, MCU_TYPE_USB, USB_MISC_2, BIT(1));

With this patch, unload no longer clears PHASE2_EN in USB_POWER_CUT, and
it now clears BIT(1) in USB_MISC_2. PHASE2_EN can be set at this point,
because r8156_ups_en(tp, true) sets it.

This runs from rtl8152_disconnect() and from the probe error path, but
only while RTL8152_INACCESSIBLE is clear. In practice that means unbind
or rmmod with the adapter still attached, or a probe failure.

Did the old sequence cause a visible problem, such as a failed re-bind,
a power or wake issue, or a stuck device? If so, could the commit
message describe it along with the register change above?

> +	ocp_byte_clr_bits(tp, MCU_TYPE_USB, 0xcf04,
> +			  BIT(0) | BIT(1) | BIT(2) | BIT(7));
> +}
> +

[ ... ]

> @@ -9889,7 +9894,7 @@ static int rtl_ops_init(struct r8152 *tp)
>  		ops->disable		= rtl8153_disable;
>  		ops->up			= rtl8156_up;
>  		ops->down		= rtl8156_down;
> -		ops->unload		= rtl8153_unload;
> +		ops->unload		= rtl8157_unload;

[Severity: Medium]

This isn't a bug introduced by this patch, but do the older sibling
chips have the same init/unload mismatch that this patch removes for
RTL8157 and RTL8159?

In rtl_opsx_init(), RTL_VER_10/11 (RTL8156), RTL_VER_12/13/15 (RTL8156B)
and RTL_VER_14 (RTL8153C) still use rtl8153_unload():

	case RTL_VER_10:
		ops->init		= r8156_init;
		...
		ops->unload		= rtl8153_unload;

	case RTL_VER_14:
		ops->init		= r8153c_init;
		...
		ops->unload		= rtl8153_unload;

rtl8153_unload() calls r8153_power_cut_en(tp, false), which clears both
PWR_EN and PHASE2_EN. The init and down paths for these chips use
r8153b_power_cut_en(tp, false) instead, which clears only PWR_EN:

r8156_init():
	if (tp->version >= RTL_VER_16)
		r8157_power_cut_en(tp, false);
	else
		r8153b_power_cut_en(tp, false);

rtl8156_down():
	if (tp->version < RTL_VER_16) {
		r8153_u2p3en(tp, false);
		r8153b_power_cut_en(tp, false);
	}

r8153c_init():
	r8153b_power_cut_en(tp, false);

These assignments go back to 195aae321c82 ("r8152: support RTL8156").
They also look unchanged later in this series, at 20694877fe24.

It isn't clear that clearing PHASE2_EN at unbind actually causes a
problem on these chips. Do the RTL8156, RTL8156B and RTL8153C datasheets
have the same requirement as RTL8157 and RTL8159?

>  		ops->eee_get		= r8153_get_eee;
>  		ops->eee_set		= r8152_set_eee;
>  		ops->in_nway		= rtl8153_in_nway;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110032416.16968-1-nic_swsd%40realtek.com
