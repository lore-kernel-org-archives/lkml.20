Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286484;
	b=icoPlgT7Mcl7Coj+5RNHfAo0ge6tiXmO40G8QpmzUuo8VQnS6Nft//8ZUKDZi0edqTdj
	 XwaXEsJ4W+d+cwvIqJANnyFi3UiSABiDAa5gwUQsNt3bP9h4ZLuah3irkNDtSCtQ73tM/
	 zUjsvo6E7+EKuXfwdvw1+i1ouihxhFbmLeLVyoH1wOn+r1wt6o7JrogSRn0nfRVsEnkIH
	 /9zGdRbPdJa41vjDritNmfYdR+1ebdwRLwNm36egPQ9yfaXGY8ho4YX+FFXeG7NKDn+iR
	 Z97s/TQLiksoBsMDKiYqrdJTRgn7vjVE1zeJ1cOUuJ8dxqtMjbQKq07k4UJzpW6/TrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b0APUxkvTPgI0ANhjuYFxN+VuatDRUzGZ3XDlAXWiZE=;
	b=Y2DnEOb7e7rL07L5QfBQJUYZMYTs53o1xcXHY073BIxKx/6tKVWalviEQsUOJyFCCItV
	 Bvt+8h50LXfOU6KCX+fqS3qtmFQz1YZzfM/ddx4dvZRjdjcvajvTiQoRLS58GEIs2X+5E
	 43tahgNrQgFcDKQPVQJkb5wX1hyNiQYmPCwe6iBkWor8RwNF9RqRAsp1R+YkvxsMjL0dd
	 zVFVgn8Ff9uuQKrzmO/nksHzLEWcSdKDApFRpr5JUY9StN9vuO98QdJnVjsZNIhqeJFw9
	 LCsb4fsI+lGrJcMBPjC1eCk9h4Puzwl0pdg3rXCRYHFEASLZ6t29O0cIM8ULV9Rp0ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FoEFLwST;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kl2mBaEm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76260606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76260606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FoEFLwST;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kl2mBaEm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AEQ21207811
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0APUxkvTPgI0ANhjuYFxN+VuatDRUzGZ3XDlAXWiZE=; b=FoEFLwSTGj54VfGz
	xJMwMhTumAgiVj2HcJJRXvLB8+sFSIiMsy0B2ovn/WTPBVO1l6YetS46Z2GFCb5J
	XRHQ8AEB472rB7LbMQRhifMVnoQtAK6JcRYAm05bduusR17p41gWEPP1EUcFeSk+
	PHYpHqW1xyXH6caV+5jlwFqDFlcbDhyO+lGqDYJUIJZLNeIWIPnZpn8wxFlPrAQy
	U2leU5R2K7QfVPtAq7xr9a6tZYP3hjVNEX4x7dXuDG8NP/glZYG6Z50RybskPjBh
	aNb5qA9KKZIxMBQMBqP5sDFWTVX0YJmgWfcuPFM0QcUSjTWoyYzh7l3ztmuVDLKv
	JxDCqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhf5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:54:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso425740385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286482; x=1794891282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0APUxkvTPgI0ANhjuYFxN+VuatDRUzGZ3XDlAXWiZE=;
        b=Kl2mBaEm5NL7sNTpEe0uDw2tgIhmq8rD9DynCgSmrYx5qOAjefwjSjcTBFl9A1tJwd
         Owe8Ub+B//GAH2wHbib5/nDKhlp6IHaUD7yHpEDSaXag+8vBi2H7axC9EM6TT8IT9cF6
         5d25y96l5MRhwA9BFUoeD79YtpcEeStzGCY1sNfAb3E4vvK3bbo9yHsZoPTJ2U30nx/G
         htYDfYo+jg8JpM8l0yp1Vmb1EiqWoRRu9QiN5tmk4EJnWHg8To02qQtTXVEOefA2/B+m
         1D0Eyh+RFOrEf4LBrWer6VNTy0Wk59W4R1/m6/03qZ2jZhXhhhAHIpZa4IiKBak+W58A
         TQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286482; x=1794891282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0APUxkvTPgI0ANhjuYFxN+VuatDRUzGZ3XDlAXWiZE=;
        b=VOUbMq/LcThgoBVZqPSxkQqcihidA+64snM0U3XSn0H8GCt+5T1dVnTLwgsN3x7ZHN
         J1YHwJPqtJC0ibgq/11ITUjZBcRERwGwFjw0gDiletznDIUj4ApUOZ81ltFxeYKa3qLq
         XybE6g9olrUsqjmbicEmhfzdEsmjK+kG+MNdbb8Mn/qP2wZQ7if2FFVWm+FwqfkXTSq/
         5wEVt9sX2J2fy+ssDfV9MtkJc8GHP2TmviNSm9crSyW190NpzWS9sU4s4nvto8hdnaMs
         e7FZzApUjbEGkhgEm5ta626hYNOnX2A4RAdjsQC5kYMU8PRFzzL4+tDkFxnGLdDXD6gp
         DyJQ==
X-Forwarded-Encrypted: i=1; AL+hErGtN2LWfRJuOXOALYrtpeJNzvUsotfvJ2HgABoaW6WNL4yGz0glNkZf/iWhq5vL8Na4yVMgvbfMxB/USuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2jRB4wwZQtzebuHmFC4AmvitZpo9ZU3+j1YM9GVU6MnQFCuai
	MjHHTPJNePcyohSrdeGUDMLAQVSvX/c2ioPc9DjGOFYal+VUOSTsFLTOoC0mURmoTezURVBBJSr
	+gd3Od1mc4w5VTLDM97uoZ8btXg4A1pCkIAO1TGlwumo0izmQuYf6WHywzh+hNAxOVuQ=
X-Gm-Gg: AYBFou2Xz2Wt2NYVUjqaNBMTsCFxbj8NV3wsE27Uq65jtSXloNroFqLOFiQa12pQlJY
	JqXl26kxYs5O768rjnUtJibMLmlYYdu1OA65qVXVJG74Qk4qWkOBLmBFsXO4IbAE18MsqHx41Ok
	YLbn+aJy0As2or+vBHg6k/o+XyLXq+qyND9S8Ie6ptX20MZP6EYzmr8KlKJXAt6B196gtbEiihO
	QqRiqO0oZJwpkAz/flHWmas5OySF5RH97dUjzRp5ZRC0zChH68rhY5GnNq/CJ8EZBoqjTZobYH1
	BiXB9VSyBlc7mMmTwI5To4Acn0BRwsCiYTjmHzOoq0lszKEWAj9hSy9viySRBZjQozRICexZPd7
	GaclFk7hBzW+x9dVNbFtHNm3zQIrdPWxp+l5kw355+MlMlIWuNqvnxWzBmraJTkonGgP4UyI3xi
	AG3kmOrcbfaOJNyWusfT3N3Poof4OSYbZovMzB
X-Received: by 2002:a05:620a:4005:b0:93c:2c0e:7ac with SMTP id af79cd13be357-9479f31225amr241386185a.53.1794286481702;
        Mon, 09 Nov 2026 20:54:41 -0800 (PST)
X-Received: by 2002:a05:620a:4005:b0:93c:2c0e:7ac with SMTP id af79cd13be357-9479f31225amr241384485a.53.1794286481200;
        Mon, 09 Nov 2026 20:54:41 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:54:40 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:22 +0800
Subject: [PATCH v8 01/29] drm/msm/dp: skip sink requests while the mainlink
 clocks are off
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
Message-Id: <20261110-msm-dp-mst-v8-1-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=3077;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=hT9291PUkSkajfmAeKZ+I+nNpFsKsuD4le8SAcshPD8=;
 b=DRb/t45pYDIi5C9EkFbmqMtY2Eu8B3Rc/4wjmSbEHORPyc3xoudi1H3qM3F8wKSVKjqBpvg6+
 F1ohlqUSHVPBdTlPy9dSCviDLeH9Go26kJsvQkKKEa3Nuhdr5TwbavG
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 9F_Eozu4DFKGZ3yJNJM3YPrJARJ9CCn3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXwQGeRjcB0tGS
 /n6J9mnkVfg9Lap/ZJjsyYFjeiLCpCpvv9JxZta7h70ts83ERWeOpbvYwmkd5gOD2jBlTAtuKlC
 1PRL55UhB8b3GI2kdA6x2/56qRDa0FA=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2a392 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gFHGZmHKE-3D3zYqEJ4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 9F_Eozu4DFKGZ3yJNJM3YPrJARJ9CCn3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXwcTrlLs3cLO0
 yWMDCMFrcVJGmkiSEr23t96z+nY9rQbPUNQEiECinV+3iR1qSzqPHUMykVk9bdEeUieatcgU+uH
 ZhL8GTjnAcj7FVpqttM6IAvGEDVzpvEfIsYDEMgqlEvm7QlrgrA/deAm1+REIIdFtqn+HsVV9Or
 /4qk/YE0PMkeWXXo3JR+VX84XC6wuimj4pOGIm/zKkbX+Yi0G5uCrcbrHeCervp6moP4lddX3lZ
 MBsb8Uelen0TSb3pqIXAzLE3hzSCMnjIHs4csZzBJtdLVxhhIxTu25JSY5iOi/N3ztSGOZgV8Xy
 FhyJFQnBJSM4ztuB7X2HS95U1NuCI5iz+rPU7t9C0a+JjFkHnUNTm6Wu637BSrly8tJbAMKjRIC
 nRTaDYVWpHVDwjs+55XYLEFp7bgrpcigm8HVyT6cgyYjR3BHyyobceLmGwMR1bQ0ik7IBDiOQvN
 HiSurgsDNbdzV1V5+UA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

msm_dp_ctrl_handle_sink_request() programs REG_DP_STATE_CTRL from all
three of its branches:

  DP_TEST_LINK_PHY_TEST_PATTERN -> msm_dp_ctrl_process_phy_test_request()
                                   -> msm_dp_ctrl_off_link()
  DP_LINK_STATUS_UPDATED        -> msm_dp_ctrl_link_maintenance()
                                   -> msm_dp_ctrl_push_idle()
  DP_TEST_LINK_TRAINING         -> msm_dp_ctrl_link_maintenance()
                                   -> msm_dp_ctrl_push_idle()

That register lives in the mainlink clock domain, and nothing on the
IRQ_HPD path guarantees those clocks are running. Disabling the
boot-time mode for the first modeset from userspace turns the link
clocks off. The sink answers the link going down with an IRQ_HPD
carrying DP_LINK_STATUS_UPDATED (DPCD 0x204 = 0x80), and handling it
walks straight into a write to an unclocked register block:

  [    4.572532] [drm:msm_dp_ctrl_off_link] disable
  [    4.573756] [drm:msm_dp_ctrl_link_clk_disable] disabled link clocks
  [    4.823194] [drm:msm_dp_link_process_request] sink request=0x80
  [    4.823199] [drm:msm_dp_bridge_hpd_notify] 128

The board hung on 3 of 3 boots with a 5120x2160 SST sink attached over
USB-C. On the hung boot captured with drm.debug=0x100 the printk ring
ends at that last line, the drm_dbg_dp() immediately before
msm_dp_ctrl_handle_sink_request(). In the RAM dumps CPU0 is still
running pmic_glink_altmode_worker, holding the bridge chain mutex taken
by drm_bridge_connector_hpd_notify(), and ctrl->link_clks_on is false.

Bail out when the mainlink clocks are off. All three branches need them
running to do anything useful, so gating the function entry costs
nothing: the first one resets the controller, which its own comment
notes "will need DP link related clocks to be running", and the other
two retrain the link.

Everything else reachable from the IRQ_HPD path - the MST ESI handling,
msm_dp_display_process_hpd_high() and the video pattern test response -
only talks to the sink over AUX and keeps working as before.

Reported-by: Joonhoe Kim <26rote@gmail.com>
Closes: https://lore.kernel.org/all/20261108011501.4466-1-26rote@gmail.com/
Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index abd3dcdad03c..32d4d5743eb3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2321,6 +2321,12 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
 	}
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->link_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "link clocks off, skipping sink request\n");
+		return;
+	}
+
 	sink_request = ctrl->link->sink_request;
 
 	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {

-- 
2.43.0

