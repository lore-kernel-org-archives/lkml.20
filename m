Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D0E3D9539
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792211808; cv=none; b=q1IqZ0ntWEKH7ozfNNZSqXaHEsbj5T/mKA17Aba4/woLb96v2cSHoWKEovnDNKl9QjDPsLumW+QfUlLQKV1KdghWmxy38Lw+tnHk236DBUoCHwdfCiYFcYzyTEQyb9iSj2KV9uoJUNgelDdDzfvBpnSWLKJmYEteF79ilp7abTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792211808; c=relaxed/simple;
	bh=vjJSwaWsYnkxq3tEubwmtFVGN+XvrRZe3/PK7ZMnRV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMgj/iXm/zq/QwaV4E8C60ZQ3o86xR0b1q7QzydzcJQzA1vP4gQsXu3Ddot0EkuFlzxGYH+jS605gIfx7yvbuRO1rmxUb2esA/zyXFRTKqOCzXTeSqO19vt+CYMcQpjFDrRbP0jNE4ct09wVqmtrsDT9UOKgcz04QbYaA48p3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tqdh8jiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LttDQCht; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tqdh8jiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LttDQCht"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H3Yhwb4188531
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t6TZbpPblNa
	ZUeBPiksbD6ZdKQB61AuoJhc/GsXviKQ=; b=Tqdh8jiT98DD01VVVaQV1vdUyrp
	XEqx9OMtdBQbx3SZwNEDIKLbZQPyaWzDIyzmJltDIDH4IpGJsW+lboXa2lo1KR4E
	KwxxBAEw2nv4MNEyT3e6xnjgvxmNzKNCfzL87EsXIRg+XzrcerraXlMaYss/liaF
	Wn5oT+shUmaPzrwo/ObbfYbgNf8Dp/i3bsv4/L5D4xZv5pnWvCv+NLQkB21lV+ug
	rhZI0se8c2c1sTtteFk+RMndWGYDP5YThQzwSM5+5k4T+/UfJRd+XsTlp+XQPxiT
	Ivvibrt+fzkxC3nWkLoAWtx0gy8mNiVWKgRaLEhGZCsMCh56c8nd+SfAR7g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc18383nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:36:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so772075eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792211805; x=1792816605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6TZbpPblNaZUeBPiksbD6ZdKQB61AuoJhc/GsXviKQ=;
        b=LttDQChtNwTPnf4OfpyQLy8BucMBCTJoBHVv6Ce008Uv4qqGMoVRYpKiTtFXzVXOJX
         GDGJsZpVR3LM3u7dmifF+mbm7htARrmct6ZR7N3nOH7AJ1hrgdGYT9RnZS5WjbbFHmW8
         C1EerrhYV2xobIydZI0zaypsy0AOc8alMkW5ZXGC8Lqh7znv/aPvDsDSQhB6rWio+3OH
         wF1RTWRC5BoCIkeFaf3Cad4r9VnUyqQ8pNKP5rcVBo2dLBsJZKqffshccS4Q49Jwt3ON
         DMb/d8E/gwpdlA/OaL+L/povJyAuFKR9MTw+fE5gcycOwGqAOPMqS3Tu/EAzd/TVPVXj
         AVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211805; x=1792816605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6TZbpPblNaZUeBPiksbD6ZdKQB61AuoJhc/GsXviKQ=;
        b=lB+4XB4zszcAfwJsWDKD6jXUhAG1PKkFOLQC71wVdTikCoD/xArTbXMYu+n3GTMKY3
         tcEN1ZaqK7/PlA2Qw5jnTNUcBne+DjhPLZ4Wj1nF/1DU1J6QHNncSskQujEGe7SC2tek
         TBFq9MRZdjNwWf2/ISluaU37UU0TcvzA3yynWSXi4SKwl92dFd8CodCoiZht107XxKIs
         wATCAsvPcdr90Yar9MWJDX92J3mMJe8UGy1jeZtHoWvwe5YBHVs9jj2NUtp1xp1J45VW
         5+mFiejxu1Yz1dsupvWljw1pTaYr7jLzqqrJKL1VkgcM5JyLnkBKwvzKNotsEfoWNprV
         9VZA==
X-Forwarded-Encrypted: i=1; AKwUvBy9wrk2nqJxkmD972W34QwjI1H1Ybb0dgVMeNbKD0yu601YcYZ098WH0S3KIaRDT+dOroS18QLEREIJj6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYK19aiZ1AncSu8vXKO1Fetpe4t1KbLGDPg8ogxLF6gH54yqGxIG
	5XuhZYw/AhjznFFmD4ly1xJLC+Pw0QiTZpCxbZdbNIciLjjQeu45qB93MHcGbGdYCxeYGcEm6T0
	p7GFVjlmOSwMjbWmUFEhApbTeFsh3fxTLE/uLyCkseE1gzxTwggmiXiptG+B1Ej0Ovcc=
X-Gm-Gg: AYBFou1AlI8SoBFIO8uBOlBj9GY7JXsR+3KWCVl5JRh0Ollt4th6D8v5SCoNCvi+Vpy
	ov+9C1wtrdi27e9Rwp49T8NzATjPzHwsyj6q5cWPW9HAavgN/+/2SiSHZkfIpsyHbN55CQQyuRw
	5IP7CtYezYatPTC7jzpgEyiUgeZfhv8Po7EvCZDTEKSpa52EBf+eflDr4rOEX5zz0JXMXE0VoES
	LqhnU5lf1RH9+pxzSqFO8RikexjiVn2A3lmRWXKUn4CqDTWLlpBArCG2TmiIAEp15l2RmX1zjgl
	165p6lPKCoFFAbuq6g76hDXWSMDJ04ad4fdrHyKMmW7rtgo0clNM/wwpeqg2w6f6GfNzy5qzdp6
	v330+NjiNhwTdpXV0etsPE7LwXSy26jc3aQWnq7tnMJ/5/pDyD27HIr6uNCU=
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr2471255c88.0.1792211804300;
        Fri, 16 Oct 2026 21:36:44 -0700 (PDT)
X-Received: by 2002:a05:7022:ea42:b0:164:3237:4485 with SMTP id a92af1059eb24-18507af60e0mr2471232c88.0.1792211803762;
        Fri, 16 Oct 2026 21:36:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm9771425c88.5.2026.10.16.21.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 21:36:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v4 4/4] gpio: shared-proxy: Drop the vote when switching to input
Date: Sat, 17 Oct 2026 12:36:05 +0800
Message-ID: <20261017043605.1503563-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX4XGBPosBExVI
 Bm6OYyOXyNa1hkmUhTOp0wNdkHLgHsFLzxuD/WT/v3LyZ1RAIe4cG4d9kJbgzFLKjTh2oFLYKzp
 c4oy1Apd7D3dL1qUUmGi8KvKnfgcIhU=
X-Proofpoint-GUID: bwpUQ4zlAzYD7RPv9EdrOEb8AIbRT1r1
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad2fb5d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ZGWLMo5Seu997gzVtjEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxOCBTYWx0ZWRfX7Nf6w5ur6QQi
 yY8dr0KDm05H0EOQE5x8lPCII79nood15OiPVqhjm+oYECWiVYbAYd17WzIujhlYCak3dhTyfRV
 6ngvXxr+wkcLtx7FqwtztVuUyYe5kKlwOtf8Nq9gMZ4p9vWP8aM0LCjQAW+8U//Tk4kv2WCjXTG
 6O6a1KoCWuS4vrqrPNDOdrNaiYyGSFs4sKbJSyyuYAglvFi1fJxCMVXq/1Xx1Ko6C+Wpdx2yYyL
 5sQEtWGDu26TtGeUvrnVm0I/joqyhQ9egwyrNJokCgqDxxFGIDVIUqHdktn3B0xz955yNEboOFn
 8T20FQ0jWSMXwyxfFlMcyQ9IJVhqoqjKxI2DQYIw7o1sNw327RPUFZiTmXClCJx5vBkd/dD9Whm
 QAaVE8kcJVOMEsrQ/pyjkCYmrng7/4L8rgj9tKyfgOOx4BpFU6sf+WZ+KQKr7UWI8Zxw/rNcy/U
 F3QIk7Y8ayj85BG7Ehg==
X-Proofpoint-ORIG-GUID: bwpUQ4zlAzYD7RPv9EdrOEb8AIbRT1r1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170018

A proxy that is the only one to have configured a shared line may
reinitialize it. When it sets the direction to output, the proxy
resets the vote tally, but when it sets the direction to input, it
leaves any vote it cast in place, although an input line carries no
value.

That vote outlives its meaning. When the consumer releases the line,
gpio_shared_proxy_free() tries to withdraw it by writing the default
value, which gpiolib refuses on an input line:

  Failed to unset the shared GPIO value on release: -1

This happens, for instance, when a consumer votes for a change with
gpiod_set_value() after setting the line to output and then switches
it to input.

Clear the vote when the proxy reinitializes the line as input, as
the output path already does. No other proxy can hold a vote at that
point: voting marks a proxy configured, and a proxy that frees the
line drops its vote.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 456a3c3dbf71..d4680b35fac3 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -207,6 +207,9 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		if (ret)
 			return ret;
 
+		/* An input carries no value, drop any vote this proxy cast */
+		shared_desc->votecnt = 0;
+		proxy->voted_change = false;
 		gpio_shared_proxy_mark_configured(proxy);
 
 		return 0;
-- 
2.43.0

