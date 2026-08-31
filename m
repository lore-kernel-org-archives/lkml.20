Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6893D9543
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164309; cv=none; b=jUrtWtEyX5XnYc4TZqCFfwXkCiuEU8JRATF6hX74dJE0fT8Khn48sk/pOPa2nWBmtILAOzctCPkCqp4kZ5Szrn6Eb1hhPlVuoC3sYy1o4bKyPLrCHpLKG49vorRUQfNJyFjQ+BqCkHCyuRdFE+j9DhaVlhun0WIAkSLJP9DzKPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164309; c=relaxed/simple;
	bh=ep+LQunqvDuFKkYJshXFJLSFrgdqylN6OzBHcFg+RUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJ0o4FLhUzUuwHdiwfeHF820Z7qxcOVPwxVxYo7CRhKa5SHqn35ipamJsqbpzQaMXuEBugzHLWWU315UX5qFVX/LTKyyN3wjJ1pr0Uf92fqnoXroGEDAx1xLQa4JdU1DbIHYaKJps1dTrkXIHVfwthE9irH+hpn1YeXyM+hD+II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iK4jtk5v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XyikXtu4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iK4jtk5v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XyikXtu4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xTwd3018719
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=; b=iK4jtk5v7X0+qTL4
	CCYTmROkm3EQdK6xNoZRZJ1NQTbGQDkCRJhbgbdxtfPpXw82hs2AR2n03vfN6vRF
	F2lbxfb2ephDV1+TbHp1+skoFdkRenINL/Zj4ntnXvyM9T0m9x0vpMmNxGj4pMFV
	igyqjdCcKgtbLC/cjO93Cpd+NvkqevYF4UV7LZYJopW2+gVbCYEtHpHqre/ZInaV
	AopZjgHFndtk1GRcr/kArobxZu49hJWMZIDVma4C9xup/ANq7eSFqIEv+KN0u+iN
	JtYK+fl/T6prasjQZZqzvp9UHvSOY0YAesZAvTD8XrSMnQzPwc0yghHbksG8NbyV
	fKu0SQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2ncpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:18:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5fc4c7e9so280555285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164307; x=1788769107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=;
        b=XyikXtu40QpoDo45BimQdE9IirCEOjMjL/YXFjGkbGuR6sU7nlrb8Xnm19tj7n7cnK
         w6KV75QzbAswuJ7Ol7fdbdG4cAxDDIIqOYEHCpZaR3bXXmRsSHAl+I0XjbT4L8HvpNu/
         fmcbAjHIjWxSWVsdRMr0zV5LOPfvoOc/H4knC8XCMhtTafit1T2Z2tSJNcpcx4sKAj73
         BKugzlUzXva3gaX431BX/euRMKeNANJcgrNACogy3HDayBPx2E4zPiTg1aNjZzcoFy8M
         L1RnuAalJOtzN/Km3Il58JZhwwR4eroH0hXO/RPuimC8NN7lGQ0uBFGiApQAZrlstn3x
         tEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164307; x=1788769107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVWiYFGWOQh6WJuSIdom7McLyivYPD7fTLAp4LYIpOU=;
        b=S9OhGLVIILeDjZdv6QI3MSWFL2O759eT7zV2sdqkgHCelVRQWnzqJAJT5H1kSQVz01
         50PR0QdWsHe1ajVv3+biZokc9B7XZsAtCxsyYUnCNaKMkqkq0VL1HfCXi8WQ7HlDTYfi
         STCZAauf1VIL+Hooa8ITPsXOHC9wJah/o63gPZl3MNqA+tWXB9H84UJXAQHdVFmJWUNm
         iambjK18jcldbnGeWdw/8XhVPo3pK0SW2hhQPLpEEm/nlvdERctJsbgKXubKhclQjGE4
         7ma+tEvWTTXAmWb/63A1o3bf5XucB4tSvQNmppCplQ3zi8dFSIgGicuAa1QFnng6wsI1
         9ArA==
X-Forwarded-Encrypted: i=1; AHgh+RrQFEdE6pMeivb6myduwiPDHveLtWZu9R45NbSAdvFngmMREGkyjv6nlv3G8KLMBDydcSXtBL1b+vuWKz8=@vger.kernel.org
X-Gm-Message-State: AFuF++nx3iVF2KviTQQdwGOsxN5Ry4EtjaZDicZqwVAeqaqMOuoArOo5
	XGZSnGuy6qSNtueMDBjUUiWilEQxFMUMjsm9RDAulHgZAYLjYAp3N2UJQ0XJ/3sdhSZRT1fZZT6
	BIE8qFWpxPfmy4fdtTVIrrlwXXj6s+u9us4JMbtJnaBWFTz1u841R6A8zKMJL/qKCobs=
X-Gm-Gg: AR+sD12fB6fUvvDLJik4n7KzawXczAXrWJ+mjJcKt/kdF1VVPfv192uI0FZ7gYBS6Wf
	b3ps9wg3dowcWfYttIblxBEdin2UaSG8m7oVEWvgu36jI+jacbZyspSflNqcakAWPWwxchAExhN
	ijsFjNnUXut/NHVB9ESCDKNlIg7b3YKDNBcfWbdi2B9N7/TzcOqEXwM6ZoOvhqkUkk7YEZLephh
	+dX58FoDW+ELuSwkO0rhT8/WpZ9DMx/P0h3+Vtb4050Lt+d+BZ4n5FLTGKOdqOhUEQEgYyTR0q+
	ZUpVl86HS1c1yxG3eXgAln0x8yYq4J8Migufx6gaqKBiB5RPo612oaGSM4Sgc/OjqXFKHzBy0mJ
	NXrNSTq/zkOgSBOKNiBQF3OXkdGBp/9v+w4aHJ6MxeaEw2P9YKXKlapvIUdjtMDs=
X-Received: by 2002:a05:620a:46aa:b0:939:d06:e746 with SMTP id af79cd13be357-939138ae1e2mr2716262885a.26.1788164306551;
        Mon, 31 Aug 2026 01:18:26 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:939:d06:e746 with SMTP id af79cd13be357-939138ae1e2mr2716259685a.26.1788164306126;
        Mon, 31 Aug 2026 01:18:26 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:18:25 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:27 +0800
Subject: [PATCH v6 10/29] drm/msm/dp: no need to update tu calculation for
 mst
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-10-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=1019;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=5ZzC8/kHjYiASM/nz9B0eCAoNtT2xRTSonPMA7SeVao=;
 b=RBUgxkcHswp787SMBPL5yQ6RVd5haNBgPRB9t0rJDVtETIjrkFFgqa573EgUZFXPV82HMRE08
 ToGv8xwoUtaDPwEfmbEro9BFGob4VJenOoNZF9S1krDWHYsW3N/c50d
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: buwpUaBJj8BtFj1dYcFt4u8_hV4GrRYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX8T+roVH8UXnv
 pN5c3iXrPmrjq57xac33cBWdcklhiJvDquu/Qu29jBcPAB2R90I7aEF4C/jU415w34lUb08ZfwO
 p1OCMczWtpjGEidS90xYAwDt/ZZzFvkMkW009JR6oqrU2dLsjIJlLkiYtdGQMtD+NY3EK1KXCrZ
 0J/J+4r71MOM84liYp+sdDbPZj/6eggq6lpen8Kwl5LWOQ1zu82+rTrvu/tDP4csyVCA/cMABb6
 /XyfgIKHqStrUagd9QCLFRTVhA96hxvoS3k+wJze2H79zCFCNNxPFk7MiACdjlunJ8+yZFj5IwB
 +lstT2FNodS/7Vx1jN/zEyY2l5aIyYyC65yCEkA58sEuAf4NAqg6KKv+YhUOiDkiguGiMhxYI6a
 SQwa8uL1Nk1N50J9+XIb6P+/qVrbBDZzleLatDzvsNcuwf+COAEfCaT2OkC6nAtX37wlQUgovcx
 U9vZcirqHs8LC9i1nzQ==
X-Proofpoint-GUID: buwpUaBJj8BtFj1dYcFt4u8_hV4GrRYM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfXzPGS0Iow7ns5
 DVVyhubmvghIJDF9JTBmyP+Z2ykcx/EUGaxT75gOy/VDUz0tQK0dOsGTug9GT71hrc7y8qzw5h+
 QFkOZSQy+CKuQ1Tc/hxuSiMQAguMYMg=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a9538d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Hn_uEZNTG89lqFF_qI8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP stream is transmitted in transfer units only for SST
case, there is no need to calculate and program TU parameters
for MST case. Skip the TU programming for MST cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index cd6ae0d5372c..77506e840883 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2703,7 +2703,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_panel_clear_dsc_dto(panel);
 
-	msm_dp_ctrl_setup_tr_unit(ctrl, panel);
+	if (!ctrl->mst_active)
+		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
 
 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 

-- 
2.43.0

