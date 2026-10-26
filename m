Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021857;
	b=w2JYp2GJenAXqQSvjs78vR4ru99fnvcTgWJgcBbzi7CUnvslVFXxlRnFHE5Izb00jC+x
	 u6XG52cgZlITO63C8oV6hotGwejCk0NOCU6yCbSmUJBpb+lHq5XJaPIle4mU1WtijIy+j
	 bLmDqI2ayolMI+AfewhriXpCW/OjjVPhiks8MmK6mcb8YZBPrJAQ13vuRQBKvCiyOCMP5
	 LHLBCcJHxNiXnYZcezi04tgI8m7zeYHVaBfZNLog1hd2PMAhP/8LOhZD9Zt8G8kB2nFqm
	 JOJl6PpukjYiy+stkgOywj9pxOjXgS0JjgqEekSc+2ldpP3021w3LOuHC4c2c4byi0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/fe7KJZz4LmWaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=;
	b=Qk3hGQp6q8JfYLERAfaON+YG172mD+lcPXuQPPOpBf/pkVkkdbrIbz2IsUmB34ATed31
	 wC6Z+6AzpIvh77/vW2m45Y01wcsphnWEUEEw1cYG0xQazIgM9FqBlm7lIMaJ/1jpgyg0f
	 +J4WUKO5Qqk4teaBfrOuNxyt3b5GRHpK73iW/jEG14JPlULuDOmSZSkAYwum/6Xy35riD
	 ps40OCpobcsZBpnN6B4ENUNTxGQt+3kMpzh7XMtQzItVX3bUmDC9l6PP3YT0z8D31Klur
	 kamSN/ZvAKf17CwPrFTAQO0ZkHpYhCdFVsJM0r/JMMyA2QDufjILUYQ1OEQSCVONTZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a/1TC3kD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGjzd2Ys;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F960A5BE0
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF8F960A5BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a/1TC3kD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PGjzd2Ys
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt2SN2733226
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/fe7KJZz4Lm
	WaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=; b=a/1TC3kDuzDep+hYT2a654DKVBO
	BOa7noMH1xnbjluUQkvFU3YJAAiGxIMnMi4mjS5l+hcpCfVVjo4xqahf8KpZvCCC
	75Cy/ej/y7UV5KzgcuNSICluYz0f6V3gnDj0b7X09hcKxB19tg6BDF6OkOd55Rlo
	kLHiH3NMoQbSCFpCGskRyNpyfa3pZFuq/hSTIVnT92xprgyOB6eMzx4z7adeFB/y
	GZaRfSTDvK5fgTwP1ggK8xkU5xiaFFT+GiVJeqh7EZdetkyQf788p9cOtWb4iVWy
	t4GsSY812ci3Tb48KV84HOKQyH19z+KgquAbVmZPVVrzoIMGCNBkHaipKxw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8w88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:37:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so597509085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021855; x=1793626655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fe7KJZz4LmWaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=;
        b=PGjzd2YsyN2+DZD6uijPrqwiviuBYu9xVPuwqQZhjimyp7IPwGqyR8Sm+Z7YsGMWjX
         x7QlkGLjB+XtIcrp3gsJHJenZSGY5zpMc69s6j63tORn/Mi+VnimSLlPUlqH2Kh+AtYx
         SvftSLlo9J/Ag/FjgXwi/dgRIX4gmcMKvlWYfmP7kHyOL/AcCLn151l1iAn9tIGugd6X
         UmDLyEH5+7GDK+i8o6naoNk9AiZ8f8CT+OUdF1b1w5Arq/0rS8+rcQm+6Y0muiQfYjkE
         g6OFiHxZ4fpOFxp1ZXqgxshg2QfFlVWs+1evAY9PMV7fb4BQYpiBg+sMDzDDtjNlEy/5
         kaMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021855; x=1793626655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fe7KJZz4LmWaTnXBvSSDgY8WYat8lk5T8gWAx1WOoc=;
        b=vO8otPmtiToaRdtC7ypcj5fspGVwRmb59pBqAg9rEfdorgknT0i1UDySKMuRkj/v9r
         EcxJ7CVvO2xtUD92yqS8a4F7B0nqb81HwAh9mUXaiAt2GrhAunD/ViyvETqvR+hQ3Ojr
         jkx4kuUcQXuM+dPilrtUXxb/+uVpQkRiBEVeJQljAfDsMhOyABidQZFQ83EOpvzss2P/
         HyhbhOHSw2UYkTc/ubGk+U6led3hm1j+sUYIKHRLi8OCm+sPdIQHm45N5Jf6GWUPT+NN
         2M2mGdx+m5zZEnGdIHF9cpVdx9IIRMO5dmtJkk1a5coGlWZmN+GHHEzhn9FyyvBzI1pu
         5qxg==
X-Forwarded-Encrypted: i=1; AKwUvBzRDvENHdGyqsLtDYcEMiVqcSK4wTLuUSWCo084NX76cqvUjR2hy/+OxscR0ezblBSmsBh7oGCJfqrae8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdqXBwoS4Ja2ULZ/vemMVh8RqF2YQ8CckfQBWxIV/lJBYK+8jq
	lA54EZ7XIWd/fDZ44C8RAeF1MDvXRoOetvxPXuKNKbrcU6vntczpVvvX8+e5wkBFwiGY04M5jH0
	E6RnoEkEDa6omFg0x4Ng6wtAHAPa7zAS9L7cIPWBZUG+BQXmsRS+RvT/XkIxnU70vFZg=
X-Gm-Gg: AYBFou1xbePdYblKns1ZSs5vPHJ+qp1hJvZSfwaIUibACp30p6qfqTUp6dOx4k4znqk
	FfvxBPl+kxsw4jjjj2JCxU1/HirsEzk1YgZvsU1Lnl3uzz5kHA817Pf8vndc2msFdcCZ84RqVG6
	WNuWPJMk44cMnW6jUR3YFqd+B8dx7d91nV6OXU/vGxj0JwYuZwbv/OUeULijFreeaXcqEPgC7xN
	Zs0c2e4urIBE9Vv2k+g/nJ3m/fG21U2EnnBhEyIK9l4g8+hUrviSikwkuS9rJaaMB3osHRK/lXy
	xYFR0hAMtKO1LdGHAs5taFwM4heZ234el4v7LAxAbWNNc1Z4kisQjahBWZ19KOf1yuIExd3zY3r
	N0gnXN2R+8kVVIkqcg0hae2RK
X-Received: by 2002:a05:620a:4087:b0:93e:c12c:4416 with SMTP id af79cd13be357-940ef9cee5amr944692085a.82.1793021854998;
        Mon, 26 Oct 2026 06:37:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4087:b0:93e:c12c:4416 with SMTP id af79cd13be357-940ef9cee5amr944686785a.82.1793021854482;
        Mon, 26 Oct 2026 06:37:34 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:33 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Mon, 26 Oct 2026 15:37:22 +0200
Message-Id: <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX9hhp0OXEg9Ut
 D21v7t76FslBZ9zQwwQQmdi9p+DfI/WcXBnvFXFsqUjs6DItNGA2l9djGURN3ZDBhjLhJfRND4Y
 91Ccom8Qpv5gRr+zLKSUuQgSFHN8CYZARqcDMQd6vS+3ARmqSZCtFsADR6Vj53my2MG4VXlHq87
 D5K1T8gMRcVg9woxvZARJZ/BQRSwLqkBTIDnY9nEGASRAnC3nCs2dm/uEh0qmloW5K9QAkSOo55
 QSzO7G1d81bsLkoLwituRP+Fy/r1E2LaMNA1vYpyx1y5KW7pl4AzcMrEo6KTpDK/y7731nYMJ6e
 SoRdl2CXAC5IPQWtxfQdlOK2k7c2Lk5GmSnrlTqBM/t5Oz+Z3JOkDm+Kb3q7yAhXLoLd6k1JSM7
 0kE07B5OZpbX41TzHLV+WWsdhxArRXuh51yPzR3eaNUpN8UhbyUrd/b73Se7h8aOT3In5ScohnO
 07kYX2qjtQQEIUQ0o6Q==
X-Proofpoint-GUID: 43TSnPIN0j5Dm6ddTsp9MefFWlEQy7I1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX9u0/hD0+jdlW
 /JB342IjZy1a7ibF7L3HTKC4XHNjQecr1nXlvlUpaRbOFwVDMKV8Ldjxfn5LbUwgjq0zpA3uabp
 4wc81MD25va/plmwXEGjdK4ZKOjp2cE=
X-Proofpoint-ORIG-GUID: 43TSnPIN0j5Dm6ddTsp9MefFWlEQy7I1
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf579f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=yH3Gd9U0UaHnWrszFSEA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260054

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Clamp each clock to its highest listed rate instead, and warn that the
pixel rate exceeds it when the clock lists more than one rate. Take the
clamp into account when another line powers on an already running VFE,
so that a clock running at its highest rate does not reject the
request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 59be37f83df3..359b5942df89 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			long rate;
 
-			for (j = 0; j < clock->nfreqs; j++)
+			for (j = 0; j < clock->nfreqs - 1; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
-			}
+			if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
+				dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
+					 clock->name);
 
 			/* if sensor pixel clock is not available */
 			/* set highest possible VFE clock rate */
@@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			unsigned long rate;
+			long max_rate;
+
+			/* A clock already at its highest rate cannot go higher */
+			max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
+			if (max_rate < 0)
+				return max_rate;
 
 			rate = clk_get_rate(clock->clk);
-			if (rate < min_rate)
+			if (rate < min_t(u64, min_rate, max_rate))
 				return -EBUSY;
 		}
 	}
-- 
2.34.1

