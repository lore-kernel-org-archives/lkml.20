Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649516;
	b=dtHUb/SRELP0eUhdXHn+LOyxpVz5j/hOGl5/+bwM01PwEnOmAJn6b0SETzMzi+Qlz5rk
	 Vet+bhnGBnTSk0k/knCqw+pGCm9Fpij+exqLMZlvAAtGJshc1BXlhwNqgkDI1/hcz03cK
	 0WMkYVH0xkHAevYEelluXiEi/9PxbV2id/y/iIiD70YzLMXUvDC8go2OZtnWaxvPb65YA
	 UEIm/tX8B12/iDWuQghBek3omF5KuqFaVUZXBIBPW39ha6WJWNJnjwXopfQnmNXs4uh17
	 p6Kah+ZbnqcN+//vQFZLeyrrHbyoNiFNcDJ04UO+CAC4SMAc8xM868+ImGWI4RvAt4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=37e47cL8nK91UujMUai9IjESXvG2R6mAt8cHf2aHgUc=;
	b=KpIWBVUB8dP7qR3MwPbaLegja+xumesdadQvbTirCrG9bvgInY5aVgr52Pef6neFeJom
	 4oAJTEDRZHSAd3Fb1DVSyhfvoAA6jOG4Yyryc/C/xzqX00iOLUWH5FjXEX3tTZNe8Xl29
	 6+P9kKpTXl3LrTaI0Gve1IVzC4QP90oBBhpGaRGB0WDWe6GX555ZVIzI4Ax0JiskFWq76
	 RO07uMU+eSUyZcHvvmTOOVikrny5B5EgQiPIMUc4i/IvgfuYRsJSgNjgQ6wdR1mn+6fl4
	 rPhX7rxd74iVMGeB/zW1qI9hKiUrkpM8twmEkMUDiyG0EW6iQFw2TY99qcfxJlUXdvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3hU3zVy;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B17606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B17606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F3hU3zVy
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb5f49a61bso3062715e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794649514; x=1795254314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37e47cL8nK91UujMUai9IjESXvG2R6mAt8cHf2aHgUc=;
        b=F3hU3zVyNcC+H+CmJ06ak6bPg38SHaqt0RdYZWvpTeDkcZ3evsgeSbmX3tYdIDTENR
         pNqCOrvqyIBnw49Cy9vBzNnMFGjKkVkGpvvtu+xrmmyi4/nKyJmiSDvpvGKzjOnN65zG
         M+NK1JOLclCliuCDw/6j3dnkQ1GRdZiN0hk1dM5TBSg+bqxy+SHDDWBBwSliFcSig+v3
         9yxpat0FUgG1ryVQ5Oi2Km3HpRRbaMiZTBgxASY0N2J22rmEJTSQ9WDoxZ5+5wW4iRug
         n7Q29sjNPJqK5kbn+YSavgQvOqbrlnKyKTOGrG6KIdjWdFuuBKKRonsB14GFJo1zMix0
         aH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794649514; x=1795254314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37e47cL8nK91UujMUai9IjESXvG2R6mAt8cHf2aHgUc=;
        b=IP01sOXQQ+XmFUw1yop88beusVCUnDGIV83yav9EAFXMF+p6MynLzHDoc+KoqmbXFY
         ILbqk2mv7oHBf2XdsxG3aCLJgqUeE6P2mxfzkWNHKhfxTKx3NZDpv8ntViwzHmch4zm1
         PI33mxiOnSf8DbdUtL+lrbq8sXbEJnFnY/DJgQHpOzL+cMXQ/CC3MtFywQpkfhzUED2Q
         I/Ke0DLbBkHtw4eJqKqkmmjx0tKKjo88AnX4oHFGq6E//gXR6CA1CtOszbp+t8aUFUXm
         8tOJHNJmaVBiOCHl76xiMrRvQrz4rNWO58dWjyZXRPDbkNk13WjfSUmYmGipSekGt8c/
         xgLw==
X-Forwarded-Encrypted: i=1; AL+hErEDhGPZyVWs4jlc0cc4AtoI3G7eGijqN17TOIX2y7MhDcOxDCvIJdoEvN1Ju8sac3UolTabkSXdi6gwfTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R/veA9icGvRH4STxGSsS+aelC75o4PIjaR/bERA/QypSlKfE/
	vFyc2oKwc9qHp8VLziFPJ3lBCDTYDNTTECfed2MqxS+dcMpYrok3hvJzT+hBsI3nTaAEiQ==
X-Gm-Gg: AYBFou3M5bL8KxUz268I0vob+2w7/+CL+ufmoh4o1hlPUp6E2yvlOnpHCtJX5vNzAu2
	+wDrjn9Wn+F51QcG3xg10P+WMH8NkkGa7L7upkkPjXjID6USjOHkCZp81ni0lM/+sh+cqUP8YDQ
	aOy3l1zO1nLsNqoOuXMqGrAhTXMg43bJG0Jsrnmg+xP43AesmzMlBrP2xywQrHiZKsQWuQwWbDW
	5QPdBOfEw/JKwNA08ZRpKF3n/2y4geWH16VWlF7hc4V12NGJxut/pmhzkBpbQK2kGL7zP8GgOzt
	7GVBNPFuIATG6fTLZH2NjtIXjKwnyUqYij1G0RHhLahzW+h0MfYBTcGc6DJEdE9/lQK9QChqHpp
	pQjuxLwL+XqhYynZ0rjBf9uyH3P76SYavIur5QkOseSHt2OvPTuk8h4e0lHZL71SR/WGfJXY8bJ
	JlSV5+NdZ19XGg7ADoG5QoxIEh7RBsarBEHEZ7uLMb//zOd+W+uKainwcSJkFlyIMbIRp2+URIZ
	dlKQmg/95gVjb+4DCXkzn/MOYlzrypOP1sdViATCH/4xXriiczKhHNRk4AKtsNxfLWQIfULE6BU
	KYPnPeiN8rhqqRh7bzziNvquF1bDUt0/Z9KQiAhEL4ygzbfmcx0ynfsBPemfYEG2/Cz3+KvdjDQ
	=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr120286225e9.0.1794649513834;
        Sat, 14 Nov 2026 01:45:13 -0800 (PST)
Received: from vlw-PC.. (static.18.103.245.188.clients.your-server.de. [188.245.103.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5faf05f8sm45787065e9.10.2026.11.14.01.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:45:12 -0800 (PST)
From: Vladimir Bely <vlwwwwww@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: ulf.hansson@oss.qualcomm.com,
	ulfh@kernel.org,
	heiko@sntech.de,
	finley.xiao@rock-chips.com,
	shawn.lin@rock-chips.com,
	sebastian.reichel@collabora.com,
	leonard@lausen.nl,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 1/3] pmdomain: rockchip: switch off the subdomains of a regulator domain at probe
Date: Sat, 14 Nov 2026 12:45:00 +0300
Message-ID: <20261114094505.401228-1-vlwwwwww@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <733b921576828ca70a3f5048691400130f8a5dbc.1794615323.git.gahing@gahingwoo.com>
References: <cover.1794615323.git.gahing@gahingwoo.com> <733b921576828ca70a3f5048691400130f8a5dbc.1794615323.git.gahing@gahingwoo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Nov 14, 2026 at 04:04:59PM +1300, Jiaxing Hu wrote:
> Mark a regulator domain and every domain below it as off when it is
> added, and once the subtree is complete, switch it off from the leaves
> up. If a subdomain fails to switch off, leave its parents on and warn.

I tested this patch on the board I reported the hang on, a FriendlyElec
NanoPi R76S (RK3576), and it fixes it.

What I ran: Armbian's 7.3.4 edge kernel (armbian/build main, which
carries v14 of the RK3576 NPU series, so PD_NPU already needs a
regulator there) plus this patch as armbian/build#11366 carries it.
The code is the same as this 1/3 (I compared the diff). I did not
test 2/3 and 3/3 of v17.

DT: the R76S DT with the NPU disabled, i.e. no domain-supply on pd_npu,
which is the case that hung. No regulator_ignore_unused, no
regulator-always-on. Serial console attached, warm reboots, PMU read
from the regmap debugfs about 42 s after the kernel started, after
regulator_late_cleanup() has turned vdd_npu_s0 off.

Without the patch (Armbian 7.3.3, same DT): hung on 3 of 4 boots; on
the boots that survived, NPUTOP, NPU0 and NPU1 were still powered and
not idled while genpd listed them off.

With the patch: 11 of 11 boots, no hang. "vdd_npu_s0: disabling" is
in the log on every boot, and every boot reads

               without     with this patch
  0x110 req    0x000013e0  0x000013fe
  0x214 pwr    0x0000003e  0x000001fe

so the three subdomains are idled and off before the rail goes away.
(Bit 9 of 0x214 is clear because the GPU is in use on this board.)

With the NPU enabled on the same kernel, rocket probes both cores and
an LLM runs on them, with identical output on two runs.

Tested-by: Vladimir Bely <vlwwwwww@gmail.com>

Thanks for the quick fix,
Vladimir
