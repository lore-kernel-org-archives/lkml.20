Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2F3C3BFA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540905; cv=none; b=N1ySieRjZKIBwl0sj5WJyKbgt0bvFO5GlDDCkQxX8jmuecRNseBYknGHeLKAIpe8S99XNDc6mASSPn3iydPHmgBWER8yEBcNvhl5seBLjzM1k+sqara+RuOvnaa2pJ9FdoqT8tX+lIRbXh16fmx/ON8swUcDhL1mKjCdB/7PHms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540905; c=relaxed/simple;
	bh=eTmAXg31VNeW1A/mQ3jWF7vViqWJe+F6234hkHa9mwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjYWzA8EE6SS9oC4VEq+gQDd6yCMuHRMddgrsRUHukT65Fm/D0T2p1BA70d7MajCQDIWhCg2YTn5DT026QjlCrdSTSORK14aE3xkYF3q3snayqLqG+Z5fvV3R6zrLgbdB99OtfrjxRnx/uk/3yUqT/OiMmIGb9+HRUkbolj+ctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgT/UU36; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgT/UU36"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1210527a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788540903; x=1789145703; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ueLkYjRt8WEfZc9ftx07Xs3c84pGJV/3ghMQ4dkAA4=;
        b=DgT/UU36ZWX2q8GgoPGUsCwwVJMCW2wAyddaqNBS2GPhwpQxyDWks73q26OBt2AuiY
         Q+rfmcasep/kLoUYmzE4/KXJLQt77/wKaf+KQSEIpTltcawIQfHEL756uMDJRgrZhL0x
         9eM34uR9G4sxGz++476cSqLtkGkG3oM24wzBVte2lf9tONHJcYcymNKLbpf+tuzKVpJG
         uerviTM0H6xWSZjFlh8lIgWcN9f2WnG03UJQFlbcIB03QjJbNkdvHQoGcnhMetaI4j70
         s+qfGNihYFwN95cHjIAFw7CW9murdxI/PSzMmReJwDCQ6CrhqcW19BHZZDUBMj4bs+f8
         vriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540903; x=1789145703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ueLkYjRt8WEfZc9ftx07Xs3c84pGJV/3ghMQ4dkAA4=;
        b=ErReSWQZNdoOw3vYczH4sgAD6L26nweC+6k2zzyTibcc6YmM+/Gcm4Zf5wxXJmuE3g
         nHDneoEBwqcaXrb2rw5GjOsKK0O5+4rn9d9uAR/Xo5mrR6RQWSjtiAz3n3Vrk2zgvyKx
         Qn3eOwxY5TMsPBdIU/tUyBfxAkEJvpTZRPPCKGtyGK9MsQir1vLTlpgu1Nw270BNOJJg
         GGzrrsn4hNbH0gClyZKrSL2LH4TFjPZMcDBEi5vlvDw2xSp1RCRWY7H3oT6RIe61q0v+
         YKHYkQODacAuhax06vKYDo5QvA5AEfAjOsJEYVSCTsmYKegfKrKzV6qP4NQBIlQ10bPJ
         tzWw==
X-Forwarded-Encrypted: i=1; AKwUvBz7Uyayce30AxkFJ5Ads4n5bgt9fHScmu2CVW3rmhp3Osq9VbEbRZMnZwqEw+rNSwFFi7+Anyl3o5Pbs18=@vger.kernel.org
X-Gm-Message-State: AFuF++kVGD2Lfa67OwZEaoqTkUPY08d41/oKFn4lvRwlmlCpUCxb9hWG
	jTvVWDSTWX1iRn3XHKEtlKS3jo+pIZb1tDXTTkNfnjiyRNHo1oFontrz
X-Gm-Gg: AYBFou3oSWJax/9VpsCEh40mWKeDr2bEa/xsH90955zIubaw2JdZ0wEhaJX53VhrrOZ
	yRUaHpevUfRw2n62JDiQ88X4RD5CdAolwUsB3CetcnO4GQu7ObzhsdWZAf74hHQ2VYOMZ3Yw43+
	Eqg7NRUHqj341dT/Wt8jN+BvVjGxinBlkBOVtILA5Kv7uvAW9FB/JO5+H2c8F2iF9l/dWe9BHdu
	dxLcLH9/85Woky2FN3MUAnQMmJjTEn05tx62m+iPsJJSZKRyUfjSPajQ7dKs2ltJzs5U9vnc13c
	KlBYRBjHpFT2T/ACbq2ldrU+DZ2gjIyByA8o3ubL2J7Xwvw4TCk6uyLbZYiXzZkIB0Y8onwEce0
	2k1jByVf0TxfHC2QnIUQujX24fv5r7X/fzyaNDv9XnvWRqRjP36oYYoToU/dhCjsewSik2HX05/
	xQ8wMbIVZ2bv4LU0Ef5EzaQqTX42e3NU32mAcmy/QarXyxlEhb8yNK4fQdMlSl0/KluevMPQjK5
	AFWl+3pA+MU9m97I5AIKnQ1LyGaTnVx8R9kHfk2u0TlPLZzI9n08F3X4g==
X-Received: by 2002:a17:90b:2f87:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-39b260fe42amr10923913a91.5.1788540903054;
        Fri, 04 Sep 2026 09:55:03 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2a6cb7c8sm1347854a91.1.2026.09.04.09.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:55:02 -0700 (PDT)
Date: Fri, 4 Sep 2026 22:24:58 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ShaunV334 <shaunvarghese43@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: add cTGP and PPAB support for Omen
Message-ID: <apry5R9nzCJ3niGH@archlinux>
References: <20260903195626.39391-1-shaunvarghese43@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903195626.39391-1-shaunvarghese43@gmail.com>

On Fri, Sep 04, 2026 at 01:26:26AM +0530, ShaunV334 wrote:
>From: Shaun Varghese <shaunvarghese43@gmail.com>
>
>On supported Omen systems, the GPU can be limited to a lower power
>limit because cTGP and PPAB are not configured when changing the
>platform profile.
>
>Configure the GPU cTGP and PPAB settings through the existing WMI 0x22
>GPU thermal profile interface. Performance enables both cTGP and PPAB,
>Balanced enables PPAB, and Cool disables both.
>
>This allows the NVIDIA GPU to make use of the additional power budget
>provided by the platform, improving GPU performance compared to the
>lower power limit.
>
>Tested on an HP Omen Transcend 14 (board 8C58) RTX 4060.
>The GPU was limited to 35 W before this change. With cTGP/PPAB
>enabled, the GPU was able to reach and maintain its boost clocks, with
>power draw increasing to 57 W, benchmark performance improving by
>approximately 10–15%.
>
>Signed-off-by: Shaun Varghese <shaunvarghese43@gmail.com>
>---
> drivers/platform/x86/hp/hp-wmi.c | 30 ++++++++++++++++++++++++++++++
> 1 file changed, 30 insertions(+)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index b2773fc1aca4..54887a476c8e 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -1771,9 +1771,15 @@ inline int omen_thermal_profile_ec_timer_set(u8 value)
> 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
> }
>
>+static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
>+					    bool ppab_enable,
>+					    u8 dstate);
>+
> static int platform_profile_omen_set_ec(enum platform_profile_option profile)
> {
> 	int err, tp, tp_version;
>+	bool gpu_ctgp_enable;
>+	bool gpu_ppab_enable;
> 	enum hp_thermal_profile_omen_flags flags = 0;
>
> 	tp_version = omen_get_thermal_policy_version();
>@@ -1787,19 +1793,31 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
> 			tp = HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE;
> 		else
> 			tp = HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE;
>+
>+		gpu_ctgp_enable = true;
>+		gpu_ppab_enable = true;
> 		break;
>+
> 	case PLATFORM_PROFILE_BALANCED:
> 		if (tp_version == 0)
> 			tp = HP_OMEN_V0_THERMAL_PROFILE_DEFAULT;
> 		else
> 			tp = HP_OMEN_V1_THERMAL_PROFILE_DEFAULT;
>+
>+		gpu_ctgp_enable = false;
>+		gpu_ppab_enable = true;
> 		break;
>+
> 	case PLATFORM_PROFILE_COOL:
> 		if (tp_version == 0)
> 			tp = HP_OMEN_V0_THERMAL_PROFILE_COOL;
> 		else
> 			tp = HP_OMEN_V1_THERMAL_PROFILE_COOL;
>+
>+		gpu_ctgp_enable = false;
>+		gpu_ppab_enable = false;
> 		break;
>+
> 	default:
> 		return -EOPNOTSUPP;
> 	}
>@@ -1808,6 +1826,18 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
> 	if (err < 0)
> 		return err;
>
>+	/*
>+	 * Configure GPU cTGP / PPAB through WMI 0x22 according to
>+	 * the selected platform profile.
>+	 */
>+	err = victus_s_gpu_thermal_profile_set(gpu_ctgp_enable,
>+					       gpu_ppab_enable,
>+					       1);
>+	if (err < 0) {
>+		pr_debug("hp-wmi: GPU cTGP/PPAB set returned %d\n", err);
>+		return err;
>+	}
>+

Hi,

platform_profile_omen_set_ec() is used by:
1. omen_thermal_profile_boards[]
2. omen_thermal_profile_force_v0_boards[]
3. omen_timed_thermal_profile_boards[]

Not all boards in those lists support cTGP / PPAB changes. Forcing WMI
calls in potentially unsupported devices can lead to failure in switching
platform profile as an unintended consequence.

This is why hp_wmi_feature_boards[] array exists in the first place: for
devices supporting cTGP / PPAB changes (among other special WMI calls). I
think you should consider moving 8C58 from omen_thermal_profile_boards[]
to hp_wmi_feature_boards[]

In fact, after taking a look at the acpidump for 8C58, as
provided by Big Dru [1], I think 8C58 supports all WMI calls in
hp_wmi_feature_boards[]. Adding it to that list and mapping against
omen_v1_legacy_board_params seems to be the right approach, in my opinion.

[1]: https://lore.kernel.org/platform-driver-x86/CAAC6SV4BY3oXpokdBETs9n-NYoxrENJWp7Qs=E2ZK7=Yz=f4mw@mail.gmail.com

> 	if (has_omen_thermal_profile_ec_timer()) {
> 		err = omen_thermal_profile_ec_timer_set(0);
> 		if (err < 0)
>-- 
>2.55.0
>
