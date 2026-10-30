Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382449;
	b=zc2tWTsL6MAYm35tRG3SOELM80BV4764HGuJaeoIotHK+wnUhVmC09VohaWmDNtPbGH7
	 FXXeZYrJ/dHTefOIVv+L4C2wP1F+BgcSt8fBAMcnlzHTahuWtY0ll0w/tmIpBmYU4An7l
	 kPVJuKSyCuLTcbIApBlz1Y6m77rhlhoVd04zjDaiMSfwB/NNF4YADOB2AmjalPmqa4C0Z
	 LidpxmPFMBalMobScz4FJIBtApH/91ZGC5fmMFQvYdIBK4UB0U4n4ZOAojySLxUTMjrnb
	 zhxahIWhZd7hET1ClwQizKfdbDeuF0RxOnfgRIT32Py/sgVEDj+hrW3X4srubNBXsNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
	b=j1t7TwcZc580E/v6nTGrIa0+kmGL/KXn0yAmMkb958VwQfWbkugEFqhT/L4dSpLlcx5J
	 PYolY3/0d+qImGekR8hAANWxmLGItFv7auHmovsH0z8fU3EkkrgHQdcCe4NuEnW71iFL4
	 qXfU5ObOQPJ5LyAI8EInWkbY1P07fbTh+2f4qQWFsArzQ3spwfMuxrDpPUF6j9YreTslo
	 DgjtPIK8ScM8QSxm0swpfJQIi8uus/l25De7un0+Trf+OEJjWb+8g+tWIt86CInHCsATR
	 Bxp4pY1dhlDSHmpG+NrQRYM/cKk6FiKHp0ezzwUKK1RwQ1XyLAPG22yuOjJObsbibQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q+uOJQx6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAtypqQg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800D5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q+uOJQx6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAtypqQg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER3L2377953
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=; b=Q+uOJQx6MN7bb3Qp
	RIQYTGJp2FfIusVoQOW4c63d9kjqf9fxZE5a+4AMLZ03E3UWZKhYtxxNDQxmrv4d
	D7nXu9WxEBKPvZXkAgtmE08o/m638bt1LeKz9gZqzO9Z1F4WrmKB4hhO4d/kw2/Y
	AByqDlV1dclPMk97s/tXSR8QqMgqvUPrMSzmAy/GlYXH9UH+KBCu8JujNQHC6D9i
	evxujPQd6NPk0uS5cLyla83tXlWHbJi4/pywcNTdQg7JBet1vESc646SDTrxon0c
	UGQQYWMKkY8K/GpKNr3A8akHe+CgD7KJtltINTYsYqKDqBvtnA5bqsHO9TjFGM9A
	3+Zc0w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75495f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:47:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1792496eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793382447; x=1793987247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
        b=WAtypqQggD/Fr0zt6j/gkIyY/NCMrf44hvdYgTKN2FQ0Apb/3yxP83wtyrKdXzBoOl
         Mk29YcqcXlsQ8vsAIv5T7knA8QvP4X6IL5oIr0oySJBgzUhfH9IgdCecjmN9z2CUqUE5
         /8p806PkQ4NtCeog6eD0NidvD4lfk9zplbFs2JkhEL59yUvcSTBkdhqXEsOMTL3VTFGV
         zmSFgrwGr/kLZBsAqvMI2096pUB6hdHXVZwpsYRvRtPokyR1uRAm01dGx+mw84Z8mwuE
         T4qIcMiQry0zqGkH9R6J6n0K/bKQbVjz6NUIjkboelCDF7aLwGN1hyPhrRS9DGSoa9ls
         TqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382447; x=1793987247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKBYhPhEC+UwaTqew5bmTNWlU+HnyY6Comv/tpdax1E=;
        b=kYBbPfdNBM5b35JJUU6EsbldAMfqK4Nfq2xxMwFnSAdQHq3QzU13Pj5oxGUBHGo3hU
         V7Y2DIrhVQjk28CnDX1teFnt7LvYKawb40z3mZLhL+qkUwsXN5IxElxEPtxpznUD51aT
         qpuB3dMnQCxpyD16mANnftHMbe13auOeGRXDoNgIzzyOEjR7v98l5m/KCrZLS8bbe8rq
         i5AQHuyZE0nhDPr0CpxKstWvv3evMjVTcJXnfu1ZhHZ0Ji2pHy6Gzu0DptpneNayK2Ky
         iEJUhpSrBINLJ5bM3eOelsoC6FiU9y7/cwGO2X/Qepzsp+aW+ZuPjwBzCkLyc+euuXWU
         R+TA==
X-Forwarded-Encrypted: i=1; AKwUvBxJGb41Bs+T0TdOtLrrIAV3F7YChyKcBQfbXKHuORi/CjqGRNpx4ySYrgw9i5NOZZaBYoVu0/LuCLkSXzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/EUAlen+lCTx58aIMXQBIhQiq2JZE6DAAS1j+tmgSeu983z+Z
	KZEh0VG+Azhi154Bp1OG+I4Q/SP1Mr538Ce7Sc8Rk44fnyY2WHlNSiwnfKmK/vanmRRu7a+Hs7y
	VpP73twqcZSBzWJmub569Ht6mKxeiTAVclqTOE1Fa2uhGi4c6+vBi5m2sxwWifcSkg1r5Xp7rcq
	7iIg==
X-Gm-Gg: AYBFou1vKk1uo3FeEgk+OG49VTi3oTycRjr4GgxcZYLrVFv3cwC3TwzoNkmZ0MF+Nd+
	GiTFmM+JmXlX3aS6DznwdhSJp7qxOcGLzEKySybylWA1pHbOkGOJDsK7xSqEl2SpbMPzqlu3/em
	Qavdm9UCMZ17guOQMcsRdVxu5jqfE5IC0nhAgCNV83eTJzdVs8cYAc3MHJrEimQkmq1l10zSFWq
	GxvQax9jZRKp6D4EqlCv1thxuS5r6Oz18IsWWgrtJBzpOagRKe5hkl5GqjSY9zgwbIsHHta/JLa
	vWhSC1iicL6YZYxwaiNCJ3I6cyJYCJHSxQH51alvwPrPnCbk8ZiRE2OeG/1HUSKtvyEExYr4oCA
	9ZmhyJPuAWlXaTPZBIZlVCcAw3+6ib5ygEOLZKJXxjszybV14gCqcSUjJL80eyj6m8bqT/KjLYt
	aLe6fJ9/gRBhMdhwVa3lDZfOk=
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr5894598eec.32.1793382446840;
        Fri, 30 Oct 2026 10:47:26 -0700 (PDT)
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr5894546eec.32.1793382446272;
        Fri, 30 Oct 2026 10:47:26 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm8787868eec.19.2026.10.30.10.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:47:25 -0700 (PDT)
Message-ID: <683ca22c-f0f8-458f-8323-214945ae6d45@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:47:24 -0600
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
Subject: Re: [PATCH v9 1/7] Add documentation for Sahara protocol
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h8sK_iNY52Kh2Xa1DV1fdGs__ejNxz-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX0ARAWBuvLO4S
 rdR+8xOuraZJ6NQSS9BvlodIBZ+hlcHHlL3t10h6vReSXgi4J6yNKCxSGTE2/CARyAj4Yhbwu47
 2M3JZ5IQca/TyO139HLqIqBn32VjOi9STFlL2wh7M7htJ49xgiYEz/n8vxSwiK6vECGXU6olJbS
 gIP3LxqnktbNrhQQwiuIVS4Lnm07+f2FEznNHZz+ELz6VQatC5lL0YlKCLgo1/pA+/XqYifbN8c
 CbCnr2LLk72X8V0m0jmOr0FLiJNlJ9t1zFsn0JJo4mEn+dB8fnALxu3W1DlI5gbWVdriLPtSWFj
 82JuG1F7Icze8/X8HxRU3IF/JvS304oIpS5IuOGHCd/fX41vJp8oXFnq3TokDIss6r3aRyCf/SK
 hZUA3Klmh3HlqApd3lDYU4AWx9t2WZ7o4BrBZxvF94ummIM26UifN0u0eqX/RlidpM3N12HvwM/
 EDwP0ngfQ9i1XIdhe1g==
X-Proofpoint-ORIG-GUID: h8sK_iNY52Kh2Xa1DV1fdGs__ejNxz-w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3MCBTYWx0ZWRfX7b160Ze2k50Q
 sIiYlWqMeEj9CVCyaTCK9E7UyClHRA1//lQF4kv7ftKQC2cKbM7OvvZMGXY2vJln0fVdbOZq4Cx
 ftFdxoQkoTihlSgd4UDZtWKIobw3kq4=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4d82f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dq9AVsfMO__Ke9BKiAIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300070

On 10/13/2026 2:45 AM, Kishore Batta wrote:
> Introduce documentation for the Sahara protocol, describing its
> operational modes and their respective functions. The image transfer mode
> enables firmware transfer from host to device. The memory debug mode
> allows extraction of device memory contents to host. The command mode
> facilitates retrieval of DDR training data from the device and also
> to restore the training data back to device in subsequent boot of device
> to save boot time.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   Documentation/mhi/index.rst           |    1 +
>   Documentation/mhi/sahara_protocol.rst | 1241 +++++++++++++++++++++++++++++++++
>   2 files changed, 1242 insertions(+)
> 
> diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
> index 0aa00482aa2e2d7ec4941154a8c6947dc0a0ac40..39a38978398b81727514ec95dee4e060a1063b34 100644
> --- a/Documentation/mhi/index.rst
> +++ b/Documentation/mhi/index.rst
> @@ -9,3 +9,4 @@ MHI
>   
>      mhi
>      topology
> +   sahara_protocol
> diff --git a/Documentation/mhi/sahara_protocol.rst b/Documentation/mhi/sahara_protocol.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..3190e3e5a2820628e89efcf759c9ca634428f8b2
> --- /dev/null
> +++ b/Documentation/mhi/sahara_protocol.rst
> @@ -0,0 +1,1241 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +
> +=============================
> +Sahara protocol Specification

I think either "Sahara Protocol Specification" or "Sahara protocol 
specification". Having lowercase protocol sandwiched between uppercase 
words seems weird.


> +Hello Packet

Until here, "packet" was lowercase. Please be consistent.

Also, somewhere around the read data packet section, it seems like you 
stopped capitalizing the packet type as well.

Also, did you run the make doc make target and look over this?  Also 
around the read data packet section you start using the section 
delimiter "=" instead of subsection delimiter "-".

The inconsistencies in the formatting of this documentation are probably 
going to make it very hard to read.
