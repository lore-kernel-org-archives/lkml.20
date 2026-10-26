Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793020677;
	b=ysxZ4b4wdT0LJE2ZC0Pd3ilrY4ZCJfkKkqz5x15mV1w+6AGfcjHa1dy95RlGd2C/dGiO
	 WFIpzZ9JqX3iBbcAiFMysQ9C48L4DEieaRSgI6xQHxpwtl4XUy2DdxrsO5dZ2wFuJZJ//
	 DVGXMJ5ThJkmy8yrhOYMmxez08Uup9U9dOuLta9yU8Xl1m2b5wCreDirEdwtnMxx1p1Ms
	 VRJzlv8jWfzEeOex/gHEgt7fkpdg2o2YOhtStM7p7Rexhq+VhXJU0jHysxjR+8SPN+eIl
	 wJup0ODrevdz7IlAeA+ykshpdw1HmZkZE7jY5pe6vLWsDZXzilP1i5FhACdXbtUH25Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DYT+M8Uk3V4J/Z/IRTpt1/3J1OMBoKzUZaILDtmUKj8=;
	b=Y1zeghERNRQA3oz1Aziq73er5G3lWuUma30feoGxlPxNREqEsGmapcA8cdGrShOT9sc1
	 v4/tH70xCCP5qBiiPy5KPErUt12MBHRb9gy86tN5rD7qkyzB36I0RtXgXV1+xxY74ZYUg
	 LLjDjrbP0npHJJYtozsNDmFXWhSaMtlzkshiyOPIgp3Zxp5QCMtUiilEUky/+5La00Zw5
	 EeU8TRzf7l0UCpMFi8QZF/JCc6AAFEnYspTeQqwfwQiGovZ9Wi1KapccBTs/d4wPbNjAo
	 lzpMutmUP8Cx4IEbiSEILon+MwYh7X3G3hnoiWIKAurMtM40ZINHHK3xuhXP7RaLktQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UJfTyFeO;
	arc=fail smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B78606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6B78606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UJfTyFeO
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2af4c8d00so314998c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793020676; cv=none;
        d=google.com; s=arc-20260327;
        b=hZBywwPgA6XTcP1S1b4rMk7+zmlJVmTvXdbTivUJD7SzP5sEXXzFRf55/a8P3kuzot
         5lSMZShHpfVzbuSE9EYP0JXoqa7EDtGYKC5gVLlXVMkqselUGSlK3w5iVRuQO4LOv1Ot
         HLza1emSQFrm1wbRTk9Kfc2sE5izZYv7oW/nolgpYVxWTv33jTLjgbR8wT/jXm0+QdXO
         xpF1DU1Nj7MuvRNR0MlpTJQ2NkpvoQmgdbvMPdnlha4OBHwmvWEuxn1/0OXNUEZde551
         eREiRVUgA3v2nc49RT3pGLqKvylkpYFtUuYKJsscA+FYE0GCAcoiDa4Uz1LZjnM9ddLg
         tT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DYT+M8Uk3V4J/Z/IRTpt1/3J1OMBoKzUZaILDtmUKj8=;
        fh=WXadGOff4wq2JMZtdqP8GjjX/PP0I39PR6vBEYwotpE=;
        b=Aj/Y/Yw2CuQeo2dRTKt63zIuW7aaGW/hVFQ7Ir0TmeYF5gMorwcb4qwGtKuocx4pcb
         diaykpD2MUoPb+qVLjC3hfC+7VdJ21HhnSdtv4wEMJZQqRSL2gIooI4g3UAZ6brUvrPx
         nCSX8NYlIfho2mCshQnqPwl3uhcF2sre1G1Xbfqdu2txmenE5Iz8BDg1B2zpxfiXw1zy
         Yji55wUIb2SJwPAjE2qMdSw09Tr7vhSCAbhGEePhTQ4FY44p7CBPjSU5YhHHuWrWOrh7
         uu/TZ4S9oZRI4SFN7NItWxVaeE4JIiLXFRF4venmErdz/tolqHvTPJr0VwbRVBS5aNNy
         XY4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793020676; x=1793625476; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYT+M8Uk3V4J/Z/IRTpt1/3J1OMBoKzUZaILDtmUKj8=;
        b=UJfTyFeOcWoDIfrWhSY6D3p0AiPZ93DBhEDONKiIzMoxI+M0o8/j/hfUdZhYrOd7Sn
         mOf2Ur5rwjvPIGHAbM+wfiuhLwI4Uv0yUGGagErKu06bftpHNfhPh+vSUrtX9Mduulmf
         DQH7dDpOup7QZv8HTsOBvGlFUnYcRGyvFi47lRexe+PfxQyLgpFThI4vblZeS2neFz0c
         r7M6DmMi9D44fngfHRWFtq3WfeFpGFEzGfYfzEGvGl6XWiwI/btqUyg+Pd4njNQ7+Izk
         cfmSd55J3YUWv0Oujj8BNIK93MR8Lx5ymtj1E7dljeF55Q+25PBfnxVgpWqECa7d5zcF
         CAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020676; x=1793625476;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DYT+M8Uk3V4J/Z/IRTpt1/3J1OMBoKzUZaILDtmUKj8=;
        b=sQ30YZEAcQccungY0xPhcCEBljYABKCdldHmvo6KNuJH18WvV2lANt70tUICagRWx2
         G/AqlH9T+0GqY7C1oqRCKIK6H2fXWfMgISoQJNqJpXKqav1o0Qyc/KU+riKZzk5CtftD
         2EY9XGBbxeT18UOyLYGnWtTaxLKuAXqH4a1s06kPF/+Kgyq2tqWVt3hmWI6qVK51Q1DD
         kLEr80Se4L33aR/COYa69RXu4Povg9b25phbsmPPxToqczGhp7e2gMUYducu+Lu0/fca
         nlGaHDQGdbeuJ9MiBVTmuuA+vgSwa/h8si7Buy7QT0OULx2Sed00bpIHlkhCGWssQ0u5
         UlEw==
X-Forwarded-Encrypted: i=1; AKwUvBx8VNboREqRyRiatB6WsAT5dpuB190OPU+eDlOYWHMsg3VSMlrO/6A2AUuuHeDComTIUMTv1bdONUFVI+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhI1lE9X31+VvG50F07sgooi5DUdviSw/EaauYL3yTAHNFwvTl
	UaVFQN/EiCpdzJddHl89CxH3wj62yxNpg8GQSyg9SAIt4389AH36/NPh0AeP6ivSVIl5h+fyE1o
	oHSdWMoRU7Wz3FOeUYpGb1BK18NmdFpk=
X-Gm-Gg: AYBFou2wIY2aJ6hHpIWZ5Hhg2gkSoS+RTJQNBos09V/lLmO9muY1PYF1tm8Wjm0awXi
	elH4WFVHC/7ISDGZZC+/A/56hNoMEYt+AgNhHA2GQ8ZICTtA76NNNcM8/7xUynUOxA3q2tcqoCw
	kH+abd+zbuNTYe8+SYQIE5L0jEtYgGfO1ef54+o6qhKKQki3oaiDowzHXMQQj3UjMC0faC30lgJ
	aZnCDGGCFMsk0xiwWI46+w8VkLtw4D5OxNkQDMLNzUTG82e38nz9MB2owLjX7LvSSxHvsj34t9f
	Rn7x9FLGusv9YF0g81Ulh8U9tc3UtsH+XnihhhuZUSIg2KnGCKOJbYGvm92hYA1S+jJms989Zc+
	qLxIbMoeFTKQxOT2muIXIOJqsgd13Cg23MCL4
X-Received: by 2002:a05:7022:eb57:10b0:163:bee9:b250 with SMTP id
 a92af1059eb24-1993552efefmr11334057c88.22.1793020675923; Mon, 26 Oct 2026
 06:17:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022103821.89552-1-timur.stukan.linux@gmail.com> <179301247732.3134.17655450292431284280@kernel.org>
In-Reply-To: <179301247732.3134.17655450292431284280@kernel.org>
From: Timur Stukan <timur.stukan.linux@gmail.com>
Date: Mon, 26 Oct 2026 15:17:44 +0200
X-Gm-Features: AclHuK-1hlvBxosq_mvLsNV9n4GELniIQBfNw9d2o2fMPYw7Z_WcD_egBiiNOVw
Message-ID: <CAF+_u5B+=MVHLJ6QyDn4BO2cLM8PTYsbvAAwOHumQGDqPK+a7w@mail.gmail.com>
Subject: Re: [PATCH net] bonding: fix missing down path on speed/duplex
 failure after FAIL->UP
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, liuhangbin@gmail.com, fmancera@suse.de, 
	jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 13:01, <netdev-bot+sashiko@kernel.org> wrote:
> > +                             if (slave->link_prev_state == BOND_LINK_FAIL) {
> > +                                     if (bond_miimon_slave_down(bond, slave))
> > +                                             do_failover = true;
> > +                                     continue;
> > +                             }
>
> [Severity: Medium]
> In 802.3ad mode, does BOND_LINK_FAIL always mean the slave is still in use?

Good catch. No, BOND_LINK_FAIL does not always mean that slave is
still in use, bond_miimon_inspect() follows that rule but
bond_slave_netdev_event() does not.

That is not new behaviour though, before this patch it could be reproduced also:

Take the 802.3ad slave in BOND_LINK_DOWN with a non-zero last_link_up.
Its carrier comes back and is lost again before miimon brings the
slave up and driver still reports unknown speed/duplex, so the
bond_slave_netdev_event() sets slave as FAIL, then in
bond_miimon_inspect() carrier check fails and link_new_state is
proposed as DOWN and bond_miimon_commit() runs the slave through the
full down path although it is already down, with the same
consequences: link_failure_count incremented, a notify event, dmesg
print and a call to bond_3ad_handle_link_change(). This patch only
adds another way into that path, when the carrier is up but
speed/duplex are still invalid.

The root cause is the notifier using the last_link_up rather than the
current link state. I can fix that with a separate patch that sets
FAIL only for a slave that is currently UP or FAIL, either as part of
this series or as a follow-up.

Anyway, I'll wait for Jay's feedback on the overall approach before sending v2.

pw-bot: cr
