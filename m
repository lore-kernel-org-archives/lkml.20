Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083234;
	b=n2vwhyXyfqIzecN52DOU4MxFNRkQOZsoxDQC19ZJoDRvqqp92XzOUeVAhhgszfkwx4br
	 Ca+kG8SuMg5diq882fqvK8EZwrrHNQ1JcXmlw7sk5CSuzXWDjiMEnkh8cI7/LzmxaBRPw
	 Lm1sF5tmkM7WpFa9rWm643zCYc3bsP9mwFGC9fi2dCa2vlrC1k9rgFLihNWTelvmDsjRp
	 gTXTAk9WHCmnEE02gWf/kA2vkFZunjvL8AsGu9fEqxsH9Q3imi+NWSsP8eSG+2yt6hrY/
	 Y7zBkPVOqlXfcxaz6CfM1PDKRU1EBwpy+aoZk93oCFo2HkytsjcfvCJEllE+OhtbIiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=FMlVixG0r7ucjTAqdIszWewlNzO+T0JDcfYGipLMztI=;
	b=cKLp5QJZTL78HlF+vV7QbO1tnjjTob/jvKXOm3UKYS9oDlMUKvrKlA0Hrr6V1JBEkg2j
	 KhJ/ZHVMkcVKtDpejMMiQPzW9hrmMVxoUpCH6mpcJ8p+Jf777GE+O7cl/Cxba+Dag9ikj
	 N6yUtqLK/6GVjn5Gv1z21b42ostpAMRJr/gm1ujPpwc9mI5SPrRiAK4wvr9GYS6YLg2lm
	 kByd6wMQX/SRiR2hPT21LK7JnP7hZ2+uZP8gFn61/iv8NdcLH5S2qOM6qvffT0cVlnT9O
	 9FIRCZI0RJyL81gLmlZBNR6sZxGH2RcxfsE4dP3Urce38RWPsnADECXyGvx5ypQoqYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C0CPxuo+;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE1E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE1E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C0CPxuo+
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so3792153a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793083234; x=1793688034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FMlVixG0r7ucjTAqdIszWewlNzO+T0JDcfYGipLMztI=;
        b=C0CPxuo+KdEaQyPnZS8KuAy5PX0fa824kYaMK1GEXSXUZ8Ghxds/6AB2PkalA0VYyb
         6RXmDkaAJYWF4HKVte5cztqYvAunN2CKzdlT9RVlcW2hdL8Iz8eRlf7pVhsInrbj/vc3
         9LMaDH4SAriDU3zRZGke+KlOpACdRYw1U7OqCgVasV3gk7I3A6qwYm8qCWwLPGKx1BJ4
         Q0FlOlPjALOP+BNuCKaQbSjA3inP0CZdhroo31/ppvcGKgtrBm8yzzHoQcpm9mC+89ri
         F5U2mXVu4gGwbu8LirOBolvHYwzb+fs633zaxn6ax2M22xuir77VVHJEv2oHFDcSKv8y
         yXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793083234; x=1793688034;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMlVixG0r7ucjTAqdIszWewlNzO+T0JDcfYGipLMztI=;
        b=wtwwb0TI8rrg2nQ3KpWRXUI+on0RdvpGaWR58m2sO04iZpTBSKCWPMi8LQwfsTMls2
         PjzOkuz7noJahMkKj5E2y3IHwQnSR6iwOUUrXchjlhnPo1Hzx3FrM7T3aE8GylzG0oz9
         VNunjAogwJuuYdxWw44O5yKc7dxkJRIbM7xI5OKvnCaDxgjRti2H9vVocS0LId2ns41O
         yUx7jVQXNiFV4pTyTdCnMd0Q05O6ZDA0B4OdH2bRQZPGwMgjEHyl2x8xrZ9mUS92Wphc
         Pm5J+0Q2KN4JpN7HVMKgpEFjoonXogO2YMJSEeUm2/miCdDBYb/iEeYhz5QODz8ii7DC
         FDNw==
X-Forwarded-Encrypted: i=1; AKwUvByPmCUkDlrSkzRP+ujUg7lrj3iVgG9dnp7G34JyfopvgdmRODBTppzfXRUgVi6RrytXukIdKvatt8wqTOI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ3QUZq/vZnwIDRH+Wg+vLGnrdSaaAbH032oS0A84i4lg8uAra
	nF6Q6G8ZBDeFu0lxChiGQh0f2YanoQYs0A5A9PGyOppe0SkrIOhCv4A=
X-Gm-Gg: AYBFou2/Sc0KyYVEiM4fcxOlLFWx9pC/ReL3CeHFujkfQ/N8MmJ6SugE45kS+lolG65
	1GuWOXjdtwWlSK1tFnidG1ecmyz6l/U4nGTs95VActvbI7CCK8RC978Z7avNSZDIiISfvFmRQLz
	874qpxTxqUmYTXFybNkTER2rq7Y2M8Q15/icNetl1NtcF1FQ2LhROwNUhX1BrfYt7YXGBocSTDG
	njQDWR+++iRzTUEXExXR//IZzYefWco1m+5jXA35WHuMjZIIuhr6zXp0AWYtFViNXT5piV/UOy0
	rBXG1LLqsr38UKofcH/iaFkoEcOgS3KZ3FB6Hk59hdkFkXnFXb7jbPD9kQ1AUbJqAHniwO/6g6C
	4fngRk3NM4kyNX16ojSb3MBELIR9IyNn5pwZ+jshxMyxz3xKdSaUpkoN50DPaRgc6MpsJ6LFj9k
	+7HrCmlzcv3kRj2heQf/vbqVj1VXPWmqP9NmevcBQywuNz7dvtIsXoAv4EnQYqhaNebphvbraS+
	HzLre4W1UIP/p9DBxN88wCwN3gsWGxeUfkZJr6mmLdE4SEIh9EvkJ79V+hh1t6PVy7lDDLQZQx1
	J59VrXSFBJ5D3A==
X-Received: by 2002:a17:90b:164e:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3ade9b2ed66mr7926692a91.8.1793083233783;
        Mon, 26 Oct 2026 23:40:33 -0700 (PDT)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066cf2dsm2200569a91.16.2026.10.26.23.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:40:33 -0700 (PDT)
Message-ID: <5b31ea48-7918-4f0b-b012-6915b384b922@gmail.com>
Date: Mon, 26 Oct 2026 23:40:32 -0700
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
Content-Language: en-US
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
 Nabige Aala <nabige.aala@oss.qualcomm.com>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
From: Burke Cates <burke.cates@gmail.com>
Subject: phy: qcom: qmp-combo: Glymur USB Gen2 fails on one port (chip rev
 2.0)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Could someone at Qualcomm check the Glymur USB43DP USB tables
(glymur_usb43dp_*, introduced by 5b289913959b "phy: qualcomm:
qmp-combo: Update QMP PHY with Glymur settings") against the
supported production settings for chip revision 2.0 and later, and
post updated tables if needed? Is revision-specific or per-port
tuning expected?

In short: on a retail ASUS Zenbook A16, USB Gen2 fails to enumerate
on one of its two Type-C ports with the mainline tables, while
Windows runs Gen2 on that port, and local changes to the Gen2
receiver/lane and common PLL settings make it enumerate. I'd be happy
to test proposed settings on both ports and report enumeration, DP
and suspend/resume results. Details follow.

The machine is a retail ASUS Zenbook A16 (UX3607OA, Snapdragon X2
Elite Extreme, SoC ID 662, revision 2.0, BIOS UX3607OA.312):

  C1 (left, rear/display-adjacent): Gen1 and Gen2 enumerate
  C2 (left, front/user-adjacent):   Gen1 works; Gen2 fails

The tested Gen2 device is a Realtek RTL8159 10G NIC. Two different
C-C cables reproduce the C2 problem. The same adapter enumerates at
Gen2 on C1 and on the Type-A port. Linux applies the same USB tables
to both Type-C combo PHYs.

On C2 the adapter either enumerates at Gen2 and resets/disconnects,
or never enumerates, looping on -71 ("Device not responding to setup
address"). For context, this October 22 excerpt is from the earlier
flapping case, before UCSI was started in the initrd:

  [  307.056050] r8152-cfgselector 6-1: reset SuperSpeed Plus Gen 2x1 USB device number 3 using xhci-hcd
  [  307.136539] r8152-cfgselector 6-1: can't restore configuration #1 (error=-71)
  [  307.136705] r8152 6-1:1.0 enu1: Get ether addr fail
  [  307.651093] r8152-cfgselector 6-1: USB disconnect, device number 3

The failure also reproduced with UCSI running in the initrd. In an
October 24 A/B, keeping the cable and orientation the same, the
unchanged USB tables failed to enumerate on C2 with the -71 setup
address loop. Local changes in the Gen2 receiver/lane and common PLL
settings made it enumerate at 10000M, with no -71 in that capture.
Windows programs different values on this hardware. The A/B suggests
a settings issue but does not establish which programming is correct
for production hardware.

With those local changes, C2 enumerated at Gen2 with both cables,
in both orientations and after s2idle. C1 still enumerated at Gen2;
DP still trained four lanes at HBR on both Type-C ports. I haven't
isolated which part of the settings change is necessary.

This is an enumeration result, not a throughput or complete NIC fix.
On the changed kernel the RTL8159 still fails to get Ethernet carrier
on both C1 and C2, and cfgselector resets recur. That is being tracked
separately; I have no Linux iperf result with the PHY changes.

Under Windows the same NIC negotiates Gen2 on C2 (USBView: "Device
Bus Speed: SuperSpeedPlus") and carries about 5 Gbit/s each way in
iperf3 (about 6.5 Gbit/s in total bidirectionally), so the port and
cable are fine at Gen2 there.

These tests used v7.3-rc5 with out-of-tree Glymur platform/board
patches, including DP PHY support. They were not on an unmodified
mainline kernel.
