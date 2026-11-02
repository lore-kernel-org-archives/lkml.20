Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634423;
	b=QH5gvIsXIn8xZm8fa74/mxDvidFpZR7bw4vdAy8V1ZmK3Np3b//7jZOdixmtK57Bh7EH
	 BM+Dr06a8OoX17E/hZJca8Oa3Fm8XXlxK6c4GZ6bBhz4yks8OC1ijZP++D+F5hIfztvgi
	 PUXpOo5v21PJkw5uuhZ7at7p9siK4SrOJlHVuN9WQaCkvdMo3DGyaqLLf2Mwh+ACgBLDf
	 zIl3dYsW35OIKcw77B2stYTz6aF1hL+riICtmk7uDJ0v2pJs0QLTZxRupe+dGqKc/4DwC
	 6wfQXV1nu577HOVXkiUVjIAttK6YrtiBJBklmvfhjvLXsK6rxc4n/uRJtzLQNZ8+HSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634423;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qvxyFfT+1WtcGMNXj2kJ54v/fT1oTx7k4iipSG48O6Q=;
	b=D9/6O4WAtROiu/pInPBf/IHSa5tHoTonUqERe/VJgxje3X2XAY1KDqODJngseHYTPX/b
	 UF7jE3JnP7N7PemuFcKmENzAH7KVCzL51gUpLRSeDB0ot1kKURWJEzpp6smj3dDqBjC3+
	 HEr0hK6gK+tQMU8H0F14qWYALsFrK7wXtYk0eeT9hR+7QA9Dk9r+ETRH0YWZyMYGdQh+u
	 roxFc7QhogbR6A3tb6jsKbz8lH37+Zezf5j/T4pDkAWZEGUrX0x3crynS7m5Zi/FA2Axz
	 X8MBYP+B4SZJdiZTVANnsp0XxQ8527vuh2x1G7pHds3qx1C61fRGWZczq+cru/Eu+Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PvOv0C49;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYiBPTYR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6507606E01C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6507606E01C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PvOv0C49;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYiBPTYR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Dp6pP894117
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qvxyFfT+1WtcGMNXj2kJ54
	v/fT1oTx7k4iipSG48O6Q=; b=PvOv0C49IDBAtPciWNGjrm5Uf1qGrFsXMrYQrA
	vaPBPJY0CnD94OePY3ChK9jQ6QbpX2b8LGzyzb3UzxQZ/DWMYJpwFRsD+Mxlxkon
	STuU3vReHljBTPoTUpPnnlqP9FK7AcR7/VuRit0ONZI9fLa5U29kaJAG2ABfcIwe
	qF/nBtOlvbwBUpr2B1Bx5r7CWmc8e5EGiL7CHkpN+k24tv+ssUcFOZ/CGJEASI3p
	78PpbeKMisrmWdJMEpemmbFp0vqAD5cciSF8huHi9pGNzF6eZ3GzcFjnFEh24LcN
	XHy2BVZnGW+8vGdG39JkMfdbhmSX+RLWKAUfMfeaAJOSW7lg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvsm19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:47:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so274224685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634421; x=1794239221; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qvxyFfT+1WtcGMNXj2kJ54v/fT1oTx7k4iipSG48O6Q=;
        b=WYiBPTYRaBZEU1Pfo3wd6dGxK7ocF43/6hpcZ/jvhv2dSSIX83a87zhEnGN5PDY7Db
         5FXWJUNFnr1GasHqbnRHNgYPZqBcP7IOu9P0jFOSG4EQFEKRTAzBckBOV6sqbXOd9qqT
         R3+AimkutQbkfu8RVrNEOFG18e5Rm8qciKVsNyhx4IdzCXwrmdpYXD75+Spgv3PELFQS
         GsSU/nszE0tX9mLBW6Xh1Rt3wIRwyJ2G7K0GTS6pGqm0FA8fEma+BXvx8EimBvYJZDQG
         SyQCUtVchouha1JEWx8qWWj5cR5GiEjfIoDceGOBfXKFy38ICHe54k2rWY7ni6zLVCDH
         +YOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634421; x=1794239221;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qvxyFfT+1WtcGMNXj2kJ54v/fT1oTx7k4iipSG48O6Q=;
        b=f5h/tnbXO9Gx79uj9aswpwO+poUPGy07nD0z2rjyVHVg34hX5Sj7YwkAWK4CFOwlzd
         wG/NzI3gJiIh+sZKABN1LZdoOyk7wl5i6h9y7VhK3wmLlH1YQ5mhA0RXINdo74l6zyid
         4O8fhoF0m2OfmzcKLBKlxjMQlMCn3xB0QP2l6ge9Rliq9JX5Ew//DWeQiwFMS1pVkVHf
         o6rD/aML90qYn2tQE03fEO04HNQ4IRypfZYEroOAAD+4iX7mMjyOds9dFSPSYyPVU3mF
         5TiEy0PlMhTfMFjvQDe4ExbpqRNiNk/Smw/InX3734EkBS4XtVFZJ5R5JazEHh85iVXh
         L5DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXTN8thmXmb8tOQ0VeAzDTAZ6uEg8+hFubt2/EVynbLfKWrsAEqiuxWJAZGC9y6bB7VemC6D/2WbF9/yM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUipKppG0dGM4m/vDTEi9YLv09v4+gclTx5SRxJHGLdoA+6nmX
	d7yHjh4U3ZKlojXFUFof7Lngf1b3MOWj2vC+dSatcCiHsa2mbMtrPGpa5nX7+2WgOHIR69/RLyK
	uy5jWwW88sUEEoR5SXxk2rLwEmNf6ene54+VaTa0RvFQwfOo7/FwOgduodkyXTPtGT1M=
X-Gm-Gg: AYBFou2B3T7yt3zB9TGeinhEDSqJP/K8RDh5bZpL2yPWhKdA7DhPnOq/Ji9V5B8EEoK
	lD/FlELsZ9DepYb+xh/RUa0kBE/Fzfk5VFyf8etbQUXGjNPIohnMvxOnliS+MWxbBKZS6vkzh6+
	rRsQVAzonpe5vV9MQjg/HjeEwY9REF5OBqlXHzTo4Qbkr9MGLGkIjzvnbxDlDdIaMW66hQImMhv
	SQkj6UtpeX2zwHXku/yGO29Y6C6I7rLyy63tb3c7lixvsNt8YLCFwzrKSFPqDwWt3SYTMPKRksK
	mI/Kxw7x8nuguIoKuw+5rgPkxo8GTc82tbxwteAv/0izAKj0hDa1jEH/7uNlWtwAVLF25yXkSNx
	7SYL4rDwCqlNuJXtpE9MhKrl82KjKMuGQ3hJAAvtWugGXfFYMMDySRKLYoA==
X-Received: by 2002:a05:620a:649a:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-9442174f31dmr1616364085a.57.1793634420974;
        Mon, 02 Nov 2026 07:47:00 -0800 (PST)
X-Received: by 2002:a05:620a:649a:b0:93f:ca9:3ee7 with SMTP id af79cd13be357-9442174f31dmr1616358385a.57.1793634420218;
        Mon, 02 Nov 2026 07:47:00 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm398196295e9.11.2026.11.02.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:46:59 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 17:46:56 +0200
Subject: [PATCH] spmi: pmic-arb: Fix the driver data used by non-data
 commands
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
Message-Id: <20261102-spmi-pmic-arb-cmd-drvdata-v1-1-2e5ec8035b85@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG+w6GoC/yXMQQqDQAyF4atI1gZmRhDtVYqLOBNrBK0kVgri3
 R3bxVt8i/cfYKzCBo/iAOVdTN5Lhi8LiCMtL0ZJ2RBcqL13AW2dBfMikvYY54RJ90Qb4cAtea5
 c4+oK8n9VHuT7az+7v+3TTxy3OwjneQGcIRYPfQAAAA==
X-Change-ID: 20261102-spmi-pmic-arb-cmd-drvdata-fe9a1e308063
To: Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dan Carpenter <error27@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=T7kfTC58UyyOEU3z+I6l/tcxF+983zx+bMBW6NyeQFo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6LBx6ofZLDC4wtLxTu08yJE+9/KZRYfs2i5tV
 BeyyszFsC6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauiwcQAKCRAbX0TJAJUV
 VltHEADHHunqw9s84JXtkoZ70RQ1HUgKC/k4wwLt2i8o572POqM86BX5Y3Yph4m5QjG17c9TGsF
 6m0nuPyhrzHf25bFoXMWKoHi8Lo6VKqpYjtvNDoU7kcO89P8gpdsGCJ+/73XEXarCHf2FmvmXZV
 8A81dJ1tY8afP2G0nvCOTdVrsJfhlkvyWwsVxkk3gX+paYLl9ISGpg68qPIeGO9uSXxRWkSmChi
 dpCojTAbm1H9hMeQ6/bmL1zMOc+LWTGkjBTYgs2xSDLy9LjPxmBizZ5TISgvTj7dkYtfw8LERsz
 QGYTqb4qyP3al3jpvcfT2gbVGDLgXsRyH74QBVzdkSV2WcAuDBL4vd+t/bco1gC8hJLxMWx7KjA
 tmRnecQ4dI66M+H/eaD0TILgnuMeRWYIAFdRc/566dkfDSKViw/XiRIJnn265Jpcu0YKNaF4IKI
 Xc+IiAQle9Grj43Gi2W2EgeNi+jIZ/oRS5IcRvNIWT+tDUgkriLbN26w9yEdHhdzDuHfkQs7A2B
 uYfc4uKNDAnvmm5l0hjYnH51lCLuUEKazz7RlTIB8Hck2KOu0phvexIdCM4oj5lsRV4D7tihpXf
 wmQ4kaOwd3CuLd4Orzxe8qeJY9dqi39qx0v8yLrT4jMVWawOVHD3X8BaEKy2b2vc6olxLGCspv1
 pLmOhctgvhScp0A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae8b076 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SMQwI9SyXOPf9XZ8ltwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: EzOW9BV2I4ZiAnqY0p05RW6LyI75QNm0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX3JFZU3MR5PcF
 KXxXgxlA7ghsDjuNCjj88NJZQsocXfSOI0kFIOjjgS/fIeN9/noYZrMF6TYLPAMSvHS94R25CKW
 6vzh0i+LLoHp+5JgumUAoRpmYs56FcU=
X-Proofpoint-ORIG-GUID: EzOW9BV2I4ZiAnqY0p05RW6LyI75QNm0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX2QTphPWjFInt
 Hs6UYP96i9f7qiLmZ7oTJfTCapTERUOFbKu5/IbY3ILPSgKy9iT0VjYPFHuYigsYGszROJ84UNj
 j4Hayo7JDGCAIY7LsV4mmAwiPRvDB630igW1ld0pg3Wf6SEIuG7gCucMsr7G9TSBe2Ed9QGc5Uo
 MwY3xtWfrVYIajUWzzFj9LZPl3/QkOz8GHq4/jQNmYzPChi/ILLhlLNdc7YbunoEtGY7YEvpDzx
 xg8QYj4aShTsg6Iz4jzbKCz8z+xvQHIENJ3+XWuf7cYmkt7n047b21kzOYNCJto2RFPPCVDs03m
 ohjEW/1++Y0lYgdAxxWHxkiZpnrA7A2CeEQAnHxQe6VJgMtGWjfw/2d755S8K6rhIQNgHnpHrqj
 C8VLSxPkTAZGF6RsREM2gbnxoeb2TTogZKb9j8Xs4iTTWdvpBAXj3tbsiF4lIfNOEBbXQukZaQt
 /T2I2nmaLTiv/4tZB3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020062

Since commit 02922ccbb330 ("spmi: pmic-arb: Register controller for bus
instead of arbiter"), the driver data of each SPMI controller is a
struct spmi_pmic_arb_bus, which points to the arbiter. pmic_arb_cmd()
was not converted along with the other controller callbacks and still
takes the driver data for the arbiter itself, so a non-data command
reads ver_ops from the wrong structure and calls through a bogus
pointer.

No in-tree driver sends non-data commands at the moment, which is why
this has gone unnoticed, but spmi_command_reset() and friends are
exported for any SPMI client to use.

Get the arbiter through the bus, like the other callbacks do.

Fixes: 02922ccbb330 ("spmi: pmic-arb: Register controller for bus instead of arbiter")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-29e1d31a-8d20-42c9-a5b3-41a90553d799
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/spmi/spmi-pmic-arb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 402ffeaff8e2..9ce404ed5272 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -448,7 +448,8 @@ pmic_arb_non_data_cmd_v2(struct spmi_controller *ctrl, u8 opc, u8 sid)
 /* Non-data command */
 static int pmic_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
 {
-	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
+	struct spmi_pmic_arb_bus *bus = spmi_controller_get_drvdata(ctrl);
+	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
 
 	dev_dbg(&ctrl->dev, "cmd op:0x%x sid:%d\n", opc, sid);
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-spmi-pmic-arb-cmd-drvdata-fe9a1e308063

Best regards,
--  

Abel

