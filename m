Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818794;
	b=xokWYVxMfPaX76NsPcA3OLdEn7UMTMPSLiBX4LCtXd+0pV8mJKdjZExPtT75e917T6J/
	 eH36eAEpGVZkgPqrTr/rDMwRrFDO21UymB8y97do+1RnpUngPppLMkFJ7f2kjKqzO0HTG
	 kTrn/7zINPWg66yFebv01xvnffpZSf0Zyid7M0hKzI2d1JiOCEKmA9gBo+LSXhcALqOZT
	 52hvLh4gUtbtZoyS4bLu2eLWitW/81dU3PKjgFh1gh7ATGYmUgHSRdH4n83eEdB8z7iUr
	 EEvl3ayFVEP6OvzJ82AkIJHOPO798RHJ3evk8KznbHNQ77HcFZiMfMilxd8eyx76HOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+AL3vVJujoQWo6KzL6QcnfTX/uMtvYEe2+sDd+kjwIo=;
	b=38kUHGmdbL+Q/lwTBLOHVNQQhCt9ML4KC4bsNQmmy/FQTi1YBYP3RHNpCE1f96gKtfGB
	 3PeCy7k9Eu+UeNDCtI+eTk5l0fCsvz7P1LFn0JRMjpRTJ66ssj4sqMt93olGFhD3xzCxr
	 U47AOkqf4bEomiJKTwqFbIVgF4N93f83Flh/lepg3mspupgA0AtP3tjL33LlVQ4VAuHJs
	 VE+RS5XKzD64yADmMXv7lZ1UjF70iacCE/g/oe1Lq0Mwe0Vvq/EXd+H4DUup+wC0grWtr
	 R1YsDFsKLP2OTh5DLf8Ef5Z8BJccc6A3/blh0t7ljxDaHS4XVuML6fDVCC58kmakyYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oL0yYGPA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TtpHzJY2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FF2606A33F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FF2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oL0yYGPA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TtpHzJY2
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjRg63209178
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 18:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AL3vVJujoQWo6KzL6QcnfTX/uMtvYEe2+sDd+kjwIo=; b=oL0yYGPAouoaNo8S
	qM1vUmyDp2purnoBDMraK0tUmAiatZo0Cz4/YPxbeAhPWg7ERgppywjMs9HOnGuX
	RaqRHfCSOXp/GR0vUsuS7nButWWuHFgNse4gPobVoOI5hNlowWwqSLF1XtJoAt+T
	C9VQ9q4UM/SNPqZfAMg7m2R9XFNNFGpaZfN3Ibf6aZ+9Autil478sirtJufV3wM+
	hPSGjUWVAVXzT8KA1/O+R1zAHSyvawZpJ1CaVzfWmDs6zxThXChrW/uC8bobaeWR
	IzebhghazIQxwaK09eWiMeBrsMsVbI13KCt32j2pyYjsBexEgt5uUQ2fu7PO3ljn
	pSkwDw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj167m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:59:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36cec75d8caso963110eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793818792; x=1794423592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AL3vVJujoQWo6KzL6QcnfTX/uMtvYEe2+sDd+kjwIo=;
        b=TtpHzJY2KtzVMMx+2UW0FhN+rSz734KhOjSoO9/8S3XPQ0wuvFYQA2imff09kl8E74
         hVzxpE+bx5SiXxyo35Fo/4dx/L4rlohjaaLyr129Il4DbyNSRypNbrv7sgJd4cdV1z/U
         QuO+ZwXumUhueE4FsGUK3Lv2MMpEJnx7QMxcAu46StP+lPZrcYq+kOCCXp6KwyWGsMN7
         X3lxxtoMY15sbS2qo7P9U8fCWB977r4ppDY9PDVyPYNX0HTVXIYI8N/kJ7dKkHi3qlH0
         Rig0VET8+Op/qg+LuhIJceNYR9URRN0aSusJJ9Dbu7jhtvlUmI7KpAyFuR1rOZbOtVIe
         5EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818792; x=1794423592;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AL3vVJujoQWo6KzL6QcnfTX/uMtvYEe2+sDd+kjwIo=;
        b=Ak1x8xtE6f8scZYpO6LRvbcfit0qvvoCD0c6Hs6N7UKL9cH/eHzRhtrzpe73hoGo3H
         fGAbZVOdB2CRFiyD1wNueYQ3Yq/DPg46ed3xOnSGaXSTJSb0m2Ltagns66abwOqvnvWu
         KXBUnfprdTaZ1XkuRdTppPFdDUPMTLmCGa13DgbO/qn8Wfg3B0DRAOJSNvaNJ+2QONVk
         ViKTkM1PRzH9+dmLLN6/H+LjrhEuxFjVAs0jempGdUyTjFSOhVrg4KYTVRhsg6rey66A
         sgjY0FPdL2J3c7Pv1Nt0BDDF+04DVqm/UT0tFDc8nAdaHb/nGQrk2noxXUjCt5lA7dDc
         YkTA==
X-Forwarded-Encrypted: i=1; AKwUvByXV9rhDYA72ShoNaeQUVJ6vb5dZZo3Zw5JG/ZTKSHvY5sQo6pEo+6ix2Pk/OsSEpFcleW7c7TVp/OEZyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ekIUDRHk+p/OrfJJ49Uc0r+LDSrvwxQoAm/HPNHFax647A93e
	5VqUjfCNy+pGmK3T21N7q6183NGtqQF+zuXI9IxepdVRLIThLK300C9tDteOHEJajRW9h0PuBhz
	svY4rVEQd+cII+QeVg7qo+cCJrq5EpKzzD5HExWnHKzg8a5xj7zo6zui9B/zKJAI7Jn0=
X-Gm-Gg: AYBFou0YhL1yQ+ziW/JpJKQ3EJzCnvNptdIMJ9GrrLx5rh4jrukjnOeR1Dk/4m4QVPz
	nhmWWIUHlg/mOF/OXx8di6vpESQYBH/vePzguyEazx4v/b2XY2kBW31r5cw5E/FR8pIO2F0f7Fl
	XOciQy+aTJ4OXcWsRG8NXeJl61Dc5fbhj+sW2BC+PQAdRRREOlNMJitzSQZvdTghXgq8EK0l1Wu
	+E76vXBz8j6sw1lR9fumFYuFLmwNdf9XEKL8LvqLPsiiwMdQslMWmFXxuekkHBrV2b5Z7V3ebOK
	mnpIvZaMcimpKhmptGOkjsGTrDVWBOMqs5kB2c3QYzYZz1T/cO4tyxDiT3OefNwWXf6Gw0EQ1PI
	bcUp/G0wS8rNBrP/DUV6gXlYda8kYPCNz/ZEjONbAB73CCqXw0SrgYk0OrLhdMZGdknMgg6eZGc
	xErtYnL5CtbARQ++w48P56COG+97Y=
X-Received: by 2002:a05:7301:4710:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36de4d892a6mr413651eec.9.1793818791878;
        Wed, 04 Nov 2026 10:59:51 -0800 (PST)
X-Received: by 2002:a05:7301:4710:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36de4d892a6mr413608eec.9.1793818791183;
        Wed, 04 Nov 2026 10:59:51 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm14596861eec.11.2026.11.04.10.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:59:50 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc
 firmware memory handling
Message-Id: <179381879048.1666903.4827075101285181405.b4-ty@b4>
Date: Wed, 04 Nov 2026 10:59:50 -0800
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
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NSBTYWx0ZWRfX3Fuhd/WQP8uG
 APpDyea5FuXDowE3B0R8nUJ8Fg+JoOlN8wlFYI5pG3hUrUxBI0MFk1aVTGlLdWwSGLxjMkqJlIC
 cJB38oP7IZQkUxfg20ynfS86gOV7omhu9kHr2LhykUfWd7NXkHgh2b4fTPPglnIkXMQi2xXxjz2
 y7oYUO1AVnW4zkpznq/LIyvS7Ngs79tSdSJMWOCbF3xBgmiN5rp+DhxsVTzAaRPAM8XwXj0cbK1
 Vwdrg5mTaSmo1O5b1UPrPyzLcOYgINU/0DCYSM9hj/9EpohZ5ASiT2sg03HU7hmHRv67p6tLd4E
 xDhCZml1tGy8j0xY/+Yh713KqYgIzj75M7drjbhrQvyTUtp69HJ2Bz/SUUSbLS5qZrk0hIoA01D
 YXjPCVcylCJxbnt60tcgD0q8UkIwDlTSCXP2IpkWei1wKk7trEG8d/sybtzNu1ZeI+uegiIpHPI
 MmL9znyu1VRX2Y5i4tQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NSBTYWx0ZWRfX6kwNA7beYl5l
 6Er48OYYzMNLFmOUN4x+ATmwQ6kIpfGsukqLCDIYav4I8M8KfbPCCstms9jVNdLG2Z7I01p/lx4
 pashYqIQ1pDDtI32nLFUyIU7cjzIxOE=
X-Proofpoint-ORIG-GUID: kARukY1JU4I4STkBkdduyr46Lszq8uet
X-Proofpoint-GUID: kARukY1JU4I4STkBkdduyr46Lszq8uet
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb80a8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZdJ8wbgfcnfs_pdWuegA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040075


On Wed, 04 Nov 2026 12:00:06 +0530, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
> logic for freeing a DMA-coherent firmware memory region and loading
> firmware into it. Factor the shared logic into common helpers.
> 
> Patch 1 is a preparatory, no-functional-change rename of
> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
> is also used for the aux_uc region and the old name no longer
> reflects its purpose.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
      commit: 8a2640239052145072d1ee53d014b4a544b011b9
[2/2] wifi: ath12k: refactor m3 and aux_uc firmware memory handling
      commit: 5c8eab13e391aaabd5a1ad58f3ee4bb10ce7573e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

