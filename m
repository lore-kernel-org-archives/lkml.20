Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C024C6534
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885515; cv=none; b=bEkz0XPrlrLi09Y1xFJPoOOLONL+aheMCSBBgPFls/uFO3iSGxSAb7YN1bA0wkQYFNurK/87kb/4hUs/DBlWdu2dVJhklE9Sj3S9k0oHLOQxybREFflZ+yHJFgMEM5UfWhwsjvE7kcmB2WkcGMfgy3t3W6YCkb4iM0yXs40Mn/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885515; c=relaxed/simple;
	bh=Eg7+chEgs398447bUxQxnh1SE/r4A6n/ZRbc+Wj1DQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbMhiX6sCdOE6IaaWzSBhfY0Md1rY1rji3kvomUUYqOTs0o35TrirOGTOX9AGwo2BElS7HaY4IHRm1BAqyT6DNqGQXMaeQvHjyAAF7vZBwWfYPxmnzZijpGVq0qATr0b3PC5qFWZkQ2Wn0MRyl/VFyDS3sJSVbyO4ccmX4b3P4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AA0X4csR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEX4/hdk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AA0X4csR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEX4/hdk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8PClP3054908
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8jZfqJRI2S17ZqhdokW6eWwYPPDaxj1chnAHFoBSl4=; b=AA0X4csRJG906bfq
	pjdi/auibAZjYv7gE7yHHTkVsQNyRDcVM3rA4tOWTfC0OxHqnR4yxPaYSK+fs/LZ
	Gf1vRKO4dCAG4G9M5Uc4+eRtC8hmPWyn4Fj4EmhJ1zyR9vmmUjsehV9ie1bjSauX
	nBeZHunxj5IA7CkvMqmTii5fQRbLbkkBAMJ1Y781BX/hUmg/ynNYAZN+pCBJK/fE
	XfhwGOY37Sou9dHCNKqKTvT6Ao3EvsFynJ/vg/onDR0+BrVxmjc54du+EPAIikmB
	2sl1qvcNEYZZ8s6XK+5M5Dk0WDA0tWAkLuY7qyk2Pv4/3r/4nE6RhysqCHXOueSM
	Mlbt3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeunq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:58:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so483258985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885511; x=1792490311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8jZfqJRI2S17ZqhdokW6eWwYPPDaxj1chnAHFoBSl4=;
        b=BEX4/hdk8ULzB1zkj0MuFJoVEPClu7/sW7lN1MikMlrWo1FymLL5lwBYZCujsjcKbR
         u7ybDyO1t3FZdh7bC1xJBHETwUb9sThn59ocUTSukWaOZcFrK23dfeqbSw+grRGO/gua
         +ZiYrCQZtLl+DOtNLFxTNBJK9vNqDY9j8Jl5wg2GmxcOePFUY7LAG1UYypbRplFJG2gh
         JtoINrYbHu7Aw3Q6AOyqPmJdoF95J4pBWisEkZdaiczJCZSpWj9a9e72L3sRVCC3sgv6
         VwPwzXVgju5i86Jq/kAkqH3zQXy61mKMLIoqgVkn/n18u2fVD2ABqCcg6MO9ZDX+cyum
         hlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885511; x=1792490311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8jZfqJRI2S17ZqhdokW6eWwYPPDaxj1chnAHFoBSl4=;
        b=KA8cGdpNMcUCY2PnMBA8xMKDZDSFFGa7yr7Cj8jOPb3s1Z212dh9/TIFTXjZ9rEI6G
         NT8Fyr+UdjqJxruQ/PcHakc1oPKCPwvOwFswkOSEYJ7o7U04/zMgmYiLHDvnjArnQOFk
         sGLWJF9qCQWTsgAEYJgeOa2ahuL4Zt42LDmDNU0d0lvzRs1SvEmKP2QCZ4AP+CfBZhz+
         2aCPs4p0Jf/QV2EUn9xp9xGizoYZEkSNbwOogi3irtE/wV7iKFRK2PUKLVaeKZxJffNm
         GKAwnChbfUd3r1YJO0iT3CJLXtRPiqXqfiL82ex0W30m1YJGbZnuvyUeBswaGwjcOEer
         G1wA==
X-Forwarded-Encrypted: i=1; AKwUvBzCVC6/GrRbVvLLoE1l7XAe2ZW6kykvT/Ho7vdWhuYbmujEiLY8RWmrhik8wn4H5+uoRjvDC6dN1yZRHXE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJP/w34KtgxUa/+w2bpiwvKOgGn/Fj4MI84rrLn6PhUu5JzhlpX
	hhaXgMNUSqyIEJCMdT6EUidrU76U0tmLM878X0cCAj+KyXah4JASvglmVYpTrCZ95iPPoG5HkJn
	tQC67GtyVFZ+4sLeUaYe94KdWKCrPrA6dLUsVbJuatCa4qiQZXM0IKrn2sxySFgmhFFM=
X-Gm-Gg: AYBFou22bdLwByoF+WxWT2dFxPHzvBT7vNuOKN9ELIWU9Hh3H/4wB1en3k04zA09tde
	7Rleoa7D+VXKhua/6/lgyBtEy+4DZtk9Offl42E+e14/62u+FQ5R5IhCOA1Fig8wRPrP4iR666u
	JFLxrMSljyTDjPqpEC1LiD7lRWF8pXggBTxxlhtoo2M3fuKKsvOHVQr/djawTUKsMY6valBxNoM
	4RDgZuHxoO758VBWRZSnvw/nemi6EIoSH1qk0AF6zUjQIHjx1qBiQcjZYxA2tU4YZcHBQNp5ctP
	dMaPL2cFNaxT7lvAXaLl9Pl0L6fvZlcRDXdjxEMbp6/zvCN1v22e3pwod4sxvW1g4XHwIgRM7hq
	a/5qW8VxWJdPDhazxi1qRfkPklAp5
X-Received: by 2002:a05:620a:371b:b0:912:1206:ddd1 with SMTP id af79cd13be357-93ebd0e4d43mr1969567285a.1.1791885510440;
        Tue, 13 Oct 2026 02:58:30 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:912:1206:ddd1 with SMTP id af79cd13be357-93ebd0e4d43mr1969564785a.1.1791885509872;
        Tue, 13 Oct 2026 02:58:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:40 +0200
Subject: [PATCH v10 11/14] crypto: qce - convert to auxiliary bus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-11-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14790;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Eg7+chEgs398447bUxQxnh1SE/r4A6n/ZRbc+Wj1DQc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCk40L2g5R1tnZ6+KPKznXQE/UMntB6OqClS
 ajJGoXEsUSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4ApAAKCRAFnS7L/zaE
 wy3qEACjEIN1XzpNvKgGJ/qfi4/V8bEzX8cJO0BN+qXuUiqyya/owMiawAvu0LOcb3Uq5ZVyJik
 D5INhY8Pp3MBbu4AYOP1vTqWvtvN/msYC8kAGWV/Z1nFwA9ifPfD9SLorF7BRw2YUhPnsS+p7S+
 v7D1NGwDf2RJV/ekgl3l1SNNUFw3gGWyBATNSZByLh96WB59RAjSEU26UnbF/DuaC7r5RNDF6Al
 0UMHhOIGo8BLDJif7dofWNFXOeUP+n7yzaIIqWvb32WhDgQExzdgUy69zdkHr003Lzf1G52hGAt
 lKMhWGlrD6QqJNdItGbyXBNcn/Gba+SfeSC+wDOacaNqsn/+8xSYR4Q8v6ZwRax41vFL/m92oEM
 ThrgEw50FSmdRhEzPqfCr74uHWcQKNc/GciU7ctdf5AjpL+9JmPSuAb7UD7fQISn+MVranK8TIf
 GGV49jmucGNwjUJVLEFEMhEqTk/MegvOuXAway3vnkstKRPWDHNanj6UBKu2wJ0wW1D1TPPd1B2
 uVpypAt2AZi3FXNmEP+MeJHifuPczOSRDgf8Sa15VQZ8unHoSQRHOXJDZ1HIlvC+tOGZeosStaL
 5o2Nn0NI/Jhm5X80Z79zJfS0blhxVeM23e3jViTSX/7KCI+PK3362GhHBqXkyHGq0Rlnx741GSx
 rn2sCAu3fJhovVw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: qjMc-6K2VJH3JVh9kqUhbXVdfTqXnJ0g
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace00c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WPyFHUJR_z9Wl-EIX7EA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX5OyyObZS3b7B
 7GMyol1h0E3pqpYRX5PESZE39rJ1CGWtRc2BYrwmWOnflvUp7XU/3qonXXCotLx5xpLR+JystmV
 B/n20h+a8JuZEpbHCSxBdFmbwPq198w=
X-Proofpoint-ORIG-GUID: qjMc-6K2VJH3JVh9kqUhbXVdfTqXnJ0g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX1QkjukJAu0v+
 GyeMIZjRrqe00e5RG8IcC3djTpFiL+bT9qwt0o9J58CQbjccvCH1iChzJ69/eyKd9RXOYZPpftg
 dMJEzdx1wRB90FJScxb2I5WjzTV46gaKTFAlF2EWLmQOAIFk8Px0R/ZR6j9L4Zanc0w+k01z2vf
 pdGRBk0prpHHm4JZegYTotNJ2fzsou+KpkXXU1Fi/sp+6YfmtqL1LVAOJyv66SYXRlizDd937ME
 E+8LuNj79pIXkEJ4sca/tbJ5e5keeRaaQOWQx0izzoU79wluw158lYnnNfNK3eEqUET+ybpwu1j
 IQXwH0cXpX8PNMxI3LsmzwrvoBSloNVKtzfAISOzy0j22JnEojzt31hVkPO7/n3Djm6ouzQI/Bb
 HwBXHxe9+OaRXuI84JajFAkmYp87CevnQABgNknBWhFDdTwTHZSH6W1UbgbFDUxJdJxK1Mp5DVa
 VyxeNzCSS02fT89nVRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130039

This driver is disabled in arm64 defconfig but one of its
functionalities - scaling down the interconnect votes to 0 when unused -
will be moved to an always-enabled core qce driver. This upcoming core
driver will also be in charge of registering the qcrypto device on the
auxiliary bus so that it may be enabled if desired.

As the first step: convert the driver to using the auxiliary bus and
remove the interconnect management from the code. Update the power
management as required and make sure to use the parent struct device
for DMA.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/Kconfig        |  2 +
 drivers/crypto/qce/aead.c     | 12 +++---
 drivers/crypto/qce/core.c     | 95 ++++++++++++++++++++-----------------------
 drivers/crypto/qce/core.h     |  5 ++-
 drivers/crypto/qce/sha.c      | 12 +++---
 drivers/crypto/qce/skcipher.c | 12 +++---
 6 files changed, 67 insertions(+), 71 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index adcbe15851899917fb3039efe89a77c8fe712bf1..b3fa1f6135bce345cc58387aac7ba803a82aff69 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -530,6 +530,8 @@ config CRYPTO_DEV_QCE
 	tristate "Qualcomm crypto engine offloader"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on PM
+	select AUXILIARY_BUS
 	help
 	  This driver supports Qualcomm crypto engine offloader hardware. To
 	  compile this driver as a module, choose M here. The module will be
diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 75a1df138dbea312ad660fa06997bcd3022687cc..6d14a5812687f977c317d88615522e27211f29b9 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -44,9 +44,9 @@ static void qce_aead_done(void *data)
 		dev_dbg(qce->dev, "aead dma termination error (%d)\n",
 			error);
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
 
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 
 	if (IS_CCM(rctx->flags)) {
 		if (req->assoclen) {
@@ -442,14 +442,14 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 
 	if (ret)
 		return ret;
-	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dst_nents = dma_map_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 	if (!dst_nents) {
 		ret = -EIO;
 		goto error_free;
 	}
 
 	if (diff_dst) {
-		src_nents = dma_map_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
+		src_nents = dma_map_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
 		if (src_nents < 0) {
 			ret = src_nents;
 			goto error_unmap_dst;
@@ -478,9 +478,9 @@ qce_aead_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
 	if (IS_CCM(rctx->flags) && rctx->assoclen) {
 		sg_free_table(&rctx->src_tbl);
diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 5b1bf7a50f88c890da1f0820fb9e070b3d3f4708..f177cbb7e57f27dbf50abc8d847e21ff39dc0fbb 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -3,15 +3,16 @@
  * Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/device-id/auxiliary.h>
 #include <linux/dma-mapping.h>
-#include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/platform_device.h>
+#include <linux/of_address.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
@@ -28,8 +29,6 @@ module_param(do_register_algos, bool, 0444);
 
 #define QCE_QUEUE_LENGTH	1
 
-#define QCE_DEFAULT_MEM_BANDWIDTH	393600
-
 static const struct qce_algo_ops *qce_ops[] = {
 #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
 	&skcipher_ops,
@@ -91,12 +90,7 @@ static int qce_handle_queue(struct qce_device *qce,
 			    struct crypto_async_request *req)
 {
 	struct crypto_async_request *async_req, *backlog;
-	int ret, err;
-
-	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(qce->dev, pm);
-	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
-	if (ret)
-		return ret;
+	int ret = 0, err;
 
 	scoped_guard(mutex, &qce->lock) {
 		if (req)
@@ -120,8 +114,21 @@ static int qce_handle_queue(struct qce_device *qce,
 			crypto_request_complete(backlog, -EINPROGRESS);
 	}
 
+	/*
+	 * Hold the device resumed across that whole window instead of just
+	 * across this function, or autosuspend could gate the engine clocks
+	 * while the DMA is still in flight.
+	 */
+	err = pm_runtime_resume_and_get(qce->dev);
+	if (err) {
+		qce->result = err;
+		schedule_work(&qce->done_work);
+		return ret;
+	}
+
 	err = qce_handle_request(async_req);
 	if (err) {
+		pm_runtime_put_autosuspend(qce->dev);
 		qce->result = err;
 		schedule_work(&qce->done_work);
 	}
@@ -154,6 +161,7 @@ static int qce_async_request_enqueue(struct qce_device *qce,
 
 static void qce_async_request_done(struct qce_device *qce, int ret)
 {
+	pm_runtime_put_autosuspend(qce->dev);
 	qce->result = ret;
 	schedule_work(&qce->done_work);
 }
@@ -194,10 +202,12 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
-static int qce_crypto_probe(struct platform_device *pdev)
+static int qce_crypto_probe(struct auxiliary_device *auxdev,
+			    const struct auxiliary_device_id *id)
 {
-	struct device *dev = &pdev->dev;
+	struct device *dev = &auxdev->dev;
 	struct qce_device *qce;
+	struct resource res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -205,13 +215,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	qce->dev = dev;
-	platform_set_drvdata(pdev, qce);
+	qce->dma_dev = dev->parent;
+	auxiliary_set_drvdata(auxdev, qce);
+
+	ret = of_address_to_resource(dev->of_node, 0, &res);
+	if (ret)
+		return ret;
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_ioremap_resource(dev, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(qce->dma_dev, DMA_BIT_MASK(32));
 	if (ret < 0)
 		return ret;
 
@@ -227,10 +242,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(qce->bus))
 		return PTR_ERR(qce->bus);
 
-	qce->mem_path = devm_of_icc_get(dev, "memory");
-	if (IS_ERR(qce->mem_path))
-		return PTR_ERR(qce->mem_path);
-
 	/*
 	 * Enable runtime PM after clocks and ICC path are acquired so that
 	 * the resume callback can enable clocks and apply the ICC bandwidth
@@ -240,7 +251,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(dev, pm);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret)
 		return ret;
@@ -269,31 +283,17 @@ static int qce_crypto_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	/* Configure autosuspend after successful init */
-	pm_runtime_set_autosuspend_delay(dev, 100);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-
 	return 0;
 }
 
 static int qce_runtime_suspend(struct device *dev)
 {
 	struct qce_device *qce = dev_get_drvdata(dev);
-	int ret;
 
 	clk_disable_unprepare(qce->core);
 	clk_disable_unprepare(qce->iface);
 	clk_disable_unprepare(qce->bus);
 
-	ret = icc_set_bw(qce->mem_path, 0, 0);
-	if (ret) {
-		clk_prepare_enable(qce->bus);
-		clk_prepare_enable(qce->iface);
-		clk_prepare_enable(qce->core);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -302,14 +302,9 @@ static int qce_runtime_resume(struct device *dev)
 	struct qce_device *qce = dev_get_drvdata(dev);
 	int ret;
 
-	ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
-			 QCE_DEFAULT_MEM_BANDWIDTH);
-	if (ret)
-		return ret;
-
 	ret = clk_prepare_enable(qce->core);
 	if (ret)
-		goto err_core;
+		return ret;
 
 	ret = clk_prepare_enable(qce->iface);
 	if (ret)
@@ -325,8 +320,7 @@ static int qce_runtime_resume(struct device *dev)
 	clk_disable_unprepare(qce->iface);
 err_iface:
 	clk_disable_unprepare(qce->core);
-err_core:
-	icc_set_bw(qce->mem_path, 0, 0);
+
 	return ret;
 }
 
@@ -335,25 +329,22 @@ static const struct dev_pm_ops qce_crypto_pm_ops = {
 	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
-static const struct of_device_id qce_crypto_of_match[] = {
-	{ .compatible = "qcom,crypto-v5.1", },
-	{ .compatible = "qcom,crypto-v5.4", },
-	{ .compatible = "qcom,qce", },
+static const struct auxiliary_device_id qce_crypto_ids[] = {
+	{ .name = "qce.crypto", },
 	{}
 };
-MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
+MODULE_DEVICE_TABLE(auxiliary, qce_crypto_ids);
 
-static struct platform_driver qce_crypto_driver = {
+static struct auxiliary_driver qce_crypto_driver = {
 	.probe = qce_crypto_probe,
+	.id_table = qce_crypto_ids,
 	.driver = {
-		.name = KBUILD_MODNAME,
-		.of_match_table = qce_crypto_of_match,
+		.name = "qce-crypto",
 		.pm = pm_ptr(&qce_crypto_pm_ops),
 	},
 };
-module_platform_driver(qce_crypto_driver);
+module_auxiliary_driver(qce_crypto_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Qualcomm crypto engine driver");
-MODULE_ALIAS("platform:" KBUILD_MODNAME);
 MODULE_AUTHOR("The Linux Foundation");
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index eb6fa7a8b64a81daf9ad5304a3ae4e5e597a70b8..6eda6e617b811420c0c3cc53988cb15a23abafe2 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -20,6 +20,9 @@
  * @result: result of current transform
  * @base: virtual IO base
  * @dev: pointer to device structure
+ * @dma_dev: pointer to the device to use for DMA mapping calls; this is the
+ *           auxiliary bus device's parent, which is the one that actually
+ *           went through DMA/IOMMU configuration
  * @core: core device clock
  * @iface: interface clock
  * @bus: bus clock
@@ -37,8 +40,8 @@ struct qce_device {
 	int result;
 	void __iomem *base;
 	struct device *dev;
+	struct device *dma_dev;
 	struct clk *core, *iface, *bus;
-	struct icc_path *mem_path;
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 738454dd35655a8376bc878444fcc3fbd7535956..3dca00e53e473d3d2f2cf02cf12bdd38e51dc539 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -48,8 +48,8 @@ static void qce_ahash_done(void *data)
 	if (error)
 		dev_dbg(qce->dev, "ahash dma termination error (%d)\n", error);
 
-	dma_unmap_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
-	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	dma_unmap_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 
 	memcpy(rctx->digest, result->auth_iv, digestsize);
 	if (req->result && rctx->last_blk)
@@ -94,13 +94,13 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 		return rctx->src_nents;
 	}
 
-	ret = dma_map_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	ret = dma_map_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
 	if (!ret)
 		return -EIO;
 
 	sg_init_one(&rctx->result_sg, qce->dma.result_buf, QCE_RESULT_BUF_SZ);
 
-	ret = dma_map_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	ret = dma_map_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 	if (!ret) {
 		ret = -EIO;
 		goto error_unmap_src;
@@ -122,9 +122,9 @@ static int qce_ahash_async_req_handle(struct crypto_async_request *async_req)
 error_terminate:
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
+	dma_unmap_sg(qce->dma_dev, &rctx->result_sg, 1, DMA_FROM_DEVICE);
 error_unmap_src:
-	dma_unmap_sg(qce->dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
+	dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, DMA_TO_DEVICE);
 	return ret;
 }
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index adad399c2026d7cb3057ca4d6a4766276d01e045..178ccc9da7b969401ef854fcae47f0c40ce5ae4a 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -48,8 +48,8 @@ static void qce_skcipher_done(void *data)
 			error);
 
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, rctx->src_sg, rctx->src_nents, dir_src);
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+		dma_unmap_sg(qce->dma_dev, rctx->src_sg, rctx->src_nents, dir_src);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 
 	sg_free_table(&rctx->dst_tbl);
 
@@ -132,14 +132,14 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	sg_mark_end(sg);
 	rctx->dst_sg = rctx->dst_tbl.sgl;
 
-	dst_nents = dma_map_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dst_nents = dma_map_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 	if (!dst_nents) {
 		ret = -EIO;
 		goto error_free;
 	}
 
 	if (diff_dst) {
-		src_nents = dma_map_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		src_nents = dma_map_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 		if (!src_nents) {
 			ret = -EIO;
 			goto error_unmap_dst;
@@ -168,9 +168,9 @@ qce_skcipher_async_req_handle(struct crypto_async_request *async_req)
 	qce_dma_terminate_all(&qce->dma);
 error_unmap_src:
 	if (diff_dst)
-		dma_unmap_sg(qce->dev, req->src, rctx->src_nents, dir_src);
+		dma_unmap_sg(qce->dma_dev, req->src, rctx->src_nents, dir_src);
 error_unmap_dst:
-	dma_unmap_sg(qce->dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
+	dma_unmap_sg(qce->dma_dev, rctx->dst_sg, rctx->dst_nents, dir_dst);
 error_free:
 	sg_free_table(&rctx->dst_tbl);
 	return ret;

-- 
2.47.3

