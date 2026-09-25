Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1A260565
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302543; cv=none; b=P3FztbwycIhaD8xJm2qzs1TTLpza9DfCXf4nUQnqLxJJ9H31H2bWVVGwSXIzr2ApyVJeQtgHfELHwqsk6pd/VQADU+OWXPEphhyO3FwxVvD4uEF6d66Lix38ZMi1CJ5Cl/ubdOyHNOh7nZzKgFLNQWtMxIgRDWlSo9L8VXxapI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302543; c=relaxed/simple;
	bh=VgMW57RZXFMRplMPDkt4YtM8EkWBpLPXc4KI0WuDdx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTwlOkF5v+MIPwGe0pGCvioTvxM5jrD0QpXOkrl+19m2o2Es+M91dOb9vSYGta8g91aV4DEhBzOtha1kG0NusGgtgK21zVS2WyDveoXuHVq6mHmaxz3Y9++XZSx8YQwaa1quEqkv2C3JEh+apF6Lh3t2R+kuRcmdQ47dXJ5+0xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=cmErwvOF; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="cmErwvOF"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76bcb1eso5611481cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1790302541; x=1790907341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+htwMlyXVmeIg6mLkEPL+JS0CurEY9XR8VLPuog5Nk=;
        b=cmErwvOFMCdz2hi9aonzBXGjBGvC23thkU4XAWE/220wIUYvVx7RKHGbZveyj7/tQp
         BlitcD90TZ8KEt/JMbxbidbXElWXdzZIyYgefPmVJ/AWxYIz/wrOZhuubTHTf36i0TmK
         oGzvw9yiJB+tQ+nie5wGeGEXkbSidtHNzDo6pRp003ANKHjVz+zjKeGmlCFuyen7Jf14
         Pp+nx5vcnHEh+USjChIXOtfRCy9DH2atMw2lkWgyBAe6gUZvrc5F5h05kInSwwn/NO03
         86nz91XoeT94GY0agI+txMMnyU7ustudn7ZEgXhBkAumFCZjCnmuDO6/i9nHE/iW3kNG
         Pq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790302541; x=1790907341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+htwMlyXVmeIg6mLkEPL+JS0CurEY9XR8VLPuog5Nk=;
        b=1GaP7Z309zJHvRD0rvuNbZZPLcj7sbopLGsY7uFihPn0nO9g2jOCDaDijGS3bDv0+R
         K8M1wWokUcwTiE31evwJR+1XMjW3zUkmchczSRlWYuSs5SBUOTRMLqkmANRY59s8m51m
         cHLlNfmWvKq2QquN0u/tP6rMWbglG21+dXp9L2zAASD8FFXJ3/nYGDDgrphHSBUrl/mN
         1w+T+SuPQGmnnDaf0PiVRy3P/ruUawZ9796gw2hQ0m3Ymx5Iljb6o4VMb2n6CkXliL2C
         bWLv5dD9WPXlvdWPauWXrNoEWhzF5vI0nPwFlh23B1EX5LJx/gEP9voK8cKFzwd14ZDn
         4i8g==
X-Forwarded-Encrypted: i=1; AKwUvBwh20yDXFf1BvTplIMDauCgZNwDfWUNAH3ZNdtyX+cetuOY1jtxCIXRe71UbSJAL6VNI8RezL/BZ9WtruE=@vger.kernel.org
X-Gm-Message-State: AFuF++kswHiOrH8TvhDqEjLpZ1jB6TB5QJVqnxYuJw8EkqWEUmHeVTfC
	ZbB29StH0qE6dKNTqzn/+T/RDKpYkJ1hKiJTgvXYjz+qVTlhVtlMEvEWHooycYFoqwQ=
X-Gm-Gg: AYBFou3zc4umpxgJ2de5auR00COFHuw9SNKKLDS7233yy5N5EIlYKhIEbkS25rg0cG/
	4RcAjhpBgkw4mdjD4tZmEYYHnTxqa+niqDQIgydSlugfOqGfkJrwoVGf45efcDs5n0ZT0HVeMAR
	PMWkM/6SnQ5qKwulYaNakqwCl7nRl2iNffxjETdphN45dPAjyHbfmwvn7Wqax9JNPMCPMaNJhxb
	iAjSkF7anM0Hp7x07WdVUJ3JXp0LYnJOpQXQjj++QX3K/5KCdXSlPHkFvRJsHI8TaA4eEpMqL6k
	z2kJqvglqpb1B7K/eqevKDOIqR9XsfnOOV1wYkd2UwV2W12wWMP+ItYlW5B2K9nznAiTBuH3rDI
	oWDrCG+TbdsfdIJApKVurciIN8kxWaXnj2u4eGOmVOR21TyyC4c4skjLq3z85+OxGXMx2+KydQ2
	eBMsRcdGKlirtRO11wgFhZg9JI/UkQPnLgfkWj1w0+cJDBpqc5kiM/5Yk9Pyzlabviore+OKviL
	him5URcgQ==
X-Received: by 2002:a05:622a:1aa5:b0:530:dc0c:abc5 with SMTP id d75a77b69052e-5330dd22227mr14610891cf.43.1790302540784;
        Thu, 24 Sep 2026 19:15:40 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330beed0easm6143641cf.11.2026.09.24.19.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 19:15:40 -0700 (PDT)
Message-ID: <45f41257-45f7-4940-a8af-d12e3669bc7f@riscstar.com>
Date: Thu, 24 Sep 2026 21:15:38 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] misc: tc9564: introduce base PCI driver
To: Herve Codina <herve.codina@bootlin.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 bhelgaas@google.com, andersson@kernel.org, konradybcio@kernel.org,
 abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrea della Porta <andrea.porta@suse.com>,
 Lizhi Hou <lizhi.hou@amd.com>
References: <20260918173003.GA1166280@bhelgaas>
 <e9bd7954-1cec-4ffb-a5b2-2389469b0c05@riscstar.com>
 <20260924175603.2a20e2b1@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260924175603.2a20e2b1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/26 10:56 AM, Herve Codina wrote:
> Hi Alex, Bjorn,
> 
> On Fri, 18 Sep 2026 12:49:53 -0500
> Alex Elder <elder@riscstar.com> wrote:
> 
>> On 9/18/26 12:30 PM, Bjorn Helgaas wrote:
>>> [+cc Andrea, Herve, Lizhi for of_pci_make_dev_node() quirks]
>>>
>>> On Fri, Sep 18, 2026 at 10:26:57AM -0500, Alex Elder wrote:
>>>> The Toshiba TC9564 is small and highly-specialized SoC that implements
>>>> a PCIe switch as well as an Ethernet AVB/TSN bridge.  In addition to
>>>> these, the SoC implements other functions, including a reset and clock
>>>> controller, an address translation unit, and a few other devices.  PCIe
>>>> BARs provide access to registers that manage these IP blocks, and the
>>>> SoC is modeled using a PCI endpoint bus in devicetree.  This allows the
>>>> IP blocks to be bound to platform drivers that do MMIO via the PCI BARs.
>>>>
>>>> Create a new PCI driver under drivers/misc that binds with the embedded
>>>> PCI endpoint functions within the TC9564 SoC.  Because these functions
>>>> will use devicetree pci-ep-bus to provide access to other IP blocks
>>>> within the TC9564 chip, the main purpose of this driver is to do basic
>>>> PCI initialization, then call of_platform_default_populate() to scan for
>>>> the any endpoint bus children, and probe all devices defined therein.
>>>>
>>>> Because we're using pci-ep-bus, we need to use the PCI quirks mechanism
>>>> to have of_pci_make_dev_node() be called for each endpoint device in
>>>> pci_bus_add_device() (via pci_fixup_device(pci_fixup_final, dev)).
>>>>
>>>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>>>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>
>>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# quirks.c
>>>
>>> Not an issue for this patch, but I'm not sure the quirk mechanism is
>>> the best mechanism for doing this.  It's not working around a device
>>> defect like most quirks do.
>>
>> I pretty much agree with you.  I think I mentioned this before
>> (though it might have been in a private conversation) that it
>> is an intentional act to call of_pci_make_dev_node() for an
>> endpoint (and not just a bridge).  And that's different from
>> a hardware quirk.  You only need to do it if there's a pci-ep-bus
>> sub-node on the endpoint.  (I'd have to verify this on the other
>> users of this approach to be 100% sure though.)
> 
> I agree, a quirk is not the best way to trig the of_pci_make_dev_node()
> call. An allow-list seems better.

We're talking about calling of_pci_make_dev_node() on
non-bridge nodes in pci_bus_add_device().

A separate series I've been posting is updating that code path
so it updates the ranges property even for (endpoint) nodes
that have a non-null devicetree node pointer.  I use the same
quirk to cause this to occur.  But now I realize the quirk
might be intended to create a *new* node, so I may have to
re-think it a bit.
   https://lore.kernel.org/lkml/20260924222444.1351466-1-elder@riscstar.com/


Are there any cases other than a PCI endpoint having a pci-ep-bus
sub-node where of_pci_make_dev_node() needs to be called on an
endpoint?

Could we simply call of_pci_make_dev_node() unconditionally in
pci_bus_add_device(), and have of_pci_make_dev_node() only
proceed for endpoints that have such a child node?

(I haven't chased down all of the PCI quirks that call
of_pci_make_dev_node() yet.  Do the XILINX examples use
pci-ep-bus?)

> Alex, on LAN966x, the pci-ep-bus is not present. The OF node must be
> created (call to of_pci_make_dev_node()) and the lan966x_pci driver
> will apply an overlay on this OF node created at run-time.
Understood.  But the overlay does contain it.

After applying the overlay, the driver parses the node
(using of_platform_default_populate()).  And because of
the PCI quirk, of_pci_make_dev_node() gets called for the
PCI endpoint, right?


So again, is calling of_pci_make_dev_node() on a PCI endpoint
*only* related to the endpoint having a pci-ep-bus sub-node?
When else does a PCI endpoint need a devicetree node?

					-Alex
> The pci-ep-bus is described in the OF overlay [1].
> 
> [1] https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/misc/lan966x_pci.dtso#L50
> 
> Best regards,
> Hervé

