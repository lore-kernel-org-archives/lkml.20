Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100574;
	b=fhAh1CykZdbzvr8Un4deUJoHRgbC2dxPZoW/IPNqE6IiN2uw4bRz8IRYOV0vKZcvjefn
	 5/nmPmUmybuFjE3JjelIGvkTAIgHds5DI9lDLfbKiVA4McrKmXj2QFQT5WZAHgw2br8J4
	 NMa5PZDg5ghzS0NsMgQ65sP5pi9TC4IOwmAdZCTskWUAs2Uz+KJiror8/t50pIGadk2Ou
	 912ekeQ3zMsyCZxo7xGvJujxRaSokfpu7wCYKFHU4JeH1or7qY4wpfkS8q5QILaEFvY1E
	 O3U7EMO3dZfMSBjiwVxRP/YEKv2rl/Rwk8lx4lvND3usrJOb332D/8BvqQO8c00hn6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100574;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qw/kVnTqYvPCNUdSWLGnSSIvo05G/jn02YE3UUq/wv8=;
	b=lo1i5zPCIXsNHPgcBvuTWn8mbsGT+iMNd5flDjtayuPdysVS3Xn03aXZDkgu2IBXdTdJ
	 O+AB31lmxcNEq0nH5+9lD4qzxyyK6mTvuEkGtq7ou6FQkgIFgUFFWen1IkB3XZOO/c/54
	 YMLeOjtwzvErdOymnqYBkOAOWu0uuoS9HQaJDXiaw+jqwhKASy8mHzgDhMBD+XGEZyWRM
	 aCNyKgKfC9XVcpoFosD6vFz2l2a9ix7yNTvOWyOdfOOsqWjASrBfDnahaUZXD++GqOvG0
	 QT0j7+WmP0ngDeDZvt6mV0sUSOY0pfi+r+l4nWLUmh/F70XedTOMfLvQqJMKl4NHynQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwjsL7gV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j80wZfHZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741DC606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 741DC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwjsL7gV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j80wZfHZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeB8t3026383
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qw/kVnTqYvPCNUdSWLGnSS
	Ivo05G/jn02YE3UUq/wv8=; b=AwjsL7gVwXS9nxOp6JytO8ylRFkSBXiQRBm01S
	v6rsWRTkNN0xsx3Oc5t1XzHz9QPMvld660VETIAQ/pBXvPw+ZfCFhtDaVRSPRRG+
	W7tIpw4mbr6C8g9jZGhnEcRSDcCzI380JaL5ZU4WoyxsVnT/X3u3ZREHjQ27rVUh
	/YQ1FEKxlbUHb9e5+d1WItGV5sNzCcivNIUjUzxKEoqtDix/KLOcMQof1ut/nwZ9
	CVRkd6IKywVf2S9ON0msAjz1TaegYz4wVi6HGGVEq/fVJh96MbehHhCSLjlCsOvh
	35xSMrTvQ2I6yU7c5THGYeoGbAJD2hJnspHUxclzUM7UQzEw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a7h0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:29:33 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6dd1142710fso7316451eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100573; x=1793705373; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qw/kVnTqYvPCNUdSWLGnSSIvo05G/jn02YE3UUq/wv8=;
        b=j80wZfHZaVjgq0zMwgAMWNHZ1pjgFL9ohI7r1ptGxy77wBM8byVfOJH+2hBJSkmH6N
         ryRsX4P/3hGvGEZOGHREyjgmBaTtws10vWDgXbC6K+C5I7nFwpGNbyEGp3eUzSgIHIr9
         J9yirjMk02wce/2JQ0X7Eklw40ERdoxMiuAfJWgNmJ0g6G/zFnZtJayngYF0fH56fgqS
         acqkmoSnezc9pZ6m6egMVH1g3KO9P1s3IUldCDJ5ExUvwF7QVexpaxVrgNxl0pTSG2gx
         eENzpAHwDnQRl2IpAEpCWJliEbWADFCpAOZf3i2QasWg54/ydI5cgTvGW32Ve4gUkJBr
         UpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100573; x=1793705373;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qw/kVnTqYvPCNUdSWLGnSSIvo05G/jn02YE3UUq/wv8=;
        b=rlWbVru1pOjv+rU6EVRPjw8iKpp+oI8PBQbC/M2xa/04oBG1ttT9yNwMHYIDOG8M6U
         yQ16dyq5dyTZrAeAObjQoMErAnMsnZM62kIVqcxyTstiJA57Z7B5CEDiRxmvCaILa9j2
         gh/L7mEjtO/5SDAWwSeyXRvdU4q8GvOSdME46Ca+FQ6VOUSmlOkivhQQAO8+C8cT1fnU
         ADqbsLNmqezzNl9VFFw0gOf2D/oSSQoFxzNFTZj8IjCa9A3szVnbcCR77WWlrBbNclqF
         OZH6qOm3ulIG7yQWo8nNcFxV180lK74k0jlkzvY3cLRhMt48HAw2E0QriZuPfS0EOXXR
         NPhQ==
X-Forwarded-Encrypted: i=1; AKwUvByphMmPQ196Rv7GNx1nQ+WTaop3dyOk7aSu7ace7fdKLpu/Rg75Es+AzPpQVWiGjiZkwzfKu+CDI1VcR9k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbFneEHpaQGbnZsPFoV1bMYZzjRmNJj7K7IPI/4RNkMuPLaVt6
	ljycsHhOQGqhGd3SnUWyx0kNi3LCyqbzo0SoMAutCJlukPlrLDYpXzwNs8+zlgNan+iljv6aW4y
	had3xl5mZFn9IywGP4gmQWiDdWgiZt42iA8yjerB4Q6IP5uimXUWZAV4J2W48a9npKp8=
X-Gm-Gg: AYBFou3YEdoC6hvyRzQxChlQh2In5ECXzzItNUsRNacpihX+JLK/UOoY1Jmm9SEbICx
	ITW+bZmdXSrJQYtlaCwNVvGmKA4x+XXSU6SDAWx1CzFH6Czo72ZdNj2V5PTHnYm1gO5hbI2ETlN
	hTN61Lz8Y0LrE56qjUsi9n/6tz6wKaToLZwzZnH5y7XCnVyz28HKj+ftDemUEb97J/QBIWca7PN
	4KCEmBrQyKSWeS+R69dimBoNpuPOY8TGtSklkqMQfHHCJBv+1OnwSq4caKtnWsFltmsG1y+fVFQ
	XxUPV6N0i88yZqd5yF+UUM81kmt7QbWt6MdFe4AU8GrcwwZsw8lS5sAvCPcfDvNCuEhTwIqCVmS
	ygU3FphJxcAIuu4X0j8SlhViYzWUymDvZf9h+h1PSGX2TyQsYsO2CYzQrEhB0u34=
X-Received: by 2002:a05:6820:c44a:10b0:70a:6888:228f with SMTP id 006d021491bc7-70ba0b235a1mr3917539eaf.4.1793100572794;
        Tue, 27 Oct 2026 04:29:32 -0700 (PDT)
X-Received: by 2002:a05:6820:c44a:10b0:70a:6888:228f with SMTP id 006d021491bc7-70ba0b235a1mr3917530eaf.4.1793100572373;
        Tue, 27 Oct 2026 04:29:32 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70bfa90c943sm6842017eaf.3.2026.10.27.04.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:29:32 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 04:29:30 -0700
Subject: [PATCH] platform/surface: aggregator_registry: Fix Surface Laptop
 8th Edition compatible
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
Message-Id: <20261027-surface-laptop-8-sam-compatible-v1-1-022cc782b0f4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABmL4GoC/yXNQQqDMBBA0avIrDugEUzpVUoXk2Rsp6gJmSgF8
 e5N7fJt/t9BOQsr3JodMm+iEpeK7tKAf9HyZJRQDaY1Q9cai7rmkTzjRKnEhFdUmtHHOVERNzE
 S2T44tmxCD7WSMo/yOQ/3x9+6ujf78svCcXwBEYWaBIMAAAA=
X-Change-ID: 20261027-surface-laptop-8-sam-compatible-aa73dbe7e2d3
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793100571; l=1792;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=exY+XT4jcML8yeOJ/NU2apc7tmgTbMHN4LZkL2zJSgE=;
 b=uuDDETTvgnen7FfmAIg10mj1MiLjrWCLWhDbmfODAaC9TEUdx3t/N4ah4lOGSaIHW/rUpOx2F
 j6q6bLYF2ysCnQZy/ZStwE0QslZmGWZVELw8P25Ui9qBkp4cgr9TtQA
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: -7ymHvh3DwD27f1ygtFfPiY5h770eCun
X-Proofpoint-GUID: -7ymHvh3DwD27f1ygtFfPiY5h770eCun
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08b1d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B4T17I3tjnCV4kOYBvQA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX6r/b9TEezBhU
 Iemg+TBxg1MSUtPsBfzBI/W9w+oREULHpNsdz9fwneoXZjAdWMqAzL/RtlMU1FTn6jQQCxYOrHF
 wv104McJlgykJWFRMPjlObhD3KfCF3hVJjACxSDnH5WeXjLrcTHesDt6zC4yfVUdQth5oj5ovYN
 I1zkxLNKpAe6ssZgV2P/skSIGnO7B+tqjbqGQHxQf3Y4yn5GObgJfNbY79rBSv/zD1SeBktwZUi
 4wfTwcB5oDqw8VAFMuz+j/ll8LlFr5ktac57Cbg1EjAhe7cLlITzhmmZLtAHobObAw+vhVcCeEV
 qx0XdkjjfaUEuzAabHWjdQlGSSPw5bt6oOnq666GsrZ9VxHTWrw/C5ZPGFqLKXB08KceIWFBau/
 KYy7qJygrgyDdVqcIUHV1H/VwgZ+bAingRXp4vCIpcxizRyV8UtpSbw8yuufq//Hi15JAxhi2SM
 14b+3vXmlekNYt9dU7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXwmaNGjyTidKp
 V/n1HsOr4B7oT9fSh91XSadpvdQvf5fnz4hTaC2qwviY3P6MjafYRdc+x3qdRjYIDKnYTGcEfY+
 3GokrL2cI+kjn2nvZvF+FrBxcCvvo38=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

The Surface Laptop 13.8" 8th Edition was renamed from
microsoft,surface-laptop-8-13in to microsoft,surface-laptop-8-13p8
during review of the DT bindings, after the registry entry had already
been applied with the old name. "13in" would also clash with the 13"
model, which is a different board.

Match the new compatible so the SAM client devices (keyboard, fan,
platform profile) are registered on this board.

Fixes: e93536b1fcf7 ("platform/surface: aggregator_registry: Add Surface Laptop 8th Edition")
Link: https://lore.kernel.org/all/20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com/
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index cf3ae252b1c4..9852d9e67d3b 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -518,7 +518,7 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
 	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },
 	/* Surface Laptop 8th Edition (13.8") */
-	{ .compatible = "microsoft,surface-laptop-8-13in", (void *)ssam_node_group_sl7 },
+	{ .compatible = "microsoft,surface-laptop-8-13p8", (void *)ssam_node_group_sl7 },
 	{ },
 };
 

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261027-surface-laptop-8-sam-compatible-aa73dbe7e2d3

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

