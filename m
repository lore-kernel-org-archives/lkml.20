Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261246;
	b=NqntR0z6mayClfOquBQXzODJjKhVm0lORD+yYfa5S/UyKsREwt4l0hEBils2Zqkqn0Sp
	 Rg7/KxtTpR4iPkuuJ55FQ7b9Ir2IF9QPDj1ZumCqaS0NE3zrkOJAxCoI/SyrVKCjIUmtZ
	 uRvl/zYO2X0V6NJUQkeK37fW5yC+IS9NAVvASebp7v98TL9X8HRUW+gYNzjXZcw0kyp+t
	 qBp08ukipKR+8hFrVMzuHefL07+Tvfkf5/hsqrHcf1ScQWqNjnIUVrZs+dVQmDlGNuOoh
	 n9Bg1ueawKdtlreMw5u6YWDNSbO3Zh4E8EniQWbPJ2ySK6Lqu3JyPndOsFF3opJb0Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
	b=io5jZN02f9RMJoVRjBytJBMbKb2JW/asdc6N6kXyiOpFYnct+vb87b4ovs0uyNdMhVcI
	 yumCUJsin6A3RdYmr+hE7u3GbZSQT9cRMKU3Lg8ny/LAgbwAW+EOT0LRw2/QB0PXP3SUc
	 j4tCzy90F9LJOnOt8fTxw6JyqlSuQRIqY9XzuI5SgFCdAf1uA4VI/VD6B6vIvCetOvOeV
	 rwjGP1ypXj96QTHJxYln+mywxhR3LTcD8+9S4hdZl/+vai5zNv7mXsDHBmzdN5EQ0gV89
	 T0vJ4nDXPfYaBnhx6XerQXiOjZvKQODi+eUd6m5Vp27sMvbyeCR/kap2/2R32NXsROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpGYn+ol;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFE4606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFE4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JpGYn+ol
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67c0ffaae1dso1557644d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794261245; x=1794866045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
        b=JpGYn+olxwP6g1AsWQ5JC0dZWj25OdrPJQSEeGtlGaKzWLxHImPHrLKLik/zep9f8E
         x5Sj8992XN7PYjydp9+BkADH+ehh8U6hx02X3mkJN59R02bg2az9+LivqTORKQ3BG0uD
         UTfCQAjQNf8/XheFYBjWMqrpk57fx8dzoOH3S2YJR02Dd2DHy0iF+KbdnHUPf2m+G0oe
         MW0vG3joKSROH7DL4PJ3voUH5wtCNhx+oFeYdNPVgcDSj3fLJaKEh6h9yf2YiFvO5lG/
         9BwhCJnK/YWyqVp5I6S2vaqemkSVhAou0xGHEQRTGSyLeIbZsGsUIyLkJRXQ5klG+D4J
         aKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261245; x=1794866045;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qMDA86n23QkRHQ7NDzdjzzCwQYU3ppwfnDZcp0lbw4=;
        b=UV/DtRFr3fQQor7gBO6WKy+FYTQCV0+1UkGWk/QtGslLfpbKN36tjcjGmB35z2CqJD
         CGxv7yq2HJ0YbJkg/OrqzITmkFqLkjhHkhDIDt4K+XOpWtXrGd1DdUkBQDvw2HklbKHp
         v0XsCaFvSs0FZRce5jrWzIC2M9r90OMkAlb4/OwEw0L8adD7oc8drl1k6XTTJ6ZaXKeH
         ezlxg0KKGw+XhK/QeaAapfZoF1+J1y0jisMEnV/bcT0xibVgK21midrfesfZESndcnXT
         GfV9+L0zofyb1WUfBwLgSBnd/2RcySTwoSApYNQvOD2n1Q7l5we+DWJp8Q84yCfZ0UoR
         Lj0A==
X-Forwarded-Encrypted: i=1; AL+hErGgu9EJmWT+VmIx1i3X+joGYjB8RvcE2gSzOKDstthIdGLD8tZQLmt/6jU4M/eiVPAtcObI76KBPp2N5bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JxqjJJg5qc3KhpkJBrnZVg+NJaj5ZL0I50kfyB+6ZSOopGAOx
	4KbWVxsIzYQWB4W5Kz7j9mjb7Xn+JZGkO407fd5jzSyN8DnP9nEIzc1H
X-Gm-Gg: AYBFou2lRBNxvRXjENtDE+gERFPF8NeR3JT/qH84zbEIoBlQAVsKmJWa56oU99XWOZv
	STHNSiaQ8oEER7PVxtcscCfkCVNa4PO6KUcILjwvO7M79EVLKPfZ2zvMBgPCFc2P/J9r1xp8MQR
	MurG2ihB2n1kWYKCQ+QJ4rKgupC/8W0oDmJbuoVgSHPUlwFNuB1iKLNKq5xZzQ/d9bXC/qvxVa2
	D2pRunqXmsrpjnPTD/7SpLpk/S/76IFsNWz1FiYkpJKEnDmZzxq8ihEgQ8glnrXqSRkaKWr1lvp
	20xDZLV/nCFnEDY90afAXpV+dNHwH4CO3h4XFyKWdhDd6wJYWMEZl8Tr/HD1yBL6jQshx+g7TW9
	gPegDdmxK947Ayh42qS+WD9XlS3UX3Mdg4W0XXPmXgg/3lkpKsaDYpxA91AmT9w0tRvWKKsnALE
	AzQzb2vpRsT8qU2vU6Iy4A58flhEB84E3CnL1W1TFH8zb8o4vks2EPJDrSOIPD7dQSicdIApUyJ
	QVyH8xqHpAOdw0i6yIJFPfIxePGLf1oKCp7h3dH/Uyzi/y4r5II+898MWT+dW7ztmWweiXo5tui
	WxJK8aq9rydrMfoULBHnrXXIzp52NHDhqpE04sZSeUqYWHKg
X-Received: by 2002:a05:690e:4505:20b0:677:c21a:ea51 with SMTP id 956f58d0204a3-67c5711cc8fmr277638d50.27.1794261244652;
        Mon, 09 Nov 2026 13:54:04 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a3450sm334827d50.4.2026.11.09.13.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:54:03 -0800 (PST)
Date: Mon, 9 Nov 2026 16:53:52 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: add missing tlmm labels in
 examples
Message-ID: <avJA8HhGiFzC-tJM@rdacayan>
References: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>
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
In-Reply-To: <20261109-qcom-tlmm-ex-phandle-v1-1-b77b09e6ec9b@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 04:57:25PM +0100, Bartosz Golaszewski wrote:
> Several DT binding documents for Qualcomm TLMM pin controllers define
> the gpio-ranges property in the example node that references the tlmm
> node except that the label is missing. It's harmless as we ignore
> non-existent phandles but for correctness and consistency - add missing
> labels.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,qdu1000-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-tlmm.yaml   | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,sdm670-tlmm.yaml    | 2 +-

For the SDM670 portion:

Acked-by: Richard Acayan <mailingradian@gmail.com>
