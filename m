Received: from outbound.ci.icloud.com (ci-2007j-snip4-1.eps.apple.com [57.103.88.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8FA3EFFC2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922378; cv=none; b=CSaGulg2YIR0YjTAgAECQanjnI4LTPlpJqtpJA96QSsvCX25LklJaLZuK99LxggNSMgdd16FEmn3ZbuWrmyI1OXP0B1zm1qB02VcbeY60qcXToNarnhUZ61oUFsuc+CxDlIiX0u15PlZT4QPkf3XCPes5cXuauwIduHuTLsZ1BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922378; c=relaxed/simple;
	bh=J76d1SrQu599xi74Vaoip0qG/U5sqlk+sZbqLTbmpYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkKAwD4D2FOZpmAQEFJhjuFDfB9vBtV7VowlPYKrWeemFBs8CnyM4N6swza6Y6Pw24nUF9wTM8fcwygyA3HpiQR35qIRsAtO6k5v9bOzIHNUB4tdcDJcQYrUMnfptRQ5UAQ3asaxojhBUXhEYSV/e22cqC0K0/7QnnetlNc9ies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr; spf=pass smtp.mailfrom=pinon1.fr; dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b=iRHcVHil; arc=none smtp.client-ip=57.103.88.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinon1.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinon1.fr header.i=@pinon1.fr header.b="iRHcVHil"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-2 (Postfix) with ESMTPS id 64A011800119;
	Fri, 02 Oct 2026 06:26:12 +0000 (UTC)
X-ICL-RepId: 01a0fb4a-b4c7-7fc6-8e10-43d5fd3bbf33
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQBKHVwPXxxBDUgdXwVTEhVdRUMEUhlAFXkIWgNYBQNeXwoTC1NWQhlXF11cGQ1AUEsbDloXA1ccVkVcGEMJXQVXHB0OXkVbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BHAlwfV0kdC0VLXxldRQ8OB1JXEg1ICkBWXFYWFExXVFJGChEIQB5UA18BSAsZBQ5RW1QwSRFdAllaHBZLRhMZThtXTVoNQBlYBm0UVhVSBFk=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pinon1.fr; s=sig1; t=1790922372; x=1793514372; bh=fWKzdWcxLONbaaD3KRUjC0mbzfi1SS7Fw0/czLd0h9E=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=iRHcVHilMCtTw4fEu2mimbU17NMui4SurzjzqJU5hPsZKUXBpxqiR4tzzGpNQmk/xV3K7Id3yKiB1FWDwetPHn/1dEheAI5QscVzu5HBhKsK5Tr2qFWhe4xTWTrhI7feDuKMnxHXNrKA48H1ndpgrmxRLbAQADzXMhJ9OoXXZdtrqh5h2P5MQeU07xdDL/IHq0R2BV8KL6ab/Ue9wt00cMFxS32W4XonH4eEKxcffMkP11WTcYdrp4O6Px2nZS2FIM9CB+mkjVFYqj/jB0cePLjtRm0KiSeTCdUzAvlYUWjSeJ1yT30VqI4oNbGRn7taL4Hvh6UlDDkuUE1nu8GfVA==
mail-alias-created-date: 1575045973000
Received: from [IPV6:2a01:cb06:c04c:dc8a:ae72:cf9f:fcf2:ab8d] (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-2 (Postfix) with ESMTPSA id D2866180015B;
	Fri, 02 Oct 2026 06:26:10 +0000 (UTC)
Message-ID: <c09eb409-a7df-4d9e-8a18-944382a6cf0f@pinon1.fr>
Date: Fri, 2 Oct 2026 08:26:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken
 1928x1088 binned mode
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jason Chen <jason.z.chen@intel.com>, Jimmy Su <jimmy.su@intel.com>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
References: <20260904134604.595685-1-pierre@pinon1.fr>
 <aqUmkCIizqkwrgZG@kekkonen.localdomain>
Content-Language: en-US
From: Pierre PINON <pierre@pinon1.fr>
In-Reply-To: <aqUmkCIizqkwrgZG@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAyNSBTYWx0ZWRfX7nWnfzV86Dq6
 0c5/xQE3rJ5boeWHIR00EuaJz3N8dqt8BcwarQDYSHSNC1AUPtj2QuYpqxyeIaOYOJkeyPqjxW0
 rX0q8rRP9LFnyY8jqtsDb0kmpqsSd9TpQ8kgsinAtwma066Xz2S8q5tVX++71zDEnUAmvUSCZSp
 B96RIH2y0IdpTI0V8gU4NYLu23rlVp+vO2dkyJfjplWGOxBviGpIb3xX7IK7wWfPZvm+E0Xd4Ua
 4adf45UpvSBqG5lDSPlvmQng/zImMgWp+cnjavH8d9IwMxam+bf553gLI44XFEgCeIZjhAxh4B5
 +JnMZDO63q5E+BWjumy78dTPWZhxjCjG1zODs2I8MobwNZMXiAqPlo/JPmZtZw=
X-Proofpoint-GUID: wpukwn77bk72hFxrj1fPMzTcS8TSW96z
X-Authority-Info-Out: v=2.4 cv=ZMraWH7b c=1 sm=1 tr=0 ts=6abf4e84
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=dmTPy_p9AAAA:8
 a=xVw6qfRTu0CMNbYao_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6T7zzwDmeAXMUsgpoIZR:22
X-Proofpoint-ORIG-GUID: wpukwn77bk72hFxrj1fPMzTcS8TSW96z
X-JNJ: AAAAAAAB4+lq9kLBFHhutHGpTxE8YdwbEMZ9iCBERq0ame43HPNbUTXAnyABi1kGV5FBQK
 3Yu8n/QpPU8qpNRZy81aymQ2ojhqRHGO53fy5ItF3xxjwiLIJWz7+URL9AAqcJQkooTAk1
 /ggvB3Fj26KUpDcS8yr8gbTfJdo1l4sF2gdE8MxUD6bJCehdgi8FbMqQvCHrlGNRIO4q1B
 eQs5dpbQtIzWSWcCh0LZLEJaSuRAPmQel9WTmT4KdMLyvuv4eFYb9aI0dE7EERMQfxDJf8
 IZEvr/vNS4Lw1zFmquMPA9LADE09HdU9Qg5aioiIdNGXdqQnJYqjw63tsPjxD6ee0FhBF3
 3VZr5PK/fFHzsbbqovv/3KMkZPhGquds8sWSMxz3rNEYPGpBP7VD8IAt/JdmuULWIB5S8C
 MUEhMRpgiy2jvnVY9i+S5bJwjMNnHPg7ULfjN5Frawa9s5gZgpYIvY0ft+/995bU8hWQiO
 67s3bLKpmJeAnGSDCRPE1zUe1KrT6gNQZgznD46we3HgJtVQ1Oo2mOSQFuXRpTnJ6p1G7d
 4qs2CiLAv2wmRsNxvaeqUZkTGfzFcJXsHGvxWylABitVOqob5rLK2ghnH7lzV0Zb7EyRL8
 rngTdwl31OGcbXBdV6ja/sfGuisGTh7oAYcB83EBL13DcspZJzl1rV6utNPhIHWUR8BmnN
 BYkkmRcHPkf7OWgj3B4pxtPBgB4xiN26TsOQjTvcz7GkhqH0GICEJmcMaZWL08IAya6qw6
 uyBCm6PdzhDzC6d2daHkZknYrcgp6cLuyzfMNimbIFz63PO7xAC9n36fddO8yv5RLh29St
 OZhF28nFE9MaxTR8/97AggkwhYThYpmqzrxNSjDJyxZcDDCQUYhsf9SZAtDo7pEfOpecyH
 hh1O98TNNSFvLrG4ml8rcEcCDuitaCGzXZkdp8Sktgyth01VTUx/3pDg8w3/evSY1wqL82
 WzMvyCZsFDOZo3J2IlhxNAr0cjueByAmnmYcZ2SUekydV1YFTopLLsFG05xNi5CWD63PJV
 NWVZv1JfH3w8KwQUHA4XdhPFKh6oZYD5QHvzhchASuZkrBqTdq0WlsdBBPgXGuj9XgfHIx
 9MQtN+IXcQCxYjuIowYx/LYXS5YIiQo8t2CbGHj89uRt9TLp/WkKN0lcZS6d+5AY7YI5Wq
 p6W+pAfDZ5Je8tDk09MeL2GbqP+XaFf3O9TwUsZaMTjISKIgVTU1ALFogPo5R7UshvWnmF
 LTGSTgUvdob8Y1ZE/eWqyhlRxXfFg/Vhm868QZPv03Lr9Z5j/8/v+//hp5EOQcEkV1AOGR
 0X3O9WGbqI+vK3sb5uTl2Nyoo+LM5GyT7jbUwC7XGQitcWogctMXf4596/d51f

Hi Sakari,

Sorry for the late reply. Here it is:

   $ lsusb
   Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
   Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
   Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
   Bus 003 Device 003: ID 06cb:0701 Synaptics, Inc. SVP7500
   Bus 003 Device 004: ID 062a:5918 MosArt Semiconductor Corp. 2.4G 
Keyboard Mouse
   Bus 003 Device 005: ID 1050:0407 Yubico.com Yubikey 4/5 OTP+U2F+CCID
   Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

   $ lsusb -t
   /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
   /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 
20000M/x2
   /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 480M
       |__ Port 002: Dev 005, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
       |__ Port 002: Dev 005, If 1, Class=Human Interface Device, 
Driver=usbhid, 12M
       |__ Port 002: Dev 005, If 2, Class=Chip/SmartCard, Driver=usbfs, 12M
       |__ Port 003: Dev 003, If 0, Class=Vendor Specific Class, 
Driver=usbio-bridge, 12M
       |__ Port 007: Dev 004, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
       |__ Port 007: Dev 004, If 1, Class=Human Interface Device, 
Driver=usbhid, 12M
   /:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 
20000M/x2

   Best regards,
   Pierre

On 9/12/26 12:16 PM, Sakari Ailus wrote:
> Hi Pierre,
>
> On Fri, Sep 04, 2026 at 03:46:00PM +0200, Pierre Pinon wrote:
>> Measured on a Dell Pro 14 Premium PA14260 (IPU7 + Intel CVS, 2 MIPI
>> lanes at 1500 Mbps) by instrumenting libcamera's software ISP to count,
>> for each line of the incoming buffer, how many samples were left at
>> 0xffff:
> Can you provide the output of lsusb on that system, plesae?
>
