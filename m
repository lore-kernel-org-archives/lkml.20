Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699293;
	b=kU3tZVL9q7+5aLKmcaTN5Ocn4evtT/VDom5CS7zUy9KJF0BHGModGAKbDESNRw7u3RwY
	 X3BQ8O2diW2GqgRp+Wir8HjT90ci2cf682FutQdlO9ouWiL7XTmDq3symxyw5ZWY6KnRJ
	 BijQiP6ZH37D7q5TmwxQ12SiV2mPR3MQqMn5rVtbYgGR9CJYaEl4S2gJD2hJ1X1rphRA3
	 cZ72EgiTchlJSUhP20YgQrTmgykCSeL2VS3mghOIiROEAyq/vcAp712IKxI7HzKu9gZJb
	 IrLxmT7L/N5Rb7Q9xrhQ2eadUUINvF9PKxAi8pv86ftbxQMXGPyPFB16l8tLUcHIx6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aTbiAOOXIcFT+/lo81vU5cq1PuTSUe4CMWmyUn2ZLLc=;
	b=pF/BA+AYya0dwwJLH3neceileEt7Tl0Tkew5InKCpe/RZcIj4NQRq4gAvhDp+dLgYZnf
	 /5An6wx0ROuKLqtdoGW5MRSin7Jp55LV4Y+F2C0KcUy5X50KIGiOCZDW+W8Fwlg02ZiFy
	 C3HRR4fK3flqSGa9WjfNhVcKgMbDV1cGVIgPVY3QVWwRB+A2EtJulIMIWaNBQNKarrZ4f
	 YR5XX3HtcnkwsijXczLwDZgTeMa3NvgZW5oSlFCb9Rb60X/1bO560IkDud1fEmL7U0rjl
	 jHCwL9adnOf4DsM2M+uB32F3mhdclkb8H7Ho4AY+BK79cdQJcjz1W6fLF5EZPPaW9wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+Sm+9TW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEdQIPF5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56810606D822
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56810606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+Sm+9TW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DEdQIPF5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37wXQx471263
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 09:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aTbiAOOXIcFT+/lo81vU5c
	q1PuTSUe4CMWmyUn2ZLLc=; b=O+Sm+9TW4kMoojPk4O29eFTxPJdAvkuWlZ5R1k
	hF9SdindCTK03jZ6Q/EjTTOEVIz746+sRBMy6srg6uSNmOVyTuG38ggYAz9ikC86
	AFnAsrZBGEXlsNSoWUn/PSsZXMGWTSNPMt2dTA+FYB1oQZpJO/qpOApl86/gLCNh
	FSeDfiCu2t1bXmYNMqzUvjy9d/bDwGliOhyytQmH1hQdnSiubAv3n21SsniTXvY8
	BkNruMCpYHzEFQmMY3ouK8h4+NnZMjvipW6A3djGQc8IFgEupuMJ03QqZ5h9sUY8
	6m/D0kjimTN2dprotfHqxsDc5ZKvJTRTbduACmA2MbmP8ZzA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081u39w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:48:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c84eef313so76473246d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699292; x=1794304092; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aTbiAOOXIcFT+/lo81vU5cq1PuTSUe4CMWmyUn2ZLLc=;
        b=DEdQIPF5w+moAr9vgBCV897FoepebvS2/lUWz1CK0o64ZAjWWGfa0x48Y30vDizQnt
         CXYflAxX1+JesWBTx+rHOjODJmhvHHDKEb7QdLspmFM16azxjS1saBffjbdDgRE+BeuL
         qoz41PjTXw5N4l0xS8Tdjumwok/Ejgf7Fjv8bH52Y/AmrfKyG+Fp38A8XkX3W0g7BQwi
         c2gHUmL0Qh8aSwdf29g5qRrQRNlbVcHSnoJ0GEM1d/EmeDaXZwPca4KevNmvN09PAUdL
         1LTVC4CNffE4csE6N6vIsZP5t2P6096RrbRyZEyXCH/IBqE8VYVd7UM07s7aYQmTfrYW
         WS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699292; x=1794304092;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aTbiAOOXIcFT+/lo81vU5cq1PuTSUe4CMWmyUn2ZLLc=;
        b=KlrhjI1P71SvcvNkLkv2J0zX2rvAQEFt3kPXJcfEmDwk8mr6GOVyRTKIJwd+kfpjX2
         gOGcgBNKkDIy9+D5DXMeA6ffc+tMjiIrUlBkox29d5Zqi6jdSB/RBPlOwcbuuk/WHV3l
         uWLY4xy0NWIxcqk/b3UN6LGiq6JT8XpL/S0FO4L+QMg7xSdMRcxy/c7J63oJ0cHLMcvt
         R4ttM8HZIbtXDOStQzKCL0mvBaYVXY9yeRTwZLz4EVr9v67BOsoXQCmkuoNqdFeEYoGK
         BoX1flxZzwSYkt92ayOrTufuJkk6TcSiQgW2r7p5r345VAfuwTlw0Sr6X1a/S9rzl0cw
         uDaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlbuICNBsKtqKqN1ip7QP94g/xvXwtgDHQuvVowEqhydbb0ukKZA5p0kMLmrptnG7nGZAqAafQQUpZuQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ADgkbOXTQiqx2ZmPzKavjdBn97Djqud8HWlDiQ91nNS8p/Kua
	iNRjEiO4SU8VO4663ngSXB0LSacs36KeNf/uyU/1H0JGQEaxSP7kIPa67Jzqf27TT1d3RiOJgn1
	tVExzGfMZJtUMqi+ZoFe5VHjKn6sSJdC3Q74wKKd8/9jnBwlI/fAfb93+8idmiCCBsj7f7QOYwI
	fCKA==
X-Gm-Gg: AYBFou2eKk2jcRbruV5ipk+L5qHfTy1YhNEd/hODNo8YwX3OWuC2gqFI66qxEFjZSVz
	/X7JwdjWH1Zlpxv66yytxUn5o+f3usMWvyDkR0RxGFKj3eYDKP0jaj+iiuZI4x5LdBqOIIfXERy
	LT5x5kUVnnP8g/YbwUJ4HbY/itAAztqL9gVrkbgV+mGMGv/kgMy7JIQtlZGISALbg4g/mTp0ump
	IKDm31LLvVeCG/FgMX25eSctx0aVimESGMDF5Rs5XuxXmN+03z2W6HLkKs2jOuDK62nv7KI58az
	mpkBg9XlxaaI6ko+uMtzT/GUzCRxQewOVowJA+MaTyBlLli581DBKf1yuxiunkrt39DZTShU+gx
	dFvITDERLBgSEfIh5+Q6mqu4zkfPEk04NPQJtTspI5Tn3iSsxijhBFeiVMA==
X-Received: by 2002:a05:620a:372c:b0:93b:d79a:c45f with SMTP id af79cd13be357-944216cfea2mr2039290185a.55.1793699291387;
        Tue, 03 Nov 2026 01:48:11 -0800 (PST)
X-Received: by 2002:a05:620a:372c:b0:93b:d79a:c45f with SMTP id af79cd13be357-944216cfea2mr2039286785a.55.1793699290696;
        Tue, 03 Nov 2026 01:48:10 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa38bb4asm44422715e9.6.2026.11.03.01.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:48:09 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 11:48:06 +0200
Subject: [PATCH] clk: qcom: clk-alpha-pll: Fix the L value of Zonda PLLs
 with a negative alpha
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
Message-Id: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANWt6WoC/yXMQQ6CMBBA0auQWTvJlCYQvIpxUdsBBmurrRAj4
 e4UXb7F/ytkTsIZztUKiRfJEkOBOlVgRxMGRnHFUFPdKEUarb/jy8YHfmNwBj0uxs+MbU+kdde
 S7hyU+Jm4l89vfLn+nefbxPZ93GDbdlhZrRl6AAAA
X-Change-ID: 20261103-clk-qcom-zonda-l-value-7f003397039d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5njVES4Z5ZBlkcrpu1QwiiuUbpd3M7eSK7+VdDNHtaI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6a3YVlh52IiRy8CD34qkvFVYstJj48rMrQGmn
 dQZ5tteLTiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaumt2AAKCRAbX0TJAJUV
 VuzaD/wJzqC7K1eA9xAL0ISxpLL5RglAuAVDaMmTE130Qy/sX1u3tHj2loxG/PDHpvds3oHMEV9
 hC1mvnOogjuoYhf2a5nPap60yibupoqYVs1Vva2iSgVXhx73lOwqJnsH/aql1WKJ+hpYn9/jXjn
 UxIwyhNPvHVYHnf6vBo7dBqNrRnOnO0Wbv2z0ltGureWKi7lUTPrXtnqrLHC4QcjIhhB7BUq42G
 t+zSbeV+OVxGEJXB/MaqH5VmkqwHZdCzuN1Kgeg2XG+fcNXR0q0+AXqAzY+gfvGPn4LSoOSzz7K
 qr3p846cQKTmo7u7u24YcFppOnuu5Rfa23bLAD/WBUP8Yu19jKrkl3iXmiZymPHfbrfJrwj0Z3E
 rR9qSX6Nfo6RtscAVM7xADrIx/IXmIXhfkJRFnNYdg9aztzCZR9x8kk9YNkG+QtHuPuqpn7Q0JL
 kFYx9qVdTIEaVd0I8xibmhACrf1arg915oEuTLtxhwN24aRjDVF1zawqJbUGNGyVvS9cZP05BK8
 bGl68xs8IGaDEwTwf9nzGzsBSPxLSUuEW6YfI+rE6DEoptcsbaY60j2O54aKIcxb5Myx6frdYiS
 EfkjkqOk0NIH4EHso63pdjMyiBiymEkcEF79gRp4hwEU6iuaDi9S5CPkUTYCyp7dLvkcpYmwegc
 s0lb/OlepaYL6bA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfXzPZNnCpD1jb6
 lnze19ScUhCiss5Gdyw9mKhe/INb6COSlQ9u86fh7DqCWF7iIDUIWbiTNjh5rRzdHP+CYSgcMSv
 vIjZ0fnqzOJ1HlVLinOEznd2tsFxol8=
X-Proofpoint-ORIG-GUID: kdJS-yGqbOoYZAXe0oy9Dr4Udg3nAPik
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9addc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=U0MhLFlXrxXVFuOl:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m72LRCnX1IptLpsbfGIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: kdJS-yGqbOoYZAXe0oy9Dr4Udg3nAPik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfXxL5BK5MF4SX+
 GFANCTBJNx6lWaJDa1mG0VpgLKg9xWrw8o5mkO0Mr2AB/4gj7N2RmzZv+K0KURJVG6SPqGmswm4
 ZGsEYV3gr0Wkr9hp2yYEBFsVcBYgL+CfyaOFa+9uo29q6FW2RmnjH1JQzqB1plhBW8Smytfo/oO
 FrR24InjpxQrRichUpsh0HCU5EIYfODKiSOzF7oRFEdtKeMCMLG+bL/xa0QE2MK4jM0Zyuqu9Bi
 kOBhQ4WDMTZZLmh8KWDEtpTKNngwJrZiFh7xYsAQ/kSau/8Jvtph3MOcQ7tNm9izC6kd8YKT8Iv
 B4Di3+13hUFOqGfxf4uc3476ewi8sh/sFiYJYkuSFZnj+aemac5ILwK9VKQgi6FPxAvPvCbzL2d
 tKNGi3w3TEBqMQu+yLaOSbe7sh8yWU/2CEUqQFe0FJe9mpqawXaNVIKc1s+h026e4ltIaYk8SN6
 NFp+GrTZFDu9goM5MEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038

The alpha value of the Zonda PLLs is signed, so for a rate with a
fractional part of one half or more, clk_zonda_pll_set_rate() programs
L as the integer part rounded up, through zonda_pll_adjust_l_val().

Since commit a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the
zonda_pll_adjust_l_val()"), that function adds the rounding to the
requested rate instead of to its quotient by the parent rate, so such a
rate change writes the rate in Hz, truncated to 32 bits, into the L
register.

Use the quotient again.

Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
Cc: stable@vger.kernel.org
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5..9782fb062a58 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32
 	quotient = rate;
 	remainder = do_div(quotient, prate);
 
-	*l = rate + (u32)(remainder * 2 >= prate);
+	*l = quotient + (u32)(remainder * 2 >= prate);
 }
 
 static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-clk-qcom-zonda-l-value-7f003397039d

Best regards,
--  

Abel

