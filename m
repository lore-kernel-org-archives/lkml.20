Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914998;
	b=RvvV7xLmmmIvXNnoKMKbhawnYCOsSpbElfYKyv+F/3rFSkR0xm4adI+x+19ppjvHzjM6
	 UKnd2Sjom5RR/L7NhdBEOmgjN8QHc0Ahpp5uzN3t35SSkxu3sWSnFttuekLCeT2ghZ/aM
	 RG0nqDEQRyvd6ZnWjmKepBha04rwZghBaxsan9KTMj1VX5dG9qFKQt5XWUGEk1xBv1eH9
	 8HDc+WZRamgHfd7WwuybWVbodW+CgtN/dCN/723V5+/DskakooQDT5r3v+F82hd5VTszV
	 0vX8XxDfeBiKDX7loO9ueLiBI/IEoztnHR2iqay3HKcwvplXUB1Yv3zzZHA/HoWeO6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7PpH8CFYlHnNxARQXs8IGL2UM+NxdPruNFdu22N3C0U=;
	b=Fu4rG+Z2/lSeHdk1ttzMthjP9Cvu5xdTbCGGX/hPxlk07hwbIiRxi2Nj1dG1uRaF47Ct
	 KIi0f9UX7sD/HMonkHBDWotKAcPVi8sBtSZqxW0Id2M8XRNu2CEVspQIVZs0rnGnRa4uP
	 VPW01EyeTrYoKVHNtJVryocH6HAjR6qkHerYLejBtb/cAhWaDLbIopstkZkTnyHz1gpkd
	 ac6m0Z9hauff40kz/xbW94wOLBsSD1gdbyWvHumcVJt5pDuLWdUAL3YwlQ+bw5pTpkPIO
	 ULcCSdwgXfMOGjro9gPysNjTw8PaWcHZE+8XUE1bLpcRafsY0GcCC6oKWQfORBrNw1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=t8T9AI1V;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=AEi9x9En;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01578606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01578606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=t8T9AI1V;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=AEi9x9En
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5LY7xL1048525
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=7PpH
	8CFYlHnNxARQXs8IGL2UM+NxdPruNFdu22N3C0U=; b=t8T9AI1Vd7hp7houkyi/
	GYfcLUwnU4sZfiJvctTAZwu9l062POejIyMNEIQrj3kPhrWVQjnju5GxNZddOoGn
	7D5Q4ugEm0U3FeZ7TugSQ6rCqBRjC5P29vRfG+D0YXd0g4976jbCcFG9yjQG1QZp
	WAb9M2Su4wz1BsfncLD0mgPp+tqD0KFrEY1tUZblbveKwfTwNsIqTtypVhzeLANn
	54tiWbS69pUJsbX/FF6aU3dQfQNON1UZ8kwIPGB/wnWuCFYzYBvlsE8qjDvibXwK
	inTDKwdZ4OtVcxUITJd1QJc5iX2cpaD6hJ5qaR6goC5nxDFL8hOcTWePGWrajTPj
	8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hrunrcc04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:43:11 -0500 (EST)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb93c874bso229470985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793914991; x=1794519791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PpH8CFYlHnNxARQXs8IGL2UM+NxdPruNFdu22N3C0U=;
        b=AEi9x9EnboVaht8lN4QQTZWLR125/O9AbZnH4Cq1qfR4aYdOVCSJJvtU/YiicWGrYz
         iJh6bJH2RZzyAJrO1+bnCPtb5hd6yH3Or9goq4GIwMoMmK0JOatA7M/KX1pW/77fc7px
         HpFPxHpOj3A6WSwOoBzc1IrZLlEg2y86xZJvc3rlfz+xJ7ftJhVYU5xTlbEhEoRhrkp5
         B44sR/IaBQqxm0FiPnNEwVijQ1f7Xy0FlVYmZV+K3vAI5v48XOeX+2WLHRXN5K+mqbNC
         d88CxIwZ0uyTuIZUlw/c66JCT3Rgnej5kTfKHfMNMo+MdtRfKkgSpe63C9B35oCYJPKp
         yHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914991; x=1794519791;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7PpH8CFYlHnNxARQXs8IGL2UM+NxdPruNFdu22N3C0U=;
        b=pj7F8UlY6nhYFiWOnklCRP+SDruE2597FshQNUCTP/rnvdzxIks4gr3eajDQFEki1e
         R0vIsT6wJ33GM4pfcDiGtd8uGdtFHjua2QbS3xPk+K9drYs2dC8sKt4DOSwN7rOIjFQ2
         SqKK8i6tKdjpj82lFRm/JjO1Cr7Gs2IzAxJfpXo+bpVNLt+aBEtQyWhTUzu7ig3dRg5U
         HTR//DM1qqLqtPOuOiLzPPizOqMOoL7eT+98RqIS0x6qsKQ+bHgZfOshtbUJL4kXcIvd
         ljIMgwantBjDZs91RVL/A4hRuLblb1tb6QgjXofOc6CRslW4P1hxls3LbtZE2Low3Rcc
         Q32g==
X-Forwarded-Encrypted: i=1; AKwUvByXkpw/oiH9wHuW3YqrNgZWRk95oVZGzv590vaAWkvjvHsX4K4Iud3q9mm+kBVQp3cz1Uouzu4v1M4ytrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WoAiHFwF7QoC3VsxFfR+mOhVP+990Sfp9GQsHQeWdHs/1CRJ+
	N9VpHMlZL7KP6zULPjYJ7sVQ6eY3h7+gQs9PBtGGUBFpr+RCspLWDinqUscKBqTAmlPlCBzLFBx
	PojPHBV1fElmPFBL8hESzR36nqakR/JbTp5xly9rYDgyYiR8l2WhXqlwFhCR4fQ==
X-Gm-Gg: AYBFou2/oO219yvN36zcmZYgLisUsweKEhB9/Z7VHo5c0yVfwhuK5ICZIm/dV/KpEoZ
	s2QCQPTKOCGjxMIJiyUVTKjWpgXvShpm34hMaUOWlueJRm+DyP5GIZoLy6t7vq11guMObct+Vys
	KoIX5T/kbU39OALbmHh5XG/yUYydskB27ySnSeV6h1lTN/mbMISXRFl68JE08YivrmM1eYMRdkB
	llfVU4soNqBRbdG/YS28qhS2Q1m5w3xN0TXlc+A1WoqYi0a/1+UfK1TZYW6bwTD64n5XQQWMQu2
	2DzcUYdCnTHLyZBn229Lx3f32MK013EtAnlFCBONak9BewFhYPKC02meCxxp4lvsadVCclWEF0K
	aWx0bVlmda4sXvb6hpP/xvdrIOxtUIOdrjtcR/JIOXj6RZzkExeWUc5Xb++DnkLYn/K1UFG4KnG
	ul6fMZz39OyiTL0AnI4FvTnMS1TeVR+9cm86HxkjEsJs4IYvH3hzEmS9Qkjd/qR38rcySaJwV0d
	iJjD7aTNgR6+Z3OFBJ84lW3Rw7DWqdN12CMnCbY5Qt4PayQo4A8akJ5Wu8hmsDT
X-Received: by 2002:a05:620a:600f:b0:945:e177:895b with SMTP id af79cd13be357-945f346873dmr64368985a.7.1793914991151;
        Thu, 05 Nov 2026 13:43:11 -0800 (PST)
X-Received: by 2002:a05:620a:600f:b0:945:e177:895b with SMTP id af79cd13be357-945f346873dmr64366885a.7.1793914990883;
        Thu, 05 Nov 2026 13:43:10 -0800 (PST)
Received: from [10.206.221.57] ([129.236.229.247])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488e442sm546673885a.40.2026.11.05.13.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:43:10 -0800 (PST)
Message-ID: <06ca7638-85a6-4fb6-9cac-b495d213ac05@columbia.edu>
Date: Thu, 5 Nov 2026 16:43:09 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: cancel napi->timer after the grace period in
 netif_napi_del()
To: Martin Karsten <mkarsten@uwaterloo.ca>, Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>, Joe Damato <joe@dama.to>,
        Dragos Tatulea <dtatulea@nvidia.com>,
        Kuniyuki Iwashima <kuniyu@google.com>,
        Stanislav Fomichev <sdf.kernel@gmail.com>,
        Sridhar Samudrala <sridhar.samudrala@intel.com>,
        Cosmin Ratiu <cratiu@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
        Wang Zhan <wang.zhan@smartx.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, tz2294@columbia.edu
References: <20261103-napi-timer-cancel-v1-1-55c631ad5286@columbia.edu>
 <CAL4WiioJuY1L5ji7tVXggp=FDm3eidwekpxqAMdnxWUyiTR3fg@mail.gmail.com>
 <ae3e5838-6985-48be-bd99-fa5a21143942@uwaterloo.ca>
Content-Language: en-US
From: Mani Tofigh <mt4022@columbia.edu>
In-Reply-To: <ae3e5838-6985-48be-bd99-fa5a21143942@uwaterloo.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX6D6Gf74pCoCd
 boWnZiOiBhM1vFYUu4phS4+E1C+1Q7uyL4vgXCcpDbxQMCSmOHmz8aQWVZAN2kzFfnrWOJZxKSE
 4UJQXTvwV6g4nf+EfH3iJSojyx7P4xVSgktqETtphoo4XB3MNGEZ
X-Proofpoint-GUID: 3JNm_FM_ED_eBbbCBDB6G6dKD-E8CbNX
X-Authority-Analysis: v=2.4 cv=c/I+0h9l c=1 sm=1 tr=0 ts=6aecf86f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=JerxfvFqMz+qeRdZ4jtV1Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=Xv8004Xbw9qiBDHpymQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3JNm_FM_ED_eBbbCBDB6G6dKD-E8CbNX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX+lSlNZC6eTw/
 KXcMU3do5NX8i3rOlH2wKeItoeZokLwTHfX/Z3MTu41LlyUpSGS54I94Iq8aA3EEvsUXANyj0vv
 zCxL5hSVrBt5qQr4oxnMoFzJsVPOFmYwCBmj+Y5e0VQF8Wvq/ALEF4mkbnKTEcWj3GmrmhJCouc
 fjAGq/Yuo4lVwc4CJRR8gyfa6ZeFT/xpZzblT25MAVvfEw38U8mMOQvTZT/NnAAi41pKkYnyg84
 u9TOrS8RnbDHOVsrvreX0UcvS4+/N9Namp5E/LgDNe7cjdEHlEBP/ongPcz6/jzLxnRpPI2BI1p
 g1aD+Hel9Rlys8XB6qi85nI+GoCKndR57TwIo8Z0UTniv7cns7PGjVclqmquABoc3zC72jm4wbB
 jfoP4y2Ge3BsW20Smr6G9fCfP73eTZPCfuk/UsCeiio4CF2RS1MjlqeltP3Q7fMyK8T1goM9OSr
 nrgVp42DaDkQqZFBRrA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11957
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=10 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=10 impostorscore=10 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050085

On 11/3/26 7:55 PM, Martin Karsten wrote:
>      if (unlikely(napi_is_scheduled(n)))
>        hrtimer_cancel(&n->timer);


This worked here too, but I think the cancel could hit a timer that a
new owner just armed (e.g., a busy poller that clears SCHED and arms
its own timer right before our check). I'll go with Eric's version.

Thanks!
Mani

