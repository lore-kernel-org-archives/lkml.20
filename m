Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008638;
	b=g6QFXkZalmsiJS8J1OSziTnTcHwzm/UD2oHUxlgf5MqKuKTtu+PPPwGYgYTHS7YQeRH6
	 kRZaL8YdZvLB+3RsWb9sgoCxjiXG74QgR+pNKzj+3IzbFqaga/Ju2hX8/Ke75Ql943Ezm
	 hKRRt7XqaW7ve+OetiIA3Hy7LR/fK5x+sKMCoNER3hQRAsDxZPWInVsBnz4eDZ7oFI4yU
	 GjaF/UMQWV8MGDv4Kc57qWygywbMFkvvy07/fEJN+FddQeH42CgQmoenVthGXTUffmApP
	 1wALn9Mx8Fe/ioKr1o6yL9ycxyjsx29CRwyvCFa9QAhza7rw3pq3vQzNMoe08hgXkIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dGnG5N1ZMXpqMyBYThGtGJOs/WO26PEcfUhLHu/F/Bo=;
	b=UTYQ+/TgjSjdCZAfK9JIBZHEhtvLLklGM7/K/www4TtTiUrxOJZ7rPP1ftJ3ktfvQ+iL
	 ubTct82ZDgDEcbagY1pr1AKYqExZXJwxqi/9GtW6cxYJyQBOnyNCgFYEWKawcijgFJU4o
	 RqZM40KPJNfErBn97yx/tbWMCQ9yeGs57YbRzu8g2aKvnm1LTHQlDcOZojICVQKTm5hu1
	 uUeO5uFBmAOK3ciqJN58lJa2laLIzp5tCWxTwseJUEtbAqiqhaPjEguuf2fqxfKOfhnft
	 574SFoqQs2frIyu5S7usqcrtEZrvm/vCl9r/bkruzy3xrJ8v+CWgyXPNAcZ0ZDyvtzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YDYOKV2J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ey2kCidZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2191606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2191606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YDYOKV2J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ey2kCidZ
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPlw2222508
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dGnG5N1ZMXpqMyBYThGtGJOs
	/WO26PEcfUhLHu/F/Bo=; b=YDYOKV2JX+1XhCXrSc+M95MP6jTtaiO5uJUfdKId
	temZMZpb6j8SuG3hMvnY/9fkFje+MoJsqoTuPz2q0TjsO+QGcqWWDxx8hFk8dp7M
	IvildnYkKkgcaLM7WeHIJDdD4dFFAZeqSXTnvedAP4tbOGwA3vKH8uZRumztIGvf
	C2nRmK+Vn0RxFgqH8VX+0BwPjMjxMnhjRNqGJUHZ0h95GO3JurB5pvyhfkE41wCd
	2Nzo4nAVOMEu95gS+dl7rBsxm2nCKiNx73lEBJ1LQaEn0jgzQy/oGRu4isC3orHF
	xRX8EKWfiAWh3l6mrE36DXBV+ckRjyR6jORdVLpf65W/KA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9jk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ead3f82944so632104e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008636; x=1793613436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGnG5N1ZMXpqMyBYThGtGJOs/WO26PEcfUhLHu/F/Bo=;
        b=ey2kCidZKWF9dvWM/DNNsGAljDeurzIj3An6gLr5faI0+Z294stOe6sjHNLrvXTM31
         2pvHrTQ/wWCggssVoqsw7vSyYe7x0FiAFLQbpX7lv/SsNajgt/Yb4SeUXi99N17v+7Hz
         finhe/KxrvJI6u7WjJsQpj82nXEEdk0kq/OjUuARdfwwIJBsnRnTaz8VM1LJKSbAluWZ
         iXgKvJbR9unjxHo3Q1c06tZSFsCgtn006mOI5dZxHCh4vK7P96h6lXqEU6VDgvES+lNW
         Hv/pi5+/mI6rGvh2FMqBmrCVuWODMn/QRunDoh08r0HWO7na7TW3uXnw5dj5tmgWmuFP
         +mrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008636; x=1793613436;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGnG5N1ZMXpqMyBYThGtGJOs/WO26PEcfUhLHu/F/Bo=;
        b=2ePpLnEyWFwLoIfx+fvnnPusR96lDpBJiD41XXNartZYIuKHZj17hdgk9tYXUbWFf8
         biXuFAg/XE7bm85dBujOZOn3tbbFhmlnn84+2s/ZPhFDeGOtaxTrxlqOBWmS3Twe5m1J
         kTS5BgjBzqk120HpDbj8SlopLgk5Le4+HlK810jIOzujeBSRDHqzXdX/u5uOXg08x8aZ
         3Vq7j655drpgnOM04fBYauH49pcnpFrlO4cgGmk8VE5xzI3nezyVFRnjce2gvPawFWbv
         Zy5arb8dMpmO355keQj8ducv8ixGFCJUp2zwa8JtlNIO/I2indFi4P9j2SlJr/TtFxxU
         vMpg==
X-Forwarded-Encrypted: i=1; AKwUvBwONfeSRd07MrBZC2m5PQLsbpfadRFF0pkOjv2Qcluv/ZksXqRoGTgx16xxy5W8Vo+Zg4FiVHBC9LB1vko=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgT9bBKBAMctfeERQHz6Oyf8KeXNNQa/QJPysrL/GSElVyo7tI
	igtDbnWnA2tHgBR4I1ArwxAKr5XS8hQn9nyQUBJEkSZ5DK0cLfoxVpaXmrWaw8d0FIpK9f8EQcu
	Pd8wGNZSd/tXKs6cadkbKmfUUz8eAC0jKUP9s6FXrUJZK0S1Iy74l1X4mrWpqFxrtR38=
X-Gm-Gg: AYBFou3/htmMhR7kjTxNec/GwfcfIv5ESf5WZ3XHEWebgjwcfrlSiqluvQgAnigyCo0
	4HsPMt2RkFrHM0NDeH0zv9Nwk7R2AvJ+Bp2iPae5csJCEkLfrrbHT71n8jOCC7DgqDKlwtGGyEb
	llqUwjRqeRhLKE4OrYj9ecNadryd46NZSM0ZyxghNpGZMaF2VeXA7PcyrbOQTvJRPJ//bd3mi+1
	JaZj4tsSKe20u08HtqZ7ddiARNa5X/oZEoE4s34eIKCx1dBGGHsI//vMYecg5bUv6zthlL8Q1/W
	2kzg751F3hTdHAK2DEy7E+G6Y3tZ4oOZCDVuUeUu7SgEHWRQxeAxKCSLKr7H7PXFRnZocX5D1bk
	ZF/X9MJ8Ha6S1wnQ04pWP0bpVBYDLouqN/YHVaZ4vrTAgGTcBz3t2tasRrHfk4jsdm7hsfKHpE+
	RdKuVuRpzODktc
X-Received: by 2002:a05:6122:46a2:b0:5ea:dddc:49de with SMTP id 71dfb90a1353d-5ec232ecbc7mr1873454e0c.14.1793008635586;
        Mon, 26 Oct 2026 02:57:15 -0700 (PDT)
X-Received: by 2002:a05:6122:46a2:b0:5ea:dddc:49de with SMTP id 71dfb90a1353d-5ec232ecbc7mr1873419e0c.14.1793008634997;
        Mon, 26 Oct 2026 02:57:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a493b6sm15800951fa.37.2026.10.26.02.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:13 -0700 (PDT)
Date: Mon, 26 Oct 2026 11:57:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
Message-ID: <fzchmbho74ii6d2zhzni4qy4g74hiwv4fwf5xudrqdrstt6klm@7wdoo4acr6fm>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PLgz87ZSBfR2JoHFFaH0sNoEAHr0trIf
X-Proofpoint-GUID: PLgz87ZSBfR2JoHFFaH0sNoEAHr0trIf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX4+fVbKZCyiXT
 FTPmlBwLazA54ymRh8znmoxFVcfuudtsGIPsMORGIydjTyHrsNSQbPY+//XMjs5fO2zIlEFIsJY
 aasbW5MGvEV+nA03+spkKYSRJXYHCQNHpuXpw1/J4zMSGJ/Il/tVO0I8V+72CLq2UC2HVBDEPIP
 V3/Kd9mYOt3qszDTcCzzElP6Sh/pHvFuLQM6MNiemdla3Ni3I8Iq08SbRr7uBhwsUEascCTqH8C
 yGYw1HjvgERdAuCLDMlJr+5Vi0+PgXafZn21/EaKubBVYK8z54dt4dYKCfx0UR6dxfjfqALicR7
 4YMEQvUQKFc4bsDa8ncpYplZMfE8bQ/hPaI5gwY3j6MvOpS7GjLgjLOQh7aXQHmSpi6FuTE//90
 91wHOFHxJp/5Ja2gIGZsaa3P58o9EdlNtyETqTok1ZuUfeiCwlHvMAZiDc1SxvFKU5e8TuVvBh0
 pSTWirtyk3aD3ktZaSA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf23fc cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=5JPbPPqDrGKWpyQmkvkA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXzZDKMV6QjNYx
 QqltJiveJDva3qFy8Ss7iSyypJm6bYu78Me0ywJEJ4xx0PPSfmRXVjVwus+b9z6Z9tVZniIUyvh
 XK/jgcMgCdJ9X9UtThG0mJUdqzhBBz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260039

On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
> DCP platforms place the display pipeline under firmware control, so Linux
> cannot discover display resources through direct register access. The DRM
> driver therefore needs device-tree descriptions of the Qualcomm transport
> wrapper, display topology, IOMMU contexts, and panel connections.
> 
> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
> subsystem. Document the IPCC power-notify resources, transport and
> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
> after the IPCC power-notify sequence has completed.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
>  .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
>  .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
>  3 files changed, 334 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> new file mode 100644
> index 000000000000..9a0acaf00bb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm DCP DSI host
> +
> +maintainers:
> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> +
> +description: |
> +  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
> +  qcom,dcp.yaml). It follows the generic DSI controller binding, with panel
> +  devices described as child nodes. The DCP INTF graph endpoint connects
> +  directly to the panel; the DSI host node is not a graph endpoint. The host
> +  node uses the dsi@N naming convention, and its reg property identifies the
> +  DSI host index.
> +
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#

If there are no separate compatibles, can this be folded into the main
DCP schema?

> +
> +properties:
> +  reg:
> +    maxItems: 1
> +    description: DSI host index matching the DCP output port.
> +
> +required:
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dcp-subsystem {
> +        compatible = "virtio,device34";
> +        iommus = <&apps_smmu 0x400 0x2>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dcp_intf0_out: endpoint {
> +                    remote-endpoint = <&panel_dcp_in>;
> +                };
> +            };
> +        };
> +
> +        dsi@0 {
> +            reg = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;

Yes, fold it there. It's not a separate device on its own.

> +
> +            panel@0 {
> +                compatible = "novatek,nt37801";
> +                reg = <0>;
> +
> +                vddio-supply = <&vreg_l12b_1p8>;
> +                vci-supply = <&vreg_l13b_3p0>;
> +                vdd-supply = <&display_panel_vdd>;
> +                reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +                port {
> +                    panel_dcp_in: endpoint {
> +                        remote-endpoint = <&dcp_intf0_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
> new file mode 100644
> index 000000000000..96f6c2a17e9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,dcp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Co-Processor (DCP)
> +
> +maintainers:
> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> +
> +description: |
> +  The Display Co-Processor (DCP) is a firmware-owned display subsystem.
> +  Linux communicates with DCP over HFI through VirtIO and does not access
> +  display hardware registers directly.
> +
> +  This node describes the externally connected display graph between DCP
> +  INTF outputs and attached DSI panels. It is assigned to the VirtIO device
> +  by the Qualcomm transport driver and is not independently enumerated.
> +  Firmware capabilities and internal resources, including pipes, mixers,
> +  CRTCs, and clocks, are discovered at runtime.
> +
> +allOf:
> +  - $ref: /schemas/virtio/virtio-device.yaml#
> +
> +properties:
> +  compatible:
> +    const: virtio,device34
> +
> +  iommus:
> +    maxItems: 1
> +    description:
> +      SMMU context used by DCP firmware to access GEM framebuffers. This
> +      is separate from the HFI transport context specified by the
> +      iommus property on the parent DCP transport node.
> +      The child context is used for framebuffer DMA performed by DCP
> +      firmware, while the parent context is used for VirtIO transport and HFI
> +      queue buffers. These contexts represent distinct firmware-visible DMA
> +      address spaces and must not be used interchangeably.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: |
> +      DPU INTF output-only ports. The port number matches the firmware INTF
> +      index. The corresponding DSI host is the child node whose reg value
> +      matches the port number; the graph endpoint itself connects directly to
> +      the attached panel. Unused INTF ports are omitted.
> +    unevaluatedProperties: false
> +    patternProperties:
> +      "^port@[0-9a-f]+$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +            required:
> +              - remote-endpoint
> +
> +patternProperties:
> +  "^dsi@[0-9a-f]+$":
> +    $ref: qcom,dcp-dsi.yaml#

When adding DP support, would you add more devices at the same level? If
so, we risk getting a warning about multiple devices using the same
address.

> +required:
> +  - compatible
> +  - iommus
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dcp-subsystem {
> +        compatible = "virtio,device34";
> +        iommus = <&apps_smmu 0x400 0x2>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dcp_intf0_out: endpoint {
> +                    remote-endpoint = <&panel_dcp_in>;
> +                };
> +            };
> +        };
> +
> +        dsi@0 {
> +            reg = <0>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            panel@0 {
> +                compatible = "novatek,nt37801";
> +                reg = <0>;
> +
> +                vddio-supply = <&vreg_l12b_1p8>;
> +                vci-supply = <&vreg_l13b_3p0>;
> +                vdd-supply = <&display_panel_vdd>;
> +                reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +                port {
> +                    panel_dcp_in: endpoint {
> +                        remote-endpoint = <&dcp_intf0_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml b/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml
> new file mode 100644
> index 000000000000..6020e848ce25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/virtio/qcom,dcp-virtio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm DCP VirtIO transport
> +
> +maintainers:
> +  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm DCP VirtIO transport. The IPCC power-notify channel and
> +  associated interrupts are required before the transport can access its
> +  MMIO registers. This is a Qualcomm-specific transport and must not use the
> +  generic virtio-mmio driver. The DCP VirtIO function is described as a child
> +  node and is assigned to the registered VirtIO device by this transport.
> +
> +properties:
> +  compatible:
> +    const: qcom,dcp-virtio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 2
> +    maxItems: 2
> +    description: The VirtIO-MMIO and DCP power-notify interrupts, in that order.
> +
> +  iommus:
> +    maxItems: 1
> +
> +  iommu-ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      The firmware-visible IOVA range, specified as a four-cell tuple
> +      containing a 64-bit IOVA base followed by a 64-bit range size.
> +    items:
> +      - description: IOVA base, high cell
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      - description: IOVA base, low cell
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      - description: IOVA range size, high cell
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      - description: IOVA range size, low cell
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  dma-coherent: true
> +
> +  mboxes:
> +    maxItems: 1
> +
> +  mbox-names:
> +    const: dcp-power-tx
> +
> +  dcp-subsystem:

'dcp' is not a generic name. If you want to list it here, it should be
something like 'display-subsystem' or 'display-controller'.

> +    $ref: ../display/msm/qcom,dcp.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +  - iommus
> +  - iommu-ranges
> +  - dma-coherent
> +  - mboxes
> +  - mbox-names
> +  - dcp-subsystem
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +
> +    virtio@9be8000 {
> +        compatible = "qcom,dcp-virtio";
> +        reg = <0x09be8000 0x1000>;
> +        interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
> +                              <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
> +        iommus = <&apps_smmu 0x15a3 0x0>;
> +        iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;

This doesn't match the address / size cells.

> +        dma-coherent;
> +        mboxes = <&ipcc 13 5>;
> +        mbox-names = "dcp-power-tx";
> +
> +        dcp-subsystem {
> +            compatible = "virtio,device34";
> +            iommus = <&apps_smmu 0x400 0x2>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    dcp_intf0_out: endpoint {
> +                        remote-endpoint = <&panel_dcp_in>;
> +                    };
> +                };
> +            };
> +
> +            dsi@0 {
> +                reg = <0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                panel@0 {
> +                    compatible = "novatek,nt37801";
> +                    reg = <0>;
> +
> +                    vddio-supply = <&vreg_l12b_1p8>;
> +                    vci-supply = <&vreg_l13b_3p0>;
> +                    vdd-supply = <&display_panel_vdd>;
> +                    reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +                    port {
> +                        panel_dcp_in: endpoint {
> +                            remote-endpoint = <&dcp_intf0_out>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
