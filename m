Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50777519908;
	Tue,  8 Sep 2026 09:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860448; cv=none; b=Pt4YedEaWD0ngs+6vTktLNQmHTOBsiXl4c68URFgM6zGHDMki2nRx9s8UhKXDA5YVAg8A2EwwvHlIXJU+CkDwQAVvhHdfgs/cGXjM/SO6bfm8R0IxZYY84hx+PTF5niLfVP5eiABLrIUBY8Lkz8pmqPSFDHD6gALFpHDalmTU70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860448; c=relaxed/simple;
	bh=/MqnHKMUZO6pR7UnfizV67smzo2VOogPio2iF+YxGIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUCeFJnoeqvi5nddwGdAIwZj2RAXoGPNqu74rppJJhbAII86UNNMWoGtUbDHQxHZXZvgioXwRdLzI+hWG/ZgoQdCpWkxEPDsXX600Dkpbz0DtSoiqv7+c/qi43QQjLlXcKcIZ9EFr4yNNJ6XjbrYAjM8dLyT6qrZCn4oCQTo+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=PCb0x4mq; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="PCb0x4mq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860387;
	bh=FHFampfu+ImN2iiJYFmkXIBlrCdOXAMDPUO7WbZYY0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=PCb0x4mquSapCsOP9uVykh8Bk1pT1OFD5GcZSPIPGU2Y6E5PhikhaBj22JaI8yRXf
	 a92hmVjAz2STStDqANa3JZ3Yj7QOm843Wi5NAycW91piv5QqI+Q7NThxVjnj1dAm3x
	 QtguhCn8jcn/XM01mG3iCEAeBSzVM20Ol+KnEDvU=
X-QQ-mid: esmtpgz11t1788860380tc17f5ec9
X-QQ-Originating-IP: Bugj5YLGVEyhMeIa6KzMeFxlT0lmNUHALoPlNP9mFzM=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:39:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8537548706978725419
EX-QQ-RecipientCnt: 19
Message-ID: <0F6BBCA4EF1303F8+e4bc3221-1f7d-42b4-a9e4-169b14e6d04b@linux.spacemit.com>
Date: Tue, 8 Sep 2026 17:39:36 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] riscv: dts: spacemit: enable USB2.0 controllers on
 BananaPi F3
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-5-f28cf29e522b@linux.spacemit.com>
 <DL8Y8HJ75OUV.2AC7IAYJ0UB26@linux.spacemit.com>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <DL8Y8HJ75OUV.2AC7IAYJ0UB26@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NsTWTlXJmKxZ9b9lH0VlrKjOx80vPaKYD//8LCI2eOdjo0kW/6pfTkfa
	UouNele6IjeBaUtOxZ9ZhfYDGQzIXm4Y25dpyTb9wSvNWJjqeoZl0ZP5RuGucj61mWkJ+Lf
	ndS4vpiN9PBSaSWlY78SRDLfl8maEzCT1EUKDv5UbXqEw+xI3niZ+0uGC7rFzcPGgtqoM5j
	+o/DLloLBUTU35YRN3gPElN3A/G8VzfpPdvvNQ93ETqTfZNhHcR+T6n7Kv6Vm6zRcaEnkJd
	9AdXWZTjo8nUgJqxkZTIjnkUjTdiCsy4M/kim7Xb3CQG/hk+njJ34JeCCAxeiAJtjQ+aBIF
	H3ayFQ540k54UZ6pwOvEyvSB7Elq0gHNbv8USvWWo7lhPZmVAix0mmjh0QL0fEYVJLbSdau
	dWERvOOpuZBMnNp/Uwei2eni0R+nBykuqHq5gOFsusYpGr/jlMQOUXw8m9zX13IuJh9BL7R
	T5C69XRvo+82rIDZWLvN50k9bdYl9nmirwHaAr89VDF+xPbpJQ1OerAjl8vVGH46301+6Sp
	ECnDrcr8hhxRxhXbHCTGC8C5/4V+KlFhLy8xfE/xaKRfLvbs7CVhiXMBOS4s8Y3fS9T4q7N
	HlQb4YQ5iefR/jHZiY7GTPFYuaS+nbABsAoB3qY3NDTSTWzgeeFcLdQxefB6FbYz8ZOCDiw
	cLI+NHlDnzILtfsjqcytrAqRMSQF4wcTkgDX+pCy1hDzPK6urlnGc2Fl+5BcJnTvjGlqACj
	WFRgvXLKpq+GjOAn1bjRHGVn/w0LUJctCJ025UraBuCKh2mDVLu2YVtcs8ULa6r2AxrNFyP
	ZeUmxSFxGTtI03tl4CApt8u5+w8Bx7g5IDLwprq+rgllWxQyUleMNtGWIXJs3tjLoAeZnqy
	DWB98Swvkb2bWYEnTIcPXSfnZjgQaF03tDXxjFGaebWfRRV85grEPciqUHhYtgqHAeCjll0
	RxL6jNYk3JVtlNohKjjBe8RNB0caag7C0DZa7rZzAoNs4FATjpmf2RXtDy6H0CX1wWEofw4
	+kuK+IDck6Rjz/3WQYKlo/vv0r+JAhaBBgXzmi4/El2HDxn/NeiMG8S8leeYDTCXPXwTEl5
	IlSQ7jr3XUb
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

On 9/7/2026 4:42 PM, Troy Mitchell wrote:
> On Wed Aug 12, 2026 at 5:26 PM +08, Junzhong Pan wrote:
>> On BananaPi F3, usb2_0 is connected to a Type-C connector at device
>> mode by default. This port have no VBUS supply capability, thus host
>> mode only works with self-powered device or hub. User could switch the
>> role in sysfs.
>>
>> And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
>> support cellular modules.
>>
>> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index 72f77e9edd63..fd0f96262009 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -350,6 +350,22 @@ &uart0 {
>>  	status = "okay";
>>  };
>>  
>> +&usbphy0 {
>> +	status = "okay";
>> +};
>> +
>> +&usb2_0 {
>> +	status = "okay";
>> +};
>> +
>> +&usbphy1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb2_1 {
>> +	status = "okay";
>> +};
>> +
>>  &usbphy2 {
>>  	status = "okay";
>>  };
> Could you keep the USB nodes in the same order as in k1.dtsi, with
> usbphy0/1/2 first, followed by usb2_0, usb2_1 and usb_dwc3?
> 
> 

Will do, thanks

