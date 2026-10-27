Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793127258;
	b=rpdT3CF5Ce1eYaQu2gVuMtG8LmiiOyhQjzBuytpDi0mpLQiong36tsR+X87fnueLHi0M
	 w8oUMoYi2UJhBO95eyHo0y1rSdokODuuYrhXMz8lA7ryhgRrwEX0lvIyCHaE/350VZUv/
	 0jCMexCRV6HhJwXpM8lX0xKKgPDSDaEGrx3IG1ONkZvfpTMsoHILO4dSBqVeqU34ejQfi
	 GD8SXVNp7df/ysq4BmOCfu38DjbGyGpcCkl2NqA91igwuyPF2uUeMmofJ7jkcXOvWTeBa
	 WsZ55Mg7dZ6FBuhb+MmyweAK8l5cHEjDQ2v3lHICGFNECckts7hCmOzT7eWgOBql8Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793127258;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Evx6U0q+4cfv5pYUIY1J7ygr/HNwHNAc0aXiO1GKu8c=;
	b=E+RFG3rSiZe9oO5Y2z36aYM8dZBYW4Sv3CawrPyePCQkeNiuOZht7mdmDkEOUo1WWNxv
	 X0GsptKFotI13vyXcWmNdXjz4ooHJ+cDXcE0gjJyN4G4kIklaW5h4RAvmKBlxkhBqXjZl
	 L8DTcgZxJJhtzGzFiCXLho+EXokKUFALhSwr0lTcS4huMwCm3N/Bo8L/CrqE7Ll0nEoJt
	 J+gp/cDEJZYa85emMHcvP5XxDdhssT6l0I9qe51phVgRnavikNSI7FzHyzNIg3Ife9Uj4
	 aW2FPW2bAjt8GwNvt8nPozMZDtk4ngJCQv6JoVor++Z/NxtO1RfoKZsIXpkoo0jQo3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwU6p+pI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTz8KgIF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3C606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E3C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bwU6p+pI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jTz8KgIF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHRgg2639301
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evx6U0q+4cfv5pYUIY1J7ygr/HNwHNAc0aXiO1GKu8c=; b=bwU6p+pI+6tlBDo3
	b+2/e7OFO7kzx1qv/M/Wo4d0P8E8FLvkSz4KDvocTCgovAPyxk9/n4Tl4xg4t4/d
	tzM7suQiikgQQ6q7JU9R+zhqe695taqTLfrpEkIYKkkfRAK844pyOAdydaYejxul
	hGjzwnVOARNaNlUcKs8p7GeJl6wldthdaFTJDWqFHnzof88WqfwNLVMgz3EWfuZH
	6EKVVV2Q9AVRxoHxdo+bfmBG16Xw3yJ6clXG8NOBDRWASQSEkCCJHeA0tIArg/ZV
	8ohWHEK3a564/RJl7fPWjbx5UmZzB223zdrcAsl5HWbddXsoUr3POTyBJmqPtAFw
	uTsFsQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5twp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:54:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so522827eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793127255; x=1793732055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Evx6U0q+4cfv5pYUIY1J7ygr/HNwHNAc0aXiO1GKu8c=;
        b=jTz8KgIFr1JymcH0AaJ1y14LB1m8UyhTa2QgrtnPQzn/kEJlJl4E1qGv1hUyIb9oF+
         uuwQWMauzNwhHrIKEXFa165PXbBwQugaszOXsNOnnBtffna95VagAHtIkS+8dZccAwTR
         CqKNXp6LMVOQpKBj1X3Bw6KmTPi182HOxu3V4msQTxIiuOc4HIwPXIWbnh6jZMNrgMTG
         EcTmMrE1rdy9Ybngfoykk66JNkxMqqKgyK5brBODMBq7rt4wTnDduWb2HS+21GucgvVC
         kL+Gr5+rYTOyvlABopZjsfgu1ELqtdjSXKyqfxQ1BE2pG7nJnpk9sNMYlBIhww3e0e9L
         7gSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793127255; x=1793732055;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Evx6U0q+4cfv5pYUIY1J7ygr/HNwHNAc0aXiO1GKu8c=;
        b=ipNCfX0kpYBdNOZadU+ASqI9QzBpGiMeuoNW3q1Zja8hmJk4zF72hUtU2uZpPbEXRY
         BmG5rYbwQdM1yrNtb+li/1o/xKhwVjpcMewlAg2BcI9L88igS8sBZoggsrZq3vjnRlcD
         rdu8Bi5oUQYpdkuo+oef1hfBFvTkjcurZRoaHm4xsFGsaIyg8BpG8z0DuhhxQ9VSkRxk
         +huCDVVr9mREHD95xIWhRtFQ2nLc0MG6eixCksP2oLHz8gRnaXhTbD07qFz6d1QE0fxS
         rI8P0wTCDZeyqkRNFhoVnDvVbKV78I+N8Tdh4V0AQkRNAEEEjLvj3Q9u6i+uXyMcVgXi
         DZAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY7b9E75BZt6F1KByc1i0gvd1y6afaTKLf703d3IA0E/rPlxFyp2FyEODP/dZu5VivJO1RSL5UIqMEbE4=@vger.kernel.org
X-Gm-Message-State: AFq9FYILlh125uyTG5dEEXBWNixaEtqarV4Jfdv8+bUJRSi1qFFXg174
	FrhrudRrBD0GQIZ5Aj3+7nhL8ccWdTSW+tmu2JSgk5Swld3v+SK/VRmLiv+Rwj+93klR1MtKqRX
	DvSxzZfVHKwh8w67noVLhroX2LlDl/PHUDQCgitdVUpx0AWyvSU0mgaVTqPFGU6Rl2hQ=
X-Gm-Gg: AYBFou3IBBkXjqMvNvckc2+j5U1P47WuiFLKQ0wUjlJQeafqNDhr5zv25rMCmHUfe2T
	QA3rN2RESJWEj4V+1CIseOcArVo9EeDjwM+Y8+P+IXf2NBh7RpTEFYYnFkwIiqX+irfvQ0Y+2n2
	GeLDuw1UGA/ixn1qtMubUnDen7Q/vrxMJjddbCoDyhpdZyPpf7c4GnHgKoLtY7iSd7ejIjHzaKD
	cduW3L3fKvhEihYs+QE4dpEsPG5/t+jc6Wrcxxb4d3e/QXDZcextrtOToClQSkFKmBjQebn1Mct
	rmjhMqGJDzs4QWQqyklDaaIGLRo8E4FoE3ZIBEAas4rZp/ImBNxTCf1AUZx1V0nGY0gFieTB8BU
	53hM9jwYA0Ugo+33JUZoUcdKI05U0KgoHy3BqwDyMTduNy6tHEBWUFQ==
X-Received: by 2002:a05:7301:6192:10b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-36a203ac533mr382028eec.11.1793127255080;
        Tue, 27 Oct 2026 11:54:15 -0700 (PDT)
X-Received: by 2002:a05:7301:6192:10b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-36a203ac533mr381980eec.11.1793127254190;
        Tue, 27 Oct 2026 11:54:14 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm8989983eec.14.2026.10.27.11.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:54:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        =?utf-8?q?Nerijus_Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        "John W . Linville" <linville@tuxdriver.com>,
        Simon Wunderlich <sw@simonwunderlich.de>,
        Oleksij Rempel <linux@rempel-privat.de>, Kalle Valo <kvalo@kernel.org>,
        stable@vger.kernel.org
In-Reply-To: <20260916173429.403889-1-nerijus.bendziunas@gmail.com>
References: <20260916173429.403889-1-nerijus.bendziunas@gmail.com>
Subject: Re: [PATCH ath-next v4 0/8] wifi: ath9k: fix register access and
 spectral scan filter handling on ath9k_htc
Message-Id: <179312725315.435197.11317113706917612681.b4-ty@b4>
Date: Tue, 27 Oct 2026 11:54:13 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX8Ybrl/gc6/Di
 KEFNiN4ccjkrwbZGJd8TUnvOMifJmkauqiHbXbzVGNCD3Z6LLWyKLWx3ZUK3kxoIviobphzva3A
 bRdrwO9Grm9ER3P6Ydg9lOObv8NF/lk=
X-Proofpoint-ORIG-GUID: Kq8SrJO0M87XFXJ0XM8Wlr5ehN1Si7PZ
X-Proofpoint-GUID: Kq8SrJO0M87XFXJ0XM8Wlr5ehN1Si7PZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX5C22Tj0Ojg+H
 9X0CMZydxavs9fUbKx0o5ekblgFK8NTGGwhCarLOEYr8VnYj66WigLYZ+D7shfhxc/Af96p5adh
 BZJthrZA7BvLPmoSr26iE9fSgxMJHa0qrbsBAwkvP2r6Z0noOBHlzNzLUSoIB+9PMFZhQ/MIOXU
 /+U1MjLGSVf290kOnlmWYzi7nNxZApu51oDvxqjzy6YMkHzMTPKRLWwgTjoP+Ci49xpDhBahKSG
 xOcLxtTBqeavvXePyRWIZnnk3qMZU+XU3GUi/QswpjPP8VgKkRHaaC+ZKvrjhJ4t8UxLkAe0Qnr
 SRCoFMb+4yCEk/8mLNSJaFYDp13zfIKM/Cht95Pk5T7SCTQl02vbzXcJSEhrX2MW48SOeJ9SyIG
 lBPRGywFoLphLIKQkkzWf18lhWt5l566mbzJu5I3eWgvlJQjDmocOGyGDeE+vFHWDIO1vSo0VlV
 zknuoFIVA7sXWwVgEVg==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae0f358 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zW7M3SbB6j3E8vA8Zf4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270075


On Wed, 16 Sep 2026 20:34:21 +0300, Nerijus Bendžiūnas wrote:
> Eight fixes for the AR9271 USB driver, resent as one series in
> dependency order as requested.
> 
> Patch 1 gives the multi-register read a return value and checks it.
> 
> Patches 2 and 3 belong together: 2 fixes the byte count of a full
> read-modify-write flush, which has truncated the AR9271 PA calibration
> since the buffer was added, and caps the buffer at 14 entries because
> the corrected 15-entry command fills whole USB packets and is never
> delivered; 3 refuses any such command.
> 
> [...]

Applied, thanks!

[1/8] wifi: ath9k: return an error from a failed multi-register read
      commit: b93cf212206154dc4ef73ef2ec2da7cf9c40cb50
[2/8] wifi: ath9k_htc: fix the byte count of a full RMW buffer flush
      commit: 498e911ada9c9cf47a3a955fc1b346209b25e028
[3/8] wifi: ath9k_htc: refuse a command that fills whole USB packets
      commit: 5ee78539988f3f3910558640cad6f0e049cfe24a
[4/8] wifi: ath9k: stop a failed register read from opening the RX filter
      commit: 9477a8b3e552648ffb1b5716697dc5852548f081
[5/8] wifi: ath9k: clear the PHY error filter when a spectral scan is disabled
      commit: 4c4a19d3a181bb25e21cc4bd1b6c707aa5aeba86
[6/8] wifi: ath9k: count spectral samples in the driver's own RX stats
      commit: 107b9b50077cab2ce3070914ff34abf68d2d7564
[7/8] wifi: ath9k_htc: pass CRC-tagged spectral samples to the FFT parser
      commit: 519850bff38c9dd41be0d42afc03c24228d111ba
[8/8] wifi: ath9k_htc: derive the PHY error filter bits from software state
      commit: 7b14c8f4a9615579b09cbcdc4515b65ae6124753

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

