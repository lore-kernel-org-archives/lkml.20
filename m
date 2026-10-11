Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6FD372ECF
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748791; cv=none; b=Et1aiRDBbNnnBbCDpzb1IQfCmArLK5pcVzXouQqdi09oQzF8LxgLNEUQ1crmvr9gE76GRygfI5pwv+oeEmS0lC+bUD6PU9k1VbiNxPYCHAAfDrNm3i0L9Y8MOGO/RCAd0EKp1T6XQvZVIJj2Q/mpJ7tZ3kR4bwNgCJiQELKU5cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748791; c=relaxed/simple;
	bh=pXI6OlPwMpEo6kmDbz1z2982+JLE5t9Xdu4oOD+wfvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gM11U79LA2hSUg5Yu6Vq1cuJlBWfy5ds0JrKchE8om8mnS1NJCcqTTYZLLQ7i66/v9DMS5sNupDO6ANxqLW/53hALM5m4XBfcdJFIGmKgNnkCpcvaBM7MTemwBEBnyayYq2dNoNbj0TnAkqYuEwFCFMySTihadg0PIHDLMmyYAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dH2TRf1n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCH8kIPP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dH2TRf1n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCH8kIPP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69BIPiHK1126085
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QCffxlhXptHA2fxCamUbUo
	Ww67cvQ96kdRlJhyvXZ1c=; b=dH2TRf1n9RznsTHS8HIPyqincaWMt8/Y2gwX8H
	klTNyT6ZKAdpI4N7A8uIbXjEFETXl2QZICS0SRtdbQ/XRuP/k/WonehRr8qfF89G
	9nZzw+pSsiim5imcT4SCghtXrq4M7eEaxy5WglVETMM6U6vonnmMF43btQUuZSPI
	NDcaZjKnLCCvaD9eHDvp+EH44iXeKK7B9EbEPzDOukSXG0GzL2FOF1ATA9H9YBO5
	5VEe/y4cod6MzomvXrEsmKKxvcmhp/BAtvJXvvJVI92J2uUJTCyW3fGhnPAJp980
	F2jk0aQvvayPHW7Je0GR4E5Lrk8PljXUl2Lo5NV7uaxyQQBw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fc1s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:59:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e834ff4d0so397120785a.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791748787; x=1792353587; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QCffxlhXptHA2fxCamUbUoWw67cvQ96kdRlJhyvXZ1c=;
        b=dCH8kIPPhDBXFPjFYmzSlckZRdVcbFvRJgdtpDq59yK1F1QVZryuK09RAaiZtZcQzA
         Knzze/yMinEw/7fL4iSkFzM444nVNXH6mPrc+3wZ1/JskP82zdy+p1kyawMjjEmhtp5N
         ksba77dCovbdEtOwcvg3ozfUHKspaB7prJcoVc9LTDq0KE1B8pcaMQgfdp99BBbC6HWH
         nqp2MnDveMN27v3T5gxLN3fCAc4omWfmkmP08zdzlye8mjWYHvVg4eATIuSs9uVB5jeV
         5iNEkbTOXKY35kgsplXY3NwicDr3jK80fdHfhPWb30q0jE8+jjplYRwA1XH4bRiEWlvV
         2RSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748787; x=1792353587;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QCffxlhXptHA2fxCamUbUoWw67cvQ96kdRlJhyvXZ1c=;
        b=BAhPmB2lWTXCw2Q8QTm+8itlWSuKpREFg/h4+/h4W9OEmDJu0U2ysI5cBQnSR6CiIW
         ZtfDcbdt7n5C38w+U46EZ9hoDundORqnY5ZPTDSp89sHPYqkyHNKygW/INaYc6d3ldW1
         /3GE5NngoXHj1qb+DmtDVnD4/uHAy6mN5tceKUfMmjDbO/gD5JfGDSllN4nkp2CBeUzZ
         qJNhtMjKvE30xb3sphpUfrzm51IaCq13FVYH+3B1XNFg0IglGO6KOnG290SPG1rKo8GV
         ZzBZpoTNulEsacEetSmcEFIL/jsEKUFHkIya/9Ytehj9DPoCbr5TQUBysakUkEXa9PEk
         GyMw==
X-Forwarded-Encrypted: i=1; AKwUvBxWeS1BzdYYMAvpF2AL4rlq5woZJcH7rAEjLK+06geW27cZfZEIibqjceEmIBqSg4E3pcOJb2Sn91zLFW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXebUJaMarVlKN4AVaW3o23ZDAfWDtLRl1E3b05rSWBhVhD3V0
	3m7M1gvCs9PS6X5DzTKSXI0jyCIdZ8ezsTSyxr/XZSDOhIf77YtP4Wq+hqEpe474PDfiu6pWckb
	YNgRPZ/pE73FiReKPjXLJpQQ2ufFnMsHMOFeYGVg88wjIbZrYrHJ8ylZj0Bmo5Y8uNek=
X-Gm-Gg: AYBFou1cg8SE+V2Nm2Ua0LqYZB9J/ncoojR/iOIe7JA5omy8WCNIdMkc7LtNoDZZlZb
	AxG11YjyzLVw/vBjR6kJp/6n2NcojmEAZmgGJadnQDcuVsroQGp4MceD4V21NEkI7DSRv5b3Hze
	UMLMHr3EoeR3MIpEWpMK3NAnO8Mx7jgAowAmaYj49BnMXd1RRAkstdazHYaTExRnCEHMYedcCW9
	eghET8EMw4m8PLcD7csszLLzfAfUtB3kjQJhf/Pn8E9oSLPJPKq7jSRFogZ3Kg7Bh0ELusyybo2
	6+HQElm0jRVfFujZ42TcemMbD7kAneSrEKGmTw6Kv2tZGor/wNWsab4oUTfqd0UFx9v+85bnSSK
	OGjaNiu07
X-Received: by 2002:a05:620a:1707:b0:93e:a7e0:9a66 with SMTP id af79cd13be357-93ebd2253d0mr1364103185a.27.1791748786590;
        Sun, 11 Oct 2026 12:59:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:93e:a7e0:9a66 with SMTP id af79cd13be357-93ebd2253d0mr1364100285a.27.1791748786012;
        Sun, 11 Oct 2026 12:59:46 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm366759315e9.8.2026.10.11.12.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:59:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 22:59:35 +0300
Subject: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power domains
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKbqy2oC/yXMyw6CMBBG4Vchs3YSSrior2JY1PYHx5hKOoUQC
 e9uxeW3OGcjRRQoXYuNIhZReYcMcyrIPWwYweKzqSqr1pTGMF7ysTw5AY9eHUckhJQr9tbWl84
 3TXceKPdTxCDr8b71f+t8f8Kl35D2/QvfIOVEfQAAAA==
X-Change-ID: 20261011-eliza-pcie-gdsc-retention-daa497d5578f
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pXI6OlPwMpEo6kmDbz1z2982+JLE5t9Xdu4oOD+wfvg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqy+qvhTh/eEOu4fVtb4hgNEZmNzojZKK4EdPSS
 jzlJPbkzWiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCasvqrwAKCRAbX0TJAJUV
 VrRND/431MMDHKd/Z09ZznOjj0iswnwhULi7wboTwHE0c632L/uCWPKi5Z09baWOH10R1jyBOgS
 4ZCrdDz4xLv8OXr0lMR1O6OgnIcFsmgVLy1n774JRAsZ43AztWAPzgyKbFB0AibBS4kZTKCKh4x
 b1bISA//ZBM13xiAKzpgOGKtCfQD+3lstszo37bsW7f/akaI67cz9LQ90sNdhPQpYuq9dQl+W0t
 isBFImlQoRHR+DOzU7Ch1EOa4388KnsRQbyY4zV8cQgIaIzWJ2IB9HvlL402d1onfnYb0QJ7aU+
 12O2BwS2gMWLGd+ERWApT3cdYcwWxcfVO514WA6vF5Z+QY06TUCyt9JmK/j9A77Er/wpH1/Xd0B
 nddBAO8CeVaNloz4mGDPLd9egyZMwGXtZrbVXnljg2rW/TW65rIYKs18B/jRm5JXqONla563IAw
 4QkAR35t5Tl+/aoTmKLDnd/pZNXAszzkbLVVg3z3Fl7Tq2oHNiUVIiaOsaTDfzv5Nhl28TiIVT1
 xlhtRaoDFUUt5urHsgFcOkpnsf54ssb884bE18WONpDt3rbfWK0faiAtYIQl0dfiliMdjmUvgFF
 PUQTe6VfMhcGxfAtg00eKNj/5E7ZRO/nYfk5mcObrUhM9x7/hd7LqeTK7HDxFRjBqop3dflPl2N
 ECyVkaaucKf+oOQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA3OSBTYWx0ZWRfX9+gRCIdi60cJ
 dKmmD6bM/rEzEUEgvuZD3tHafFlMdM7Bt6m3KloqbROu7+07g3wSrg6s+aMH/NiuRGDcNV5EP2D
 j7wTpzLzWWmIb1j95yBre0KEfyMloec=
X-Proofpoint-GUID: vnp2ZYl3Ffx5tN9DYa7h5Dz0vvf7WmPH
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acbeab3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=x0TZ4X2153IZKJAi_hAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA3OSBTYWx0ZWRfXyeKMFMgCvqYd
 Bb2KfbvcRLhufn2oTHSRoO1F/R2wxgTclKP9Ql6fEKQv2i+pB4iyghqxMhnUKhivoTFJyQC9Ie7
 wxYuWSiQYWbxRY3W19ApLEoXGYEMOrpPx79hDEnFcx/xc6c3zyJTTzU4Lgk13KnJrI6CxkZlRMH
 AmBEbcYQN9Gu6AIJySFzo7fnL42l/iWlSIlTl0xcR04p0Pus/SwcT0RPHdX5QCPmHsEntOM+wj4
 D4no6/6c3pXQVizNGw6aj4E1/7DtMNagSptZ8avpXPL0WEvrhlh0WDmz4HeGo2Ymdlo+lSJbI3k
 zBjblN79KhTgnAuCVNDl8Xj4g7yljQ1y2fFd3aa2tKf/54gqh1DTYZiN7LiGhpZHQSDpkwBYXzF
 /eJ5eb1wmr4QnQJDwfcIO06P4Tb56YfEWVJXM5EQ7ewdQqXE1ggWxnoQF45ADyYMhP6UlOp0hfo
 lNSvz/lN0t0r9wtyP4g==
X-Proofpoint-ORIG-GUID: vnp2ZYl3Ffx5tN9DYa7h5Dz0vvf7WmPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110079

When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
gets stuck off when powering back on, preventing the system from resuming.

Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
state across suspend and allow the system to resume.

Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-eliza.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
index 064771726e9b..21fd93a1f6b2 100644
--- a/drivers/clk/qcom/gcc-eliza.c
+++ b/drivers/clk/qcom/gcc-eliza.c
@@ -2715,7 +2715,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -2729,7 +2729,7 @@ static struct gdsc gcc_pcie_0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -2743,7 +2743,7 @@ static struct gdsc gcc_pcie_1_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 
@@ -2757,7 +2757,7 @@ static struct gdsc gcc_pcie_1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261011-eliza-pcie-gdsc-retention-daa497d5578f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

