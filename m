Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482798;
	b=Rf42tmrogwx5H20TthIYMeRFJq+lw21dgQa2RHAhzL/7HhwvdC1d6crK0zRZsEp63+D1
	 Fciv1vevwXyH/3wY5uc+IzVWv147Jg9qe5tfpptOKBJEF+ilTTexeqsgNDAU2E+U3RHK+
	 EYHh0ZCx7XvliGbZEtTa1o3UVIcdYrbjSP6je1zKyg84Z+IPtPp84322v9QxZo5H+ITrx
	 /1Y9+vtW+xA41V035b9CVTo8UvY8oIrb3+w0z+6CwMAlZwUtxfHxaWufoNsLzH2AMn8KA
	 8njH7I2V4FfZ/RzN3e4EbYJPP2nbHJJvRKicdT5g5bDroyaDx8wYvIh5ZaWxL9AvhWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482798;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
	b=tU459jqfya/AdSqI3Y1ntGw0JGc/Wx/qbPZQx+K0FO157LjIe1HOYYCL/zYclkK2oOLs
	 1RrKDj6BY8UbTkf7eCnc7hGm9Bz4eI3Qlahoh51hG0nxgHStVep+TdHqtIsscjyrkHx4n
	 R4anh/HIgyk/6/n/PqywtbPe7FvJKspsirOQrMKqdvfeIyNxSHH/B1oV1LSghR2NE06qW
	 JoKRgTqbAt5QBSETMS+1bReixslV+3fzTS7Gy2oThni0Z5CR/7zELmAhOkuhWSGPkBaql
	 1otqO34LIPRKaUWdUSXTjmgTGNQKUpvgdBotmQCAmgTB5YI+gWWTLxnoNSaFKCkgplA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PW6iwmlI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lytu3A5a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F8960A2636
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F8960A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PW6iwmlI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lytu3A5a
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfKBd1953709
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=; b=PW6iwmlIY0wJeZb4
	jNbKtoLiuKMPerhdmUDus0qfuSw1osFZ9xMiZUgnERyfCkPnQ8Kz/xZpSeqQF1dy
	URuPt+XcGFinoH3uQ1sJomdeoUWGbEngr8Xb75RVjm9/PdgcTfDpo2gY4/dq+kL7
	2QYf9wmpf69pDrXlXAYQFFdL0iUKTCxM1JfXXGao7IiZnafMMDdH4sLKFNVvJh2H
	BY07Kayh+gPvRFrW6ZRSdyro5/s/hEwJ5amZJCdWxAyZehlhnbu65nshOztb+Wbd
	dwVZLBposjWPcxMVfrdj2jRFwVP86b58IwbIpNBsy3syjKHOgj7BZNx24FbAsBfw
	ePbZ0Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx304qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso5974230c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482796; x=1795087596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=Lytu3A5aDd5UY7W1bXigzGl6UqJ56HOeMXfDp2cng9iN7jiERGKCl77dyW4XLykPmd
         Ot7M0L81Q6YKs0inISA7j0CtIVSis35Rff48PoY4EPD976HrFXONa+rRltVfULVJaR51
         vKSdpaUwZudq0ro51e6L6UYwHtLFSLcqeKI5QtdlfXN8dZRXZIJiyMJF2rhGdobVnMhG
         AKc77j6xUWnIKY7ioZHJ3qMBUXz4+XZYBU7Acs+M2IzBcmo6m4q9l8ODvKxqOIplZYd9
         8OfZnL3WMI9ujw0RLAUWRGYmYeI7HMQRpJ96cSGMOSyv7OIx4zVoVIgTodOclT9CzaW/
         WUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482796; x=1795087596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=KpulAv8peTfBiGXpSMsPAu6bJB2f+0S8/M3FjQ5LJKPVlCIXxVHdOa8o8gptTE9GcP
         tGYzJet+JO0EDyY1WbEosoAbHDYIlNGjxDCKBUqt8j7S6UB4/N3nIcgWCn9VGz6F4+H3
         LNcw1+YmldGXhBba56aER7Elji9C8VhTe6F+bva9trgPnD0dpjPYbtWdAd9lE5UNZmxr
         1zaB4JSbNfFKB2J4hT2SkJsX0ViPT7iFbOgcKy2pRyVa6BP4wuMl2L20bk936WC8MBsP
         jVU8rzoSRhC7KWaj8Mh3e9qDY6XHVIBnt3B8mEsRyOipazSs/na7UndlIOeNR+Uu0E2n
         l3Dw==
X-Forwarded-Encrypted: i=1; AL+hErFt2DWlkxdiqpcSHHzS+1AFoo+iiNuvMKuLM2tH+5tWMsZe55csGucgni4uMNnL+GiHKcRpJx4a0MrKQJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i6Cq/oOiWwSKBVDwfvpjosu0gX9GmdJz8rCuPG18pbkaBR2n7
	ho6+51Etmla9UXCSmZWjzDNIkG5nR08d9EOqKUtRIgN6TE0z+sVa+kLva/TMNAEIkZlW+NOMPS3
	NbnD2ScyYsoRemgkiDpF4msLKSpB0atG7YvWs0I6q6tN7eOjGET1hdUCb2b/oiBxJRT0=
X-Gm-Gg: AYBFou097EotwlAXCf42MYpzHZK7fVDnAExDToiE4+ZXWQUj3j8fjvNzPBxvjlfhMgC
	etOO/hDcM//8S4pv3NEBpJtINY755hG8uvtpMshbJ/BIGdDbTwyEYgw+9pnrtxA21Xd4Ppv5Yx5
	ukY+CxsUy4tiOCZ7FJyXezp9eU/wHosxOBi0+QCzKXJpJBpJ4EOKJMwtLe07CwnN5yQXEfZxTst
	5HBV3q7SkAHFrXoGkyk56H/C4NDYs6iCMpQ+ffIAUNoBUeUiusNP16LF5693B/z16lERwNoTyDq
	gNO7gz0Gyb1a8KlITGs5QwExMcHsiIVsQ/x7FosT0PrgFwm03Vzib/8H6OPT0ld6fMphBf8vkdq
	nfHcVhXELUPFK0sm3p2soMu68UtWVoiQYnWugugF+VLi/Ys7Y7/Ilbyltj2pS194KdqbzRtFlhp
	KemTj08x+DzzerHZ9D2ZQIBgi5
X-Received: by 2002:a05:701b:2802:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1b3c03179d9mr4221970c88.19.1794482796284;
        Thu, 12 Nov 2026 03:26:36 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1b3c03179d9mr4221947c88.19.1794482795679;
        Thu, 12 Nov 2026 03:26:35 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:35 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:06 -0800
Subject: [PATCH ath-next v3 07/10] wifi: ath10k: trigger recovery on PCIe
 MMIO wake-up failures
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
Message-Id: <20261112-10k-sdio-crash-v3-7-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3505;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=8sf0rAmeCFvmk0B+SaOwK1SuISp//KMx+nDrAcdmPS4=;
 b=N5sl2Mdpvr96xS5zyBkY8ux81+7tJBXwf6M8xGKMNNmyxxkJ2+jVcCbrhKGzfTtMbUupYwxrJ
 mY8Dxy4uUJuDFGH0WN2RJ8iL12iVVWmN7A9eOSbhgxwI6KtrZVia92X
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5a26d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r31ynADB2PxU4kuVuc4A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX/bCaNPiZu7V0
 yskNPHzv1RS0xlkx8saAbdZQnuAPNgPRTjvS6NxFFm6JI9xIsyDdazszPYrvdSp60HvEXGNpPiB
 14AETV+BNTbfGOhVwvxcQnfQOlkApZBrTXrY9YQUi5K/uGN9DQw9riLbSaqpEDGDffXXxVf9/kT
 9DM4pn97UASZpkv8JvvHtzLN34IiAGRABRs25nrZtsC1nWFRsisFQ3yJhdgtpM79Q3XbMDQitL0
 7s4vmw/bbemEvdUuxPElrEFSiw3sy35wR2tvygv3l5tvzH8rBJG8TaqDo15j0mb4BOzfMadLtEv
 cYKcQTegTqgeQbSefxEMzL3jVBd9GaHq5LPK6IMTlz57nbRu7OqkelLgkzYJ87ZZLaveFNntszY
 UvMYiwF2hsGlJYt0XEoKoMkgbew2saBPivn+auz3OWaDOJukHc8PCNwrA+Ixrhj2xMyufxfsSSF
 HnRShRQHX9S2z8YBIXQ==
X-Proofpoint-ORIG-GUID: zCxiO1l-sKwnv1d0bCp0RtAAOSVL9eQG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX4646nzMxrIg3
 U/chbgFWjAlDjfrTTwStSLkhoMmnFjF0Sx08ejMCrYSJWml6AWR2VqT+TocawLyTZlQiD0Zi80D
 8wNyvGhvpCFzIIwyI83ApvQ0vFBhsVg=
X-Proofpoint-GUID: zCxiO1l-sKwnv1d0bCp0RtAAOSVL9eQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

Commit 77258d409ce4 ("ath10k: enable pci soc powersaving")
introduced MMIO wake-up handling through ath10k_pci_wake().

The current code only logs an error when the target cannot be
woken for an MMIO access:

  failed to wake target for read32 at 0x00036044: -110
  failed to wake target for write32 of 0xfffff81f at 0x00034834: -110

When the target or PCIe link stops responding, an MMIO wake-up
failure may be the earliest indication that the device is no
longer accessible. Since it does not trigger recovery, recovery
may be delayed until another path requests it.

Trigger recovery immediately on MMIO wake-up failures while the
device is running. Also abort PCIe wake, BMI and target-
initialization waits once the device enters ATH10K_STATE_WEDGED,
because no further hardware progress is possible.

This triggers recovery earlier and avoids unnecessary timeout
delays that may lead to suspend watchdog timeouts.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: 77258d409ce4 ("ath10k: enable pci soc powersaving")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..0c671630cfc9 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -478,6 +478,10 @@ static int ath10k_pci_wake_wait(struct ath10k *ar)
 			return 0;
 		}
 
+		/* The device cannot wake once it is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			return -ESHUTDOWN;
+
 		udelay(curr_delay);
 		tot_delay += curr_delay;
 
@@ -642,6 +646,16 @@ static void ath10k_bus_pci_write32(struct ath10k *ar, u32 offset, u32 value)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for write32 of 0x%08x at 0x%08x: %d\n",
 			    value, offset, ret);
+		/*
+		 * wake_wait timed out; the device is unresponsive at the
+		 * MMIO level. write32 returns void so the write is
+		 * silently dropped -- kick recovery here instead of
+		 * letting an upper WMI wait notice it seconds later.
+		 * Guards confine this to runtime; cmpxchg dedups.
+		 */
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return;
 	}
 
@@ -665,6 +679,9 @@ static u32 ath10k_bus_pci_read32(struct ath10k *ar, u32 offset)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for read32 at 0x%08x: %d\n",
 			    offset, ret);
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return 0xffffffff;
 	}
 
@@ -2248,6 +2265,12 @@ static int ath10k_pci_bmi_wait(struct ath10k *ar,
 			goto out;
 		}
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED) {
+			ret = -ESHUTDOWN;
+			goto out;
+		}
+
 		schedule();
 	}
 
@@ -3308,6 +3331,10 @@ int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 		if (val & FW_IND_INITIALIZED)
 			break;
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			break;
+
 		if (ar_pci->oper_irq_mode == ATH10K_PCI_IRQ_INTX)
 			/* Fix potential race by repeating CORE_BASE writes */
 			ath10k_pci_enable_intx_irq(ar);

-- 
2.34.1

