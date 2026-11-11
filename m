Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363856;
	b=mAdJJti40xvZsU8bteI/tx3xSKebk7XGxfwTJPXte7xX83CaefVpf5elTVqZeF9GPIcn
	 K4XsNf2N62/vBiFNkCc6WUp2ogPoGPIMDj1yrCfv8WTw5qw+2Ube6CCrVEqi0D3YvG4Q8
	 1KDqDz1xZMav6363lN+AWYoaqSXjtZak0IRuaeGJpiSZ6ejdeyjhwiVe1pKJWmxCsgPSx
	 LAfUinBjlP2IEE4UhYZ7yBf+Z5ITvH1HSfv43BKEOWzjn5iwFbobOYUvrC9GVMukt4j1v
	 AxjJc5O4WoPNo5J8H7E8teEn3qDkjZk415oz9ilslVr+103X3ENLaKMRgrRnC4aoFag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4OlrevCe0/UiiEV9eDZQ+cK59Yv0r9XD6ToHjH9AnwA=;
	b=pBvUfiT45iKJpgxfRqFbf8RMVLJPBLLDyOHzBatI1nB7mQXtJDAuLKxaznz8KwZq73G1
	 s5rIpGOfZ/S123YsO0NRFEMKs9TDgfjgKbhpzZ6RRnOltmCalKem0Jeo8ISm8LfZybSAv
	 4+y9I/1ibMI4G0DYWlTF3F0DalV6OVwl4Zo3/c/HFNlHr8gsZw2VXM58PxNJVvlH7QIhU
	 QCXVD6nt4tIEuc/kRZDG2AQ8tY/Ua1Q8Nxyq3N/RXaC9cYVIp76SNtlwlETbcwDz6JUWp
	 DP0Eq5k9qiMC9pw9xopk8wGy2j5kLjmdvtaC8iGByJNVD5kbQTr2D285laujoWZ0sag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QydkEyaZ;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6B3606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6B3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QydkEyaZ
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-51cddc2451aso1053694b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363855; x=1794968655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OlrevCe0/UiiEV9eDZQ+cK59Yv0r9XD6ToHjH9AnwA=;
        b=QydkEyaZsSwLeYgL9wbu8wErtH7+qB9NvP2gw4SNzvObFzkZLzrIUAMDrH/bfnga+D
         2VxS2x6Z1QSTge1XAzPzxd4d7M6SvC2hejFvFdkVv/VzfBRaMrRlRVJ3+WTPhA1qAkLV
         j1bfNwRhjEwhfKzR8ne6ogOXSNO7M4H9lLwktm9QL9467y4Pd5ntRa63VpoOk7qZ9WUU
         MBD8sqa/PCy6lALWcOMuYc7Uw7TwN7EbUrHodShxto4zerTrqpwFBbMB+AM4m/+uL3YT
         FqxMWoYwnM36csHBOuaREjB0mOyYA+FJqFXkSXXyuo7zDD1iW/BJjG2pLEbvQDWnXxJq
         Q2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363855; x=1794968655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OlrevCe0/UiiEV9eDZQ+cK59Yv0r9XD6ToHjH9AnwA=;
        b=IlvwxcdPgaICcsJwPLsQJe1yAgfY9bCNmY213R5whAXVf62I9d/ABgQQwAW31Z/fK4
         p3/PF3x+zCX3lugGo8xEC+OQLQB5iAn1PHcXFQCkWD+YzYYs8y1ipLCcf1XgHZtEh8ga
         zoebcsOgsfvFnj7/Z5kbAB6GtEajvrWmYuB004IMPfXolPPsggbWlOiIvm7PG89bJcBK
         lvdnTjBPeSBDxbR6xNfLP+fxlLCWkCdo5kMjxHqxZ2REElXsRgWpQ7JEecA8ieEwens9
         BxGDTYwUCSMPdWAVy0/aCXyU3taAx6ZlWDMJkYd7yX11ztYVG8sxB3MNYg3k7a/sY7U7
         AwgQ==
X-Forwarded-Encrypted: i=1; AL+hErHGDqRu4PZUS5Q7BbRXj180bA5peKTEkUiRDHS4TdnqVh0bB1/Uj7BlCFK+isyKrs1THOQtS/hbDTqnxi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z91QeZMGuEprdknSTxvxIQoklICDS7m5hoJlW6WstwQStM1qLd3
	ztTwksc7Gh9FYRUFPa4XFbrenijubizvnhgtryjhMRfqkbaJWE3v/x1k
X-Gm-Gg: AYBFou2Xps8iMU0HYUXqC/vU82KsEUYOtgzgZdgDIHOTu0AHBGRjV+AJk0OXgD40Bac
	1Mca42JFJ3zAnK/ei8doDrSOpY9X30+EZU1r+T+b9lTduwZQctgfMLc5WmcDbAI0j9LFIa6kPz8
	dkgHGvXrnlY5g+6MRYfVJGF78tYW27EGOCDznNcV3dCHRtC/64LXGuYzBlMeiNXhe0pIAY+D42J
	QilsmH5e4kK2Y7qcQpFLHQI4F50+hptpVuMmM1Bwycri62LQhj98mTM2p9cKN4ZNKe2QI6YY5yA
	J96n2lBK83Ww9D8a3EK9se1OAmvXxgXoveTa6UxtqwoUTLtm0hb9qiGxzSRaRE0R3Vyqn4zjLU/
	OMFrpd43Ee96qmJo/jip8snJrN7xIqm0rl7Irkh12vdXU7pJ3T64VI/H856pLNvC+l8ZG5JAJwJ
	D8R5rEFihRTjjV0A88yEzZCbN20S35FlebdYB+u5ROnVVMYNhvZ/MrBOj3x6hTqo3GTBbRm+zvb
	EWsE3EtCe6CpZVEpKX0Ynf/7v7aa/HDxheWw7ziJnqOQGmawp/5Bs77aCkkAxga0L0D9bS4dBJf
	Za5WudC28raCD2zxwndSchn536sUS6rX3J5s4nhQpj+Vsg==
X-Received: by 2002:a05:6808:6408:b0:4f4:d7:b16d with SMTP id 5614622812f47-56b98728e6amr910942b6e.60.1794363855042;
        Tue, 10 Nov 2026 18:24:15 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbc82b5sm3364957a34.17.2026.11.10.18.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:24:13 -0800 (PST)
Message-ID: <a6a47813-97e7-4d22-b8e6-7dfab8ae79ce@gmail.com>
Date: Tue, 10 Nov 2026 20:24:11 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Don't override the
 arch timer sched_clock
To: Chen-Yu Tsai <wenst@chromium.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261109120757.847266-1-wenst@chromium.org>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261109120757.847266-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chen-Yu,

On 11/9/26 6:07 AM, Chen-Yu Tsai wrote:
> Before the conversion, both drivers used TIMER_OF_DECLARE and
> timer-mediatek.o is linked before arm_arch_timer.o, so the arch timer
> registered last and won.

On MT8173 the GPT already replaced the arch timer as sched_clock before 
7a097aba7255. Every boot log I have from 7.3 on the Fire HD 10 shows the 
same swap, for example on 7.3.0-rc5:

   [    0.000000] arch_timer: cp15 timer running at 13.00MHz (phys).
   [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff 
max_cycles: 0x2ff89eacb, max_idle_ns: 440795202429 ns
   [    0.000001] sched_clock: 56 bits at 13MHz, resolution 76ns, wraps 
every 4398046511101ns
   [    0.000366] clocksource: timer: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 147020034397 ns
   [    0.000378] sched_clock: 32 bits at 13MHz, resolution 76ns, wraps 
every 165191050201ns

and on 7.3.0-rc6:

   [    0.000001] sched_clock: 56 bits at 13MHz, resolution 76ns, wraps 
every 4398046511101ns
   [    0.000192] clocksource: timer: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 147020034397 ns
   [    0.000201] sched_clock: 32 bits at 13MHz, resolution 76ns, wraps 
every 165191050201ns

Neither kernel had changes to drivers/clocksource or kernel/time iirc.

I think the reason is that timer_probe() walks the device tree nodes in 
order and matches each one against __timer_of_table, so link order only 
decides which entry a node matches, not which timer initializes first.

In mt8173.dtsi the arm,armv8-timer node comes before soc/timer@10008000, 
so the GPT registered second then too, and with the same rate it 
replaced the arch timer.

So what the conversion changed is when the swap happens, late enough to 
trigger the splat, rather than whether it happens.

The patch still LGTM, and it gives MT8173 the 56-bit arch counter back. 
It's just the history paragraph that I wanted to give my anecdote for.

On the Fire HD 10 (2017), v7.4-rc2 with this patch prints only 
"sched_clock: 56 bits at 13MHz", where the rc1 boot before it switched 
to the GPT's 32 bits. Boot, suspend/resume, and cpufreq are fine.

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # on Amazon Fire HD 10 
(MT8173)

Thanks!
Ryan Brue
