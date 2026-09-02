Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF949CF28
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353521; cv=none; b=fg0B9YFZSnYfqVPUyeYsj7NSspN/YZhJIUx5KeB1Q46lZpOEWmTm7BGbbenO5Ut0FBLlVwySmTQkeisRFjl+e2jqvzbGHs7AI2vMcp7omzMZu7qp3ztn4L5WS8zR8DK2xaXPeWCHkiLBX8K8knBkPZwmsfjNISxIBZt6J20dn2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353521; c=relaxed/simple;
	bh=mKlEjK/YMQld6vJmwR0/9aKJoS+2zsE2avk1GfXVXeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfpD8Ql5NwlXrMnPojJH8TZzr2Y3gujJtC/8b5PkqWyaIuW01eVJPF6GsxtukKadVgsUeVXebYEBnC1RqKLD+dDLMBmrtjqGhRI4JayFXbJZAFtwHjGFzb4ehuXR/Js1YqS5GezZiLj0uFU958QgC9H1rO5aKe9AQ9Z1QE06LIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=a+MHFUdZ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="a+MHFUdZ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53024149d40so4827891cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788353516; x=1788958316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBFYRqjj9ZQem2jSgP0xTqH/Yx+DXsxPz53X3PniFy8=;
        b=a+MHFUdZ6flYrZhivX037uuPPoYhghpxDukqRxHeebP5q7xjyKw/OrawV3VnxJSBlz
         s9ad78FxrrrJlbWcV4Vios7qOXR6bTRzFhekDv2bQkZO9cObQma8tATetwGRmbRXpe1K
         cE7vWkWhlicMtwFKJgZ+/Oh4MaxC3V2vkj3MrYDN+Uperp0hMg7Cp2+FU+LPaYD2nKdD
         mygDm55U5+xhqCDtUuk3PItiIeA2hpWfotakp1IsXUg8XaOe92sN1Zx5Lt6p10md2O8B
         yqOSZDzjtT3Fsy1RGkYs9xFHutwwRM5kuLNyRAdnDiYE6HsJA5zd7A9JXRsclOE8XiMt
         BjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353516; x=1788958316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBFYRqjj9ZQem2jSgP0xTqH/Yx+DXsxPz53X3PniFy8=;
        b=qkfI3pKN/i/fJ2TAiEamr3h24Onf6Rq5fcSUpd8vgFol0jvVif+IM5+MuEeZgemBF4
         zc6NqFrnYrmvK8KXc38B+LJ+OtdyUTpEZf/GdIzKVZ6G1Z25vAy3uAnCSYGhjBjTvRfP
         Kf4+pRC+TltOVLHaMEyuKhnpgYGfJPuN0E/xAwxVtaj6ZJ6Cw4VdrhJvUAPkNScz3XE7
         acJE2urUYkLmQsaprJrb/dxX/vBKivcW+JIwqCPnG2lDV27iwevK3fK7Q7Nc75Q4ZPyR
         Ll7Thriqe/Zlsm/TwEyo4lah5P2B86vF+qvBQRm0Piuw6kUf2ip9Vn5C8NXc68GH02+y
         znNg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8YLUDGiw35OwhBNAZe0neNzIUnAIiI3BhE49oB5AwU4sW6HpNMoLZRfo7JVlEFcL+rNEPcr3rdMe/FQw=@vger.kernel.org
X-Gm-Message-State: AFuF++nfTNcpyVz2cxhJxrzl/pf5BLBfNk6D89c2XEE+PqmieLV/SPad
	Yv2NmvME9+bc3ytgenaenTBks4z0f0op/bjGEVEj0DMBNJHWKSrORnO/9CkEEAd9LuEFnoiqsXs
	bpda0cCs=
X-Gm-Gg: AR+sD13r+/12RZb6C1bb8ge76qZoGxYNfOY4JpegsUQuyITNyKWFBAteUJblt/iVEXL
	fYSYgE77o75xN/6JqxP7z/vnxJrZt/NtdelFBLpm/cVC4ewiQb4HrUIVqvOsDnUQBg44QLByJG2
	lgcjBfubpkJehDvX4SpIm5c0L+ad+kTJMIAftGML4LmuxooeCWPeZ56BB+Zem+BQAdRkVMI4TvG
	z+2k0FwpBYvKAtnpG3IHgQRIA04E2Jdyoj5ez77MVE0vCE8t6AJjx2Ir6KzPZFITwNn/tvDUKI6
	o1ZiYoIzEngM37gOsRiI1Ww11OiR28GmIUWh5RjG0+CC2Gj2AjHBoOezXdDx1luqSri/3NCjdO/
	MApAtFyYcpfpdw8RXpJhnPGGeryCVQy6IpQa105MlnDBakoVeNQVcreM8K8X43cK5MfeQJV1Zst
	o9/0lgwRLfNQegHjo6k4f5AaGq4owOtwKxcFsCSTd0YIiMevJIHcoybuS3JBU9AQ==
X-Received: by 2002:a05:622a:4818:b0:519:8998:661b with SMTP id d75a77b69052e-53036cc568dmr52347051cf.20.1788353516104;
        Wed, 02 Sep 2026 05:51:56 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec824fsm17365906d6.24.2026.09.02.05.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:51:55 -0700 (PDT)
Message-ID: <d9071ec7-371f-4896-a023-77a07f01f65e@riscstar.com>
Date: Wed, 2 Sep 2026 07:51:54 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: use pci for device
 nodes
To: Rob Herring <robh@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-2-elder@riscstar.com>
 <CAL_JsqJJPdrYArNhbRPTM=scDghLAWe5=0a2+ACNaHe07h6-tw@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAL_JsqJJPdrYArNhbRPTM=scDghLAWe5=0a2+ACNaHe07h6-tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/26 3:05 PM, Rob Herring wrote:
> On Tue, Sep 1, 2026 at 12:21 PM Alex Elder <elder@riscstar.com> wrote:
>>
>> A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
>> be treated by the devicetree code as PCI buses, which is incorrect.
>>
>> An RB3gen2 system has an "interposer board" that contains a TC9564
>> SoC.  The TC9564 includes a PCIe switch with one upstream port and
>> two downstream (external) ports, plus a third downstream port.  The
>> third port has an embedded PCIe endpoint with two functions, each
>> providing access to a 10 Gbps capable Ethernet interface.
>>
>> The devicetree nodes representing these functions were previously
>> named "pci@" but were renamed in the interest of consistency in
>> commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").
>>
>> Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
>> treated as PCI bridges, which PCI endpoints are not.  The previous
>> name "pci" matched such nodes as "default-flags" bus type, defined
>> in the of_busses[] array.
>>
>> Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
>> bridge nodes by the devicetree parsing code.  This restores the
>> previous behavior, and allows them to be used for PCI endpoint bus.
>>
>> Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index a13315bf0fb07..99a985a177a61 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -954,7 +954,7 @@ pcie@3,0 {
>>                          ranges;
>>                          bus-range = <0x5 0xff>;
>>
>> -                       pcie@0,0 {
>> +                       pci@0,0 {
> 
> The kernel should treat either name the same. There may have been some
> reason 'pci' was not included in checks. It could have been that only
> old things are (parallel, plain) 'pci' and anything new is 'pcie'.

OK.  Does this mean "pci@" and "pcie@" should only represent bridge
devices?  (These devices are all endpoints and erroneously had
device_type = "pci" properties, among other things, so I'm already
fixing that.)

Do you want me to make a (separate) change to treat "pci" the
same as "pcie"?

> These are ethernet devices, right? Then the right name is
> 'ethernet@0,0'. If not, then pick something that matches what the node
> is. Both pci and pcie mean the node implements a PCI bus.

They implement Ethernet devices, yes.  But they are used for
pci-ep-bus (and the Ethernet devices bind to a sub-node), and
that's what's important about these nodes.  What's the right
name?  The dynamically-generated node uses "dev@".

Is "ethernet@" still right, if it's also used to access a
clock and a reset and ... via pci-ep-bus?

I want to use the right name, I'm just unsure about what that
is, given its use for access via pci-ep-bus.

Thanks.

					-Alex



> Rob

