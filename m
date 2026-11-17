Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924980;
	b=mRWXgGV+kimee4wQVlJt32bTnfFnJSyj7RVIBgwfvOyRSCjce2egqC5NvAW2LeiGDSD/
	 WPegn/LpOsnsBXUjZO1XNncNQKkobdM0nihVy+FNhG5+1br7n2dm6IplZdwc4CXSes+Jb
	 VkpC31rJwnwhC/igXK4pavSmu/z1jg6W4QBq7+GGOP36FB7RkXu14YGgsPiGBhK2EGJOM
	 5mHDCLXz8+urVM65kOPu9qIT9yqFTFTDEJ7FT7SK0R1MSvE9cVw1NUUgP7XtL+zcorDHm
	 +PoLOwJxP2RN6Fs9uubM8Ob/k1yyVF89zELLKSpTsoc02o1l17DaYMxMxRhxZ3rh4rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
	b=ZELAnKGkcNeowL00ao2eGOFnhvHyaxyanAxrEFl129uAmFpMFjIhK5QgiUmips4wqiQa
	 m64uKR1trsFU3uu4dnelst0nVidaoFyOrRxktod+AT9BTazfUnrnba9AGUfUqiwc2VpM2
	 7BqZBCB5+IuUWs3r7SdCoohJ6K4buTy/gnWaNWrb/X4Uj0y3gdk5/KyCg2gCgj1j3kTsp
	 uaEqDlMxEz65z7V/4hetmcmQ82hEgHWmSixcSMo0ekTvCjjpCPrlgKP8CDbIixsg5UHim
	 Rf5WionlbbTNdQfC2nRA2wzGJovEgxc+YRgaY8FGBu2UQi4QiNqz5EuQJaYflR7RdzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t69rdOlt;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60929606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60929606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t69rdOlt
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36dbde64409so6966011eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794924979; x=1795529779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
        b=t69rdOltjvx5qXxGRNojKyKeaNC41rfaJiKtcaRrmPQP/lk9UeeAKX5TuvNwLG2YTU
         lj/fqP9kUHml24YBOioaHKTh020Sg5vswBz8kqxg7nudfckKKA2UFvCQvsZGITFUVs1z
         DXGsW7vyUUGTxlT7UeSiuAf3amRRojLwhECb7bDQiFd4SAcoCrtGubN/qFzKNcT1EH9p
         QyzhXWzp1qNtziBNqehGz+Oege5nZMaaKax3h/vTbbW2DpHQXgvV+6pSoIgEUH10Ns42
         Hqi21CmbJkXxW+Te2TIwkJjjF+B/Z/7j8nGU61tVjnLu6x4oCulqQASJg+bcHQarHXrq
         f4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924979; x=1795529779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG6neAVh4oCzGf1sct8/MQCA9dZCIT+3BlbcZwi3Bb4=;
        b=M4siKaa3/2QWFjvKwsbLXjBcf0fcgoyOb9EBauQFAgAkJuK0RpfjrM2+3YbVom7i92
         U5iqIyXKpHCLpEOkfCXx1cahq0u/7IRw2lrjVgzkpOoc3I8slP+TxuZTowig4d97XIc1
         XwpcugtjYCP7Wj9tuHYstWPUAAMGqwaXS7CzNUp6PIOOioUSRXg6GiIzChBmDDZ9nXHs
         ak9Jm8hnHpTZ+qkhqvkkVyrw9FrFi5ta9KIJIIkNoEaK1adCBo57h+YvZG9lq+5gB2ip
         Jx7u5PhfyrnP7cOUntZ+IHdhGv1+/ZpSfw3fGlWP3MvaHH/zdIuwpIrfUIQvmndKOmuQ
         +Nmw==
X-Forwarded-Encrypted: i=1; AL+hErEOce9WiN3GwM8xr7V+580uT4pRjx3GNdPq3N2lqBSU4kbMN/MnlROE29eoreWFtmJx61wjXhqRv8ujQNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z87cTenLvluODYuwnFkSHc8K//s9voWdUP3eBT7qX5V9/tPLdik
	z5Ho/0gxGKY6ADuDK7k+7IPUDuXz5buJoQvm9S9x5Qsiyd4I/G2TW+qRync4Itlh
X-Gm-Gg: AZFdTZcFMe1VdmM+reTajcwCkKeLaFspLi+NDhGEKeEwLrPR+RyYzKRqA8e5qEejqo6
	2UDjEiHgDbdQ9ZPmngvIcyakQ/l5MPuM0XAmuq3z4uS56oCtTvBU8WBH19ToFXdriwUYN/gU6Ti
	KVpi44NJxKOe1zf/HUoeFpS0P2z1+Kz9KNZythgColNllCXIEOy2Y2CjaglqIiVYf1BmeSiA4Ef
	9ZW2RaofDgejq6CGwGoUCfVsIF6N3eDqJg68mDuAnalWFR3uGalix1Hw9HkqR0R+B15oLSLkHt8
	YuW2kKbNNaAEFha1A1mCSlWnBBHnual7prhhlDU0176HXhum6J6+mUZDR3n+XzTWXAdDC9ma3Zx
	BqiHtGe5PY/XptYYeObO2DXGm4UjDmYcb2nCQoZjmA7SUOhqbzffcQpjF/hdBTTjJalXfVaKwDJ
	Exivss+zV+7XeTbgbdoKxYRHUqSln1Nn0X0vxhfTmKsxXy0qKJ2YaAlcwhuNk2tiCoaLe24yShx
	eWRSpPoi6lTAdOB1IK3IOg2arRJmH/VyHzBVwEQSCY9k0oL31jJEDTMGBrejsF/ShWDcqWnDOzW
	7juaYMfLJW7W3opU6A==
X-Received: by 2002:a05:7300:c88:b0:36d:7f5f:7e97 with SMTP id 5a478bee46e88-37967dd734emr19474818eec.40.1794924979189;
        Tue, 17 Nov 2026 06:16:19 -0800 (PST)
Received: from buffalo-ssd ([2a09:bac1:3b00:a18::2ff:99])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm9540594eec.24.2026.11.17.06.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:16:18 -0800 (PST)
Date: Tue, 17 Nov 2026 23:16:25 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
Message-ID: <avxXNp5xEbczbb1y@buffalo-ssd>
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>

Hi Krzysztof,

On Tue, Nov 17, 2026 at 02:05:57PM +0100, Krzysztof Kozlowski wrote:
> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
> approved by Devicetree maintainers, because they were never documented
> as actual ABI.  Drop them, because no new custom aliases are allowed for
> years now.
> 
> This might break users of this undocumented ABI, so these should be
> updated to use only documented and approved ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

You mentioned 64-bit MediaTek SoCs, but the same class of issues also
exists in 32-bit MediaTek SoCs under arch/arm/boot/dts/mediatek/.
For example, mt7623n.dtsi has rdma0/rdma1 aliases, while mt6589.dtsi,
mt8127.dtsi and mt8135.dtsi misuse "simple-bus" for the "clocks" node.

I hope this push for correctness doesn't lead to any regressions.

Best regards,
Akari
