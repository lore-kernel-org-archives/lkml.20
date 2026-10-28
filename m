Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181136;
	b=0Vd/ArU/C1LucfsR1vggBURx+FEkAwYkrxRRPivpkfOYa9XgGWlNsTKEx4JxDqQyaG9Q
	 ZMrZTqMSfueiMq4hZc4YgtcOYeXEpLHZ64DhbXIl9/K8YNf2bxYjTOKTyhQ6a5cX7BQb6
	 LpqMKTV37Kw+JJ04HxVu5W/ltBAuxFamc/0Dqp+v83XyqSqSG6s9YDJorQGR9OESHPQIf
	 uhR36qHGoQhuI5RDjILlnlWjEV85pCSNHemsBxzFT2M9cQfNkbLa2qAWC8dQWYki1NESq
	 +BrOSvxr3mA4P5ZzRXP/QufFui1/p8urfXU6sbduiHiUgwR2EsRchNR9j5SI/OjJHRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181136;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=;
	b=zq1oQrb5PuE4Gr8jB9+Zp21qobKdiew3MociOwZjfYVDW11QFxAEY6jHx9ye0Zd24sVU
	 d3CQQH7rB0+gRC66rKAdze501jY4BM9CxZMPAWj0F8lEdMIrzjz/oy5c35qktbM/6Q7HT
	 W5F0fqrxlIKmaJ5Si7J5K8daik94T1UolV+vgHFLcOgPLMSFW9b26xXtWmZVO5HQz7GJw
	 I4QZ/mgamZAt15U0HVkRw9x6yufCCEkFMD+RBBr0NiqTydTARL32sX0sZfXHRNSAsu6QP
	 pXRpMnMc72ZQ+d1Da60wyzmCYjnDP8UHBQ588+MLq/Qwja2Qef1t7eON51f/60BQqkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPspIupc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1DW7NLW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30A606A334
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD30A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPspIupc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1DW7NLW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K92S1642886
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=; b=BPspIupcSsvi9haB
	HEmX2Rdz2Wh7xh2QeYMqT0HYM2hqzT4OH9tW9+7+TqdTcjD93Y0VYYax0/0CH29p
	8lCF832cadaNYTkohSy/P36xpKZJJ6zs2uIuUT2NG8TkpNiNxbew91I3fDUd2xc+
	kpyQz64yewtWn65MARq4/AYYfQaAQTMOGGu9PcggPgtIWNGjr54sQhQLC5jwbu+4
	6txX5VmEGSfX+XTKkGl2KssdLuc89vmILik5k4TVM5kOHxBnWdLonITJwWgDCqsr
	cNjxU0lvXGbuqbkm3M61azBVcLLZmLESPD8GWVBlcBe+ri67DkeZEB920Q0YHmYw
	OyH0yw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpudmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:52:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so143764785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181134; x=1793785934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=;
        b=V1DW7NLWm10Jvk03QQ/3RvAhA5pPeFNGHqO9wsTSfM/Tatrqzn+/oQ9fMiimb6mPeN
         +O/Oau3qdQgRmxd4QROowpwxnxwInb+Wr/JTvR5hMwVm/7p7GTRutwOX/z2lqWIzfMu8
         GHJgbVgZHMLx7SO38fKE99NWST3H/DeDlENttq4oL1XIIPMAbo3GfKawKHAQ3Ye0VZLr
         fX8oXamk4HcZdMsEfsoN4lRLHQ3WFY1h+OIM63fNp3e6f1Ldei2hVEOPZ0apdKeg5e35
         DzmD3Xd3ebvOO8yFH3BmuECKlYeR1JY4P5h0TNfRSmB72Q3x+ZAmIi8MbmE2F7jHuXbU
         hFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181134; x=1793785934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WA3U3sUuE5dh8dNgrTZ6JUDGlRkXnB+4Gzwut2u3nc=;
        b=2um7eRCM/+nRc2OrbIP+66eeRfZHpfJP1QaR/vmK8c5Bh7dXPCsjhXIuilvJFsd2NR
         ULITRIQMRGh26JUGbSkeOIhnG6UJb3zLGz+P5ArHgYAinPoeAOn3ilCA3IFfhg5rsrgF
         Tywv/XKf6hbAT2Tf1V/UzzAPQiagjWGLUEsoNjrUto0k7QBeKYL1yZFvDnFHTzl3kEi6
         cAy8Mm8YibddQUo8AYUc1fni6FNqqSU60U8SuxgFdLAVIBwTFQI3qNyB4Pnbb6byHKK1
         dU+lXtr1UPWzFHVQSybBeNh+rnVJnOr+DjEd5rwi6QtdBFtiDVig0RvxeOzdUA/TqprV
         DZJg==
X-Forwarded-Encrypted: i=1; AKwUvBwyKRZo952uYA2uUfj+Lh9jy/yi9Q2UcryFOqn15kmR4SVW1s8RifL3OGK2eGE4/Kt1YPiMzStkvqtTERk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ5hlq9ZwzxJFcc6+rl9o2OuZQjNJOyC/tl86E0EYo23QZ8ciM
	hLNtFb6oC7eP3TaH0fLpsugw9sHQfJnxT481DPSOhOJG1cQ6Lg8gO72YiCtYYQ9x2JVcwtaxLrY
	B88HvIKRyD08zEeFO3rlDoSMfjX1Ob86banB15tJ79yqxz9mstlpQ4uHWcO0FWCCLidc=
X-Gm-Gg: AYBFou0D5hwTA5T59XPLYkrUR1yqVb9mv7UcTIMYxb2gPdkSkZ8pno30gGZBwymASUQ
	P4XZ74+Qo7PoRJtBzqvLDde26biPef5Ndmaoy7FEFP2yf8umezZ3hRQfQsyt9+WnkW48R2+5o6x
	b77m2YYVxjy0gKyvorj+0gsghS2lEvrAHGrnMg0i1N33JEkIDxq5gxvPcA13csrPvjon4Vb0VyJ
	4zevrkz3Cx8qdWiAvsic+MMq0eUwbP/VtEzjyuWBwKYG6WYZBOXf0mVMJETFPqlBxi1VVyCCZDh
	6vwS6QqVioBLI1Yqddq0lLbJie8AnuRf8HNeTACRMp2Rf3pyObFW4m780Wh1C06WSU+c+Tjz3Og
	/qlnMJ8dWYoLJax+Uj1cbdOapByQzxDqLeuFIw0kHGbwN8MTtGgQoOPkGwKA=
X-Received: by 2002:a05:620a:45a2:b0:939:a003:7127 with SMTP id af79cd13be357-94408d61863mr227266585a.52.1793181133698;
        Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:939:a003:7127 with SMTP id af79cd13be357-94408d61863mr227261585a.52.1793181133055;
        Wed, 28 Oct 2026 02:52:13 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:12 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:52:04 +0200
Subject: [PATCH RFC 1/3] clk: Add a way to restore the clocks of a provider
 after a power cycle
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
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-1-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4249;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=R7OPp69UUHsoM45Tq0LsjlUIHam/eQ9Eg5jV4WSy1Bw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq4cXH40jsyfn2uWVVpD4XgtFR05IskSEQurpPN
 nkWkSXSe/eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauHFxwAKCRAbX0TJAJUV
 VoOOD/99mJfp2dYwERaYqebAnLDY62/wxdKdDrQNlryNiQ2eIgvF//s6rfXNKd3GK/BI2ly7ZKv
 J0ceS0JzmNb+Af4Q5rlMMqoYd8t1AtWDzcCkxICsHZ8ZBu5ir8A9McXBa8p8KJZiO7w9UVtEKPo
 iyliTpC7rSXYZpcO6V04yG88gdrR4URwtTlxzS1E4zWmflT2PCIHNxOy/ZD7GQinEY0nwwGjf8z
 hpgx93zHAkwdJCtSqsEzWvpKm9zotMbCtYi/UQjRAhimLV22qkcNQ+xclMgnJKo/yDT/hFOVIgX
 HzSumtJgHo9/8Aps1iEiFZBAycLilB3xzeT0axHkqMVFd6mYdrc+hJ38Y4r9GILEfbWcnQ3W5n6
 TbRQYM8G9a8auk09MhwmrSiSWqVj51tyVWgRlr5M5Sa9mcxuuB9KOoif9OT+OkNJrZFMTfoAFMr
 QkguIAGr6JvMqMoDa7xIJM00//1ZtGLYmVvNcb0NDTgAIfTso23XsTF+xn4yDP5Fv4/fP47cY/I
 nafjbt5kF+VVayAC6L26Hf1gdWL5dLI9IczJuKJPead1H9xrlZiSiLTURKAdfgD9JS4s1YQSUUF
 YieHJqxvlsGwkHYoCLlNW8x9Q0f6+OQEn+COsiSkv8DwIsgkbh6dxg0UuV1rI3bhV68EUOEfAg/
 dx0u8b0Tz69/DqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfXz2CH7R0ikn/U
 3ueeTNYZJo1sq4cNGug22A++qplRnr3vIYgEz19r96N0pnoUPuHvUUOL+StyWU8nx4A7nAbfSXB
 yXBQ4GHeHEwXRcexhKLQzJDHiw26LFyIgXtgPn2rnsX7e+i6VNPPA60C/uo8II4b82OIFF/doOz
 gpCpY2E8D9IJ+czYD/RSbgWoeM+mAMDXEjVqb3/8j4kuTybTOJPpnh3bSZsGGrssOocyCuCwIs0
 boPYMHhDinf3+olFf3+tl2PloRNjhi/NpExse8whrtpRtH/UgOMJn1isPlnAZ69LJohFSzzxwpA
 z7mCnbvVKrcb/yltqL1mYNIGKVy+SUKlHQcCpqw+RSKDb+Kr1PUTTId/tKKM9X4BwKP6QM/d6jY
 DefvooniyAXlUu9O3wu2aIqpRf+Ds2NlKBuwLG3wi/BFBvhF8SPh4MpKjqvgVRomElMyYn4s3rn
 xXYVpPMb4PiupgB7eIg==
X-Proofpoint-ORIG-GUID: DYT0TJGE_lePu-3pr6pYMFWrQLtKs7Tp
X-Proofpoint-GUID: DYT0TJGE_lePu-3pr6pYMFWrQLtKs7Tp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX76b+GQUUmnh1
 aD+BSB8MF5uj1IklP5sj29hYz9yHQCsD/IGhq1hDfwmy98Jttfhjp3hOYo/unrN03Bfn5ohYzLN
 lhwCySvqdu1TnQpSBRJvEvbCkfLRqd4=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1c5ce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=clSAYKwqOTSjvecp:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iZGjZ6MVmCN8NQm4dLAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

When a hibernation image is restored, the hardware has been through a
power cycle and a boot kernel, while the clock framework still has the
rates, parents and enable state the consumers asked for before the image
was created. The consumers, when resumed, ask for the same rates again,
which the framework sees as no change and never programs, so the clocks
the boot kernel did not touch keep whatever the boot firmware left in
them.

The existing clk_restore_context() depends on every clock implementing
the restore_context operation and acts on all clocks at once, which does
not fit a provider that can only touch its own registers once its power
domain is back.

Add clk_restore_context_dev(), which re-applies the cached parent, rate
and prepare/enable state to the hardware of the clocks registered by the
given device, parents before children. It is meant for the hibernation
restore callback of a provider, so it is declared in clk-provider.h.

The restore_context operation is not used, as it relies on a previous
save_context, which only clk_save_context() does. Clocks left enabled
by the firmware but not by the framework stay enabled, and the phase
and duty cycle are not restored.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/clk.c            | 68 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 70 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4d2cc86bfbeb..316c3c85f247 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1449,6 +1449,74 @@ void clk_restore_context(void)
 }
 EXPORT_SYMBOL_GPL(clk_restore_context);
 
+static int clk_fetch_parent_index(struct clk_core *core,
+				  struct clk_core *parent);
+
+/* Program the cached parent, rate and prepare/enable state into the hardware */
+static void clk_core_restore_state(struct clk_core *core)
+{
+	struct clk_core *parent = core->parent;
+	unsigned long flags;
+	int index;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (parent && core->num_parents > 1 && core->ops->set_parent) {
+		index = clk_fetch_parent_index(core, parent);
+		if (index >= 0)
+			core->ops->set_parent(core->hw, index);
+	}
+
+	if (core->rate && core->ops->set_rate)
+		core->ops->set_rate(core->hw, core->rate,
+				    parent ? parent->rate : 0);
+
+	if (core->prepare_count && core->ops->prepare)
+		core->ops->prepare(core->hw);
+
+	if (core->enable_count && core->ops->enable) {
+		flags = clk_enable_lock();
+		core->ops->enable(core->hw);
+		clk_enable_unlock(flags);
+	}
+}
+
+static void clk_core_restore_context_dev(struct clk_core *core,
+					 struct device *dev)
+{
+	struct clk_core *child;
+
+	if (core->dev == dev)
+		clk_core_restore_state(core);
+
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_core_restore_context_dev(child, dev);
+}
+
+/**
+ * clk_restore_context_dev - restore the clocks of a provider after poweroff
+ * @dev: the device that registered the clocks
+ *
+ * Program the cached state of the clocks registered by @dev back into the
+ * hardware, parents before children, after a power cycle the framework does
+ * not know about, such as a hibernation restore.
+ */
+void clk_restore_context_dev(struct device *dev)
+{
+	struct clk_core *core;
+
+	clk_prepare_lock();
+
+	hlist_for_each_entry(core, &clk_root_list, child_node)
+		clk_core_restore_context_dev(core, dev);
+
+	hlist_for_each_entry(core, &clk_orphan_list, child_node)
+		clk_core_restore_context_dev(core, dev);
+
+	clk_prepare_unlock();
+}
+EXPORT_SYMBOL_GPL(clk_restore_context_dev);
+
 /**
  * clk_enable - ungate a clock
  * @clk: the clk being ungated
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee5189..c3a095e8da5a 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1439,6 +1439,8 @@ void clk_unregister(struct clk *clk);
 
 void clk_hw_unregister(struct clk_hw *hw);
 
+void clk_restore_context_dev(struct device *dev);
+
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);

-- 
2.54.0

