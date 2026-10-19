Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF768495510
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417274; cv=none; b=T30clq/l4Anyp9vgrUmGlQns77FnN6UPG/Amo9+e4G16qUhDHQhrHOleoCOU53ZKCXhix3UIxSKhfrpvjqjmDJzZtemrxHHsyn7UPFDTx5TDJkh3bRCNs1Kpr45FUihMwEJbZ2dZbve74o5ZwV/sDa8CVmqGsCfxJ5TDINxfZcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417274; c=relaxed/simple;
	bh=+BO2fmnt6Zal9aU/jBBr651gxIJtMgQpjVpotxgTwJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u6orJe5P5A2HsQmVZUujUsUCpzs03ZKyXqMufs0ModaPHZ/clkfD0VG7xZrAmPwREb7n8sPi66uKhwtV841bPV/MOyPsgJumjS9h67pWQttheYK1GGEnikOwB4mHbWFSnNSPyiI3JujdUcQES5Mpdnk8z2mvUPzs/Iv8XcMI/Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oz9ywKlo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdSZEukm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oz9ywKlo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdSZEukm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OqeM2234278
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JIsIH+g+At8ckqxE6xPOTK
	qkjwbD/YQT1Oj9C9sZJVM=; b=oz9ywKlox3/Hy3jO+MSH+1cj3CijwlwykxXYd4
	GZvC2emjfUt5WBFb7WEAYtBl9wFSvGBIU8zjO0NhsWmtd6WK2o1RtWwl1Uoh82Xo
	b4zoV2va99Z6+d5vER3FLuQgnV3Tp40gDhEJ3B0KP5+cWoeHmAfdOrgn532vUdPT
	LZU6uzljKM0XD6vSNHffqfOSD0jGcq3iwH4tllUdqfVe8eGNboCjhs0pXzz0zR40
	/98TvsPQ3E1TGM1ZgcoOiEHS81ovLqafbr4Qx8gC1N2juRHrqur7ZmOqsNvQxyaI
	3T4IXyd5MUKDK425E5EC7rD/KrzH5QINhMMnla9xH9Om7sdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x9bt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:41:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so439868785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417271; x=1793022071; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JIsIH+g+At8ckqxE6xPOTKqkjwbD/YQT1Oj9C9sZJVM=;
        b=XdSZEukmrPJT0agyfdXt5+nlZKqGDjSsnM51GsP4lPfUpb23XMSc3D+U5aQqvhGW6E
         N3K1aspIHC4KtpJwWYHnweFH4pGz2nqEJk/dbYspFlz3cp2dsgvu+lqemc+xQ22zVuXg
         q9oztJikReOgcyTKCcJb0EYJjuWtz/QAR76Nxmm4hnu9Albi8E08N4gF8z742lVnkyfr
         s2vhjp49Itmh5htX2nzXT9LrslPXUuvr25aDIbipHCzKgkEGvHRlHjrjjdM7m743rpz/
         DYXemCv6EC2skqRVZaWoux7kAZIAZDvHZlAqn5jdS5bB16u/XXS2OriETndWOc7NBdox
         HJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417271; x=1793022071;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JIsIH+g+At8ckqxE6xPOTKqkjwbD/YQT1Oj9C9sZJVM=;
        b=D9x2SRRWCI2Hb8rTB33cktpeoBtOPa7PCemj9iJdjAzDUkeFW8lhys6H2vEcUOxGy2
         oW2kXrEx3OSqDNCQzeIP69Jp2LThog9KiIxZEYwKpDy4n+bLHnX1yN3sduyDpeCPrnxB
         IdTGiJtYkWPgITDYWJBRhYEJy/bPKMVPNLiM5PIKTehvYr2z4lYR0nLLF42qGunnJ0xx
         1uqQKB8jaFYsAfzCDG76+vfFz72JZ2f/ZGj63xfWiwWzN5G3DDZyf7IbBODnoQs7seIj
         BHi25mgbwhfWxxTXoQ4WZF9nLIA7T+UY13rSnngXsSFycd6jB5NL+Hi7z/N58ArKEyNf
         SApw==
X-Forwarded-Encrypted: i=1; AKwUvBzBn0tT/dRxT1CMNKfxy3WdU276dm+x17ovyV3zujGW1Y31iYYM8rkIofFwGU943+BVLUOfQUUBabHxHf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYINHubCgZ05nC+kWarX2kcEo0t/ae2ObhYa+/Lrp0J2ducUuGZd
	0EEp2Zj4gAw//+X7f+e4lZcYTzKHZEAXhtMB8TLUEmFY2FaIWatnXAImEinSqzdAJOj9dwPdFvI
	ujzLX9L/Eg9SCddFBBeU+LrSSYYn4BkVZpX9NG4OmH8u5PpSdfymEVmTNXFHcHp0Q1pU=
X-Gm-Gg: AYBFou02cLMcRuQjCVNlXYlvhtthUNA/H90X3oTB8itPqhQ710PZa0hqgw2wzgzLutw
	OXyofXm95tGWt6vAxS1AxBI+NqEqzPnKqdSEvf2+KsRr1oiXIu66zq79ubxSqufBfbV8WmRJTnh
	ypmTwPEqQEwBPV/AQo7ExzTMmJbTMc3CYHaw3RScIGIA9TcoMtAJwdS3yHXJ6zp+USQ9O6+2ziG
	9cARtu0gaJFmjpgethWvRxIDx4KE4SbQHAlQtKcIT0HePvBuTcrfgFoInNVc4O6w8v1bwkn/cLF
	dQhqJPLWQnmpqhWaNGoYQ72Qq2U/rbvk1g0crmNw4wMrpaklOVDXBN6LgrY/9Nq7+dLh1tJN5rV
	2ELCC0o178d4v8wkCed2cboLc3IIYs6VfN74x6oWfprHX780QVRTCxVLds5DNDxiyr0JlVFeX1n
	IujqoeawsQHKOI
X-Received: by 2002:a05:620a:7083:b0:93e:c12c:f12f with SMTP id af79cd13be357-93f29df9387mr1310689685a.74.1792417270554;
        Mon, 19 Oct 2026 06:41:10 -0700 (PDT)
X-Received: by 2002:a05:620a:7083:b0:93e:c12c:f12f with SMTP id af79cd13be357-93f29df9387mr1310682585a.74.1792417269933;
        Mon, 19 Oct 2026 06:41:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/10] clk: qcom: several fixes for stability on MSM8996/98
 platforms
Date: Mon, 19 Oct 2026 16:40:59 +0300
Message-Id: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsd1moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NL3dziXAtLSwvdtMwK3eSc/OTsYl0zY1NTA1OLpOTEJAMloMaColS
 gLNjQ6FgIv7g0KSs1uQRkklJtLQAQUlMOdgAAAA==
X-Change-ID: 20261019-msm8998-fix-clocks-6355058bcab0
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+BO2fmnt6Zal9aU/jBBr651gxIJtMgQpjVpotxgTwJY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3tJd/TqO3nKhLXa4q4xYfMfvjF8OD+hnJ2u
 ndYqcs12BCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd7QAKCRCLPIo+Aiko
 1YEUCACyZyC09kHN7FKDl6bZ1ufmSOc5N8Z8KKObSXnIP66Z0Sj3bUq6li6L9U+1l8KfM/WvLZ9
 zzrY5UMnwR1ftVZRJl5UBmMeXddc1pWNxhNibhNRfSHvwR7kzkvDcfITaNUYXWFM7UFhu0dQpNU
 iNcu/79sKraZVkrqvqHeaFb9/lUeoxlqy3H2767JSor+iYQ1FoJa6/4C1KxpLiZt7GM/wf8Tt0w
 zFmadcBj3MhXTQ56qTMmLMzl5TCTSzuEI7tjh/h/eIyuTaBjcxvcSWtiPQFG/tbJMpe+EDIcR1K
 k/MRzxGTYsHCKK5NA+PSEUZ9A4/hV+FLrrB5xx44T2FioLOp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: YKxa4CDaC2RD1WhbuzowJWXA5ECHdIH5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfXxi8OFFa0AWe7
 L+q+iQ029DTs9giSNeunmcER58doqNV8T81orzo/PmvXzfBXU/MbxKj/64RkzXlOr683r3dqgHA
 X0VfCz0/bLIOgboZTanBDGbgAEKuQBs=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad61df7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=pGoP7NTG_pKSZ3bbB-YA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: YKxa4CDaC2RD1WhbuzowJWXA5ECHdIH5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX/tfja9HQqGZ7
 men8mcUH5+QKFnftDVxQ5KPXUpsvgjqNZ2ut6adWZ1LFFyVZWH97Zp87ELoe4d21qv0OR4otnY0
 6sdTIkI2qwPyV8ZfK7BLWwW+ZeOvIkHN4COidszI0kI2lCJfaBZqAUyMVpWhh+0PcNyVx0M8uD0
 VxR90S7XaZACUeBAuwdr8HuEI3ZLyFs/PiEeRhWH5AKWcnsoSYqt1YagZGnQrgmivPC6E4tyZo1
 i2nXZEknXX1+5l5v5Jtq8eBLVpC17WSkjg94DpdJUefc/9jm/j+W99QmVoMlr2t6RJUkKrY1rG1
 5g4HPgeNk34s8XRjfFQdjEmd3ne7E6IEBerBL11Yz3RWYcv/gW/Aq9i0l6kTcy4vHYORTPQpRwO
 tsDO6x9RZ3txiA3gVFUBS5XqhhUpGoz9PY0MdGEwKhHTBLM/Pcmjw9VFAajEXmhCTmu8NIcLws1
 QgtztT9BJwYFl6FXDfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190054

The MSM8996/MSM8998/SDM630/SDM660 platforms face several issues with
stability (e.g. setting running at the halved frequency after certain
frequency switches, resetting if run without clk_ignore_unused, failing
to scale GPU clock, etc.). In preparation for scaling core, cluster, CBF
and GPU voltages, fix these issues affecting platform stability.

Compared to other patches in the series the patches for MSM8996-Pro were
lightly tested, as a part of the larger series and only remotely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (10):
      clk: qcom: gcc-msm8998: leave the GPU BIMC source and SNOC DVM clocks on
      clk: qcom: gcc-msm8998: leave the MMSS QM clocks on
      clk: qcom: gpucc-msm8998: set the droop detector bit in the right register
      clk: qcom: clk-rcg2: forward the gfx3d rate request to the parent
      clk: qcom: cpu-8996: move off the ACD leg while the PLL speeds up
      clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk always enabled
      clk: qcom: cbf-msm8996: program the MSM8996 Pro post-divider
      dt-bindings: clock: qcom,msm8996-apcc: add the MSM8996 Pro compatible
      clk: qcom: cpu-8996: program the MSM8996 Pro droop code register
      arm64: dts: qcom: msm8996pro: use the MSM8996 Pro CPU clock compatible

 .../bindings/clock/qcom,msm8996-apcc.yaml          |  7 ++-
 arch/arm64/boot/dts/qcom/msm8996pro.dtsi           |  4 ++
 drivers/clk/qcom/clk-cbf-8996.c                    | 10 ++--
 drivers/clk/qcom/clk-cpu-8996.c                    | 36 ++++++++---
 drivers/clk/qcom/clk-rcg2.c                        | 21 +++----
 drivers/clk/qcom/gcc-msm8998.c                     | 69 ++++------------------
 drivers/clk/qcom/gpucc-msm8998.c                   |  2 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |  2 +-
 8 files changed, 65 insertions(+), 86 deletions(-)
---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261019-msm8998-fix-clocks-6355058bcab0

Best regards,
--  
With best wishes
Dmitry

