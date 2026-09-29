Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBFE3ACEFF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669666; cv=none; b=Jrq4RPk+dLX9w9Ph/Hsm5OA2ss1IMM3x2f2QK98p3cxRTeOR9GP3pLoCTki/oPoDLApU1h+nNaYrPitQQjA6x3Xb5KedK91JiYK2ZYCBkHMZi7Xc85qeZf2UMWVkw1Hkqz+rX57OyXDMCt54bA4Fix3unRdq+kr5r3gEwtmKh8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669666; c=relaxed/simple;
	bh=LIHyxk0R1xJ4ROSOFxfRJzSZQA4fpHxRcU5DJ/EALMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTp+SDCjX7APGUtHW2XuTE9OSJxP2b2ohAhYuipRINtvzIHDBgIQ7JvPWVrKYfEX7z3/zcBBUdmw25dUe4GKJEBWkT2HYPVKLCl+UUAdfCf8opx5lTjEpX1Scn0MX1luhHLwbTffLJCxdo2vAjVepWkyRf+CRIyvrdHb3xn1ssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=coZTWqTT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="coZTWqTT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso8855965e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790669662; x=1791274462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfRVF/0pUKYKb8L3URhvanQPa9F0a2plxZV30Tx9qjY=;
        b=coZTWqTTXp/Okj5ajZA+JHks5sAoGvfOaEavS2BGQ+jkw/zXToijK6RRkLpL6kxRiC
         5RT2uRlNwAy8AhPJRsYGxosIX1DLK55/5nQnxLeAkOusxwFOlqwmJwfir45iUTECDyL+
         u+savtsmJOizFvUvyVcimEY3rWWbMlQ7wQEVGGywrmpam9laifOVPqV+8SY+1jXKmjXa
         5D4kI1qu/YisS82KygGAgDc3RDar8SdwjXOuYpx7qYC9d8syKMc7HDSHUad+CZRoHJu1
         G2MukaVqAS2hE5ZJu+0abyHwpicRcP4+fu68mduh53zgN6PR+AKgHL+R5iHkXX8X4Ybk
         BQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669662; x=1791274462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfRVF/0pUKYKb8L3URhvanQPa9F0a2plxZV30Tx9qjY=;
        b=02iuRB5ETv9AvWZLai8PUDnuV2rFAnsoQLyVWxoCrrJrP42X3JH4jpk67/XKBfaOe6
         99aUNKcPDGCJalTeq2EFUyHHEKTYwzrUawV1iiLVKSL7VPWP8KiCm/8LGNf0Sdz6BtU8
         4Big7bNBzpUZxwk8Hv/CyT34c0Tkvw8kObCVM8KLqQYBaFBH7x1/LICw+BswvN4uxdJI
         6xWtF9VKKVIc/bSc52u6DB41f75rNkxdv4Qx3mmqlarGlGKJDTfKBpikWTMht13BUXuo
         b7ie9woFnUMkyt/HXUjc2wJfjwp/ZN2dXjGmywPoT0Kn4TJIkuSR771S1P7trNEOsNxR
         r16Q==
X-Forwarded-Encrypted: i=1; AKwUvByHhq4a6gzucRISwMxT9/QJNiGPazu1WWilDyu7Ye0eW3ydHL06Rm+oWWzE+7ZNZchXVNwQRu13RHgkuBg=@vger.kernel.org
X-Gm-Message-State: AFuF++kBfwbJgQ4JXnihLsVQFOalsnnimvLq5qTYpm+c+NYIGQGmbkwy
	oCmSSyrnVeiVDXUp1DpMBIJ+F7WXGtOEkJ7pCIEUCgkdoK9YWYJf9DbaxPW6QoGNIHA=
X-Gm-Gg: AYBFou0ybgtMYKPlJJHveQZmigA++NLpe2aRehq310yE9DACx9B6CQJAABof0qMVbJA
	aSZ31fytnswrshM9QWgxmVaEts766sIuB/Oe4pNL2QHIK4uNcQ4m2sA6GbCAqZK4FjSRrBq92nO
	BOYq5OV9c5Zyq5PjJw/S3LG9tWhRh5SRm2GyAh1QpTsxiIkiPG2Cuo8A6Hj4RhM8bpfqJY7+O4j
	IIqnIMubEKEEwUdyxVBe77hlaOEO/JM4ZpiG29cicLEcA+VfjMF9jSEt8C36nWrA4SJyo/3uYl3
	7vVcqfdkdP9uMSbFxWQiPLkWFvrwJAtQWOQE2P4KlwAOrXfU9c91eZOAVXPs42pUkb7lr7ZTcz6
	zvbiScwW0N/zMlGGEVZPXcmsLSuH7tmp/IrIpozjclwYTUvFXlzhdeL/fvsjF5Rp5tuUOhxUh7x
	yDQXLgSmL76gWJZJHo/YMAcZJp4kulbTkenF7TfDdpDBZhqV0q7t8ZWp+TQLlPMSgYs6ParTFJw
	ke5StR8ig==
X-Received: by 2002:a05:600c:8411:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49fe66ef334mr254737745e9.25.1790669662517;
        Tue, 29 Sep 2026 01:14:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:e613:f8b0:9fed:6cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c0d538fsm62057605e9.1.2026.09.29.01.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:14:21 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:14:17 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH net-next v2 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
Message-ID: <artzWeUgTHvGzo1m@linaro.org>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <ca3c86b6-c837-4298-a1ab-4fc61a2f8a0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca3c86b6-c837-4298-a1ab-4fc61a2f8a0a@oss.qualcomm.com>

On Mon, Sep 28, 2026 at 04:02:47PM +0530, Vishnu Santhosh wrote:
> On 20-09-2026 08:32 am, Vishnu Santhosh wrote:
> > Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> > domain with restricted access to system memory. BAM-DMUX DMA mappings
> > and BAM descriptor FIFOs must therefore be constrained to a designated
> > memory region that can be shared with the modem. Accesses outside that
> > region can trigger an XPU violation.
> > 
> > Add memory-region and qcom,vmid properties to the BAM-DMUX binding.
> > When qcom,vmid is present, the driver SCM-assigns the entire restricted
> > DMA pool to the local and remote execution environments before requesting
> > the DMA channels.
> > 
> > The restricted pool then contains the BAM-DMUX mappings. When the BAM DMA
> > controller references the same pool, its descriptor FIFOs are covered by
> > the assignment as well.
> > 
> > A related binding change allows the BAM DMA controller to use the same
> > restricted pool for descriptor FIFO allocations:
> > 
> > https://lore.kernel.org/all/20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com/
> > ("dt-bindings: dma: qcom,bam-dma: Allow memory-region property")
> > 
> > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Replace the Shikra-specific compatible and coherent RX allocation with
> >    memory-region and qcom,vmid properties.
> > - Use a restricted DMA pool for BAM-DMUX mappings and BAM descriptor FIFOs.
> > - SCM-assign the complete pool before requesting the DMA channels.
> > - Validate the remote VMID and restricted DMA pool configuration.
> > - Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com
> > 
> > ---
> > Vishnu Santhosh (2):
> >        dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
> >        net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
> > 
> >   .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 +++++++++
> >   drivers/net/wwan/Kconfig                           |  1 +
> >   drivers/net/wwan/qcom_bam_dmux.c                   | 95 ++++++++++++++++++++++
> >   3 files changed, 134 insertions(+)
> > ---
> > base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
> > change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
> > 
> > Best regards,
> 
> Hi Stephan,
> 
> I followed your suggestion and updated v2 to use the restricted DMA pool.
> 
> Please let me know if this approach and the implementation look reasonable and
> meets your expectations.
> 

Thanks, the approach looks good to me. You received some comments from
others and Sashiko already, so I will make a more thorough review from
my side once you have addressed (or at least considered) them for v3.

Thanks,
Stephan
