Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248419;
	b=H3WPkYgTEg28aWxm/lUdQtIWoHXSkWFpvI/lT4ltsrf5v1C71pN1nvp43N12Z5/NMn+R
	 u2FHR5sJxNuef3jus57bapGwio2E+m8H2B1kqpWftwwKbUiMdWqaeRzaRStj7XlJVKxVw
	 bFY55tAKNgl/ztibkl7bT4m8SD9zhX3cu9fpSNsQEfDulDd5YWCwnd29W5JcGPDF2KSxO
	 nU2p4hBagCPgs/+cglRrYZFzwSxpcGQve2n1f8t3WT0Oc6t62dojnD4voJ2zFZwfpfReC
	 Q0Uz3a8tN2k7vPisSmrQ0XBOUy/pE+V9kdNXyqTPgyVTcg5JZnLpuZk7zbLB5oqS9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vrKuO2D1JP4mdnml9ASPpTlclUAIMoHvROGX7/k5V0k=;
	b=yib/JYPm2WhpbH/pYNLiEx4E4VgYLFNVBXa1q4D7qoRp1SZzhNWEwZ49uzqT5LWuCuwO
	 Fz7OKZEhXm2DYONUHIJg8sIC+CL5x8En73HsFlrDiRwl+66RwKHgOPIVW/wyLeHs9hSWt
	 GzzH4096hsoM0I5FuxxdG+1jl7/4dpF1M3yw/iGkS5afLHUb8S7DW69PMSNpq/clfRo99
	 YQvpBvZBSqN9KqW4+L/aPM/1pNNeso8qJMHP0hqIxTFYfdwIcW0vCI3wjxk4gC+O+Eif+
	 0EOILPn9noZKZZqHXydldJJ22Y6I2vlbfNButPSmWIh7+WnCS/86N19cr84Z2YWwUwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwKtwE6x;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE31606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE31606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BwKtwE6x
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so513627a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248419; x=1794853219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrKuO2D1JP4mdnml9ASPpTlclUAIMoHvROGX7/k5V0k=;
        b=BwKtwE6xchZs54QWCq084EsXrBLCEuzQGQFzO4Gx/s8yzwYQUzbBYjDFo6ac2B65/Q
         /pFAeWu/UFBMv9WjMK3PXo724ViUxMEcVqFsyjZF9l3+U08wQONUZ5Q5z4OqthyVZoSr
         cV2QMAKnDePYI2ahCWr7Mk5p304Y4vWQStVNeAIbNT43gtXXJ2x1rx5qXkPPTY4+5vB2
         LSfGRR3ALAD3qXc/LSPfzVtDgGdTwmmA0tkdOGB0DxnVFsG0QfNxUi/YSrMhlCpw0Pu7
         rUTjWGSLJ2BIJKJQDXrAA3T2HNL/fkFwbOb3rylq/rRrEJ3zjtTh0URabPJZsmQiDwAR
         8X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248419; x=1794853219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vrKuO2D1JP4mdnml9ASPpTlclUAIMoHvROGX7/k5V0k=;
        b=OJzivX0wg8R7tQ1QD7DVjFBmMJNGhG+2kkkX7anUflGL18UoLfB7fQ/EUQUyc9cWXq
         CqH7VFHnvyAlSqROsiJVA0R3RMsY5O0RW/CtIdfUn1lKgc35KlIef+JXUYWTYaNImVhw
         NKSI3EET4/xQh4bksEO/HSt+vhNvUUfeoyszViIB5P3W7SWD8Nl34q7afcibcVO7FKje
         IBmKVbGS3i9cMHRiNaTFb7UFKj1HhCezGihjVWf0zi0tk8fbK51LAKxTlsmMjXXUPnXc
         5vkHvBS6JBErlXZ8yZ/stzqxsdPfDDv0mWSUNBEaVFrgNTX9jr/eWwSwqfjyN76pnvSd
         EKJA==
X-Forwarded-Encrypted: i=1; AL+hErHIgKbMYt4Bfw3Nq/3D3hRajOdHyAnTDiiqssBnzyh35GqZ0lbLbLIA6RUlcSuRzobYVpEKvpru4R67K7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+026+AUOtSDE6NoTQFfh/YovlLAEW6+O+2IYK5CPl2VKblJ1xL
	cFTmdATnz3r5bNrNkvb79tZey9EeJwdk6FHArbGEobq+EdFA921jsgJV7vD7YQy/mvM=
X-Gm-Gg: AYBFou3dk6mcGbUxDMb7mhBynd+cPaLQEUebojdk+UEPvVwi1cxapZ+yVtzOVBWfR19
	Jr/iwj0n/ttK9XkwyuSg26Hg/3i+JT8LzO5Xrr/Ncon9f75IFPXIGbXHdXSCrvquIgInWkeA/k9
	v3YBpnGgKAM1t2Uuc39kOVLZRL3kUH7Ip7CTZiTru2PDVU364h4wlINs2bObL9ag7nA95WUC1Ml
	AswrPcGAqIQLGb8tWFJ+CBa5Ybtn6WZmg87/pMCnUGMNYhkmzE9FXG/jwnB2PpFHWGGQmR8vYcz
	J8imCacudaL7i3DIwEAnCuG/EdKyoNBI8CTAH/NGQ9jZWgaxaZqoxwumN77GyMwyTAooyPRRpSA
	jUFHm7bdNim/9iaS0NBxmhfoC4syI75ZWKfF0vYHlFW04U3D6MmfpIOBFVHZ+H1gBsLUJBC0ws/
	NR0xEQYdOC77FZTNgAkp5NbH2KZ6a4MyfLXIwlo3EgvC1zC7xqyJAjB8sm6vpXYOEosFbT8BNeC
	8mKDu3UjEylGElbctgQj3kyco+JW7U1zT5k5RdWWIjpKyQOcIEGYjRh35Wej839GLErzFRm+9ql
	J0TUwZx3tfhIQUjqw2EH2Muj3DjeMGQ7jzVPgFbzx65oLNcyPEZEYIw016lRso5G5GBC+Ce2N00
	XbhLTkuP9KIFKjPgKf3SqNsWGbzUPsg==
X-Received: by 2002:a17:90b:4a0f:b0:3ab:1b19:78f0 with SMTP id 98e67ed59e1d1-3b166cc8442mr517367a91.41.1794248418870;
        Mon, 09 Nov 2026 10:20:18 -0800 (PST)
Received: from localhost.localdomain ([59.153.103.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16792aabfsm423189a91.12.2026.11.09.10.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:20:18 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH RESEND rtw-next v2 1/2] wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
Date: Tue, 10 Nov 2026 00:20:01 +0600
Message-ID: <20261109182001.29076-1-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0FD97102-7E9C-47DA-9B52-7F7A837E2924@linux.dev>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com> <20261108182837.682661-2-zeshanahmednobin@gmail.com> <0FD97102-7E9C-47DA-9B52-7F7A837E2924@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

On Mon, Nov 09, 2026 at 07:41:46 +0100, Luka Gejak wrote:
> As far as I can see bw doesn't have to come from the chip here, since
> rtw_set_channel() programs the same value it stores in hal. So maybe
> this could just be
>
>         bw = rtwdev->hal.current_band_width;
>
> CCK PD only runs on 2.4 GHz, so that seems to always be 20 or 40 MHz and
> the check could go. Or is there a reason to read it from the chip that I
> missed?

I couldn't find one. Apart from the BB init table, bits 3:2 of 0x9b0
are only written by rtw8822c_set_channel_bb(), with the bandwidth that
rtw_set_channel() also stores in hal. I also checked it on my
RTL8822CE with Ubuntu's 6.8 kernel. Its firmware does hardware scans,
and at 40 MHz on 2.4 GHz, hal and the register matched at every
cck_pd_set call, across 10 scans and a reconnect. So v3 will take bw
from hal and drop the check.

One consequence: a chip that drops off the PCIe bus still reads nrx
back as 3. When the level then changes, rtw8822c_phy_cck_pd_set_reg()
gets past its WARN_ON(), since bw is now valid, and does the zero-mask
access to register 0x0; forcing nrx to 3 confirmed it. So on PCIe,
patch 2 is then what handles a dead chip. In v3 I'll update its
message for that and add Cc: stable to it as well. Its code doesn't
change; is it fine to keep your Reviewed-by on it?

Thanks,
Zeshan Ahmed Nobin
