Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5823B4B44C6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658740; cv=none; b=GC8s3yir2b+VfqxC3ltATN1Db6Ysoj3KYM2mkK09EM+39qeM2qcB975Fwxc3BmiujLqasGUG9HYtNQjsXjd9NhDXMUSqyLY5Rit1c97P9tazBxlseE8DgJo49+tIEkHgw3qvpq2OwmAn5QNnTfNFWcTkp5w3BHxUXuuYZv1hifw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658740; c=relaxed/simple;
	bh=nAvKHTAAv3bLPDa8RtV69vy9lxOAzsfXW/WIHWa05a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ORt1WPynnpOHRHWPV/7KstyzE8gcfT12CAgL+WnumSmxjyHYn0UFsPBWADWs6O6PTRCFl6isp/GWR60/pAxG2Cek1+SWWuFuZ0RUOJz6WTfQy7CxPylLogmfaIK3JekLbpRk/gtQNd5SBbkEzzW/A3ucKWyVLsjesoFv+8LeZw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w1llmHBS; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w1llmHBS"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f9f7db0so150141566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789658719; x=1790263519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaaG9kQMPrqSpcZJreTasVAHAtAhXdOZx6qidBNV3Yk=;
        b=w1llmHBS6q6+W4/GGuf/sVFUprjcN5RneYzrTcGmVhAoCS+NCyV33Xl2CutJ7BuvnZ
         zg11Rgh7ZH4xUzgDrhxI5ESOkG3p1v00TlKMt4a8qe/+kDCrGLjn6cQDd7UrscV/TahI
         4CiFbNy/5Db1J+QG0WlZU4LarcipDl+LjOgC4jpLqDVCUUwl0rY9PehVnm/oNhYvu3+2
         6sbvR++P+ogDcWfhSOtghDu2fPGfplepNd++qURpkZ2kh4lBMbkTlmSMsSY8EqbPv/cz
         y9jZqsa026bquoNkQ8U2gxC5Q5xk3bdnPNI6yaEzFcIDpoUCPYuT3SxKo2wxJbQb+m7u
         R8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658719; x=1790263519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XaaG9kQMPrqSpcZJreTasVAHAtAhXdOZx6qidBNV3Yk=;
        b=W1UKYVl/qeth8Whw5CPBoIFJZ/6sOHfqohOn67fccR5GfVU2BOJmF69n7pYbQwWiNn
         ESXGLGQjGwdcxrFJocEN+ZxMOn4mf/j/nxpzMfu755+XU6W1xRecVzfwsohwxX8bg/d8
         sanbEUeFeGEAq+fyUCT9tN/PiHjpVOM7LwqcJB88x6TSl4zwjCmj3xaWFhOrBhMz5msJ
         EZ9IAwLPZtTIDWezXdeey1mdOfBUBEEA9AFboiSFxfVGLgqL+ZVhqnP3UaSoQYL+v6Cj
         2D4Sex4WwR59s1U/EMmzsUKAQ0MZ4dV4haVIoALA3DMDn7582bGEihzE51uhneNoqdB9
         ydxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZcOfsU6dkmD2lbIvxKeuFdvw4fBwNLPmh7oQ7DhkdcjVDSDeyaRlSsddjTd8JaGWeJAAuA1ClbyXnL/8=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ5aQ8PX6wuGm6r3fb7pyEdsem9VLp7bbDA5uU7o3BorR7DtdJ
	KcdoYVdExlKlsm4YsbL3gp3509GLR2sSF+gbHaxZZCE/ZjGbtSq6/oIFJl1r+Z5rvRk=
X-Gm-Gg: AYBFou3M8Ok1DcJ5rKWNDt5BbZgemwvEp3BS/yUNXA9X/bDCA0FwMTmLa5W/TOZBQrF
	SbhWWBSicRTyIYmOgxuorgOwwOxc2jltJcOgB4p/34qhAFEf5QbamoW0bjJry3H9pi/n7t2CtkA
	5ThcQGBBlfmTdqFODq3fFGF51s6dUZGDDX90fkOE7fqwwemt3dw1gOLWdkuRIN5bzmy8TIGIk1A
	uaXSSd95Y+sDk2EIxD8MGdut85ceVccMgC/fCz741zBMtAOaKJYp897be4h1vE621i0K/xcN1db
	AuH+O94wuNxphqRgGdeoPx5XKhfE/SP28FED5yhHYr91mSemugGR6uPbaw5rH3u1hH0JEJDEgSH
	RPbdWRmnzusjCN/kg6WsyTsq69z3Zb51CSmyMw9M4zVGtkVTtfvgHXa6FgcHD/0juLYzcph18q4
	drSy19vr/5W/gJLaBUJqn3zYuLF3WkY299JFarz4xKgQyQ9RJoevTTfCkRIi6KzTMUbAK1iS8Ry
	DgHz97mLw8=
X-Received: by 2002:a17:907:d642:b0:c25:8c74:71e6 with SMTP id a640c23a62f3a-c29e529041dmr506795166b.10.1789658719047;
        Thu, 17 Sep 2026 08:25:19 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48755asm310587366b.24.2026.09.17.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:25:18 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 16:25:10 +0100
Subject: [PATCH v19 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-5-21ad8a76e941@linaro.org>
References: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
In-Reply-To: <20260917-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v19-0-21ad8a76e941@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3096;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=nAvKHTAAv3bLPDa8RtV69vy9lxOAzsfXW/WIHWa05a0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqrAZVFsIMW2/vGXd4QQ7KAOZgAqwx0MFGvBcs0
 hrm5SKiqNyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqwGVQAKCRAicTuzoY3I
 OuPSD/0TKFuTYyRebGjbH7JeKR3zECbg6HM7ernZRFsj1tVkcH4V/eU3Lv4JMGpoj0aLtJpudEM
 nCbrlMuFKo5mhKevNWiGNTh1GUS4fsz6niVb0xPL5gtjDG/SFD+HYzQ88LIhNWkYd6GCDX05lj9
 XqEPteTHrJeNN0wTa+Ohh9ZKB/ts7OfpbCViNa2/K1R0dVcSeBja9Fc3uw8FSW+UaTFeMKpLSW4
 mQ+c6DvRZYiwzJX4fqenF1o2ccpAgULopn1zlp8iJEvJrtoK7h+4IOCumq3Z6+RV1UIOtcN5LBR
 Ov3vj8BbN4hkfcLYXSbE8d7yznJ4CYH2YxWfz4Zi0Jj35Vkkco8fCypyAmo9upvprKrrCAjoT79
 SEpis1Bl6+0H1vnfBrmA1tssIga62V8L17p5in8BnDyycxGqFU/Bf2Nr60dGjZYFRlbouTffSGw
 l4l3XfiP0tWfOE52jXClgAGguPNPlmczmDKGyfly/D6giSYv0wPgFN64Ek7WAcu8/1Dez1Vyz+l
 Qnmm0O6+GCV+4sxywa4bIUdlRpCy7iBAQisalkJataEzrWhKeiJunIihGNvd6vJJnY3EoRU7EeD
 02xc2kjaUjigbJNUvYvR80UIes2IfgXg8nLsjLJ54rdk47jUcEApzhHcRCvTZ1WoT4vwdF0M0tH
 T8OmLmEVh8mEI6g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Introducing a dedicated CSIPHY driver community feedback was both to move
to data-lanes starting at index 1 on the PHY side and also to match that
indexing scheme in the CSI decoder - CSID.

CSID consumes the data-lanes property to determine which CSID lanes to
switch on. For indexes starting at 1 we need to amend the logic somewhere.
The PHY side code normalises the input data to register level meanings so,
replicate that logic on the CSID side.

Introduce a simple flag to differentiate between legacy indexing @ 0 and
new indexing @ 1.

Existing bindings are not affected.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 drivers/media/platform/qcom/camss/camss.c        | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 7a357044b9fdb..8c3319f2ca1cf 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -21,6 +21,7 @@
 #define MSM_CSIPHY_PAD_SINK 0
 #define MSM_CSIPHY_PAD_SRC 1
 #define MSM_CSIPHY_PADS_NUM 2
+#define MSM_CSIPHY_MAX_DATA_LANE 4
 
 #define CSIPHY_GRP_ID 1
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 84097d82d99c9..6f58e729eaceb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
  */
 static int camss_parse_endpoint_node(struct device *dev,
 				     struct fwnode_handle *ep,
-				     struct camss_async_subdev *csd)
+				     struct camss_async_subdev *csd,
+				     u8 lane_base)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
@@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device *dev,
 		return -ENOMEM;
 
 	for (i = 0; i < lncfg->num_data; i++) {
-		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
+		u8 lane = mipi_csi2->data_lanes[i];
+
+		if (lane < lane_base || lane - lane_base >= MSM_CSIPHY_MAX_DATA_LANE) {
+			dev_err(dev, "invalid data-lane %u\n", lane);
+			return -EINVAL;
+		}
+
+		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - lane_base;
 		lncfg->data[i].pol = mipi_csi2->lane_polarities[i + 1];
 	}
 
@@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
 {
 	struct device *dev = camss->dev;
 	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
+	u8 lane_base = camss->legacy_phy ? 0 : 1;
 	int ret;
 
 	fwnode_graph_for_each_endpoint(fwnode, ep) {
@@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
 			goto err_cleanup;
 		}
 
-		ret = camss_parse_endpoint_node(dev, ep, csd);
+		ret = camss_parse_endpoint_node(dev, ep, csd, lane_base);
 		if (ret < 0)
 			goto err_cleanup;
 	}

-- 
2.55.0

