Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792786717;
	b=ULT7LXZCGKxwf0SMGeWQ1Fq+BLDXabG3UXoPN2GkUJgvePYRmDv8/WjMrNf0HN9eSg+z
	 S+1Y9CZxaJfWOZ3O70U7dmEaOU7VH+7Had04rd5y6+XiG9MRowGeMJbvK9CBRxbe5rQr+
	 +SE2Ti1LaucfWv2Ivx2fYaisaZD6i40OitqEbHnzBtz2nsjP28uILuJ3HGLkI1JFNJi/F
	 qZeXll+KfP0Iyl++YV1BkVozXqEYzZT+Z+GoFbzhbvvE5IxiTRhHLtwGJ1aUP4bnl0ZeV
	 YdFKW5QA6w3L9cn2oB3Lm19k65KBg52EnoKHyghwuwYiDhA1aoxggHz8YmphN1zCTlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792786717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XhM9OcXLuX0xqWWgIEsWYnSsV/Ip1IVt2dJP6Z55uh8=;
	b=v7OKa6LuBfYBLbp20XH/50A1788mARInNuH2I738Lhc7+RXhf4acRF1ni7LSk+7VhCEu
	 QANHSaUb0TLNYsYkYMD8uTYPJXJJHap1xOVPpUmkOdQxWsAo800EI0Lki2mD2aWM9zw2O
	 LgBJ0BweZtC0yI569a1Yyi6tni9N4lbgfYUikU9ulNVnRqvM3Q1rRsF7n8F6ep5/rrFhy
	 CD2eFf9jVo77CBGuhO0iIbVOMuQr1+MsdP6EZTevEzvsmeMawQXOjzwUhn2Cgk+JMrguY
	 Yqu3E/f0SbJUL2B2JOFs1qB8vXhPrYE61W9thY4eG1XvgFAPi8cu1C6FTEJ86Wy7QsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="d/zzjHPJ";
	arc=fail smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA360606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA360606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d/zzjHPJ
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab35a9d9ceso1056251fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792786715; cv=none;
        d=google.com; s=arc-20260327;
        b=kjIrfg8jPTK5ayZdptF4lDcF/je9Suyq77W1/T2ze7yBZDsnh/9s6BCJJHJh/jP/EA
         9LVCYuhUQm+RhuElMzECBLYgjbTOQvEqcs03tTFSCTmFL5RkOicy5+mopsELupFty1iK
         ZBs9op2OwoqhQo/QeQv7rrV11Ce7McIgjYtC1gKlmfts5paLDV1WsYeRPfkHKwmrGmHK
         NTey3vg6rTCfhZTS1BLbjJ7ZRHrUEgfxtAgbhXvR5Hy2xq7taxOKvATuay5oadzz0vHQ
         FcSrMcZQafvimx40gqofgksep5zginZkH7Xm/G4d3eZ7xO7gLd1A8OSKguKhbhiNLYL4
         VToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XhM9OcXLuX0xqWWgIEsWYnSsV/Ip1IVt2dJP6Z55uh8=;
        fh=z8MThzKy4/bm5UOn3W4szIX1+E64KcfrooLPV18kBMw=;
        b=VCQaLe3PkDNfSsthuU3MsWA7INJxTdZ4ZsWZtHT7v9SKKYI8vn8Ura2vAZEvB2jAWf
         /2Jptj47RDA+BLsyS0/XV/maw8WxpDhxwjM2QfRLCEw5iYS7DsEIhyAR1mqEPEAH0SzU
         YEE8neWQ69PiihJddYZI23soUu7JlZ2VHufnJODV+JQMnfxkZncI5Gc0sMXRHUwE2LJH
         9ck9sSBResmPjrnP6upqWezZlTKu9V7l+ZDRcfiqduiwyhCBgaXHAoIwrYuVT2z1ACjN
         nzux1Wc/O7gc25MGduWQEvLudaQPIFAm2vF2Uc6c4UuginxDzoz6fMUfrx/qc/d/GkRz
         2aeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792786715; x=1793391515; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhM9OcXLuX0xqWWgIEsWYnSsV/Ip1IVt2dJP6Z55uh8=;
        b=d/zzjHPJZCnZvk7av+z0zRW59lLKwO4DiTPTKuI47UN1SbTg54KgiiYZEsvN8n+xug
         jI77yt2Ulm7AtYiY9lLtBRyJh9+NL7HFrEv4hMxAbQJUivuVhLure9tCxqsoROZzEp+A
         h+/r7Yj6+//z5ed5EOO9Z4SzyB4jZ4Cno5qoyZepEbeONdbW36JyxAWH1hytWZc5goNR
         7qZWsyi+X3MuwvopViDGRxfrQOYjZU9DJUoI1uK2zhctKdlUgoA4vlpMwJseXryxyxda
         FDjgeJtlKcDP4TsfNzWTGhykkl4M8U+4VkbTL+YkBodBShoyFb2e8A6v2UMt5vqcvYAS
         aeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792786715; x=1793391515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XhM9OcXLuX0xqWWgIEsWYnSsV/Ip1IVt2dJP6Z55uh8=;
        b=chS2x0GJNIcXLrLLkuTYTqjht3LXraFkkTChPraCwh+aV9fxMSJG8NSUpl2qhE3zlN
         spfVnt4A8y2diKwzs1vpBpR0NdtNfeNM7jK7XH/U74jJq/1lx+8r2rJ8lNhgZjaYEQ2S
         aZUfrgm4p/62FwGxbiCYMEmLffepuDrEVMGXxPJZSMJYdCFBRxMiTiVKDeek01mAgVVV
         Bt5wVBzN3/p/kKx7g9sEAhuD14brADeS2epClQjyFbCjqAo9Yojee7NM8dyi5o05DXVm
         bVAKEFONC0RAEEnrI2XfV0ctXMnopHI9RVdXxCwyik84001vrvNQU+4IYJL/PmLeCL5n
         UHFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlpemc2qKdJEBAsv1kdNjugOpS1lIZnn8rr1UCPYmlPMVjBImfSIMWeSggRF1jRsqhCGWzK7RwB6WRIQ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQsnNsh5SeGOcHlwwmOcLYB4yK4VMbuEyCmJEpoILufXhGUKSb
	E3b8z3+jY8omQV2ds8dOId1QDMdLt3NO7u4LFtiwiIYBVLK9owXx3Eg/5P0HfGbBT1aoY3TCYb2
	8Y1IxMegMwQp3A5kmGrIHkmcPODbkkO0A4D3m474=
X-Gm-Gg: AYBFou36XuvgNXDQVekf3n81MTTaUG0QO3X0h5qvDq6RVoNg8V29h3I7f791fgwdSMb
	HyIy1MtcPDmk0+fGnkxZFVKKtJMim9v22SzunSz3DHDb6SE0QJP2tY3s/6l2UDqIKb07ccVlLpU
	3IW/zyaH996Mm5OJk4OkjS+G/jGRPfvQ2oIfvM2ToawYRu4xZbpE4dYamqHbGL89wG6EgTGfj3g
	IcE8Jjv+y7QQSM/WvG4uz7PvGWUDG6VirMdxI+Lm8MScv0KVrOpfLGyJP26+t5PtkORbn5Lx6H3
	JoAk6bHie/dwRBgLujUYpjZPM3zaWRHw59VySWD3bHdsidVFKaZOCD2fS9FuN2JotwO3BdaKnr2
	l2QHEdAPddYjHV9L0cf0yvqwrsX58389YxPC6heKmUBmtHtiqNDFu2LEx3ec5TO1qvalN16Dri0
	qtA2xSG1+YzuOwAfnuIF0=
X-Received: by 2002:a05:651c:a38d:20b0:3ab:1864:5004 with SMTP id
 38308e7fff4ca-3ac6f9f52damr659021fa.0.1792786714401; Fri, 23 Oct 2026
 13:18:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <atQ_mXYNqs4tnDpW@wyuan.org>
 <79dd90f0.11f3f.1a15272eff3.Coremail.dzm91@hust.edu.cn> <CAMAsx6eb3X7GLheOaVoumORnvKftFYkU0VHynZYyx9m74+CTTw@mail.gmail.com>
 <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
In-Reply-To: <40aeaf0a-6e04-461c-a507-52f791b45541@hust.edu.cn>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 24 Oct 2026 04:18:22 +0800
X-Gm-Features: AclHuK_EAQno5gp97BTsUaFw5xbfmoJyDrYbxbG_JGUedumrttOcvXcOiHkHcgo
Message-ID: <CAKspUh+c2ZStWkBU6CnhRXEMzqpW81MrbRaTtJtHBDvEfwJ6Sg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Daniel Pereira <danielmaraboo@gmail.com>, wy@wyuan.org, jani.nikula@linux.intel.com, 
	alexs@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, si.yanteng@linux.dev, federico.vaga@vaga.pv.it, 
	akiyks@gmail.com, carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 23, 2026 at 10:10 +0800, Dongliang Mu wrote:
> I agree with this proposal. Ask maintainers of each translation to
> solves these issues first.

For zh_TW, the three moved documents (security-bugs, magic-number,
gdb-kernel-debugging) are already relocated in the series below, which
Weijie has applied to the zh_TW tree and which is waiting to go upstream:

  https://lore.kernel.org/linux-doc/20260929131020.266120-1-chenyou910331@gmail.com/

So no need for a separate move on our side, Daniel, but thanks for
offering. One file is missing from the list: filesystems/sysfs.txt,
whose original is now filesystems/sysfs.rst (zh_CN has the same file).
I will send a fix for zh_TW.

glossary.rst exists only in the translation by design, so the rule in
the guide may want to allow for files like that and how-to.rst.

Once these have landed, I will drop the ":Original:" fields from zh_TW
in a separate series.

Thanks,
Chen-Yu
