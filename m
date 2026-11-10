Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274237;
	b=cPrIaH/CKtTBlYUJY0LKkemkrwZXxhu4WjyeKrdqxg2keqv9tHiIsFMAJ8LrpUdveV9z
	 cN5fptYydKdOJaUpJmuyQ2Ou1rhOyS83msZHLrqTsVYD2UzmimxrNEcACSxyMLeYWUMuz
	 T46i5c7K3cmTDGsOAFEglPWHtxga8xcUzB7mLtpZmlKydsjqFOWWrHdlv8rVDpwNkgV4R
	 8k+fT1vBxsLYj5CwxdA1a3wRg2GHY+zBjf1ZrbWKFzaqOotuU7BRFlQ6r1lFTO5RzKh5J
	 MA2zenwNvtNFaccLdgtVqiXvdF0OGW26MB9Ms62LJr8rOUutIGUGrhQ9bE9VSahZhIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6cr9ziobUF9AnItm9jr9xGM9l0DDOZ1SgmvFxuND5DU=;
	b=ZTdVrrl7CW428wpzA73OR9LUr5lNHFtYx2DhsR6wo8ii3ET2RajYdopTmxowyfvioVXF
	 /q4WfKG590jkec5xe6FzdtxLYY/Q6uYI6TJQD5NIhrpD1szka1HWMFT9zq8ESM8Uub0/3
	 dxsTWdpbTmM4eUAMpQWsWMC5U0gYvRYv/vQZ2ByAIfPgZv6Gu2qYksTjYla8aPdokfnmc
	 OpdoPGB2UlevVkhktX+WVk4e+xzMlm4VvV8QimIWFzgBjqivKK6vI03FNXmZyr0y9Valx
	 6aZ5W4oleRStAKLNdJF1ltdbzsjU2xZxYgUrG9EA2e7IR1d4vp0ktuaDH0stEQjkd7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pardini.net;
	spf=pass smtp.mailfrom=pardini.net;
	dkim=pass header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b="FQ/Vg4eZ";
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28DC606A338
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A28DC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=FQ/Vg4eZ
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso2036816a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1794274235; x=1794879035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cr9ziobUF9AnItm9jr9xGM9l0DDOZ1SgmvFxuND5DU=;
        b=FQ/Vg4eZ2DaEJ51myVQiaugzwi+/CrgpUMLwAX7xlzIUdTYY3BVr+V6rV9VBg8iaHw
         vNvrtIgzLaaY+rcERUMZPEEyWcFk636tB6X9T4nWTyvUQaQoTZAEqdYZwdBHeAb0qxG7
         6VevPOLmI2lWHIPG7jemP9LIimpTffXxrMzMKf5xf3cTlJAGIOu3OQ7ccPu3uH0nlY/r
         W7nWaLSZWCaNCDG2fHPCAls/LjfBF1VfL8d04G//ZWrYid+Adt5qbkwIaLo9O6QBASnV
         gomYcv8rr3oHeI4QNvDY63+Jv65H73gXjIiKuQMzkT9uwoa/9impg6RTkAIjNJxhA7rs
         99ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274235; x=1794879035;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cr9ziobUF9AnItm9jr9xGM9l0DDOZ1SgmvFxuND5DU=;
        b=wQbbCWgomij7e2rXYJ/h+M65rDpk54QV7vHgxYRJ+foeSKQIwOLma7CNEUfx2PKDtT
         8yYuAx9mJqP51D+aVNfgJTuuebzPhVDwqrou+mKTDF8TtVHLedPZPuYe47cSfVUbePac
         zc9RA/4zUWS6uMZtQnsXoR+IJfry1nJE1zHEATE4bhj1Da6PXj9upfJ8FWtu2PN6BSfK
         kAyodp6quLWLrrWq5JYgdvI43eJKEVpj0+OIhWydEfOgr6BaGS/Ai2DuM5an5Raxf8V6
         U9aHKl96KFKVwDLDtYaqHfeKz7xxyYTfpTYcxkCOBAu00n4DVjN9IR8RvCGfHBM8R5L6
         jGzw==
X-Forwarded-Encrypted: i=1; AL+hErGNfjYnSqjeqvJNsn45xLotvtOIM+158T5PmWsstHsuECGKDsA+BKSVAPtyJPDjqPEa2W7cA5OJxrOHqpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vNgFMeWR1HKEumY2N8Pi6nNBd59dLxQfQ/hTthHEUfzMqhipY
	exUQpVSKwQUhHKWE4dmQHUtb5JlrcrgKcgUc22068spX1SkJnmTpykVvRAJMt/tlcA==
X-Gm-Gg: AYBFou3yTLrX57JT7dCkHtrZX8WeVYiVkd/Wr9Vec8PDxSzjGiAoCmAchzol6eb1wmq
	FmN8KFz1lp/UT7CJTZG9VMaGnF6kEZmbIdatP+UnV5fD3Swi9frbaLDj9KfqktsXSw5SpnbMJ02
	YRrcCNxLIdXvyvO/okDAGCSBgKzrZu9tC9rXHMTdzCEj+/YhROncJeFzhzhy/qf29MBaLqonYNH
	fuBRDl65kPq3zU14mrBaD0bBwIWpWCMBKu8yiUOhwuemiQ+etxZ4U+vMdqViiRcZS4iUl9VcemD
	/xjU0UQuca3z/2ecsFb12WMhTayr34JsaYYuhCM4raylaiPKIfwN+QNgSAXjtzoGNfCith7m5EN
	QNI2TvruKUZk30hafxW+VtUsIRXGdHIso4DWKsxi8+FeZoL+r4rIQF48F3xyuiIBQRjRMdyJXv7
	yGozhoAgWU7iwaYyu7nuneXCR0N6y2rzpDQuvqKJMGo4MlIuWXn5cLBu6P3g0r97cgGz80ui4ZO
	N57arZecOlk24qfIjaB1YTDN+wVvxIPXGWwf/uHtBpP/we7hL11SPXIDFX+ttzfb9IpfPgkmd3q
	MXPMrUCy2ThP0zX/xnGEYw0Y7qUPeUCka5WpAzs4dsGyWtpAF67E32AEsnYhKC4SCVh8LjTJJK6
	bjTjCZ034DzgkX6M3FG90KAdu2KlvqcFbCyHlJ9WiWGL6AAvdeHgMJP+fKeOfim6ZXEq48g==
X-Received: by 2002:a17:906:c108:b0:c40:d920:747c with SMTP id a640c23a62f3a-c5048f4046fmr83137966b.7.1794274235103;
        Mon, 09 Nov 2026 17:30:35 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:65ed:a8e1:a329:4b? (2a02-a466-4d7a-0-65ed-a8e1-a329-4b.fixed6.kpn.net. [2a02:a466:4d7a:0:65ed:a8e1:a329:4b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a5701a1sm41990066b.21.2026.11.09.17.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:30:34 -0800 (PST)
Message-ID: <f225b5f6-13eb-40d0-a9ca-7efab0e6876c@pardini.net>
Date: Tue, 10 Nov 2026 02:30:33 +0100
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
Subject: Re: [PATCH] phy: rockchip: naneng-combphy: fix RK3588 SATA pipe_con1
 register offset
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Andrew Powers-Holmes <aholmes@omnom.net>,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Yifeng Zhao <yifeng.zhao@rock-chips.com>
References: <20261109-rk3588-combphy-sata2-6g-v1-1-e9135c91de6a@pardini.net>
 <avJULe_00cHwMh4X@venus>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <avJULe_00cHwMh4X@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sebastian,

On 10/11/2026 00:29, Sebastian Reichel wrote:
> The patch is 1:1 from Yifeng Zhao with a better commit message.
> You should keep him as the patch author with his Signed-off-by
> followed by your Signed-off-by. Feel free to also add my R-b tag.

Thanks a lot for the review and for the directions. I've prepared v2
along those lines: Yifeng Zhao as the author with his Signed-off-by,
the BSP sentence (and Link:) dropped, the pcie3x2 link reset grant note 
moved into the commit message, the notes below the fold trimmed, and 
your R-b added.

I'll wait a bit before sending v2, in case anyone else wants to chime
in; Sashiko seems happy about v1.

T-b's from folks with a &sata2 board (Firefly ITX-3588J / Firefly 
ROC-RK3588-RT, from a quick search) would be nice too; the board I found 
it on (Mixtile Blade3) is not yet sent upstream (I'm still fighting its 
2x FUSB302 and PD powering troubles there).

Thanks again,
Ricardo

