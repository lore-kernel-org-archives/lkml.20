Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7681E220687
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265191; cv=none; b=iW6rPVMxr4Cp31UQgSYYT8fO3uPok6GYA/P3bt9FLoBcGJGYvFARuVzF4YIqno2t0S4ardCj6HyW9vwJfPHNYIVi4j6s14zn5OAcRsoJFccnhB1Jh1k3X7XsBnaYl7ETHd/EwlQVjDm2aHf29TXes+O3VwUQJlc1GayLkxUqu34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265191; c=relaxed/simple;
	bh=mZtq/SKPKEI6Fx3Y17OJXHQJb2vDciYJBtSSfJsUKTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c/jAxwKKdp+SwpP1LaCZHmwJrIloLNPd/GI6q0dIjcnLU1HzSSKy/7b47TSGCsQe8lxCQCLz8f+OTSUNx9+q7IUAiy004jUBe5TKqikv932gCmC14uG0qoQtSsziT6GSBlteuE6M5R4ySgCKHmffI6epuF9MTibPF2bVHCVibJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=RX3aKnj1; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="RX3aKnj1"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso5900581a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788265186; x=1788869986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=93vM83Xq+YYkS1LPlVny3+Qzpixos5w62CjTMi3GzGo=;
        b=RX3aKnj1nIP/A4sbIHVSRA26zENtA14M8tlVfotyoOuqiltNdahI3nkuOHW2lwOGu5
         G5/Yo+TShQ+8vq5AtPYx6b2ZXBIHmPwG26VPLuGZaUTNWiZB7lHqnFSi//Q3svUtr6HE
         XxTQyyqx9RR0+EjwAJzxidPBCX9btX0+nMAa1CclNd5rXc32WzwLdVw4LoCJvpwDHvNG
         6QPRcXVXhLvbo6Z6iqP1Jam/RZNANtAWzntPugJ1N9UPYA6ZMaxiXCALhboB5wczBcFf
         3dLpFBrW5Dff1hn+niRsgP4Ri9eLRD2YgZwUFMMKYjgstLfzFXsjGYjkmUOzJBw4uudj
         UHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265186; x=1788869986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93vM83Xq+YYkS1LPlVny3+Qzpixos5w62CjTMi3GzGo=;
        b=LAovxe80xs15veLigZL829PWVKasewD4JeJMkPSjYaTAqjAttdYVmHCQgCVQXpq8hK
         CL9DldOnllbo8m8A0V/uTfv2hSmhioGwcwf0rjySC6maCbx7rWTHz0SaD+NgW+4jU+os
         2x70w1bPGACCsLwmBsfc67Ob3D3xpS4vUi1zNgma8X9TnDRLsd2EIBXTF3mQRvzUONpV
         JhfVGA9XZaVKwlspx1a1ZB2KC+YtpF4cdpsKsh77wybvXLmhoLbkUasMd/1ZSitEFcPP
         vdOoc3wCDmIZJNURB91VNcUqJ42f6fH+l4bisdmxPuhnmDparGwVFckDQZ7ulm3mBl2j
         aF1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxA1ZvRTukZ2sAU5LldyleuMnswRgf5f2PDjNsAku4zgF/eV+r+7lHGsKIYGvaMDeyOGH69tPDDHJOjuA0=@vger.kernel.org
X-Gm-Message-State: AFuF++ngyUC9nKEO1KFUFm1o/j31OM6ZRzBpc5avJhV/hvqldO6++TBq
	Tf6d4XdT3pPaUVUkVywwXug3ZKonpzZ+ZqTVuCsijjDi7YIRko2r9UFkmO25eq+kaQ==
X-Gm-Gg: AYBFou0T+Sxcwg6lkhiVbk3UlE+SquR9HYgpV9mbC2oWqLx93dW4lEgcSdiaYaUUiD5
	+SY6rXTRLiMrfHmLj2kiKrObbQW+TZAQTK9P44WZdxSWPeCS3TPTY4gUwPjUGqIuFeHy++ZHbTE
	1HfffQWD7uaXewCGsU148KK0B1I++uhGp6iC8+W6zjBF/MlPbE4XfwNVl6+zyTRE/TOD6ZbCGrr
	rX71MjxXrVJwvCNCI09VAkfFGbyoT41xlF9rb8Qi1Eg045TkmKhrFWmwL34j0Gdh7ESPw6RnV5k
	eG9TLUWpASQjFzvSJ93uzRcdI9Vmg05JXyC714Rkc8mked/OqnZ8mwkAtZZUwBXQFHKJ0bjv0OS
	hhSBVSCjb1Ap/MvA7PXDAODX1n4PL/ZdCcpHhRZxsdBoea0cyvBVN3ZXYZ6X6f0mOsQVB2B4r3O
	4pFQdmjo82qhjUxBm01H9e3Qwl3OKqpTw8I/x8Vf7GykhlbVLXMdlCqeS3nJQRP1cHO/lgS2bMo
	amOYIjaiIgEXQMFztX+dw==
X-Received: by 2002:a05:6402:52c8:b0:6a6:32f9:e9ef with SMTP id 4fb4d7f45d1cf-6a663ae9360mr5785269a12.18.1788265186059;
        Tue, 01 Sep 2026 05:19:46 -0700 (PDT)
Received: from [10.254.183.223] ([149.199.62.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66ccda72bsm712236a12.9.2026.09.01.05.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:19:45 -0700 (PDT)
Message-ID: <8056e1f8-6257-417c-83b1-b73c2acaba56@monstr.eu>
Date: Tue, 1 Sep 2026 14:19:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: CCF: fix refcount leak
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20260526184105.18962-1-grandmaster@al2klimov.de>
 <20260526184105.18962-4-grandmaster@al2klimov.de>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260526184105.18962-4-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/26/26 20:40, Alexander A. Klimov wrote:
> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.
> 
> Fixes: c1120542b99a ("microblaze: Add support for CCF")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>   arch/microblaze/kernel/cpu/cpuinfo.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/microblaze/kernel/cpu/cpuinfo.c b/arch/microblaze/kernel/cpu/cpuinfo.c
> index cd9b4450763b..32c508e85408 100644
> --- a/arch/microblaze/kernel/cpu/cpuinfo.c
> +++ b/arch/microblaze/kernel/cpu/cpuinfo.c
> @@ -133,6 +133,7 @@ void __init setup_cpuinfo_clk(void)
>   		cpuinfo.cpu_clock_freq = fcpu(cpu, "timebase-frequency");
>   	} else {
>   		cpuinfo.cpu_clock_freq = clk_get_rate(clk);
> +		clk_put(clk);
>   	}
>   
>   	if (!cpuinfo.cpu_clock_freq) {

Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

