Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594004;
	b=Mab3dP97yPYS96x7cky7i4wLK9Tcg+6gDCuOC3VXlVGCdJHILjQxvwBOa7QLvQ/LaAuT
	 YDg5GhLpwpsEl/5I6dOIT+STisGsAtPGMLZflDk3/Ow2fAtm7s50iT5lLOcEILwvWpEkx
	 DFsWGFUQGtI3gvYqW/VU/TbW8Wm85maraK9dZdPV50aiyEMP+nRBv2+Y7zWQQ3RjAZixM
	 raLEjq9VoKlBxNbShD6wZbyqVdgbvjS8ypWKX8XPd7NtRGYpeEL1kHRewo5t1NEd0TbIs
	 dM8W+GBGU2j2FBBokQyY2LwODaTo23lZgVA16+o8U3UBke0W5U7UFGOX5w91cnPyBPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594004;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lc+M+xeSWFmNgJrag+pyxq6yWGejUKhFy+lMV3S6Pbk=;
	b=wJp7Pf/KI9fMq/6uGBXgchpLH7gXpV3zD3LSUs/UEl12+mW8ft0phBNDNKFMz09u2GWQ
	 a1XcUmvf1ebsxf3DtoT95+Jsqx56ItBhFhc7SVRNWciacKEf/5lYOdM7yVwT1e0UK8f8L
	 R72EBSoKpEYm4VMMy/EL118v/h6jx5JADSnMugZyBohMfqrWlatXoSAkibcrVWJIFBr7Z
	 9dRCRvx0l/nKzin8uiBGwcDJPblZDmOurNaLafPJWzgBjLe8DL9rJFj1Bfmgx6Jk0vo/9
	 uYPySgB7TCPV3hAp6Wg0kVU+0FNhUULvaoeJbKMsDftAibAVPsobUu7Xnv2voYngVPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GtYGTsq/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXuibiXw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E71606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3E71606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GtYGTsq/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXuibiXw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADH3eBs3868332
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lc+M+xeSWFmNgJrag+pyxq6yWGejUKhFy+lMV3S6Pbk=; b=GtYGTsq/XWnTnkK1
	yJGIY10GmMfnla23Y69I4f9PPzFqbzkyJUu2EA+fOP2RYQ92GlIb/G6toOw6MYld
	C7tRIyY9qWlf6K8TKQfb8uEfy8WgBws+4ERDnk0D+cYWWtSry6xCmO/geD/mQcpW
	UsMtNyp7JaMxkc2gd4q9OU+7GY6VU3jPRtfcde4fQuCDHrFRrVGUO4KvBhwp4ofZ
	kfyh6xAGcetHKWNgKpMoQ1CjMzLY2E+addy6ERV1+VJaII71gV9IL8I2zoIQ0fgL
	NO014vOusphBnkORyNVDc27bEy1eMwJ+mErnw0/R67NDz0O+v9pJn26YXjrZvbLC
	KeXqcQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx6ma88q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:20:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so1527910eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794594002; x=1795198802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lc+M+xeSWFmNgJrag+pyxq6yWGejUKhFy+lMV3S6Pbk=;
        b=VXuibiXwsMUkIxEY8H3x+5+3sGZD4Lid8/eoqPFkwBLxBzBtA8/muPRC1vGCR4HzGg
         w/47cRbmSPkDhQgsIVmpLu3tLtaKMW19v++PT79olepdBNZrau6mRVcN1Y1YiPOYuvXN
         +mUy1I3Yskmu+oaJsoo9P5EKjUSKVIU/2Y2okI+V2AmSizhlKuHDrLsukotJQ+1Pt2fh
         1ODJhDPjTSOI/0ZkE2O7tdln8lmGX5Y9WIBRuhT35VI2S2GGPQqitMLNKAdNE1hVtJRg
         xyaNcAq7Pt+Ri5XlTe/UiJvApycYbO9mQQK+Kmcb8QNSs5aHNduXZVZFf+A4znNsWWO+
         bS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594002; x=1795198802;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lc+M+xeSWFmNgJrag+pyxq6yWGejUKhFy+lMV3S6Pbk=;
        b=KbsCt1Wr/HYU8K8Wiq6polMBdGbCIUdWKtpE3zxZpXIwIpQTIf8vjxfH+sdKlqfO83
         cxKtFWR2lIbMCQNGG5ttsMpm9q68cTyxKcYPTiDTmgdoGwnT8PVR8gp/6TGUNScWCuDT
         BOdlfXs+hBCSiAiuoXQtfsMcm7c0HEwFFiVon68vICZ8xV/TK1n0VgSQ2jzv+Vazzc4Q
         in7+Ye2xr0qnp5HRrLv5L6mlAmFf+ARbSPoSGsaIT1iLiJ6QXvd3h2kszhtNJDqNyzZR
         XdlUuOnQ2s/eiYR5HPcCO7lH5PZT+aVvVex9cM9G9a3NPkx/XKKZJXg4UfcyOoKwN8HY
         uBqQ==
X-Forwarded-Encrypted: i=1; AL+hErGZcVbtNnCRLXkfDKCyfxp1aSlpgvlIrR9QDlP2oHSBUSZRzWl8jvTJ9Nxtalz6bwCzh3fkwLk4CKpD5qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qLwBp0FuG2p2GTX+QOi3AMnxlRQRFcAxMXdQ+DiYQkgDtOArC
	BqjZNRNkDiHm3M5MGH8hsD8+JEb5h39jE40Bw9Y4TnNABSP1u2HKDPbvheECM2FWpjBJ93U6uOE
	3FLBOw6oXuMGPbuM9SW3k+fKUvhnX/hUm53SR9cUoTB39CLkMtH8s8bkXGFFX0/htzg==
X-Gm-Gg: AYBFou11DQYXe3EQoZqtawg6dsoEr0fQP487FeE2++YPgDJt9Axun5AhgVcMbpvLk3H
	Pd3q2jVF8rISp5j8EWAL4T+Pd9H3woAANbcIRnsoVOwvQQG0bjEccJYXhGwBJQoN+bKWk2bppqv
	yNU/+XIzXrMZn9HUgXhXBWroaOGEwDaCDJ+sL7gn1/fXOtGuFnYAyU17YN5hzrNCLdB/I46BPXM
	qBPS9/ASh1TOLRXiRvG1OmUYLZYODE7rLeO2XEEdBjAvpIcXmxZ0TiYOlp2+qPaPUfx8BLFvIva
	3AUx94DrE74Crcm/hHmI9v+EhNukINHnJGkErUHl8fXexjYcXkrRxTeyV+JetS8Kjttze5lD9ze
	uGGFF6VRjVjRR3wcPYpcIoGdlrouPExMt1swFtWH+tnWpqORX5vO7zNzsYFaX+1qVAlGiZ9vnrp
	k2x4syugmuoUYkZOiP6tBadGkZkym3GgxFkPYU52PanXtipB2agWpG+wGyHG6a7LhjCA==
X-Received: by 2002:a05:7300:fb8c:b0:376:a62b:ae09 with SMTP id 5a478bee46e88-3796676a1e8mr3880941eec.16.1794594001974;
        Fri, 13 Nov 2026 10:20:01 -0800 (PST)
X-Received: by 2002:a05:7300:fb8c:b0:376:a62b:ae09 with SMTP id 5a478bee46e88-3796676a1e8mr3880923eec.16.1794594001412;
        Fri, 13 Nov 2026 10:20:01 -0800 (PST)
Received: from [10.50.62.158] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm17285676eec.20.2026.11.13.10.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:20:01 -0800 (PST)
Message-ID: <a509d2e4-c192-443f-a6b8-587efca47ffd@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 23:49:56 +0530
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
Subject: Re: [PATCH wireless-next v4 08/21] wifi: nl80211/cfg80211: pack SMD
 dynamic context along with frame
To: Allen Ye <Allen.Ye@mediatek.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jouni Malinen <jouni.malinen@oss.qualcomm.com>,
        Aditya Sathish <asathish@qti.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-8-62e39487f51a@oss.qualcomm.com>
 <ea313f0127e2cfa72a3572f1893e59c6e2c22cd1.camel@mediatek.com>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <ea313f0127e2cfa72a3572f1893e59c6e2c22cd1.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fn71KXrgSpcUCrtiAXGtxo-BfqzQUswS
X-Authority-Analysis: v=2.4 cv=RbcFmFtv c=1 sm=1 tr=0 ts=6af754d2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=eljfwrJUAE9ARPuycr8A:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfX302njOZ03uFI
 3oO6vh+U8JdNtF0lWTd+E0I4rFJ3Dt7XsesKL0FqkgIAfDxnjva1UeSOfI7fAOAvAyOnJkv5v2r
 QFSwTHwgJQsglwmWt9Drr/7VMsDXDsKY2ajFY0UVUSjrV/rD80+Ksmk61u+jrBSoFnByBJjJZgT
 lxmdXrf9Lii5HVenO0jPAat6llHcHRvlHxK1zaMrprprUo3a4+MXLK1ARYaLZxEoiD8O1G2op68
 6z3QDt4p6nyiuuPKDd+k0pXS4kEY4e8wtJ1S03qC2/W7Z3IzAHmYak+TNSeW//wDFmXZ+IuBKjI
 VjnaHR+TcjB0DG/gtAKV75zL0SBLwoPVKRdIu+4Fc+oQRe1CmlK+WsZVnEgtLTYy0eWHF25Y1q5
 MC8QgklL1/y9EYi2MyOUcjgJKEcAVJN/cdje5R8LMHcaz/GsY8cSZTRmWNKhSiMCRVHeLywr3ND
 JFppAedhV4yLRHhcfcw==
X-Proofpoint-ORIG-GUID: Fn71KXrgSpcUCrtiAXGtxo-BfqzQUswS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfX+L6KuV/ZVXC2
 ZSCIuVP6eZkE4Q58UcVkEMTi6Blc+E3yyzpgV8Uo6MzEBiQpvcqUtjEkZ2Ufa7OERQ5Z4qRQs3I
 rlNV3g6pwJ4mOPknOT0sRLxh4M6NKDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130073



On 11/11/2026 02:44 pm, Allen Ye wrote:
> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
> 
> Hi Pooventhiran,
> 
> A question on how the context is collected here.
> 
>> While packing the received management frame in nl80211_send_mgmt() to
>> send to userspace, nest the SMD dynamic context along with the frame
>> message.
> 
> On MediaTek chipsets (mt76), the dynamic context is kept in FW/HW, so
> the driver has to fetch it from the firmware with an MCU command. This
> means the driver has to hold the ST request frame until the firmware
> replies with an event, and only then pass the frame up. Holding RX
> frames in the driver is the problematic part: the frame has to be kept
> outside the normal RX path, kept in order with the frames that follow
> it, and handled if the firmware reply is delayed or never arrives.
> 
> 1. With the context attached to the frame, how it gets collected
> depends on each vendor driver's own implementation (on mt76, this may
> mean holding the frame in the driver as described above). If userspace
> instead queried it via GET_SMD_CTX / SMD_CTX_EVENT for ST preparation
> and ST execution via the current AP MLD, as it already does for ST
> execution via the target AP MLD, the flow would be the same for every
> driver, regardless of where the context is kept. Would that be
> acceptable?
> 
> 2. If not, could the frame-attached context be optional (e.g. behind a
> capability flag), with userspace falling back to GET_SMD_CTX?
> 

Hi Allen. Sure, that option could also be added if some drivers choose not to
pack in the rx_mgmt frame itself. Since it will be a fallback, I can change
hostapd to directly query the driver for context using GET_SMD_CTX if it does
not find the context attached to the received frame?

> Thanks,
> Allen

