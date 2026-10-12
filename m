Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE8833ADBA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779581; cv=pass; b=l22UsEfbpE13rVg1WU5CBYP3OoN78kKQSWHf3ZUHsRzSkQZEZVecp1rnH2wtR3A2ldpl3Y8KVCg2m06pRX7IqrgMkRkoJhv/dqvl9bPhlpYyx9GEsM5L5mZoNTgveOn8+ZG1gU6X3/4P+xLdPJnfVjT+Gpbn8AHcmgljWtMJC6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779581; c=relaxed/simple;
	bh=4vtSZvaiOp1OqQGi4U/HKTevnlYKYeixt/Cf3xR855w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp4RB38eM/0tq0aMyGehcI5FF7qjSXobVREMSmWg15eG1fwcFJyTyv5liggwaxCSF2ZCuX6L0Eq2XVF4JQLEKq3Q5XCe7eJx+EiEzLpCJI042X5nWfO51BXbso0B36gzVdrM4YenkmrJUwyzfeAQZYenMA5CwnmdUS11eGRzNpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9mwUMAQ; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9mwUMAQ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso1195251b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791779578; cv=none;
        d=google.com; s=arc-20260327;
        b=aaOqaps10zj35mgEANwckwPh6JQFO77HleuQ01ykP5XQH+WgqU7wfzSaHfgsiqVoSx
         8n7XgIXcq0HW5DM3BnK367rfdviIbX+BeEz9UHpe7SR14VU3LZlUXd96I7jnnyFAmNl4
         ZpNss5NV00lT82GweocVyhqqFoHCjxhYOOtxHcJcFzf4Q85cCcnFI9tFZ8FrnUOyFWRG
         fGPtO1AtMWwsbhFpwYfJ0Dldi+vFQJrr/HStIG8W/VUbi0/UfnC7bRAN+jvt/7hNlm7+
         ieC+jG9++vH9SfJtj1EAtMWPNCXz3e4nJ0xcoTwKTX9UPJ2TrZhQdeH/Cte16aKkPa7r
         41TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4vtSZvaiOp1OqQGi4U/HKTevnlYKYeixt/Cf3xR855w=;
        fh=KJIKEDzeSFaZh44M82aoPqybBKGPgbRrQXj7X6D3FyE=;
        b=d/vV/6EoI1+dXR+s7uAsWVbz2wPIPd74NtBwnF5Ww0wCU0SjgAgeACnSgtX1UK0z/E
         y04zN9PjDXZdlvNqkZ7+rygayeVAaKuEq6BHw3E3pJcJOSdBCK5bsUDXYWtsF84Fn1iF
         jo/bJYWAnGeMS3ezdaAEeI8kjKCHEs+jzJJMlaO/SMQBoEhKhOEGkGumoLV80TiKmtoj
         Bu6jFLtROyKsAUdCq7vNFdecQ51wJdz5MYCkLwb0lUdtS0BAhVTcd2rEyl+UOONL5bEG
         WnBGDHWdUB7h+QRPeywpX71GcFwID29u+kKp0Nk1d6sg+DgNHEa0rLlZcBYUrUvvdJfW
         2pVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791779578; x=1792384378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vtSZvaiOp1OqQGi4U/HKTevnlYKYeixt/Cf3xR855w=;
        b=O9mwUMAQHfYwkh3y4UhmxjRwW3Mwe/llrellpRvDQSH+SvtnneWoKow0QRzh+D9x02
         +b6/4th60FUUi6xszCf9e2V6Hs3mpR3216Gn9Qbu477dZBf9zv203R4HfGLBPqx2A+sU
         GBJa99+zu+sBb3ZM80nxaKGi4+JRHwR7YYXs7ORMXI18oXQwe9w2ZSLPvRqWTbM9UT5C
         pnkg5h9WkWAjPrpqzsLTHr37kvbOM5MQdcpvRI+Llwb34FbaXSOyskpy/mKA+1o22PsD
         OUf43KVw4vrRjGseOLtSyGBgFAbXLGvEL3mqCb3W6IQI0ziZvlq5x7pXrSdnbHjhjq3w
         oGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779578; x=1792384378;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4vtSZvaiOp1OqQGi4U/HKTevnlYKYeixt/Cf3xR855w=;
        b=cZf2Kv7T0PX1zX3G7Pikh/FWpViukpKkFSZwTCj7vwFGgZq2SAROTh4s0yPE+926TW
         swBkuI/UzFoFIxzKs+IdwpgZGe1shQuzp0gHbLiV/UoXDco/Vcr6peO6X0jtdChuU2cu
         eFYTcn3wvpEdP/HxC3t5ylpQYr3wGXzZ+8cOLhC2ph4Kay8NpMkuBZNNN5iHjs9WNqWu
         DUYwWLyFlkv2/cJPOPaqQ5VH5waVvd5ZMUOlF1dznVk3jfNPRieypSSm5ivLG2niiBVP
         Hgt6bpdTU7t33SLTJISo/aUHy9AbLSAcsJIMcmYTr0AqIuwOorwEWgOQPsG6ExvUEw2P
         IqMA==
X-Forwarded-Encrypted: i=1; AKwUvBxRtnhFgFlRR4w3mx/vBwfo3ldnZ69QtjYAtVCeZ4qOslHFeVAwqxGYTOew57GJffMAqd+06v/t7k2VspA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDe38TsFqEMCUNf9BuwUTUluztPeBXLZkVZ0+n+gz+NQ0uCYiD
	lmYLkT9T7dne1cvMvxGNdPnFq7ywLdR1XMCVOszAieOfnJ3WQXASP7mAwSOa7tTnbo/F4kiiOso
	4fkUSxayfPUmY69gZ7LRRJ+Hv+THd+aAET2ze
X-Gm-Gg: AYBFou0kBHhZ/o/sMZNDMi0THzUtDnLN0WRjG9zCSpP0R/FRejTKVulX/tmn/pJLSuz
	B7p9pEkksW1oiQDbgmhsiL3NofPQPMQaQCzNbenWzW4kA05HCIq+Hbzu2DgGMbGTN3YZGpMXIuJ
	NDjm8W6ttAm0JXPBrkPXYSHdosoLOrOzw5LyIPdvhR9zUlKxG9I8u5r97RNMy4mOvvP9uf7flwl
	0Clv6CGQThmEvvkMA41sr4uWEKlQQ7OaPlln+Kukeo43qMs+WJ28lWJqSHgaX46AK2A/zYf6Wyg
	OtWGISn+vEvhVmQv30jNN8yZYvgsHCxdAtPA8CtUxjTXtmHd/cb4gg4XzTapJJpM8KxRlF2nVU0
	d4J2+yDbzTiiLwPY1KtKjPbYlZ7xKXzDVE9bNXph/LCy1M2rUck0yZQ4TPTtL12B1NPo=
X-Received: by 2002:a05:6a20:94cd:b0:3e0:ee68:77ef with SMTP id
 adf61e73a8af0-3e16bed300dmr7097496637.59.1791779578511; Sun, 11 Oct 2026
 21:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011221350.1690703-1-aliamemis@disroot.org>
In-Reply-To: <20261011221350.1690703-1-aliamemis@disroot.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 11:32:47 +0700
X-Gm-Features: AclHuK9qFT-Zbd8AdSNUSMznPvdN-iVb15eTUFiLiBYW4k5-myRgwjK8jWKP-84
Message-ID: <CAABR9nHp0jL2fQ4w6rkd8Avfj9eD2=05TnxOYeOqGDWDqD=9jQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: core: Use the allocated major number with major=0
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ali , Takashi-san,

>
> Since commit bd8f21876189 ("ALSA: core: propagate actual error code from
> register_chrdev"), alsa_sound_init() only treats negative values from
> register_chrdev() as errors. With the major=0 module option
> register_chrdev() allocates a major number dynamically and returns it
> but snd_major and the devices still use 0. The devices are then
> created without device numbers so no /dev/snd nodes appear and sound
> is unusable.


Note that major=0 has never worked, even before bd8f21876189: the old
code treated the positive return value of register_chrdev() as an
error and failed with -EIO. bd8f21876189 only changed the symptom.

So this patch adds support for a dynamic major rather than fixing a
regression. Takashi-san, is a dynamic major something ALSA wants to
support? If not, rejecting major=0 with -EINVAL might be simpler.

If it is kept, the Fixes tag is fine since the patch depends on
bd8f21876189, but please mention in the changelog that major=0
never worked before.

Best regards,
Phuc
