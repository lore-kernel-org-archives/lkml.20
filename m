Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CD930BB8A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972110; cv=none; b=pWPX0Vcav3Bv1z8kxLWbYLdSLxNpnYhJSfhzm0QdBacpNJAqc/0hV1hppD5qBFx9v0EN0q1WEP/k0jG3VqZYF9TYPrFZ22fgU+fYQNm+ZnbJZFdLO92x3t4LTttcI4nzhMby8yt0hQy8ZnnEWfc5giSNTpbGq3k7tOG2td39vsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972110; c=relaxed/simple;
	bh=dA1kJxBVNYRK3wJrOfY6LmMtHsB2vzPS5APo3K99OZ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j4kYuxut3Vi5yPQLJkM7LG+IFbsZOWlwBXxoq0h1t7kErzAT51gKyNT7eHn93GOMDxQNsjMuQ9yNiPkFfdzoAQayL9fw7z1iHcKRDO3SInU0zvZuH+uaT5a0ftzpJ7inNDvNJU1MRw7FgF3oFdaw0q8cG5fFiCGFTwm49xdoWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jj0WL+J9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYw6MbnF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jj0WL+J9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYw6MbnF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eEO73696456
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Twe4bOGFXZPC6mmxXuMGAv
	q+HqmTqYhaOFzSY+3Po5w=; b=jj0WL+J9h9IoYSHnQnkOykbokYMd52crb05Wc+
	tF1JmoACcGwT7RX0stEDZ0aFJOA1sjZ3R4ZT/SLKVtBxgLgpBDtj1YI6ie6t7U0i
	lG92ep2jWKRc+wuJS8NcM0mQHbc+wPnvBgefDhlt0FWVDUVCATTL+jaFtQD/ckXC
	pr4IVnnzGk7D1WDou+u8oKDhC53ar3cMrb/sRtnp1cgj6xwNx3xQzgt3lz2Ohp98
	LcpeBXMCbHa913U4D6Zfxi36VLbO7SsZxJIh9b8UTjAVTGscN8/7MfZB6pSIjPmV
	JScgycAXIfqlz7PajkaHwAtRRPEI3cdfqsCKSlrVBrfeYEWQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeg2xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b7e90fef1so54276066d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791972107; x=1792576907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Twe4bOGFXZPC6mmxXuMGAvq+HqmTqYhaOFzSY+3Po5w=;
        b=RYw6MbnFOXtMjsgNAYlv9+B3pplhhVsCEGE3MFJxB/eBYODwtRe7bsMhK4ibiAmEt7
         rK60ICoCkdwW6UzQ3yCw38BQ8CWTRj3WopZHewXkPYZaQGN8tE5Q9LaWsdZYMBypSiW2
         vQ28JCHmC3I7WNegt1I63w6d+stQ9YRzEo4yQif7bVLxlimyC3XXOCumgKRuRcs1TmQ6
         iy+dcQB7pS7nKDei7Oc9vVRwJpNxFXNE4U9YRJs6ACByP+7k48t56i+UhT0xQAJjYr+t
         u0pfD97vwlF4KGWbu2Joe+gdNg3wTGqmxZbD82UGJz5mvI7o3uCzLB2P45jO4lFxMtj0
         Ky+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972107; x=1792576907;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Twe4bOGFXZPC6mmxXuMGAvq+HqmTqYhaOFzSY+3Po5w=;
        b=UZAFerA5xMHl0KXO8SCcywpVbFmCR6XoirzVe9O/W68QycqyiXKI4evQ9kvEAVLYD3
         LEk5jQ6/eOMxUGYoLTQXVurffBaVI0XiN4sRdeSvs967cOHV576D30WrOn6FeR9Salvr
         +DTZS9i+TX5/TBFnLNf+L46bqMZAsnhvMiBK54C5hLw/M35qzjJcoRHPwa5bPQNll0LS
         d9VWtPjNCAcZoMgsv8ZrYDR/L5iWuFGoAiGD9UG9OsshyKMhy5lkVuMr+56aTb9B0XC6
         0eHZW/G33sw7ZIJmbR6M/DYtUVIfk07qCT4sP3GvGWMECk0qO/NHftSH6lfo5Puunyhr
         C2Sw==
X-Forwarded-Encrypted: i=1; AKwUvBwcjQ684odATz3qRCf7aIUkXyrfWHQDbIVAiSNpKLijoc/pwiWh7OSSuZbl37tpv3jsn2Xq6zp+iNPMn2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpbKMWl6V156s7lSG6hHumqyBfiRE4EXUjOR1E+5y20Twfo/Fu
	sDUpYBkKuMRdKbIF37juYLs3Qu2GgBwBKSDYpWHlQoz7Y3fiTSvotOww5WFs9UQbO/MONTM7s2h
	d+FYrnQ/Py1rQNDRPOYU7aV/tsMsJ05brzAFH9kf4GKaeIOdY/UK85MqN5GqiBDw3ywg=
X-Gm-Gg: AYBFou2JprGZYcSj5k8WVLWVX1JJhdQffLDL2T/t1p2IWnC9MJgr5GgNk+qnXWH7Ymf
	CC9sMvjNtZME316HXmHP7XLDt1tF+0Gmm5LZj7AAe+UMfxgSBDx8Otb/FnXpiM+x57DgyUXJMda
	xOvdagbwwDMdCi8DY/XARm3PforIfAfRwjPmctYov71qv/hLzLDe56rWXvqK+MMQE3kEV44hiKu
	kvZKYD+Z5RTNKypPT9obKKgfCPDvxpt4dLKCMKlMcBy6F/GUGRkEVFbM5MocfBAznCBQiw9wbYF
	xvRFGsTlOjGgHn0+u3nK9x2/zEViGSoZvfkBx0hDylj7piE31CzK2VfVdlfMLeJ8VIvud++zBmP
	iB6RwB0S+jujzlNye8OOC9n4lbUZv
X-Received: by 2002:a05:620a:c86:b0:93e:c12d:4ecc with SMTP id af79cd13be357-93ec12d5528mr1550862585a.44.1791972107144;
        Wed, 14 Oct 2026 03:01:47 -0700 (PDT)
X-Received: by 2002:a05:620a:c86:b0:93e:c12d:4ecc with SMTP id af79cd13be357-93ec12d5528mr1550859185a.44.1791972106608;
        Wed, 14 Oct 2026 03:01:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm10382169f8f.54.2026.10.14.03.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:01:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v16 0/2] phy: qcom: add the SGMII SerDes PHY for
 firmware-managed systems
Date: Wed, 14 Oct 2026 12:01:33 +0200
Message-Id: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP1Sz2oC/x2MQQqAIBAAvyJ7bkGFLPtKdFhqy72UaEQh/T3pO
 AMzBTIn4QyDKpD4kizHXsG4RsEcaN8YZakCrLbOaG0xU2/bNiKfAWN40JF23q++p46gVjHxKve
 /HKf3/QAc0WwhYgAAAA==
X-Change-ID: 20261002-sa8255p-eth-phy-6a0699f98a7a
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5541;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dA1kJxBVNYRK3wJrOfY6LmMtHsB2vzPS5APo3K99OZ4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz1MBKaDX7KCIBz6idXxyLNSK20L8E4xFCar2/
 sioO86nPH2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas9TAQAKCRAFnS7L/zaE
 w+gZD/47iRUku+z7ViQgcn8YCIkHtybTtMtxM2NZL7Q3qW500PETUxwLE+LPdsratZXIzj6pzQu
 o6eilyTLHoWGJ1CmNQK6g9Icvy7fwm3AOpkszxRAe2ewOwotQTB1MS4qis6vM2UvJgFq8+MC2l4
 IiwFmhtE8cwsofOCnkVASE9UmniZeDHpAF7szZTHU1mPP7fB5gWwsLHxDC8MeeQYRmGC/xrpZqC
 V0TuX0LvevaKizxtMMqf8X6+y+1CX02mut8KNugsKrN+ymVfcainIa34NouIWGkZOJ4JRmr0oAg
 SgZzIWROt0hYxvgL8kKqaOnqVTbPfN4Myi2985pNEqWkoIW02lpJy2PX4n0wVjY9GksGn2X8W7x
 Hd/NiHSNBNRZRyv1daBaI2mnhRicZuMYXxhTcGpibemTEgGf6rqY2Q0QeNFFYpdqC6coTabdTAE
 8Vk/8xNRtDq3mvoCdEei99PNl4BOlnxuJXVqYx9xvdVzqy5+dxIPJLI7jCZoUOwuV7Y4xozMsng
 2eQ+adQ+dPspjVJfZqX50U1hDrXKigJLtNbh0fs/bKjfRgEJKu0bOIX8xgLt398Ad4OfyiHqCDM
 gNDHS6asc2Mqxh8R1RZoxktoAoWnpilPFTuIksyXe5U49Vlf5i7e/xzvk7ZZ4iEvgjl9nrad442
 TScsKKsA1MxF+dQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: mJR-sf-XR08Xr5m6G8oWs120AD6MlbFj
X-Proofpoint-GUID: mJR-sf-XR08Xr5m6G8oWs120AD6MlbFj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX+/8tACPH3BZV
 lPsuRYxxcNuFF98C4IZY5Qwlzi3Vq5eggP01RexqDEk7Ut+5eDgtwMw1sGy4nNE6DH0BWKiZdhN
 MyWDxBVvse2lsmo9DQt2Fp/5pW3VpGc=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf530c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX8IT0zneSfDR/
 jpfjShat4wHThAO1hqLh8ZWZ7SrHSTKtZrj0RwiqUuT17/zPCm53ORLO6XufuHv4zC2K20lUe1T
 kdP7+nriDd9DxK9xAjGHlkt0JcizcaKcWIckCvUvfEUvXBIRL+zCT35f2Uf78+5hNKIlj+0t0nE
 yCP38+i9lmoW0lIRUzvdNeEIzGS82II8/ur+4t/nhSSRT8V859ZQN0TkZr/sd08XfTiDM72rQVG
 41cyRTqD07lRe1I4/1xViH8C9lvvoQBuHGNa6xLjUcd81r8FjvFNlJkSESKUmDcuvNf3Vupityw
 2YFceuxUO+pVqSvLCGs+1K0rPGYOA6XCjDnAz/2/cEMtwcRgnf2D4cLR2f+tOEQx28cP2qTrcRp
 7PdRHj0/3L8LEOC5meWZhS+Ho5P49WR9q2I9F3rzqHfAO2eBPdkg+67uVcfnK1c4T0c8lvCQnu2
 OvVuRpEmHQcEqM4nJOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140039

As Jakub suggested: I'm sending this separately targetting the PHY tree
as there are no build-time dependencies on the rest of the series.

Add support for the firmware-managed variant of the Serdes PHY present
on the Qualcomm sa8255p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v16:
- Split out the PHY patches into a separate series
- Set the SerDes line rate through the OPP API
- Link to v15: https://patch.msgid.link/20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com

Changes in v15:
- Squash patches 6 and 7 to avoid a potential hang-on-resume regression
  (Sashiko)
- Fix the AUTONEG_DISABLE early return path in forced mode (Sashiko)
- Fix Kconfig dependencies on generic power domains (Sashiko)
- Set the performance level back to 0 on unbind in the PHY driver
  (Sashiko)
- Use devm_pm_runtime_enable() where applicable
- Link to v14: https://patch.msgid.link/20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com

Changes in v14:
- let genpd's own runtime suspend/resume callbacks own the perf state entirely
  by calling dev_pm_genpd_set_performance_state() in set_mode()
  unconditionally in the sgmii PHY driver
- drop usleep_range() from the PHY driver when setting the state as the level
  setting is already synchronous
- add missing power-domains limits for ma35d1/k3-dwmac
- fix ordering of clearing the sgmii loopback
- configure the wrapper clocks synchronously in scmi setup
- Link to v13: https://patch.msgid.link/20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com

Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (2):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems

 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 +++++++++
 drivers/phy/qualcomm/Kconfig                       |  11 ++
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 113 +++++++++++++++++++++
 4 files changed, 175 insertions(+)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20261002-sa8255p-eth-phy-6a0699f98a7a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

