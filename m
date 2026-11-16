Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870033;
	b=2M9QlAGaCJ2soJl4cpaw0yHWnMFavaN8rT2SdSrhTkP/Gogl0Q/4aMuwi4AdQMwdNjmy
	 wCR8SQtQVpNyhHh8cko0+ML7gKZldzfxN1wyemz8maZjc5pTUxJlmretB2+7birI8pMS0
	 eDLpzmA3GAZk7skVfpcu71XuOIn+LHQOPK5Iwrq/ur4XcCZU/Q/HA+YGIO4EZ9i6o6agl
	 EWM8XtMpfjlaX/BNc4DhKeWbVlcXR1aacnAm3iMQ3sav3St0Z+q3Ai8PVn9YEIKO8auRT
	 83HGhzmz7d5dxA2mxxb0m3C/YSKOgvZZPCfexP/9UMlPQ53oDkmZHYDHutC6K7w8ugQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=BCHVgfl79qsgOh8V2QC+/phw3otd9S0rQogMC77mTS4=;
	b=4Okq0s8Ir1ByElh4FjFhNFGIsxmWxEDgMdiUkUh1R40plcroPJ7c1yOZb2kW/ao7x8BY
	 FZEaZTFkHljuPBYWVoG4bZGjdBA+k6PUEg95VWRjqxWQzHveoaF83dMrvKpN0i2IoRpk5
	 N0uo7i4e3NoB7l35d3U2X4nxaco120CCW00pI3I+9HsoX70TBrkFD5wx52oUUZ6/XmFob
	 jzjeYbxH5nljxzXEKGxaeTDoNEnOOU2oZzzeXzop4Fo1VRhOQdU6FcJv3L+tyNmkJkix1
	 eZdNgAwZM8YtyjMUG6mT1jfsz62KKKv4cfenY8oZJIUfsdfTFcD0DiVszbbgpJ9P/cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bqSqU6yF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E8606A33B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866E8606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=bqSqU6yF
Received: from pps.filterd (m0528009.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGM29NA3418568
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=BCHVgfl79qs
	gOh8V2QC+/phw3otd9S0rQogMC77mTS4=; b=bqSqU6yF6qU3K0lBCnujplBnoj6
	Qk04NCwjHPY89A0kUMgZtt+BMSnHZZMbjJQjUfXSzYh5Rl2q6WmEZGiohyprZ/uK
	0Kqe7TUQiVFp6yOTrdaSP049p3IvIPaw7y+dJL7qKbHtdYYUSqQmeTFpAB8X+3f+
	ET32GeE3PKZduCdi6ipMtFApojz8LlJYmXdq4PzaYQuCXxVbRdGTC88PNbebbR9S
	b9GjBWYtvzkNTkjsDZ+lSj12/5ZbOh0dwt9I0ENG3loyFGBqOnytPf5rM0td7IZu
	iME6ei8GOC9CAZDOvKPUffcdZVdcE2zIxNWapMTB+2v4zIUjWcdL9vCjSOA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hya99sdxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:31 -0800 (PST)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso2505628b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794870031; cv=none;
        d=google.com; s=arc-20260327;
        b=JYz8vZQ4t8Ar4/auww8+TiHAyNa3gucalR4be4rMiMrJmgARv/iP1p7uDREdKa+Gmz
         yZXgRuYTxZjSxZ/Qdr2WWoCpLVZwUyiom6AHVo1LHb5aZC5CDrz1mi7HzAmQvhsKArre
         tpXabkD6G46IBUq6tf5OxnmxRmGDvhOqZhBtf5l/cy9fg13HQwEjb5tzhe4ZDpWMtYoY
         KRLN3ciB9OYJzwgxyd0cdTtx2i78Z4WPq3vHf3AhLu2IPDr0A3c5sMdh4EDtzkG5xFTt
         FxeXOgHNVTWfXVIsrV9XYTCIURFOIIisi3IAZZdP3lmyNZ+PZwaoodlmn7ZkWiQ0B9SU
         EPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=BCHVgfl79qsgOh8V2QC+/phw3otd9S0rQogMC77mTS4=;
        fh=lbLY28GFaIThS8j4P4XtjzFoyEsvsmL61L4HB3/bJRE=;
        b=btgpBetxCdI8gPif41ySltt/zoW3ioayRsXwXWahKxb1yAlZt2bt43thet8RX8ggHF
         bHnkNjK53Y3aZbxq8RcVjnxwj4LrrJ8G78qLUPbHdWx9X5nzs89HL1weV9fCJna61Jr8
         SGFjI3jg7hQ9M1COWDtcXyfHX0jyI3rxfdJ5j3C6Ty42OzrqitCK1holgbuiwb7XHkU+
         pAJWqp6VUrvlTca2pN/95vRTca59qNOptDl8sTY3Cb+iMgdlpw3mewfhOCDiq3/IhPT8
         Ns8vYXKtaEwRvODgINKZGbBJkLDxI9piFDuREM0np9xMI122d9ot+U5FZcTu/HRPZ4EC
         qVqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870031; x=1795474831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BCHVgfl79qsgOh8V2QC+/phw3otd9S0rQogMC77mTS4=;
        b=txMpASN6VBavFtcDuvX5HxddklN0TAafA6EEn/fliKiEAgvTV5Ki7Te/bKUIPyu6E6
         o/ohOJjPx1NCD8bzOMR4R5JEFk8yHJ5zzjs0YiNkqvBe/BwwcqvVFo5h4Xu1evPvNwlm
         YulpxOTTi4TytVK8IsJVCNmm0RrjB2/IPWpf6aIk4GK5i2yaajMOzZ56NVXymUUqV/9S
         fJEK9wXGCL5cLAM4lcqZqTuumr2kFKjsaqTpd3pS6efjxqMSEtm0gkuw6CotilOvg44H
         idylM2Gj82Egyl4EW3vAVzJCSHDeRoLaQQIMPuys27dOYDk+EJsj9kECAhy9P1+DUmjK
         zyQQ==
X-Forwarded-Encrypted: i=1; AL+hErGhCkTIsnF6x6Yj2cKhey59Cr592KBDs+Nju2kN9hXiLRiVWCrHJb24nuJqRz389G29lPLy9yCm0vS0uuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JSbUjOsBwSmtVgU07uBeKP5S+XNOMybFv0vXV9zRB8mdDVFsk
	576+DA7G38FTS5N+mLKdCUL4JRuKwVlUrjHlq0JkaWRkWwpcu1y+zbhvGVuzvXltH3BWJWNI+AH
	GogEf4citojPPrwtXe4zmvmHUwuaqx1jsG9uoESMR+xOfCCoemUNU9a1dNgcdePE1DbmNYixg+S
	9iELJ4A+sZ4rD6PtVe+90tDnlWpcSa1zWWr9OrREs=
X-Gm-Gg: AYBFou2ZKDL8q18AXr2QNyz7sJjU9aue2mQ2hv0qqSj/8qzoZLbtv83Jh6oBhmm0Vfs
	FIcdcA6/b3gNO0rVBCp2XCw1EZcTzhM+xQXV8Bq2Ws2ls8wv/I6wc6UetiXAJPuJARWuV1ay/cd
	hBO3kc89e1ABA9k+h9ywLUiH1YvGGj+QxqGiiBBYz8R/kpWhkgxMelLKWeFXWjnxZ9OIYUo7Xj0
	Zl+XZ190n59lmrN9Cl96GGa8dyUDuwaolTCM/EpUnOSAfeh3A0=
X-Received: by 2002:a05:6a00:2d1e:b0:881:be70:4490 with SMTP id d2e1a72fcca58-8beb6193d24mr11011930b3a.28.1794870028036;
        Mon, 16 Nov 2026 15:00:28 -0800 (PST)
X-Received: by 2002:a05:6a00:2d1e:b0:881:be70:4490 with SMTP id
 d2e1a72fcca58-8beb6193d24mr11011901b3a.28.1794870027525; Mon, 16 Nov 2026
 15:00:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111001831.3710881-5-toddfreed@meta.com> <179472727079.2199510.11728930190494845454@kernel.org>
In-Reply-To: <179472727079.2199510.11728930190494845454@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Mon, 16 Nov 2026 15:00:15 -0800
X-Gm-Features: AclHuK8U0c5vpo9LrE-LUBEl9Mos_YCScdKBQ9e4Pj3NM_Kna-AkoWmo3RzMn5g
Message-ID: <CADh2yMz==oX8OMx+dqNXort+h4vUFF6LHLWmaZJMTzoW0f+Jvw@mail.gmail.com>
Subject: Re: [PATCH net v5 4/8] ipv4: icmp: don't quote decrypted payload in
 icmp errors
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, borisp@nvidia.com, cratiu@nvidia.com,
        daniel.zahka@gmail.com, dsahern@kernel.org, dtatulea@nvidia.com,
        edumazet@kernel.org, idosch@nvidia.com, kuba@kernel.org,
        john.fastabend@gmail.com, leon@kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, mbloch@nvidia.com, pabeni@redhat.com,
        raeds@nvidia.com, rrameshbabu@nvidia.com, sd@queasysnail.net,
        saeedm@nvidia.com, shuah@kernel.org, horms@kernel.org,
        tariqt@nvidia.com, weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX0dI5foSx613c
 uag57pVO6+SC7pECM7RBtp81oUqF8FNX1lAT7V0S4oJYHzUEc2rK09/K7fXWEEq11vm34TQnsLd
 dyaAQkMBM3eKNPmA79GE8A7hF2JeudA=
X-Proofpoint-ORIG-GUID: rRq9VSlmqMd1s4cAQXpXqhzMN6uzBBVp
X-Authority-Analysis: v=2.4 cv=ZuN4uN7G c=1 sm=1 tr=0 ts=6afb8b0f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=U_y8lYiYyhHBU5rMqhb2:22
 a=voM4FWlXAAAA:8 a=-ThzyT3jwNi3vWZZJl0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: rRq9VSlmqMd1s4cAQXpXqhzMN6uzBBVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MSBTYWx0ZWRfX12f2U4T/CU9l
 BaGdzhNX2hYbSaIWoTohf04gN4kkFgcEg0EUtwg1nhomB95P3e28FKlHlxX0kLMDbmlckfsRohE
 z0TyuI/vQN9UxYnK5cCfCrH98RMR8QqnoVxX88hevik1RYZ4Ze1govvDcj0jYy2XmEZf/7Az0fh
 e1jCLax/qIkOLJutn1B2QbzkskD/ZPgQIizRDsErq5TghtcLIA1hfyRc8H+WfgKwhxgS9OFZIvi
 Zm7B8GotMA3sVMeJQAx+OZ8PavN+LD1CPYeUreTvLieKr3DIOSfVyzITi1YeOb2j12xYifDYtow
 sGZnTJvHDW7MMNjGbClycaoG7JNQSQOczrj+qv8Vf4xOj9AH60JNpensyEYAhKApFNIHr4FvE+5
 Hp+zFlfyHPUZgabktDoaQQ0eQLptCAUEuuJZjTrPGqUW04wQeNFAcsTIWrNokTt6pB8JMyr/oiS
 Qt+4HH/5rfA5B420SKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Does this check cover every reject path the commit message names? The
> commit message says:
>
>     a reject rule (iptables REJECT, nft reject) sends its icmp error with
>     icmp_send(), through nf_send_unreach(). so now, a received packet which
>     the device decrypted, and which hits a reject rule in the INPUT or
>     FORWARD chain, is now dropped without a reply, like a drop rule.
>
> That is true for iptables REJECT and for the nft ip and inet families.
> The nft netdev and bridge families are different. They build their own
> ICMP error and never reach __icmp_send():

This is true and I will improve the commit message in v6 to explain
this more clearly.

> Should the check also go into nf_reject_skb_v4_unreach() and
> nf_reject_skb_v6_unreach(), or into their callers?

These paths are covered by the netfilter-next series "netfilter: don't
send decrypted skbs in clear text"

https://patchwork.ozlabs.org/project/netfilter-devel/list/?series=533037

-Todd
