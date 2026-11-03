Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681352;
	b=KUwOaA2fxZnTxfr4OoyufmvVkN8HXwtsvtHhhHf8mPy/ZgM9QlitHzjowU76fFpfwwjJ
	 Q4/jmy5ZRtAD+87weEHefyIuDou9NeKGWq1oUTb9izq0NjqAxz9qTINRUVj9+2ygJYRzZ
	 YshGxRLMAHYmxweOYkcFxd0bLYA6HxvKdQr/83MjsTZUt+N6kPk7oBo5jXiEYftgidKiz
	 /lqOcJvyap9EcPRe+HAvV0h/mMj76Sc68GUf/wj1S2IJweA1dT3VQKwQd7+WLUoQ+TbkY
	 NelNMrrGsxx4c/EU1xh0fCgLCCPNphx+Qs/Ps5NzU/s43umM2rNLFtn1SOJGqT/BkzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7upwgKb79Qwzvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=;
	b=3SBgNbvtbepWLqQF6LDlLLV0k1of3//S76KasiIvLu4U0r7JqMA/aQjlve8f+pdTv7k/
	 O4lWLop7vRm6xSLHQD9YbSbBXEM91hoIfGCP3MS5FZI6lVTKJ4fvm0vvVhKLZGTWkjxEe
	 gOhJZa9Mb5yNQOkoNIZ2g4ze0AuzUpSaSf1qtCh+P+OzIJzXRO+oKGt743B0lEgO3JeWJ
	 1T7ffeGkME7BCOjzm7mt7QE8HjoByu3RIlpycAljwXcicsu+ZW1QhQy0feONECpFck+hB
	 KrXzhvcjcjIdwqL7KhWaSM6duyVlFy9J+OADX65TGMdQIV7aFmVuhzDPPAClHOXGuxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfuvBzZW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EL2PpGNL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E02D606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E02D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfuvBzZW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EL2PpGNL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eLUZ1082258
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 04:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7upwgKb79Qw
	zvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=; b=JfuvBzZWpOyroViKIwsL2V0fmIh
	acu0P2X29m1aWJ4Jn4qNnJ7CFIPHDvjKOYdDArJ/CUZ/N6E5m7SmANdcPtuqAEhl
	ISz2zgn2Zw7NlCkwQs99Nz44gIs5RsqyB0tSuU3Os+qpBdYF13XqyP0JtA5UR0ag
	KGf/IbuMnS687UXoGnKzrvp3fk9q1w83KUIr2i2mt+mKMw7ZrZQevV3h7UzgAIOR
	l3V1NZDP7LjGGCgdUfmAHlhhsxi8UGitR6COavU2yF3t674+GqOLSy5NUbcNVgGy
	6Tf7MsaxyO2Dy+9czyal4Eyz8gk2YO6zO7X8IFq6qJcemN+BnmZkPexn6oQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r1y00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:49:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c84eef313so73409016d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681350; x=1794286150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7upwgKb79Qwzvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=;
        b=EL2PpGNLMomWVkm77zLSqYCXLbXhJRx9elW3dadE9iiW3c81fsi9/dji2uhphbIbq2
         UtMYBcDSzbb8zHdecax1giqNVCuuqNxGTf2p0lI0X0kMJHOoB7AGz7L3O2Y+Et5lTeh8
         961UuO5DYtuBY8Dq5rjLIng7+ZxYaajL2NdlHJZ7sux/XA/nvgfDtpkKPmXiFHgkdJde
         9fsTH2sTxI0Pg0MoKwqbdkuoChOOqWMbqXkrdfLdQ0YpPoE7x8X1f5+ld3zEckDAZzfW
         Doe4gI1xCAYB/lrE9t3/EzV4dX5VQLCdpz0rSZx/phfC9HzIjmQKm/xVjWdBURuHJCan
         JItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681350; x=1794286150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7upwgKb79Qwzvuf7T+5r1o67QI1wWo0sKlpFyeIZyUQ=;
        b=dNrXO7a8urjDZL3Wx9VXz5NGYG0IGSkspphBCaGtmYhW+q948eSz+Ftoe7dNfrPlfo
         J6Eg/MFuWb5sEWah63Y3/gnziq/PXlPhATTHY2njDPJHRksbFg/6TjhbvZ/l9VZAAtSy
         aAmIy76LZkRRnfwEB77NHnjGV+HZe5lRh1MDpAUOhcHy6G41ohEV9uEiAzeIM2w8rhkn
         SL2OP3ibfK0R25/KJ+PcxddOnFJXhmRLrg2qtnM/hyIpM2cB/afdCJBji8BsPg3j5zlZ
         BMZdHEuws47DvmJXGl/0HB7sndFK0gjdYA1gDoVndwSNtJCYL/bx+y0bxTFEmOZ8/QOY
         k6Fg==
X-Forwarded-Encrypted: i=1; AKwUvBxP4rJZmzGfqRRfXIAnXWT3xLr/3NERX45VYJRSU2sac65E/UceLZjEz8tcGBz3vipQOWfCGNJoWbji2iM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aeDfaqx9TElW/+ke5UWtDAta0BWJhJYt3+2Q4PK1OZf9ZguRe
	+ObrB5mxb6OSGUkjICfbIEybQRrS3p+ogNry6tpKzHVlBF3hw4RA0ALhcpbGynzkpahatK7mczI
	I9+fyf2TcQ+AK6ThMx0yK0N/SZ2rtSb6hWMWppYw3DAIxMcvEYnqlx52TN9pfusAse7I=
X-Gm-Gg: AYBFou2NntUzNHxhmibaJXGBv/geEyhD9ZptCf+Is5SGTBI9AVt464+KAUMqN/wi4JU
	zOXBGj4+6FSsP11/WIkfupOOm5XmR79RpnGdS0Eo0TrOvOFz11a4DuX1ln3jTic9U80Dh2+CdPb
	hQ7wr40jX9ruGs5hMofHnOAEmRZKRFF51tDKWIIsJt90YvUTuB7+AzB4H8EBh5hsNj7L4VHGpBU
	6kGS7qsY+YPKPt2LsC1mISUMHBfg5MfgldrHQLuSenZ5xWhl2mRhByQgQXYQwKcqysvEKKZ9cnc
	UMNj3c9sGC7GOIwLYaeAE1kflt8HjJ6m3xe4u9qf5+cuwAjvCKPnq76mhWMAC/hSdgK6BekRRyP
	DZzltzA8K6Drd2A8CFlZiZyDd6klnFzwYKE50dKBOrzmJ4NlBqNO1bIZC0E0jpxHF+JJBfMhHNu
	2X
X-Received: by 2002:a05:620a:6844:b0:93e:c12c:4400 with SMTP id af79cd13be357-9442172bcecmr1859912685a.77.1793681349887;
        Mon, 02 Nov 2026 20:49:09 -0800 (PST)
X-Received: by 2002:a05:620a:6844:b0:93e:c12c:4400 with SMTP id af79cd13be357-9442172bcecmr1859911485a.77.1793681349430;
        Mon, 02 Nov 2026 20:49:09 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:49:08 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 5/6] powercap: dtpm: Rename Rockchip virtual node descriptor
Date: Tue,  3 Nov 2026 05:48:19 +0100
Message-ID: <d58bc47b95fad310cb506ca01b59cbc54f0d8c75.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8lZR7c4vXC59CrYe5w2Gxsw5VvXgHQLg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX8qfdtAkWUCqR
 CgdMlp2NPpRi5avetU5Wa0Hvjx8VMDWxQmHB7KwjQ3/zBqVF0O70BmTNjGDH90grc1d6jlVHt2m
 YX0SdGTA6dumSXHMz0uJ91Ls+uPIUSazyw0wNMvhikHweGxChmXVj6MhRG/zL1AAXtaZoNeCy6C
 vzqWsCYeNCG94wmhNjHMU46t6pw2NO/WD6DdLI0vM8EhmCEaiYG8YGU5rFHOJcLGj6ZbwEG0VDL
 1Um0FK53S/RVqMhZsOaoFtr+3wWi/2G43AYv0KjvCRswkbscA8rbf/mWwlGhwZmlQIQ0sk4tpOg
 4akq5uwhWu7RGDJQR3obxlaN21JiTMRDgyozAx4v1h7/Khum85s1SQ6dmlhqrfSZLEFBzHNvYFF
 K3hrTfK4fK42drqDkgD3Zhg5ou3UNKW0ckzz+oMmXSA638DxF06yViXNUr2G6NDFBrIXRsaJ1a8
 D+QtKEbO7RBPXLvwmMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX0+CW0celtVrs
 s4tDegHJphW8U6DzJk2X0IjvKzZWj+ZrdpWYdyYES0oRP59KDV89B5A/g2L6Ob4IvPV/p2wHTbj
 YBjf6jZbGWzZKgDNssB3aPBUDpS0nfc=
X-Proofpoint-GUID: 8lZR7c4vXC59CrYe5w2Gxsw5VvXgHQLg
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae967c6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=_NZqlvP9bvTAGtRSC3sA:9 a=iYH6xdkBrDN1Jqds4HTS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018

The virtual DTPM node descriptor is named after the RK3399 even though
it does not contain any SoC-specific information.

Rename it to rockchip_virtual so it can be reused by other Rockchip SoC
hierarchies.

No functional change intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
Changes in v5 (since v4):
- Add Reviewed-by from Lukasz Luba; no code changes.

Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7 and refresh context after patch 4 style cleanup.
- No functional changes.

 drivers/soc/rockchip/dtpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index 222d9098cc98..5ae00680602f 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -11,7 +11,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-static struct dtpm_node rk3399_virtual = {
+static struct dtpm_node rockchip_virtual = {
 	.type = DTPM_NODE_VIRTUAL,
 };
 
@@ -33,12 +33,12 @@ static struct dtpm_node rk3399_gpu = {
 static struct powercap_node rk3399_nodes[] __initdata = {
 	[0] = {
 		.name = "rk3399",
-		.data = &rk3399_virtual,
+		.data = &rockchip_virtual,
 	},
 	[1] = {
 		.name = "package",
 		.parent = &rk3399_nodes[0],
-		.data = &rk3399_virtual,
+		.data = &rockchip_virtual,
 	},
 	[2] = {
 		.name = "cpu0-cpufreq",
-- 
2.43.0

