Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F6C3F1AC0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526404; cv=none; b=RFZAcp8clTiJhVLSK+IgflZfh0qhtdUOuXT6FYOGimb+By5gMam/QQdfOK08TVJvMkqsdNFEHXwWpRbk2PqoheLqAOjpxTf3c2Njd4Z9/ipKeUpjGTKSx0DdAYDDKj/q/cpztPMtRHrVwQjD77VrjPsgexK5v8iSlJ2XAh/5fnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526404; c=relaxed/simple;
	bh=9hplx72gR6V4W6G79XhhC/8i4EyHccqhvdrt0geSnFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0UQfttLeCgyRX70x68aiyD0P/Gg+XtFZIiMxVSxNoad9K+HRZIPkFtxEjz/0xpR+WEcZtyUL7u0ofmrS17zRkt73/PZP8CZKRllIMhTrN1avIwPdTF/y0rR7kDbx2xU7mmDKk9f7Gj4ZPw6GxhL0Q1WptNRgkQpFM4sMi6/MdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cg8jZckq; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cg8jZckq"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342773d94a7so1118728eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790526403; x=1791131203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVSJl+C8yyYXuCquufuoFeFnXFMEAMuxSB/TRy2Nuto=;
        b=Cg8jZckqo2MbD+UXKk0xEliE5QswbQWBbRJX0GjGEMXzuaDai5eU6iD3jzlzWRamRF
         APGPSWc9plc2NAGXHJhYCHwOaDA12r9oKb91AElUORDiNA1+lHI2zc8WqPkjIj/9ovdD
         n6+MrmYfMopfwNXCL+XVkqs+1Xsx2j62WNDLnRMPLaMZV9SC1LGBnm2aoj9DcxEqtXlj
         6wpJ4TKePE0NMPiz82w6TKhlvsqjc1c73DMGMJPwaf1YMFx8MIYZO9SfbDlq4UH9b6CX
         uco+rdvh4oIcsWYSEnT85N9jQNuDtCP24l614kSpxxBWnXnregKpzSfQTpsRyO7q4TQ1
         PjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790526403; x=1791131203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVSJl+C8yyYXuCquufuoFeFnXFMEAMuxSB/TRy2Nuto=;
        b=s7jjIeEOFQok6+SV0/GqLX5OArHRAy0upapjAOwZCJSCEizy0l6aSHlm0bqDn9iymp
         pEd6ZCBd8hgJ72XubrtF8Ya/khQUfPk4maL3WUtXGR0xdPZjXjxvW9pcCcrabMRyOCod
         qUH3jHgmeYXh3Gnsx6/f/zxnLySZ1Umgsu/RdJ2eI1MULxb0SMySubn0hxtlMnXUpOnU
         8sa/XsYnfdiy9McFlC6VRAmY/mjfkkqBWVpaysrG8WVDW/oOztLqeqsG/aMEe+s2Ac2e
         ZGGE7X/3pkk1l1/rs8l+4iFdN1ks2ZA60J3BkmaVnpXX9YT8cgrHgVQVRXx20c23NfAd
         Jdtg==
X-Forwarded-Encrypted: i=1; AKwUvByHMc/2QnJIHXZoFIjLji/TzJW62UhQdYNB4agfwF0bRpWP8ytCQkpgr7nvRUptq3ohGPEZ5B/HYDs3Nio=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVmaOLa/Ltz5oxVfu2N931U3Tcn5uYH49SE/NKHc/vk+trTbHH
	RE4OujExsss43juk6Rm+LvuZ08LHq0fq+1nwzQ590/tqpoRbBoE0m0Do
X-Gm-Gg: AYBFou2IhBhWBCTBVe0omCFFzGVwf9s86sTFqfH1IAIY5p5N0+hq8l3gD3pxShNk7Vv
	5/j5DjoeTl6rUWxIcTl1VXf/qaUJ1UiX6C9odPWMu1wu3Qq6aymjFNM9Hbm4GeaSV+e0iCWR2ge
	ZTDeh2AodDFj+JNbwMAzNJe4oPFoGxArfF2vGShQIPFKUy/idIBXh6YqF7D9KrbrmNUgcAYGGFQ
	jo/HJEFDILIXXEzNz5QH99Lmp9EAgETD7e+tf1THist/AJ0jzJYs4CVeeulpQjp2eoNbmdEpcys
	3l6zdIrSWoNglXBJ2wzL09SZ7EU5EY48WJW5s/kkBiHYW3RzVk+CmzDKBLmbDg6+GfTKkF946B8
	qR7hj1UazRZir2c1/ieb//h9ZYOupjWy/cyo3Io+IwAorjlp1vi58GJq3+egIGV+HvhVC+zFBaI
	Xlu6KaoKGFeVTBZDRhFcTI4kOirM/U5Mx7Alg+6Q/O/0VXB8p/KRpqgLnPk+kaePDi/SQFsjOVW
	IekA2WW2XukYbHNVvTRsQ==
X-Received: by 2002:a05:7300:16a8:b0:342:4a2f:49eb with SMTP id 5a478bee46e88-34272b4bc8cmr6850956eec.38.1790526402504;
        Sun, 27 Sep 2026 09:26:42 -0700 (PDT)
Received: from ?IPV6:2600:6c5c:6b00:316::23? ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3475546b1aesm864022eec.4.2026.09.27.09.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 09:26:41 -0700 (PDT)
Message-ID: <274e9217-834f-43f1-8d71-e64b12052fff@gmail.com>
Date: Sun, 27 Sep 2026 12:26:38 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net] e1000e: fix flow control stuck off after link
 partner reset
To: "Craig I. Hagan" <hagan@amazon.com>
Cc: andrew+netdev@lunn.ch, anthony.l.nguyen@intel.com, davem@davemloft.net,
 edumazet@google.com, intel-wired-lan@lists.osuosl.org, kuba@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 przemyslaw.kitszel@intel.com
References: <42cccecf-ff14-41e1-811d-e5a44f3d1aab@gmail.com>
 <20260926132744.24777-1-hagan@amazon.com>
Content-Language: en-US
From: Matt Vollrath <tactii@gmail.com>
In-Reply-To: <20260926132744.24777-1-hagan@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/26 09:27, Craig I. Hagan wrote:
> On 2026-09-24, Matt Vollrath wrote:
>> I didn't try your patch, but there's a four line fix. Where the watchdog
>> resets just the PHY when the MAC exits DMoff state, set FLAG_RESTART_NOW
>> instead of resetting the PHY, then goto link_up. This works for me at
>> both 1500 and 9000 MTU.
> 
> Thanks Matt,
> I've tested this approach on two I219-LM boxes, each attached to a different switch:
> one a TP-Link TL-SG108PE V3, and the other a Cisco Catalyst 9200.
> 
> On the Cisco with jumbo frames, I'm seeing, via a diagnostic message, that
> the fix appears to fire and work. I have also noticed that I no longer see
> it on every boot, but this may be correct as I've not seen traffic stalls.
> 
> With 1500 mtu, I'm seeing it engage fairly regularly with the TP-Link but
> not the Cisco. I'm guessing it is related to how the Cisco negotiates. In both cases
> traffic doesn't seem to stall.
> 
> I think you are correct about flow control being a red herring since
> both switches advertise no pause (Flow Control: None) before and after
> recovery.
> 
> I'd like to drop my patch in favour of your fix.
> 
> How should I proceed, should I propose a patch with suggested-by you, or with your authorship and
> tested by me?

Feel free to add:

Suggested-by: Matt Vollrath <tactii@gmail.com>

> 
> For completeness, here is the diff I tested (I added an e_info so I could see it fire on the
> test rig; happy to drop that line - it isn't needed for the fix):

I would drop the e_info.

> 
> 
> 
> --- a/drivers/net/ethernet/intel/e1000e/netdev.c
> +++ b/drivers/net/ethernet/intel/e1000e/netdev.c
> @@ -5254,9 +5254,16 @@
>   					usleep_range(10000, 20000);
>   					pcim_state = er32(STATUS);
>   
> -					/* Checking if MAC exited DMoff state */
> -					if (!(pcim_state & E1000_STATUS_PCIM_STATE))
> -						e1000_phy_hw_reset(&adapter->hw);
> +					/* Checking if MAC exited DMoff state.  A bare
> +					 * PHY reset here does not re-run the jumbo
> +					 * workaround (e1000_lv_jumbo_workaround_ich8lan),
> +					 * so request a full reset instead, which does.
> +					 */

My two cents is that this comment is over-specific. In most places a bare PHY reset
is not used, so the transition is toward less exceptional.

> +					if (!(pcim_state & E1000_STATUS_PCIM_STATE)) {
> +						e_info("full reset on DMoff exit to restore jumbo-frame configuration\n");
> +						adapter->flags |= FLAG_RESTART_NOW;
> +						goto link_up;
> +					}
>   				}
>   			}
>   

