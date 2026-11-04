Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754659;
	b=GexHJOAoJHjsys6NnJwtCklw6Pm6SF1k2y/CjvF7SX/BKt5dnO/8ZfPfOlY8DdBHDlCH
	 7DkffwWTuRs95qCuUjoUSKq+nKUQLkl5VA6EV16QajSg34vMWLcalwsqhXjFePeGG8KO4
	 FHeun0LOoEk9LiFDudOz7orYS94tY5uAGyJ+ekOXiiXoyiBdT1sCqhcu97IQb9mCcysQS
	 NZh2s3edOGRZSri/3H8Avj3TjoJUxG8SvGsdHLY7cODeY0N75KJdkW/bBE0CFRUU+Bu6L
	 YUKgCaihcEIrdcarbmvso82KK1fuD1eYU3PGpjvN2V2gup9dUqVkQ009JMq5x4I8aRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YDVv49g5wGDYW/TBym1xJdEIpdUnM9Rdd3PxpMX4Lfc=;
	b=KwUt12sULtEihEPbmnSw+D344zHzkOL8KPtO4/cCjmVATMGR4wclNmO3BZOvZcOlDTqI
	 M0dW1bu+LzOR49AMpr08a6gN1SMztZ+5yOuSy3pLu5FQBCs5ZeVcPHMM0VGvIFiE4OAn/
	 JNfcqlm4YhIzYXytWmmMaE+xRuV6jLAxlGP6Pxvj5dBmla6g3SfcmV+DK+fpGa+U1vRPo
	 TTY4OP9zoxI+E5O/z2WTN7fDo5XMUQ/pCafA41YhYDkUOMYIiyCJuXBbPswVITAaGTipp
	 e227I/vRbVBmS1sqLCUf/90fsiPXW9z8NnhbS0RptRpnLVg3GdWk4q2FrNbP9c/hJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="af02gw/w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXqR0JfQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E3F606D823
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E3F606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=af02gw/w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXqR0JfQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RQIZ3335539
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDVv49g5wGDYW/TBym1xJdEIpdUnM9Rdd3PxpMX4Lfc=; b=af02gw/wUjXeLYGD
	H9qVGJJmul9JI+H6epG011kSXd1QEptcw/8uzFb+48xFc+prqWnUNJ6gv3tHBHoB
	zUOQQt5qgQ4Plv7nFZZwp7grY/hepLBXbzEUgWtDhyKxBgo1O8ErvY9ZjstEiTM9
	zeroM+r6QZn+ggFLJ9H0d4MTmSoOxaMhJQ/MZzltbK55dHtI4+dILSCHLzfTGP0W
	FiKwota60tMNgAR+MWNDeEcoPlkc3N5RNCKJak3S+YzKq3+SdJn+UsuUJg4QyIZc
	cVBtOp5QmdJQoJNSmHSOMWR5BLzYq9qtZbCMwsvBs2nW1KolWp+uhK8EYebNUruy
	CTVtgw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbsf9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:10:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a1e2485fdso261737eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754652; x=1794359452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDVv49g5wGDYW/TBym1xJdEIpdUnM9Rdd3PxpMX4Lfc=;
        b=NXqR0JfQRnL0n25MLtVgb3loPnEbdXwVOoDh0sBm0FeLyWWsKzzHDdlJIUCJMTM86r
         lE/AwbwIueLUEvnqka+ghcxIDCIHO5bkD5wgeSFM1uGk2rDTGK8jfgDLUex7khTeM2ES
         f3e0thrT0V4ctCdAFU+kUyLmjmGC/wGO1O8nr78SdWC3n2qabIi/p4kXHBSdyXV0SmVD
         XS3fdizRjQS8lNk6k/+dX30+K8CMqc/xqiTw2CcJ1xwDyimNhHQd9SFz4KCscNk4QsQ7
         kdRE6cS6b/mhr9Oe98aBhV7UAx3tBw+VABLpOYGTvr50glmWjH6yH1uNz4fpwFoNHRwQ
         9nAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754652; x=1794359452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDVv49g5wGDYW/TBym1xJdEIpdUnM9Rdd3PxpMX4Lfc=;
        b=gGbpOiRmzIGvhFADGXM3eAs7/rxy4yEeGRarMrr9RlVlf/kagyldv1dApY3gqaSAad
         6vrLDaob+QSLLmAixe/ZAxG50eDezI44WMuUnw+WXvT/LsVaAdd+7JMnh/7A+IKOe/ZI
         MY3H3QEqAISWUZV4Z/HXicu+paWewfrFJI3Ou2abjJ2J0H8AQeOt5ZSCCdc7IVhJqadX
         RIjgK4Wmj798AY/ExMA5Harpkw6MVPM7OvuA+JNhxz4vYkyfwJm5DKXFpi8F1wmeJp1p
         V4snX59XRpvSVRdBceQsyTt8RG2K4AVpNeu1mk+0JOSLua/jY4pAmTPajTzK3kly/N9O
         fTxg==
X-Forwarded-Encrypted: i=1; AKwUvBwOlj1E9aCAj29/6nIyIR3g8LQyxOy9OR988ns5aKpD+P8mFHyw5kwcK+i+MsFBzrzF6qBeAlu/CYPxwy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Gt1VE64yWT1rtYrmUQVPV1HkirTn6MLIgyBfKPutI+zm4o3e2
	Ly+hgyVVy3JTQ4aKh2mPHiZe035DFQLBs1RY9FCJmAhsITVb/oj+ey4BfBa2OOrfcPBitwt8vKD
	LXvcBahBZqHnQtBzNzKuLkWv4zkIc8XyAqeJmpM9UlbuV3DVMwhfQDt3LXPZ8QLXMAaQ=
X-Gm-Gg: AYBFou2gbP/zMUpjknPym16n6qBH4HjKFe1bGcGWsJo6UDxTKm9gVVWnDhVtzeP0QDR
	R4riayx08mtXKaUSisxlVzOOVMkcFOvxVVxNBisxnLJOQLm3YV5T7IHHPzOlVOK3vm+LljxyWoH
	YVicjbccjgegp64JIsf3+kBJva/7nIfLmruqL7ghjuvxCJjR5fmUOvt6KlhVKe5U1TTFF+HaVTW
	QDZHLossbIQVzW5sbXHf4XbyJx/QV1ozmWGh2ZD6ozJ16Ux10zNSTf/sE6ujaRkA4NHC7/zcjh8
	VZ0UvgPvviDsp3YmBhF0zih7RcYDN0PEsWs4DDJYnOlm9n0wv+6+wgXSQO10p5QdWIlizTSVagC
	15OeuY8cBT/xqAWdSK12h+8vPljdHUczDg+rEJXfKN8zciNvC0iVU9fwfHDuRU6lIeYNZzx5UkY
	DdhKmhGvNkvykFYN80/HmPO3MZ6/BEoqLNVMBr
X-Received: by 2002:a05:7301:152e:b0:366:83dd:4713 with SMTP id 5a478bee46e88-36a4249ba39mr19452026eec.30.1793754651560;
        Tue, 03 Nov 2026 17:10:51 -0800 (PST)
X-Received: by 2002:a05:7301:152e:b0:366:83dd:4713 with SMTP id 5a478bee46e88-36a4249ba39mr19452000eec.30.1793754651063;
        Tue, 03 Nov 2026 17:10:51 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:50 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:48 -0800
Subject: [PATCH ath-next v3 05/13] wifi: ath12k: ng: log successful RX TID
 queue updates
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-5-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: A70oNorKRzfVbOZ1lcZtZfzaT02ZVLjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX5JBK/8iOK7I+
 JLY/zl9KniItlDExRjb6yYFiNZPGc1h5x2JYcnx1JoCaAmaOlMqrhxGV0NMCVwrYGcxUgrJctbm
 iq1ilcc48YU1NlXyglI4KrAvIqEobX8pgs89xiNz8DxscSP9rBLdp/YDkE+kooN28xgB4KRADtf
 IG9we0544VvSMDFQi1WVhksJqSvIn01FegFPOvOyrKTIrI3SDewpLHwRkKFtCdMb7agtnbItzEx
 EDnVkZBCAuyHdLTXu1Dbdxqzv8SxGKTpOKUw0bi5fzTTXjiJI/bj+f7xrODjp/253pVW8KiROcE
 MP/9b92CmJkY1DcaTWwyzwCOBprNYSbKfiREyeV7x7W60hfIuCjyhc8xRQXR7Ga6zaAHvQcZJvP
 vWr38yPlv3PgDJ6pS3qwePGQCf9i1EoRNy+UebkM6XJHU1YX0wlUmjAud8Pkg2LGdcxlaZP3rlY
 Z/6Qd1td4VYk+oO32iA==
X-Proofpoint-ORIG-GUID: A70oNorKRzfVbOZ1lcZtZfzaT02ZVLjo
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea861c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YHCRzYEaldKETWWiAM4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfXxjK8LQT3cv2M
 tNJ63gK+f8jTqzKL++uOYXfEGmw5EM2P6Fw4nJGHMSoG+S8/2GCBcpaZsoG0nRLcuAhh6SljwEf
 6XkB3gTHcu59/nj8wSMyJBdrM+pXfwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004

Log the peer, TID, link ID and BA window after a REO update RX
queue command succeeds. The message helps verify the programmed RX
reorder state when debugging aggregation setup.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k
Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 379b33fc8029..7d196e85f280 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -233,6 +233,11 @@ int ath12k_wifi7_peer_rx_tid_reo_update(struct ath12k_dp *dp,
 
 	rx_tid->ba_win_sz = ba_win_sz;
 
+	ath12k_dbg(ab, ATH12K_DBG_DP_RX,
+		   "rx tid queue update successful for tid: %u, peer_id: %d, peer: %pM, link_id: %u ba_win_sz: %u\n",
+		   rx_tid->tid, peer->peer_id, peer->addr, peer->link_id,
+		   rx_tid->ba_win_sz);
+
 	return 0;
 }
 

-- 
2.43.0

