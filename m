Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218833;
	b=IsUpbWtCFUzeZK7iZff/Z5WRuycBwu+YX2zceVwAPiXvbQ2ZKGYzKBtSsJ6WqB9F8B2D
	 GwhBSCr4LFaUJr9wUioa3xFMpmHISjt1PvAYT0ML3IbQ/g21do6JzO6vE6zyDqXVSp+6w
	 uCgBAyp5+Y5drxX+MnO5o/ZszCZ60wtw/Df+4/mcDKtU1tZ2wm4AanZuNgl2vC9Jqijsf
	 BkIUxzHnqrcCMu8plLH4XmtduyG40SBHwxWmWMWtskixfHY9msCdcnNew26MQifx8C5/W
	 KpGHoqzm+YWPLFmI1YFFF1XVOPtV5L+T1cly9TJFk272SdBp8G50UfJmUK150So+CWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nf+MlQRRU02Zj+IsiGjuFAyJlL+9git8jqurbSTs7uY=;
	b=PfWYO/gxe35hl4D9WekErR4fE5L+8bqWcC0dCjZaeRVJX8ZyxbAqMCIpo1DP/w3RASQn
	 RIZWj4wCoiCgwdDOeIEIRKCq8oIsVwl5w3mqHWcR5xocoBj0bmgIghZQ5Sy60PaWiZit2
	 xMpoOeZtTbfeZ+eVqbmDBom/cHDqgCmmHYW+eQ48gMxPbxXzM0ztS1CPOj4bLnWMP8ss+
	 Dpk63FRySpqeOJFRdK/I42mte9EbLjotmeyZ3AI8hyOtV4giAmfCkCSIzntvbxi0fMpnZ
	 JvGaA9FiNEefJYxdlQCE3CkqicbstFhLzh+zJF6oUX11HcMivE+tBttPIDE4KaqwGgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eL4VUp34;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UvFYVk/P";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC1A606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC1A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eL4VUp34;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvFYVk/P
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uvUg3035207
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nf+MlQRRU02Zj+IsiGjuFA
	yJlL+9git8jqurbSTs7uY=; b=eL4VUp34QYFisixZ60bqtqAD2BDZ81OOTR4qdF
	t0zZnPPoL3J6YBwBzSTECJeFot3o83i8Uxsuw1YLP7BwBNoDpBCV7SkxXH4syMcv
	q1CKQCSC1dgd+xZTRc+TcBCat7yrvzM66j1YMR/RjtTPYCRcnKttOyhE7EASbZU+
	dGmAvnF8VsyYHeuzuiv/bWBAqoPH1tv7yYIhyYkvzl2+jpg4+3UIPqC0v7RtbeZE
	FaOkL/xifYc6OMmT8si4Jd2GqoEE9uXPC75hoKkxRURKM7/LUYylrPtpCuXFTP/U
	2aGEDmvrZabbwlY4yschnZDDv5sXaoIGvnVlggBo3EaN/lfw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6nrbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:07:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0e00d7cc2so682341a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218830; x=1794823630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nf+MlQRRU02Zj+IsiGjuFAyJlL+9git8jqurbSTs7uY=;
        b=UvFYVk/PI2+DO2y7/3RcIF4AQlbcXNKNC5wjnvIBJ+GwbCIfjo2wmFCBAaQ9/+h3kB
         s44D58t5tdMQS3a1EeIfJoMkq7WuzZSEVaUynYXmvAD8UI3JdfBwGmPSPFAoPXbSQ4bx
         /gGewOqvD+N/gQUKp6PTwnL8YLfXhsA+lc4UcPRHbgwAa0FEJxGxAvjU4xL9ufl5PA5F
         keFefeFehKXbQcFNOQ/XxcDn9TE7QGPAiWGgRGR08KYOOwhDM1SPgN32+Pg96kp+dHHC
         1Tf8sohOowBdV4OprUlB4OsvaYSMngsotrFI4kVyZSot6hCIPkDVrLiTETS82xtesE88
         PuSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218830; x=1794823630;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nf+MlQRRU02Zj+IsiGjuFAyJlL+9git8jqurbSTs7uY=;
        b=yflg7zBKgb3vKb8pmRvQV4GtMzk8GpEglOoHCgKgDvJAVv6x884iRqahtBvZSVbEp3
         JyIl9XmHbAw4LyG/pbC1YEI3IFSSWLKsMxpiFjR/QIBdZI4qi0HsntgDWAlaMLcmDgeQ
         igzjVmx76JpQh1tIQg485cfyPwNA79mbiy25i/TSJkdzKmBy16M04X14JIM0MERzESlM
         PpzAGzL6gccPAqgQjBA5H7OFfQW70z9VKSRvv8aLXXFjew1DTBJa2yY78UCt6be5SG/M
         EmbHLPP/2L4f6+9G5oqmCjC9Excgx7WExHdASKLR0lKQhgoB1EqyLvwOZg8EdZL/DBAb
         CFAg==
X-Forwarded-Encrypted: i=1; AL+hErHfEkyBrlCbi4NQB8vR1c5ZzunX8+F0atOzJofH3/bk1up7EIziTI9h/0FuMsqwUBLbRBviHV4CDOeT/7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xCAwAImFgVWnGpfuqcSrMTy+fyuauIxyyZzmWYBHfA9Hd4LkP
	46DSMt0u6Z4ZGTbgCQ2IQl5hrzpMYZNr5Y7eod1crruuNwwA6FUdFrU1DC9x5WBNqG4KiblXn/g
	FsxtEuewHNV/5UApnEItVUud+jJQFsnk9nIUOLc/UK13EEnqhJgYdyd3xj6LTymKCqg4=
X-Gm-Gg: AYBFou3nrHQetb1X0xYtQvTvtN9ocTcJpOxGyLsb2ofIVgMVadXONvCDwzGJYCWvkTQ
	BLVqMwysfIWrjh/NTeLPLK+vDwsD22jE3T2euolayBiV5ldP9mZSz0HhPBLLGu1EMwuL8tt9zRr
	7x5tiVn4UQFpjJuRE//UJRs7YElyoDalPf1VS3uxscga3/9EyyO4B1VX1sX2m1AMP4Go7++iIeR
	oEaZpK58KKEq11+M31CUV05EplD34WuUb6hsts2/WeUCUP3GTUelC/qSdpwllILK+31HzBsKpMP
	JHb8VagFsjvrMqrBBc3hzmTQBynSlWHeY2XWGfu2sYbxRNVoHIOGvRJL6R3pZotXHd92ghmhgNU
	lJdZibE/ONjiN5vs/ccyepL0OtZFBD9hjsYsbf/Ak4gcGKFov4L9tEC0nPXbNZwkEy4djlh7EVU
	hsFESq0lqmLtSX3+t8a9ozc3lZE/7Y
X-Received: by 2002:a17:90b:57c3:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3b12d30429cmr3355756a91.32.1794218829906;
        Mon, 09 Nov 2026 02:07:09 -0800 (PST)
X-Received: by 2002:a17:90b:57c3:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3b12d30429cmr3355724a91.32.1794218829365;
        Mon, 09 Nov 2026 02:07:09 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:08 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH v5 0/7] arm-mpam: Add basic device tree support for resctrl
Date: Mon, 09 Nov 2026 18:05:32 +0800
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPaa8WoC/4XOy07DMBAF0F+pvMaV30264j8QCz8m1NDExnYiU
 JV/x24lYEHDZqQrXZ07F5QhecjouLugBIvPPkw1yIcdsic9vQD2rmbECFPkwCkeox5xgmxLOmN
 X8NsUcZ5jDKlgS6Wzlmuh+w5VISYY/MdVf3q+5TybV7Clka1x8rmE9HmdX2jr3ZY6ur20UEwwa
 MX7gwHtZP8Yct6/z/pswzju60FtcGE/ZE/FNskqaQalhDSGDUreIfk3SQnptkleSS5prywzgpv
 hDil+kewfUrQvndMUhJDW6D/IdV2/AL7kFUvYAQAA
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>,
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218812; l=7292;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=LA1+ibIXeIVXpuJ+TURQUTmYGYdOyRJdkXgKC0FlaS4=;
 b=cl8Ypml7zZTIO31d7GTXhuJJVazzEoUpVVKwNkvQAK25ZYUX7Y4CTJ2OTJP/AVxoyS4XIItsU
 zm7H3GY0SnDBJLCtaBN5NH3OVMCCKCfXHCb/7GD7yvZ8019QvRvreJm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX/2+mCj+Coozj
 tebofA+Nag4w4QnWAOXpL0poEqaavJhmMPQsQvQxVNskSg3UYchFlWIC1riV/IxN20Xc671kSIb
 D2J4f9cv6owuE9cpdOPtir+MuyKSyRJD4E1eJ5FcF8hJ/VgWXG1Qn/9ntN57TErsvwX1QuN0yau
 8SxPRf2Dao0baq6M+oyl55NI6AlxGHZ8fvL2uYl3Ei9y1VlEMlRyybW+DOY6nO5N6ctT+YAsOTu
 lP12dYNjPEYi8179MpwusQo475mF1hmi3++tXS/siZhWbeZlQqYqY2TumRBLY3Ua1dqc+HbxgiJ
 xKZcU2BJ8WsaEVsjoGXihxUcgCzqRMkTAV6EGYduP1AS80DIZo284Skk7bQ3xy/zUKhGPtrOVcS
 xZDU5MMRmBx04IgeBJcMfXBAMO/Af8tSPQs3xklcLROKoNxFPvUNZyvHeNdQb83/E8ROBxEGWAS
 2VZSfBIA4Iku23icqqg==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af19b4f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8
 a=omOdbC7AAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=zO7xiSDGFKMmiMMs5ZgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXx5/3gId6hLMb
 r4bEKRcBMl+6mivuDhcnDArCGKf1PrDpezmc5gMmNuKDSqrkCYFCuvRsD/8yCQmXa/HvM9P59JB
 MCkqfqKFGEqJOi5uUYUMg3oKBwoPF4I=
X-Proofpoint-ORIG-GUID: iZTa-kOko53qbDobf-IbKuQgSL7vTSVV
X-Proofpoint-GUID: iZTa-kOko53qbDobf-IbKuQgSL7vTSVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support before it can be enabled on
DT-based platforms. This series provides the foundational DT binding and
parsing support for MPAM.

The verification platform has been updated from Kaanapali to Nord.

The patches are based on earlier work by James Morse, Shanker Donthineni
and Rob Herring, with fixes and additions on top.

Standalone fixes to existing mainline code (placed first, independent
of the DT work):
- arm_mpam: fix the RIS index range check
- arm_mpam: fix the MSC MMIO window size (off-by-one)

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]
- arm_mpam: memory controller MSC support on DT platforms [4]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
[4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace

The verification platform has been updated from Kaanapali to Nord. The
Nord DTS patch adds MSC nodes for the L2 caches as a local verification
example. The MSC register size is 0x2000, as the Nord platform implements
MPAM registers up to offset 0x1FFF (permitted when MPAMCFG_MBW_PBM is
not implemented).

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
Changes in v5:
  - Restore memory controller MSC support: a concrete platform user
    (DDR egress MSC) has been confirmed and verified on hardware.
  - Update binding: restore 'arm,mpam-memory-controller-msc' compatible
    and add a top-level memory controller MSC example.
  - Switch platform DTS from Kaanapali to Nord.
  - Rebase onto next-20261014.
  - Link to v4: https://patch.msgid.link/20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com

Changes in v4:
  - Reduce binding to minimal set covering only properties in current
    use: remove RIS child node support, memory controller support,
    arm,mpam-device, cpus and interrupt-names.
  - Drop memory controller MSC patch (no concrete platform user).
  - Drop RIS accessibility patch (no concrete platform user).
  - Update DNM Kaanapali DTS: fix node names, compatible, ranges/reg
    format; use 0x2000 register size reflecting platform implementation.
  - Rebase onto next-20261014.
  - Link to v3: https://patch.msgid.link/20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com

Changes since RFC v2:
  - Fold the binding schema/example fixes into the binding patch.
  - Fold the foundling MSC fix into the DT support patch; remove the
    unnecessary parent cache availability check from
    mpam_dt_create_foundling_msc() to keep it consistent with
    mpam_dt_count_msc().
  - Remove the #ifdef CONFIG_OF guard around the cache_of_calculate_id()
    prototype in cacheinfo.h.
  - Remove the [Yin Li:] annotation from the cacheinfo patch.
  - Rebase onto next-20260918.

Changes since RFC v1:
  - Fold fixes to inherited patches into their respective patches with
    [Yin Li: ...] annotations, as requested by Ben and Andre.
  - Move the RIS index range-check and MSC MMIO window size fixes to the
    front as standalone fixes with Fixes: tags.
  - MSC MMIO window size: genuine off-by-one fix; the ">" bounds checks
    include the access width and are kept as-is.
  - ris_idx: validate range after of_property_read_reg() and keep u8
    downstream, instead of widening the call chain to u64.
  - cache-id sentinel: keep ~0U notation, leave cacheinfo.c unchanged,
    replace unsigned long with u32.
  - Convert mpam_get_cpumask_from_cache_id() and the cache/component-id
    variables from unsigned long to u32.
  - Fold the device_node refcount fix (of_node_get()), reviewed by Andre
    Przywara in RFC v1, into the DT support and memory-controller MSC
    patches.
  - Drop the "clear mask on error" patch.

Previous versions:
  v4: https://lore.kernel.org/all/20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com/
  v3: https://lore.kernel.org/all/20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com/
  RFC v2: https://lore.kernel.org/all/20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com/
  RFC v1: https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com/

To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Jonathan Cameron <jic23@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: Ping Li <leeonion.muyu@gmail.com>

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Shanker Donthineni (1):
      arm_mpam: Add support for memory controller MSC on DT platforms

Yin Li (3):
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix MSC MMIO window size off-by-one with resource_size()
      arm64: dts: qcom: nord: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      |  62 +++++
 arch/arm64/boot/dts/qcom/nord.dtsi                 |  72 ++++--
 drivers/base/cacheinfo.c                           |  17 +-
 drivers/resctrl/mpam_devices.c                     | 278 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/cacheinfo.h                          |   1 +
 6 files changed, 389 insertions(+), 43 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>

