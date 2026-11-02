Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793620624;
	b=sdzINfHTdVbeq49JaGj/7tVhO7BnnS6D6H9wHH3yMlhWm4kzfaC/Tl2w4dEY6PSP2sQ8
	 6slR9FRwUy2jGk9g4O2kPCoX96neGe89LD9WiN64knVttSdiIXOjTxp8CCM3dZJepZMk/
	 yS0Kt2Cs16+NEPCj8LHVsUU+U1hznLsDZKZNdYSgS4f9yjVq8qXpIV70bWOiDE+QDJDtG
	 zV9C0pYWP4O2LBmJrMy2CHkKcCnDQXxrgXbZcVv3laE6SAFjUVd2R1uu6PtwHYbBwZ8FV
	 umnK9FZlF5KUW4abf6CTMDmxB/mxW1bJMAgrau+dtgmfG0c7UAvXFi5l1ePtdnkpw4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=;
	b=YH+CbvpwI7n7SrJXNYFPlFoAnObSfo+nBaFUglraCmnUfIGZskmQHdPjCtHazMIQtBci
	 H0jG6CMOE9UgvdAgwGvx44VGgQ1IweUiN3CijjYEQ9IJq1So/S8MHP+j3veVm3xvYvYuy
	 +eiy8ndafX+0RBQCojaBDlkLCS/0gLKjGDy2xX2UOL2w3eGG+t7AsusiwFoTgQdbQy+j+
	 QKpXQirT7ap5O+yS0ggnFIev+CCqWM7/opzBgow91wASmVNp/IG6yit00r5diZl8m8RqQ
	 szJFR806SZWNl+G4+5JrQ4m1udpIHlXz4xWPfiZIqTViFFdM/HHNLL0pGVAN4gU9d2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/Z3XcP+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+SNqlXU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BFB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BFB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/Z3XcP+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+SNqlXU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2BYprn3763007
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=; b=X/Z3XcP+FasA2u62
	hBvPEOch8XR0fLIRDTeJplMth0A1Vs9d2y6vGzXiomLEN3RxdDoUPsIcdd15wBJE
	uiFJqYjqNMHkMdFCuarhLny9JH83i8LibaJDpKNNiLVuVUWlvcBGUC4NZGYGneZv
	DRfVyKUvFgTHcmGz/f6bgFyhW2QtmnYLEwPC25uFpEOk0dVV/MPL4OUjHRUzZMwp
	6W+ry/n7rXYwTZRLKj2eYEygt/14aI0B5BfPoIT7yW7WBysaBxaOVFKNjWbvIesP
	B/IS2ZmmQYcUe44EM/n3yWKDyhpL5kyCnVOMx6W89WqWBCkbCAlSp0W1AL3kYPPq
	Caq/Eg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5g260-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:57:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so174011585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793620622; cv=none;
        d=google.com; s=arc-20260327;
        b=XvVdv7TGGpBQjKKvf65bALd7hIl0a2PllerulUFyuaxYPFqUMMcsFY3tPL01+Q6yRc
         ZBVq/yhgBDIMjdzHV3Uyr4tG7VrTNbKCLG0fvtScg5DpsboPvxxY2N2nBEcRTNDAX1cE
         ovdfBMT/Iu+72f2270EFJvVjzmqy0/vU7Ae4AuwGfUciWoulFnPNpS7y6hAyySjbYo1p
         LPAssYag8xsRFdG2vsBozbxd/zLjgq64h75YfZ1iScOj/bewGkxEpQD26EN/EaQSST27
         So5Mn/DyfkAZJtHB9vQyvybr9BoBn5M5V30Hjdzd8NpFN+UTZoWxo1EyxAIkqwT2B3av
         wSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=;
        fh=Id8Aqbr6bxAgUuBppmGMZt1UAIBdVwibX8K37ow51kA=;
        b=bL+3wtwGO24jGzS/j0llfKiiITusoExikTO1sGPlkXSzH/TEDtJ1zhR5cIefqb+z9F
         qa+FW8AEI+MTJl/gDA6WkqzFITIfGxXJbibUxUOZ1S//jyF35AVgGtLjAVZZr0iPHzBL
         HnnLqxdC8ukRnl7p+zgpPn6BszqIIzSSWhqQpi3iOQjyuWaZPscVOLlLu9Z1UC+NUL4A
         9o6iSjGEtEEj6UAKYP5pbt3ItpI8JRXMOeeV1sPJ3YBlqrNtx3fbBNNl5gB+2Co/XsSX
         qcYa2Vd+aMKRAKg/FW+KapPxauA0Vg13rl4w38JxHhAFRVambZ14I786odykGGJneHhu
         jcFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620622; x=1794225422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=;
        b=T+SNqlXU/r9+mWB7wSrRK6iFvwrLbiwbyaESIy7SEADBQchc5Ikh9LYVIQiQ4n1vX9
         y6esBzHoFVLy6Te9rWnKIm76KNdN4RbsxPOGCivZn2Fn5fQybklk1p6IBIYfo/C/BH6z
         zpXGIenbor5Wrg8kEhRawrDTzQFTcySEcdKfYC0cCuKrKg+idhIooHH3Bg/vquRIfVQZ
         ui7i6iKr6+XBiTm/BiskJw7j2AeFHmewca7DXCZpsI/QqieIu/33720/w+urK1deffZ3
         PuuTpUb74JidCvWs2C7NOxuzI/o+h2IOb/OWFuaQaN84pjBGesFPkGROBkzKTpsKqjf8
         YZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620622; x=1794225422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmnkq7r8AkdD6QmqN02tP8SKsnUa5f5femOn5SNpdc0=;
        b=XTiNBOeyPSPCMLXittWqVTRKp5Eu4X4mfxuLEHdza11uWENQ46ueYkoJ/TPyvM3Uqa
         pjgxrT9qyZFbyGHH1aJd51coCo5IiWqZf/7V1WYZQtnIbk8Yhi0TAz7yvqR7IWqfOLww
         x/1QO3A7hJFYim3vgciH1OrY4cAqG4QMVICCNVgrZ/0K3ZGjlN6QGMAzYuugZts8Zezb
         yjbZoNp2Y6Wc1t/2QxJ/dM2ebYHIj17GVYcOoGGNPDqPM76WOwv0uxA4jMkoOY3onpiD
         ZKu1JyrnrRUc5uA4xRWmCRkXxEEmLu2DwwqQjV7nqw+W2DgaSe1zSh02uqbR4n8ZocHg
         Obpg==
X-Forwarded-Encrypted: i=1; AKwUvBzA60FwRuxtawaWLSAIIdTy32tBzr9hAgb8Ukg5QQVsn6Ou1DE3Dipt3rR4q8q+ncw4ECdcGAV4VGH9WE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSiFG+UDOGjwsBsjUull0YsPUD4aRnUa4WI7MdpCCMvqJ9NdHz
	cMDa94pHFLIsPQIit62K+FVjsKendqqAEGHcxUuQrgEDSGz1BV/zwdXNn9u/F7ztnCsLq3dKs8y
	KSKgDx7C9EunXLRXYYzSerbfcqCGlkbF0D6XbcgC1nWOvmlJ8JNZeMZQxnD271D+BzUs3/25UgG
	lK0DVBERwcXAv1MCci1V3kSwk+bmApownvNBg1GEaCVSMciSYD96fDd8c=
X-Gm-Gg: AYBFou1aZpEajwmHKpilewHQ7mxj5XArU5WPYBfbKpME8dDPVsdD6e9s9N8aRDFLI0W
	rekz88JxMdj7JqsSEG/GcxSFx7tgzvaz8/RQtIXYkG27+1R1omle1h0byLrNFo3HTVz7FuVdrr9
	HPpZaLbutQMrD1TY20ZT9wzE/K8+9cyKfn1rEfxhUqc9uhVfGvnfEyOCHjQqe4XKkZZINdQe+ic
	w7L3RxTZ0hfcV5xAz24HXH/v4m9HgMFSt6YPRoZzAJkcjBut1c8jjtLZUf+9GMx9LhiN2bj4+Q=
X-Received: by 2002:a05:620a:46a3:b0:93e:5ef8:c794 with SMTP id af79cd13be357-94421696949mr1686126085a.38.1793620621512;
        Mon, 02 Nov 2026 03:57:01 -0800 (PST)
X-Received: by 2002:a05:620a:46a3:b0:93e:5ef8:c794 with SMTP id
 af79cd13be357-94421696949mr1686123685a.38.1793620621019; Mon, 02 Nov 2026
 03:57:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma> <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
In-Reply-To: <20261016-ath10k-series-v1-send-v1-1-c847697b3558@nagashi.ma>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:56:49 +0100
X-Gm-Features: AclHuK_UmYFEmXEjOcETGfLtpQP7k9aqsLUiYBNqC4WONvGRfPM1oQtAQ5xC4XU
Message-ID: <CAFEp6-2xY_gM=FRUp3R30TZ-NgT=-eYnyz_BPE0vxEenv+202w@mail.gmail.com>
Subject: Re: [PATCH ath-next 1/3] wifi: ath10k: set the PMF peer flag on WCN3990
To: shunsuke@nagashi.ma
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>,
        Fabricio Akio <fabricioakio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae87a8e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=nt0wqAW9UeTKEtDnEAwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2MohGW8Gxp-eWvKHRKD0TrBhoIn21fR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXy6/DwMNBzi3+
 QRG8h32CetEMBJKyUNpBb22oUol59kth2Tp3aL7hW23u/z1wQu3d73E9fHa/IvgdUfV9Uh35o2w
 ihmjUJx9jL/8gGdO00Fm1x3NyyfVAAtQcWQ+OhmI3lgSzSjwAPcT/m2Mtf8Wbf9Q395gLkh241+
 YZKPwyQ/AjVxDU2/dCQpQvQBWyWpzkL6eJndOKyr8/1+Wq5Ai5Nmb9CTelx2rcSPgNT1u4sQZF5
 7z5TNl/P7D156xMI4DO0q12W2tYwdgRaYavydRPGOckLwap/Z0uM+Advc83avCgvkveLiUkIOwu
 GZxjtxRovnKP8LdLzrxFmkMRlQU6DRIwHDssK622gjx81aMveetMyT+cTghD/TY3p4VjoiKQOPw
 p8yi+gsHO3hV5cULno7QQz+IQcpMK7MrorfkyKoh0xzyafYPB0/QTXosNG+E9nOQPLGQz1jMN/k
 DpXK5z6SvSKorAXiXcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX1iTGHWA7i7pV
 UhEEf8l56EN/bUpJxOcLNyEjspZ6kuAmUEp6qOD/cK1tJpckhYAWrCsP3ardytwds3fn/vCBj7c
 tuBBujsG+Q/C27Zw4HtSpp1zfz7jFq8=
X-Proofpoint-GUID: 2MohGW8Gxp-eWvKHRKD0TrBhoIn21fR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

Hi folks,

On Fri, Oct 16, 2026 at 2:18=E2=80=AFAM Shunsuke Nagashima via B4 Relay
<devnull+shunsuke.nagashi.ma@kernel.org> wrote:
>
> From: Shunsuke Nagashima <shunsuke@nagashi.ma>
>
> ath10k sets the PMF flag in the peer assoc command only when the
> firmware file advertises ATH10K_FW_FEATURE_MFP_SUPPORT. That check came
> with commit 90eceb3b5fb0 ("ath10k: set peer MFP flag in peer assoc
> command"), because at that time "only firmwares 10.1.561 and above have
> support for MFP". The WCN3990 firmware-5.bin files in linux-firmware do
> not set that feature bit, so the flag is never sent on WCN3990, although
> mac80211 negotiates PMF with the AP. ath11k and ath12k set the flag for
> every MFP station.

So why not updating firmware-5.bin file instead?

There is a tool available here:
https://github.com/qca/qca-swiss-army-knife.git

And you can retrieve info with:
./ath10k-fwencoder --info firmware-5.bin

And add the missing mfp-support flag:
./ath10k-fwencoder --modify --features=3D[BASE_FLAGS],mfp-support
~/Workspace/linux-firmware/ath10k/WCN3990/hw1.0/firmware-5.bin

Then you can submit a firmware update.

Regards,
Loic

>
> On WCN3990 (firmware WLAN.HL.2.0.c10-00459) in station mode with PMF,
> without the flag:
>
>  - The firmware sends its ADDBA Request frames unprotected. The AP does
>    not answer them, and no Block Ack agreement is set up, in both the
>    2.4 GHz and the 5 GHz band. On a 5 GHz WPA3 AP, iperf3 to a wired
>    host gave 22.6-31.6 Mbit/s up and 21.6-21.7 Mbit/s down, against
>    280.2-283.0 / 264.5-272.3 Mbit/s with WPA2 on the same AP. A
>    WPA2/WPA3 transition network gave the same low rate (23.4/22.7
>    Mbit/s), because wpa_supplicant chose SAE with PMF there.
>
>  - On 5 GHz, the protected Deauth sent at disconnect carried CCMP PN 0
>    (56 of 56 in one capture). One AP dropped it, kept the old
>    association and answered the next association with status 30, so a
>    reconnect took 24.3-24.4 s instead of about 5 s. Another AP accepted
>    the PN 0 Deauth. On 2.4 GHz the Deauth carried a live PN even
>    without the flag. I could not tell whether the band or the AP's
>    HT/VHT capability makes the difference.
>
> With the flag set (this series, in a build without ath10k debug):
>
>  - ADDBA Request frames were protected and Block Ack was used: on
>    5 GHz with this series, and on 2.4 GHz with an earlier revision of
>    it.
>  - WPA3 on the same 5 GHz AP gave 264.2-279.0 Mbit/s up and
>    236.8-246.2 Mbit/s down, and WPA2 283.4/261.7 Mbit/s. A 60-minute
>    upload with 4 TCP streams averaged 277 Mbit/s, and a 30-minute
>    download with 4 streams 230 Mbit/s.
>  - Deauth frames carried a live PN, except when the Deauth was the first
>    protected frame of the connection. With one MAC address, 100 of 100
>    connect/disconnect cycles to the same AP connected, with no
>    association rejection.
>  - With an earlier revision of this series (the same code at run
>    time): the transition network gave 276.9/249.6 Mbit/s, and in about
>    8 hours of cycles, every association that followed an acknowledged
>    Deauth with a current PN (not 0, and not older than a PN already
>    used; about 1,300) got status 0.
>
> The vendor driver for this firmware also sets the PMF peer flag for
> every PMF connection. On the same device and firmware it reached
> 259.0-269.7 Mbit/s up with WPA3.
>
> Add a hw_params flag and set it for WCN3990, so that the PMF peer flag
> is set for MFP stations there as well. This also applies to MFP clients
> when WCN3990 runs as an AP.
>
> Tested-on: WCN3
