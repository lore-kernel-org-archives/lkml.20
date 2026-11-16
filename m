Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841170;
	b=WBi/PnlnKdBd6Tyi+yBWPCJYxnZ+RUvWZZN9Fk+kkwUvvY3ImxQVj0DSOVO/ugbwOPXN
	 TjTrAdqNpI0t0BNx5/wqe0m0wUmLSyJKVEQwfysd1jEkuXqC6g0CFItcVDR9AW+75u2ES
	 obYNS9YUl7JVkNUjeJRIELLnKsTg3Vv4Sfu1t5F61fVXvbT0smFxEnF+Gq20RqVDUJzNd
	 t0ePWdz1AFNwUuJrSLfBYjbT+U9XsT7XftCDoOHzPBk/Q8lyQm0q0XEk985RJHEglfUHj
	 y1854JWf/ZUcbW94LXodWNg/2FxX4WW9QD8QmC19MMqWPXEZpRtmhDYeVsnaCE+a/yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
	b=bdnGg/F67lpUFlP9bMSqQH5ahG3QonaZTTJuuyyMewYkrXcHDCl4NYc7QdZ9kpygfIWC
	 gEmhO1vf/71debcyYyd0VQ/GI81kkLJ4ZD/dRFzhi/2Dak2TR6F0jJOJOOWbXSVSCBqhT
	 vi2FKKUF8y1ni5uH/SOBHF3lqeYkSjyusU2NH3/6kNsxwQ6EykYGwngouu3OX4mXqJ17w
	 93XJiF0gA0UVXH9AOztAW9UeDDEjjZLcgIHV+qF4favuR+PJRoF/fYFvleVWY1I8seJo/
	 uqMNInLqqDq7yMDPhv1s5MV7HPup8Ke+5DVW4uKah78WScWZtvKDn/00gIGP0sLtY/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pb3Il5lD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XuN8VZj/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4B6606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4B6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pb3Il5lD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuN8VZj/
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrS8n1727179
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=; b=pb3Il5lDZV8XGrNM
	LLuSfhhHKQPYEpZyE2g8CuQhGwpdpOranpBfGH1z+8fL+ZQZ/4zejxMicR6cySfq
	+r6sHKXKnN7agns5niIC4xjpjONWkOfAsMiYqKMfliPwOXoRbbAV7w9At3uB/Vus
	427D+gGFDDbcofjwFNB6ce3Vd1GCzumfUG1OFkKTAflqDiel3dRJksLkMR0TVO6l
	LbElOOEr1FtIjMupAas510Jt5Plv53gAlcnLzXFyGIje1TwUxvTR8GWmH0oipLxU
	GEEiD/+VxcFy1r6aeWzPz51l6VRk42qg8b0iX9UTS/VRYY3/9FihFrDxaAowT2X7
	PudfSA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqh1bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:59:29 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e14fa4868so195990241.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841168; x=1795445968; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=XuN8VZj/tZIZ2Nx/SXm4kwnVKxoJ1G7KRhgsU+aUzVXa8+OHqowI+ha0wnrEyvA4ug
         XcjiuM5S/tVoI0wfhtDpZd5PIhjiBxUTjdlI4A9U7E5vqcXGFr41XFRD2diH3SOwGdgO
         4pmpUsIcuMEbkvwS4KECrKs2doPrQ9P7/Ih1DnnOclG/Lb6chzI21ar7aw1S0Pajr3WU
         Z5Te5et87AB3f+0v3+h6Wto05rR3vIVK0Z1UeSCZDgayA7nDSQUoiVU99RUyLJUASuAp
         qmBtDHuGCtsC0soFtB0kB8NSW3hV28o6Cbp58uQQy+bTG112fTTx1webFWg8vjZ2vUST
         JfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841168; x=1795445968;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iQyP48LELJCBMXn4eKZWAGYXhffQTCv6ekvRkXroew=;
        b=SvANJBvA9m3Xbg1p/xhaWuYr50tsLM0IdEap+rbo1XRnsxBoyU0dyebyE9jGy4yOQ1
         wis6+Sys+mrN8G4uS9hg03anksnrltEniyurN1DoyT0IJO3TMlqWLPtzA4v+H9LHuYzH
         VFrZBjELaQGaRPPeLZiHklej7ZlK78Y4WVrggB5K/avG/Hm5yNXd8dIHtWVPZGoLjGh+
         4cZkuPYrriMUxPjAAXQy8RkiejPXTF6XjGCDA1X27PmOcxXiFir9rMaaqn0DdUrUY/Eo
         WQNT9D+tKYx7rFt5OUqvvHLXS2o1FZ/iAxC5i/QfD7vXPpbSP+rV28OstUgrsKjhzb3M
         Sr/A==
X-Forwarded-Encrypted: i=1; AL+hErFxg0ghri+LyWb6kcZgjiyvMNI5LNT4lTfzHn+yEBkq6QAvKrr+TeBiwIaPlItWG6v6049ZDRFB4J7VUoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DHem2Yt38kDZ2H7VCqNl+OVLv5l9oVCsnj12TiEe4jymyeYPx
	udnbZ89WYW969RaZOl0ln6pthrIO6TBCXrqfC+TeHS0Px2N3xnn4uLmoW4RliVglLWQY8uWdhf0
	vNuGgFBgBBOOeQI1K8JCPVs8XaS72sp3gLCcco4cVTeBZDNzmopIC6Z64nx73lmPhqb4=
X-Gm-Gg: AYBFou3pmKPDfrmNBN6FU9d2HBPo1bF6M0nVFLE+FSKHJC+cjhwPqFfJ0XakMGV656S
	4wl4f7Gv0G2IPtKkSDtxJlzK3d0xWlRR4cgapYBupWkyLsyckgR7j9VPT+sIesKXEQYVfL5n1ox
	vbZCmO51hW5U++a4UvnN4x3c4+ZBA0FGe4r6Q4uU3TwqKMGAPfU3+rat/9/S33wnQHyiT+XbsSI
	AzuA8MrrGJLHXIkrOLDv3PNx281aMTgLTRaGtqjAZxlVS4txtDtXPI6KTerqDIYM8APTn1wvvr3
	1zhrpa7WiTs7cf3Rq3hFAA9VeJ+zbyawbaVGVRSGaXoksJhStb+7qg8ZPVJ8NljgAFtPcJmJbBc
	rSbLGRwkJPcgWpRddsCKVAl3YzmtOl67kL6xdcZFSAgV3J1tEvQPV78OX/m5NGUSnojAXR1+B/q
	pd4nxQLn93lh2o8w==
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834605137.37.1794841167891;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
X-Received: by 2002:a05:6102:84d3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d64db55f53mr1834597137.37.1794841167423;
        Mon, 16 Nov 2026 06:59:27 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH net-next v6 2/4] net: qrtr: Assign unique node id for
 MHI endpoints
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-2-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115882.1191469.10273528779891181170.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=1115;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=nmf5XJiuMoM64HRXGwco/c9sJpA0SyP6SEfhcFZLFYg=;
 b=9OoXP1d0ITEfI+QdrBZsHqRZY/6c+avW7cSbPIi5eC3sSr8f+QRUh5U44OWYLgl3pZpz1Hx0h
 R+wI4GlIC8pCAYQa37AkKg9OACfKCpEBiEpQp1ES8HeLcaWicxZn8P8
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb1a51 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XPvbEF_LEuHnWTr2ZGEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: v3tU3YrduVw80w8lSLw-jXPPDEaeKi7j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXy9oGArNrpuYV
 Xt3jFv5HtHbR+7dn95Ov8KikE79eTbtaVjy5fIAXP3Ayo8r3em9FoPExY/9EMtdWWutRHqxUQ4f
 s+EWU+POJUhJ+1l7WnIwvr/OgXE8Gz0ZQmL0rePtLGQVQ++S/WE0YMzydt7CPZ0SRPYlRARz+nf
 QBWLwwrURzwYmo9Tuko9G3Shwtsjd5Kx57HOSajfIJLbox1zQWkn2oA1FptG+GQPAr9jAC63pCu
 4y2e/3jvAoxbjrnVnJomkmqMnYUbPtKtS5UigYCXtngZbkWmPanWFboEaxvribIEkgtUx36WVna
 HZ5HQvXlgIWreCDZBFPzDpHLbjlChwp+GQLTira3noT/rKeWYt5V+BtwWh3jBe/vvsjRgMGYS3H
 WqY4V2PGwh5ie0V9G67qnl66DoguJ45MLPYwzg/ORL4Vfnl2fQJfT34RQWa5Vtr8vdFLcQWzryf
 IFPGVYREp6VY8ESsNlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX2Vu9jOeWdwFk
 8KvMtRA66Wxd1vS8JQ4+ATfllC516J3ITc83ytY2yhYrzw8Z+zmYPh0eEhF2N/rXsUce/uat+/q
 ve2xO/8e4kBKmdigmZ+NwJT/Z4QdzdI=
X-Proofpoint-GUID: v3tU3YrduVw80w8lSLw-jXPPDEaeKi7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059

On Sat, 14 Nov 2026 06:26:14 -0800, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> Now that the QRTR driver allows using the unique node id for each device,
> which is different from the node id received from the remote node, compute
> a unique node id using a new API, qrtr_host_node_id().
> 
> This API takes the 'index' parameter and adds it to QRTR_NODE_HOST_BASE.
> The index comes from an allocator, so the host assigned ids are unique
> among themselves. The base is chosen just above the 16-bit range a v2
> header can express, so an endpoint using v2 can never claim an id in the
> host range. An endpoint using v1 can claim any 32-bit id, so a collision
> is possible, but unlikely as the firmware assigned node ids are either
> smaller than this base or in the range of 0x08e5ff85. Such a collision is
> caught when the id is added to the node lookup table.
> 
> [...]

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
