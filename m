Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775880;
	b=TcYrtTE05xMrbSszxjBsrZf5NGX20m0OoifHDpQVz5U48KbF4YNEzqOhfLbWEyGaNnxw
	 t+58qLxIWhoqLTmThbAX2LAyh120Gt3yzysk5+cp33HAyu/5tedE7D/RoAS43gL9yRw+2
	 sQTf86Jss6fGFYpNkpdA/QTGFwZQ0Jz6L7t2krPA9srjMOaCqzl4SNQfcaAUC0+7VSyDx
	 Wnvat840rtPAOBbaUfpn+ZfBtEAYulJFOmzpd47j6GuRrR+RLi8d8ZDhOMU4YoARea+Ix
	 ev2bkauGtrVzKokA+IAaak4TkzrxHzCesOQG6Umlu5v1Du5A8akOgPdTdqHTwrMudUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SfsF2sbiRp1415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=;
	b=l5IsJ1Sput8WRkqwhLteWaAbukvqR83+JOcNRjY81PJb56IyeWpQMkGHQZTsjNDUtWnd
	 +6g3nDShHjJ4L0OEsvSjVqy8BJpeEHM5X6xn2gSRafBPRf/ZzP7yf3EVG1cw5aog52fmB
	 prn2t8jSxxIsFO1a4ypS2/nYaEhUM+wTNDAX7B0ak5+4F++CGNTfuAUxcQOf82HQubcBf
	 C/duoLx7rVjQ5npQSdHqENL7pMO32OUT6lMoRKb1hWb710D7oXu/NvZwfAIP2hLo6M4ll
	 7/O6cSWGjxWvhEyQprpC9Z4ch2hs6XifH3hPZHhQiwK0K33pUmgy3wnYTd7pbtcSOnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lcyB+k/j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Io50dZuV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E44A60A382E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E44A60A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lcyB+k/j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Io50dZuV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wx32109142
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SfsF2sbiRp1
	415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=; b=lcyB+k/jbGPPFkXQEw4U3rZdqX9
	6D28PZ5ni2ouJQMh6PMWt+WIYYGK2cz66UmMcfNtJzzHJIixmCLViHLXF0ftywIQ
	JQW2OVCB4YoAuF5g+h70rCuSiy12Z38WbodyPwQpZ3nAokwK3YqKsTeA0UIuBHi1
	c+bh3xfhOfALFpItF/TPnlnZoWI7gsjSP8bVwYGD1Fn11IdkEPq6C115ztoFzinL
	2eARUCZa+nXCxpIYpIaolQObWp5l2QkNCe5wT6mEs6AdAH0l8sTCKor9E+IXbI7k
	2ViOwdVa8MDMLftpJxni82DWVCM43NwAVOVFjZrg6OSjIPMifs2V3nOwNgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms4qv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:17:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so215340485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775878; x=1793380678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfsF2sbiRp1415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=;
        b=Io50dZuVKCfETgSoQTI14ZtbNYlxzdVo3UTLMLhYv4jwWyyA8rONJcOvXdz/QGbN6X
         56SxbgEGDw/F0u2i2pTTSn+iwVrQ0l4fvxsWsqktieGUSsj05QwX+kWgdyenbqPcPM8r
         nIAVXcrvhGujizn9Q7ybyLWI4wNzWdRdh5BwvgKZWpap0CcyfWruisAd7jzqjtJcfYOW
         aWp0M1ZuWqcIwkJTzjvJnRVfPgPVyZLFdDxehURZpo3Y/KazhbIRWAO84I4j34MRL7O9
         B9mB/YQhCs3voMpmdtM0y5xbt5X4tx4G4tDVAUKDq4WNuaD1warPjovnZGL61H0KQxKA
         SzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775878; x=1793380678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfsF2sbiRp1415Zg5QD61mmr6NxukLeOnr8JRBKFqbs=;
        b=fHGd793ll3kCYWMfOfwPy6zAz/Ca40GuiUJ6AB5zlExivhX83TdKtF+oS2YdQ9Ir3d
         DF/Lzg7zD8atnG1olzJGeyAAGCfLAzm/M8CoQ6wLEGDA7ncip64/mwoVjzfsdopp1o9V
         YdRu2FKkh3O8nPA06ZA0BejA+QcWY8tBZO42jNypOrl4BuZAu3pHTeIEV9Mtd5xCoB7+
         GvMhUcF0N1/u/OFu2DAWMNPPBCBHeWR29Tk/+gQpEEA/9WuqWYR+67UJ37pGdvO90ebz
         ErYQ0N/tVsOk9mP/r1aBVYynxJMqK9aG/X/gb4WuTH0kKZSXiJs1iP4iI5kAB7y1f5iW
         EK0w==
X-Forwarded-Encrypted: i=1; AKwUvByt9xwRSOoIB8XxtLHCkyUB9ohbPAcvvVhJB6mSNzRAia7SCrHViJuHw45u5Sfn8dArjPVlcaenm+FW7Ho=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0bEiS8OmHJQDySMen3i1BV4pO4LR+YKMY2x8F7zyReNtlckTo
	+BYlXTUIP80kUfjyazOMCwS6K9h9LJmrBhCX/dKFMwVFl59krmGZ2csBCA/j7QJ3nkVsvnc8XtQ
	pX/edGQuN3DLwvOiPyd7LCnhv5uggKc6YZFfrZxwWKgx/5B+cB+ElgZJfZ9j5nyAceQk=
X-Gm-Gg: AYBFou1KJhh3i9fTTsGvO+lN1eeIbHI+49o7mh0jXHuOs3cdoY0UOPtgC9GwE/NwrYh
	w5eX9M87yvWL50U+3LfSc8DxY8gRZQT3UcfUQLOlhOTHNqfG/stNT+SS9YJQIS7mbXh56EDwzlc
	19cV/3XIUZdkHcMM3ui1FjNC2u0B195hFSvpqonTrJPp1K9d6ZR0dtA9FUZ9EsCPrO8zq8toB6r
	8HHxlHNeRfNhIzKJTl2S6Lc417uXy8zstsJ5iy66ZhRTR8T+kzFeUel9xqgCKT+fgZAC76+nRna
	xGSyERMI7XertbBnlFpIyAcQmdDWfZmZ/oltn6pqVPZMNhrt4NrKFoU2F2VomCDdAXJ8oNQ6gIl
	QfyEnk8Dm4agX
X-Received: by 2002:a05:620a:269d:b0:93f:1ff5:8908 with SMTP id af79cd13be357-93f6f7e72f6mr519957785a.41.1792775878321;
        Fri, 23 Oct 2026 10:17:58 -0700 (PDT)
X-Received: by 2002:a05:620a:269d:b0:93f:1ff5:8908 with SMTP id af79cd13be357-93f6f7e72f6mr519952785a.41.1792775877752;
        Fri, 23 Oct 2026 10:17:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:17:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 06/23] ASoC: codecs: wsa884x: register the die temperature as a thermal zone
Date: Fri, 23 Oct 2026 18:14:16 +0100
Message-ID: <20261023171433.820092-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX5gzYZcqa+Sqb
 vLLc1ObRQVoOrWb/SonyI8NpmqIYJOAyjLkxCej/5GTmRWeI+mxv0cT93j9ONwDv98FZZS4V8cn
 eiGpg+u2dZ5vbm+FgX+YC7DMPkVVjSV+AQSDaNUuQSR3UnLqjaPpm/zXNqwSoAtyMP7mPUS14Al
 Px8nEY082TqL1McI04eT53tTQ1Eex/+snHcCXX9z+YDtXxO8azoNG6ZFPVVMqIoSICKehLgFYJQ
 qs2DkRIxfeqhMIBHWmnXHhSnaGv9r5j4QErq18+t1fVrfIc35bPNyXpwf0TIP+8W2jL9x8ZXc/Y
 80mm9kPtxYGzkPsBP/JCmz4hl0OVQd1B70Q910KYqYfKQyAfpcR0jWm7GBVKBl+O3Du88R6YQzv
 7gyfdV1Rr+JKy+m2fN1NtvEKfhpHc62aSLGAzaOT2MJw985XVm1P2Osb6UmTq3992NR4Vq4M2zW
 T7BfSXibBX/uYpbl8pQ==
X-Proofpoint-GUID: GZ0iYErJAyt_z_3q5sT__2e3Q2lZJlzm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX6gYW91kQPLAK
 DE+zic2Ekq2fxZ/mLxc+TjIysAMEUioVwkVT/99EfU5fiNC9SS7Ls1Wb/W7qY+ntplJ0a5dFLyb
 Hqs2AED5koh2Ugbk2hS88vBYBzenoJw=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb96c7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=51jdShTR6rvD-JhUMxgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GZ0iYErJAyt_z_3q5sT__2e3Q2lZJlzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230067

Speaker protection pairs each speaker's calibrated resistance with the
amplifier die temperature (T0) at the time, but an in-kernel user has
no way to read that temperature.

Register a tripless thermal zone over the existing temperature read,
named "wsa-<bus id>-<unique id>" so a user holding the codec's device
can find it with thermal_zone_get_zone_by_name(). Until the codec is
initialised, and while the PA is on with nothing cached yet, return
-EAGAIN to hwmon and no valid temperature to the thermal zone, instead
of a plausible looking zero. -EAGAIN would make the thermal core re-read
the zone every 250 ms and keep the codec awake.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wsa884x.c | 70 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index fbb9c5773aa5..ecc6983bb54e 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -23,6 +23,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <linux/thermal.h>
 #include <sound/soc-dapm.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
@@ -1928,8 +1929,10 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 	if (wsa884x->pa_on) {
 		/*
 		 * Reading temperature is possible only when Power Amplifier is
-		 * off. Report last cached data.
+		 * off. Report last cached data if we have one, -EAGAIN otherwise.
 		 */
+		if (!wsa884x->temperature)
+			return -EAGAIN;
 		*temp = wsa884x->temperature * 1000;
 		return 0;
 	}
@@ -2051,6 +2054,42 @@ static const struct hwmon_chip_info wsa884x_hwmon_chip_info = {
 	.info	= wsa884x_hwmon_info,
 };
 
+static int wsa884x_tz_get_temp(struct thermal_zone_device *tz, int *temp_mdeg)
+{
+	struct wsa884x_priv *wsa884x = thermal_zone_device_priv(tz);
+	long mdeg;
+	int ret;
+
+	/*
+	 * OTP trims read back as zero until the codec is initialised. Report
+	 * no reading rather than -EAGAIN, which makes the core poll the zone.
+	 */
+	if (!wsa884x->hw_init) {
+		*temp_mdeg = THERMAL_TEMP_INVALID;
+		return 0;
+	}
+
+	ret = wsa884x_get_temp(wsa884x, &mdeg);
+	if (ret == -EAGAIN) {
+		*temp_mdeg = THERMAL_TEMP_INVALID;
+		return 0;
+	}
+	if (ret)
+		return ret;
+
+	*temp_mdeg = (int)mdeg;
+	return 0;
+}
+
+static const struct thermal_zone_device_ops wsa884x_tz_ops = {
+	.get_temp = wsa884x_tz_get_temp,
+};
+
+static void wsa884x_tz_unregister(void *data)
+{
+	thermal_zone_device_unregister(data);
+}
+
 static void wsa884x_reset_powerdown(void *data)
 {
 	struct wsa884x_priv *wsa884x = data;
@@ -2187,6 +2226,35 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return ret;
 
+	if (IS_REACHABLE(CONFIG_THERMAL)) {
+		char tz_name[THERMAL_NAME_LENGTH];
+		struct thermal_zone_device *tz;
+
+		/*
+		 * Register after runtime PM is enabled, as the zone is read
+		 * right away. dev_name() is too long for a zone name.
+		 */
+		scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
+			  pdev->bus->id, pdev->id.unique_id);
+		tz = thermal_tripless_zone_device_register(tz_name,
+							   wsa884x,
+							   &wsa884x_tz_ops,
+							   NULL);
+		if (IS_ERR(tz)) {
+			dev_warn(dev,
+				 "thermal zone '%s' registration failed (%ld); SP T0 kcontrol will read 0 for this codec\n",
+				 tz_name, PTR_ERR(tz));
+		} else {
+			ret = devm_add_action_or_reset(dev,
+						       wsa884x_tz_unregister,
+						       tz);
+			if (ret)
+				return ret;
+
+			thermal_zone_device_enable(tz);
+		}
+	}
+
 	return devm_snd_soc_register_component(dev,
 					       &wsa884x_component_drv,
 					       wsa884x_dais,
-- 
2.47.3

