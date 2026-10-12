Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6EB4AB1B2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821085; cv=none; b=idPAfuitF7alqaf2FxAg0K60Djt2JK7OzyoFIYW4WqGnO4c45FuCOMCiWUN7/aCJJnkz2JeJ8X/pS32knqyh4CmBK9PVSQ893rCR6pXtUQUbi8xxpqu6SHHISYPQBtuHQNBqDkomvQYpvxdCrcz9nZRjGPDoQS57vyAVOfOpU5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821085; c=relaxed/simple;
	bh=CjNPhM0F82Wbn9n1JTCsaGj/k6ngpDFON2KbxOAWJKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsTh7rmkRW+X5AQJq6J2DX1KSlJWdHxW84DeKILzHVaLDmjTgmAwgBoX82qi6ttMvDAeiOANo50aHqIwusWexIVpcDH//Iaj2g9xPthIOMIoDkpSUPWwmqmgZ4X1x2UtV8Ijs1nPpsEjMEx4HJJs4QPDFf0pRg4adMvk2Q3zcO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=E+hLkr+v; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="E+hLkr+v"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93e51d8d400so143312285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791821082; x=1792425882; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2P5NI99EVME0P3LVAaEWnF0MPg3G/2buC7fzHXtZUQ4=;
        b=E+hLkr+vbnHqrCmBY6XEISAAWMuWV7E//Z13k0cv/4i5hCb/Y4LCuyoEuj6nwqhyHB
         J9ULxntwDLdRJpTYgXpBRDH1k+eeEAl/yNg0ATRtior+9bpgmqpeVSUFaAvDlcbdszE9
         crvYWVYTDZhTj0DwqblpoqoXeN8aSxAZrcp5Wgk9XLx1qr9BatjgeHaJTqbkSVlz5w7V
         1O4eRLFIiGcwy/0IkiPK5eR6fcfev9CtGMRzjGLn5j/J5wQDoem0JJ23WJMNpS//jEKR
         k4AS/GnI1idznuC6VSHYBEn4CQt+fNFACCbbLo92ix86XJ389v8bRpX9fYuBI4Z5cPFN
         +/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821082; x=1792425882;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2P5NI99EVME0P3LVAaEWnF0MPg3G/2buC7fzHXtZUQ4=;
        b=Clo9SAJlf7aTManemrZTeE/Bc3xZlcJfPTDth1zO3gr5R/udbmICpd3UxNa6KcV4m4
         Qey5THfgLLqxeYj2mcWkR0Lv/CsJJ6YJkoq21fSwStX40V1nUOxRUYdTqwLlwwzf6PX3
         qb78FBhvz08lGsQKDuWesnchgSD0NwPPOxygw9IniAY3GJBiP3dtK/Z5r0iMDBxZjPwu
         t4gD3p4s/YExXZfMCFxJYzIlvnJCe3LfKuBGweu4nald3xhhklbP9rP8bVcfHXR4ONpA
         SlRqoOQq7C5QLQCmz7BrZIDX/JplrheYVG1jAIt4L3tH9p5GxX+CMQs3OPvf9E+CvQWC
         7lEg==
X-Forwarded-Encrypted: i=1; AKwUvBxfexZrJULeWp4rF/tYJ6UdWle02zEUzrqL7u1k7UKZGEXYYMsxpK97kn+D2OwAP7ayIhPTRr0GUKOPPYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9yuXCbG6byCUprzTHZTXkD3cU/ik3CE60wJpfrdlcVJKAKiqU
	BxMZi4Dv6jQBbgo7P4Ip3I8Fr6AqihSb3jaRUQcykyRia7KhyHfH1IBdnwUn2PeP0so=
X-Gm-Gg: AYBFou0FMkollEZgjVFWb+5ZdL6lqv4WF40xlaHrHxCgTwal0k/oqiqUJEhttBFLlaR
	gk9T8mEH5ATOvqm28DZwoefL0qSQ94Eu7/PvA6OdyyEnZ1OGXijsdYxiKGgLT/jzpKYfq9MMPAR
	O611gWQ6dCdzcJq7ZVXf6zutUng6QwbwvuljBGjD03xczonwCi656en3gaZzXnvQjW2wabJGKMR
	+Dy15FUwBu7SEBjZjmX9nE5YeK63/HRxwD67a6rVjnieQBBKXsKjQ4jlIrKVw7Zict2MRjnhYmZ
	kYvln37X6IaDVwGuxh5SkjvzTPlu6n7aB2W8vjUgQ6Btf8vkUp1UUqUbjytTrqUw3GdjlkHB2Xs
	Hp1yNzqZrC6L7BwOaiM8uVsNP0iQFE3hlvxDm8hDNSZRjOq6bNkzeeV+Zd/AElMPgzJYPZvCVZP
	P8QWJJqhlhP66YW7kCkWIn+eQvBPeH0T7Kxfnhu9kDxh8lzEWxHesE+tzlRsiQfNstkdb4Qlk=
X-Received: by 2002:a05:620a:3720:b0:93e:5dcb:eb9b with SMTP id af79cd13be357-93ebd24ecabmr1816777885a.42.1791821082270;
        Mon, 12 Oct 2026 09:04:42 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef4d31b91sm22701385a.0.2026.10.12.09.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:04:41 -0700 (PDT)
Message-ID: <ddd1a236-c2fa-4b97-834b-d4c511e153db@riscstar.com>
Date: Mon, 12 Oct 2026 11:04:39 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: define a fixed 25 MHz clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 danielt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-4-elder@riscstar.com>
 <51552a90-60bd-4b87-8bc6-080d49e030d6@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <51552a90-60bd-4b87-8bc6-080d49e030d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 11:02 AM, Konrad Dybcio wrote:
> On 10/12/26 5:24 PM, Alex Elder wrote:
>> The TC9564 SoC has a single 25 MHz fixed-rate input clock.  Add it
>> to the definition associated with the chip.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - New patch in this version of the series
>>
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 0e3bbdaf4661f..b8d290eed2f38 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -891,6 +891,12 @@ pcie@0,0 {
>>   		pinctrl-0 = <&tc9563_resx_n>;
>>   		pinctrl-names = "default";
>>   
>> +		clock-25000000 {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <25000000>;
>> +		};
> 
> This and patch 4 should be squashed

OK, will do.  Thanks for the review.	-Alex

> 
> Konrad

