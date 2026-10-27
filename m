Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793145341;
	b=EWzZQreExeObz8IuQGnGNpfDr7IFFmiB4c95dRu9Cw48da7HDwyp0JDWosYwOcr5EKoD
	 4J7UyMvSK1p5KNX0pUjQBv3ZM+LzBO4arjDivS+du7I63lm+/8R5q67PmKDi6EigJNxrp
	 fzQhqhn4ogfwQGW1VduSgtw6g217ceQi8b+pDShKd0DKEdssd+lElKm1vtJhgP56NRaBW
	 j+wc/exjL2hmXmFDwHe/XHKCqMkPJPo+vJXd5zoIuCdPukTPdOpV+DMbuZ86ZQJkPzqYT
	 td3/9VtIGZROxc+lAICqxZ7OrKMpc/5E6VZEMQpQxp21ShLGRpNkJtrgXiNplSFzH7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793145341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vpayMuArKl0N+L9ZZISl3VaIV5/mes5Sw/FrduN0nwc=;
	b=hYYklPbvysi6qIIP7mwH9JKusBYarnVDEF3uflXMYTP1VbFVXL9ltJeHt8B3zm7bcTBR
	 axYEoQRkIpuGsvStYQRy86yLkvK1av492ikIBy/j7neqd0e/e+Sp0ojR2e3+5Z0M275Sc
	 pilWUHXD37aWJ/LgiAXdmIe76fVt6vdLEEccLeF9H+yueMPaByhkC4G5Pf6uZsdOAbR9u
	 lSDK1wUY4yadbgKa6LPLKYNeLBLfuMa69clBr75ckcGwGkPmXo21fra+goaJOx7ZKEZ2F
	 ngccdbq0TNa/61JN4dD8WDdi1Sd5Xej0wwf80/YQcCTG2+WEkctppDOvvhdeRCqOTyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R8r5tbas;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DD606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R8r5tbas
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e946155442so2680455ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793145340; x=1793750140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpayMuArKl0N+L9ZZISl3VaIV5/mes5Sw/FrduN0nwc=;
        b=R8r5tbasXxOORkKo9Vmy9n+lXff8yrEx8aYTQ9qRxxMJALgpDqQHGyyus9ioAdpAjC
         cCBjbPdGcugqIkiuv9H3KdEmI7zZEXrh+C+wg3MNSe70C6qIhvz5ATum9IN4Uvyzg7E/
         qOFbP8Z/v7vnOZbC+RPNht/8IMuADAh8/ToTDoBDoIT5VoODZv5qRY/mgANq8lfdO72v
         7AzjCavHokKKd4mt8hT5Yy1NYls5lmHE6Y0Odr8UF33yZ3ShSGPHcyTo7nZQG3Vs3sQp
         +0FR68hDT1t8atVrBypI6/WLyZh2yFhUj8Mh94Ox2pbCtu4HQoHL7OaG1YjNBit2EAV8
         OK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793145340; x=1793750140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpayMuArKl0N+L9ZZISl3VaIV5/mes5Sw/FrduN0nwc=;
        b=TwPhAv65EfImJoNuVpbv0+LI3dGE4wcPOU+UeDz0PdkxLxJEGfVUdLOEtnH3U/h1uQ
         5pyoQPYKIqwmqXY6rcOs83q6813jusHTJ0gh+zG6HLiv8wFq4AaL89oOlJw6nDR1l0qG
         psXOVyLvi+5HwrUIQLMUHe4p05c/iGKhnFJdUhalf9h/rmjljjIGn+t0lJcEy1J5NN75
         VeuDlKm3UM+rj1FQUy2gHkcCtALPsgqT+YvKetuMGgyUNRTZVm6WCyKIcvrsFeJWZjU0
         VglOJmjOCTF7JLmcN9/2BHpDn6yvnwNNRXh3I1oSrQAAK00tHJCL0ES+WMnfiZioBASw
         /aSg==
X-Forwarded-Encrypted: i=1; AKwUvBwu63c2XFF1gwlotIppJZetAZRhqLELa/TApMGPm5orOU12fiy8uFlIYnnfEw/Fs4Sn2SVIooSq1uPsGRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGUU6MlqnOIkqtQM1di2hBh9RmnCwc1FJmau+VKRHg9bhDXqju
	kSh0ivmea0k3pfYVcakdsIUYx6+Kkhy6z7cZeL6r5U6JPjCycTjMndM=
X-Gm-Gg: AYBFou1RE6BEBkleTx6UXYUtUvpGsD8aqh1n6n9OcjVDL2H+3i5ICzLIctwIaq/KGII
	oZmOLZBx+vUYvHvm84Fs19zjBS4a2o1QqeW8LTwrdUO0g73oiBzv1AY7SjSinCz9XyolXFdRRSW
	Q90FCZDYmkZCIY76IlKlazrBWFpeEwku92omBSiAKNnaEVgP7/VuVIun0JkFbre0dGlUCPVOc3C
	wM7OaPKWsBE99iTBCi2M8UY01UMkNnUM9O3Po/+yNLgqFygG++HnDPRQnWWRAaV9cDPwDJvKoK6
	XmGASOVy2gqLZOBn85IHsoQr/pWqMuqtf6H7ZDyUY6DT7/FrP21JqwkGzc1GlajH2R8NFU4ZyW1
	/gKSwGAEvEtzRJPXp2gWh8vmEFnIeeZK1HsCQrJ66s19aPVew5d9mtiXoQRooY00e5/Ic4X7ZNm
	MReQ9UTaPcbZJj7w3JvY/rHADNIii/wOuITKLUQZeAxNeEJp9H2gwyw+JZi4aQmx5Eg3bqEJDVw
	fVmCucGC6OIkm/JagaHxX4XyanPm8TfipSKsunrgZ0LLl2sn/9h3W7lAnlxccVBD92kFBODgdR4
	WnRRXPJIvtBDL0vp3yAv4BL9vtDuvna6MnMP5drKhygMlydVUCDRTPC8L+C2cXDndTI4IeO71U6
	UW7H4Fev/
X-Received: by 2002:a17:902:e805:b0:2dd:b795:9cb6 with SMTP id d9443c01a7336-2eb0048808emr7482155ad.21.1793145340203;
        Tue, 27 Oct 2026 16:55:40 -0700 (PDT)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b77e2csm14776105ad.19.2026.10.27.16.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 16:55:39 -0700 (PDT)
Message-ID: <830ef909-d0d9-4f4f-8b73-0fc0cb7b46eb@gmail.com>
Date: Tue, 27 Oct 2026 16:55:38 -0700
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
Subject: Re: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Nabige Aala <nabige.aala@oss.qualcomm.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
 <76e97352-3a54-40de-8ef0-eef0ca27ca73@oss.qualcomm.com>
Content-Language: en-US
From: Burke Cates <burke.cates@gmail.com>
In-Reply-To: <76e97352-3a54-40de-8ef0-eef0ca27ca73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2026 04:07, Konrad Dybcio wrote:
> Please check the attached patch.

Thanks, Konrad: your patch fixes C2. With it, the RTL8159 10G NIC
enumerates at 10000M on C2 in 8 of 8 tries (both cables, both
orientations, present at boot and hotplugged, including a hotplug
after a cold boot with C2 empty), with no regressions on C1 or DP.

I tested on the A16 (UX3607OA, SoC ID 662, revision 2.0, BIOS
UX3607OA.312), on v7.3 plus out-of-tree Glymur platform/board patches.
Your patch applied as-is, and I removed my local PHY changes so it
alone programs the USB tables.

  - RTL8159 on C2: 10000M (SuperSpeed Plus Gen 2x1) in 8 of 8 tries,
    with both C-C cables from my report, in both orientations, present
    at boot and hotplugged. No -71 or resets during SuperSpeed
    enumeration.
  - Cold boot with C2 empty (my original failure case), then hotplug:
    10000M in both orientations.
  - A VIA VL822 USB 3.2 Gen2 hub on C2 (a third cable) enumerates at
    10000M, and the NIC behind it does too.
  - C2 stays at Gen2 across s2idle (no disconnect or reset on resume).
  - C1 is still Gen2 in both orientations.
  - DP alt mode on C2 still trains 4 lanes at HBR (1080p60 monitor).
  - With the NIC present at boot on C2, iperf3 to a 10G host gave
    about 4.6 Gbit/s each way (TX 4.58, RX 4.71; 4.55 + 4.56 Gbit/s
    bidirectional over 60 s). The NIC's link partner is 5GbE.

Under sustained load I see about one burst of "r8152 ... Tx status
-71" per minute, each followed by an r8152 reset of the device.
Traffic continues and the link stays at Gen2.

Separately, the NIC only gets Ethernet carrier on a Type-C port when
it's present at boot or behind the hub. When hotplugged directly into
C1 or C2 it enumerates at Gen2 but never gets carrier, while its USB2
side errors out during the plug. That happens on both ports and
predates your patch, so I'm treating it as a separate issue and will
report it on its own once I've narrowed it down.

Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

AI coding assistants helped run these tests and draft this reply; the
results are from the hardware runs.

Thanks,
Burke
