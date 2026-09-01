Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE19469836
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247900; cv=none; b=uy5btMfwNVvZL0sD4NykrmXkY/BIaCgsYWGa1xgxqR5kqGVEAP8WKT9zgFPqvoa6dPa1c78WGpQWtDSzjwc1WUmYCuaAzIYW+rjB2lPoRK2GxCmYLUBiEqanump0aOUjWgHAE8w0yZ71N+A+0sFYcqlJ4Cm5wcOZcKU13fFQao0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247900; c=relaxed/simple;
	bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjySwIk9wGPmKKRgpdr4Rl/nvtwPKOsN3FABcWLGSuraXG7TXNf3tcwsl4EEeXFWyNRyPEb8qCJksJe61IlpvHXLoWwW4gDVMNzOSPUkmaS4EeOvtd86D0o3saFx7mn0+vrsuYWE1hWQt0iOh6C52cwsDB3onqAxaX9q+olootQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqbLSOqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Towon0+2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqbLSOqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Towon0+2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179PJs2321959
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=; b=lqbLSOqYAexpgYaW
	NmIFEarmQEXrLcAFN0PG+O6UUUsaT7Qyr5Hw2ikzisNHF3E5mz8lOZI9LwnYuOkK
	k793p0AdR731+oV+Ggor4F97VL3is94sLTa6ctKCij8Gyv+e1X9kajKHwW6tpOlK
	ZsnMEfLa2eC06AEa2nQveLqPhL5eyEHB7ztybVRIBjKhpo+mSLfPPH5t3Azvl/zk
	OB34FVTTjbMgysIHtG9c5B8dFnWykZhp8TJ+pQQeyRmI0aVevrQTcxraOHUXgTDX
	DIP9tVeygf9H6lriQFkQLWKsm9sZRvuCx+hokLQVz+vdPsXpEkkg+obFS0XzAqn2
	CyyQmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchapd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:31:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9382f9430deso127493785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247897; x=1788852697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=Towon0+2Q9xt7Tn9j/cfT7ZblzSUDnitSQPvBQuFeAs+toqYWieSDZ3igQkL01Zz07
         169ZZYA4nXenoLcJZTqFgLz+tJQjfGp26QT7OpC/PUEfKd8MlPxyq6K7P9+lHfUxHC0Y
         1ybfq+4MFzBlsuSAqCPEzsrxlkSqnjsEjx5/BZAuL2gJTYIKsWhHJkTOnidK1VqEr1yY
         kfkfqVYDyFMhyqtYIe7IokncmqyfXpVKYgVA6Slv2/x8pTuvLfN8sRF+TQcmSRlS94z0
         pb7RvAZAbhcFIpMQHLIzAvIykJZudpf+MHRSUKWxy//kh1heY6ZrtK+6cnr9DyPMJVr3
         VJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247897; x=1788852697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=UJVXUg/pbQ7107nKYAf3D4hPXxCYDhfoIt9pPzcLiD4pB6FnaX7R80w8zMyp/SXMQv
         sL/2FX7zbxaXs5T/mGmWVzDoibugZaFyombbTYsKyMU20Pn6YA8JpqabBxx2I+6jhNXn
         GURDP49gbNoViQ/OE3OzGP/imoRGOq0EI0JJFFqbGB4x2z8sYW0MHmRFxYZXgZiCAZB5
         19k5VkanK+Hln6te8+W0/vtzyQ4YK1G1Y/mmRfSgO8GqP+DMTR+X2WqpHn9mr6dHRfwe
         6S9aW0b4sjKFITPNFkXOnHfFXg+pS+IstOGFEQNcpjlIorDRpmBSsduPefz/o74am4eM
         ZzmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqaZtDS6KJT0w1EozNQJ2J7g5Y5oAuALV2e+CDrPRun92+ioALxee6SQczQOmz5pg75Sz+jjySsR/LLT2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lJj+1+fBe7TxFN+XC+lP4XY2rPOe/g079Ykqcu9VWuBx2TDWPo
	4zqHw7am0kkwq5LhJlKKB+zJbzYZ7iFpm9Rup21tIvXcZwHEr+T7FUtiZiWzY+4ODyhhdwwFMBY
	sn6ltyFS/PbCymrEzBY6WhEkCCy926GGqjT6kl4cvEImIVD6tUVpLzy/CVEo7iKxC/Lc=
X-Gm-Gg: AR+sD13n5puKI9e6NxpI0sW7bzaoI1KrVSqmWLzYNHlF4ZiLrFznKK5vtXAFNQwc8yC
	r1kBxTZogmfSbS8BhGuTrKaHEtPi69lq2dvxKqsMiZyVIVP8aKH4L4tehjQwo5vQbht8lIDI7O0
	JfIJIioE3ax89qXbhevqgDygf9KvFpOLHc24lhgV3JrNV6xGXZ2WPHQo8TvabIOdlLJcV2irFS0
	mJOfJOyqQemxY7OKAY91W8XveCRgr75xCTJS+tMdw+X3WeKLYAKNu4JJGGCQEhVVa4PuhtR3QA1
	1qeCZThSUKxRe7DxF3/0C4IX8lO+fWV7uaVEW0DUic0ZPhtolvje+ajZhBYzxzjTMjvbTQZak+q
	PyKYhbjcnmnpr7Ju3vfTwsU781/rs4L0vsgxWF4XvPZ9mQziMfJvNm2JbM/0CdrnZP+Bt
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3297858185a.37.1788247895819;
        Tue, 01 Sep 2026 00:31:35 -0700 (PDT)
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3297854385a.37.1788247895352;
        Tue, 01 Sep 2026 00:31:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm946766785a.40.2026.09.01.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:31:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:31:05 +0800
Subject: [PATCH RESEND v5 2/4] media: i2c: og0ve1b: Use
 monochrome-appropriate test pattern name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v5-2-b0400a9bac01@oss.qualcomm.com>
References: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788247879; l=842;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
 b=iO6+Xl2Bs5MIFb+zyzdwJ5KnH2bH94waL30vJH91jONK5TBQF1w4COF/EQjWi/dnCRlXRFhDV
 jR4JUzDt+J3DWWO6X7wojOdX7Bffg/iVIKNzMlYyoeJLAi8jHeU4UwJ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: h8cFza9gWK0X74xkaxZnVM8rhlI_E2r2
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a967f59 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ni8zlDty7YU4e_isgz4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: h8cFza9gWK0X74xkaxZnVM8rhlI_E2r2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX1mLBykNSG9Zd
 KpnD5+nLF2aQpGI2ak3+05LyTbnF0R2oPCwsu0ljzNay0FkowJ/FR85BH3zqMptytIxvC4918qj
 GsfEVddgs5KxGkYw/+3A5+wsRUde5c4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX/oH/C5NjBD8O
 Fv9Cs/qvjfkcdlg8xPUTSC7XLS5fP6Ohc8qLSdM28MlzlZldwBtMeWDM5W7nCq4bzfGs0nNBZQ/
 3L8YsXeP1dn0X0zX0bi6DlDQkDTeBHTflHl6iriWhymfEip/ApRAZUswftSDN3hOeX5PFJfT2xO
 p+7ZrApiVzGtauh/6wfv7FxmXHHETb2BhHkKyBgfmFKadjd3km+AzArt/d+MCWtOq0WYYIZUQyh
 4qcT8iUzpOikU4hlG/GrZPXhKNhL6Bm5h8tlpkHQvmPr6bbXVj0/ELfKjkliBkYGQ+tuCzoneU+
 NFR0g3OSS2DdB3wlBdcmlBgqBl1NgUk7+lmweC8zKTeR5V/rjDpohcF+n1KSyaEflLq6X1kooAP
 2yNeapZzZN2dRLfffBOCE4Oip9HgAmkWbx+FSviT2oFbBe3OzvJ4iCJ+Cu9VRFlD7N0ibNj6hHc
 Om2MEofB5vlXggrzujA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066

OG0VE1B is a monochrome sensor and cannot produce coloured test
patterns, so the "Vertical Colour Bars" test pattern name is misleading.
Rename it to "Standard Test Bar" to match the OG0VA1B naming.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -72,7 +72,7 @@ struct og0ve1b_mode {
 
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
-	"Vertical Colour Bars",
+	"Standard Test Bar",
 };
 
 static const char * const og0ve1b_supply_names[] = {

-- 
2.34.1

