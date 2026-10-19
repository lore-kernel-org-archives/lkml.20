Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0974E4C48
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406763; cv=none; b=FpMOCd7hUWTVQieTmqCQ0YkWHoVawVdfoDq5QR2qWwH+UZHf/EUpp7bzF4SzBU32i45tObqcTxB86/QwXwb/Fd17k+FCiOBUVme9OQ7O+m6n9QIKPiuWm655+JDWVJz0kXxaW4s5d8hoveMj9Uff8o+NWtPXhd1dzcolba3EUA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406763; c=relaxed/simple;
	bh=noRTrz2VdYh31PWspiEDsw+AyR+TLV37K70/8LV7O2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NaaM8VdNzmWJv76o3lpuYg/5E8ldsiQNPVipAdNRAPBsoZxN0RxSXea/SPN+C+bb0dQgnmGQcch1aArJE7GHV9HoWht9PPaZCO3UdUfZ1gdgAwRynWPdW7BloBodC4feD4/9t1Ux/K38S7ja/36qLq9VRdoMEsuI76qJsZWeK8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dD+1Qta6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbbGJwN3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dD+1Qta6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbbGJwN3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtCh3256621
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SlYpbb4mlzv7hsIbGJHKCC
	M/2c2MwZV2AAGrBURVcxw=; b=dD+1Qta62Jpntd+oZhBofjmDwmX14g0JSCFDcj
	j5WLgV2JVujB5DKdWx04BW1KYEvk0gu0HaYiN6O8RLAbyvXLnHHAPqMc995Ib0Qe
	sY9yMldBU5O2NLUkx7S8zs603XWtC8dZ490jCiblUGmz+WdfYerXz7OUmR69zRxy
	R8xXG6UmJ1vYN2xNDyB/T4hhSuDM+sye1vWzf0Lu4LPaHd5gFQDcHIVFVzumhP48
	l/pAxtfj4JmptNOXSGRXMDHDdbvgf1Y0+nN4h2cUKTAUIh9zlPeHAkdpmMOadC3d
	CgEBcD6dJ7Pzsb5XVNO6aLTZRHW2QNS9CS+hj1veK3jKdhaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8p18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:45:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so405954085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792406756; x=1793011556; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SlYpbb4mlzv7hsIbGJHKCCM/2c2MwZV2AAGrBURVcxw=;
        b=jbbGJwN30QwMy8WYQurR3gQj9xtvPu4ITrsxsdQRlLoO9j3h+SJ5tjVRMenwZNQ/sm
         Md308pT0nJtIEY20jAjeeMmLPsrjK1kw89CuFzdxPuz5D5lngP+VHCZb2EwAhNxj1wFd
         +ODbSMvxpop7KFUIxYaJ5fC5vGIVkqVZY1jaGtGe9TWdnlig4oGasrzDfUtg2dhuQtqt
         e3Tny8+46ItgJ0WKcuswFTmx+GIwJe85iA9zsPWVx6zzhIgsoQ8UzubBH/1lPbwmpVi1
         UsmjwpZtFKZ87VK/gAAqBjLl23PQ1DybJL+kWUPXJWJEUDPDMY0WLPI7fH1tP1XWsjeY
         7snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792406756; x=1793011556;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SlYpbb4mlzv7hsIbGJHKCCM/2c2MwZV2AAGrBURVcxw=;
        b=hs2wfPROvAX0ZsMSfe5UWV9PescaOoRZFtcxNmoVLLfhQWIYhIwQzujO53qa0FijVv
         rvXN0OuzvHNmkzoWJNZyhngMtk7Nf3mOfopFktWzeoBWbKiJz4vcCp64Q/lppi8Y+Pa7
         iP1m3XTWZTpK9oq0MXutxpygfe1ipOy/JGr1m1CqYvmARtOTt82gIOvLzg8KF6ATFQXu
         +osbBXF2JAwK9S1GsyTE8pE1oxA/y7uTD349bxRoBhP/yRUmdgwml3Pi82IkH74dvYYf
         WHSvkFhG8bGDCS/CBgW0fuctB3QxMBc7WoAu/hMcUBbnrjLiQ0aKTuuFsZknuFLAdgvt
         QvYw==
X-Forwarded-Encrypted: i=1; AKwUvByc6xtJYPDFjC7CbNZMFSEN6DC3jHq1D893MVE/X72+zcpnGH9QGMPVkjyHp+d5jLc2v0nGTSI9WRrTCqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+wtYAimr5yYg15+NWZSixg+uYCri3PHlOTWvC4wYuv854eQjs
	q7x9g4f4lXjzXpmMICT/unTsWNRJ4wT3CfBIY2pGf43aV+f4wf5Y6k/chj0CQWEj3SCBTuorZxf
	opl/TzHffl22gbmeNuIwGwTIYObMmP1cA8c11sdgx12WCXF6QuGRFS2l+tma5rd55jYo=
X-Gm-Gg: AYBFou2MRQ1osQRwcUHh+4OTtd1YxCZqNJzbBObIeX43oXhDM1m4qMSOa0cZuFz9xSD
	WhnXgb6kD2OA9bpGJp7RgC+saEjeSas54HcMKW79Fqj58vVxkT08HIRInpDot36ojRQQP/TWD1S
	ObNzS+znU9D80fheBi3um3ErjsmL+oceN2otHjZOWplJILFYABWdFjLUAcFB1FtKnIcpAC5z8pe
	z3DdutYTxcs71H7/1UwvE6sIKWW19HCFgf/VXjGIn35U0y0+/hoU00NdvhkW8YySewuUmQJ61M7
	QnU75iFfRGcaOszOMre5CR3u9b9VHM9dXPbHpcALi2hDNZP+1jhDdiMEQ1QvoqKnvLU6+htUwhY
	AEi+NHgh+PArUXwIY/Ve2qUJetig/
X-Received: by 2002:a05:620a:690d:b0:93f:3a43:2771 with SMTP id af79cd13be357-93f3a432b60mr550349785a.78.1792406756045;
        Mon, 19 Oct 2026 03:45:56 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:93f:3a43:2771 with SMTP id af79cd13be357-93f3a432b60mr550345885a.78.1792406755515;
        Mon, 19 Oct 2026 03:45:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm24949726f8f.8.2026.10.19.03.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:45:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:45:48 +0200
Subject: [PATCH v2] gpio: sim: access sysfs attributes as const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261019-gpio-sim-const-sysfs-attr-v2-1-9ae103b8a680@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANv01WoC/42NQQqDMBBFryKz7sgkYrRd9R7FhcSoA9XYTCoV8
 e5NPUE3H96H//4O4gI7gVu2Q3ArC/s5gb5kYMd2Hhxylxg0aaNIGRwW9ig8ofWzRJRNesE2xoB
 FSRUZa6uSCNJ+Ca7nz+l+NIlHlujDdl6t6tf+Y10VKiw73deFrq/UmbsXyV/v9mn9NOUpoDmO4
 wummpznyQAAAA==
X-Change-ID: 20261016-gpio-sim-const-sysfs-attr-350706cc7500
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4691;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=noRTrz2VdYh31PWspiEDsw+AyR+TLV37K70/8LV7O2A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq1fTegQaYzqDyEr0bDekuQXDb0GU57XiIMmEhd
 fjTEle8zneJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatX03gAKCRAFnS7L/zaE
 wytBEACEsQscYGxRh9jaLd/rGzX8EM1vINdRwkB/LQJtQX/KtiKTkwFY+7iYC67J/Ypu8uhEus1
 jIeIE7mvyWoH2BfdFuwggslYxzZzWvzODCPW8TrB6ffqZuuyPyPyx8a8RF8GexHE08iuXRoZYAD
 3G9gud5ccQ8fdwW7bvRHJyVSlMI7KGRRdshsqg11VBNkyURZIQer6CuEFYN12pjcJUn7yYgkUW5
 5+xTCTFeqYbo+ZcyZWTZLv1TSKgw7HI1wbp3tg/2+GJoLArrBvCN62tA5oz393JlPhaUTqGknMY
 l8yNvx+znf84WCtGe6iyObPpW6QGcEC7ziXBMpp47FBNpq3K3rDMer7cJCN4B7G6sNZCkY1t0BQ
 uCR38nmdrEU41uOoEyEcDu4nkVgiSK6vgy7G8k3rWZJfypPfpupDF6bGiXiGggcJwe7soWbJ4Qy
 ohmQVEqS3zD7oC/7O6JGE48rTb460jNbTiPTwIU8h7lNkmobBNSRAiHVdWtROaxUwch4uDRrehI
 B/BAL5Wpsbm+42ToHo0PrOPz/RaCI4HZ1HYJZKj3+FCaWmaSOXiPXGpAfHMkMTl/Tfjpw5emTqi
 cwO4veJeuKaMsOJ/iFIs2pKfBZZxAtdl2pX55rKcrDI3OUP+RSYDAnkmAkTg7mVRoaZ4QQEUIS1
 Ciycf2Z+4jyXnvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: f5A6sJHyMTs2cA5-jVeRLWlahZ7H27VM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfXw9BjFNcTMkEi
 +EZ+hche7DKfaoCCnucaX2iJ4da6VdBzJyF5+lmiP99ZqIH5Jm/H9t5sHth0D7anmiKqRO7dy0/
 NPMeS1sihN+RLAbM09Qv/Z9+1J5Vq9YDKFwE/j/FVrX12PXiT/olArqTo4BEh0GLjXIGziNmL2P
 u3LYNSRVsWuzRuPJhP7mVtKcEoAIePNO2ky97l7i3xNFpcImfE5jSIApudP2ihVQXE0odau7LAa
 t0cz1WdVeDGR2+IlFTvB3yZN4GN9oYcrYVpO/IZZsM7UbxFq0zjMh9eObXnZ++j4pzd+ACPE6kf
 dokmblz8wG+lX1N6ZpuWldhoyIqRmzJk/KYzTMIADh0q3Mw+u0vdqE1bPRIw1bmskWjkGHT5hDY
 Gl3CHMrv9ZqPBeCH4D3ENW2420OFiVNUdrCXMjLLD8Zyg0Nct7EyK5BkuVvdl3UtTu3rJz7NUs6
 qHEa4DnHS+dgCU9pVCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MiBTYWx0ZWRfX1nI2uIfvz2av
 rUWOfnzz7qwScq+BWXTPb3iLeiqmDJULKto5Mv3INZw9MrzOcRbFQnf4GpcmXn80jqqnGdpgcZa
 ms7BxLjDfaQ71fmQVQnh85e7mHX10tE=
X-Proofpoint-GUID: f5A6sJHyMTs2cA5-jVeRLWlahZ7H27VM
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5f4e5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=-3MbpOeJX28-tSa4Ch4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190042

Use the const variant of constainer_of() to access struct
gpio_sim_attribute which wraps the dynamically allocated sysfs
attributes for value and pull of simulated GPIO lines in line with the
currently preferred approach.

Co-developed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Thomas: thanks for the hints! The code you posted compiled fine so I
included it in v2 and gave you credit in the footer.
---
Changes in v2:
- Complete the conversion to const sysfs attributes as suggested by
  Thomas
- Link to v1: https://patch.msgid.link/20261016-gpio-sim-const-sysfs-attr-v1-1-5d2f832890d6@oss.qualcomm.com
---
 drivers/gpio/gpio-sim.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index 0c73bec042670fc5706b4a93700e652cbaf3605e..34b45d0d357505d7d7ef248560112d3106c50000 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -59,10 +59,10 @@ struct gpio_sim_attribute {
 	unsigned int offset;
 };
 
-static struct gpio_sim_attribute *
-to_gpio_sim_attr(struct device_attribute *dev_attr)
+static const struct gpio_sim_attribute *
+to_gpio_sim_attr(const struct device_attribute *dev_attr)
 {
-	return container_of(dev_attr, struct gpio_sim_attribute, dev_attr);
+	return container_of_const(dev_attr, struct gpio_sim_attribute, dev_attr);
 }
 
 static int gpio_sim_apply_pull(struct gpio_sim_chip *chip,
@@ -270,9 +270,9 @@ static void gpio_sim_dbg_show(struct seq_file *seq, struct gpio_chip *gc)
 }
 
 static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
-				       struct device_attribute *attr, char *buf)
+				       const struct device_attribute *attr, char *buf)
 {
-	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
 	int val;
 
@@ -283,7 +283,7 @@ static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
 }
 
 static ssize_t gpio_sim_sysfs_val_store(struct device *dev,
-					struct device_attribute *attr,
+					const struct device_attribute *attr,
 					const char *buf, size_t count)
 {
 	/*
@@ -299,10 +299,10 @@ static const char *const gpio_sim_sysfs_pull_strings[] = {
 };
 
 static ssize_t gpio_sim_sysfs_pull_show(struct device *dev,
-					struct device_attribute *attr,
+					const struct device_attribute *attr,
 					char *buf)
 {
-	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
 	int pull;
 
@@ -313,10 +313,10 @@ static ssize_t gpio_sim_sysfs_pull_show(struct device *dev,
 }
 
 static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
-					 struct device_attribute *attr,
+					 const struct device_attribute *attr,
 					 const char *buf, size_t len)
 {
-	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	const struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
 	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
 	int ret, pull;
 
@@ -361,7 +361,7 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
 	unsigned int num_lines = chip->gc.ngpio;
 	struct device *dev = chip->gc.parent;
 	struct attribute_group *attr_group;
-	struct attribute **attrs;
+	const struct attribute **attrs;
 	int i, ret;
 
 	chip->attr_groups = devm_kcalloc(dev, sizeof(*chip->attr_groups),
@@ -396,15 +396,15 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
 
 		val_dev_attr->attr.mode = pull_dev_attr->attr.mode = 0644;
 
-		val_dev_attr->show = gpio_sim_sysfs_val_show;
-		val_dev_attr->store = gpio_sim_sysfs_val_store;
-		pull_dev_attr->show = gpio_sim_sysfs_pull_show;
-		pull_dev_attr->store = gpio_sim_sysfs_pull_store;
+		val_dev_attr->show_const = gpio_sim_sysfs_val_show;
+		val_dev_attr->store_const = gpio_sim_sysfs_val_store;
+		pull_dev_attr->show_const = gpio_sim_sysfs_pull_show;
+		pull_dev_attr->store_const = gpio_sim_sysfs_pull_store;
 
 		attrs[0] = &val_dev_attr->attr;
 		attrs[1] = &pull_dev_attr->attr;
 
-		attr_group->attrs = attrs;
+		attr_group->attrs_const = attrs;
 		chip->attr_groups[i] = attr_group;
 	}
 

---
base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
change-id: 20261016-gpio-sim-const-sysfs-attr-350706cc7500

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

