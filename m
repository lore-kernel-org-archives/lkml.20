Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5ED4F93B6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415566; cv=none; b=b5079bIQhjXPSFfj24wrElzn+d2M+z/AKQVTrBQ4fnzzM/2p/sj19uWDKdNC5R//udtJWYpp/3q0XUDHVDghaumTW6468YLa2QieUorpkn5+9qEPQeVb3z2pES7Hbm9STghlYLjAneMBnStX4MkydWLSU7zwG/PfkEBG/JP5sX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415566; c=relaxed/simple;
	bh=cowxUPuyfm7iX/U3438hUWkWdunMkg1NU1rCpZXy67E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ikJmkKXglNDF6o5OuQcESiIsKmS9pJXmqk5ZOZvTJVzwSRYVCFIDJMwmLvupEqxmcHeEp9SfiCg7OZsuJs92in0x39TYckMs7IbbQFLraq5R6OOc8Zz4KiT+6YFn8LLKArAS2JIno8vNb/HbLFD5I2rSYhRBgcHeSbbRhYM0n3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SM0pYlzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaFVym+U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SM0pYlzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaFVym+U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrGA2234322
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eZdHwhy+tZUtldliAHZkiD
	6+tXaEfKOXU8zCpoI4PEE=; b=SM0pYlzjVq1J92qrFLEzWR2wWwcH/kIYt51v5u
	FPaIathqg62NtQ9QmzjXbtZgae8EawHURY8IluOvebY5Jd6XoR9zxMeyjsDyahq4
	EqsSFRLBiAxMT4cKIq8V4GqkDpE8nmN2e6rePEBmcqFMW99PKRs01fDMb0fTbu3b
	C7c7zgTkabwS6/yBhZm2x5EWjebigEuqiLR/DJ/7AphObI/t812D/QUvwjvW63Td
	gMHODYl3EuvPLCg5YkNO0QcrlOVHmMxlfCZAj+3LkxzBvzOLYw3hHg+r4GrHK4vq
	umaUwtBbhEHuMRfX8NB/03TjoWeQiyko5nlyVnFI1oKZT8PA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3x9854-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:12:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb98809caso328315785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792415563; x=1793020363; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eZdHwhy+tZUtldliAHZkiD6+tXaEfKOXU8zCpoI4PEE=;
        b=IaFVym+UbrAC8qtbJMbB0Zuc1o8MAoXKC8ojB8LGxW0i1EFHZwuzPAhV1uv8MGZqBf
         R3z1wRh9QyohnkjE+OoRHtDtZALCiXQStW7TXUZNblMmHzFnKA4x044fzuyV4saV1hKn
         zvYkrOccxugCuZRVUl7Cgj9jyLSeBbY6/l+xbvYhO3DFYwdDntu4fmMY9d/Q+jaKtSB6
         I5Dzt0GzFgo4wF7Ers4y958k2xmalsgvmCAJ8BdZvgbvqdRz6vp1rSOvBqff+9H2GtQ7
         rXoBoaSC67/3MYGlP/d3Ss5hLBElHu7CPIvyI+Jiu/zSg+p+HL1VJABaeI+Q1erU7qqE
         150w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792415563; x=1793020363;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eZdHwhy+tZUtldliAHZkiD6+tXaEfKOXU8zCpoI4PEE=;
        b=NbncFqOYJwMa+VyvQVls5Y5XKpsXqOuobCAyLuGim4uqdfKSeo0utiEfIDYoMCgK4F
         V1C26OyjV4fP7qrtwhkW0+rZ0HxFzXMFlHTtz/laCy0gQNW1ndHDcwDJOqOMmguvGSud
         82FVe+Bs6WjqjoGOnYDUbRt9qeF9Dv9TGGY8Ug3Oxqg177WU619GD56hdOR+urH9ra1X
         kpLpPIre0UAOTV4nZffPP3QtbxeIOIyY9M+wQwpHbMtCccL75YFg+TIQW3Jb5F7sUj4B
         b+eZ7h8m1fHqqvvBFMmlhJLh6VDmBRi6HPfGUARE9OkfuMEXE+rm9rpCpEKSSBYSyeph
         Rigw==
X-Forwarded-Encrypted: i=1; AKwUvBzDQSKkoMfhq5+VU/SuY+Ni9yj3UUpsBjjgWShlnATvTIxxZlzGlaIbaWiOk0pldnoeD9XjdIV1BLss7V8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeJWm67XAvrVIZa7kh9cHYxMNA1d7MApll7XZb55rFhbaJJPsL
	q0Rw0ae1R2/F5LHzIOSZ5RN9FcYVHxt8xgW/K/GA2R5MB9ZxxbYiQJV3pdTptFgtfBmyG7CWtkA
	ji7PInMFf9mh7IbZQo//L4rC1iS+Ga9Mjg5WSUvpziOFe9BzSPnrgd0v+XKuYy3V4DbQ=
X-Gm-Gg: AYBFou3fVB/cXoS3svb/5vudaCi5xdXhkndSCZEkfqsXPnXXrJqyGkArj1iId1Ed22X
	gEuZpLu0U38P+XOoujulaOuEuy23A3J94aoiUNeorIVTevyHTdq8f6QFYSPdtYa5KDaxQPufsQp
	BUohO4WoyIhRvPDj3wI9+mZs7iBj0hH4oMt8n6lxbxKV9cE3Td9hxuCVUtJS2yi36OqIz1zjv1H
	mKly2//25SiAjQEHzPDzbl0E55TTDvyurb6Yc/nmQB2LfpFJQH6U63GNkWT1Bixhz95TqbqCsVl
	8DA6zV1YwOl89dUQZ966dFLF8gXJP4RtykwOL+rE2txbKFv6ka6t6kDI8BE0ezNNIonvysULgDm
	0IOKdmLJg3ETXImJjdaSkhPCDyZDcXBcVwafGUCu0GXHrAH+5B8NJeIMToRBHbSumVLyJ1p6hlf
	7r8jf405K+kSVf
X-Received: by 2002:a05:620a:170e:b0:93e:9292:1b9e with SMTP id af79cd13be357-93f29b61deamr1133241685a.1.1792415562566;
        Mon, 19 Oct 2026 06:12:42 -0700 (PDT)
X-Received: by 2002:a05:620a:170e:b0:93e:9292:1b9e with SMTP id af79cd13be357-93f29b61deamr1133237185a.1.1792415562014;
        Mon, 19 Oct 2026 06:12:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab24f5dd5esm23432581fa.6.2026.10.19.06.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:12:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v7 0/9] drm: writeback: clean up writeback connector
 initialization
Date: Mon, 19 Oct 2026 16:12:26 +0300
Message-Id: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADoX1moC/3XSS27DIBAG4KtYrEs6YJ5Z5R5VF2CgQapNAo6bK
 srdixOljeR6g+ZHMx+L4YKKz9EXtG0uKPsplpiGGuRLg7q9GT48jq5mRIFyUEDwl8UupwP2Q5e
 cz1hLA53k1nEnUZ06ZB/i+Sa+vde8j2VM+fv2wETm23VrIhiwokwwAYwG6XaplM3xZD671Pebe
 qCZnOgTQ8SSoZUJmhPngQUW9ArTPjN6ybSVsUwZYYLU0NoVhv0yhFK1ZFhluHJUeSGUBrLC8Ac
 jgANfMrwyjHIhreykCXSFEX+MIHTJiMro0BrOgiItgX+Y632N2R9P9T+M910ia4rHc1Mct43LP
 e5j6V4fBR78eayj1x+FlAbJUgIAAA==
X-Change-ID: 20250801-wb-drop-encoder-97a0c75bd5d7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        John Harrison <John.Harrison@igalia.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5455;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cowxUPuyfm7iX/U3438hUWkWdunMkg1NU1rCpZXy67E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1hdA4l3vK2F1yt4ysfonHcK6dLFUN6EqI963u
 Rf6uvNhA/6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYXQAAKCRCLPIo+Aiko
 1QidCACxFXoJnJ0O+w7I2k6Z7dgIBx6xeWIB8R5h13KoJUqWp4ogxF8kES4j4QFdUu+pFQrsYUZ
 1SoyhkEovuZHyQPhla3RtKuE9RtYdZIYLz9wYSD0pXWepwBF1brNQ4QH/6BaMvCRRQb8c5GHopW
 Y8c6Jm9cULMKMSBGh+8KceVLw74vPvvtaIivE7xPc00MKfGNE35UtOVCLf3FwYMSoNK8n8wGJes
 1KgYfFHipxKt14NEQnycK1PvQoQ6Xoq4TRdYTHA5QKokxrlRlAhssIHsK+qc1/QSbiUOa+Tmz4D
 x3JB84ibbSjuY5K9Wry3HBPHY+yjLT6AQpiw+FCOue45xUpG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: gfQeJXCD86ywS5IQyXQWw456LPRTqtqV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfX7t2OT8POMiWk
 8ZKD78oi5BtdNVQz8DwshktIt7JellD2qBgfs3u9rbR3YRLcMsPw89NwWgFCqATana+CGEwmotB
 w9f/Z/tlf2ueDPgCeKa4X/f474CKteQ=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad6174b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=V2sgnzSHAAAA:8 a=zd2uoN0lAAAA:8 a=7CQSdrXTAAAA:8 a=P1BnusSwAAAA:8
 a=RF00TdSWAAAA:8 a=P-IC7800AAAA:8 a=-VAfIpHNAAAA:8 a=e5mUnYsNAAAA:8
 a=wUE-LUHtHEr0u8wc4aUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Z31ocT7rh6aUJxSkT1EX:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=D0XLA9XvdZm18NrgonBM:22 a=_nx8FpPT0le-2JWwMI5O:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=srlwD-8ojaedGGhPAyx8:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: gfQeJXCD86ywS5IQyXQWw456LPRTqtqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MiBTYWx0ZWRfXwjGykWquJc/V
 BHMlpBe/PEVuLn9GbSYn1FFodbkinoF7iztjvgJ1VxkJElSCoUNclXDMy+PIsEV7L9BKa4lS6z7
 Otj7hbgBmjRNvXVrd0dt4TbZErpSDzjWYqqegW28ADaor/xCeb0k1LdPgRiJTEH7wN6halvEi/x
 pdo9tqmaUKZsH/5r1OUuO7xzMC56MTbMVVXOFMeeoQ5AG0jPwt8yq0XuCnJLCCY8a1Ost9HtyON
 0Tor1nLITxFrsq4gdAG9HK84dq38DsSNM80k4e4ES+qrsG450xWTIRfBVYOiLlirGpvqdNlM4Mk
 dMDzgyqKgfBruVzMST3xpd6eyNR6/Dj86h4mj+GYjYCZfyLky9Y4RrYZDC8+Q4dbkAq3iCm9emS
 /ZO9Y5nNZz9+/HncovFGgfifhnff3lk68U4PT6nCrqYNYHXzvfikMsGVvzTpzvUx395rjyEPX3Q
 TVvOfLPNq0BzORJVFLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190052

Drivers using drm_writeback_connector_init() / _with_encoder() don't
perform cleanup in a manner similar to drmm_writeback_connector_init()
(see drm_writeback_connector_cleanup()). Enough of the drivers don't use
the encoder embedded into the drm_writeback connector.  In preparation
to further rework of the WB connectors (as planned to enable WB for i915
/ xe drivers, which would move drm_writeback_connector to be a field
inside drm_connector instead of subclassing it) remove the drm_encoder
wrapped in struct drm_writeback_connector. Rename the
drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init()
and copy drmm_writeback_connector_init() interface. Then, with the
encoder being gone, handle proper cleanup of writeback data in
drm_connector_cleanup().

---
Changes in v7:
- Significantly reworked series, no longer insisting on using drmm.
- Link to v6: https://patch.msgid.link/20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com

Changes in v6:
- Dropped applied patch
- Implemented suggestion by Alex to use drmm allocation for the
  writeback connector.
- Link to v5: https://patch.msgid.link/20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com

Changes in v5:
- Rebased on top of drm-misc-next
- Expanded commit message for msm patch, describing devm vs drmm issues (Laurent)
- Expanded commit messages, describing why the drivers are converted to
  drmm_writeback_connector_init() (Laurent)
- Link to v4: https://lore.kernel.org/r/20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com

Changes in v4:
- Rebase on top of drm-misc-next, dropping applied patch.
- Added a note regarding memory leak in the AMDGPU driver.
- Fixed a devm vs drmm issue in the msm/dpu driver.
- Link to v3: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com

Changes in v3:
- Fixed subject prefix for the rcar-du patch (Jessica Zhang)
- Link to v2: https://lore.kernel.org/r/20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com

Changes in v2:
- Switched to drm_crtc_mask() where applicable (Louis Chauvet)
- Link to v1: https://lore.kernel.org/r/20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: John Harrison <John.Harrison@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>
To: Leo Li <sunpeng.li@amd.com>
To: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>
To: Christian König <christian.koenig@amd.com>
To: Liviu Dudau <liviu.dudau@arm.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maíra Canal <mcanal@igalia.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
To: Mihail Atanassov <mihail.atanassov@arm.com>
To: Eric Anholt <eric@anholt.net>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org

---
Dmitry Baryshkov (9):
      drm/amd/display: embed the writeback encoder in amdgpu_dm_wb_connector
      drm/komeda: embed the writeback encoder in komeda_wb_connector
      drm/mali: embed the writeback encoder in malidp_drm
      drm: renesas: rcar-du: embed the writeback encoder in rcar_du_crtc
      drm: writeback: drop excess connector initialization functions
      drm: writeback: rename drm_writeback_connector_init_with_encoder()
      drm: writeback: don't destroy the shared writeback properties
      drm: writeback: clean up writeback connectors in drm_connector_cleanup()
      drm: writeback: drop the drmm writeback cleanup action

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c   |  27 +++-
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_test.c   |   4 +-
 .../display/amdgpu_dm/tests/amdgpu_dm_wb_test.c    |   4 +-
 drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |   3 +
 .../drm/arm/display/komeda/komeda_wb_connector.c   |  24 +++-
 drivers/gpu/drm/arm/malidp_drv.h                   |   1 +
 drivers/gpu/drm/arm/malidp_mw.c                    |  25 +++-
 drivers/gpu/drm/drm_connector.c                    |   3 +
 drivers/gpu/drm/drm_crtc_internal.h                |   3 +
 drivers/gpu/drm/drm_writeback.c                    | 147 +++++----------------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.h     |   2 +
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    |  29 +++-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   8 +-
 include/drm/drm_writeback.h                        |  22 +--
 16 files changed, 140 insertions(+), 165 deletions(-)
---
base-commit: 725953d4da85cfb97a4c309fad6346b72f8529e7
change-id: 20250801-wb-drop-encoder-97a0c75bd5d7

Best regards,
--  
With best wishes
Dmitry

