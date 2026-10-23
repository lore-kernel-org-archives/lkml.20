Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721753;
	b=LcytByyYXUgRWB/6xfEaWfaWRhI7VuJrXQ7Sxm4eyf6BsrQ/+puFMCLWYI0cHw2Qh3Iz
	 hZSKFeNsnW4uWx5vFeGPTa/UQh8xr7Lh0+/mgu8MwI/2fmfC0sFcAQp9F+Xdv7Pd3yFsw
	 VUAPixdMQKV35wfG/a65HuBO75C1RXQqpGD8JFvuZ77ynoXUMEA7YS7iQIX/mZx91LjoI
	 W8bPjSeMD00skBSQ40Sn8hc3NA5KkCuGFz0NV8UCfmN+uXp4kOWMYeJEUU0RK2fCVwugs
	 NCkk3Wg3IrHz6CGOtcEz4flGud95RnixdBMkGihR8ueL1xUDFubs4EamnVN3Yag5F1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
	b=4lOLLJYn8JKNrjeyA1oGobI/2UAwIwWkbjnvkOCOOPEE15rBkZjUAQcrdfCxtarP35C3
	 YQxDsGN07U7NDpyH+9cY4mmmJsehuwPn7yBo3Q8gOYaCoarIxQkwJ97ZdIf38btFY4bWp
	 5QgU/mPuA/MuAjI9PlEKLg5ln/HzodNfMAUJTe19R7rWMhPaMp6+IpsTxEFfZ4XLodadV
	 aECoBkbtCw6h+Ni0Z3gmVvpBzYEWJ2oJBvl/cWD/EyYirmnnouxYHhEUPIF/6RlVNPXzZ
	 +41/iN9ux8sggkk1EBpuEkzHwybxJJR0JsK3KfRa5Nw0IB/3htWQYbxga5VY5oXpTBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6bPXlOe;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F2A606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F2A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=N6bPXlOe
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so3072675e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792721751; x=1793326551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
        b=N6bPXlOeCto0Xw2q8GWbXShiK73KSeIs2hmlz4VTfcv3cAbpYobZAt88gMpOm2lBHw
         M2WfJeRF6ZYKReLfipIpDUfAnbhsUsv8J2oQW7l1iK/5BFKX5UR9US08NB2EImhYxU01
         2LYE468fIOMwkAgcUbeK18A0/ZLhnrOFo2PLaGYrpw2YgPiNsFcqPE7KgYGeV83cPrxD
         FpIW5fQs9yEITiLjip/HEMToKsJMw1h4sWvnRhwc4bj0nGYObUyUW9BKyBpxz/jbhbZQ
         KB5f10X3NGyq3jXPSCbI6gkZJLGk3MRSi/OUtQCBoCmZigi6eBIaVazUcUv/Q2qG5inq
         g0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792721751; x=1793326551;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJyEzxnFilSuKrupjSrd3QaNv2TToCy8Tn714k4Frwo=;
        b=bhyiQfG6APm8W+aNoEAgm0alSHcwSQOrNa9pPtUubKSSFpiaP/wu0dJ9lrpVHit6yU
         940g/t88qRhe51UDyPcoNhzeZPgnfLPdjQho+YF+3WusUYA3pcJlTPC5YdHNgWT3LAZe
         0GWRcfrH6aDvi+Zgv/QVsOXuApiOrzQ7Egj4GQIU76F58aH9/IBwlIEe3+th/1mpQxhH
         h0APBUt6Hy40Vb5EIn3Qz03CYwtI0jpKjsp3edMNOKxTX27K0n7W1bEIM+dVSzfJojQ4
         ST6Ok7U1hjkkgBC7pmI8+BetdgN5cChVbu1KfD5dIuH8qUYCN9kOSiVIifoaIDg7Iavu
         tImQ==
X-Forwarded-Encrypted: i=1; AKwUvByvSGn9zE6twGqq1/CLhe+IvdZ2Z6GGOtVddTlhpI/mdlS41sF/HuSm45vKlC/JJLeJgYvk3W+ZuwgTZUI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMMwApw4MR414FF4/wlUgfMagRfMVGPP3MiBMz9CBBb45DVW9L
	D31Opcs0WmJXObYcb0I5AEbq67xPY0tolJgIw76C71QV8RAWWWa8jn010OZFrAL37w4=
X-Gm-Gg: AYBFou1hW6E+PSe81mkRQhDmC3aXazpD/TK7wNrGEZ/Ah905BatRGVrzt1R3iBftaNE
	+c8bgjCK2FyCOWfv4xXMp+GqZi5fhTJGy/gnWF4rGDKjJfT/ynUSQRfjA/5KkdMHxVA9KLGOLHz
	n3pMTAvgcPcEAYaVzvKWEvr7eeqyzEMspelJcwnaDduKELAwCtjNjbSUIeumjJL8g88gLq6gYcH
	hEaA8ReRPqUL0ushfOMOZQzuj7zF2/VZAx55M3wPAXQij2plTFiD36UKGUkGIG7pHLnxQk8Fn6u
	IN6krzHeVy6bWauhVMy9qmhjEdzdF8KE8ABe5jD742YYD6GtSAdfk79uKOsZ907hhgw0+ZosPOb
	lf8GmBEzXjdcIANSrp1DPIBL1yl9FZvSy6MXzVDzMOmlfyMHb9ecCXMDpWTs1FXMG/1yeofDZW8
	UbS69lR2p38mO3kco8wxDQ/FvE3qLJcvXK39iWcu7qBAV7d52HFUgST3n6lDR8dPaA8952Oc0Yg
	SRriyFAEj9NdBv6vHnLDIfEHy+MH1mLIVUdswwlI2ajU3udNgdeeX98wEUTIc7sII9qYtOCAlHd
	b2c5HSQ1OMWR
X-Received: by 2002:a05:600c:19ca:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a211c65f14mr11839735e9.10.1792721750941;
        Thu, 22 Oct 2026 19:15:50 -0700 (PDT)
Received: from [192.168.0.167] ([51.37.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21034b3d0sm47718525e9.3.2026.10.22.19.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 19:15:50 -0700 (PDT)
Message-ID: <e3d322a0-43d5-4369-bd09-128152f4b233@linaro.org>
Date: Fri, 23 Oct 2026 03:15:48 +0100
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
 vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
 jigarkumar.zala@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com,
 akapatra@quicinc.com, linux-media@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
 konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
 alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <f689ccfe-4adb-41f6-b492-97a48090413d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/10/2026 01:33, Anusha Arun Nandi wrote:
>>> +    if (!cfg || !lanes)
>>> +        return -EINVAL;
>> Lanes must be a multiple of three to be valid, at least for your three
>> submissions to be logically consistent, this statement must be so.
>>
> I will update the name of lanes to data_lanes in
> phy_configure_opts_mipi_cphy struct.
> I will add more sanity checks for data_lanes > 3, as C-PHY supports 3
> data lanes only.

Sorry the only thing weirder than arguing with other people on the 
internet is arguing with yourself.

I argued myself down from this.

=>

One CPHY lane is 3 three wires. So data-lanes = <1> means three wire 
that only the PHY driver understands.

We communicate in lanes not in pads. There is no meaningful way to 
specify pads in DT - only lanes.

Which means lanes - I think we should follow what struct phy_mipi_dphy 
already models for us:

/**
  * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
  *
  * This structure is used to represent the configuration state of a
  * MIPI D-PHY phy.
  */
struct phy_configure_opts_mipi_dphy {

         /**
          * @lanes:
          *
          * Number of active, consecutive, data lanes, starting from
          * lane 0, used for the transmissions.
          */
         unsigned char           lanes;
};

For example in DPHY lane == "two pads on the SoC" so for us in CPHY mode 
lane == "three pads on the SoC", there's no need to deviate from that.

The CSID needs to know the symbol rate - so that it can vote on the 
appropriate NOC/CamNOC clocks/rails but... does the PHY driver itself 
need to know that ? It does not, symbol_rate is not required in this 
struct no more than it is in DPHY.

Sample principle.

So _really_ thinking about this I suggest

- Following the DPHY example
- Including all of the CPHY specific timings
   The ones you posted, plus the few I found missing
   Any other relevant CPHY timings we may have missed
- Include the helper functions in drivers/phy/phy-core-mipi-cphy.c
   IMO we should use defines not hard-coded constants for the
   specification of the timings here, unlike the DPHY code

---
bod
