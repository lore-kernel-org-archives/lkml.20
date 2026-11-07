Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017528;
	b=tEYW/mTh3bF4P6P74G+wx/NfeUvsnRoWMqqAD4gdl6NzozVl8VrqdXtz9fV92U7NeIbg
	 2vXIQ25qq96NwTwKbV2iBSQp7P7iQCtxHsz0VI5CE1dNQ4aSv5dd3t9GdSmPwQ54dZo3L
	 pCglKMmJ+LGVtlrSVFVCkLDFU3BjBP3JHTrxDowin1yPIGK8GjRrUOdwZivKG1sF9dTE+
	 EvoblZ1E83/eYBMsa55pz+USZCSsnwVlPPgfrQ2q88YV3l4rXbzcwMVNDOLcxsr7Dfeua
	 3AvuUFIjZUdMLtAjkO/dRmoEG8MmgAPG/vQtktvl33200YZv4j+jCktldQXQhfY4/Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
	b=OF+ZvUzcQisSe14wYSxlPRHP5K7AY8zsMQRaRxHnYvkr5GPc8z8iK25kt9m+TT5tQ97H
	 hGQ3jA9Wn4qSx7+vDJBMCmIzZJSyUgTUda8uD6P8UTKy/wzA9QsD5B2BtYJGZGZkZW+2O
	 Pg2WEcjAQywY4UgfSE2/1W+Pr82E6mAnn9WgMnW7CkLirvhbxivNmTfJTzVbckWR1bDXL
	 IXyF9iU2Kf6IERek26ZoDP8LoKuZ34GoF2eXk42Ri0jhyB49XuUxtscUItZWyGG9uosic
	 r9qtgk9+E24ulCUFj2jrsjNgbdLgl9Lu1TSktF+ToJUFB/gouabs+CHYy0TqkNPnnlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WN40mK77;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67807606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67807606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WN40mK77
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so1710911eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017527; x=1794622327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
        b=WN40mK77q2MS0NRynvOXOkwBOhjMjS8o5blvaF59gy/8znq9HbxNHxZsG2N1FwWOAO
         pTAuQRf4j6rhw3fT56835TqbRRFGlf/OQ3XNQZH/24t0RcQ8PVTrF64PbPQ1y3uhItZS
         0AIFwC+b6KLahtXWBc/L05PucbM1u78pW1i9Z/K6mqbGrDf5V41efbftNnhbCqtO58zk
         k/1bSUUBNsdi0Vp5tTaO57CUdgE29Uu6dA/R+TbEbxV5nQ4DpIrV2buafwtFjBoOUH8g
         syYT0OEWfsXI/cMn9aePHWmEpAeIyyTaImStZlRs0dwx0NklaqtHGIkst0IwuM8aMobz
         tGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017527; x=1794622327;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqQCtL7DY6GdOgcgju6Yk99vFFUh6YCcWxgQrEusl0c=;
        b=etqapFdnJo5e53B32FQw9jcEToQHsHJ89RISMe4C4bU2hW29Bhs7pTjxMxNaJ7p46G
         atR335+S0mBFFDzXAOtR8r7GdpY7bgAY9FSV5t+kT+SxUMmO23GLBf2JjgA9r37J0B8E
         235gCEQogOaImJNqeTPcvXisfuSi9+LEhzacOYYPfMD+Rdlij5+kS9+koceAm5hjtYcY
         AoZBxTwG6r6jfNj153JP64htnhOCGhuZxZVrkxVcNMBlOwJuAIVPs4d9FkDxhB+kCBM0
         ba2tEyO4AXmdfqIUjlNpOqk2aSM4JWvpcUJ2wqgjx4hc9gTpEmZJD/3ysVXSRw8uApkf
         y/PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMm52uPpoyFudBgoO6WkwCv/2Hbn+hY4CwYxo4kwwZ0DmjXklzDNR5IuootlrEF6OINjhBXQNXOBxKS9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gqNZLBdB1dP7B5CSlX8+vcZXh5OzFRXZr3pv+7SCAFTwqXezG
	/oO4PDRw4hrEctyhQqakHmB7W980vjJzfzRL0EDsO2NltyNFRkz/Q/aS
X-Gm-Gg: AYBFou1/W/RR21PLQmWAHPUB1yVJa8cbf7xukazKx/bniUtVqZF3Wyxpfw2i5saUaRm
	87OZu7wikNPDB0MX/LEOdbwy/D9boheZgdR/bvwkCyay4Dtvfb8xXpBT1+89wDoVLA/ZHk6KOun
	EUOI2tUnsaqw8eTrty2PgvMtL4SYs1as/UvV/gXXlsWx2qKqW7KtQiyK+VvbGQBqsxj4tJA7uuJ
	s+9pG4POL4js41QxHC6EoHEdfIboOSh/yZMlXOFtBbWg1iDkrt29bwr9TG834zqkeQSqCBBHBBx
	H7jc4eCoY9E5lqMwRf72XSBKLv7QkmwIZwu1G6bk8wQZfHGBdVK4m9pH/bXbpxcpzlofW1gcwu5
	tLceCTKHQSLesdJkgfkhOKRHkfHuBp/TqmSXHLS9N6nYonFFIA1fjq1fHQsAmMwa0XDvDTJVy7z
	Kej/WgxqNiRonqIvAR5PkVn/95I68GggZmBfs3C7XhCpnwjWqbV7IXE6R+eseDJpWD/jz2hdKo5
	G+aoRAskiUxFmuTZEqqhKTmCOtB71Dr2LGV0RRHAjEVP/24DPOFHTEjcrgOLXasT1Nwzu1E1RPr
	m6r/SJPj3hIikSYDY7B4JjWnyZhfggy7xDMCtBE8mayO
X-Received: by 2002:a05:7301:b0c:b0:36d:c3db:9802 with SMTP id 5a478bee46e88-36f76023a2cmr5537963eec.18.1794017527249;
        Fri, 06 Nov 2026 18:12:07 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm10949924eec.17.2026.11.06.18.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:12:06 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Sat,  7 Nov 2026 11:12:08 +0900
Message-ID: <20261107021208.934-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261104-bipedal-supportive-earwig-2aae26@quoll>
References: <20261103135057.1682-1-26rote@gmail.com> <20261103135057.1682-2-26rote@gmail.com> <20261104-bipedal-supportive-earwig-2aae26@quoll>
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

On Wed, Nov 04, 2026 at 02:13:21PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 10:50:55PM +0900, Joonhoe Kim wrote:
> > The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
> > DisplayPort pin assignment gives it all four lanes for DisplayPort,
> > while the controller can keep running its USB 2.0 port. The controller
> > has to move to the UTMI clock before that happens, so it needs the
> > Type-C mux state as well. fwnode_typec_mux_get() only matches graph
>
> Controller does not perform the switch, does it?

No, it does not route any signals. It only needs to know the mode: in
pin assignments C and E it selects the UTMI clock as its PIPE clock
before the PHY stops the PIPE clock.

usb-switch.yaml describes mode-switch as "Possible handler of altmode
switching". The WCD939x codec uses it in a similar way: its mux
callback only reports the audio accessory mode to its headset
detection. The codec nodes in sm8650-qrd.dts and sm8750-mtp.dts have
mode-switch.

> > nodes that have the "mode-switch" property, so allow it on the
> > controller node.
>
> So judging by this, you would need to fix fwnode_typec_mux_get() or
> opther driver code, not the binding?

The binding is needed because typec_mux_match() checks this property
before the mux driver has probed (see the comment in typec_mux_match(),
drivers/usb/typec/mux.c). Without that check, any graph neighbour that
is not a mux would make fwnode_typec_mux_get() return -EPROBE_DEFER
forever.

Apple and Rockchip handle this in the PHY driver, because there the PHY
driver can reach the controller-side USB3 control (the Apple PIPE
handler, the Rockchip USB GRF). On Qualcomm the clock
select is in the dwc3 glue (QSCRATCH), so the alternative would be a new
interface for the QMP PHY to notify the controller. I found no existing
one. It would have one advantage: the PHY knows when it actually
switches. I can try that if you prefer it.

> > +  mode-switch: true
>
> Drop, but you might explicitly disallow orientation and retimer, if
> entire solution stays after review.

OK. v3 will keep the usb-switch.yaml reference, drop this line and set
orientation-switch and retimer-switch to false.

Thanks,
Joonhoe Kim
