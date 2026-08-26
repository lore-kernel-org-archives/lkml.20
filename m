Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84138F633
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764666; cv=none; b=urGtDaYzBh3insW+A6B90r4UIwI3DLEQBfumdWkulISTjbfKs/vlB3SXqIVfQrI8xASi1P4GTNvze+DB2Snccd3sifL4svhBta1OHXJ3uDx25jaTEjA422z6lW3GBK8lLfp5UmO6vagJck1mXtN38rNdR4pkQi69q9zY0+qdW7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764666; c=relaxed/simple;
	bh=Vg+UFuV5m2015dxEcjnkurcF+hU9S27hy2MjwD4PGHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI2mpGtXaIlAi053pF+GSa76ieIyN8JFzeo1o1WU27n5TIejw0VPzEPBi65JvgufCQZrZFTVexdijZE4d5oAsUcPhFE2+6SMwBDJIAADZMrTpRNGVoz4H+w/I/W9roj4RWIKDHqknm3xJ4qFQ8NpzZF/2z+x4FtuuVRToazcGds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ddrJ/ESd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cQQLicZS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ddrJ/ESd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cQQLicZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787764655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6yYb0HNz5KGftss5YJcVkpZccia/QhI7Av14y4QDURk=;
	b=ddrJ/ESdufzcOfRrhRK3PKTCiiDZprGyL4EB+lGux19Zktsjqwv75Frqd57KkoC4R4KLcS
	jyLrPc2BQis79/F0etPJDlA0oNR1bEmsbagUfxrx0K6ytOH4LseoaE/l5W76lW5Yyocqyv
	RUmfxlWopqIGdmrBl5GIc+X1GSBB4J0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-EzgDI0QwMKKGGTJ1y_9okA-1; Wed, 26 Aug 2026 13:17:34 -0400
X-MC-Unique: EzgDI0QwMKKGGTJ1y_9okA-1
X-Mimecast-MFC-AGG-ID: EzgDI0QwMKKGGTJ1y_9okA_1787764654
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9372b9db132so108026485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787764654; x=1788369454; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6yYb0HNz5KGftss5YJcVkpZccia/QhI7Av14y4QDURk=;
        b=cQQLicZSxoTv0JUcI+VgSN+d0N5hjpF8m1Z0kDVPDtFXXhyd+bXCaIV3jxwLSYpXP9
         jyuOzPxpTkz8Yk1pIxek04hjaRV+B3n9/lWIO7b4n6bcePtj4Nrb0hac3bWqFL8N8MQG
         vVkmzMAx3a0NMCPRWUI3IwSFhu4vh5/F/XbiCk8BiY/KIOwM4wsWwSzp+wjVM0EUxREW
         qks9DkAF5+pe3qiqDzl+uMr9x+UX7M/Sh1B/8rYaNNT+U+jCBsfEcNSsezEfbyvnYN+L
         /ACpLSPGyfAmLS6zGMnmpR/kmkks0C4wtLwDk3D4pfeZDAApvtQYfNsRd/6XPF8cN/9e
         O+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764654; x=1788369454;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yYb0HNz5KGftss5YJcVkpZccia/QhI7Av14y4QDURk=;
        b=py34KeVTNCd4rJwB/rlKsfIAFoSKVH+XUPmlRGJXhaPYRg4KMLUU+PnXzpIS2Zb1qS
         sMcF312RhIR6h4TBr2h1fqp677aaXRFW/VnLj5qfK1Cu5Ct54FSlX0Lr/JWoweO/zEFL
         l4JlRf/s12iXqmB/FzNwUhaVHz3EjzGdf5RbMlkV1bdjouAftL0WRwQMmR1gq/I2qfHH
         2sYBMStVp+GhvhoURePvb4Wx9yYYbyA+Dlx9GSxH5RnFSGgqENszQXMDUOAa3AyxJYmB
         +1rmnp3AuH0IRYbYDdH/IHx1GZE/IXWHEs1o4jo85az/jOpCEy5bWqT07VCC8ItYJQTP
         Xvmw==
X-Forwarded-Encrypted: i=1; AHgh+RoP1b0eA9DDzhf3WtNVpTo9mWhEuoMWukZgmQjsXTn2CD+BUnBZx2k8QQ5lrK/1LAp2enaNugYSBTXQbXY=@vger.kernel.org
X-Gm-Message-State: AFuF++nlEVhFjuKzoFWnj6guWAIbBEJegDR4Q2YVmNpuqvdiVLi5WReH
	vs1ELD09oiQ+iwv91dFMo4TEsOkPuI2TYFQg5jQH+coRaHgrLq+Yww3q8bn3qPyrvUuFetJ0xDR
	d70UzF0kFVMAY5YFQAwaIVFwcEtFs+hCpg1gV+rJ3h3Wmr/890ebRhGrESt3EJMKgXw==
X-Gm-Gg: AR+sD11FRyTsCxr+k65Vq21I867jrN/7ESttRW8BbaNqchUclNPJGXbtJmS8F+7bXLC
	+kPwWOqZR8OoptGjX3B/PZRF8WeB5lii+4LWnZ+epScX0aHjVuJr0ur9cMjLUf21d+dtgGcVf9+
	sRDY55C31tijjv03ZZWBX6qQ/N/PMVC4ZBvud+EfmpLsxXQCC3WnXozrew3l2a9rqsg3X+ou7ba
	70kjNc4OTIGfQeDz37DJLXwfNf6b894Up+s1KyrMmSt2pvs98BthDMho+64BcYWrvU93ejBtNAx
	G/xUNVADJ31KLbMq/FRybfK5eoh8pdJQgswe0EkwYqipMLnKMvGDF5au6/SqXTnXvsWK6A==
X-Received: by 2002:a05:620a:a4a:b0:936:ce17:dac3 with SMTP id af79cd13be357-93780433529mr609194685a.40.1787764653937;
        Wed, 26 Aug 2026 10:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a4a:b0:936:ce17:dac3 with SMTP id af79cd13be357-93780433529mr609188785a.40.1787764653394;
        Wed, 26 Aug 2026 10:17:33 -0700 (PDT)
Received: from redhat.com ([23.25.77.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e36954asm255124385a.18.2026.08.26.10.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:17:32 -0700 (PDT)
Date: Wed, 26 Aug 2026 13:17:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Lucas Tanure <tanure@linux.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Jian Hu <jian.hu@amlogic.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
Message-ID: <ao8fqstEs01hd3--@redhat.com>
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <aoxjX3HabY0brgXk@redhat.com>
 <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
 <72db2062-e0ac-4c33-b1d1-d1fa5ae4bec8@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72db2062-e0ac-4c33-b1d1-d1fa5ae4bec8@linux.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Lucas,

On Wed, Aug 26, 2026 at 05:42:01PM +0100, Lucas Tanure wrote:
> With Brian's patches, VIM4 does not turn off 4 clocks:
> 
> t7_sys_sd_emmc_b
> t7_sys_sd_emmc_c
> sd_emmc_b
> sd_emmc_c
> 
> This is expected since I'm trying to run from an SD card. However, even with
> these four clocks kept enabled, the board still hangs.
> 
> Complete list with all clocks being disabled after Brians patches:
> [    1.002247] clk: Disabled unused clock: t7_sys_pwm_ao_gh
> [    1.002898] clk: Disabled unused clock: t7_sys_pwm_ao_ef
> [    1.003560] clk: Disabled unused clock: t7_sys_pwm_ao_cd
> [    1.004220] clk: Disabled unused clock: t7_sys_pwm_ao_ab
> [    1.004972] clk: Disabled unused clock: t7_sys_pwm_ef
> [    1.005509] clk: Disabled unused clock: t7_sys_pwm_cd
> [    1.006211] clk: Disabled unused clock: t7_sys_pwm_ab
> [    1.006766] clk: Disabled unused clock: t7_sys_ts_hevc
> [    1.007434] clk: Disabled unused clock: t7_sys_ts_vpu
> [    1.008033] clk: Disabled unused clock: t7_sys_ts_nna
> [    1.008741] clk: Disabled unused clock: t7_sys_ts_gpu
> [    1.009294] clk: Disabled unused clock: t7_sys_sar_adc
> [    1.009929] clk: Disabled unused clock: t7_sys_vpu_intr
> [    1.010609] clk: Disabled unused clock: t7_sys_dspb
> [    1.011186] clk: Disabled unused clock: t7_sys_dspa
> [    1.011792] clk: Disabled unused clock: t7_sys_a73pclk_apb
> [    1.012554] clk: Disabled unused clock: t7_sys_pclk_sys_apb
> [    1.013213] clk: Disabled unused clock: t7_sys_rsa
> [    1.013811] clk: Disabled unused clock: t7_sys_mipi_isp_pclk
> [    1.014529] clk: Disabled unused clock: t7_sys_mmc_apb
> [    1.015107] clk: Disabled unused clock: t7_sys_hdmirx_pclk
> [    1.015819] clk: Disabled unused clock: t7_sys_i2c_s_a
> [    1.016429] clk: Disabled unused clock: t7_sys_hdmitx_apb
> [    1.017109] clk: Disabled unused clock: t7_sys_i2c_m_f
> [    1.017740] clk: Disabled unused clock: t7_sys_i2c_m_e
> [    1.018379] clk: Disabled unused clock: t7_sys_i2c_m_d
> [    1.019018] clk: Disabled unused clock: t7_sys_i2c_m_c
> [    1.019657] clk: Disabled unused clock: t7_sys_i2c_m_b
> [    1.020296] clk: Disabled unused clock: t7_sys_i2c_m_a
> [    1.020940] clk: Disabled unused clock: t7_sys_i2c_ao_b
> [    1.021585] clk: Disabled unused clock: t7_sys_i2c_ao_a
> [    1.022236] clk: Disabled unused clock: t7_sys_pcie_phy
> [    1.022885] clk: Disabled unused clock: t7_sys_usb
> [    1.023482] clk: Disabled unused clock: t7_sys_pcie
> [    1.024088] clk: Disabled unused clock: t7_sys_spicc1
> [    1.024723] clk: Disabled unused clock: t7_sys_spicc0
> [    1.025345] clk: Disabled unused clock: t7_sys_g2d
> [    1.025940] clk: Disabled unused clock: t7_sys_spicc5
> [    1.026569] clk: Disabled unused clock: t7_sys_ts_a53
> [    1.027197] clk: Disabled unused clock: t7_sys_ts_a73
> [    1.027825] clk: Disabled unused clock: t7_sys_spicc4
> [    1.028454] clk: Disabled unused clock: t7_sys_spicc3
> [    1.029085] clk: Disabled unused clock: t7_sys_spicc2
> [    1.029710] clk: Disabled unused clock: t7_sys_aififo
> [    1.030339] clk: Disabled unused clock: t7_sys_uart_f
> [    1.030967] clk: Disabled unused clock: t7_sys_uart_e
> [    1.031595] clk: Disabled unused clock: t7_sys_uart_d
> [    1.032224] clk: Disabled unused clock: t7_sys_uart_c
> [    1.032857] clk: Disabled unused clock: t7_sys_uart_b
> [    1.033482] clk: Disabled unused clock: t7_sys_eth
> [    1.034077] clk: Disabled unused clock: t7_sys_audio
> [    1.034694] clk: Disabled unused clock: t7_sys_ir_ctrl
> [    1.035333] clk: Disabled unused clock: t7_sys_msr_clk
> [    1.035972] clk: Disabled unused clock: t7_sys_spifc
> [    1.036596] clk: Disabled unused clock: t7_sys_acodec
> [    1.037218] clk: Disabled unused clock: t7_sys_smartcard
> [    1.037880] clk: Disabled unused clock: t7_sys_am2axi2
> [    1.038518] clk: Disabled unused clock: t7_sys_am2axi1
> [    1.039157] clk: Disabled unused clock: t7_sys_am2axi0
> [    1.039796] clk: Disabled unused clock: t7_sys_ampipe_eth
> [    1.040468] clk: Disabled unused clock: t7_sys_ampipe_nand
> [    1.041155] clk: Disabled unused clock: t7_sys_deswarp
> [    1.041790] clk: Disabled unused clock: t7_sys_gdc
> [    1.042385] clk: Disabled unused clock: t7_sys_cec
> [    1.042981] clk: Disabled unused clock: t7_sys_aucpu
> [    1.043600] clk: Disabled unused clock: t7_sys_aocpu
> [    1.044217] clk: Disabled unused clock: t7_sys_mali
> [    1.044830] clk: Disabled unused clock: t7_sys_ethphy
> [    1.045451] clk: Disabled unused clock: t7_sys_mipi_dsi_b
> [    1.046123] clk: Disabled unused clock: t7_sys_mipi_dsi_a
> [    1.046795] clk: Disabled unused clock: t7_sys_dos
> [    1.047390] clk: Disabled unused clock: t7_sys_ddr
> [    1.047991] clk: Disabled unused clock: pwm_ao_g
> [    1.048565] clk: Disabled unused clock: pwm_ao_f
> [    1.049135] clk: Disabled unused clock: pwm_ao_e
> [    1.049709] clk: Disabled unused clock: pwm_ao_d
> [    1.050283] clk: Disabled unused clock: pwm_ao_b
> [    1.050857] clk: Disabled unused clock: pwm_ao_a
> [    1.051454] clk: Disabled unused clock: rtc_dualdiv
> [    1.052038] clk: Disabled unused clock: rtc_duandiv_in
> 
> Also with the patches the disable happens 0.5 second later, from 0.5 seconds
> after the boot to 1 second after the boot.
> 
> I am still investigating what is missing a consumer or what should be
> labeled critical.

I've seen cases where a clock is modeled in Linux, but isn't actually
used by Linux, so it gets caught in the disable unused clocks sweep.

Does the board immediately crash after the disable unused clock sweep?
If so, you could add a log statement, then 1 second sleep in
clk_disable_unused_subtree() and wait for the board to crash.

If you can't get timely help from the vendor, then you can add
CLK_IGNORE_UNUSED to all of those clocks, and slowly start taking them
off in batches and wait for the crash.

Brian

