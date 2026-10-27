Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093900;
	b=VtYqtglUgAs/mLJmFT5khiGtMveRPgl6v82GOJNOJrbWzEW+6sxgPk51xf/bMhMuBNhf
	 +r9XM4zGanP1SL14PuHYEiZBoayPmB9b4b8G9GJg8KYs4Jbs6/dpb+oc5Tc8Wxqh5gBZE
	 CbEuEcCI8NI1syjNiVHhDOFX3037VlVEoQatTRtmpuirhOcrAbiHSCxlGbuwtg4PO0/yx
	 hu0hWZ0yYjmyDpw6u1iUfEpu2IDc8IJovCj70ZFI1A4Af2Ws7/C2Ka0woUwwGO9jifyCC
	 XXtq6U0saVznslWJl5DGUkMNjzsUjlr1VgnAN6TuvpYHAs+iP62OyPGbghVasIvfrtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UFkbhmoj5DEgqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=;
	b=mjR4qbgnVOc/auP/Sa97KvDJwmvHWJQtvbQINlliOEg62bKWQMF392A2N6cjR6Qfio/t
	 8PrTHqzq0gcPRXB238zdTJSdoCFsmdllEA9HYzPScNwd10KkynADFphDSfRp8TJWQ3v6T
	 KyZMN1IGE33Sc1U5GUxiOhWKV+tsUhdzMIn/4rnORMVKF0oy7oBs6khM5yWpDKy2ZrqPR
	 LfY5/mma5fIP4nJFr74BiLAjMsLyGjNzm3ezzDt2jSPCHSTsYC21aSP9QWA+zXUrBNksU
	 kRhSyfnad29zYieMJRVQPdz2K0KLU9m1SsI3GRil4z3HPi4MZpe6TagrvolvASBLAYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3dL54E3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCI8VJLI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF61606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF61606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N3dL54E3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TCI8VJLI
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gJN31162699
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UFkbhmoj5DE
	gqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=; b=N3dL54E34a4N3pgNAq9hH6E99zM
	C6L1/9505bXIrMx9d/qeq0RbbDo/RPxtNy58B/XtLDyfDQuNhFYzDc/xRau0G1cE
	Y/awqXkCMINsxfv6yXIB1v1BZvoYaZ128CxG1sRdt9AYtklbeXz+s9FLoYRw9Edo
	Nvla4urewjc3lelcOYcnvQCcg+MNqEWsxL+tGk9xB7UV5LTXz1mIFI4RVi5a8RDq
	KLZ1GyNPg2ifXlg6LVb9kvCg+zzeSbVypo0Ss9keI1BZfobxWJxYrPzLamQzOY4g
	0hKG6blk9bJpl8f8CesIoTUTlq4buo+ibOsFuRVbehFTYbM8177bLRUf15g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmaxkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so519569185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793093898; x=1793698698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFkbhmoj5DEgqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=;
        b=TCI8VJLIHh+B40XyQDFfNy07du1F7pWasolG8s4ybHRO0XjVUS68O5N91OMgt0LzC+
         bGaAlFobhGX1zhFN8ut3c7YGe2BvUxR8xkLKxONDAwiang6r/pb5ui9MX5rYshLa0jQh
         1nM+TGoiw/q4DxKTd8x7NDqtO+7F402qDhdSiOYGszdTRmJOsUtDoOkR8rMsXpgQTWoK
         QGU7B8oNqiA0oIvtUAEpW1kH/PJ+R6fRuqI9iya1i19sWDW1kr/6JNzPS2mGv8+ep8q3
         wjJPqQoifyYHc2nOOxU2XOsUSSv/Nu08YTNH1heMiHsXRCT7fSAbKU/d+3l/dkSVYm2D
         nHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093898; x=1793698698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UFkbhmoj5DEgqsYcXY+vyh4nwgONpGSbK7bxlUjEPGg=;
        b=0CfpgkXFykSAlDRtvcGJD0tS8tmogm+BbAYsCoWWChLKjA71cCzZ36WBlEzUK7+YtW
         mO0791/fymr9vQJSDOZs+SF82pw5JkN/Mh6oQOblVo5bvcPCin7WRgrCv4B88qmMUjT4
         tnWbb2Ix49/peKlOq1hpOb13ttZf17kqHT/LUKXR0XAl1XraVDEAOyzGDQPEPsijyONS
         Pt23YcP/2OcdVNyW7BTV8jNueGfQFXnzp3NvCyTr877jsu0hffhtbWP5mnRhQ6fpQN2N
         oVjY6xbA1oaUmIVYERBUv6YfukftdZ8VIcHpVApafOdP0xr6ikdWZDv+E2aXlnpc0qgk
         GlWw==
X-Forwarded-Encrypted: i=1; AKwUvBzT0k0uzRZoSNde0h9gmFHtqC8ZAGq7N18QXOFAKs7s+9/zT8RXiAkXxLn9AFeqgGWSaFZA693R1YQNFPY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvIi6sUt/AsR74qq5aHtrXhEyyzpTas6KQ9FyO6UwlpXZrna7y
	OGASCknnOE5PiLr9mZnOJrMLaKGM5ieGDiylilMHX4sht4whwN6kz9RetvYPczYw9j/MUy2Dcxc
	Ah0VrKleWU6IiyXKpRfUwoA+vnWWJfm+VsLjc8Xebf0PLqJtSTdQb3P7u+J6LsnYaHRo=
X-Gm-Gg: AYBFou0r5AHb4iU59zE5Acp4wHG0D8FDVc4YT0uA7fDOfqEgdea+npp8FCtASpcmVxF
	VaQFdZu4UaSFAdI+wmsyeDrAKzH/cC5b6oAO4jWEdnKTE8h6O0pHjM96TRkhoqwPkwMAW0/fYr7
	l1RYclJ6mcW+eolV9KPAsXdWtRnQhl2dUV3gui73s91e/9WcBkXqtTBJNIOZQhO/2YTKGZ/OW8x
	4JhAmm4nKP7YCdz/zxbUa9jGKh1MgrcPSe+61Pj8XdqHPPTPEvB1SQaLLuCzRuzHAJVAToLLVVH
	CEAResmTfjCJ5RJT/jSh4l2DJ1Xo6js6/cankeR22barfSKYgVtJ/O6n/D9iq382fVbVlvU2dU3
	syPiEAO19xwMoR5Vb9Z+GzEvc
X-Received: by 2002:a05:620a:4001:b0:93c:ca09:aa34 with SMTP id af79cd13be357-940ef955604mr1315272085a.46.1793093898013;
        Tue, 27 Oct 2026 02:38:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:93c:ca09:aa34 with SMTP id af79cd13be357-940ef955604mr1315269685a.46.1793093897466;
        Tue, 27 Oct 2026 02:38:17 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5822a7sm264678145e9.11.2026.10.27.02.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:38:16 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Tue, 27 Oct 2026 11:38:14 +0200
Message-Id: <20261027091922.3290180-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-2NoJEfH7cT1jwtHaeQW-__A7OeCJ2rY_j4f_65wHQM5A@mail.gmail.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com> <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com> <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org> <CAFEp6-2NoJEfH7cT1jwtHaeQW-__A7OeCJ2rY_j4f_65wHQM5A@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX55aRlXLGzwPV
 oKkEE4grb1EC4gIDTPz7W0jqBPjK8ugFHgJL4kOI74nLaOuBs7KGy0CrlMpZsgmaUCTzC401KzG
 KbPc/0T5Iw80v446txo49t+fS5E1lWM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX3JhD/5jnRPIM
 ZbWcUgEiHZTeI93gmTfPn+Lue43c5fKNfPKJSSb5gs39pJxtFxKcCYKYnkMH427/XwKDcekw5hv
 d+MdfAIKFnjLzoQJpf2W3/Glx/gywRZqMjB5eskclaTsRB1t8vnJap/GDNDQ1FTE2ribuvACQio
 lgeNM8biThhY7Hv0jAED2qF8E/2iGIYpvef99ebbiQBR+Bg6nC6xYbsf4NPHClEsKhMGOkBjYsw
 Zwf0Z1jgFaURBuHxIEyEgZmxOpjrl07On9+4pMaLw2YXMNcYLf0I6OkpxB/8JtucacBGQpxYlip
 4A4B2NXwHXWCB4KPuUdT4Rn+yOpXPQ9xkemMeKwWNqhj7khK1bz6zuoPi7N7FvNNEZJ/9nnsYjd
 Tyx60W0U60m3VCyNDpoIGTjZ+6Hf0oKoZ3W99inNXiVMbeagazan3DP5QaWkO8W4qvCDiMsi/lw
 ePMS1iepRswqrjR9vsw==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0710b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=-9N3Jim173-ToAEOIP4A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: qH4I8uuFtMIydFTGOQDNMyprAQEmrxYH
X-Proofpoint-GUID: qH4I8uuFtMIydFTGOQDNMyprAQEmrxYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270038

On Mon, Oct 26, 2026 at 4:24 PM Bryan O'Donoghue wrote:
> @Atanas could you keep -EINVAL for the VFE core clock and clamp only for
> the rest.

Will do. v4 follows your and Loic's comments: -EINVAL for the core
clock as before, the other clocks are clamped without a warning,
nothing else changes in this patch.

On Mon, Oct 26, 2026 at 4:43 PM Loic Poulain wrote:
> Yes, and we're adding one more in this series (AREG), so I saw this
> patch as a good opportunity to raise the issue and complain ;-)

Agreed. To be clear, the following does not affect v4, which stays
as above. It is only my view for a future CAMSS cleanup: the VFE
clocks are of three kinds, each with its own policy:

- own (vfeN, vfe_liteN): follow the pixel rate, a natural fit for OPP;
- internal (AREG, VFE AHB/AXI): not tied to the pixel rate, set as
  floors and aggregated by the clock framework;
- shared (camnoc_axi, GCC camera AXI): bandwidth driven, belong to
  interconnect votes next to icc_res_<soc>.

Today all three share one table and the policy is picked by name in
vfe_match_clock_names(), so every new clock needs another strcmp(),
and some listed rates are never applied.
Splitting the groups in the resource tables would make each policy
explicit and drop the name matching.

The enable order does not look deliberate either: camnoc_axi is first
on SDM845/SC7280, third on SM8250 and last on SM8550/SA8775P; vfe0 is
before cpas_vfe0 on SM8550 and after it on SA8775P.

Regards,
Atanas
