Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C2A485517
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192865; cv=none; b=H2ifwEI9rhcd4IGNSUqTgajkW5g/CcPHMeZT+D/CSFuF07sqhbJ8HjGROexGVU6cAt4iNWzcF2R0XcnCy3Sc3UH0lL6d3XGxpngwMO4gZ9R/ZJ2QAumlZSErAGgFW3L90oyIU1L/MyeXVIkeXJBc5yDDdHeE+AYfl2+F/eqEQd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192865; c=relaxed/simple;
	bh=lDET+FhE88hghXFOyHHbduwD0KylcI4O34uXtUCsLuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ad8UlFadQSpMer+D28nTfncmYqhC25pcAurseFPDUAD7rJexaunC7YhPeZ4s5Q/+Ofc+tsYBPHkw7Oa5++C/TdxeXIziAz2eXNxt3jrlLSa2pKK71Ls8uUu0l3REG10bZlkZrLfyhyD4Oe0tEzykoSP2BFY911DIqsyVvMi/JXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTNXQGO4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTNXQGO4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482e257a23aso2092883f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192862; x=1788797662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5PvQwBjDDL2BXf/d9OmxMnSy/nZIUGRJicSJQlZ1aI8=;
        b=dTNXQGO40YK1Bwfs/0gG6u+xkZN+CX1Bx31Pvkk84TuHyEKtN83m6sgeP+0hJiu1vT
         780Zgte4f8B478uefCx0DnGQRsRzaHV+tP4jdrCz+jYQcqJVlaBeuFxidrREv7c/lgRW
         lkoLyiHC5651pKiyunvIxe9SAjOVeiXmXDU9tt5JfhhS8aiZSrOkAb+/XrlT28hSYoyl
         r0ncJNYhQ8t08++V4dpIAsLuGp9caTAArRTXMmgMyj+iUqVQAn0EYJs0Ir+yM7t9CyIE
         pX0B+/CZ1KVmvQVyorCf2Ii0+0XP+0S5sF2/I7gp7+peWFj+eCtnw1OXJyshnzQMIgGq
         oxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192862; x=1788797662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5PvQwBjDDL2BXf/d9OmxMnSy/nZIUGRJicSJQlZ1aI8=;
        b=rV05IAmMHdkQX/NJMG362ywwaab8YKf3KySyDAZRvbqSGiMhrwwkCp6c/JZAWc0Ezr
         diq22OFfK5rIre4um60Ywok5tNmkV8+wYaEny5HJ4MalzKN2mYdy+vGn2O6bmt2D7cHB
         6qn8xY0UXlM4+9wjlLvlZkZhvn0tZhI7pY/gWQ6LVNq1K4XB5pHAVScQQWTcY2pz0DeO
         MIfK+ilLYJZlodFjqn8U9U6nCKvug2f4R3f6OYMXjPK0PNw1wc1X6Rod0zoDT5qQZOIE
         KBuraUz10ZxNPYkkF/z8fGIF6hVaM+eE1IcVWH2vr5U2bxpeqtX6Vz2UkfHOjRZppE+P
         xZ8A==
X-Forwarded-Encrypted: i=1; AHgh+RpqB9W56tW+nK4xkNn6ZFxtEv0x9UY1KwUEuchfns8oJq518dlbFk0VeGk5k7DC/hAt39XCRPWWDDFx4M0=@vger.kernel.org
X-Gm-Message-State: AFuF++ni+mggZ74WIN1N8hvVPPzVgMYmzEWFj/JqO2R4wPckxVc4pPMt
	xP3wigc7oOjM2hxgk8R8BpzAfkJhKu4iboXzQfKVUlJTiXpfALps1iv/
X-Gm-Gg: AR+sD12qFH/odSzy5vqzvGa2bxxcRxQ1EpFJnmQUtLK3UEbHVLgNIPoH8EpBW675CeT
	U6FMRi3CxAVLjlaGt1HHscT55YaUe+aV98bdO1bvd73d8q61/7w9OFcO9o1kAyHl3t3Hx3KyVpw
	G6RJSBeAcr+Vl5Cnkw7QVFR3HYa4gxZld+AWbeerZ2r4fFUc9Db3QRSWHZWbLqtHXOGmwSER/M5
	fmURjSQaA9O5L3rqI05ZppdZDOjoxCkCtWW/qvvqxkzibsfXr7w9anKt4WjFsqlCNLtwlcG5I7a
	OtN0Cj+M7EmTGgxtE8+rVC7cm6z2kOpHYXXmLlvd+iuTk9PEk+Nu4+1W0rpoWUltPqULd/7oLfa
	UkxXt1QR7t9SE388fZgK6Zi57uruZrupdhMj1BpzG9UaLC7GY5EtOQXD/MUnyXGyiKQgQ7k2A6f
	9CzG0/6SXlevuIFFBns5UFlZ/5GAOfzOCi0fhDGfHh4LsL5mbeIbpJOU1rs9RDDHdoJKv/37mh
X-Received: by 2002:a05:600c:1c27:b0:49c:cfae:34d2 with SMTP id 5b1f17b1804b1-49ccfae35c2mr235659955e9.4.1788192861364;
        Mon, 31 Aug 2026 09:14:21 -0700 (PDT)
Received: from [192.168.1.10] ([95.43.220.235])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cd8b9a2efsm89143235e9.3.2026.08.31.09.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:14:20 -0700 (PDT)
Message-ID: <16609718-fc04-4e1e-b63f-e54aafd14eb6@gmail.com>
Date: Mon, 31 Aug 2026 19:14:19 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: omap-usb2: add explicit PHY comparator API
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260722053618.602702-1-ivo.g.dimitrov.75@gmail.com>
 <apBdFetctMKBH-iT@vaman>
Content-Language: en-GB
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
In-Reply-To: <apBdFetctMKBH-iT@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 27.08.26 г. 18:51 ч., Vinod Koul wrote:
> On 22-07-26, 08:36, Ivaylo Dimitrov wrote:
>> The existing omap_usb2_set_comparator() API locates the OMAP USB2 PHY
>> instance by calling usb_get_phy(USB_PHY_TYPE_USB2), assuming there is a
>> single USB2 PHY registered in the system.
>>
>> This assumption no longer holds on systems with multiple USB2 PHY
>> providers. In such cases, the global lookup may return a different USB2
>> PHY instance, causing the OMAP driver to perform an invalid container_of()
>> conversion when accessing its private data.
>>
>> Introduce omap_usb2_set_phy_comparator(), allowing callers to explicitly
>> specify the OMAP USB2 PHY instance to associate with a phy_companion.
>> The new helper validates that the supplied USB PHY is an OMAP USB2 PHY
>> before accessing its private data.
> 
> Well the name can cause ambiguity with old API. Second I would like to
> see users of this API as well
> 

Would `omap_usb2_set_comparator_for_phy()` be clearer? Or could you
suggest a better name?

Regarding the user of the API, let me provide some background.

Currently, the cpcap-charger driver uses the old 
omap_usb2_set_comparator() API. On mapphone devices there are two
USB-PHY devices, phy_omap_usb2 and phy_cpcap_usb. The old API selects
the first USB2 PHY probed, which is not guaranteed to be the OMAP PHY.

I have also added DCP detection and extcon support to the CPCAP PHY, and
I'm working on proper charging current limiting in cpcap-charger. For 
that, the charger driver needs to be able to explicitly select the OMAP
PHY from DT and register for its PHY events, in order to properly limit
the current in case of DCP/gadget/OTG connection.

With the DT configuration, cpcap-charger has the specific PHY instance
available and can use the new API. For legacy configurations without a
PHY specified in DT, it will continue to use the existing API.

The relevant changes are:

DCP detection/extcon support in the CPCAP PHY:
https://lkml.org/lkml/2026/7/11/600

`cpcap-charger` changes (currently out-of-tree):
https://git.maemo.org/leste-upstream-forks/droid4-linux/commit/0261cbb724d875ee4aa2e5af34caead39e5e47fb

I initially kept the cpcap-charger change separate since the two
patches look somewhat unrelated. I also wanted to see whether the
approach in this patch is acceptable in principle before preparing the
cpcap-charger changes for upstreaming.

Would you prefer me to send a series with the $subject patch and the
cpcap-charger changes, including the required DT schema changes?

Thanks and regards,
Ivo


