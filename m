Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368977;
	b=GPmOAQvepd9qIv6nskkcM7vBCKn8aoGgkbliNNwZCG6xoVtkSVgqrd7iZX9zZpSY0rBR
	 VPPA9StkZTCTXi2/jFuCYhUFLgtntm24QlIf6H/kKQZdt4tBMfsg2h+zCAVZiFIsrGcsC
	 GrALcyZ62j4d9zlfhI0Id6zBGsLoLFsV8tG3BQ+6flKiYadD5VPy6O+gFBrJ3fA3uM+aA
	 3A4465BTh4Xnlde4EMZwD1S+9CgAtYP790oTwGvlH8C6weZ2KkAEK7zzpIL0zrkWNZTG9
	 cXAoJG8qYgwV4RMSOEjP6eqHYRP6petpRLS1hsuo+dldZP7MCxwDcFLUs4Un7Sgd72w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
	b=YMeCmM36OCUlKEUcxPwiSSG1WSDK7kcz2j1T2fJMSweCRjgoVRWf6vvwpRR+09uc0XP9
	 JycDlpGIlFEpzeMKnzonz48sal/KrbBZtx4JiDLVuLxJmThg6+DGO589yV00pWbxjvvu+
	 6yDD6fGxg9xtSvth1btp8zGMnbvoK/1SJMxU2dEIJOzZiAx5CCbyT+N147n0e0YXvQnKS
	 0ZE92O4GNXWV/jniAWAPjfoJW4WW5TZp97QKgFZXCFGohtaLtfNCpdq7muap0E8jgeNnv
	 coPBcXm0LB4ZOUJw+g7ry9jfm+lX7IGhjuR853l9XQCK+Kb4S1bUy+sUG6MXoi46Aqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1awF8dR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXg4DO3Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA08606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA08606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M1awF8dR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXg4DO3Z
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDn6kQ3479702
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3tMVC+s+E/Y
	qx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=; b=M1awF8dRp/omx4H8TE5KB6zRkHQ
	fOkEyIkmJHzcfwHvjB5tedHg3Ri8eOFjH7JdYQnERSNTsCs0YvIQXrM1SsuuGzTS
	5jmXeiPHCjI2NM8sXEPFMW32BDqkmhjIdMeSGMMbP8mUqEaaYyiYkDjtq22+1JhG
	Tzvncr1k1Xz+JFcnePvCAUVC3hta4SwR1NRhq3QTOetwCom5QAuuLkZk/2upCsJ9
	yeJMa8IEailf6aTvL3jDBQ+V4ptVnFByFnZj+w23jdRwpA8AVF05MeQAE2pk6eEP
	WT93DP4kXVeF0uY2f6mG2uJJZBu8yiU+4+X8c7ntLMUS6wZF3hijHnRxb1g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkbfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:02:55 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98304865f02so613920241.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368975; x=1793973775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
        b=AXg4DO3Z2HSjd2J6JXNp9vVoEHOISEQkKQzlOW7JtwcwsP08pXAI25U/32PBqEnQLA
         HUtUyv8uQmGPtfoeQ+MjftEBQlKl3BuPe9lU6hasO2PLf4LLsLF3etL6uP/B1Zm96lpO
         mbSBH69/AH8NFUYclQAqSayoR+Gp9nrLaNMWzwOMStdPPMV9w/9F2JZAo4H0sFmjXQAG
         +sXHySHUWeZA3J8mw+Pu8bGW4K7yDLSjXJyJzbvIGIk9+n39m3jsHgvppNu0EYUudBev
         8JuLuzkcPLA/ct4BX8M9vrdDHWOZTGLC6zronKH3EOwmGdiYrkcGjXKdIn/JyQg4ouSN
         KzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368975; x=1793973775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tMVC+s+E/Yqx5hATUyQFQL68T+WWVkH8GEQ9ryGSx8=;
        b=C5j+6wdu+eiJ6iRRIuiEAnUGMOInxHp8uXa3O5e/130Hx7wuUbUFoLIZ7ilUdKr+PG
         P8M4qQb6FJuFwlylHYyBmMdSJwIRLgWDKT88f4tGWMF9gC1jjpM4+mfxzeWzGbsmg0wA
         D9D3Jm7Hj2708VfioflmQLu1sOP3rp4rFTwR/sNC0VFkR8q2U+8WMF9CNXtA7klJFy93
         pkn4BwtWox/r/CobkHAX3BVhl+IOjsxjAFMSrKHhN4ycdJ5OlV/i3TuPMWwQfNv+Kyiy
         +nB8o82OCSc3KODjtVJyU+bcTQszEhrpgkTQChQMBmv8yym6VDUtvNmi9o5yoMafRCrT
         V1BA==
X-Forwarded-Encrypted: i=1; AKwUvBx1eCUiR8ceAbsvBOopiHMp3tAjj67BVK21i4feBDN3i3MvhI1JXOXmBtEv+uX4wfVdEgJ1e4LoGo9Ulzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdG5qMdI/KnWpaK941nro55EwGhdRExxoqshVdRW4rL6GFxmyL
	/ahMUlXptrQnKxtyyt65NeuAv4aVVom1fkNABIdKY1jKWHgYTazEQplB4A5z+kjlTGvCihV1LKp
	tLKLCeZlctJu0OWsTxLishn5cVQ7aaQN+WNw0+PpprQRIO9mDP1k9wrdaKmvwjdlLndI=
X-Gm-Gg: AYBFou1R+ZbhRz5YVhUZZgJ+DI8jrR5u+cYuO5Xnt+TYtX3+8z6rybb5E5XooFJ1S3/
	RzsG5vHmk1hyz/Bh+6OU9pgMe+OwlsKvZ/D+m1jGQhlAn9CttkebtIWABy7K6mcg2RiK7Dfjkl1
	cinvUanCPK41IDL3dM1YL3LrcYIXtuWS5r0qobo4jouOzP1nt0lHozViNRLPFzCodnswRe44Qod
	rvmSaCt8x15E3IYEuwiv5S1d9k2lJHmYU5KirDnLOwhnSv5cUA/tFe7H0KlQc6Dhd9Mfqx+BDGT
	IoJ3i9/gVixnGSj/5YcEwJciy1mw2pQ7PQIesvzebiGjfU4Wj1bMPuX/RSyIfpnoE403EogJ4+G
	x2QwHRsV/FXW7FDqjbGkrVOZmo/2KAWllryikw0xbitHDeCHJ3IkdYqg21a6Spw==
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr1093372137.10.1793368975249;
        Fri, 30 Oct 2026 07:02:55 -0700 (PDT)
X-Received: by 2002:a05:6102:6058:b0:7ce:9ccf:8713 with SMTP id ada2fe7eead31-7d07262d603mr1093264137.10.1793368974313;
        Fri, 30 Oct 2026 07:02:54 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm146146995e9.9.2026.10.30.07.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:02:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Thomas Richard <thomas.richard@bootlin.com>,
        Andy Shevchenko <andy@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/2] mfd: cgbc: Allow compile testing
Date: Fri, 30 Oct 2026 15:02:42 +0100
Message-ID: <20261030140240.211786-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AfeMZsx3zqqMT4vEfgLT41qQLlFUhH5PXM+/16YdHOg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5KOE8OZLBL1KSPOzy2PTf7D1fbtJWm/X8QGMh
 1uEadY8ZKSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauSjhAAKCRDBN2bmhouD
 1ztBD/9sstFWk1A9Ng49ETxFwagmCGyZ4AVotBxT8ZddXnTTzWQvY8eKKKs/2fuAtwZ3HefHs4E
 TdQ9UiBFcatGhgGt+Ugbk4Jx+QpVg6P8hAILjJSLLvxAlBwcbpfToTVmQdPazXI+iBFf4WFBxML
 BGHhmSmn0FSedMNLBIXFvxgjd7zM3BzjtBwbsXEGrqp6j3iB5rrWT5LryYpJiRpIAbTPQE5fmNM
 3eOq/SiWNO6aZpZGvjrT7QnsBsvGrekphmm4hH2rUnFo/1v27uOu+Ppt03FQ052U9pjGufwl0k4
 lPOLmdWOdeHA4BP8YfmL8RM3bpHo0QQ26VRgr9XnGr5KaDn5xLX3BGcJMWmRTkUK/yuJtzAZPlN
 bw5bQvr0G7P2vDJEK6QJJEVoqL4ia8lD7FWP1/cUbgZ8Raj7gFxI5NvuR+PBQseKfeKE8kE7+RT
 CrPgvEt+jhACYfWKSnVwl14U05BKOAg0fGZnI1vzsfVECg/jz/QtnZ8T/CnbELozZPIE5kRBOD8
 72mfqYZ3eUaRAHbfYLmPzCMqebZTFjo8KG1cXWvArk4BXRGYoC/W8PNhmmexHfIB4sOqdX9Wv7w
 DCR0F6hiiDIM0YYkNQTCS31KmHGg7sNcD0PZEm8XLcZi6xq3sXtPGDhR5TDf2vkGb+aWvoIpDVx Rxb/pLyVr/TPJyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2u4ftkxieX3ESbqB9v6kXymXYfM2i59g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX+2z/muehOEys
 80g3qE8pGcf5Kh723ayS7z4X0SpJcfqTvw9egA96yL3iwZwKN1gx+NvslvHPQSKdn2QLPvndvzS
 31ZOrUv2PaEOFiTBMyqiRO8m43qkBTo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfXy9xBEVrSkMe4
 1IqIsNFXuSSd46S2dVWST2kh9WVN6B5EhHyaKkkk2X+158NlA6O2sG7Hl3sDMDdCyRIoAJi3OqT
 Q2T7PIQAUdJI/Ss9V652Wa1c5B1x1POUTaOqqUKHCZsbZdpIG8/FUucE0UpALyvFEqO3mwHy/3k
 ESM5l04TFksQBjzNBfOFgl6TK6IQe7/wjz1jv+/sDOQY62k0nUzXMuFyog/qXYnxK3KziUp5WCU
 sGnY26zObYBZtEWjv1hrNWfS7FRzTWv3tDwmpV0Eub7Kw++rOeqzHV7pr26AjQ1U2au7nttoX2v
 233XmNzmXGVomA6xFBpIEcvmkTBQhEkQLeTWip/E0qFiTineA6sRqk4iM1Oqw6fkvCqjpxsP1mV
 W6cs2FVXf6lqkFtPgQJ3WZoPyrWUVhAzYpgOfZU1+CkC8dThbXNHt+uKGfZ+ncgEhcJ31Afcj6Y
 xOZql6mN7o4kC5kqpFA==
X-Proofpoint-ORIG-GUID: 2u4ftkxieX3ESbqB9v6kXymXYfM2i59g
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4a390 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=rKWnc9nNlL7eC5Y4R5YA:9
 a=1WsBpfsz9X-RYQiigVTh:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300054

cgbc-core.c driver does not use any X86-specific headers, so looks like
it can be build tested everywhere for increased build coverage.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add tags
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..de957f574056 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -255,7 +255,7 @@ config MFD_AXP20X_RSB
 config MFD_CGBC
 	tristate "Congatec Board Controller"
 	select MFD_CORE
-	depends on X86
+	depends on X86 || COMPILE_TEST
 	help
 	  This is the core driver of the Board Controller found on some Congatec
 	  SMARC modules. The Board Controller provides functions like watchdog,
-- 
2.53.0

