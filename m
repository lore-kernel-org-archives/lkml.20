Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA2A3EEAC4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310471; cv=none; b=C4i2lkrUWAGaa6EvYdSq2eONedCM6rOo/BCxANL60XxatyA8QebzyABuP3UMv7Bi+DmTSAJz+Kbqmo0ggyGaSih7k4XJ9ly1IiRHI4YrPCdYme9Ibkz8Da84TzjhKOo+NgcHGHX9yJ58GFODuOSzP54/lqCK5Q+HUPUOZNKE4sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310471; c=relaxed/simple;
	bh=Dx3ovNJlM9aS0KyPy/KkFqWuw6/wLLR7Yg/2GW2PrQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RPqDuSdr6LrBF+1ozqUe6AIVBLRqPO5BUE0YQZOZF5/fBLTPDjNcxZl03QNRbv9FZ1E7LunTBj/Bhisr4Mg8thnzHDSKjyNJXr7B5FUi4UXVglYeAVM7xJmoO/1qg1sytNX7VxVuDN1vICWVyof+xPzGHE+CkEh6dlPBadASeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhCZqfH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLxBNbJQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhCZqfH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLxBNbJQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE00Uq2786237
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0uly6JHLnN++DMu29WEaZNFPjIiWYw6gQfnWNoZwd8=; b=KhCZqfH5vXYGq+r9
	YaIgXXuVEHTOu4an/u+6WgHN8AQQ31XlHdE9KN7JDmbfoNvJzzHz5y8o7S2vtnIX
	P2ATiz1I5fdtN4jSc3fJNDid9Juv8hMzebrgFCuCFs5uKoHs75NL+m3K0eDsD5dg
	aJEJ9xAhcOzO4XsFIWmL5MfSIB78K+oAnkNHTDmw8JrNdMzVLax+/FyHXR7pu0fa
	9GTw9zkJdUZr6e/Z02J4DlsgMJ8HgED8SA7tWdox+c4G0emNviGVg4791p0jwkCe
	H/5KWenF/FQ8kU8xNFbOz9ixzCI5KybUmlN9EdzLIVnHtsB0B/5QWXBC0EX3QGmC
	qZRbyw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cbh6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:41:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so3051160a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310468; x=1789915268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0uly6JHLnN++DMu29WEaZNFPjIiWYw6gQfnWNoZwd8=;
        b=KLxBNbJQtEob6ypPifc8lhj2eQVNXZUr3tDa8lgvCWPqeplJR7wgCzvzxPcJ5tN6LI
         NAE+4cB/IUpSQ3e5XmVo3SiONR6/PzceMMviXDCF3g9rz4SW2lmIpopU5v2fuQIqVL7s
         ORYNYth6nsdeN2nBfOBBwn3FL9TCE9yCY3+IKTgUvJCuQWICEV/gkaXNm/Hhj1qTKp6G
         WyjX9Wom8g1RJJnws5WlxMt2LpbVfxz9FJ1QVCif6XX7zWBvGLcmemIhD5I5kIcLYuNn
         BKEXhxN7vjIhXW7iXLYmaofD+Ek1FyETzNU6UkNrrQbLooz5ymUyKTSDLFwWWMVT3POJ
         lPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310468; x=1789915268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0uly6JHLnN++DMu29WEaZNFPjIiWYw6gQfnWNoZwd8=;
        b=ojPhwu9Fpu8KJZzQMCklGzmKCNv+zQvSwjm22jnb+BWWK+LaUbYSwp9prgs9omr3Sa
         wokMNXjc4jbGu+JSPt8nEZmr/GWmVg0x32yX4QPTKTcxGq6y3PjPjAooNnXg91dV5Lyl
         zN9A6NmSqger9e/RQ1mfvkiYl/qvkj9ZWvoaTmSm6pV0r6rObsWCD5fWpN5dD8F3OIZV
         +vUEahulNO27LBke267lWaMtDQDskX4WtW5UorKpNwTVNXjmVGMhl0ptM5yNeKQKa2lx
         yB3fwzzBG4XjdiTdkxTr2BX4TUrhHVaLLIYEi4J2goPvEL8Z1udmleNBrY9rYrd+AYvT
         Fdpw==
X-Forwarded-Encrypted: i=1; AKwUvBzklvV+c0kFHQvL+E4t3lI46fClCHB6KRLi1k0YYfG4zUfxyqh2I+pXvQTC66y2zcfVwBJ0OV+wq1qJRws=@vger.kernel.org
X-Gm-Message-State: AFuF++nzazEeLEMev33dPWkTB01+ivFEOYPjLJhkuZhAIxP7d0DUSjIo
	0A/ayEJEyyZC+zvN6oZtjQ+z5ujjcJF5Zgma379lVM2IlMABfRGoa4i/8GpAZLYBv2V6UrDIVsC
	3N08zfHSfUs4+hT1cJBmanlW22myT7Y1hmYhSo0hK8u2o9LpsDoEJ3u5QeA//A7L9Ve8=
X-Gm-Gg: AYBFou1jMmjwf1D37EJARI9W4RfJLiFoNVi25UCi3XU+oQKcRJH6htp22ZquyAo9kn4
	Iio9+rR/XW3y4YKqmOFmGul7rhdYt48y4s4lZBdmPBck7Mw2q/0vxtIlvijslK70MRQB7+A/kM0
	Nx/PZvTlZWY2jEePW1ZEIw9dkiWGFRkXa4s/wxyQcEBvZQPvir3Hs/C1/LsMSUvYnN+ChU2P7Us
	UowGEmc6xaNA/Nx77YAsLzhqh+aSggEqp9ijEQMCbHOMYVRAqv3UM4SqlenmODuJHhH6qXL4NbQ
	no9f9/LzSGA4hJzwJfoZwAGdIayDhr+QhkHw9YDwQOv8LFwnBrivqsCxSKjzBmy7u4/sEhE8VG6
	5fFt//5PUkwmjI6oRPEtDb8Hn3qFXMwB1QZp3Uf30iZwV6F1G3PoRiRY9fXiSclAddG1njg==
X-Received: by 2002:a05:6a21:32a9:b0:3da:e7dd:45d5 with SMTP id adf61e73a8af0-3db0e485c2emr13344570637.20.1789310468289;
        Sun, 13 Sep 2026 07:41:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a9:b0:3da:e7dd:45d5 with SMTP id adf61e73a8af0-3db0e485c2emr13344493637.20.1789310467806;
        Sun, 13 Sep 2026 07:41:07 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm2904705c88.6.2026.09.13.07.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:10:45 +0530
Subject: [PATCH v8 2/5] include: linux: phy: Add phy attribute "type" and
 associated helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-eusb2-interrupt-v8-v8-2-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789310452; l=2358;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Dx3ovNJlM9aS0KyPy/KkFqWuw6/wLLR7Yg/2GW2PrQc=;
 b=aD1Pl6wzsZlO8t0tJjp6+liaW2VZ55woEjDK4YgYpMdoEpojaDpkr2nuVijBQkLErVGWgXfUT
 r8s3M5rlZuLDT4F1E2SJuiyt0DwY4f+4hhOK9s1OzuzyzyemFuCuqXf
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX2uLGacl6m0ZA
 jl3FV4EhmJmhcCvRERSHJlA5GSPcNMCSgFcAXDdHLIYCClJqcpJpvE80iYQAq7Iqnfez1Gq/v1J
 +SW6Yz2+GXkRg+vbBYR6t2QyzaCjdvI=
X-Proofpoint-GUID: XcutQ0vAvD_GBja7j0ix6qLchEna1dGK
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6b604 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=YrurubeZKOWHlXb_luAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: XcutQ0vAvD_GBja7j0ix6qLchEna1dGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfX4nS3F6K3Y7Yc
 xFL6/5HVOPJzSJQ8o++W7f3ysMLE04ILpcglZKFf6M74uDjdKXrJp/pkPPFgryYUVeObGEq6TXG
 0gO0O/GhF23wEqZhGUN34kJhX1BnJtsZ7Mh7gwLTzHfocbyd2Oa7nWFLFgNZzCgqxBxJX8Fdcpz
 Q8+47upqgrtw9dDOLx5h/9d93Gm6fn+Q4xI1EzYWzLAsvy7DoRE17Or+z7AfHRzV9c3eOQJmtXR
 0wCgnmlmgg7Q01XaG5uZus4wbOV73WRP6ss98vB4Rnzhft7ilxpCAsU0PCkTUD1QwiVrmbGcTCj
 kYPGvpUNwi1pIs22Jeb2MRFdkfy5hFA4BwDpLbu3HdWpKf6nRHJqvHnW4N2Td54aUbOV+ac+voD
 k8DWZk5GLfYdGVZb4LSYu//syj/TZYmk7Z8fdGbKK7KR+da9ZraktkUKkSmGEPmd8r7Q5Qk0Ffo
 A4SOAV1aoq7ESPSOmHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130210

In cases like USB High-speed phys which can be either USB2 or EUSB2, it is
required to know the type of phy (rather than the operating mode) because
DP and DM interrupt lines need to be configured differently for each of
them.

Add support to cache the PHY_TYPE and add the following helpers:

- phy_set_type() for the phy drivers (like m31_eusb2 or snps-eusb2) to
declare what type of PHY they are (in this case PHY_TYPE_EUSB2).

- phy_get_type() for the consumers (like USB controllers) to query the
type of phy connected to them.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 include/linux/phy/phy.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index ea47975e288a..038c2b58bbe1 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -21,6 +21,8 @@
 #include <linux/phy/phy-lvds.h>
 #include <linux/phy/phy-mipi-dphy.h>
 
+#include <dt-bindings/phy/phy.h>
+
 struct phy;
 
 enum phy_mode {
@@ -152,11 +154,13 @@ struct phy_ops {
  * @bus_width: Data path width implemented by PHY
  * @max_link_rate: Maximum link rate supported by PHY (units to be decided by producer and consumer)
  * @mode: PHY mode
+ * @type: PHY type
  */
 struct phy_attrs {
 	u32			bus_width;
 	u32			max_link_rate;
 	enum phy_mode		mode;
+	int			type;
 };
 
 /**
@@ -262,6 +266,20 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 {
 	return phy->attrs.mode;
 }
+
+static inline int phy_get_type(struct phy *phy)
+{
+	if (phy)
+		return phy->attrs.type;
+
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+	phy->attrs.type = type;
+}
+
 int phy_reset(struct phy *phy);
 int phy_calibrate(struct phy *phy);
 int phy_notify_connect(struct phy *phy, int port);
@@ -393,6 +411,15 @@ static inline enum phy_mode phy_get_mode(struct phy *phy)
 	return PHY_MODE_INVALID;
 }
 
+static inline int phy_get_type(struct phy *phy)
+{
+	return PHY_NONE;
+}
+
+static inline void phy_set_type(struct phy *phy, int type)
+{
+}
+
 static inline int phy_reset(struct phy *phy)
 {
 	if (!phy)

-- 
2.34.1

