Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746199;
	b=qXieZ84iQ4l+JHWXcP7LBmwP2vHRA9MhBIYgh1kaQaKerk4oHmbqX9RLeVRMAXEqDnI4
	 xtVX+eoOVVhjJ7XXlauB692xthPqbqDpbif+koPfsxAC6sNae3UVikj8wSd0uaH7qkZQ2
	 eidp3NaGvwqRtBfnKC2bUwS0YE9+2v+8PeWRJydY0FvsY02lZKY/lE21hyTk8ficgPqFf
	 jzvHv2OWmb7cpUtiZDsz/igcRnJA6Dr7i1HE7wWgop5mMmoXK0Db/MBpLrZ4f9kdeUvsF
	 kNqoss50wYOSEhXX5tgDte69gK3F98ZN7BhrKwMFFUdi2TvwBQpmhVARSGPq0xEr+PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=plJ8RgROZwLvnc/MhxP/A9BjyrRLx3YDXVeOTpt+v/Q=;
	b=NSeZH1NaFMuYkfR1PW4DShX6Y1+7zO0/V2kcBbVIirWsTme16eLeFn/JI7bfyqG7H0M6
	 qQzC7ABazJUmV7yKKo2ltALTttsbyBOTB/fzOmcry2eRva1wCvnxoIOuQ1K36276HLdIG
	 rxuJyeBX7iLM/gD9j24AqPUicltC9cNURxZQVdJCRjZnwLo584/8LpCsuALGdZWdi46IC
	 0UuGDF1AUya3Yqq3xSbPbC7zfi2iAx5NJylxtVGqZWTTdFhP9BKT1fGAQ1i2wqycCkZaH
	 IOVDrO0s6vPmZ/84r4l7ZJhoaXA3DeSd4ZzmKl0XLPTGX4eS3muUJXV+HXq6L2lzMhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmkeYydD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hGTJfoPi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CC6606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0CC6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SmkeYydD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hGTJfoPi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FSPF587752
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=plJ8RgROZwLvnc/MhxP/A9BjyrRLx3YDXVe
	OTpt+v/Q=; b=SmkeYydD58pSevZvjyec2CUU2pp7BfKjHtCYz8FL05LGbd2sPrw
	D0Frst/9UHWvtSLjJnvEd6cXnD1HsVxcIwLcyAKIHmht0FkL2ZIQmHJsMOS4r/tn
	2ZTkAMXKbexvU7eEYuEPVxk132ooHYS2+VmwSB7O9wHpvyLlKObMi57+CiiqMk/f
	gMZiR2+DZxqVnVxNmhCRegbYdx3Dyh4IGJFyOdAGqnj+33A5YTv97//HPrIRmmDb
	bY0ewtrehgJiyabNmvdDmXH+y9fL9d6iQl28pb6aLl/+r9GZ66IaVycL3MG6Lx51
	inNgbD+U62LkRt0tAnmX/VO2g0zmjgXO8FQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmatb7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:03:18 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac16335199so634740a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792746197; x=1793350997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=plJ8RgROZwLvnc/MhxP/A9BjyrRLx3YDXVeOTpt+v/Q=;
        b=hGTJfoPiPQ2EcIgXs9RKkF2VHo/EiTJAwOaimj5tpzdLlY6eOeO3Z0VKXBZBR9MNEP
         aSwtrdINu/+swuc0WuMPUuxhYNFuoeUonuF26X/sJbuj1YoNjGfq2HwUIdjCp2dLpepc
         s3DzBqKwm30iY2u60VUId3Wnfb4BzSwQA52PudIyZve9w7ussRwPGtWhveV9vt0Pch4U
         IMj+mhr50MWHtSdAV4j4mQ29w2fPNdljJIhM3wmKhZWm8JRMqtV/dkH72sG8KjWNdGDE
         H5p7+V5sFW6b+mnZ1U2f4rw6gCWlgnx9KsysdgS8Wnmchq5G6khkUywRvAr4AoPtJnSm
         Kkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746197; x=1793350997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plJ8RgROZwLvnc/MhxP/A9BjyrRLx3YDXVeOTpt+v/Q=;
        b=xdQv4dWDmC3edQNBgESrsM0TsQKoYw5pktk72e3sOapotHmwwGhMQgayo8md2cmjDT
         h+p5b1ks09vgFCz8i4qkzUcL46aZHpsvpYqR80odvJ433TrcB9e3D5fQA2hIhyCWN5R9
         d24VNCYcn+UqH5IcWjx0eNzqNcIw3zhYeYGzyuJA7JIhpwpVLhjXmlZZ46yaCwnIqtB5
         1QhOUWi+VoAjlgZlK75acpOR9872Pns95EZS/WP10Oy9LB3dPhQvpEXCSCDaQDE+EktN
         8EIZMquiUUmsa6pgwdq32HWdrl3c+o0/Np9pQ9z74dIgIJ/elR7/TK4wPzfAmoQHk6pm
         B/NQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6Ei/EW4IUmNt5NB0B/xEmJCCiBzLDNE+ehIvzhEhfIUCYcPghhoqpNxyRzPRe5+quvYSI8ljt8Ai8dSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIBKSIYZBjuYWC5umV7lHC9vtSQZajYBGfgJNqHob7hUjZigaH
	zqO7eZQFFJLDycMzbtzAI0KAp/5GbX3yGlbmuhtBA5sg7jrX6HUkqZaYbX8VBuV+UMdu2TmpUTB
	+Y2etsS5DrO9Y/7eGq5JfZNW+RUxMokOnYhRGfYOF+25m+bs7B9WF//xF2227KBjm75U=
X-Gm-Gg: AYBFou1R2gIscZK2PzyxlNjhogXdoQWqOqm6nBxg0iAOGjC4n4DcG3NAz4dYFHMkTUh
	pGw/aNGYc+TRbwiNWwew3LgpnWa0oH87oFop3ppK2D/cOkcflSky+D5x5j2Q+Ui3Uuh1j3sMeHI
	6ZAunV6WRBfW4gwBVO0mHgLvjEqZYJKwtnLLOVVit02+IEi7qtJhJLnEpDEXgCaO8fb3C0xgeyA
	0xmSDVYgJSFakNWWISvOY+Ms76iwU1sq55iHmmGfYmY0RCE+BU8FLnXA3PbrdYCbCq/xPoa94PX
	rOHcUVht1Q+dR4/FOvDxG3iHYyrL6wiVJLznBP/CFFCq2LmXGTZe4/Z7bYQUokyPTn6XZHmNHFf
	1rAQdITSBt1oUsPpxS0fiLlc6oX6WNcDO8A==
X-Received: by 2002:a17:90b:3dc4:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adce0495f1mr1385871a91.32.1792746197388;
        Fri, 23 Oct 2026 02:03:17 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc4:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3adce0495f1mr1385839a91.32.1792746196810;
        Fri, 23 Oct 2026 02:03:16 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba69ca4dsm586273a12.0.2026.10.23.02.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:03:16 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
Subject: [PATCH v2 0/6] arm64: dts: qcom: Remove FastRPC compute CB9 entries 
Date: Fri, 23 Oct 2026 14:33:02 +0530
Message-Id: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb22d6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=FW0NidNlYbm5mj9sKN0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX2iqmAL+id5jE
 Hsj+MOXIkbjdv98KpGtT4LfpCWvsmJFBaja6Ra4BmmL0xRWnBDREvnqyKdsTYW01TcubUp6lX8T
 D/xcSt48Ge6XekPXP7RVhK8Gwtezrf8=
X-Proofpoint-GUID: Go4Xp-0BpQgCgbiA1cuaVVL2LYLDZrqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNSBTYWx0ZWRfX6eiOAN+xiisg
 5wtxOMgls67m3/x9KjWuBnAL9FKzfkBNGNW9YbqAE0jZaUG5cuJUNnyFft+hEQvrWRTZAxaqWQD
 LOeuRYM1gphhgVkuMw2yXaDrrNuLgoV4eVSUPdu5UGmWe3pG8EaPuUB1FOAVKnUH9W+izoQGfCn
 4bAb7vBq6hO6FKL4sLlW+GDn0k3cEO+gOt+8PSpetSIzrUgZTGw96Ut6b6QaaxN421ozDhTxZCb
 x1hUuigkkBeXo4A56Y4rF2KhqicKtsULrCvup3uLanh/3N8f/iCjeQVBtEA7iGHFrOOsFdRfR7J
 SwHnZCvHw+C8vlXRO3e3Av6yT7Uq7ug8jL3Q65LuIBtvy4fSxd2q7UUntxnIw3lOKzSlpFonITT
 O0oobI0Gro12nas2zuQH8f9exGCaXBO4ap2RmoKLhguigOzt0j8RITp7TsseyG6Rb8+IxgfS/Zn
 88LWPds0bmvrs1DceUA==
X-Proofpoint-ORIG-GUID: Go4Xp-0BpQgCgbiA1cuaVVL2LYLDZrqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230035

Context bank 9 (CB9) is reserved for secure use cases and must not be
exposed as a FastRPC compute context bank for non-secure offloading.

Several Qualcomm platform device trees currently define compute-cb@9
nodes, which allows non-secure clients to select a context bank that is
intended for secure use. Remove these CB9 entries from all affected
platforms to prevent unintended usage and align the device trees with
the intended security model.

This series removes the compute-cb@9 nodes from all affected Qualcomm
platform DTSI files.

Patch [v1]: https://lore.kernel.org/all/20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com/ 

Changes in v2:
- Split the changes from a single patch into a per-platform patch series.
- No functional changes.

Abhinav Parihar (6):
  arm64: dts: qcom: lemans: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: monaco: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: sc8280xp: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: sdm660: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: sdm630: Remove FastRPC compute CB9 entry
  arm64: dts: qcom: msm8996: Remove FastRPC compute CB9 entry

 arch/arm64/boot/dts/qcom/lemans.dtsi   | 16 ----------------
 arch/arm64/boot/dts/qcom/monaco.dtsi   |  7 -------
 arch/arm64/boot/dts/qcom/msm8996.dtsi  |  6 ------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi |  6 ------
 arch/arm64/boot/dts/qcom/sdm630.dtsi   |  5 -----
 arch/arm64/boot/dts/qcom/sdm660.dtsi   |  6 ------
 6 files changed, 46 deletions(-)

-- 
2.34.1

