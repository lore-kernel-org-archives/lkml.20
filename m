Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196058;
	b=eRiidNs9Jtcn03fuYZCo0joy2vh44OPf4VslFG2IHz8Dli6dO0ugDSh9pFkAM0+l7lnR
	 kSEUdCL2UNrlAnwL+NWf5LjRL70kBBo94/I+1dbpL4TiI5RDx3rAe7hXfez9g4ij/wT4L
	 9Fba8psoB8dEHVBaiyTfB3RMSFuyzLtyi4rX8hf3hbYl0gnbJ3jS60m28F+oYGcAxfjt7
	 BeyMxQHSGSSzyzbrw2O4Dgg9ls4iC/5UpZgbkw8yHNv3Hf9ZLEuVKcuUbRWmMMTipCuqN
	 dhrqk04cbpfQWmpVPozsUBizr3dWMXcIxEpW1ZCpQd09WFIbkxZs/vlE2beX/NOQfCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MztEFkjcvew5LHyVcIf8mDwoXrDxGrkgX1401uu/1So=;
	b=tFDKNUTxZIExbCXsHmwvJ6wzd8bEMIT2Qm4jV5cV33dL1TBzgx19c9OtG+yGZY+s/FV6
	 WTLvdrFkhxMkOvSahkHdnVbpbwMlggUVgM8ZMFHC/RsfjU/Dz35jbK3fyoTzQP1VIgRAE
	 UtVDnDM2Cofg5IaoM59JgWi7//tczVfEaUMrBwcmX01p9XiohivW4GE5B6E4rRJNHStG1
	 cgJ+k0rdGwmRpUeb0tZmSRvAuyvH1zj2BPVbVt12/2yQwjYsgeHK0mwQXf5SI5YECDhZG
	 NV4JuMyfc95MVOKpzhnnQ1/qQi79ycpMWfD/AIJYn8mk2erVoQPIZIXMdiBt5kW76NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vZfghtxz;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DED606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vZfghtxz
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso459368eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196057; x=1794800857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MztEFkjcvew5LHyVcIf8mDwoXrDxGrkgX1401uu/1So=;
        b=vZfghtxzuBCMNWl7s/CWEuwpEUdKhmZ+LBBSsvmJ16z3IAT4SxZukT5kqM5nKVEj8d
         SH8ljiNuDTxRTSOzPz6tfN1PSnLUcotJ46n0pgOgPHIl8cr0ioUv+gJYpmZC9Fa9xNvr
         jxDmzY2YUS2YLIGejF9iniUvmeFmCHkEGgnvOgvYb8MFIQwwmzw47SfRhu2Mmuk5ZI3c
         o8UFbEuFhw+MGtdl8Xe524QSkAjpv1iV3TaB/LS3vY9ynS1XDiIErMqA840fWeXd+Km6
         DGQ9cIOdBbySR/O3BNCwSaUcii8iukDVTJUo5j1y5tD+pmePeu3xNVwExFSmZEmpz5mv
         yKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196057; x=1794800857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MztEFkjcvew5LHyVcIf8mDwoXrDxGrkgX1401uu/1So=;
        b=QpBb+ah9gHMVeLWPeNisg4QurPAS7GZpAa3Ca63gT6DOSGHhE7yiyFdJt+9JUqHebM
         veVDIOhdkYrzJb4ar9WeR6crZdbmSTUO7RQRg+wsSqbBErrJbmbFH/t/KziC+zoDWWSf
         Rczi/S2rQnhylg+wM4F1d14mA25faPgBI8JSAvClQOG5vTO/3BweBB1jNkkYMCJCJXCW
         HDw9JiSiYuOgf00SjzzCR7xalcNGrbpiJLkE04caOAygpebMb2gBAct1C6O8oQj1DMkR
         8kR7O1XMoA7eSdKOO26CMwF+mC5tHO+ja9XzPFo+T7WV+IagzPDuqYXbkJixWC7wqn/O
         O6Vw==
X-Forwarded-Encrypted: i=1; AL+hErEu5bvN0xBA0ygJE/u/fFxrZeyFfD5G1wNUKP6FwBb4eH99vW56/EQDyvE+a6gKrakl9dFDJJpgsT4B3Rk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sHW2TIjOVbuNGR3xMcpA3HxctJgChaI0qMIeojEQLTWPoN4kh
	aXzVIQf92Sv6NKnsnMQBWmewykYrx/vuykXC/cJuV6mJMKnbU9oy6ihc
X-Gm-Gg: AYBFou1ehn6FRrsZ/aM+QF2PoV6Nnf587Tn09wsRYEbuSuyxOcjLpDcClixgbs1dJ7b
	4CroxLdPQiiWLYI+InwjYcRMtQzfDGf8/JOSXO1kbh51IBGaGKTsL4KKDxXBfKNJ90yHbxuuwrj
	1YKDC25ze9ptSBO1WI5iUguQzoBmOEUUIxgKum1qm9wXl0oz7YYtmGdmT5+4RiJ4BCPkUKT3eMk
	3yWcfDZbKGE53+7X/pWFwe2Yauhc0kZ7slx/78CwRAMSImtVjz3yUq9Ei3LUd3hYVIz5gfBECux
	G5YH/8ODHg6Jduceo55/bRo8BWZRg+9JawRcmLvmgfIsI4jLDk4ZzixJcCm/ey4lW0a2HmxLFIV
	HeM22vBKK8GGOjkK00R0g0xnoTTI8zgA16l09JwMw2VaSBHB0CJC9qQFgkOeb12aCJ1EzzN0VWA
	w9EtxnnCPaHDxKoXV0OjyonoRKLV8RwOAgAccKiv7lo0aiVMlvLAo7ACJ9FJG0NNM9lWSgsu2Mt
	yIx3SZwu2ElKEaMVrlNMFCJybJ34tAKNMV8omRCkGZAnbkSrEOKBnLF7NzsVJvxp48kDxp4oarD
	Y/gp3n/VraWir3qbdREFsBbg5o4=
X-Received: by 2002:a05:7301:1c01:b0:369:36c9:5848 with SMTP id 5a478bee46e88-3725d77d5aemr5372886eec.12.1794196057289;
        Sun, 08 Nov 2026 19:47:37 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm9684535eec.12.2026.11.08.19.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:47:36 -0800 (PST)
Date: Mon, 9 Nov 2026 11:47:23 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>, 
	mpearson-lenovo@squebb.ca, Derek John Clark <derekjohn.clark@gmail.com>, hansg@kernel.org, 
	hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, 
	ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vishnuocv@gmail.com, vsankar@lenovo.com
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add Auto mode support
 with dynamic max_brightness
Message-ID: <avEuoeuFSwDUbbgL@ThinkPad>
References: <CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com>
 <a21d1b534d4b7c8cd27811e1c1f5c8be790cbdeb.camel@rong.moe>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a21d1b534d4b7c8cd27811e1c1f5c8be790cbdeb.camel@rong.moe>

Hi Andrea,

Thanks for the detailed report! I actually noticed that the keyboard
backlight OSD started working in KDE after applying my patches,
whereas it hadn't appeared at all before. I didn't look into it
at the time, so thanks for pointing out the likely reason behind
this behavior.



On Sat, Nov 07, 2026 at 11:11:08PM +0800, Rong Zhang wrote:
> Hi Andrea,
> 
> ...
> 
> +CC Qiling
> 
> Oops, this indeed needs a fix patch for backporting.
> 
> Qiling, while you series will fix this, it may be better to add a fix
> patch CC'ing stable@vger.kernel.org to the very beginning of the series,
> so that the fix can be easily backported.
> 

Thanks, Rong. I'll split out a minimal, self-contained bug fix
before the refactoring and feature addition, as you suggested.

I'm still learning the upstream and stable backporting process,
so I'm wondering whether it would be better to submit the fix
separately or keep it as the first patch of the next revision.
Submitting it separately could get the fix merged and backported
sooner, though I'm not sure how urgent this particular fix is.

I'd appreciate your guidance on which approach would be more
appropriate, and I'm happy to follow your suggestion.

> 
> My opinion:
> 
> If auto mode disables keyboard backlight most of the time, it should
> report 0. For example, when the auto mode if backed by an ALS sensor, it
> should disable keyboard backlight most of the time, because most users
> seldom use the laptop in dark environments.
> 
> Same for proximity- or activity-based control, as it only illuminates
> when the user touches the keyboard.
> 
> The ideapad-laptop driver and Qiling's series have already taken this
> strategy.
> 
> Thanks,
> Rong
> 

I agree that mapping Auto mode to 0 makes more sense. Besides
the reasons you mentioned, the Fn+Space cycle on my ThinkPad
is 0 -> 3 -> 1 -> 2 -> 0, as Andrea also observed on the X9.

Mapping Auto (3) to 2 would make the reported brightness jump
from 0 to 2, then back to 1 and up to 2 again, which seems
rather misleading, especially since Auto mode does not represent
the maximum fixed brightness level.

Regards,
Qiling Zhu
