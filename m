Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793663843;
	b=KtX3XtLhSmdV+nb1mOn2dVHMxMRoYFH0YPuvw9V8F79zd3wWmpqjB+qb7h/V0TG4gXU6
	 w4erpQ9FpbSw9QJ36v7Hzi7y73btelF410/Oiuc/ptpG6toWfMiRL8cuGNkH1tSGfa4LA
	 gx8O7+OsspdKz05GYbBwmgwuItApyl/C9F/s49zmtfCyGC9uTZq6oXxQ4QoTgVGCijAIC
	 mfCUyuD8kCKMouUXRZFYRpwB/GSUy0Vmo0mVL+vE+GVUeNs3pkLjbHTiL5aKFIZjy8Bnm
	 aVkand2I9kdSZZ+OJoZF9nFxxsEXBngCUFmj2E9RoqQeW9mEbbPv3HCbSrv+SAZKOYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793663843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XnlljRANTEs2Cr5cmk+F0MuHRIDHA5pmAW+CqIR41gU=;
	b=p9AAwaz0DOk7BDl+ZtJHaWSzawuX7eHPN3akivWZtedrMAY78v4Lb8qVK0f7g27PLAjb
	 tCnNsbc1JRJdXtAfT+21oUlYCvhYE1yr7e33Wh++cK1f9V8TfPhjefm1BytB2/iJkhN13
	 0MeLolBfgxNCAhP4ZX9tWOGdZWrgBRFasgXIJWRKAxil3NNiKkQNqwSkGeatFI5kQPTiZ
	 NRtd/IYhrgx2w8hOwd2UQcq/BR91ztHbfRAM9q8pidl7QPu81n4z111nEeRxHvI1tJy7Z
	 XfviAlJ5DCjLqFSc/7o6iUQpn/cQlqtGF5DpkrrKA8MWmnWClFX7IwRdA6+OdXaLUZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDIHrHD8;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09477606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09477606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDIHrHD8
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so32009165e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793663841; x=1794268641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnlljRANTEs2Cr5cmk+F0MuHRIDHA5pmAW+CqIR41gU=;
        b=EDIHrHD8r5P+JqlTOzAgbb+pOq+tVkbZ8TaiTCmYPsH5ecdgDRBm1/U7gHKriH/vup
         8cBSqjCVHM9exodNkkx0TtiIoh4t2e8H3ZszlzL3ipBCBcZ+Jyz+S8Ls8lQeAeDxPL8W
         3zVVs57H5Q0gZKuhMDc9kWvuWSfkNK5w+B7vFAv62xKrSaY2/FREC3putKdmleB56MhM
         jF1HooL6TjG3dNBfbHII69GClpdjn9nj9DvLkackjTKkuY3lheK3bnoKHZ3FwFfKBs+P
         1Bwh5T4RxzLjxCopBoa9vVe+DhlTouxKOKYy9heP68e15WpZVMuA63tW1yDW9diU30nZ
         SSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793663841; x=1794268641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnlljRANTEs2Cr5cmk+F0MuHRIDHA5pmAW+CqIR41gU=;
        b=jq4CEcC7EvOknjU5L808MD4b5vTf3s34HJSUR8Xr6osK10RINmJb3ujLMoRbyXcm4g
         FUFApfiZFZ2XgcwZU3k7IAlfc6qtoaF1abS7VMwmQLpfPdYbn0ao8yBBDLDduuk4BVOE
         2mktUgUvD9Ihm0O4givXxjNDb5gQOb1VfkJYdhi7zgWeqVaJSVn5w2J8WJsrbxEx/n2D
         xTIzPhD1XDad/YFZvkQHnMWYruQGE5Ha160M+C++4EMgnti2xIuKBv9U71Xgk1ge1oJK
         kqcfkF3xlBW9wxiNnkeEo6qh9+EJpTGAe78guxCRV2lsW4177t1Ys5LpmWPNgDb0OMMM
         GzXg==
X-Forwarded-Encrypted: i=1; AKwUvBwO4ypcWz+m/1zqmUpVsRax7kaZi+0tmCRicwoUelKDjQXm/cK2ZXMZqsQ/ydwBsz4rzETp1sFzxizaNjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgs1RkU458bL9vdXUamLD8P0weVPcc9nPGevuu7e1mWDOcWBeV
	bELjdBT2vQHHM9BUWsKJSbzyV7QkW+l2f1hJL4a1nKBqAww3OARFuJzy
X-Gm-Gg: AYBFou0oWrheA0y3QzHYzUVqAoB3IitAj9SoDQvhJn6INyogk1k8577d/nRFi10+Cj1
	Cps00yIJ+IDcdSfy3xl+F8C3r0ZOaUIzOV6nUdolkzCGjpjwkqKeX3X81Wr720Bar/Hlj3hvfS2
	s78XwA/Kb8kDlWM+uytSlxqvpKryr95HJP/OeOsKKaT3cxcF1BclZT73rCsxKbF7ktS7Jq8ahQY
	G9oAkhj10nJp1cXscyW2L3IeCwyK4ehsnE7MS/xB2WkglFwgGbrmw9mcq94T0t5w6dlodoM9v6C
	xVqJy1JdTzdfvknWvNUkSpGS5tFOU+9tmdKh6R/kZsnA7yv/80yP8Gyx7Biw8VBdOHRCqdOyqVG
	nhmtxhR29XWm0uYcNXSyH4R5deq9lqdTyGk5lq+vZ4QYA32UPJ3nU8hbjoDlyOzv9fjn8wmSypW
	wKv93/N2uPsiQaAQ0bGheEI92H8TJqRdH3SpYmTmszCSIxDFm9jLGCcRlrsWCDpoEbt1m19IVWJ
	NihLRb7Fu7pWciUHPS4bYQOWijrAEeKtrY/JvXQLB3jNYA6AjvZS3AbZpE3C/qpl6khjeifrJpk
	WK8JD35aAtlwgWj2cacPeCUSprI1jPJhg4zywRMqrpD6XCEf3U1z98jIEDP4y9M9u13uhthi5DA
	5Xw==
X-Received: by 2002:a05:600c:8b0a:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4ac1709a200mr273537485e9.16.1793663841176;
        Mon, 02 Nov 2026 15:57:21 -0800 (PST)
Received: from ?IPV6:2a02:8086:cd5:c900:c69f:4b72:77ee:5fe1? ([2a02:8086:cd5:c900:c69f:4b72:77ee:5fe1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm15883245e9.9.2026.11.02.15.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 15:57:20 -0800 (PST)
Message-ID: <c45bdcae-63da-4552-9e35-59ec6a71621a@gmail.com>
Date: Mon, 2 Nov 2026 23:57:18 +0000
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
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on
 WCN3990
To: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, Fabricio Akio <fabricioakio@gmail.com>,
 Aleksei Kharlamov <aleksei.kharlamov@gmx.de>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
 <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
 <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
 <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
Content-Language: en-US
From: Conn O'Griofa <connogriofa@gmail.com>
In-Reply-To: <CACB3TCKq--tdL6j+uGR_dxGdy-gHxQhY8p0h6xxqi_4Fd3VEOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2026 22:51, Nagashima, Shunsuke wrote:

> Aleksei, Conn: a firmware file update only helps devices that load that
> file. If you have time, could you make the same change to the
> firmware-N.bin your device loads, test it, and send it to
> linux-firmware?


I can confirm that the unmodified driver with a patched firmware fixes 
the issue on QCA9377 as well. I appended the mfp-support flag to the 
existing flags for both firmware variants that are relevant to my device:

./ath10k-fwencoder --modify --features=ignore-otp-result,mfp-support 
firmware-5.bin
./ath10k-fwencoder --modify 
--features=wowlan,ignore-otp-result,mfp-support firmware-6.bin

Testing each firmware individually confirms the flag is now present, and 
both firmware versions can now reach 300Mbps.

ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00002-QCATFSWPZ-5 api 
5 features ignore-otp,mfpcrc32 18db2397
ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.2.1-00021-QCARMSWP-1 api 6 
features wowlan,ignore-otp,mfpcrc32 02bceae2

I would be happy to submit the modified firmware, but I am skeptical 
that it would be accepted? I'm not sure if I've ever observed 
unofficial/modified wifi firmware to ever have been accepted into 
linux-firmware (which seems completely understandable, given the risks).

Conn

