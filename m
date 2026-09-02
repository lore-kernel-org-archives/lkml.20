Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F7A47D443
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374406; cv=none; b=sIl9X5FruhjDVZIX+ILI5e5ni1sz4iE7NsCXoV6DMPKP6NXh18Z/07pcUQ0UEiqInPxIfFd2SyZcG3JB+jwehBl52BYwnZKiZdF8WiayzQO/nZrn7rmqdMNgVy/KvMvifCKrBRmtzwhyHFRQxRD7/3+dKgEkzKxKP5to77mgMpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374406; c=relaxed/simple;
	bh=v6L+/uGgvk3APDzEHSqyzzlWR/+pfEbRhnJsGgDsfQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VD20Udge2GKSRSNi2PFZC+VGfRodi/hIpEQZrazVyFwFx7MefU4AP8zLJxBtgLawuvSwtDs6dUC0jVWo1APUdNb1ZdTX5E8oThMSocTFBzgutnt+Rw/DObbDMepEbVWQwVy2v13hjaMaSHGpVJ7MDb5NTwjtS/yuaoNtrDYqsBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=OuRxzQvs; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="OuRxzQvs"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9309d4ea213so168651985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788374403; x=1788979203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNieo4VVBlamLigtLa1PsLwlHcypSQkvEJk+H+7OF08=;
        b=OuRxzQvsxzENLQox8enZH/NVrngaV5aKZRhdqJV8hjaLsBVNisGMButgXyGhbSxmMb
         F+7nikPtKNKSrIMvVDx7crJLzHK26ks5cO0ePA4prisxdLJrspA73O6Jcv5P4krduV7T
         FUINdogZKaGasnD3qw/bSAdhrqbqEWi3rXXMkHhHYT2KHAutsHv/9XA1bAVRvBSqpBtl
         AUoDDYSKwydL27saxCogm9JhJoAJeNT4byIfauz17MJ4KrWtlD0JjjSawdaWJH94LkPt
         jhT2mZS3GiaMSbPOiV3Pp2mUaEKA7yHyuOG5KEuIxqxcp07rwcvPpkgAwawO1loDIi1r
         Gy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374403; x=1788979203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNieo4VVBlamLigtLa1PsLwlHcypSQkvEJk+H+7OF08=;
        b=oOPfZ1rpXIZnfOCIn00zOOWefAqT6d1PlwpfdwzzwSgV3/I15bQCUffNytYIj6uI2t
         4QSz+IBoMelFjoR10EHVMMlqyvx8Hm/5ubWCsRy+ehfqgKUjK1dB2K8TSMZADyX3uH8L
         5wWNo3s4MeqE7DUkEV3AJLgtFUkSN7w1N9/cll+Wr4rdlhsAELxcjGhDfD4HJbenLA7f
         HbbrY5VqINc/RwYneD+Es9NcQf1wIQ4aiVpYlN76wTEodlZYP/W/5ERjidYzDTmHaWg9
         1B1o30hPBTSEKGowR+WsEONbAqKMVf3nDD6E77xZS91Sb3N39P6pq1DTuFRm+/1o3BzO
         h5yA==
X-Forwarded-Encrypted: i=1; AKwUvBwMmjiT0FDPBuXIXpIMS5Ca4QcIOnGEZsGf58jCvuj6DnLp/YY8x0AiVh/Nn4ECwIVOLyggOImJJ4mqecQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mqE4TKpwIurt67JBAqHCG9ouoeBr1DOlJVz2WycZ4KfvXKYfN8
	8NzZcPetKMXrPg3Nnb4ZCAVQlFf2gt7enFPTXQblL4P/PyXRxQXd5/MrZabOcvHEXVE=
X-Gm-Gg: AYBFou0h5NqxhDwfn8+8/VKTfvlJBATaFrfgveBepOugssrtMfikfmDzVsBXlipI22x
	1K+2tmHXXjp17c/r6mfhqu0RH/92GoxjuU2msjqwj9UzH8NeAX9m53bEMhOVybWZcAlGiMQsqSk
	10BzwxS/mCxpy5aUHEHECEETMzgQtMP6LqgCXhKQAC9f+/uoCMNJ+PNZ0yApKsAZ1wpEErLsWhK
	sn8LzsJCSMzClrH7f2kh6xgig1FFN9weIuqhBNhnVXU17RbBt1N8ujzuSrBCAleK4FTvXvCmgZ/
	nMSpnoNjiXwB5DfnKN1aHSRIylC3iqH0rM+/AG484hdpIVG5YKNMJhUVVeuaTRpKEUcRO6hGH78
	LkrpO2Jd61PcJ5ijERNmThBD4zsR11JRNLdRU5GXPu+qmFS++2RwgjuoAvHDQk6Vvi987P4gYC+
	T9n9ElnMWOIUNCmT50FaE3lGeuPDsu8wPId5Sz6VeIXOtUceP9amjCBNfM/sMV
X-Received: by 2002:a05:620a:7086:b0:937:631:4dfc with SMTP id af79cd13be357-93960ffaa7cmr731295885a.42.1788374402764;
        Wed, 02 Sep 2026 11:40:02 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f396f2bsm272551685a.33.2026.09.02.11.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 11:40:02 -0700 (PDT)
Message-ID: <9cc30f76-1fb7-404a-a6d6-84eb3f825e2a@riscstar.com>
Date: Wed, 2 Sep 2026 13:40:00 -0500
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
 <d9071ec7-371f-4896-a023-77a07f01f65e@riscstar.com>
 <20260902165325.GA1440252-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260902165325.GA1440252-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/2/26 11:53 AM, Rob Herring wrote:
> On Wed, Sep 02, 2026 at 07:51:54AM -0500, Alex Elder wrote:
>> On 9/1/26 3:05 PM, Rob Herring wrote:
>>> On Tue, Sep 1, 2026 at 12:21 PM Alex Elder <elder@riscstar.com> wrote:
>>>>
>>>> A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
>>>> be treated by the devicetree code as PCI buses, which is incorrect.

I respond below, and have a plan for moving forward.
>>>> An RB3gen2 system has an "interposer board" that contains a TC9564
>>>> SoC.  The TC9564 includes a PCIe switch with one upstream port and
>>>> two downstream (external) ports, plus a third downstream port.  The
>>>> third port has an embedded PCIe endpoint with two functions, each
>>>> providing access to a 10 Gbps capable Ethernet interface.
>>>>
>>>> The devicetree nodes representing these functions were previously
>>>> named "pci@" but were renamed in the interest of consistency in
>>>> commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").
>>>>
>>>> Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
>>>> treated as PCI bridges, which PCI endpoints are not.  The previous
>>>> name "pci" matched such nodes as "default-flags" bus type, defined
>>>> in the of_busses[] array.
>>>>
>>>> Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
>>>> bridge nodes by the devicetree parsing code.  This restores the
>>>> previous behavior, and allows them to be used for PCI endpoint bus.
>>>>
>>>> Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>> index a13315bf0fb07..99a985a177a61 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>>> @@ -954,7 +954,7 @@ pcie@3,0 {
>>>>                           ranges;
>>>>                           bus-range = <0x5 0xff>;
>>>>
>>>> -                       pcie@0,0 {
>>>> +                       pci@0,0 {
>>>
>>> The kernel should treat either name the same. There may have been some
>>> reason 'pci' was not included in checks. It could have been that only
>>> old things are (parallel, plain) 'pci' and anything new is 'pcie'.
>>
>> OK.  Does this mean "pci@" and "pcie@" should only represent bridge
>> devices?  (These devices are all endpoints and erroneously had
>> device_type = "pci" properties, among other things, so I'm already
>> fixing that.)
> 
> Yes.

OK.  This means that these nodes were misnamed, and that should
be fixed when addressing the broader problem of describing
these nodes as if they were a PCI bridges rather than endpoints.
That problem is addressed in this other series:

   https://lore.kernel.org/lkml/20260901013654.1343537-2-elder@riscstar.com/

Lots of reviews on that...  But I'll submit *one more version*
of it, as described below.

>> Do you want me to make a (separate) change to treat "pci" the
>> same as "pcie"?
> 
> Only if it fixes something besides consistency.

I have no example of this causing a problem, so I will not
implement any such change.

>>> These are ethernet devices, right? Then the right name is
>>> 'ethernet@0,0'. If not, then pick something that matches what the node
>>> is. Both pci and pcie mean the node implements a PCI bus.
>>
>> They implement Ethernet devices, yes.  But they are used for
>> pci-ep-bus (and the Ethernet devices bind to a sub-node), and
>> that's what's important about these nodes.  What's the right
>> name?  The dynamically-generated node uses "dev@".
> 
> I don't love 'dev', but don't have a better suggestion for it.

OK.  The only reason I like "dev" is that it matches what the
dynamic PCI devicetree nodes are named.

>> Is "ethernet@" still right, if it's also used to access a
>> clock and a reset and ... via pci-ep-bus?
> 
> "ethernet@" belongs on the node that has ethernet-controller.yaml schema
> applied.

That makes sense and it's actually how it's done in our code
currently (not all of it is currently out for review).

>> I want to use the right name, I'm just unsure about what that
>> is, given its use for access via pci-ep-bus.
> 
> I don't know if there's a right name here. You just can't use a standard
> name if the node doesn't implement what the standard name defines.
> Granted we just have a list in the spec and some names (e.g. pci) imply
> more that other names.

Here is my plan.

First, I will use "dev@" rather than "pci@" for the names of
these endpoint nodes--in all of the affected Qualcomm DTS
files.

Second, rather than doing that as a follow-on to *this* series,
I will instead post version 3 of the series linked to above,
adding to the changes made that the names of the nodes will
get changed as well (for the reasons covered here).  I therefore
retract this series, because it will be merged into the other one.

==> MANI, KONRAD, ABEL:  I am going to keep your
     Reviewed-by tags on the new version, because I think it's
     more likely than not you agree with this change.

     Please just ask me to remove it when I post if you
     disagree.

					-Alex
> 
> Rob

