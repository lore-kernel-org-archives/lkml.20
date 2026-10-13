Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F5563FBA
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930655; cv=none; b=SdZUxYZAEfhzYRFjhhWfNWyYurz/IaVK9s43AxRPZnPrkQ094m5eYre2ZQ9V7/4YhUWuDBhO5vBs5WRBTdgfJIjzAc+v/rAkjawUlpabuORuFug3ElynjiHJFmZV426VkRDqAdXfWcLi8raJJAQpFjuTcC735giXQrzKgQseSWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930655; c=relaxed/simple;
	bh=paIc3wdkCGaMzVDDLd7bcfCDFTMbuVaWj+iMPTcVHWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwqhUC/pmQrLNq307GUHWbN6q8TC3/HTYQLxV1DeMlg20/dyzKIHBzSI3SFR5xzU7tjRUWeV9WtaCx3YoyTu1Ri5j+8jzr7MVQ+5kDn0GGaurHzST90QRGbyNVtD5wY/+iJTLOw4Zr1qw7no/eY4UfJ13yE64ycM7SXza/wJZiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=wsOrBQWF; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="wsOrBQWF"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533930955a4so32378481cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791930650; x=1792535450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15UuH/nH7GbuaRGYpdfm5TKB7gfNnyxt98L6IJfHb5g=;
        b=wsOrBQWF1Io2wpApJXKt0YDCvqRam/KVW1uR0Chf/LbD3NuJHKHidVarSVSLy8TleG
         100AHIzypZU+WlKhi0ru+KgItIZ0xnFffrFEAx/C/yfraPLSxAM7HA6yyRUP2bFu42ZN
         2etR1QvxQWLtllJvdLQGAyPJrJqrg/RdWPs6sTMjiu+Y2flUc5+KQ00ac/sdGMX4jQYh
         UM67bnjlowUXzbFoFkhaDBjwqyrHFwd0CMfhBffGnhSk+zhfHBIqMLiAhze25QOduCHT
         bVenDUW1OAlG1/ErkWodcosmkYW381Ehg29ODYi9Qer6Tl8gra1jIFtRFGlankLZ1RI0
         SaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930650; x=1792535450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15UuH/nH7GbuaRGYpdfm5TKB7gfNnyxt98L6IJfHb5g=;
        b=BPfIhTr6YXtl0yuZFrhpk6Vf8TCPRf8ZdNMibKnedZOba/ZxXZj7+Od4j59/8G889h
         bLkzUtdxC3/UeegyIB+6eXyf7BjJJwlE8vFgn6hh5NMnV4bEI/WyJcH7+jgcs82H59xS
         7GLVDva7802sQBbNT0jbRPLe6rYiM18AgLF1fA7NsiHjkCjtC9RelCsZOBJlJHHvpYDd
         XVFJj1ZBBN5/d52RCKumbSrJXmtVk6szKJNI38/Ti1G9KfiTSK9T3dN4ta3RG4xOz9rO
         GkgklUbMizCIcc/cZCy7e4C0J3aBLY9IGGQIo/EoL72PkTva02z5sl1a9ZVtjpfm9f8H
         xUew==
X-Forwarded-Encrypted: i=1; AKwUvBx+LQqjtIXf1BYchSev0BkjBspj6xO66dPiv9x8xLAWmbe5kSYA8o/EJoJlCDs/oynr46z3kEt7bYshYCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/Da110u7eul71wDX8RBIR74L6TVVm1c/9rAfJL1FiFxolzEG0
	eBp6PJmBcEUAgkoTNMR9tOu8wYTw0Lp0lygRWfblpqKPCJH3BAzsU3TfYbhPkXRIsz4=
X-Gm-Gg: AYBFou3nk87FP0weV+v/dagYwr9yJcUmWECl5iJ2PjDMm8tjUJgqeBuAMviRbNFpVoP
	ppmpGvFx8b5d6veAXmvtBrUBzSKAS3CKxNx6/0CTCQLgBG2hCVDZiLk2M0LtpGxwcMYMB/4g0zy
	OB8PaYh7nqzKPlF5h/csc0+vk+NSPspsIFoedlxpo1IPEdht58GylvFUrzY7s89iekPzAPGBRhS
	JKvZLSXz/Z/2p9j85ev4119oD9nvmi+1YRqh10Ug5VvZjsVjEXwf/RNDtRywX8ozxdaN0O3Mzcq
	PybEqnhXSu/wZ07B8LRlcSu8RlU8Vb1xkUDsJqMW4T9oU9wLnmI3MsAKW9Tcr6X9ofEfi0nwJHc
	EvJtEyaUKlVH0XHXs2dlj8Az+9lwFhPnoH95pwVuaG6svNEm9dMX1KyQz75y8KJSUwaF5CXwLVQ
	NJYyildbMMSZLTRgc5ZANj/C9bf2XHzp5xHDyTO8rsRhYeMWz4c4s8mbaZx6ywI1E2erVgjw4=
X-Received: by 2002:a05:622a:110e:b0:535:a5fb:6449 with SMTP id d75a77b69052e-535a5fb69bamr231387611cf.67.1791930649810;
        Tue, 13 Oct 2026 15:30:49 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535d43f09e7sm55712371cf.8.2026.10.13.15.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 15:30:49 -0700 (PDT)
Message-ID: <a8f7eb6c-69d1-468e-b7a4-7481e429c1cc@riscstar.com>
Date: Tue, 13 Oct 2026 17:30:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] PCI: of: update endpoint ranges dynamically
To: Andrea della Porta <andrea.porta@suse.com>
Cc: bhelgaas@google.com, lizhi.hou@amd.com, herve.codina@bootlin.com,
 daniel@riscstar.com, mohdayaa@qti.qualcomm.com, lbiancon@qti.qualcomm.com,
 mani@kernel.org, robh@kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924222444.1351466-1-elder@riscstar.com>
 <ase6toUhGn0XD0v9@apocalypse>
 <223c5189-bfda-4c63-b09f-4ebd01bd144a@riscstar.com>
 <asju_HpgXpIyAFdf@apocalypse>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <asju_HpgXpIyAFdf@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 8:41 AM, Andrea della Porta wrote:
> Hi Alex,
> 
> On 10:55 Thu 08 Oct     , Alex Elder wrote:
>> On 10/8/26 10:45 AM, Andrea della Porta wrote:
>>> After a quick test, it seems that it's not working out of the
>>> box on my RPi5. Let me investigate a bit to see what's wrong.
> 
> I stand corrected: it works perfectly. So:
> 
> Tested-by: Andrea della Porta <andrea.porta@suse.com>

Sorry for the delay.  I'll add the above to v4.

> I think it should even be possible to tweak the static RPi5
> DT in order to make it work dynamically with your patch. Can

I suspected that your static definitions *happen* to work,
but I never took the time to confirm that and understand
why.

> you please provide the relevant PCI DT nodes (from PCI controller
> to pci-ep-bus endpoint) from the output of:
> 
> dtc -I fs -O dts /sys/firmware/devicetree/base/
> 
> taken on your reference board?

I'll send you that in a private message.

Thanks again.

					-Alex

> 
> Many thanks for your work,
> Andrea
> 
>>
>> THANK YOU FOR TESTING THIS!!!
>>
>> My hope was that the recent change (to avoid doing any
>> updating of ranges property unless it was found to be
>> "empty") would avoid any trouble with the RPi5.
>>
>> I'm eager to hear what more you find.  Please let me
>> know if I can be of any other help.
>>
>> 					-Alex
> 

