Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501378;
	b=JsfU0I9rLVvkbfa5Os37z0rBhjZr9Oe0LRTOKC16aydYWIcDVObLY9eooFF9XqRW8iL1
	 eZ0eKmwI5z1Dgb2HdL8l3ItPrgLSpGzGuaJYC/k5rQGp9fPtGTWEzMh6DeRMPgx4p45iM
	 u5/SpXdamyl+Yv1Fugr5xMEPZ5kLr8mLCrnV8ysQy+UOA3TAljm7QZbAvKiJa8jcctIWD
	 P8gNyp/VVlr6z/qEw4aL3Egp2KPKndRbhdePbicUyCR9dRfTAydQj1KN/6WAGlwVCikco
	 kNavBbBCapG3APzH1vc+6vOe1PwC+/TZtjFeUTVusRYX6pHur4xlIxAQNX8bgu4HO/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=px4pRxwPG0kCk7ZExiNp1R8AgRsYjY9bdnbQlLC4dRw=;
	b=YMvODNuzVJ8zqg/oqRlKzuA3SORPGf4mIfWwtM4a3mpSvPv5alcSj+re0z9yFesGaBRs
	 x90NOkgnQj1m0LOpLw045/+KbH7gDWXBrc+ssVc4DzXyHtRkQnhpL4VfsW4Vyc9oaF/ck
	 uUeDbcPnaW+rdPiWBugzrtyEX6f2yojY3pC1bN+krNVvyg3vnQeqQbYxdDd+yN06OvVYp
	 02pZbt7vtQRrmEE8dvTYPRCwMNthcTxLKpt0NrmBX3oGLKlUZmBGyu5Ik336b325yvCP0
	 2PB/dL+60h4w/DvS49YURINn3+DVPCCvoBZvzdjoQXDz+NQ5jY8UHLqZKme5BjOaaMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XrtP91GN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfL7W+H6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2B60A380F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E2B60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XrtP91GN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VfL7W+H6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBG6NR1486399
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=px4pRxwPG0kCk7ZExiNp1R8A
	gRsYjY9bdnbQlLC4dRw=; b=XrtP91GN1YmA1JntTWsZNBgEH9FPP6raZCo7X4DF
	qiN25o8diN9ekcIMUCjA7esWlm1+AA/vVP1KSguAz4uyeWfIJQEVAL9fyxp9VUZg
	wfehte0qA+RYS0wzkSDWLuylZWsG8AmMK+SD4IfL9UPZeJBQwckWSlHaqEeTTFzS
	mZjzRUGJcXC12mq1ueTpuwdvmQUeo+t2fkfNP0eMUfQYoXZPcmH6FBJyc5MiknzW
	CA0sQPsaLAuuiBSMvEoXmM3CXxSKukDeAtaFfD62LVug/W+tUASeZHd0nyJNc+Wb
	ajDJXojgAFcTTSMxCaPqWe9hdpsV57xk/2fIi323lyB3vg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2j9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:02:57 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac1e41c2aso437056e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501377; x=1793106177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=px4pRxwPG0kCk7ZExiNp1R8AgRsYjY9bdnbQlLC4dRw=;
        b=VfL7W+H6/39ZjUqtvmvLnG4f3PYJNs3YHcHJQ8CrcgpmCbadEKosqtB6QEKN3N1GSA
         IF8wheBOE5MmQGQDuHW8xzdF/MF0UTBLWchkmj9NvY+dGRBdKZGSeNzCdbdXvHnOleTk
         zZYhnkXzRtsv1RVmgWOXqRapg7Ri3nzdQGZLkQzyuaJamQoylOSdVsCoIyKqlNkssYbd
         Lu6skJQJNjMYc0vHWbXmEg6J9OocUmG11QmzR0wBsZwdCs1/qTqYX1uHZ+mHDmS6JO4B
         7jaVuxltNuOfNzO5qlN7LHHI62USx9Yg6kKzXX+hymsqP6PhMvkVD3oLSWlvvx9pZHdz
         yjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501377; x=1793106177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=px4pRxwPG0kCk7ZExiNp1R8AgRsYjY9bdnbQlLC4dRw=;
        b=obSDtmQ8+D3Nutu+dST1/ujA4QpKtHMNXvezTyzi19cbr3JYUFnracYculUiM3kDP6
         HVhNNBM0alixBD6BeEKPc7l1Mabvebad22ehAuft/dk4iic6Xv0M2xTKspLJYDbgHu3/
         7STL1q3K1d80q3u8J3dOfHpEeHFwjg6vGsVjfah3iwSQIHOO/3t1BqrIsO19UWroxiLn
         Cp+fb6BKUeDqMFuRkZXWZ/RGyytSJbd0keRTNq74ZT2kYIAq9fAbyRIc+P7qegrhif+d
         SJm6zUI+XXvBdN7/KmLEfdjMVOWz5fLWEyIAL9HZBr5ovvoIJYdkUT/bLuVXy/brlte6
         gP4g==
X-Forwarded-Encrypted: i=1; AKwUvByNB/dqBZOOrJU5QHbrNvOmeIjFuwwvQoLGKO1Rgf/uFn9PUpweCsOd8BF9SRq3UtqeK7cVBPch+cORzbs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq3PtGQFKjVBZQsTnuStJBr3+NWPygOFAC+gSNayNy/b4s3YcM
	BMtofMiruW5VYuLo/qkEOO8c0XVHJ2dKZQfRVpadrwDQ1jJw5JzPQ3f7/c3DnOhWjzOCJZE/ZZq
	kCBwwG2xYeHPW5Ca4jXQWoYuU5XVSs6uV4+94P2WTPE/OmNaAR6LXIH/wlmJaknelm/Q=
X-Gm-Gg: AYBFou3MUAF6gVWXA5GOak6ktzULGKzKLyCtJV+1efo99AYveG8TslbwRO1Eg+D2bPV
	6e4q1qtJyu43q6gYV0Sa4Jb96t9KFWBrHGLmKlgWJGOJVw7Zlj3jjjwyFgtOCCxA7758g6SOhqO
	PdUPV8yqe0hd/BkNOFNAAc5UkMJ2ZjD2GOjr9sJvVBCZ5HHW2i09lW22aIaku6QzoqfRUcfnr+D
	m4EXzVeoVCjXObGFtHhYZnOjrkG/QIXaObbhQ9jexUZAgpPc2PuwNrd8pGohyp7cv3pxtFrshtc
	6WNw74nBG5huLeQYfqPRRXYMxgVZDHz2XFcu+ipYvwmkxBiDzE9OjtvDrUbrN88uUTGUqvGKfZM
	Xa5hgSRiT7Uk4maAR
X-Received: by 2002:a05:6122:1b82:b0:5ea:dbae:3cbc with SMTP id 71dfb90a1353d-5eadbae3f05mr663483e0c.19.1792501376557;
        Tue, 20 Oct 2026 06:02:56 -0700 (PDT)
X-Received: by 2002:a05:6122:1b82:b0:5ea:dbae:3cbc with SMTP id 71dfb90a1353d-5eadbae3f05mr663468e0c.19.1792501375911;
        Tue, 20 Oct 2026 06:02:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm253748145e9.0.2026.10.20.06.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:02:54 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:02:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power
 domains
Message-ID: <c7kpksiq6y3riziq27gogegfcybzhaxa5v5d5z5ajc2m3o2dwf@eebruydbwutk>
References: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
X-Proofpoint-GUID: j5aPWMy-4Yz72YhjWBtmP2u6Wi3TslEh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX1Tx1lWIvHr3V
 izHFfK8bdJk820XNpwfiSiYinJF2ovdg+7Ip0DXC3gkjO1XV8CVuJlidgPo54hTC4xjaoM9gmiU
 X8NN1Dr+wHbGwePPE6vVKIlmUERc9rU=
X-Proofpoint-ORIG-GUID: j5aPWMy-4Yz72YhjWBtmP2u6Wi3TslEh
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad76681 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tEwKlQtQ9BOrozrowe8A:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX9XsRimHmvYiM
 PQ+2iacuD/r5c0qHYD7Fm91B8zOdsRAP7WfAEVqI2OeyA0V3ew7dKCIGkRgp4VMArarqe0HZdDF
 WRh3jifI6xIHPDBhjgJSgsXIswjMj2kgl/RBLsktUqzn9DLKk1QYR4ZquIDhXurM7WckxVIv7oW
 0jr96BugTJPtcZjcT1u6913/PK3GSZU4OOnAqUOaAAayzKVTMTxSzpT7AfFPIB+heZkA0DCbB0O
 3aofAoVEP5cPN4AKY50eQ1Q0qJRCzpMx7SJUJZxTz79ook9QYKkTE64XZelzG5VmX5sKVwt/oAV
 oNsgSZBioRuYrAchICyyPMMPdr8VeMm8HYH0ah+B6tQovIsWrWkA1l1dy0YTa0gT3e92m/6eBIj
 BNMF2so3VO5afotpY5I0VJuk6k87L1D+YjUWPYipbmJnbm9qVkebn0EiW/VqcWQgG7DBFGjpCiY
 BrEuUeah5UzgEhxZd5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-19 23:37:18, Xin Liu wrote:
> KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
> but both share a single cluster_pd. Even though their domain-idle-state
> configurations are identical, sharing one power-domain node means the
> kernel's PSCI domain idle refcounting merges both clusters together,
> preventing either cluster from entering idle independently.
> 
> Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
> tracked separately by the PSCI domain idle logic.
> 
> Link: https://lore.kernel.org/linux-arm-msm/1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com/
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
