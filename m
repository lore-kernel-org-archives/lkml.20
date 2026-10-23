Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762808;
	b=IMWEqVfinmEZTT4PwEn+TIkSkS/4KjFPW8TtNy3Kve4Gr2cSsXW3JxgTiCF28Ab9pVK3
	 zo4Mdvg/lMabc2bJPoqhHNMiCFTtRMSfppsbdtYzsqVpd3xdGFK9OSiMd8k4p6xmlBZup
	 PiOItUOvDPe13PW508sNq+3jsGwmo7/nQR9k0o92ubyELf6pkp8dpIYsYWaODdqzu6Hiq
	 W/nLKNVUqV9ZGPkjhgPai2HOJKjOF0gcU38SPVak3kSDnbQydvnn+c7cjL/sUmPdFzU25
	 hmbxRErRD/Yk5BIZBwQGM4Enf3Jggf3d9vbc8wXlLiCMh4wP0bc6GAgjS5Laja66g9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
	b=AlyVdaJ0BR4687R7PoItfNFny8rdicz0XT4DBf+nFfxqSArW4MMmQkOv2ziCob7s3UtH
	 tn0743WwUHVXjPSepMjni5QgmP4wRu2zsIMmyzSUqmdir4fwSG8vICDSKZuf41RTP07re
	 PjcLHU7g4a16lD4Cc+VbQVajN2mJUho5l2pYVY6hxSY9aj1AKKel3PF7UX4xwwMSjN7oG
	 M3MdXlL3IDjMAH2u9849lhDNB0+9wAlkuO/KFTQ8gi4dMeQhbvFCZmTOl5KBm76cWXghu
	 BQksHndbwNZR+17K7SZiwpkc1Kvlt/7sq2Qj05KuMdNOMm0ZTKrqpOfPffhtsagcuEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P31PHVwR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UeCzmUwo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F04606A336
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F04606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P31PHVwR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UeCzmUwo
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAKfl1597403
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=; b=P31PHVwRYQccQJp1
	YfPvdd/Rx+B9YnicsQlLcEXxmsSxZ5n6IA8SKCfiUcq9orWx17kPS0yJvrS0lzLj
	2EX0QTOCKKkoayAYomTYY+fZ/9CtG/5WmfJrAF/KU1RomeuJy/K+fbQM99ABgj8s
	gtDvq4PdhITMMgp+uUG+t/kvtsmaW6jdPKzsziZwPf5IjHG6pdrLgT5yzY0UM/Gn
	CDgbXdTbS+gtI1bAuKbg3jZ1l5Gi9CD461QuXeR5I5SRQg9ebbFbTdxsS0l87zh6
	us3JRiSasCicKfsM3QHkARmdF8aivcn7xp4ugtbTDZQenRiZkLsuLXM6xXRdv6JL
	V7lUQg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms3vjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b875639ceso19782926d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762806; x=1793367606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=UeCzmUwou7EJM5r0rvU+orsh9ajz6mhALtkzBF3rsXb+0DOxTFTxjBB7cA4fcKlmEb
         8qC9dCciIrk+PkAryhVBhLwJbFAdGF5u8Qxq/S5hy8qSfflJpPW1zdXdqQ+1o0dACWVD
         OuTm3nlcJO9FFv9vE50S+DZ97CaYWDFaol+Ebm8lMI/yX3NjLzJ1/OlET2xdubFprfIT
         JU56F5UgbHPkc2uFUF267+TDo3grdKWaJe1UHjZDLnJW1JZwb/dtERcc1lX6tOaTFaqu
         IJKYWMhIF2YeRX+LdMbcT9uDifgzyeLRH9yTypMfWhtgiAY7yjxENDw7EorVooGAMA3k
         2PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762806; x=1793367606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZrc/wG/9lHikRt/e8zpLrOauprcAJDgDD5YeisSoz8=;
        b=ZhIat6y5W5+gQ44Wz+w0O2UmOipkTC9qhKpbFl1TvaUFm/YEtoy5KpwePjd8vWXAcD
         KvUeJF/F+eB0zNOYvHvmvbkzEWznIfWPZdNNJt+IyPGiuiJ9qL4hRgF4fTewqtzQ4Vvq
         18hgVDpNCIWDPNDbzrae7XDsSH4wX/BEroQgZVB7/oju1/a37wMcePfak6EWxUvwjnAz
         q/0c1r8E57Cl1Y7PsoQ+h12f8Pyg1k4JKwyTPgiuk3EWg8MbwW+d+ufXlhH4o1uZPXJw
         y+8HeAv8l/+rRmpz0//g1jYpFkgcCz0+ByRAORwkrF00dqNN1QenPQ373/nUjuNTK3zF
         HGDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpNuU2y/W75ukMDhFPb12LHWf9QagWF3TaHoHJi+QjbW2spyymDGkgqc41cagMNOtoA7daKo3JQehX7Ec=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8Beujfnth0icxUAbRVvIo9pDaiSNAv+ugJEgEEBHZbOYd52z7
	DBSfQNAW58VoBQJ+GmiETqys5jFBcf05yFN0NsNY7gg/ph/2HBZqiuIlA4Xcz1RvJcc4J4H2c+8
	FyPdLoqJuM2Lh+/sTc7HlAdHzc/ePYgF2MRJyYmQCHAvv9AE9tRsFq5Jke4fW7WlFePY=
X-Gm-Gg: AYBFou142F9x9srt/IDMZYfLC1bOUHCjvers02lqV/CLDwX99xfFEBeuM+UzCOKo7H2
	fy4WJb7wtc2OLYYHJ3wjpVruaW9hXtXcSwRHRPR7KEIwgL30ioeodlCKHkzPsA583XJ+WubSb+U
	8zLawx7x1ZWnhb1t1nYFxgFFMby2LyozgXb7f+7uAB6j8XQG/hPPnkba/vJfqzi6vJ45livk/xL
	9aJdJE/2n43zYNuIQNaype2JoPX9siJZEDLLRmf1/hP2N8mx4x3az0S3WAVUr/Nkdf59vNXaSOQ
	Qph4/U5ueP5u3m7xoZk486/0ibHlSbYULTeXePEHOhns4VudZdsOGwZaRMTj5SWunN04ydgKZ5i
	izJUAscdwmCbVQ4EbVmG7oZybB/5fyirk9ZX5F49Cvu9AchUspB5SPwzUOJIDvrSb9abXU+86aw
	fj8+lMNFO+IDPs
X-Received: by 2002:a05:620a:2853:b0:93e:7ddb:7b99 with SMTP id af79cd13be357-93f6f58a84dmr402123985a.3.1792762806052;
        Fri, 23 Oct 2026 06:40:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2853:b0:93e:7ddb:7b99 with SMTP id af79cd13be357-93f6f58a84dmr402118285a.3.1792762805414;
        Fri, 23 Oct 2026 06:40:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:41 +0300
Subject: [PATCH v7 1/9] drm/connector: report out-of-band IRQ_HPD events
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
Message-Id: <20261023-hpd-irq-events-v7-1-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=saKTuWGNmEwpJovWRzupqEzCaC/rm4ThXYLAzUmpGxA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OlyhiT0RO9IWSdSg1DRyrcjCs61eY4Y2GSK
 lHqYSLDYzuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpQAKCRCLPIo+Aiko
 1VLdCAClXvDTBPnhRvI1lJ9bpuggop2DWVbS3MG8bSQOkxNuUpinFzUppZ/zhOAVB0niRaRzdj0
 kOfrG054ct0eGQkog9cVyySdnKEtOt4tMQCUeclGNKSMvgKfftnQFDWAGyfvGAuarqnNP4i6Dmh
 36AHtDqAGYMzPNu2DQm+1kkW+bFNcd7dWD3AasJ0mDTSm47YteRkuZpUm29T7M2YT7jDpWmanTg
 aOCAvJrs+vvkDxhwqVbVFwWOaoAziNZL/3tNIKn8vu+i7+sc0qaDOEvE6QqIvCrhC28yLbOuQsP
 RAjC+3uqQk0VB2Aaw3AmiYEuh9yU3Z5jWhBBeEKh3zOXFVVe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX6Jk5kE05Cukd
 yaBhjXjvbE8ZDeN9PIe/4MDJznQ4Dtu1Zf+cxcy8F6PV8t8gI8rjUZYANhPImFye4Z2V0/P0lKu
 +0uvKxETerRouHAa7ds+0u/wWT5AmjBWVI6a0u2MEfz2EKp6xNepOC/GJVBc75tzHB+NNP41Ra1
 XKg0nSCP9YU+zBC22crZvIBcevAf/+01K94nEp+TGZcXSlPRRwwJi39BrGm6pCghbKJ1xTAjwKE
 syrgdFFLawHbqjv99OzEth9Tc8YxDI5vdQBGvPHwi9K/Fhb70eIsP6QtvbIzUsf9GRYasCLEPHr
 sCB3jiZPDKwm6vZ72tIyLOIpHTAoeJbbusZCr43kSszndwLBDwxHpNH4X94G2L5ji3g5Xr184xP
 C4FeVlGXrRZn3KZ+Fj/jB3OnUc/s+jcE7Md6tG65R89yVLSQIKYjIXf4IDT3T2imbb8X5fq5fYK
 YHEfAFXKCBsUnw+vTCg==
X-Proofpoint-GUID: RB7MfGYppB9_0PYjq4xSl5c20_cYQ088
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX2VHd9Kvz9vNt
 f2skM00hhdRFd/juZ2DRFcVkLO4don+ZNfDveX+lX8mxgEu3iHUPBgaEvDFeC3kZJ+hzYL6Jbco
 CuMcbRbJHJ8tzZwS1bdKfnOnJA8yTT0=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb63b7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=IejCAnqV6A546-KFDggA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: RB7MfGYppB9_0PYjq4xSl5c20_cYQ088
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053

The DisplayPort standard defines a special kind of events called IRQ.
These events are used to notify DP Source about the events on the Sink
side. It is extremely important for DP MST handling, where the MST
events are reported through this IRQ.

In case of the USB-C DP AltMode there is no actual HPD pulse, but the
events are reported through the bits in the AltMode VDOs.

Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
and extend its interface to report IRQ events to the DisplayPort Sink
drivers.

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
 drivers/usb/typec/altmodes/displayport.c | 25 ++++++++++++++++---------
 include/drm/drm_connector.h              | 21 +++++++++++++++++++--
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 893716a9e489..e3c8181df6bd 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3821,20 +3821,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 }
 
 /**
- * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
  * @connector_fwnode: fwnode_handle to report the event on
  * @status: hot plug detect logical state
+ * @event: additional event reported by the sink without changing the HPD state
+ * (or in addition to such a change).
  *
- * On some hardware a hotplug event notification may come from outside the display
- * driver / device. An example of this is some USB Type-C setups where the hardware
- * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
- * status bit to the GPU's DP HPD pin.
+ * In some cases when DisplayPort signals are being routed through the USB
+ * Type-C port the hotplug event notifications come from outside of the display
+ * driver / device. In this case hardware muxes the DisplayPort data and
+ * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
+ * pin.
  *
  * This function can be used to report these out-of-band events after obtaining
  * a drm_connector reference through calling drm_connector_find_by_fwnode().
  */
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status)
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector;
 
@@ -3847,7 +3851,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
 
 	drm_connector_put(connector);
 }
-EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+EXPORT_SYMBOL(drm_connector_dp_oob_status);
 
 /**
  * drm_connector_get_color_format - Return connector color format of @conn_state
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 51c92dd887ab..2106074417d6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -187,9 +187,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 				dp->pending_irq_hpd = true;
 		}
 	} else {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						hpd ? connector_status_connected :
-						      connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    hpd ? connector_status_connected :
+						  connector_status_disconnected,
+					    (hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
+							       DRM_CONNECTOR_NO_EXTRA_STATUS);
 		dp->hpd = hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		if (hpd && irq_hpd) {
@@ -211,8 +213,11 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 	 * configuration is complete to signal HPD.
 	 */
 	if (dp->pending_hpd) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_connected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    connector_status_connected,
+						dp->pending_irq_hpd ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd = false;
 		if (dp->pending_irq_hpd) {
@@ -396,8 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.status = 0;
 			dp->data.conf = 0;
 			if (dp->hpd) {
-				drm_connector_oob_hotplug_event(dp->connector_fwnode,
-								connector_status_disconnected);
+				drm_connector_dp_oob_status(dp->connector_fwnode,
+							    connector_status_disconnected,
+							    DRM_CONNECTOR_NO_EXTRA_STATUS);
 				dp->hpd = false;
 				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 			}
@@ -844,8 +850,9 @@ void dp_altmode_remove(struct typec_altmode *alt)
 	typec_altmode_put_plug(dp->plug_prime);
 
 	if (dp->connector_fwnode) {
-		drm_connector_oob_hotplug_event(dp->connector_fwnode,
-						connector_status_disconnected);
+		drm_connector_dp_oob_status(dp->connector_fwnode,
+					    connector_status_disconnected,
+					    DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 		fwnode_handle_put(dp->connector_fwnode);
 	}
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..4f65c97a89ae 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -92,6 +92,22 @@ enum drm_connector_status {
 	connector_status_unknown = 3,
 };
 
+/**
+ * enum drm_connector_dp_event - additional events sent by the sink /
+ * display together or in replacement of the HPD status changes.
+ */
+enum drm_connector_dp_event {
+	/**
+	 * @DRM_CONNECTOR_NO_EXTRA_STATUS: No additional status reported.
+	 */
+	DRM_CONNECTOR_NO_EXTRA_STATUS,
+	/**
+	 * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
+	 * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
+	 */
+	DRM_CONNECTOR_DP_IRQ_HPD,
+};
+
 /**
  * enum drm_connector_registration_state - userspace registration status for
  * a &drm_connector
@@ -2848,8 +2864,9 @@ drm_connector_hdmi_scrambler_supported(const struct drm_connector *connector)
 		connector->hdmi.funcs->supported_hdmi_ver >= HDMI_VERSION_2_0;
 }
 
-void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
-				     enum drm_connector_status status);
+void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
+				 enum drm_connector_status status,
+				 enum drm_connector_dp_event event);
 enum drm_connector_color_format
 drm_connector_get_color_format(const struct drm_connector_state *conn_state);
 const char *drm_get_connector_type_name(unsigned int connector_type);

-- 
2.47.3

