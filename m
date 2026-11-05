Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868155;
	b=ILZ+Y16CN9/Ojn0qHLK8vwmepCgPsqdJvEHwTA9G97jNz6oKGcC5+/KEPL+aS9Yn1V3P
	 7GZ3glkPuqMBGIizAAB8H7Ic1SREgD9zomnv55HeIvnOfyi5pgCcKFp1VkycuwDnkuIpe
	 T/3bOxntX9y1AmmDL2ujsMsTkfntpFxeg1hvz/+U2WhFtQLymayyosoWXEHRF+RjN00Jb
	 0mGhiqAyHKLQSTAWWGueasqNNTUlKFSUPMd2wHRM1FPeKJCoo64Jm04d0TYzLPcKtje7x
	 /NQ2QUHC5za/Yo31Oylm/BNoMcKvIRQ9H2GDCHAMMfsNAIKn6b1yCwmliCNrgNb0F/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868155;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZjM2RPR8MuyY7swVyfY28Db6o5AjdPyIfrWtJgN5Fx8=;
	b=rDApmNQFoKCSxPLafIh91V9dZzs/SCkjxboBTBzD9Z7glSSZ19ViYDmg312H/hJ0+wML
	 Yh7LbyhPOrRKIy8bqCptqEBH5tb9HOqzNTwH17EkdAa/qMh+MwO1jdwMFoWVeWHUjIUAh
	 zIj3wgf6YzHkhpiQM5kUeJrddT+QZv7xtilXBA7VP48nObh+QTDN1uEU8awrZ7vee+aG9
	 sp4sTC8Y/os6fG1bgS5E9SotFGU/qAvAz84I6C8zETMroz251T1qJs+42M21t5D1AVDq0
	 1Wp2+X6RyMNXMM8Os5nXsBZ3xCb2EWlZzHBQ6Cyb6bN3eQMBNMbomGkpUVbticKIMwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nz9nNfDn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUenW1K7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F226C606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F226C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nz9nNfDn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUenW1K7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UZFo595357
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZjM2RPR8MuyY7swVyfY28D
	b6o5AjdPyIfrWtJgN5Fx8=; b=Nz9nNfDnWomMg3OuQGuzkZBA5pS40urQnQZjJW
	TAazBiVPIH8N0C1BF4OVCuGlivdUdMx0N86LMjnynr56noyhNpaNzZftsnxojVGD
	JAhy/rKu+OrGuYjaaAtTqtpNA5cQjwkvekDk5d5XPgS9e7AvOSk7ixEpYJvzhUwP
	DRXNrsxKhxmZwuYhd+DouKRgUqIBu5MmP0YYtOHuYHHsjql0La2xYE4xxYmtkmI8
	QmRdiAZqOeM4/nE55v6TJ6v6SFkqGm2hFfTo2u1DeYwXqPMMv1E87IBuzgNG0vo4
	HfktD/ZLUaGyoG+e7su+QAtTIBxmQHzI+VJB1Y4/f/8YCNRg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3h4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:42:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91e987a4099so8780556d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868153; x=1794472953; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZjM2RPR8MuyY7swVyfY28Db6o5AjdPyIfrWtJgN5Fx8=;
        b=fUenW1K7aZ6v+gWC9+pFwMsIIVH8U1b9CQ+bqWD3nfvVyz8xEqSbYYIJLz9bXkQeWl
         t2Zc18DtPZX2bvev9w4LtiKbCPg4/JJxzHtarlL/7cT/pkdw9pz0BRLORYSJXxbWrw6w
         ywqH7Aaoi1j+EVAksyUT6p6yZpyaAUUi9rUtY1gLVLce9LKPmDTdMHGi+h5OC4hgODZD
         UmJVxsh8Yd1tI9Qxfk5RieaduOIWl9GvTFtQI+N9NmYz11PcxrPMBwcaskuNQsG1s4fK
         lyTqnhd6cyR77Gj2XjYIGfnt9MVhDcaauutkKtGfT99XS/z4sk9SWxRwT677BVZOY5ZP
         ayxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868153; x=1794472953;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZjM2RPR8MuyY7swVyfY28Db6o5AjdPyIfrWtJgN5Fx8=;
        b=azX29E9NgmF4n/eNLGnfQKcKYHfXD4XERoiA4JBxN0eynGw7H2orXQwlUToM5y4E23
         RXYpyj35kR45Z6/u6+Qaty60SimO16SfM5yR6iyFxggZMho+PfGhhd/geA/WsFevP0Px
         77MlhiGpWuRMUv8NJzf5RHQOLo5h8ImYD3TFQOYkrIifeHcTX1S96UMgkkIQ53JiLb9L
         k4U5k73Zyjpq0Sh3aRxZJUq8IPVdcG816HIvpg83+0/sTDt/iDkn107Mmtse8Ws7sGhg
         s3dsayynOGj0h+Ez2Cr0BEutEB5GSt6KTvEsdKH0P+G72YWRYDan9NOOtWr1hBW5UW8D
         DzVg==
X-Forwarded-Encrypted: i=1; AKwUvBw1heamuu3KtCHTHltCf3TDQL2AqgOOyft+vXg/bZdqSrfAqSEnWLm//k2xu2GYDZyWqghImxDQCX7bZWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z82H96zTsMKwG5vicpYpL72rlKw544Lmh6GOu0lrHdQjamG1rsG
	Tsca3YfGyMoWkV/HyIW+7RCeiiemBdULjsiTDyJgafVWmHTbmHjwTo/OCi99iCpLGps7kQ+EXK0
	GkqxhRKNmw9BSV5hIo9DjLFLjs+9iLWD0JCrMPrUzmc4Y0/ZA4EzWNSp9p4IduCi7XT8=
X-Gm-Gg: AYBFou18hC9PM2eTxRTclOCTOT09rkoQjV+xkefaU19wvBOAcu0jl++WsFYPnQQs/uT
	YJ4HnO+MUXGfVb0mxNKg2zY9W8JQJCFNTw5sG8G8n5mMkV1WYHPUJWf942L128uyM2kcDlR7BFz
	MS0CmvG+lj7TuCP7Qh1lgvr6JWJYDngIAzKc2+EE0q5sRWckSdreoZsSHU7pQKxj5ni45s3+5Xh
	UnFu10w83EpQ6hgrgSRUAXeCtHvkVS60poY2qZG0RoDHN2kEk6l/rYMLvHuLPgE3NICBivbS3A0
	p7k9NJ8MSKZ1tpvpC2yiImklSCo/N1/hmLzjQJZGflXDI3oPrkScNlV37/epynSkLYF3oygH57M
	v2VC4k2wEjk5DavDHhPAmbwI55XEVhH44huEfNlD9tcTgJfnIqTlmrrPtabJgSwihUvYjkAzwy1
	h9Zw==
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr2986439985a.40.1793868153074;
        Thu, 05 Nov 2026 00:42:33 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:93e:d364:c9fe with SMTP id af79cd13be357-944216970cemr2986437485a.40.1793868152534;
        Thu, 05 Nov 2026 00:42:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm89119515e9.2.2026.11.05.00.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:42:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 09:42:25 +0100
Subject: [PATCH v2] ASoC: codecs: pcm3168a: do not request the reset GPIO
 as non-exclusive
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
Message-Id: <20261105-pcm3168a-non-exclusive-gpios-v2-1-982577248ed6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHBB7GoC/42NQQ6CMBBFr2K6dkinBARX3sOwIEMLkwDFjjQYw
 t2tnMDNT95fvLcrsYGtqPtlV8FGFvZzAnO9KBraubfAXWJltCkRdQ4LTTmWVQuzn8FuNK7C0UK
 /sBdAXWNFqG/aGZUUS7COt1P/bBIPLG8fPmct4u/9UxwREApyHbm8pBqLhxfJXms7kp+mLI1qj
 uP4Aspf3X3PAAAA
X-Change-ID: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2
To: Cezary Rojewski <cezary.rojewski@intel.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0tWsyG9rE9BQEfezWGVo7jJJr2q9NPf4/ZW7zU+IisM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7EF2kBLqD1AN7auNgWegCGeGIznSpzpZlns8A
 zTsGOOnzduJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauxBdgAKCRAFnS7L/zaE
 w2gyD/9ROnXzIksewPI+X/kCHlQtC76Yg4XD7AKhci/LrWlZWkcntWkOe0rZ5GzBhqMbrVcZFHI
 5xPqoFjR8HdYlbw2+Fu+Ifw+bFDQ2vsm+OC3Vm8gvfiWodHXl6Bv6V2/Id1t2ajm8HhCG+odNB3
 opOjBSZmOE9GySD71RrklEIHo2kOK4pUAY9E8gJQkZqvnLSOg22jkIap8yhn6FrEB3M4MmarQNY
 90Kz9FlXHDqf9ZSyNtTKc0LpSSI3RYqMcYoeLrwIGiTmP02CPRs6Q6HO7LhVgHE3izzPaSe6MAn
 b4KskzwUkXbwSm0NBLWTMEDnRbA+BsJIWzu4wzGhQfAPoFI9hnD2LBcMAoPj7CLZDfKaeW7BTHq
 L1CKmRooV3jfKVWViY/MoGxt7fMxQxhVZhUW9rJA/BZwxvZn1j0Qski6V1SloIArTF4Agaji5tX
 Cp1gQNz0AHBhP5ky0gS7PM4rR43djHSX1xcxa5C2OY80thO2UCiTxUqB5ucUCHMnhTTGuPpwvVE
 0eRuy61vfFX0PgFQb1A1PAeaiylMAyVgVfNcvcxSml30epApOPlzbDvJqjuavm2oFVFyxb4BYns
 ixG+KUTw5sY7/EXRO5dQAHMJSGU7b1vvE6rO0jnjsCzGRFti0A3m1fho+Tb7mlU2LTuqXKN88IK
 AfXz90sKumn81cg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec4179 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=RTQ-KL1RhNhVEIJxQikA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfXzoiA7YWjubJt
 5N36qtD82D1oPw3ldihPEwGfGTi5eAVc3WESagIcYYntpmHKmRY5t1kn8Hv82r9d22d4GdKz9C+
 YM1OlnI7whDw3hiQkUjYKHag6pbJh48=
X-Proofpoint-ORIG-GUID: f-PbwSUcmmHZCL9GGzy-scfRNW6Qovhg
X-Proofpoint-GUID: f-PbwSUcmmHZCL9GGzy-scfRNW6Qovhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNCBTYWx0ZWRfX3ErYOtACwzGY
 JKoRckGkHyPVZmz2PkA/jP0tpu9IYhFeoWzX6Uwi2r3bhCiGUclYPmhWVl+OBjFaK1vvud4h0mR
 toyUJQtMjbIuoI1+GK/o3sM9hKbyDQ0mOpiz7L7IzAf4noLdoYELvKkeON08A15yA/MxAW2h7g7
 cGPRMhB3LBTJ3un8Oj9s913L+lOnCjBTsip7uBS19FBmLCaA/K9G1gV1fcPfyX2X8xUvcE1j68Y
 HHd9kl5qe4G8Vizq+L19S9N2VtoX73K5YCmgn00/K0bd+kCXT3F3eaVzpZW36EejeB7jr9f7ydz
 zsd3bxeBfdgWQy14Db8ggansCQ1k40TBOtgAkWu7RqJ1ulAATtw9/LyByL1h+YOz3p9IrEFledA
 CgH8sM1TCUvn0QUhf6Yu/nv12aawncHk1Gzp4na7HBNbsMgbNcJ2KtQaOykDRYH3vp4MXNMRjAg
 lAeiAVhxAJjSnrRaiYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050034

The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag is deprecated and users should
rely on the GPIO shared proxy. All users of this codec driver are either
ARM64 - this architecture now enables shared GPIOs automatically for
everyone - or x86 and don't share pins.

The driver no longer has to care about the sharing so drop the flag.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Tweak commit subject
- Extend commit message to cover the non-arm64 case too
- Link to v1: https://patch.msgid.link/20261103-pcm3168a-non-exclusive-gpios-v1-1-5cfdcf36c915@oss.qualcomm.com
---
 sound/soc/codecs/pcm3168a.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 6f45ea4869a75d77344b06e1092aeedcea160058..c1a263216ea6d88757053e93d782b8c8c01f8d1e 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -725,16 +725,11 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	dev_set_drvdata(dev, pcm3168a);
 
 	/*
-	 * Request the reset (connected to RST pin) gpio line as non exclusive
-	 * as the same reset line might be connected to multiple pcm3168a codec
-	 *
 	 * The RST is low active, we want the GPIO line to be high initially, so
 	 * request the initial level to LOW which in practice means DEASSERTED:
 	 * The deasserted level of GPIO_ACTIVE_LOW is HIGH.
 	 */
-	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset",
-						GPIOD_OUT_LOW |
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(pcm3168a->gpio_rst))
 		return dev_err_probe(dev, PTR_ERR(pcm3168a->gpio_rst),
 				     "failed to acquire RST gpio\n");

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20261103-pcm3168a-non-exclusive-gpios-10918c1070f2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

