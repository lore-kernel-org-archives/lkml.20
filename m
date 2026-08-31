Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DAE3AFD0A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145319; cv=none; b=fvkYipDk7863NmTqGOd2WS8sEjwEqZq3gz79SzIFUxjHsR4CeCnLFDLZgydFqnAjLG2x9xf4YgeEwZC4bTtw5cGkWbmBKWYwI0GA8PZN01vorDwP8Q+VEi7B7d7MsxGqjzljYq+ULuv6NPIGiaJzf0eM41QlaEGM7AYj+RNlS40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145319; c=relaxed/simple;
	bh=nAVPYtVkkmUPMPzolZ4GiQCytUZdX/k5v26r2I/PRq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aihUFe8RZenvCN9MsNqrZjuQO8hEBvf5VGZuf+6+AiYUeHlqgShCSNTnhzXPbf3vJr1Xzh6su3PMNlSfutx3HCQmfdpTbcgBQeXNEuGMnNFPq4L+5ldG6bIfCEcBeFcD+CCcHVkuxrc9MlZEMU2bpjWKINTdPc6L8jxqnvHPecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cX6iZ+rG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cM9fi3aK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX6iZ+rG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cM9fi3aK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bgJV2587077
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8XJcp3X4Tby
	0WLraLkWLYA7pOP6v/I2LJsWbNkpbmuQ=; b=cX6iZ+rGEUcVwB++UydCp7M+0Zs
	UMHVIDWsgObvKAZ/r2jm7t2Vv5cR0SiFx3V5wHatefqeQR5PVKdwKDrsy3pTq+FS
	fqbtyQFnydbjGDl0h7kG1DesWuFvdrZqAfWeO4PJuqxRhKoJMAV2Djez5ujD0/+b
	JoaZw6dygO1ilT8jhOh6cs26NgdJpSH/0DWmZSafDV2YtcXBAltabDe+lCSwO0M6
	oqO65qXSbW4CJeEWOlqKZCUzbXNWJnCYMUBHGKRqxphoyPY92oHMj/tOcn9P9DBa
	GL7RHn4ORlJ4g2sT+/5BlcKvjNgoQfCFgkm4+9IfjhPUo6DUschzLwFW1BA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvm9x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:01:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so4892256a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145314; x=1788750114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XJcp3X4Tby0WLraLkWLYA7pOP6v/I2LJsWbNkpbmuQ=;
        b=cM9fi3aK1jH95ldNgz2ySPb/ei2yY8cV/tl1cqQLsHUotqd8MZYy454Bp1+fSh0oqw
         YmjiysR784oVMNB+f/+e6yEYWB23243vuPvtmjXY4O1Eh2mBtSiLa6/UxgJ9Uo+iFKGQ
         aFaqi16nrbnz8JLrnbh1zYtuiqkB0Oel55Hr36XH8TxXgB5NrBukaQvVuQy5f6wViLi+
         6F7whlKZaDosGAhO250Tuo2gSQhX987ad+KNiuV88tHEYnHUgVXYE/zq1VQvC2gM+oZl
         LwG03UwM9O+WxXJjvAmQbKSVDOww1eXjfXVazTnrMo9ydkh7y8By1gUTMKti2gm+yd64
         1Fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145314; x=1788750114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XJcp3X4Tby0WLraLkWLYA7pOP6v/I2LJsWbNkpbmuQ=;
        b=MQx1Uy7DCbAubtk9iDRURy23e712iGnAfn4aHt+jnF/2NfyjgP18EHvZU/ME00bbjN
         xPJR90xYqiaQK3gI2/eUXPha7p3Z+Lv5cDSFtC9DQ2A0CV3uPKvKej2wK6tzrDK6OpwV
         4MLAw8s9SNYyAh7tb95Pfnu2ACDqPg6/Xaocyypb6WojWrt0p0Zyuqkj5BP8l3Q9C4Gn
         qgcscj+KoSs4zs6RAQLbGtaQfDb2x3/L4FAI663UkwM1m5i94y5pI7lBFBpUP8fNJC3d
         JSHOE1c5pKrZamNRzMoi/Lzxx6LEycbLuy3P048/77DsLVyg8iKZRiDMfverhivYKrtL
         Xz0w==
X-Forwarded-Encrypted: i=1; AKwUvBw2tZHq4qH6IIJcYEUeGenUP/vsyPgn8GfTEadDP++VfO8Sep3QsiE0eDEw5E5Woma1cJq9DXuDFpbICBo=@vger.kernel.org
X-Gm-Message-State: AFuF++md9ZhZ1OEq13kv0/Ky1A+HYne1RvM1HqIs7NQf7eDBh2xvHWNm
	3Wgldt4GiNv97YS1pQf4qkwE408zfxFawQfY9L5ipi0azn5Z0BkdQWCVPw2ZSVHKJ6V6SSG7s+m
	hL6gmHhMqnwDHnpOV0QeL/YFGZXTA/Np+dSD/g8XT8HqEfop9uUIPRCTEZujZqaB8MyQ=
X-Gm-Gg: AYBFou11KWld/YpHnZ6gZzmc5aomPx+/VYQzyBlbOfWx3hKgnv1uceHxI3md6oNkUEi
	GngMjJxthruTNC/wHVIJoqxP9jaVF25spELgcCUVeRGjVRojPbBlrzekmW0YfmpQgLEsTfomXMO
	gxBr4fMMKDOPJJ9kej1YTymIuEJJTUKfrEdVATGh5KXOvq8Y+3EawQLI90sSICxjfpDrjDNxa8O
	4IAXD/JQE5uHle5H6ORrfhPQMffAXS45xaQAd0K88QKCLsQUqCvVb0ZeAwyZd5V+xUm9wj4T+72
	mDq0NPBc/UrI3Y9/Xt+65djL64fYAmJxgGvbw/PQbtN+/g46ki9x2GxCPoXAa8JwH9Siv56+ymY
	kwglfjhhJTrQF/N194cnm/hbJRvF4SnsK/pwdjekTnNsD74m1jnNArQ==
X-Received: by 2002:a17:90b:2f10:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-398f845feb8mr607828a91.13.1788145314295;
        Sun, 30 Aug 2026 20:01:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2f10:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-398f845feb8mr607780a91.13.1788145313824;
        Sun, 30 Aug 2026 20:01:53 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:53 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v7 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Sun, 30 Aug 2026 20:01:44 -0700
Message-Id: <20260831030147.1500616-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Git5PMzdvdX0LT7OthHtx-IMCZhZlhMd
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a94eea3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX/VzeZ6RfXwPr
 IybBdF9N4Xa47C73kRp/0C1sERiPPg01jUwhMe7lhyMAN3wevA2fgAi/XX4KGREBsm1XoN+aHT6
 OFVewFN7pffOAeExNmtf4jwNiA3gNQ7NLb3lHCszUp39mGWWribPVu2rpMzFgAgIiz2Zdx4Y0PZ
 AJcnyyibjrLH7Kfc/6EpkyKuGHQRLUuJ7sG9cO21qikcmVixCvEbW11wXAS6Slsc0OsRZPllsYP
 gIVWpSNmtSOmsyFy3mtAJnVjyDSI+RDQVfliLGOUk+0gvyN6ap2z3067C1bDSRwGqLt1EfRvUiz
 nk4VRAf/q079POm5vbvMTXeEF91nQUHPLoUpzznw2F+ibTiGwetm2auC2LpMw1rcObUZCbSpbfp
 bfbfotdQNKlbt0r2IpEeCS8rtlH0tgkwYrnxA3HsQMD0TUu7VWam2goouVQRGFApd7JFxuoRTEv
 BuLrFQ96WPwMqMjI5FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfXxkQ3REd9AsS5
 UU1JBTcN4CUNziNgg3JUmSGnlHeVDITPzzmerfIqzWBjoUmj8JluAK2CY+mqVY1qGtwkS62b1P5
 MaL/Z3/QK8NINCmZMDlGC9+ZMBGkRIM=
X-Proofpoint-ORIG-GUID: Git5PMzdvdX0LT7OthHtx-IMCZhZlhMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310024

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 45c90d9f3b1f..07522225a8f8 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

