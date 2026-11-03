Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700413;
	b=0uyqvb4CP+3kyq5Hl6pUfQt3INBN6upCVlNvJWEoefQzyfq2z7CI7r/xGgp98SXWbOp0
	 HmT4oJNWaMLgBiczvbg+w/asDKw8NhcwxWsA+35L/WnyZorq+4YfK+IyB45Yak4vDsd74
	 yTDbArAHs8kfC1tL7Q/cA6aBYweS4E18btlsNimpdgvYq2gr5fq0NLkd2/dplw9lh0T5Z
	 AjrVh7Vus51s8b7XmlHKD6eJaM6bto8+tbePrZ7Par+YXqpDkZp6OKXgaIdPkYVX7FjYl
	 cft1kwS7aufz3Apr+Hi9HJtIrM3O3OZKqVXNUBPGQ48YQHY5R6UtiAZZ6fQ+shDiBeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1RbVAc075xQofPostJ8mhRH6wVLYWfxo6Rcdp/ll7Yo=;
	b=TstNe2JKRU+PgTuRRP6ueZQB/fsIbptMI/ze1B68BMo1CjbA+IWaHP8PNLxXWzIDwpc4
	 IANay5MIt0qsmY7jQ42ayIJ+GIic+1J122/vjxatYLq6EA6NZ3JC2ZRLaXjoek8XzFT6S
	 5YPe9A/WOz1oI98p67wKcEy3W0jAgYfNr7MFNb6lNpDYF/4A+i7e6d0RWTIbv1xuQKwpG
	 J80xNPrTnL2rJHlhkKC6GwNLgagfI+WG3f3MqTBfVJa5JkuaUyRteBYG0y65Vv8K8S6KE
	 LTleI6lrgOEyo2aY5MGC3AoeWyKrGvAUNa1wKdf4AEmDRHkOfeIXJ442k2+hMsq/e2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cy1uvJpI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFC82jEw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457B606D802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C457B606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cy1uvJpI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eFC82jEw
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38G1rU1433948
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 10:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1RbVAc075xQofPostJ8mhR
	H6wVLYWfxo6Rcdp/ll7Yo=; b=cy1uvJpIIU79xQq5ZgeRrrLvso5iaj0fckZDhW
	AHJRSyJBJLAT64z9sF4rqDli4G2fz4FnAjny1FMFfb/m4Tt39Ubi2A/KB03r2Fwk
	AQo6+/lwPbUo1DgHgTOb1atmruVJsZqdyF3bp4GBMpYlNffTOmZOl4xw5RCKpywc
	uKJTmcqS6V5MqbyxnzwZpnQVMyJmdslGQCsXqUqXQwk/JTaG/AFH4O4jDM2BKZDv
	LjZy49heXLG9bksxGA+Mw/XNDbH7ITGcLpI/dMbPFgDxWgglS4BBPXXMdYDfjab+
	stFiAtM5Pm8EO11sFwmY7wmfSzitbWREfNI5pGH0Q5q5VU7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjkdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:06:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so3234665a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793700410; x=1794305210; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1RbVAc075xQofPostJ8mhRH6wVLYWfxo6Rcdp/ll7Yo=;
        b=eFC82jEwD3JWTxZXHZ/3VUbjQIuT7w3u63bv5YeRrcwdnfUxgjhmiz8ffwKYh4pXQd
         1qCETLeu0TtPhi4df2iHiNvXGizi4jkQcDmYkZVI1jwQWbNNUWL+hJ2w+8AzwQ0uTnNY
         D+1MrO7H8zBEBzH6aSoNzwZjgO18hCR95PY5/QxpaMqOB2vqZ3ORW1Yg446k1pPq4whc
         Sj7o+8sHTphnEQsnjDjnK86ZKdsJD1XhXwgSAWQ0HOMCX3jvtQMv9kTFOBlz/mtKgGYy
         p+Y5rlnrpHEa2EwIu5Std/Ln4IjOVwInTxLmU2wI7p9a8lYQ/bcZqIftatBrCwYwtU17
         FKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700410; x=1794305210;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1RbVAc075xQofPostJ8mhRH6wVLYWfxo6Rcdp/ll7Yo=;
        b=MXpMasOSG4sP1F/vS7V36WHn1iDqPRFgftuUMZHJRi64RfdSLRpP4Y9Vt7LM99d1mX
         ndNpHNbCMHin5NcIdsBU8VtcgSN7zsBp227Boy1hUBjCEr6D4QiacKmi/yG0cP/1I/eQ
         KWeZr5c8r4r8jDx0tP+wZzcfyYkHoAaVZ+hjQDXVRrmWY9thwny3i2UEYy5eZp879SDa
         ddTfPPEYjHlbVPNRHv6RsCLKNct7b82WiwFgnRSb8sUG6ildWz1BZz61goZx3KUxuhBc
         kqZGVt+wuESpmkiN7QnTvgmBrOzfFprJeJJLO38yLNK1rFLnSp2TrDHTI7A5XwifCPb3
         Xpfg==
X-Forwarded-Encrypted: i=1; AKwUvBxYhvbuVYh1wem0yyHCB2VwTEozUfiFaecKuM/xzfLv3p4UKBe6SE5yCpgpbYGfkfMSist9lGgOrkgbLBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N7bGC+D/YjEnsolulArmqxsqw4MQIoIDTlzodcQTZh80lAdE2
	4z52/rGojyyFE1JAFxJ9syeK7H5HKQ4Vz1+cDLgw0IvH6QVlRlTwrgGb6smPCg5iWvpAZ61Ge0u
	oSw6kX9gj6hfSilX0OLlxCKUlSQQ2QSjPk2qYk703xBoXGaBs4KYP7tDcaGobd3kdjy4=
X-Gm-Gg: AYBFou3zgptiCbabGI0UKiP+gd3+lKZZSg2x1vHXiJQJq3xvNe47S5bj+TS69pRrqpz
	kpl+B4Ach/n1htbS0XNNbRNWoKA+isGLnWlL/Lv7Be9Xl96vlMSXdzbWNCikNQDxGgeaMbD6p2i
	mvi4GD5JfR+Dui0bM0sQ0YwwgCyHhBmvmM37a6iPxELcF2Er7AckTf1ygmz0DAF+jVG8MXnjf+E
	tlvSNd5OmdqcEZtbUquYZjXcWFqKutMeNif6P1x91/0OFsFGDq5ZOHy4sJNp0dile8Z50UctxXb
	mLnG4+N7PF/tE2gFuMMFi8TcZ0wLhFDchHv2JJNf7LwvOYxjMuC8HFXthTOy3YUhWl0ocrj7yhD
	z1rtDuIuYwlCQ3E53jiKpVjzumqlULbrgSIukqAk053vr55ptM9JHla44I+m46kLNDzaM
X-Received: by 2002:a17:90b:3c8c:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3ae89735d97mr9768766a91.25.1793700410215;
        Tue, 03 Nov 2026 02:06:50 -0800 (PST)
X-Received: by 2002:a17:90b:3c8c:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3ae89735d97mr9768743a91.25.1793700409664;
        Tue, 03 Nov 2026 02:06:49 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3653640a91.10.2026.11.03.02.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:06:49 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:35:16 +0530
Subject: [PATCH] spmi: pmic-arb: bound id before using it as the IRQ ID
 field in spec_to_hwirq()
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
Message-Id: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANux6WoC/yWMwQqDMBBEf0X23IXEWA/9FekhiZt2S9WQbUUQ/
 91VDwPzZuCtIFSYBB7VCoVmFp5GBXurIL79+CLkXhlqU7fWGoeSB0ZNRF8CJqZvnwtlbQveQ+t
 SMuRN40ANeuh82rvnxfIPH4q/QwnbtgNZUYUMfwAAAA==
X-Change-ID: 20261103-spmi-pmic-arb-fieldprep-fix-5b63ff0ea043
To: Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793700405; l=2042;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=clyf+3AonUFIKKQvLMzFV7jj8ys7pb4VbCtLEqPQkpc=;
 b=c7OKlLx43t25IplywCobKfr2BRNnstQfKZrF9K43qOkcCwiKIlTgDUFKyYMLLCC/RSnZzxbc8
 CsONikjfbSiAZ3iLQd/ISpBxooI4AcPj2Uqr65rGzRgVOK+tTZkddc6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9b23b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=IBRSta3b0AKKeUE04AkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MCBTYWx0ZWRfXw8YwIYXK+6kb
 KILyGipNQp1fW+Cb87RJ9paOV6ErW5f6CjEPgADpOVreaisWJOueY6RRoo4f7yKpUwPe785yV1O
 9YP4n1htU8yrQxZlfdsidTRFE/95yVIIjxzTSVpm8OcfuqhDWOLLHWwnMBCyRyrdK4wXCSzmaFw
 pK2bagyH1CPxUEqGlTec1ijy5cGgljjgCDN/2+EVO+FYWQVu7uGZU/86whMsMn59h1S6BIuJLfV
 YA2c/80VltwF25IEl+4un2UreS1NsdvOFX6/i806lyARtl61DxdRpQ8c0yrtUYv2n6YRbycvDeD
 5JJzQDg+1VYyfpP+gBg7yC3hS4OLsso0RxMEkbiUDbMuCFFzAnzbJR4zFpKvx9kw4Be0fniIJWe
 kINbmzNxx05ay+uvO4FIAHJnW5Dc55RCXXCRNgz5UeDfm/qQ6FmgIZeOUheBNRRmaCtva5ntCP7
 NqnAO8OurXDV7p7Wk0w==
X-Proofpoint-GUID: pyB0DxTS4qAkyhDqKls8Q4ZS8Z-yU4K_
X-Proofpoint-ORIG-GUID: pyB0DxTS4qAkyhDqKls8Q4ZS8Z-yU4K_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MCBTYWx0ZWRfX9NLrvYQ8a1MK
 L3A4FIL98/ISAurWtgKjI0iBDnoOntgatomAgVac2qRpffeGfkr9hseMIy+5Fc/AYqXcCE2EXSG
 n9Qd0w1T8RcweXrCc6Ou0SjydMN9vKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030040

periph_interrupt() derives id from ffs(status) - 1, giving the compiler
no source-level guarantee that id stays within the 3-bit range of
HWIRQ_IRQID_MASK before it is passed to spec_to_hwirq()'s
FIELD_PREP(HWIRQ_IRQID_MASK, id). On targets where ffs() has no native
instruction and is expanded in software (e.g. MIPS), the expansion's
internal handling of the "no bit set" case lets some compilers prove id
is a literal that overflows the field along that path, even though the
enclosing while (status) loop guarantees it is never taken. This trips
FIELD_PREP()'s compile-time "value too large for the field" check.

Clamp id to HWIRQ_IRQID_MASK's width (via FIELD_MAX()) right after
computing it, so the "no bit set" literal is bounded to the field's max
value instead of overflowing it.

Root cause and fix were diagnosed and verified with AI assistance.
Reviewed and tested by the author.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610260532.Zb5KDgRE-lkp@intel.com/
Fixes: 815be38ad8c8 ("spmi: spmi-pmic-arb: add support for PMIC arbiter v8")
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/spmi/spmi-pmic-arb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 402ffeaff8e2..6f8a490f47a3 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -736,7 +736,7 @@ static int periph_interrupt(struct spmi_pmic_arb_bus *bus, u16 apid)
 
 	status = readl_relaxed(pmic_arb->ver_ops->irq_status(bus, apid));
 	while (status) {
-		id = ffs(status) - 1;
+		id = (ffs(status) - 1) & FIELD_MAX(HWIRQ_IRQID_MASK);
 		status &= ~BIT(id);
 		irq = irq_find_mapping(bus->domain,
 				       spec_to_hwirq(sid, per, id, apid));

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-spmi-pmic-arb-fieldprep-fix-5b63ff0ea043

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

