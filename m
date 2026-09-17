Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62077471436
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628914; cv=none; b=uinK2pzD/bI0510GcY8d78lgrLcflXMJTh3hbqObFxSXrJ1HWHge6TNqcDjtQ2JzLbfOx2ixQWW6JMnzuJETaAmaTW7HTNdBHj5MGM7bBzn+sbvEN7ZJW3YM3ZMpoa3VcevThbX67qGp+BKO8O3I9YS/TgY72nguoTk4n/PfegI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628914; c=relaxed/simple;
	bh=bQpyWWf0ixjdyQaCnGf5ZG1l5eO2Zpqv28M7Mk0RN38=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZchCq3Vodi5SGCiUREoqlZ0LjnpSDjjtB3oNypNo+1rS3G0F+hUbx+cKXZMznTVgEvqav+zA3dhAlga3YaFKfJaoWCageqgUmVFf3hYU04OjgZgslUJiRHOAqXjNH3gA1mIIr1GOgU9oADXPPLRh8lJPysH6eF/llFuhdugAKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkQOHSg/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h2ejTdgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkQOHSg/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h2ejTdgi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60sD91375590
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ugnBwGxUNdaet2N+HXZfUK
	GYcaM40W+Na3+4iM6a2ds=; b=EkQOHSg/oi2bDhXKDpdG1bkrW6b/E8TeywLjIT
	20bieRJ4CUSwHXHoX1E34qVF4c9KbvLfmXnQeq25KwVHI8I3wsiMxS01t8ZbX7fX
	y6A18bPRekVvfP9dxzP/R5EbkNwDt6gkFJCCrB6Eri2zroQk0qzbBYzaJ7+mITTC
	ANzUHqCiT41VIzmqjdu/joW7kCdl6TfTJx5xqaDWC71+uHL5KPZ6HlG0mlrGGma5
	GzetvzaeHOAA8DHEd6EXQWrjAySwPE+LIVcXaujy4AvXd9yg0vMnMCUCVQ2ybXGr
	sa8Ssb/nueo1xYjq9FCCgWMprE2hGKvFBLCMvXgsKHqautlA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6atw3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:08:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso447116a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789628910; x=1790233710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ugnBwGxUNdaet2N+HXZfUKGYcaM40W+Na3+4iM6a2ds=;
        b=h2ejTdgi+bG1Wc2oFFYyGZmRHAQPsTLgJZCn2HiSw+nBFxqfrQKpIF5AbvgCRkkoNh
         n48WrZG9Z79JzEqZCqD/pvY+MIENFvQRHxVPdLWD8CHPp+BZld9mE9dNreUmdvffvPKU
         zjKMp/Ue/ZiZuDPm/znaPMLxmY6IWjKQ0b+NSttMrRmzu0efHSGct5Zg9MVMwv9D7I+i
         ZU7tMf6lzHJomgtAgtJ8iee4BeXC03hFL1ZBdQaYKHWfOaO+R2CJbjkMTNTYeQZtHEaC
         sWcgOKWNv8CFUFOEnhfaUCVunhIcQrg3y/UUnwRjPuL//gz9yzkna2vZWNlTpKi8okx4
         Au6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628910; x=1790233710;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ugnBwGxUNdaet2N+HXZfUKGYcaM40W+Na3+4iM6a2ds=;
        b=KPMvoE5vRjIeg6cHf3jBm5kKWLotKzTKSMgf7QjIx1Kz+Cv5vWxXL+JYO0GgeyKULC
         6bdD+kLN4mZU++jXiwon0TGW5y8b7eOxnBhS3YVbrn/4I1i1K1BcUt5gClVWCckY1Jsr
         SayCClP2GkU3Fc7xgDTg+eWC5ahzSszPDB6R6d03Eyx2pepv1gYgji33Yzf9cvnTu5ro
         srCFoSam0aUIM04GRAoUa6c1IKQzHfPiFTAQqxNP7yWoaUo6KGYawLQgcBusPyiBa9p3
         lhmUbF9q5eKjM0jI91j+3hCDpLj5Kz8Z3YtPK6Di5jrnJ7VN51f9UB5UDy7DpXAgxO9x
         eiVg==
X-Forwarded-Encrypted: i=1; AKwUvBxXYJhGnlOnUvwgR0lR030lSWd2SX09JrYMlgKrdCgmx+cE4/lG9vwKzgb/EFHK2RpXhh1v9It5YBjKIn0=@vger.kernel.org
X-Gm-Message-State: AFuF++l9QDPChf4GTMNpBQiiL4QprVEIXBv2Fh/9KVeI7JvWw5UEY2p6
	TdStnwAE/osyFHzcjC+tAkq+ulRVM3XxYPWzP8J+T42b/tRYNOI/v2REshndeDYz91QRpQvppUf
	gxzhlK+/gZGfNJhhDXyGEsywfpu6YJoOEd4IpjP07DiGk6mejjLFK4K73tQQKV3jlySo=
X-Gm-Gg: AYBFou3xp+eIdkrQdkBtVJNYBYwNl2rrfMMzHvkLzzWQg4OtnQX/jbbKlnys/Rza6/p
	WiL0cFowE9wwyVKeaQ+G0RJAmmh8uvdNU4uC/PW/5oCnGwpH21ckNXOtW1rSiA00jIrmrUfeLw6
	dICxgNyx6Exo+T8fFoVe/+jNfgz80LYZ17L1YEPwrh8ZrJ83+zxHx9D//tDPhwz+v/qLnNC9Pmk
	zTMjzs1DzMG9dvdmnLivZvkQxunVJKmwa1BpwhCuYmww6QYbftGz8+qf4jL04Wq29Rtg0D4O82w
	OeG6XDjdtnSLOjTiQhkP/hifMXAO5sy6AgqUo4G+/qOp9b3QmRMtX108ARGm2mX4At3353vEcnq
	Rh863igFZmMcML611xrKJlEHfHmmKdv+qSLw=
X-Received: by 2002:a05:6300:6698:b0:3d3:adbf:7779 with SMTP id adf61e73a8af0-3dd5f716752mr14365856637.21.1789628909970;
        Thu, 17 Sep 2026 00:08:29 -0700 (PDT)
X-Received: by 2002:a05:6300:6698:b0:3d3:adbf:7779 with SMTP id adf61e73a8af0-3dd5f716752mr14365766637.21.1789628909429;
        Thu, 17 Sep 2026 00:08:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm13280835eec.15.2026.09.17.00.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:08:27 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/6] bus: mhi: host: mhi_phc: Add support for PHC over
 MHI
Date: Thu, 17 Sep 2026 12:38:01 +0530
Message-Id: <20260917-tsc_timesync-v3-0-6826d5d2d527@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANGRq2oC/3WMwQ6CMBAFf4Xs2ZLSIqWc/A9DDNZWNpFWu0gkp
 P9u5e7lJfOSmQ3IRrQEXbFBtAsSBp9BHgow4+DvluEtMwguGl5XFZvJXGacLK3eMNcqNXCpa6k
 lZOUZrcPPnjv3mUekOcR1ry/i9/4JLYJx1jhxdEroVl3lKRCVr/fwMGGayjzQp5S+2N1ZDK8AA
 AA=
X-Change-ID: 20260411-tsc_timesync-f877a0394393
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>,
        Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789628904; l=3787;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=bQpyWWf0ixjdyQaCnGf5ZG1l5eO2Zpqv28M7Mk0RN38=;
 b=o6BXg5Eg9W/++7VUIM0anu11IwwwEykHm6bnIUSsnJCQZuk+k9be9VtOxAXB7Jju2eEav+nu4
 66Iy8+Lz9uHDE2cxbV3qnMn20F1Uahp78Vv8DXVvZ7M+9JhsCADU5jQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 7tt-H5ggXSqHzGGdD7VJ2zGfOztemTJd
X-Proofpoint-ORIG-GUID: 7tt-H5ggXSqHzGGdD7VJ2zGfOztemTJd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfXweWsS6pCUZgL
 pwkRQ1SiRyZh00EC5VyeAYDUsKtpoNyL/6L+HgkgRTL5M9pRWpbQ4J3m67lP6AK4fgRdFhzCzZ7
 RGdFOPKuUlC+xjvrqwOOV7mxCL7lsHA8rFBT9+LOkhAo/RvAC10dPHdsxe+/UWMEcpEldPxZN6I
 rgYvKZyot43TDLC/+Uu9MipwJowvEvHZEOrQW5UE1Zhoc2iWdwU/2af/wT3uM7wmY/t98l45ow1
 kKu1sEzImb2tWXZCzjtN2qjbDeztMYkN2gFbuA519cwl4+7qjg8hLjqXbtcK4p6ZIW+QM6ItRTu
 myC8riROfC+LMoSZ946el0Y+RP7cL1SjLsw/bPeYb7hvfvo+BS5ECbIXUho79ELxfR1vaBdLYMM
 j2oWuQ+0pLZFOAxFglKPLuq4m3kxfLI+rwUBEsLhoLsf3H+gDFIyu+UPFTnM4NDNsqvIcesdTs9
 hROVgbIYBh7lpD5KdBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA5NCBTYWx0ZWRfXylHdlqcOwwVD
 MafmymHrdsumb0KyxQB5voULT9KKPjtY6uo4lUdT7DkY/0tCeH/tb6v23wI5W6ri69ZUvfFic7r
 4lamI/mhGCCqvw9PIzldrHooa9x3zoA=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab91ef cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=UUeChs24tHZU6zr2FsUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170094

This series adds support for exposing the device-side timestamp provided
by the MHI TSC Timesync capability as a PTP Hardware Clock (PHC).
 
The series introduces an MHI PHC driver that registers a PTP clock and
uses the TSC Timesync capability to retrieve device timestamps. These
timestamps are exposed through the Linux PTP framework, enabling host
and device clock correlation using standard userspace PTP interfaces.
 
To support efficient timestamp retrieval, the series also adds generic
64-bit MHI register access support and capability discovery APIs used by
the PHC driver.

The following diagram illustrates the architecture and data flow:

 +---------------+  +----------------------+  +----------------+
 | Userspace App |  | Kernel PTP framework |  | MHI PHC Driver |
 +---------------+  +----------------------+  +----------------+
                                                       |
                                                       v
                                            +--------------------+
                                            |  Endpoint Device   |
                                            | (Timestamp source) |
                                            +--------------------+

- User space applications use the standard Linux PTP interface.
- The PTP subsystem routes IOCTLs to the MHI PHC driver.
- The PHC driver communicates with the MHI device to get the time data.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Use mutex instead of spinlock & couple of nits (Jie).
- Move all tsc timesync to mhi_phc.c (Mani). Moved the init part also as
  it is easy to control from controller without mhi core dependency.
- Couple of nits & de-register ptp driver in case of syserror and enable
  back in mission mode (Mani)
- use PTP_SYS_OFFSET_EXTENDED to read multiple samples and also support
multiple clock ids by using ptp_read_system_prets & ptp_read_system_postts (Vadim Fedorenko)

- Link to v2: https://lore.kernel.org/r/20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com

Changes in V2:
- Rebases to the latest code.
- Patch 1 (bus: mhi: host: Add support to read MHI capabilities) which
is dependent change was brought it here as the series which this patch
is part need to re-designed and will take time https://lore.kernel.org/all/CAFEp6-0ik4B20cRyid9w0f+UgibGciPof9HCWTJ=uBOPvHG35Q@mail.gmail.com/.
- Link to v1: https://lore.kernel.org/all/20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com/

---
Krishna Chaitanya Chundru (5):
      bus: mhi: host: mhi_phc: Add support for PHC over MHI
      bus: mhi: host: Add support for 64bit register reads and writes
      bus: mhi: pci_generic: Add support for 64 bit register read & write
      bus: mhi: host: Export mhi_read_reg
      bus: mhi: host: mhi_phc: Update the Time sync logic to read 64 bit register value

Vivek Pernamitta (1):
      bus: mhi: host: Add support to read MHI capabilities

 drivers/bus/mhi/common.h           |  15 ++++
 drivers/bus/mhi/host/Kconfig       |   9 +++
 drivers/bus/mhi/host/Makefile      |   2 +
 drivers/bus/mhi/host/init.c        |  65 +++++++++++++++
 drivers/bus/mhi/host/internal.h    |  35 ++++++++
 drivers/bus/mhi/host/main.c        |  14 ++++
 drivers/bus/mhi/host/mhi_phc.c     | 161 +++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/mhi_phc.h     |  21 +++++
 drivers/bus/mhi/host/pci_generic.c |  29 +++++++
 include/linux/mhi.h                |  11 +++
 10 files changed, 362 insertions(+)
---
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
change-id: 20260411-tsc_timesync-f877a0394393

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

