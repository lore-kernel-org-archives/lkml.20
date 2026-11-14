Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648511;
	b=bUCcXVtJJnxwRH5JLoWr2bQB1ls4uNAejM1LEw3hz1bVg1n5e5oSJa/TDsiBigbXon1D
	 6bCpYOFhQJRqag13BHaFmbT3RyJWeauR75Pb4GR1YurdnhqvSbUhqtawewqitUmmzL5HR
	 +h+4fTza0TO21mV0v7gnZZDs7wwiBQqy2cgUF5GIVaaQU57L4Llmrqs83OyAU/CDv4DP2
	 ox42cffT1ciwdejbxn/JfXH5LFJqjoDeaXOu1CtudAFxwRdI9VJi1yJn94pUHhYNgHngF
	 j2vjVpJiVYgvzKO0WU6MWlhIy9ZK+23Wp5J7IlXnKMlr7weNjccDegEpbQqhfV7XBLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648511;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ReAZj9IHOHT0VSZbe4tm6BtH6npKIpgYzWD4aIHiW1c=;
	b=15pti4ioK/Eoq1UL4CNPb/xmV7kT/LmB/HqWn60B8fSwjpJOm1XDuXgtuZpiA2YObxEB
	 qXYsYNI7KgIceP1KpX0u7JLil32/6e5mb6PhmCxDJ+vdQp3+4kEav26Ha7gcJzQQS4Ch6
	 HHz+2ODiq4R05HWTjKnOhu7dcm4A7FO16J5vXKh25a/M28ecGUaCoGD9h3bjzdNXrkyV1
	 AEgphlWwCwaaTAFZQ8Ay80Oh4IC8K00J/jdXJDNGWamUVJo8ml4Fn55vbTcT8RnW2xXNo
	 DnP9uXVI54F5NDpwbD5IejuzXzq4Re9ohvj1wZeH34y08pUaCr++3MSzPsstQ8gYGhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VImuLngl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69011606A327;
	Sat, 14 Nov 2026 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VImuLngl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524081F000C4;
	Sat, 14 Nov 2026 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648511;
	bh=ReAZj9IHOHT0VSZbe4tm6BtH6npKIpgYzWD4aIHiW1c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VImuLngle11GB820MtTNqaVkqIanNtzWe60tyV1yKlKjLgQny/I3B6+oGvgJqe2t9
	 qAzoFiuNL7N+QfQC0HdjkLkMMOSpazT3eyfLQcxKNqjcVUwwsWHGDnAwUx/tcU2wph
	 AYyPu80rmqLL/+yFPxmcC0FxQ0v0DE2b5MOZFRvid233QABaH7AMGQoGafzvbp/lxY
	 6hHWlViYJqD45MvapNQkkGf1xbCfZvgvyZp5UMEQ9ZoWN3EtNXnMk7fSoIAOK2vpq5
	 LXQ4oQeZq+ph1XyxZ1FGiy0cqmIjnPyuUrpq37mmoNa+SkGP43t+LaZUpmle3LW1W2
	 9rQU4eSVZw7jA==
Subject: Re: [PATCH net-next v8 01/11] r8152: fix
 RTL8156/RTL8156B/RTL8157/RTL8159 up and down settings
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Sat, 14 Nov 2026 09:28:29 +0000
Message-ID: <179464850985.2199510.8737117664492189004@kernel.org>
In-Reply-To: <20261110032416.16968-2-nic_swsd@realtek.com>
References: <20261110032416.16968-2-nic_swsd@realtek.com>
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

- [Low] The commit message for "r8152: fix
  RTL8156/RTL8156B/RTL8157/RTL8159 up and down settings" does not say…

--

r8152: fix RTL8156/RTL8156B/RTL8157/RTL8159 up and down settings

This commit changes the register programming in rtl8156_up() and
rtl8156_down() for the RTL8156, RTL8156B, RTL8157 and RTL8159. It touches
PLA_RCR1, USB_SPEED_OPTION, Clear_SDR, the OOB entry bits, the OOB RX size
settings and PLA_MCU_SPDWN_EN, and says the datasheet requires these.

> Several settings the datasheet requires for these chips were either
> missing or gated on the wrong version range in the shared
> rtl8156_up()/rtl8156_down():

[ ... ]

> Fixes: 195aae321c82 ("r8152: support new chips")
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")

[Severity: Low]
Could the commit message say what goes wrong for users without these
changes?

The only reason given is that the datasheet requires the settings. No
symptom is described, such as WoL or OOB wake failing, RX stalls after
resume, link problems, or suspend and power regressions.

The three Fixes: tags mean stable will pick this up. It also bundles six
independent register changes across three chip generations. Without a
stated impact, it is hard to tell whether this is a user-visible fix for
net or vendor-recommended tuning for net-next. It is also unclear which
hunk fixes which problem.

This affects backports, because 195aae321c82 predates RTL_VER_16 and
RTL_VER_17, which fd3c7d080df5 added later. In older stable trees, the
hunks that touch the version >= RTL_VER_16 and version < RTL_VER_16
checks won't apply, and neither will the RTL_VER_16/RTL_VER_17 case arms.
The RTL8156/RTL8156B parts would have to be pulled out by hand, such as
these in rtl8156_up():

    ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_RCR1, BIT(3));
    ...
    case RTL_VER_13:
    case RTL_VER_15:
        /* Enable Clear_SDR */
        ocp_word_set_bits(tp, MCU_TYPE_USB, 0xd3ca, BIT(15));

and these in rtl8156_down():

    ocp_word_set_bits(tp, MCU_TYPE_PLA, PLA_BDC_CR, ALDPS_PROXY_MODE);

    ocp_byte_set_bits(tp, MCU_TYPE_PLA, PLA_OOB_CTRL,
                      NOW_IS_OOB | DIS_MCU_CLROOB);

By comparison, the later patch in this series, "r8152: fix flow control
for RTL8156/RTL8156B/RTL8157/RTL8159", does state its impact ("they could
keep sending pause frames indefinitely").

Could the message be updated to describe the user-visible impact of each
change, so maintainers and stable backporters can judge where each one
belongs?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110032416.16968-1-nic_swsd%40realtek.com
