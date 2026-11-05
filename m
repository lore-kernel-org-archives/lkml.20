Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867325;
	b=BUF/5ztudXeNsy129wToHu6S5T5M6XNQ8iIn1+uIDgso4MHk4lc9S9gJdK6Of7HOEs2r
	 XWlZgWr/hQnQQwgAbnILfR0rlTl+IE0feyJyNiNNAdRAkdjti8G9qHiQZxmPZWrTsPrrP
	 YK3z60ftE0FEfkB0j1CuouGmDNfe6S8MTpOnZUsgM41UCX8aSnt6y/cgGDgYBitBC51Jh
	 ftyfMxeqCeJTlzZKsN0XTooaVN08YMGNvgMnH36VZj7zNCYtSrfxujavqyfY1HpuOMbrH
	 2zEphjQm+ruUhT7NzHUW0ctwWc5NgjG2VtZjz9xHqYyToqs4d30dOo4d0u44jeQnFzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867325;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JNui4Qkn+bm95BakvVMA95vXx63ZQS1k5xaXKKrWKcE=;
	b=1MxToVNaUbHd4tyh+mHYNvTDABPLMuE+KM8LS1QIywu4Hi2Ew2Z/kKL/twOIgVE/zlZQ
	 77f9rsxJRFof/pey1BvvbYA8eBdfQ1rnitLrQCVNrnZhRXhWm0OdfiyCnatEw7kWq+X2p
	 z8S6qI5zYIXOACRer1jpiYcRVR6AUrsH/9GniOH/Jt44cPcZ/NK1HNrxzM08LOYLNGsGu
	 ytR4FmjAKsWYTbjhqD33mt3r4W/d/zeldE65oFHTcA4e+6H0Op8alDkOBBIB92ui+ibap
	 lSr0GcDwDP11TfwUV27WvM0PdqrNkdw0NLLArjjQJOnvMPgAxlTzqRtyfjFN9ZwwvIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="J1ofC77/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E/TOWu2g";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A4606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87A4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J1ofC77/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E/TOWu2g
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56TxPv3073320
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JNui4Qkn+bm95BakvVMA95vXx63ZQS1k5xaXKKrWKcE=; b=J1ofC77/G1ZM1pEa
	+YnHtKgJT1bEpg+QNw2bedW43NVmBj0EKBU2qOvsiV4kz/v8KjUPdezb5PryL+YG
	J+SINLPqZOIRBJoc7oELWZJuyY83FIztpv94gXar3C1pTy8gqMPz6jpJeAG0/wkF
	so6E9hHtcRvCECPmZwqLceh7Wwf3onU6sJ0oU6qR1KCSLPSRtoBIBlB9URNjdlbI
	51iaPcLJLS7kaz3fW7jDspJBRcrNQiRgBdIp0CWcgN+n1B0hGcGyi7sK5NJ2/mXI
	NKl6r4LHd9rMKRX042T995nJ05KRAuZjR4uXRPoQMiSR/5ZC6K7faYHlYz63ioDe
	pynJKQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8nf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:28:43 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae356241fso549030e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867323; x=1794472123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNui4Qkn+bm95BakvVMA95vXx63ZQS1k5xaXKKrWKcE=;
        b=E/TOWu2gcpnYdAwHn/eDVeNPYp8U6yKpWdXyvAGFap8S5RbmHLZwpaodl5p8c5C5vK
         TgFRLVnHKWdPVAKpmxiXVhtApQ7iEM9IQepBPn+Fu+NcV/cH12uZcNqPX6LYcEKzJVHa
         Uu14AQUH34MVoYlylvKoYIFzu02Q3Nooz2wJs3SNAZ6YLUTXo1cU4u6jaRbYqQd3QxN0
         0Go3x1gaij3oCHj8DMNcEf8YyQXnG6iLd4pvlhHKiplolUYE0FxitM60AbFSmJ9XPpCE
         ypzFWnb58Plra2N5JY4wlgTv7+pTg3OVRaAP+iYOy+qFJpA/3yRVejB6p/uRmgnsvnuY
         DpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867323; x=1794472123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JNui4Qkn+bm95BakvVMA95vXx63ZQS1k5xaXKKrWKcE=;
        b=QHeAk3eLhOVDOs0igIiYvYxzt/pqqcxFds+cGqneGoQEFOdkrV/IWna4rjYT59MgpK
         AY7un2E++YX3yGLBB58xEXdOGaNhw2Dgm6QCp4AoOOWvf0IDhQVZAYRDEpoYY09njuAs
         v0wZ0rn5vXl08/kRA0bdHgFMfzWm6h9hE+ZXgKEUzURTsjU5dD/l6DChy4LQeafYmXa7
         Z/wOKLtnoUrhYpdjTFiEuCUyIGw5h+S+BAebWt5BUiqPtMPAMgTAGtBI0Y4G3QC0h7g6
         RCqYNUsthgn4Bb61UlruVEQ/+U+4/QooVzec1hOYvPTqVVT6FaTjkmizZ80gx7/JStn6
         oVqQ==
X-Forwarded-Encrypted: i=1; AKwUvByWfkyTjHAbQMRMmf2P4MILgIqI5WiocIHWvh97VLPW5uqeN8Xi15IXOOSUKhFk8iqSy+uv5wWMkgK8+jc=@vger.kernel.org
X-Gm-Message-State: APuU4Z885AybgKxaRwWTkKMYZaqueM0qOSNP0csE2hqRoTDwH1tjLL2Y
	ybubaxxicCU35mh7LDmKWlado5Jd9XSQREhH/H7o8QM4LD/sd3hcwnFFTNZ3SuJPzpiCz4ZZJGI
	VpctGOYRIpPG5LPDZVsgK8bLbc5AslKfSzAdkNs/OiMvo5fCfBuCFIES4yG4LLTH8lqg=
X-Gm-Gg: AYBFou0cinZCU/KLAB8zaVlkyy4Vmd/sVd6dRaceW+WkjQs6FEr2oha9pNxxuYCmDbE
	tTdVZhgd3YvdX3LtkrqU/cL7bRGeKhydr7IQfxecAG6D/GlLgDQ6SNdJgCGP/kgpr9dkTcAgjpB
	w6JnMYZHBpcZB0CXTrDV/ZNtON4tlEPAmRu4yBVXgi9/aN9XXS0ROMqI552OYB4vceAmfVxhRjQ
	y4Jay6eo67lUEF9JZLvMbwgMuDbXimXHzQbWUECij8bVDRXdXo3LCUdvlnAyTSs4CFf/IBNl2Tn
	wveoNVA92xf+9Pv+eP/IkmJFSVq/ddFbcKlmU2Q8DKxJdm3OAIQOYHFcHcO5kJE+pO5RPGxobc/
	1hg0zTfpZ/9qdgO1XFzMgDR9guwp+oByzOSuNCw1W+mgYUp+1/hDPKMdq/rQOTS1WZho9uUN1d1
	pnJQ==
X-Received: by 2002:a05:6102:5811:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d072c25cf0mr8020964137.15.1793867323060;
        Thu, 05 Nov 2026 00:28:43 -0800 (PST)
X-Received: by 2002:a05:6102:5811:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d072c25cf0mr8020952137.15.1793867322529;
        Thu, 05 Nov 2026 00:28:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed55249csm7406821f8f.35.2026.11.05.00.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:28:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 09:28:35 +0100
Subject: [PATCH v2 1/2] power: sequencing: pcie-m2: fix use-after-free in
 pwrseq_pcie_m2_vregs_enable()
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
Message-Id: <20261105-pwrseq-pcie-m2-uaf-v2-1-3e1dd415af9a@oss.qualcomm.com>
References: <20261105-pwrseq-pcie-m2-uaf-v2-0-3e1dd415af9a@oss.qualcomm.com>
In-Reply-To: <20261105-pwrseq-pcie-m2-uaf-v2-0-3e1dd415af9a@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4550;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0304nlyrASjIizIgHrxb5cCOJaky15ZUTx1KTLIrvuw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7D42+pEc3B7pwciyNHYLTgpbQlF9IfM5xDT+c
 NqXR8C9+NWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauw+NgAKCRAFnS7L/zaE
 w9e4D/4+zwkka/uRQgQc6uO4Qr8/BmxsuXdZ2Rm2gxUivZWwtg3NdF69ixJxDWUY0cQ7Wn2tCE8
 N++X9sP+r1pvpCQyZIXsl9eEWtI002l1KzEgbZzo9W3U/4BPAOm4x/V/6/tuboEQysrH+1Sz4ac
 7UoM9PI5PfHidfacZiT7Sz4Qh5EL32q9aebTlxl+1XkZxFkPAeQmQZ1zCZDjdYmf5SnifZGrj5E
 sEo5orXR+tZm624WL5x/1v5xB8S1VgBle2dxGjBNXR0TB4V/vY0Kw9o9uska/W09wk7HorsEv61
 ZzaMOCpjpsvj4ShqbY53s/O05QU0Kp10Is88JRJU81WlovRWBQfhBUJzlC/v6C+zEL1ho+XG9AS
 reC8hYRBVTtRBKIm01ES13KDD+rZUm6j4FOLnw7mR8+UoqI7KN4VgWoVBNQgnEtUq8OwBhiYOst
 MNodFCGwEde5DfVBkI5tJBXGL3xmN1CjJU7yIm2HDIHDbkB9RBbqseBoDN1oUVlnF5CAl30/z15
 2XANZJOd1RxdUdAqVcZzKsFmOuCkAbQtNT1SYVN2FJRWyc5LCm9m/V/4I6w5zawp/OHJ2CDQgq/
 MrjvmmP3UiGMIiv6ejDRzEFNnfSDQ8hiw9UYx9RSj0kD7oi+URGBKVGluD4DJSPqPX2cQhZYw9U
 sSaGqixYTUF8L1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX+aJhXoVgjbG3
 +rC2pPdjzKYdbXpMxGzvldTpVYfT1CCnygQDqrUjXNG88iB1hF887lLGVV/vIk94qO0J2DGcx6E
 JMmmobUmIk46uBmymbVgCYaayoiq4ccppkRkEhD6jM7SfzzLhmyWTwEy12LtTCF8vdbtvjRBYL5
 5/fcKqyLqeqq1pkcYXnyeUlBLrf7Gew7wOtSv8SsK/pOH2VYekFryynOaUspEigOuocAcS6J47W
 TvrXD1tSgvMi8p5N54AJbZh+DAHhafjlHNMyw6lTMTH0wKNOuKqivmyVgpLzbPAhP7E8wMh9ZMv
 4XBasBoGZ4Vl37c07QM3CQJ4xy1SZzvFwYOC2ptDws0tOF2/CEI+CtLpPTfdjspICvPCCdRs7i8
 iyxYI9oliJptPOy3+eYXgVCA4mz07Ifm94z2f4cuv7lHtnCGrOAakxDRd8HCjzBZarDcqDh+ctj
 a+uBPdtAfAExFPpRa0g==
X-Proofpoint-ORIG-GUID: 0ACb0HauGLqZ2mPmcHDXEvFJtzIhCVny
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfXyozyDzKcLL5Y
 SEDUj/mPZBl/CRA/7CpGiuAMw7gkyddGidoCg5CCwR/nI2akk54bpRfBbG29VH16nRVaJX2iaiC
 JYqbVdol39Cp5SLXWLFEkDMMJ1VT+eY=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec3e3b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mM_0bNS9DA9p5V46oFgA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 0ACb0HauGLqZ2mPmcHDXEvFJtzIhCVny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050033

During device teardown or on the probe error path, a concurrent consumer
access triggers a use-after-free in pwrseq_pcie_m2_vregs_enable() or
pwrseq_pcie_m2_vregs_disable() due to a lifetime inversion between
devm-managed device registration and manual resource cleanup.

The driver exposes the power sequencer using devm_pwrseq_device_register(),
meaning the device remains fully registered and accessible on the
pwrseq_bus until the driver core schedules devm_pwrseq_device_unregister()
to run after pwrseq_pcie_m2_remove() returns. However, the driver performs
manual resource teardown within pwrseq_pcie_m2_remove() and the
pwrseq_pcie_m2_probe() error path, prematurely destroying the backing
regulator array.

This creates a narrow vulnerability window where the globally visible power
sequencer is backed by freed memory. If a concurrent consumer invokes
pwrseq_enable() during this window, execution is routed to the sequencer
callback and dereferences the destroyed ctx->regs array, resulting in a
direct use-after-free and a kernel crash.

Schedule a devres action for freeing the memory used for the regulator
array to ensure it runs *after* the pwrseq provider was unregistered.

Cc: stable@vger.kernel.org
Fixes: 3f736aecbdc8 ("power: sequencing: pcie-m2: Create serdev device for WCN7850 bluetooth")
Closes: https://sashiko.dev/#/bug/linux-bd17e5b1-a000-4717-b392-0ff0c2a9c376
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 56c5d51293c10faba6c978265bcd07a6980d2a52..60990760287fdd51c29ccf0e3b97a244669e4837 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -533,6 +533,14 @@ static int pwrseq_pcie_m2_create_serdev(struct pwrseq_pcie_m2_ctx *ctx)
 	return ret;
 }
 
+static void pwrseq_pcie_m2_free_regulators(void *data)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = data;
+
+	regulator_bulk_free(ctx->num_vregs, ctx->regs);
+	kfree(ctx->regs);
+}
+
 static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -563,19 +571,19 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 
 	ctx->num_vregs = ret;
 
+	ret = devm_add_action_or_reset(dev, pwrseq_pcie_m2_free_regulators, ctx);
+	if (ret)
+		return ret;
+
 	ctx->w_disable1_gpio = devm_gpiod_get_optional(dev, "w-disable1", GPIOD_OUT_HIGH);
-	if (IS_ERR(ctx->w_disable1_gpio)) {
-		ret = dev_err_probe(dev, PTR_ERR(ctx->w_disable1_gpio),
+	if (IS_ERR(ctx->w_disable1_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->w_disable1_gpio),
 				     "Failed to get the W_DISABLE_1# GPIO\n");
-		goto err_free_regulators;
-	}
 
 	ctx->w_disable2_gpio = devm_gpiod_get_optional(dev, "w-disable2", GPIOD_OUT_HIGH);
-	if (IS_ERR(ctx->w_disable2_gpio)) {
-		ret = dev_err_probe(dev, PTR_ERR(ctx->w_disable2_gpio),
+	if (IS_ERR(ctx->w_disable2_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->w_disable2_gpio),
 				     "Failed to get the W_DISABLE_2# GPIO\n");
-		goto err_free_regulators;
-	}
 
 	config.parent = dev;
 	config.owner = THIS_MODULE;
@@ -584,11 +592,9 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 	config.targets = ctx->pdata->targets;
 
 	ctx->pwrseq = devm_pwrseq_device_register(dev, &config);
-	if (IS_ERR(ctx->pwrseq)) {
-		ret = dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
+	if (IS_ERR(ctx->pwrseq))
+		return dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
 				     "Failed to register the power sequencer\n");
-		goto err_free_regulators;
-	}
 
 	mutex_init(&ctx->list_lock);
 	INIT_LIST_HEAD(&ctx->pci_devices);
@@ -613,9 +619,6 @@ static int pwrseq_pcie_m2_probe(struct platform_device *pdev)
 	pwrseq_pcie_m2_remove_serdev(ctx, NULL);
 err_destroy_mutex:
 	mutex_destroy(&ctx->list_lock);
-err_free_regulators:
-	regulator_bulk_free(ctx->num_vregs, ctx->regs);
-	kfree(ctx->regs);
 
 	return ret;
 }
@@ -627,9 +630,6 @@ static void pwrseq_pcie_m2_remove(struct platform_device *pdev)
 	bus_unregister_notifier(&pci_bus_type, &ctx->nb);
 	pwrseq_pcie_m2_remove_serdev(ctx, NULL);
 	mutex_destroy(&ctx->list_lock);
-
-	regulator_bulk_free(ctx->num_vregs, ctx->regs);
-	kfree(ctx->regs);
 }
 
 static const struct of_device_id pwrseq_pcie_m2_of_match[] = {

-- 
2.47.3

