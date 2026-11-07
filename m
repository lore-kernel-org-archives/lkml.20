Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013694;
	b=mg2ckB6KZCN6buDeh73KzhfNEq3zBi3FqpfcwNeHsxz4afbq97bGT5nmBrfKNIC1hvGa
	 tpgT0mZk9g3GPloA+O4PlNV3w/d1tqG3HNV+SKA4uSikXxjAqAEA9gS/luslh7PMRa0Nr
	 zjNsfNOxfq6/6vdNGWlbQjJcAa9WGPtd2Jm65JxqNHg2oZqmHHt3s5yYNkOclZW1bPDhs
	 5wMtEyaue6r2p0zn6Epzs6KDaceD2oV0W9XlmHjKpIyPPzJzlnr8lYbmfueaYJRHAtOhX
	 U+sq9d5IkP/4d/YIOGNp9vb/vOY8boZUdVophSj9xmhffsF0XW+JxYGWSDlEUDeBmww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
	b=ypPI11oqL0TjhPQUwAjHcHz5fyXkH6ToQKdfx9hBe8e/bgGMmAz6UaazKGZBIjxM6wCH
	 JreTV95/BMV/OGecvy2iXlpuQByvvnuxPsoh7R/VSB9nYqoeJJkTBp8nmmZ2K6ZLydlOr
	 qCI2WAbq6skXbPVzJBETrssyk8SsV6QZ0YQ9T2P1fibQAUw7srK9ZWHxWZd5BQt9x/Dvw
	 r4o7PxXVg4jQpktn+VFUyKQkEU3Nmfb6NI1exicUj/NmxFVjhljAvDv5ziYMS/Oq52AcN
	 CrAhDTnkPZGM3XTZi5vKrZe/J36DV38ym+gb6CIp5P0zNRcB6RMrG86x7lYzLrXUSfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jbim5pNr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IO4KcZ2k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482C606D821
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8482C606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jbim5pNr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IO4KcZ2k
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo0nc567215
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 01:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XqszqiOkBMd
	k1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=; b=Jbim5pNrPgMo+g46DRYZjAFuvhE
	Vr6G6u9Xl5bnz6g9WcIHzXufPefgfrpxGPN6+vQM5xK68i+VNDmTKdw9HS/3HT7E
	sLN064N8UnOJczaLEC9w8LKnUZH7XnNcPLBssD6EHqSoMAdVsR2TxiI4MSg+JkjY
	mE1v9RWM3WcNptQ7Uy7bBp7qLwVyekdd4qyZABfxq0rLy/iUKhM5MmsPVUGYg0um
	WTs1NCVnhnZX5QmM8/Mlq/Asxv7XhAr1SRQXkGoIvsvFcm7B5KNBOSVViIWaGRiV
	hyYdf57huav//qkoyn6x0MitT+TbwufIsIdrYAHV0GNppL8ldGIUf3SQ94g==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyrh046-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:08:13 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0e878f574so3763027b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794013693; x=1794618493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=IO4KcZ2kcUkQLr+wGtUcH7RcYMVk7RcG5c4JBi98/ZUS1w1aGT0uM1CtiE3kqht4uL
         QsOEccoSC8Xk1zR1bw7ZidpTUufOAWaiQW0YKS2d10VMbzGXwtxVhbzPHGxI20p2STZB
         TbAffWYgWNntwfzvI4inq8P8hhT/R1UcBYF8IqNA7vq31PuAar/rLxI5MMZV9+ThLAcT
         HDFzduuqPQjAmzRVrV52JPsnY/PhE9bEu5ci3ikn71b1YbWT4/dusTPyDkYgvF+S4DU6
         rfEmxwcpCoOF+AdmWHnFLzP+akAd10zs1QQnQ6wGumbYnqqB7VLsm6khbBJyF9XJxT9y
         jAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013693; x=1794618493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqszqiOkBMdk1vvS7oxfstl8dAzvdx7vbMieJ9TUstw=;
        b=YXOP8TYvaCyN9txsCtPYkvRdVvp2bneUw3aHHKq0I9QwYNgyjxpOiwwlIYG05n2orn
         EnrjZZenwNG0HAMrpgv/giv8uGzNxpdePfKF7HDznxXbXHm8rAW2jw3KUtru6MT6WfSz
         J4qFhgBOyE22w5Gp3f9dpw/2WUu5EenpnVxLyTaatJ0PmyuZfYM07CSQjmKiOYO77AnK
         wetwS25e7qplsY9q/BDORbKIoqWLV+IyNxopmige2g3XQvbz+NE6Ter/b+Gh3kppgtYl
         5kM0iURLi8+gTF58WzweUEGn9PHnv/s+C4/kfwu54+PwzXN1mvzH9CmfVzUKm3PjV117
         F9qg==
X-Forwarded-Encrypted: i=1; AL+hErHsXW/kxY3Cu6lu3n8yvBCQNMq8hzJGt1lX0etcm9OlG7vhp5y6Zxqi5mj60JyUh7hH9kLJIMJ1oZmqh8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eZMRFcX1AWcm7FQW54ES/+lgzvyCHDPBDjonHw3O5llaLP/tQ
	FRzV7pPNFlRWCMDh5Zgftg1mwD7xRwevZMi7buJ6D4Io3uiYgIWHLtA6C3f7sEGv8pbEKrWc/kp
	nRKDv7gzuS9LhypkWETmIS1Nw8Av1grL0zhABfgg8jdnqietH6yDl9XpqyTmXFvSNn/s=
X-Gm-Gg: AYBFou1jyf7X9FEqbEMX1uozPAHNG2QmzaileVqXvD3J1iEqodeJjB+KHukVH+/GQ2v
	MnuDZUlUquA96VRKUqOhW5KvRIfb79XI7DfXyybH6AC5pk33z/jQBK+qkuAwreVakH97mk9dpEa
	7ROEUkdN9MjBjuOPN+KBOMKlL7mg157X+fLrxH0YPKiU9Elgb3Xj8xl9wMEuHkL6t88NR7iLVoj
	O3+tSl5hHWlRkI6YzNbYB40qhxthg5susCu8jIS6qDNmFqi35vazv47gXYngk1tLfEGU1LnzfK5
	H3kM4+kWakreOUp9XObBDcGbE/x0BvwfiG7xq8aJTje8MfKXdeqFMcB4MxU+dd8HT1Exv2QUIPZ
	lPGVBXITodyKwnhnRawO7K8sGSc5vJoj3TGhHZ9NNZEARFWz/8spkkP1ZelCgNkBtWT239IWUOj
	1aznLjEsN4tmbTmt83ESehdwftmT0Tc0w/KQ==
X-Received: by 2002:a05:690e:438c:b0:67c:f8c:22ff with SMTP id 956f58d0204a3-67c29d038a2mr256567d50.29.1794013692571;
        Fri, 06 Nov 2026 17:08:12 -0800 (PST)
X-Received: by 2002:a05:690e:438c:b0:67c:f8c:22ff with SMTP id 956f58d0204a3-67c29d038a2mr256547d50.29.1794013691939;
        Fri, 06 Nov 2026 17:08:11 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0b5csm3091934d50.7.2026.11.06.17.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:08:11 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/3] misc: fastrpc: fix ADSP duplicate session creation
Date: Fri,  6 Nov 2026 20:08:01 -0500
Message-ID: <20261107010801.3451213-3-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Sqt0AIKOM_W0D4uMy6lXPc6QKLw2AzS2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfX2pkTcceezFwS
 cY8kJUhsa7Buk0v8SmlAS0+T/RGFPipDAEgWFK1lfRtcrWzaiJnGlcLviuovvFc9nkEKsopeFuu
 Jyv11VTfhZBEHiZYVYb0e5S2TwL+TqI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfX8SZ0XhY3VBVS
 w9JjUVGnSVZqYMHF4PWkVakyq9klfIKUONKvT1tuR2NngzZUwC7Yu8cdd0VOMt+lHBWRlEv1LZx
 W356MXMzc+EzOdZrnJACdq2t9+hlVf9b3mJmD9PFOqtAOsK/b8t0ATen4Z+IAxk2wh4NEUTSq88
 aGN4KESgzQc+YHy2tqD5kQ3DeG2rImvps3E0XLPTqlfzS1w2MKViTdFYOS9/gUEXQRar9fIcnzh
 YaMHCzytjPK1/r0z75PuyVZnzdTv+iORoaEzII9/z/TkPsvZZ2rDupq7/FbnB2LRXBpVdhBAEiA
 PBRAwy5j0XB0gR4sA2NAPSYAiwWd0qo10rsQEGbLjXrcg9d4PIcqUuu23EXYjFqftx5v4hWXcoC
 E6cfrdbPC0wa/lOd6c8jWedXRZdZVP31pw97VHEji3o0ACOwXc9QJFHK+Rl3+yguHLUT1vFBF6P
 Z7yJ7boP5pt7SCXhk1Q==
X-Authority-Analysis: v=2.4 cv=V+XoQuni c=1 sm=1 tr=0 ts=6aee79fd cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=fP8dIGKjERIvVM-sKqAA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: Sqt0AIKOM_W0D4uMy6lXPc6QKLw2AzS2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070004

Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Eliza EVK, EL2
