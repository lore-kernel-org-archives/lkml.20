Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FFA4F93BD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897122; cv=none; b=i/wC0xpTmPaBjugEifP4DEmp+7KHCt90yUF/7pcmO0WDj9I1OKNKrP0iQZYTX13+g3wcJMzKfjwtyjknynRdXssOYFRxvKFS9ofMsifgKyDK2sjuzHYiGEZjvaCR5xsfolnKwmdKqA4iRfKRnw5lhsZN8nCld9QTx/4E2sDQan8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897122; c=relaxed/simple;
	bh=znPdOFOwZBUMCj5EAY5o5FOSIiA+E9Kvc8jNsKVmGTI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I4tq/8GmzKsYw10QrvKKFoCtQdLAxasfHIhaMDDhk17AV3aw5YnJvEvE3WOtpzhvbuRd0ZHwrWq5+HzIfidAXAMFW8aiEAun/icDY4GsUMnYdrA7VUgXRIEosFkBLV2luJVxoWU7OTVjCkTJ7PFH3S0TnkYUYQTxsVANkHSToJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXFwhIGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GYsZuLaW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXFwhIGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GYsZuLaW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DD7C4P015185
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q6rsWUbniNR+35DRdgW8wR
	wITWrJkhIyDXQjUBXS89w=; b=lXFwhIGNcyWrnKksud6+Yifza6NwoUkRKZqPgR
	/yJG9ugFb2EDYcjsW0RRj1i1ZbD0N+KfnJBOsLx3h4780I3ym/towluelNcewv/k
	07cdDcZd4pWDdnaqmsTTl+ZlPqWdfJfFATitUqxL25Zf/d8jdgrc09H+dGbChtr0
	ZjlD/Mv+JTT3/7cYrTHKVt4/ekR8b8DaxW30o0AFgO0GqqttZ6Ge+qAAFWyV47+d
	5Us2GmUF3s549N1Yrg6oYE88K1AovcvR/sOLAkS6ixleNQyv/2H0uBbcK2s8J1Xm
	+s4Pfi2e7gXEVjlnE0wc0240KQ96DQzw6t2sFHKNuORmu1+A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uhd9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:12:00 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7be858243a6so293086137.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791897119; x=1792501919; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q6rsWUbniNR+35DRdgW8wRwITWrJkhIyDXQjUBXS89w=;
        b=GYsZuLaWO0M0ZAc1+bLCJ5OW7ELCMARnlVUZVo5ZAz2UYAQNeGPWwZvPTi7DhiBcX3
         ORlbDyRAOIQAUkGPd+3VjWY5gQSgHzX4ZGw64FvzT5gODFlcqPq2UxVfHrKvXBGo+O2L
         vgY8PQnqFScCd1/NRE16SVwXjxnoRvyErGej8XMS/6jPh1ceT0x1iyx4kcG78yWixyDc
         LcR9TIjISoiB/H12e52cdJGSsvVWKDgRxhOv+xXds0+7uuQ98hYlTCnVEFBtkIVHf8z2
         S+xiDqG/1LpsKBkJeQdnxzWFxUbiKPf2Mca/T/ZOiSGn9+yCPKA19BzujNQOv3WcTS+K
         k+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897119; x=1792501919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q6rsWUbniNR+35DRdgW8wRwITWrJkhIyDXQjUBXS89w=;
        b=NtyLGLMSZoUAXTiEMiElwo4rqQpyZs2dsaBZUMChB/NFhnX7mnLepW3x/4D3FNgkA0
         nB786wJEAk4REoMvL6qLbyCtEJlbFqKWn7oo59cawWREIRVIOjgaCFukQh97oiQPPXP2
         9sqwkLFmGaoYcfp7fQkFwQcLKsF76ucjJz1UvYjHdWrZukBEzjRvbOK0o8l79d6gRypQ
         Z5Mkh1x/sNzYQqPVLRiGHoBchDNf7qfc7U8au4HD1Q+iPut161YB/VGHprSTCMYFUOA7
         G/2kGktCwLGruMJL5xtbql7BBNiqEUWk5yjb0NQ05D0a3wy6ZqLL4ibkdrkSpgjsRRNX
         tPAQ==
X-Forwarded-Encrypted: i=1; AKwUvByCes4gINYm03ePhJyGspC1T7qGsxu3wJQcdlvgRBbmE2yZAY5QYwGZoXKhogno6rSh8Ay0DD2uVAY6TB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc8J/RpR8ZeHeFgcjcn/b2ZIE5VDtSVm1Ps5SoZrpT7+7UhVzU
	ODR4CbGuxq9shPbmyMd8dAe6L8DOICXHsk7c+1gxW2XxidsTUnELloyR3qMiozuJH76dZE2i6Hw
	u4zX79moY5q/EpiWuoDKdwLrU2C0KRgCnMlRJIarlTml33+un+0sQSyinCXKnkjojbbHiXI8Dyu
	M=
X-Gm-Gg: AYBFou0NOkXzBTZESsuIbE2FKgRnP9XduTc2velL52fTcRW2oUPKdZU6usnq8tM7uG7
	C1xuCi+cR56pbE6eLefKe3gaxTg5dK4jeiEVKCPc64xbtezWueSW516qadTJeljyArMQVDAI04K
	Y4s4h4H8Bc5g2yGwmosCz+AsSYjh+vbaV6B7HeuGNQoKxdCeH1F98M5xr6RLr+v3tiOP/c+bg4G
	CVj634lIyrDI7loubTTOkID4b5+7RsUEOGN3mteIZYgg1VeLsOOeD70b9Zpntx3xwF407/8/fCn
	8Y9NOQ8S9DlLLJhTZJajT80wci8kpDesqFY6zrNTpQxkvTKRZs4iU165dfIHOsBOnAujvBur+De
	F5mm/IZ3HQQQrFDdA0G64t0DvSIDB
X-Received: by 2002:a05:6102:2926:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7cb372b60b9mr2953263137.16.1791897113533;
        Tue, 13 Oct 2026 06:11:53 -0700 (PDT)
X-Received: by 2002:a05:6102:2926:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7cb372b60b9mr2953253137.16.1791897112868;
        Tue, 13 Oct 2026 06:11:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm371862945e9.15.2026.10.13.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:11:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/4] gpio: shared: replace platform lookup with dummy
 software nodes
Date: Tue, 13 Oct 2026 15:11:43 +0200
Message-Id: <20261013-gpio-shared-fwnode-lookup-v3-0-4553c1a7d80f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8uzmoC/43NwQ6CMAyA4VchOzuyDhjgyfcwHgYrsAgMN5kaw
 rs7OHgyxkuTv0m/LsSh1ejIMVqIRa+dNmOI5BCRupNji1Sr0IQzLljJS9pO2lDXSYuKNo/RKKS
 9Mdd5olgI0UisskohCfeTxUY/d/t8Cd1pdzf2tb/ysG3/UT1QRrNcZWkBoBDkyTgX32bZ12YY4
 jDIhnv+AYEx+AXyAJYyZaKAHJK6/gKu6/oG9ksB8hoBAAA=
X-Change-ID: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=znPdOFOwZBUMCj5EAY5o5FOSIiA+E9Kvc8jNsKVmGTI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzi4RXrdsC65I4MjBMM8tUmtxLP2yFKhw57Z0X
 ubdJjjS/R6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4uEQAKCRAFnS7L/zaE
 w8GID/433Qh79G6boT6tYRR1lO0R1CnFBlp5Dl4whYb4Cf3YF27rilpZhkXIKafBZrBL6SDJfII
 uOgRPUmF0GOF0kh5eaB90XRDmu5vaaB/IINYPkQhas0mb4UfNesmgHCJSicWPgtn9CLeoGmQkki
 Iadg4RiBYKkD1ehaJpNdixHtBh36U+Xm+hyHVAPdXRHcia7+RCGAJmCNzLIPo4xHdnDHvTI+LlN
 EN13MUm5miKU+TIW2FMI+RkPgOhty+hmP6MRVKeq5Z4MUJhPklqch5ece+PrBmzrzjHLPZh+r65
 VmaOAeLPx0EGj4QjfGcrBP8HkSwfBgkaiqSH8xmcuBzcIAa0JY+2jYtnaG9b9h35HwIFrpK5oNX
 /pH1d0sxlzrlvIORXqQvkmOXBI76L9XEZoF3Vzcw4gxazXceRJaHP2nF7Y9NdAD4OgfTOqAvyU4
 tOwBZT4tiXdXKOFDlTg5B/1glPcjpcLd1JKcF+xg4EddwBZhNXkkE8uoiXf6/J1olFznVzlxCCo
 azvrYSnYg09wwiMM57FllabsbS9E3098IkYh3YeUi6gYxLjWDKoAHT15q2YlC8CVo3xCIoeU92Q
 Wi/fAPnWHlegacL7WDDGgSkMUazcfJHohPZs1mUevko6MkojXsxRA6vKAKds7wk+edFq7cGpP0q
 u5umYYfKWHZ2sOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX7RNT8FYshYtI
 mSEDugeVCD1PQetGL7+cuIXUa8CrAsfTtxbx1Ixg4NEF1pPdsYKSqFfMTs5yVIH77/32tMwJDBY
 IH+qIMVf3uGmcE4ZVjpMWigX1bpiL2EiIyiPe7ejYfCNXfhVX4dZKLEaUZSa4IWWIcDnXRmPWjA
 EebabyixdZrsEhnw+jT49vMjakvVkj2bTS19TZzlz7BL7BCwMttmJZt+R45tN8p1qhnzGi0ALwS
 MRb68NK5tgVLR5RbBQgNblnSyU/4yAtuchlakjKKYEbVcjs3INDz3pGutnZ4mRpmSw6LIaHtJBo
 8rPXuV7i6R8qXakszN68FLuHXhvDhxuOK3f4vY0Nc2GL4+yJSX3eTjyxO1N29pyFeZeDr5Cz1yX
 JdnI3PLsm1FQ2u8Ppf++bt7m/4wEabXOYeFCIo9zDA/hEmZe1QjeJgeM2T0yXVc+PLyqBT1HLdy
 +9rbFtOAGo1a4f8Dtow==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace2e20 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=cYHgvgXoKsdrWYhR6y0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Thdd_Zx9UgfjCh_F7t6yucxg2_VbiHoB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MiBTYWx0ZWRfX7Rbq6NI6/Bbb
 GMFSoLxMe5NEQFGU90Dtb1+bIChrwI6K5qr58430BsTiXpaVo4R8+IFTyj5Zlu78//3RqBCyW1A
 AnBpX27FFPoBWlYQLzIwdepUowMgAWQ=
X-Proofpoint-GUID: Thdd_Zx9UgfjCh_F7t6yucxg2_VbiHoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130052

Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
for shared GPIOs. In fact: we trigger a NULL-pointer deference.

Making it work requires a more serious rework. This is what patch 4/4
does with 3/4 introducing a preparatory improvement.

The second patch fixes the NULL-pointer dereference in favor of
gracefully returning an error. The first patch fixes another problem the
clanker found during review.

Tested that the issue no longer happens and that fwnode-based sharing of
GPIOs  works on Qualcomm Eliza.

Patches 1-2 should go into v7.3 and stable. Patches 3-4 are v7.4
material.

Sashiko pointed out two more issues under v2 but they're false positives.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Move struct auxiliary_device out of struct gpio_shared_ref
- Link to v2: https://patch.msgid.link/20261001-gpio-shared-fwnode-lookup-v2-0-9a40681713cc@oss.qualcomm.com

Changes in v2:
- Rework the shared GPIO management to replace platform lookup with
  software nodes associated with proxy GPIO controllers
- Link to v1: https://patch.msgid.link/20260929-gpio-shared-fwnode-lookup-v1-0-57d54811de1a@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      gpio: shared: fix use-after-free bug when adding shared proxies
      gpio: shared: gracefully handle no-device lookup of shared GPIOs
      gpio: shared: detach the proxy device from struct gpio_shared_ref
      gpio: shared: convert to using software nodes for GPIO shared proxy lookup

 drivers/gpio/gpiolib-shared.c | 154 ++++++++++++++++++++++--------------------
 drivers/gpio/gpiolib-shared.h |  15 ++--
 drivers/gpio/gpiolib.c        |  20 +-----
 3 files changed, 90 insertions(+), 99 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20260929-gpio-shared-fwnode-lookup-e866faeb5bde

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

