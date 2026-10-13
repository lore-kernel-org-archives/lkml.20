Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFE5397944
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881172; cv=none; b=slif5AGo2Ds/iaLmUauWwnea4nDNIq+B53pi+aUx8Ee3+3yIW4iGPew8QYul5cqgCbS8VbYKuNicOVgIEFXg6/Cm5wVtMftdBoBpdYtIl2Zq8y9VVLTFibAUXQx1OjKaUlOg84IR9+AjpQJgwCZ3+ZkdDMiooH8CXi8ctHAuzeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881172; c=relaxed/simple;
	bh=2+l0SnJ6xQbWmIt7CHKhLtT8Hjx827L4qCZBd+DMmbE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsoAoaWGpSK1wMlMep72wXON2x3310XeCD3b750pAI9LPodq63dgr6N/LE15s7CsVLrYHU1DN8m6osK3OtoD7CqlBi035g0MjKOkbJYinXKCs2RD8wgJP+1FIr8mSzdG8QkRrBn7lCELzIjWpPOfvpVp+CTBfgxQLeyX4Qml/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhE/ct0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rwje5vSc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhE/ct0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rwje5vSc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8V0hZ922844
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxnCH0NNfcKcGsDeYn21MBx17/efcxQrfrVWQPGiIVQ=; b=KhE/ct0opXgywKQF
	zc9DGwJVrVbYEoKdqAp29DikI3MOBwcyyKUiIoISqPSefq/Ju9sEMHFz7mKSRhTY
	S/ewT2kuej3w6UF+EsDs857gctQ3OjyUGwYvFWV3P5rNKJAdzcE5jF53piODgLMG
	zmWNZBpkDEL6CTjtKO17ZLy6P+ICwCOh4Y6BeaQyhmjT2/1RbHa4BnuFmXsv2srE
	UDTXVapAX6i9DRHLEceyman4Epgmm+gCil7kkxs7IhmV1xmJJJC8MbhQDxxYfBU4
	cabnedPnHFcG1qWFYv2ZpW2XLlkXlstppT2Vq4zL8H3I/olUhTScccYBH4wBQDvq
	WA40bA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1t0wp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:46:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-898fe16133eso2090930b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881170; x=1792485970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxnCH0NNfcKcGsDeYn21MBx17/efcxQrfrVWQPGiIVQ=;
        b=Rwje5vScCnqi+8CPiTCyqrKmd4KJIkWTKI5C+oP03IiFt5nFQzOe7qZtC9btZj+k35
         xX2efcPjwK/3z9qYG9X7PxC9MZlQ1WMh7M9dNOb734GxJz0vavcg1DarxtebKi4RBE5y
         BcQ/iRe9EAnz1itZH3KTYTx5aWKzSkp4eZtxbRkwusSXCajrXFyXhx8YQNGUcvNg3K50
         FIXJ02BB1ziZIHfdK+jsP7Q/PGu2uxI2IzzCj9wGk90PTRVgzD+r/rCN4GzRS7mkbCnb
         Z+PKfXDEQX9z0a1z3mgJr4MGQVQDki1ZWcVeZi8vypGS2Jymo9Q0w7ccbL7q3KlO3gk9
         MSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881170; x=1792485970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxnCH0NNfcKcGsDeYn21MBx17/efcxQrfrVWQPGiIVQ=;
        b=Lj6BfFoGqugL81fb9YaGdiHKbykD0IiZDouNmbEhWSTY15VcD4HyRvtSSNBJolvH4+
         FJiNPoMDaic6QnM9tZVSghl7sqnuU7bNSGIiqLMY7QOSc6KIeP4BRUDaaiPSPHFrFZwB
         4191bOdZ0FAm/6a5J0rZ6MEDIDv7gtf5oyABqOJxA40AtJ1Of4O34LfK6oThtjBWgEga
         ZLnUwb/NZHn+2O/APRtCNHaqETuhjIYc3oz6ivQmOHravTQV2c4mE9vC9PWBW4CjVMkT
         4m2BUeJcSnMsy1BC6uR3M1fqyOsy5i1SnfeQXhdbsulUM4zxtb4aFjcFoWahpGzthDHS
         yuaA==
X-Forwarded-Encrypted: i=1; AKwUvBz0MB19XPxDQ4+ROwgevK+nKF/KxOyl/aPHbxJTYvOviKok006VJhyR4QF5Qd3El9mF7IFt92cw3r80bKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKS1OGqDgpjj7TumYfTdL4LBqfH9hkmj5HRRhhx2tfpFocdLlJT
	3hWVe2AN2Gj0SENjG0C1vbO40ebVlyJL3+YhgLJ8m73QQGrN00Fmw00z2DYF+OrCDYFSExvZ150
	fLiucZn9kIFX7P5uDMCR6G+sexFXSQ564n6/8iR/l6Hmtxwy7BxEPG3kATdZooWqkFOg=
X-Gm-Gg: AYBFou318K3N6DCeqrNUT1jnB92YYQ+lTXBKdjXB5y8OUVjaxRAZbCb/hqramq1W3TO
	vXTw25nqM5q/8TqweCFsbfQRra42Jj7TsQNTV3tpn+E+1VEz/L1nIfIUnmNFVin2UE+VIhng0UU
	BK5MzgB+AIChIRSM4gjOQTXfJtZbECeB537I/KIBve3poqIineoAhfYL+JKoxE5whGgYITeVXq0
	E8I6x1whOCKUA0olJ3Q8OAbZKVZrumle5myLI7QRsmAWwy9sJC8IPrWbEYgKEXfk6XPKoySCyEl
	CZWn+mSMGyIU73rx7zVVtv0QYrKN9REyJIrT2q42OD1SVUpX4k25q3Jztc+eDxmoKzvMXPhOF9w
	EzreM4l/dXbjyuD24IDjCdHgjfwSp
X-Received: by 2002:a05:6a21:a4c9:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3e16c052430mr9179232637.53.1791881170178;
        Tue, 13 Oct 2026 01:46:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:a4c9:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3e16c052430mr9179215637.53.1791881169627;
        Tue, 13 Oct 2026 01:46:09 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm5384721a12.31.2026.10.13.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:46:07 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:15:36 +0530
Subject: [PATCH v9 5/7] bus: mhi: Load DDR training data using device
 serial number
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sahara_protocol_new_v2-v9-5-dc9f24357c4a@oss.qualcomm.com>
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791881139; l=2312;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=2+l0SnJ6xQbWmIt7CHKhLtT8Hjx827L4qCZBd+DMmbE=;
 b=HnyiFaueBTA9ATyK3dZXMfV2qee62iFqJG+G8cD7P1CuCfQJ+ClZ4AvpSZ0L1UuLOmrq5ceAB
 ADA5An6WtpHC0J7SJF1weIXvXe7vLzFi7gTZcnmhKd1n/BXCyjtx803
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6acdefd2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ICgrKnnyuXbdZ-Zkjz4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: MPVUDiUMzbc6rYmyG4xso-AXeAHThGgD
X-Proofpoint-ORIG-GUID: MPVUDiUMzbc6rYmyG4xso-AXeAHThGgD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX0MnQhhCC9lS6
 Dji5CNH7joycYFIe61o1vYa4Gj7JtC6Z3rC/FZYxb5gnXNlFFVmuuwkKilarlAxmWgLBOFlz4Z7
 ZzIU7xJ3zO68aZ+aHDnAVwwr/yQf5kU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX9MYfL0Nc4N+j
 Vm8bfrIG6lASmHWKZQ5BMpeOY5Nfdai+7NIQWT8vJ/m4jM+efm3l0V9qMu60J1QJJgwQIQFAgcy
 d/ksED5aM/Q1KEoBFEDYVs6C/g5HrjKMM1m/+QefER74aIiu/XPCdkaF5fV0EH6384+Fg3B5Ow6
 vOKcPitHDP14D7qzqUiVPtxMKnK0JlAmytSH3L3/fEq4yEbh2I8gW0yY+4R1G/c83X2KchXV7SX
 6F7NV2e9qqGvXXDWWbIkPzx9RS9QL6iLVNkT3h1nPoAZoCz4rgwv7zghqZ8KpYY8b0ppMEnfSYF
 BG2Bhl6o1fvXrfvbSDxq5I8+Wgbe/yaKZPunO7kvR+nzkesNqZa9en1edIXDxqYt0/5E/vkb03P
 QaNt/94owURrx6/QIYODyQIY23/TRStMAsXIQ5Pvgqk7nJmWV3CoPDZdYD0sXl5Q00hu8YsHceM
 O/RZO4slOukSrY5cO9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

Devices may provide device specific DDR training data that can be reused
across boot to avoid retraining and reduce boot time. The Sahara driver
currently always falls back to the default DDR training image, even when
serial specific training data is available.

Extend the firmware loading logic for the DDR training image to first
attempt loading a per-device image dervied from the device serial number.
If the serial-specific image is not present, fall back to the existing
default image, preserving current behavior.

This allows reuse of previously generated DDR training data when available,
while keeping the existing training flow unchanged for devices without
saved data or for all other firmware images.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/clients/sahara/sahara.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
index a4b3ef197b303cce5a36cbeda272119f0430e619..62b9c72e826801a77a321991f9bb91af37e0cc8c 100644
--- a/drivers/bus/mhi/host/clients/sahara/sahara.c
+++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
@@ -58,6 +58,7 @@
 #define SAHARA_RESET_LENGTH		0x8
 #define SAHARA_MEM_DEBUG64_LENGTH	0x18
 #define SAHARA_MEM_READ64_LENGTH	0x18
+#define SAHARA_DDR_TRAINING_IMG_ID	34
 
 struct sahara_packet {
 	__le32 cmd;
@@ -225,6 +226,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
 		return 0;
 	}
 
+	/* DDR training special case: Try per-serial number file first */
+	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
+		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
+
+		fw_path = kasprintf(GFP_KERNEL,
+				    "qcom/%s/mdmddr_0x%x.mbn",
+				    context->fw_folder, serial_num);
+		if (!fw_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&context->firmware,
+					      fw_path,
+					      &context->mhi_dev->dev);
+		kfree(fw_path);
+
+		if (!ret) {
+			context->active_image_id = image_id;
+			return 0;
+		}
+	}
+
 	/*
 	 * This image might be optional. The device may continue without it.
 	 * Only the device knows. Suppress error messages that could suggest an

-- 
2.34.1

