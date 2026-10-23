Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792755184;
	b=cw2DAaREf9IJIsFsfBRM6RA9HT/JPSrg0IN+hirLsIt0aMOt84jCZ6DMxYsf08tTxi2/
	 p+9dSXcntuh4vY4OENCvA/TWrsfi7VHt8Xpa67eb502sV/XpmBOuCDlsyhdyCH2l7BifY
	 nMhSyAyIp0iuTMXu2ZH/RJL3M6YC0ujx0AjFJ7LaTX2EdQVgZET57P0ADKIKpxZaeR0ZA
	 v18FX9wddsXWCyU8AJVBNcyiyWMxzp6NP/AUmJ1QJunAQMJ6f4zWHCYp0SdnZyC+OVtgB
	 w8/6y142HcB9rS/4vmXSbRTO7OEFfca+4sNwFwM96WVMY94bbI0mTP8DoN8ekhCNc7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792755184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fdSFKhLyq+f/LPR+Elw+N0tvbajLhBax4+wIFI94BGw=;
	b=RK9mDMGM5TaChgKJWsweStbpKyOWsi20NwAlPxG0ldluNNODgcUW3C1TMNktKUdALxxN
	 wQKTyFD6r4Rln4tnmOZIWiWwgdjLAaxQHryT+gH7UUf700BackyZMvP7/fDDH3KTNhAQ+
	 /afA6thpntt/gYDwv+GbevWA4+/OC9RCs5IhqvW7YHxl/VQKLFRPA8GZKStygMFnyb0qW
	 ZYt8dwG8Rqd31jDVJp6NjsAF1FTPPqqdPaRN86FXMqpduTKPQER3GEfRmQW5pwSvTvb9q
	 LZQ7HU1NenpO5hYPRC9g+WWxG12WbseIbUH6pXDVi0e1Wwhcz9wMBcuz/bPJbQYWyxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A42606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A42606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso588127e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792755181; x=1793359981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fdSFKhLyq+f/LPR+Elw+N0tvbajLhBax4+wIFI94BGw=;
        b=o5mqCZ00odCrExrD11a8TQy3EW58HclX7IVqpQJ0aDtWC4PHIEIWoOWOKvywUDnzAd
         DQRElDaotMo1+P0QYKFYd7s/m1DcEvsPXoKyUDjFbS67qQgaccU7N/EGQ2BCSpSiy8aP
         a6hS5FA7hu4/XfqlZBvoNYutK3cEe/AuVErU6MbQoeIRB1x1AgJsVLaFu8PPHqGRh4u+
         gpsm4WnhyiJs7FgKmNvEmjXOsa60lWScECOtP086oMSK75U/Dw1vjafZ52OVaqhQHXGM
         3vdOCLXG4w2J3qPGDr9aTud0qm6dhzAvgBDNwzKDcyit/0arZwp80ul9KDr+al2XIQVE
         sHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792755181; x=1793359981;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdSFKhLyq+f/LPR+Elw+N0tvbajLhBax4+wIFI94BGw=;
        b=OAXNhnFR0mKEktvvOaXODvaRUQfxeS+Pg6E/AJpGkWwBpV/wwtQ4AS+7ezAZII62TO
         a2rg8Tj9TWXcqRkzsGrIjMGt1V5dIxeoAI8Cy66X2ZSjyFXsPc5kayISNvXT0YhZqaqY
         XJSSC22Wm+jgciSepus4G6Dl0WukRvHPDeY/c+U3QVTM7XJQw8enN8wLkyaELLbENH8k
         KtMG3xqqCysE9mGNNp0Alt5D88ysIfeE0AVgvoVHK3SlxUOLR5Wi8tEyvPro7dv9fJ42
         vc8STiuMIoAPc7Gy63+521BNlUsXVTaLgPWSe+n/FJrApKu9V67vXDquch8KZxHEQa9B
         sHxg==
X-Forwarded-Encrypted: i=1; AKwUvBwiEMg0vDuGe9Rt+PKFNlu8p6qcC64HNx0fm+zEUhlz/qVh8cLikC39UrY12AM2bfywqUPYISvsYtabilw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlINYgDLU48sRO7TImi+515TTUWk2kJArRuYqQMLQtZwOwjAl5
	EQ42LUsOjAmz22GioeaoZAxXhW3E6jzicMeU6hxkkayR1MYYBCighIX6PBrv4aDBOSQ=
X-Gm-Gg: AYBFou0vPZqJcLlVeNLDO11PEi0Bl/Dj9bJywxmmQ0GSVB6l8oxXqQoejSG9URTVYpz
	xkJ35hhTOnyi5pzRSfwngDJPl8lEzeFhTsrh1/22v13Jqp4Rag8dtZt25XlA9Ysu83vq6AQl6J1
	/QlyF4gMrlQz57dhSdg31JO96l2sFkXG8AqaMLbUym4JxOHZy7PIwkYnjFI2vGG6w2r945SB/jQ
	pIv2GOQ7uoO4bjIWLTDOJRQj/dZ8xHoFiwJhDdbFN3gA/9s4adrH+tnJ8dYigA5+hVqyopZWT/+
	06sIkplh+qNBPsHafZNWc0Z0aw56bsH9XyyDakwJTViuphhZ/+3mgHmyrp3A9bvVeNNDbEyykTX
	97pgo4gw3tttrOvJZobsZUtwsq+HsWbWFcFq/Fj6NxhcVcA3lUokVh0sc2tA/tKLEbsP2fMhPRx
	UUoXPuxX7NIBR30zfpkv6wCT7JsE/qg87VsFx1beXQEM8hQHJH/wWStummhI8ypy8PYllYX0TdI
	wXPSWA/OZKuR5g+DW1BTgns2RcMrk2mEPfafKDz5A+xKXcYplIWURCe+uMYCJdLiJ0=
X-Received: by 2002:a05:6512:3b94:b0:5bf:aee8:7b4f with SMTP id 2adb3069b0e04-5bfb0b35f08mr746484e87.27.1792755180559;
        Fri, 23 Oct 2026 04:33:00 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02732f4sm349248e87.27.2026.10.23.04.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:32:58 -0700 (PDT)
Date: Fri, 23 Oct 2026 13:32:54 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <atspV8U9HCw68My9@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <yq5a7bjajaco.fsf@kernel.org>
 <atooh7uO2RauUTfY@FV6GYCPJ69>
 <yq5av76sj10a.fsf@kernel.org>
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
In-Reply-To: <yq5av76sj10a.fsf@kernel.org>

Fri, Oct 23, 2026 at 10:04:53AM +0200, aneesh.kumar@kernel.org wrote:
>Jiri Pirko <jiri@resnulli.us> writes:
>
>> Thu, Oct 22, 2026 at 12:30:47PM +0200, aneesh.kumar@kernel.org wrote:
>>>Jiri Pirko <jiri@resnulli.us> writes:
>>>
>>>> From: Jiri Pirko <jiri@nvidia.com>
>>>>
>
> [ ... 67 lines skipped ... ] 
>
>>>>
>>>
>>>I am using this to understand what the IDE setup flow would look like,
>>>but it is unclear whether the connect flow belongs in an attestation
>>>framework. I understand the desire to pass the certificate slot number
>>>as part of connect, and sysfs is probably not a suitable interface for
>>>that. However, is CTLV the interface we want to use for connect?
>>
>> I was thinking about this and "connect" really does not belong in the
>> attestation CTLV (same applies to "lock"). I was thinking about some
>> parallel PCITSM CTLV instance, but that does not really click as well.
>>
>> Currently I'm thinking we can maintain existing "connect" in sysfs and
>> extend it with "lock" sysfs knob for Realm side. Both would create
>> ctlv-attestation-spdm instance. The same spdm instance may be created
>> for other non-PCI-backed device.
>>
>> The proposed host flow is:
>>
>>     sysfs connect: select tsmN and prepare the connection
>>         -> negotiate SPDM and discover certificates
>>         -> register ctlv-attestation-spdm instance in DISCOVERED state
>>
>>     SPDM_GET
>>         -> populated certificate slots and digests
>>
>>     EVIDENCE_GET(CERT_CHAIN, blob-instance=slot) /*optional*/
>>         -> retrieve candidate certificate chain for appraisal
>>
>>     SPDM_AUTHENTICATE(device-generation, spdm-slot=selected_slot)
>>         -> authenticate the selected chain
>>         -> complete backend-required session and IDE setup
>>
>>     sysfs disconnect
>>         -> remove the attestation instance
>>         -> destroy the native connection
>>
>> The slot is therefore selected after discovery, rather than supplied to
>> connect. The attestation instance represents the prepared connection; it
>> does not exist beforehand as a controller for a disconnected PCI function.
>>
>
>CCA currently takes the device identity index during pdev_create. I am
>investigating how to retrieve the certificate chains for all slots. For

Yes, that is the ordering issue. My current proposal is to perform
preliminary SPDM discovery in Linux before PDEV_CREATE:

sysfs connect
    -> preliminary SPDM negotiation and discovery
SPDM_GET
    -> report populated slots discovered using GET_DIGESTS
EVIDENCE_GET for each populated slot
    -> return its certificate chain obtained using GET_CERTIFICATE
userspace selects and approves a slot
SPDM_AUTHENTICATE(device-generation, slot)
    -> PDEV_CREATE(id_index = slot)
    -> RMM performs its own negotiation and retrieves the selected chain
    -> compare that chain with the selected discovery result
    -> SET_PUBKEY and complete SPDM authentication and IDE setup

Makes sense?


>now, I have implemented the sequence below.
>
>echo tsm0 > /sys/bus/pci/devices/$DEVICE/tsm/connect
>
>./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 device-get                                                               
># device-get, 1 fragment, generation 0                                                                                      
>  device.generation 0            
>  device.caps                                                                                                               
>    cap.evidence                                                                                                            
>      cap.min-challenge-length 0                                                                                            
>      cap.max-challenge-length 0                                                                                            
>      cap.max-total-output-length 369098752                                                                                 
>      cap.evidence-flags evidence-accept
>      cap.object                                                                                                            
>        cap.blob-class cert-chain                                                                                           
>        cap.blob-instance 0                                                                                                 
>        cap.format spdm-cert-chain
>        cap.representation raw                                                                                              
>        cap.representation tcb-digest                                                                                       
>        cap.hash-algo 4                                                                                                     
>        cap.hash-algo 5          
>        cap.hash-algo 6                                                                                                     
>        cap.max-length 16777216                                                                                             
>  device.info                                                                                                               
>    pci.name 0000:02:00.0                       
>
>I think we can use evidence-refresh to select the blob-instance for the
>desired slot once the CCA specification supports that.
>
> ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 state-get                                                                
># state-get, 1 fragment, generation 0
>  pci.generation 0                                                                                                          
>  pci.connected 1                                                                                                           
>  pci.locked 0                                                                                                              
>  pci.accepted 0                 
>  pci.tsm-id 0                                                                                                              
>  pci.dsm 0000:02:00.0                                                                                                      
>
>device is marked connected, but IDE is not setup as indicated by pci.accepted = 0
>
>
>./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 evidence-get --json '{
>"evidence.challenge": "hex:", "evidence.object": [{
>"evidence.blob-class": "cert-chain", "evidence.format":
>"spdm-cert-chain", "evidence.blob-instance": 0,
>"evidence.representation": "raw", "evidence.data": { "file":
>"/tmp/cert0.bin", "data-buf-size": 16777216 } }] }'
># evidence-get, 1 fragment, generation 0                                                                                    
>  device.generation 0                                                                                                       
>  evidence.generation 1                                                                                                     
>  evidence.object-length 1632           
>
>
>I added the file: attribute to verify the evidence blob's contents. ie,
>we can do:
>
># file cert0.bin  
>cert0.bin: Certificate, Version=3
>
>./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 evidence-accept device.generation=0 evidence.generation=1
># acknowledged
>./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 state-get
># state-get, 1 fragment, generation 0
>  pci.generation 0
>  pci.connected 1
>  pci.locked 0
>  pci.accepted 1
>  pci.tsm-id 0
>  pci.dsm 0000:02:00.0
>
>
>I am wondering why we need 'devsec-run' ops. Isn't that already the result of
>'evidence-accept'?

I split it into two steps to record the decision first and then trigger
RUN. But you are right: unless someone has a use case for keeping them
separate, the split is not really needed and we can combine them.

