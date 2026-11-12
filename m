Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485841;
	b=awh4f6B1+a+1MgRUCvH/Ujd2asrAXRcfiqRRVaM9Rh0JZdT+8D7ioMMYjd0P9J/GgQzj
	 oToPMGznoqubGEc9hhFbCjeskJ5hkpjocnjlg0sX+Hxr3StR9eoCRmrFnH3Abbh6QFAKF
	 BWNpTnrYYqngbhXSp5uJrfM63itNjUrnHshOM01CUnNhxxSgeuyCWrnC95B9u44t54GJU
	 FK1FIG5y9a7aCbK54WfARnmbKIDat4b2RwQW9fwAv0FWlqJMAHBGdtCa15Em1fGccRFHk
	 j3vnWJE1thLkLnxKf1BVD0+5KpRDu0qc53v1jLGhSysssx35ww5p6iUsPb1wsxvcJ5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=t+ufZCvXNHzyxYBYTdCkDnWym74ZB21L+z+qr86hT/0=;
	b=ipCJ2VE0vml5yWYgUHegizgf5W738Gcwat1SaucYOsxJi2URoObGTnuJnv0xO2W1oQ42
	 qdBQzMfNBEOwQSF6x0R/u/mzl1xUVtnHBWoYhxin2uX0ou+LxwTdiCN0u6mXUYuFSdJMX
	 zqYvoXzkrSZtfw7jE0WWTNFa8i4mta9tzsL4SLE4jtjkQ0Irkf8xgQ2HOaiEAT8xXHyfv
	 QSYtMQGQqLjhkeO8kdl7z0VXMK/PxbspNdIOQeIy4qEr0x8MzN9NXbKmzfmqKSJTIQcFu
	 CyDICuK2Rhy6oujnK1aAu/I9We7hiywqUxfuVjzGstCx8Ex1k/7KU9AUjPtk7JV3NpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY0oDUdr;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB46606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EB46606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY0oDUdr
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b1856d99f7so101726a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485840; x=1795090640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t+ufZCvXNHzyxYBYTdCkDnWym74ZB21L+z+qr86hT/0=;
        b=CY0oDUdr+f4DkiWnmKRSAd57WWzK/uog6M6Pb3L5wSrf/K0q3L2NLkmTBYBhsL63ui
         pAsWmzkOwUYohRVAzqoRrbSdB8buX8iMNebBavj19JtlfUVAjpBRSq0lWyollHt2iTZH
         s9zepFIWQPPgs6YrlWIo7FG+XiLwxDlnYky4VqgIkBuKxlbD84+HJ8i83HDQ2EUcU3Yk
         NXLiXuyaKiS9MdBoeFBQFci79bbK8sGhib17NdB7S5cEBa4f+NvNAD1/9Xbl4c9qGQiS
         xcRm1MXfRVEeSU0QIaQKqaUssx/rd5yMJ2A3r6YMDz4gdrst127OtvkIjOR8MGENKVjz
         Cm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485840; x=1795090640;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+ufZCvXNHzyxYBYTdCkDnWym74ZB21L+z+qr86hT/0=;
        b=NeTFoldwv+zqWqWUOM2xk+tinTELgvioRoeOnEKe2zeRcqYauYxHxG0mVv6b0589nW
         /7i4gmpZ1YKB1gTnMl5wk8b5ScHNEEqNVYG21dVDQS8qdhoZ7nIJ3eM4ursBSTfPz930
         1tb2BpcKFQncj04sUC/tFYKFOrr0DicOx15TPLgesMKgQRGUFZpTF7bkY6HGhPB4B6yP
         Z3tkTwYtRcWw2ZMm4i+PhnsvncIjeJG8OzeqnIswm45c8HD0IkBzSRMvyDksQG4kHrAJ
         qBmm+4zOJPk19caTZp03oTpN3WjYOpO/xysn9+xiUTkyan9zO1IE7GyFbrUXxOg2gMUB
         ebOw==
X-Forwarded-Encrypted: i=1; AL+hErHIAXwfEX3Dq1TJCNmmNo8RH8Fppxp0Mav4J/8Ro4xfJdJ305BUGr5qV7F/Yi7/i77mPXve42KPXnff6MU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AeMWdXxDEwskX2UKQJR5NCEJsrUapos2nBtFzM2NxAiam9ge9
	WcmaCCHVLZwx1tIWHRayjuLxLumYDcA8IWSrt95nTN9wFTUce4PdNl8k
X-Gm-Gg: AYBFou3BJM+TlAXjFYc0jbRCJduuRXF+cKXmKOAxQawO3cz1g7kszNS6eHA5ch/9Mew
	qxvCvxF+pWeb/oJWPaKczp+Pu23qHcmLJ2W01O5+IieMctKeVszoER1aOJ6l0sL+BwDTD7F/NrR
	wYgbB0w8eWtglNUZv0f7Xyf5M6lDKT+1rH1hB90E3B1UVsEcQLZgvFeh7D4TqiHxQSRYVgpw+Zf
	wKZjmvMAc4jpXaSYf09iFzBegGUaBp0xRrO7HH3N2Iuyt4sBdtCiJ3PMqFdmQuLQJ5xaLofp16f
	XqBkFDja8N/fpYOdATNwc7hBzzCqV1WOWeWFHp9VZywBje2F01GvSVPkcOJ/9r7S9Ua4LvvL7id
	kHqlvbmVD6UmNadUcDjOiAn83tXB4dTbngF+OEJl5pNyt2Nd4rQkzsZQMZcoUcO15kKdIaXE43C
	27upLvIy8h01gUpK8IJph91cTRwgIltH1cdHSaOaNhL1dJhoc3BaKE/iYBUFaYlJ5LM2JAbmGQZ
	73GPVR9/ox7tS/GYyPkTHE4Zh6S04ISfOxfLZRW9cYN+rCj+H2/1q9fEdWEO6/usGoJbdtS6z4V
	ZfjNBKaOj6gn+PzR86rQSw==
X-Received: by 2002:a17:90a:8c12:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b197c81815mr1116711a91.1.1794485840292;
        Thu, 12 Nov 2026 04:17:20 -0800 (PST)
Received: from ehlo.thunderbird.net ([2401:5a0:1000:10:233::14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b2cdsm4489297a91.16.2026.11.12.04.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 04:17:19 -0800 (PST)
Date: Thu, 12 Nov 2026 20:17:14 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Shawn Lin <shawn.lin@rock-chips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v13_2/2=5D_phy=3A_rockchip=3A_naneng-?=
 =?US-ASCII?Q?combphy=3A_add_SGMII_MAC_selection_for_RK3568?=
User-Agent: K-9 Mail for Android
In-Reply-To: <avV77eoO96zacmoq@parshuram>
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com> <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com> <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com> <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com> <CALj3r0jg5Ht9UUJGryuNdJdegBkPQgSTPSE6amjCr0g0PE7i6Q@mail.gmail.com> <avV77eoO96zacmoq@parshuram>
Message-ID: <073A7037-8E56-4B14-BBDD-DA3118970086@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 12, 2026 4:42:21 PM GMT+08:00, Vinod Koul <vkoul@kernel=2Eorg> =
wrote:
>On 22-10-26, 10:32, Coia Prant wrote:
>> Hi Vinod,
>>=20
>> Gentle ping on this series=2E
>>=20
>> The net-next parts (XPCS glue, dwmac-rk SGMII) are now in linux-next:
>> https://git=2Ekernel=2Eorg/netdev/net-next/c/5e91edfb0e45
>>=20
>> The DTS changes are waiting on this PHY binding and driver to land befo=
re
>> they can be sent=2E Is there anything you'd like changed, or is it just
>> queued?
>
>I dont see the dt patch acked=2E=2E
>

Hi Vinod,

Conor Dooley already provided an Acked-by for this patch on Oct 7th:

Acked-by: Conor Dooley <conor=2Edooley@microchip=2Ecom>

You can see it in the patchwork thread here:

https://patchwork=2Ekernel=2Eorg/project/linux-phy/patch/20261006162807=2E=
2843858-2-coiaprant@gmail=2Ecom/

Or in the lore archive:

https://lore=2Ekernel=2Eorg/all/20261007-9753b5de7344a15472337c6d@squawk/

If you need an additional Ack from someone else, please let me know=2E

Thanks,
Coia
