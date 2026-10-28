Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180467;
	b=e6Y0ICDObh4mwLPlprlYk0UW2UNNwtm351/b+X8NMLYrnbuz2uYISBmgUWIGNHNop238
	 sv314pR1bK5noKkuxiVak9n1Y59eIXa6ZZJQcJA9FQPr8E3Qul9x0VfgeB6bQJeQpertz
	 PfjHfymnlcOmgB0vhTxESFlGzE1b6r8eyF6/i5EyqAZ3Opbe6YZZROS+iNmHOWBQdhCsG
	 2npYF/tdaUW81sCKCVOibRwrloWpyJ630bJ8I5o6xROJJj0sI7ztFCVNxnkxyBaZgDYva
	 /L/3lPpMKAD/OA6JgZ/JB3kAGPucPTxcRfmV65FR1KneA7LsNaGrn2fcgY+rw9JRdfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L+KemHLx/a6AHtJGiAt24xzrIPnar7pThXgnPcOIO5w=;
	b=G2I00S0dr9EmQiCVzG8W2NwV4R4tzRb2Jwp3UYrqmyRAFhq0sJqu3s4GKRBXBRpQqWpV
	 WxxRnyvaeCWTWBhYI53kEisAPsXR0ZSWHJgn8IqmGqe7yrvzjHS7eUoLIAUa3CmZUWOoC
	 ZZ1rIf+Tp2R1w7/lnnx3AmUAmwBshDmhA53+xL2Dn44fqeiU3tM0bsgFMZublPXp+vkiK
	 nbP3Gbf4uCiCkygzVYjl+4ppOqnBoOcMt2HHKfzjL51VuM1fQVdVLOJj1M3sjmJ2u7O+p
	 VY5Pyzigb6snE5bS5KeEPPah3s5jqAHX++3uMNf9QnmgJb1PUYk7TozzhXA4+cglhdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4jWV9o0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8n2tMZ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72038606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72038606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4jWV9o0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8n2tMZ6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KB4r1667715
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+KemHLx/a6AHtJGiAt24xzrIPnar7pThXgnPcOIO5w=; b=T4jWV9o0B5GPSqR0
	iXLOs4WMQznt73YcP5vTThWtO+rAvTqjqDolaGm7Mxw5bPxIVw0a2L1h2Vke8sVI
	PJzTh9X26bnc15ncLoAbuROHX+KN4YoLAKWVJ9nuYBDgo3Rxj96+FiuBk82OaOy3
	JJufsZ4BE5zaHgdbPhIydsTrcNgp0/EpWTjClUKMQo5pMuDA4wNl6/cL+jY5W2hG
	wZtbNvMoGF4mYXmMMRQSO3tWvsdEK7HF7We2aStoWB4/MDIEvaXtvWCcZ7FoYst3
	iMTkMJ0zWMW1CaqMWJV0ln8+/LuoXhwKH3UEt14E25IB9tgCSpz4PrWd/hXyISoE
	Fyjv4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12ptx6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:41:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so121934485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180465; x=1793785265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L+KemHLx/a6AHtJGiAt24xzrIPnar7pThXgnPcOIO5w=;
        b=D8n2tMZ6B3pA5T0WKQPbEpHFDg36rhvUMtY6y8ndHdufNaii1+hYsGOVoMS3M094rC
         yVfTuHe/pr8w1f1tGNpcl/ZnY2oAKspEDh7tYwhJW5/LNyCZMxgNlhi7yk88KxzkoH6k
         6XgJ3d5kwDjfylyGl1bitcJmLuPKXSAt9o41JGWwreMvnGi/qr0QXcXziLDq3T8mSCjm
         deW88GhDlL5ZKCgYNGZ/yjaTmLp3mA9DDS/VCGjTz+G3fEJfhwatRH5A3ClRohJWjq9I
         lNpmT1keR+Ng8rOtwGiFapxMh7HcVrGGgCnAP8207Bi25M2M2fps+HP36DzMf/19YK2n
         IiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180465; x=1793785265;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+KemHLx/a6AHtJGiAt24xzrIPnar7pThXgnPcOIO5w=;
        b=QYFZ1Ihry+s2v5MUvk0QQC/YJOH+h3hKiup7hSPfcJqbbP4DVndtD5uLcAk9bOhyEe
         u/Cur9KaJQjW2foyoNPm1zD8F0ImmqbcDBZXDCM9x98eRs+g2/nhVRFcjhrqdLhEgyY4
         iMFFBT/slPW+/aAYxFE0vAWfVhG5HYm4MNR2+GmcbS7Qag+B00/zc5ORLWZMj1PPrTf4
         L9KIMLMwfEFel4XFd6yMlLDUapaiOXeTkdiEjoI+j8vd22GSHoUXtPilFu6Nj7D1gne0
         CCsNej/pylO9vxngq2ch+Uee+YncAqn55NeB7KfODcyOc5mp8RhIWWAJJp2PH5248woe
         e5Fw==
X-Forwarded-Encrypted: i=1; AKwUvBx+QbMoTHL9PAhlq4VUlVRLk7JYy0Q5YOE9CHnrJ2o2rnW7ylcRd7/eaRvT2Z++AkUEdFE7kzX6RUQ/QK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRYL4FC/rp3MwWVEaw3MSbq5pr5QqMkZTPZaP7MjdGI1WcmEo8
	HKHp6R8CtXCUT4N7hFLUaYPXvBt/K1pnORWL5c25UH6hqb0mMOsfb+lXWGcca5RyNtCKcUNEfA0
	9SwyVSNkJrjkh9nie5mAT01/mjMyn6XiT9ZkwXF1gQNt1oYI3OGJkebu+OKQgDJQdzMk=
X-Gm-Gg: AYBFou11Hvxuyxq5rzcNvOEMAvw0L9W76U8f2zCsjQUwH4Fn5oH8PUD4l6Mc+F79qw/
	npb+7nyMgmvLD28Sr4sXc89iD9C3BFqXnflnjMiOIcpM8RiCHBTixBzWLI9Irqbq6JFXbABROFZ
	P/qGtzLbU4shUULhf98WP343oBZApaRYkTEJnctT/V4SrfLRflMONVDZDwZRJEXckY1Kcsk3X+S
	dICYFuEcmDmogK+KDzeAqUob2nA9wa5CZl5oJJ34PVjqLbBRMKhprAEQKTT+S52hsP+V6rJeur2
	xQKC7oMpToWUCRlIj3MAUKwdQt+07UKE1ccZCL9cvQlu1YypLoGjNeSJVkpYQjbKqvNQ8+WH6lC
	u79rizpqcUPCmR1sU35XhAI6hT9pEP1hmfC+napN8vj04vAO4qCdam6pariWo8U8VxghQ34HKaX
	nm
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr229533085a.28.1793180465463;
        Wed, 28 Oct 2026 02:41:05 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr229530785a.28.1793180464998;
        Wed, 28 Oct 2026 02:41:04 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm34882801f8f.49.2026.10.28.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:41:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] gpiolib: of: quirk cleanups and TWL4030 external mute quirk
Date: Wed, 28 Oct 2026 10:41:02 +0100
Message-ID: <179318045884.12328.4163540170233440130.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Sg2MbvgoMboTbP5khrnJShgy_U9kSQJ0
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1c332 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0dPN6wFaJHghg141mMMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX9w7NQP/+Rsu2
 X/Q8fYtmUwFDt8LbxSemdoZWl/ZuBBedsb5xYpZugMgo8syhrjYco1InYlxio1xv8vyV1VvLS6o
 vvTtIFcbiah8kl3lhX8HcTJ53pKBOWePZDbPApF5UTEknCNAB1Sya4qIiWDA/t35ciqWTVk1Pq+
 WpVt9cQuNQF5bwcs0jbpMp/GSQCe6fbofxUFK7+Rwn8buDq6wCPd5EC5Fh7KSyginsZcCJYasxa
 XZNwsl7fBsvOQcqK9GnE+/h0ijRAv7vVv/cdsd91nRcbmhKTko7qrAbWAJbNEqMugvAbIDzeLrP
 1qTOdqHYF0UXgI0Fp+4DwtHM0nVGoxA/xGUX0sjTOTXHU4QjhvUxisX8H+nL3ShEMbUpn3g7uH4
 zX4a8B8sLoXDgpsM/VZUZ/kB/lX16jP++JzPfgdpsD6e0P4Xt+4eM5H3hqsQOIULg+OP6NpHEtX
 Eap/iBS29/L7OoC2C7g==
X-Proofpoint-GUID: Sg2MbvgoMboTbP5khrnJShgy_U9kSQJ0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX+0AX9cyJQS5V
 nDK+5mx0wW9wtn9nuCSFgVGZwEHNWU/nWufStXp78hl18awcumEjbn0CwmTTF0Wpz9GzNeqmjVh
 BOUeZ4nkX+tvOPNbm0/P2I6xSS1FxIo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Thu, 22 Oct 2026 14:52:44 -0700, Dmitry Torokhov wrote:
> This series contains minor cleanups to drivers/gpio/gpiolib-of.c and
> adds a legacy property quirk for TWL4030.
> 
> Specifically, it removes a redundant IS_ENABLED() check in
> of_find_mt2701_gpio(), compiles of_find_trigger_gpio() conditionally on
> CONFIG_LEDS_TRIGGER_GPIO, adds a legacy property name quirk for the
> TWL4030 codec external mute GPIO ("ti,hs_extmute_gpio"), cleans up
> formatting in drivers/gpio/gpiolib-of.c to pass checkpatch, and uses
> __free(device_node) in of_get_named_gpiod_flags().
> 
> [...]

Applied, thanks!

[1/5] gpiolib: of: remove redundant IS_ENABLED check in of_find_mt2701_gpio()
      https://git.kernel.org/brgl/c/d517aacf1e177377c48a50043982bb8f6e76d4bf
[2/5] gpiolib: of: compile of_find_trigger_gpio() conditionally
      https://git.kernel.org/brgl/c/ab2815bdba3ccaebee7d39df033a65bc8df98543
[3/5] gpiolib: of: add a quirk for legacy name for TWL4030 external mute GPIO
      https://git.kernel.org/brgl/c/0308963cb224c0b0d368072209a2da1a97f93302
[4/5] gpiolib: of: clean up formatting to pass checkpatch
      https://git.kernel.org/brgl/c/6ff56d6f181408a601b0cb777f34a2cb1735233c
[5/5] gpiolib: of: use __free(device_node) in of_get_named_gpiod_flags()
      https://git.kernel.org/brgl/c/5736f73571b2cd1b957d09ba3479275fc0c89f62

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
