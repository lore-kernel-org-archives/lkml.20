Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF05367B9B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465165; cv=none; b=gE0GqsPw6ERKYkzZodHnxY58OF1XHVOtac2+D7urClNqpNrQJvZRbvPsV1DWYbv/F9JkfXqLzAvkuZCBzFg42DNaE7z1NnYn2/j95gSP5PZZD6CeQU+RM5NpJNw+2R5sEXmEeuxZZfuSH4MnfrA0IGnuWEuuYvfS89aKqQ9bvGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465165; c=relaxed/simple;
	bh=hzhTHbbuhlaLXp1NMcukmmnntT/l3IaAz30Dj5qvjZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRPpUX9xVoK/JXKw6HmNMdWoTWx/0JpRHZBTmYf8r89LroxQaj5jhlvkzonmZFt9vVCcy9HYbfRkBkVerTNMLcJ0SjWo6cpwymHub44wnnfkjou0n9cPr3jLqz9rqTj9A0xhA60PCVcZO9zuxfQ3XGw6pcqy7/ovsK+QUlnQXcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GA9/zt99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/Gj5hDr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GA9/zt99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/Gj5hDr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZLJd2415435
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f5Zjmw6qUFD
	CsBfmlr6XY1L1oGfIgEXoh02cSpUE4f8=; b=GA9/zt99H7aeh13ApRGUM4FGjJ2
	qUaBNUbUpwFNeASf3rYgOLSzaiFMIkOtPUXVoKv7J1V+URsnLF4T6QoC8nzVxrCg
	U7W68T6jbnw752MWatIrWAjtxyRft1XU7+XAzmztnlI2/t13HdqcSzwjQ26brU8Y
	qs9mbmgnWh3xUA9l3hsRRaY+pV4PCQ5MfDL4dvEufIXvZ+NZsVEVcPe70UGGO+6p
	eyscnjxs2D30h1VQCs0EVuNUpQ0sKmubdGUyMEsan2va8eIuhKyLggy8Mhv1qOv4
	xysNphh7+QOLubDhWtuBPthT1seuBxTYZQU09isOKGaZsFJYClvnoEKWQ2w==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd95e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:39:19 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bc8f608979so3386650eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465158; x=1790069958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f5Zjmw6qUFDCsBfmlr6XY1L1oGfIgEXoh02cSpUE4f8=;
        b=Q/Gj5hDrDNx0O1BVxpU4i18uQwYd2VgXOleOz9qIJ/0cqcno0qBWur0GkeAlDT/7Jf
         VXKa/gHN59/k2IDhSwjO83jLMDYf9LYEbVvINqQe5C9KYO0siyDSQ/8Mytgh4S0TMxDm
         Zra2DkuYUCP8TgZNOAc0DbiHLxBL5aNKHrdyu6HTz/YXP4U9l5BxKOMZipc4CpVXPym2
         1lJz3u51EX3LrH/WfLP8aUO+ML4XitgMpMb9XG5tHE7Um+kF5nQrOimmpUvMZmTAcmzd
         LD7Hq0gTkSKkgKx7FO1VC1EKmx8zM+nFZXe8rliUDcC82I02Q/HNWKC8WyiVIpF5bnUv
         NWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465158; x=1790069958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5Zjmw6qUFDCsBfmlr6XY1L1oGfIgEXoh02cSpUE4f8=;
        b=i/kT8o/ogrjVQImg65H7vwhxhs5nio79fhopctbyoq0A3MqWIUnpne7J/Tz99m/5EZ
         TaSwudBqB8mQGLPk3/c0jnI2cHkeg96vu5iifCX1QUsjSJXvg1fjBytYBi/OEXXjKJyk
         fFW4HHWvrgh3pPswv4KAI6kwm+YxJlm3ZYTAm9L0lXp1iQRyAcc0WuGgNtxOJ5qgXpIQ
         CCVx52Vyb5H3+sFdz21d1wGxuN0A2l1sYrs1lF7SQSJx7sixEhI13u7GrWb9xs5VwJn2
         rTpjyuZ3lelXhPcC2dfXPd4cyI3QVHEgyketO8bdqlToyl7k+FIn2zo4q8J9IMeGHCE4
         LYjg==
X-Forwarded-Encrypted: i=1; AKwUvBzUZsuey9aJOyAZbLrgshUHz/gKKmFTdfhN2aKAT60wUE6yhpJ7IwXr9sQPf5KZQKZnLekUgURakgNGgyU=@vger.kernel.org
X-Gm-Message-State: AFuF++l812aaVaZnJmAoEycAh0LI1MRSBOvC+14lNtuq3GjlWBnLylKY
	23SiAvtNlY0OwwSTGJ6pX4H4BnkpQGkPkPdV73Prli5Cn2y1LeSgnSSvXBzBWI1BaIzj1Umf/Y/
	PP3zRUxpPRQYhHUdslEDMhktOognTy4Qfvk+vpUeaHNylt1d9ASBtyYJ9c4fzC90CsXKGu+6aT0
	U=
X-Gm-Gg: AYBFou0lX13zkr8Ik67WKUyMC1LHecF7nad0uMKR2t5x52HK5Cg9wUFIkS5NcKjnp4b
	/jVAZOBCrX4i/AdfsvrHyyo//1OrX6fXuTibr5yBpgu4SPIIXlmhLGOgKwTpfMmoER0bf1YVQwp
	DMAs8J9cRXkpaRGqyH06VSI7D4g3p8btxuo8E6IQxD2CuBSaPao9+OPIgtk1xSTLtbYAQq0LUIe
	Dpi8sR0ZDCTAlEU2ulJ8KHJvEWUdnXpseTi/OmsbWljIN8tLQYSUupEbgtdpTb75huFNAaT5uzr
	dxbrTzVDPQ2/8h49bnx6gIDYOawrlwe/EyjZ0odrvV463g3vGxl4gUSo3uN9V+s4jFKDl4jYLto
	obTjfQvz3/VjDfr6dygpk4SD+7eT/vMyHGDrr9YQexReAruRHl6ntP3yeZYcCBQLE9us+gJUDnD
	EKjpbVIhFxOVrHWaMyq0OVjg==
X-Received: by 2002:a4a:e841:0:b0:6b9:740a:290e with SMTP id 006d021491bc7-6c542d27db7mr4193287eaf.65.1789465158134;
        Tue, 15 Sep 2026 02:39:18 -0700 (PDT)
X-Received: by 2002:a4a:e841:0:b0:6b9:740a:290e with SMTP id 006d021491bc7-6c542d27db7mr4193259eaf.65.1789465157287;
        Tue, 15 Sep 2026 02:39:17 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm30325876c88.2.2026.09.15.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:39:16 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH v2] mailbox: qcom-cpucp: read mbox hardware register using readq()
Date: Tue, 15 Sep 2026 15:09:10 +0530
Message-ID: <20260915093910.2487018-1-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7527e6c7-82ad-48f1-8329-5b9222c347e4@oss.qualcomm.com>
References: <7527e6c7-82ad-48f1-8329-5b9222c347e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfXwBphgFOchDP8
 J7tFV2hU2yOTW+nY49NMHXEBJbNFtbsE8AeR5BUwHjev9jcn0WyTEc8B4xSXzJx+MpR0BN0ex2r
 hwTrDbizXrNX5XKrOEO0lXfWL7AgQ5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX3ry4O+J5ZNXP
 fjewEK1EzcLR5djzF3UhjTSsZSzvr8w1pJp8tjasflrqQ5xuVg484hXbaWCyq5wywD0h5AEfz69
 88xJEgPUqFqiqsam/xILF4vVyR54rg87oOMwU271MNGkN9WhmIpO9qD6bVPOp8iLJwS6hfjRpKk
 nt5AjQffW2Y8KDNO1mGKrSZgxKFr2dBDr7P4qrEoS2rnKY3qgiOk+S5TT/55l9YtSysI90ObXLf
 uLnL8FFzw0w5hfZ7DGL8Jir4mSym67QY5nWJ4AgcR0wAEkEsm4ZY1OmwhdpErWo4BzmfIW/lTf9
 G22FlPRVwK+zmtSZs1EzCYlqx85AX+VeTik092xxuaLRiAbwIsI5kR+xzFjdVFrOzLPWvZHN9qR
 1zI7dvinitS/AY1Mts6Oes9N2YW9LVjfAnKaZ0X8zGkseTiBVlunelrddf0+1GUdMlYoFHxQk8J
 pTaP15bl2kyhscVg+ZQ==
X-Proofpoint-ORIG-GUID: q6mFZqhnNkuRxzk3qh77nATXJAjo8n4c
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa91247 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zVvgFSUyQItoBg7ASCAA:9 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: q6mFZqhnNkuRxzk3qh77nATXJAjo8n4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

Mailbox hardware registers are 64 bit wide, but the interrupt handler
currently reads only 32 bits with readl() at 0x4 offset (upper 32
bits). This does not return the correct value expected by PDP log
driver. Reading the register with readq() at the base address
returns the correct value expected.

Use readq() to access the 64-bit register and pass the correct value
to the mailbox client.

Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
v2:
- Expanded the commit message to explain why this change is required.
 drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index 7ffc40acea9b..f56a05149281 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
 	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
 
 	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
-		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
+		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
 		struct mbox_chan *chan = &cpucp->chans[i];
 		unsigned long flags;
 
-- 
2.43.0

