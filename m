Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB0450AC00
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795822; cv=pass; b=SPupbwr7qFt/kVFRScYSqElI97FBJ1T7KXYjnJpwNlig7VuIW5RKuH9Wf685XzNFEJJjOUwMoTT99xEgrceAV/JQg3J9QRZARRwvOuqGuUEuxpSMGdRqc9zqae7wbxerwYe5UasIwDpYR5rNlfJYzuzsgVHmbYmU8Ls8vwv+hh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795822; c=relaxed/simple;
	bh=x0k2ZNaxrcyvf06s0cEGNFwTgGkxK0tbNwXF3iCBWe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HdFzIk6SvJMOUbm5rBNbxeHg5DW2KXDJxTtetSSjzmd/oALac9a5h461PldRXUw/hBVbzX9EpVW4kVHrvNiWK+KMbonHDn8daVTtPh1lVwzAWXeVzH+zMyuxwp9Wr26vT+n4jQMfdjx4GRgCNXqZZjIL5kz/wpDgoNH0uNOIcOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgcleIAU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7PvSis3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgcleIAU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7PvSis3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdEnp3554646
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 15:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uFtphcf0qabFXMYNQMaR90QQ52hdneb8foaFc+VWDMU=; b=kgcleIAUDQR9IjHb
	v6z+rwBfd1ZhFFW8zeiPe2OOa9QPMQl5zejEK01F9Ub0i5cQnXFIyHzqmtm+/sWb
	3HARlHOYygOUFTEkW/fEJUi7v1E4QjYITwpTDzG8BhxnpUh0pKCLrUKdDWTFIB0v
	iWeYBLYT/YlfMce55oMPgAnnGBihKnmE03bCDsKDhclrLiEGtFEEZfRRhyMFWGds
	4NdLrZtVONY8VuEo0gwugwrhweBf5Drm9Y3flu28Of2+N3ZctNMFR7eTwZdCulA7
	TJ66tyl9LTFx3QzRto/oYPQPECZdHl1mEP0MHO/q64j5N9kf7f66uUDtL4tkE9no
	frKx5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw21mbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:43:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b571432fso561820085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788795814; cv=none;
        d=google.com; s=arc-20260327;
        b=MVDTUIpEnOwomawTcZ7+V8yFkoy2OnxOiBl7GpXtzY/vYVjrNMPv3xkwPqiwHMIIsD
         QaF6heDeGvK9OE7KxWstxp+GHL09q+UKNj5CrXsRNnhOefmYoV9XRF566o2tkZMNyG1q
         9TdG9GDzVvR2UnLQeszoyveDV6oMdPjcgD6+WNbQi6X67ZAw3OpyT2CsETQj4Bq2xMbr
         ZXgrW3GXMhE5inXKlR/aUQoR/nkDoRL5A5pjAXm1h7eW4zc+/MaE2OopP8rQ5xpWDR+h
         vBE5V3aTPFv7t+THPhPL2Qp1BsNF7pE6KS97knmh/ieNyHs2wLXIKEynxODoVBXykGEm
         XOXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFtphcf0qabFXMYNQMaR90QQ52hdneb8foaFc+VWDMU=;
        fh=UmVUee14CiSI+3JWM0bipLRQTwmjnC5MJxa34ZoRX+s=;
        b=BMgFYTA/eUgX00IWKRzTAJdfbv+yoCGoWZBSOc0s+nKo7WOgmfWN4d1eJTcupgXnWD
         rlcM9sEn6/4mklJRX4PT0ORW5s8kaOteXMgeFsIgyV1xbwJ8ZzFa/fxF1ac2qLm2H90Q
         1yH7dHOldmT7D8T7jY8pbVMIEIj8l2Fg6nZs3ZHo7O6QtxLKTyn5iSwv3JMykRUsPJHX
         MNB5tDPX7sC96LKN1yODO9fCycdd6a74zW5DjZRVkqcyxSKp4ON2YQ7kUmhxuYi9IJ3u
         Q6vF7o7nKnoZAdWDZiib5chk44wDb26qRRc6a26WEvW6p+gNDoJjcPAH+nLOlpROsHiv
         SckQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788795814; x=1789400614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFtphcf0qabFXMYNQMaR90QQ52hdneb8foaFc+VWDMU=;
        b=F7PvSis3PVbhqkhEOyOP3F4n5EQa19d3Gkd3QFqSurjF1Ot9v5xrzwOGK2VyCS0g9/
         hM2gy6TNiVyWceV8/Q/2TYwz+eOgq2WTwUkPNg7zo1jMjAgcF9nTcwz4E+EsgeX7yWmJ
         PeN1zRJY5zK2In0tL7dNsjelDxyH8aqK++fihgrv+6JtUg8VDcz5OIy3jKZ2OEqJKKhz
         GwLll7rF7MnJ0+1J5sgqPV3Crzyi6dZl4aqib9u9+cQNOGxMeBj4n8Jx3KZN2B7dCq1Z
         muWSJeW2MBRlgc5CNXtaAE8O4hopahMWon4xE++TfoAtNV4MkI3NiFqWtdbJCex2fPSh
         4ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795814; x=1789400614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFtphcf0qabFXMYNQMaR90QQ52hdneb8foaFc+VWDMU=;
        b=SYzzwlfac5eobBVqeekcGAfcU9BdasO58RLarBVSbaX8ofZCc2nK+kIdRwG7LYrAVJ
         0xjKD+Wl9XYCB5AnaEG9bWnWQaCY3CyhozJ14/VePAHkgW3FF4K3/3ymWr3MiOBUpiyi
         i/VWUw1Mbgo73iqVmnat1a44ixm5Eq4hWsbMh5hvt44GvNsp3famh812rGRkKYqnW0Vg
         lQlkMq/mMAfN7Z9J1np4ShcVluPfyeliryRkZmTvJFZmAl8Uz68VV/lBPHjhmzylAzSL
         KnaiP3pQn6H6rl0sCApUHru6bk1FLcLDO8r/swKSRqgmESh1uwtURsO2NqzNOvGiL452
         Vq4w==
X-Forwarded-Encrypted: i=1; AKwUvBwGI4nX83p5jCdbDZW8sHL338jjwBg8wIq2+lTyP3nkmAHsq0uVW463ixJzFdG294zODVNNYLC3mEUpjoU=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ7oyaaqQYh9sN5/rfpNhoRN64qw7ZiXlMkddbWKbilTduLQ+f
	FrJuKP4JTlO/J7nN0V8niH7T8XrT6wj62n5uehiQg4o5nPM4qN/dl0H7ICOjxIU1jhH8/pkcnFu
	7Dp5UR6SuMDgweM+CRzt+DGqwqLTi9G9kxBCdIbAX34YftyMkLVoMzPVXCpOb5IttZmCphJugKK
	2ozKNamdSKR/b2aOZ2uMuxdf/I3hrR+paZS2tSe47sYg==
X-Gm-Gg: AYBFou0FEsqxsCDyALOigq0Dyf5j2EVsBQWrN/4xGhPF9hjUG7KDsmrh59ju9WxZhmo
	WkZ1aJZWASXzFvlZSfYk85PTdRS3vI2p/USJF8zbGAI8zbTXMUbAD+7OiVf8lVlC583nnPONXoW
	fPoF5QKIX+Q70U0o7gzEdhQIG+pWsAUbL+u+v2a8xEqht9JE18DxybUILOj4HEaS+BUempTqn54
	OcC0O6yaZk423qWjAzSJr2CAFwWNfcFcNrB+SQCpaUusSwzh0hw4fI6ZKOt7P5/WlYKvDEHLhI=
X-Received: by 2002:a05:620a:472c:b0:939:8d3e:2979 with SMTP id af79cd13be357-9398d3e2a8fmr1528955185a.39.1788795809109;
        Mon, 07 Sep 2026 08:43:29 -0700 (PDT)
X-Received: by 2002:a05:620a:472c:b0:939:8d3e:2979 with SMTP id
 af79cd13be357-9398d3e2a8fmr1528948685a.39.1788795808443; Mon, 07 Sep 2026
 08:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907143349.317495-1-mani@kernel.org>
In-Reply-To: <20260907143349.317495-1-mani@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 17:43:17 +0200
X-Gm-Features: AcwNN1XZdCKgi6F-AuL2PP-68gvsthyuBMwzp6mN8ywHkfBuoYI09tyQKFwvjtY
Message-ID: <CAFEp6-1XmbS-8WSqMVsuLX3hW+rYHD-e83KqASaNjvE+yXsNRA@mail.gmail.com>
Subject: Re: [PATCH] PCI: qcom: Honor IOMMU provider's #iommu-cells in qcom_pcie_config_sid_1_9_0()
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 10_3NC39r-rAFn6OEHceOGqV9YgqjWdh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE3NCBTYWx0ZWRfX+1Bf9zKEnWkg
 EcjE9DS9yHBO7U4Q/vhDEjz5WjFbr7AHfEJTQFCv/1oLzhkZH6IZElyY6WVsPSM6NFFKWrf9CX5
 grloF27HzjBN8IRJ0+hNp3sX4fL11fE=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9edba7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=i3_CBYoBxiO5QtD0oAgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE3NCBTYWx0ZWRfX38Wj2mLTTrp3
 bQKw4pvOdbEYr2ikHytXKHL2Kx3mEX5hnFs7PeazLGOrXom9X/PJ/lUh54tcvxP9790c8uxMfTS
 Z/RJPOPdVOrTgshLqCM2VSzh+D4zVFrrIES66kKbRX6KMMZ7nPtABLqDEAah0U/oRReJtH9K6Fm
 lEjftRUSeuCe6ZTqoDQLDuoWHdBp6JV3T5cZR7lktwKNiRrgHZ6xSGvHVdd0dm9mm9IMlvm9Jla
 G/uc7JBN6ob0afxjIvety2dx8UI6y+Ja07BVvAtfzh6Qh4cpFep2FFloIaZpN7jvvPx+thmqATo
 3gCqNYiN68AiLSh8GMNYoF9JORNLiT4sAgLOC89jYfc8eZllqaEnox/wKtuSL0CnkZ1gcJO7rIr
 Z3O4UkqD8a9GUUgV4Eu3PThxdqcUenSveOmXXwVePsJmoF8eKfopIPnLYxvjUZkTxVeWr1olCVq
 MJFMZulouswJ8s6C6Fw==
X-Proofpoint-GUID: 10_3NC39r-rAFn6OEHceOGqV9YgqjWdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070174

On Mon, Sep 7, 2026 at 4:34=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> qcom_pcie_config_sid_1_9_0() reads the "iommu-map" property as an array
> of fixed four-word {rid-base, phandle, sid, rid-len} entries to program
> the BDF to SID translation table. But that layout only holds for an
> IOMMU with '#iommu-cells =3D <1>'. The PCIe SMMUs on these SoCs use
> '#iommu-cells =3D <2>' (SID and mask), so per the pci-iommu binding each
> entry is really five cells long.
>
> This used to work only because the DTs were themselves broken. They
> described iommu-map with four-cell entries that omitted the SID mask,
> which of_map_id() tolerated via its of_check_bad_map() fallback, and the
> four-word parsing coincidentally matched that malformed shape.
>
> Since commit ccb2fd725d41 ("of: Respect #{iommu,msi}-cells in maps") the
> OF core parses such maps correctly, so the device trees were converted
> to proper five-cell entries, e.g. commit c41749e9554d ("arm64: dts:
> qcom: sm8250: Fix the PCIe iommu-map entries"). With five-cell entries
> the fixed four-word stride slips by one cell for each entry after the
> first, so qcom_pcie_config_sid_1_9_0() reads the endpoint mapping's RID
> from the preceding entry's length cell and its SID from the phandle cell.
> As the RID is the hash key, the endpoint's real RID is never programmed
> into the BDF to SID table. Its DMA then hashes to an unprogrammed slot,
> gets tagged with SID 0 and the SMMU faults like below on QCS8300:
>
>   arm-smmu 15200000.iommu: Unhandled context fault: fsr=3D0x402, iova=3D0=
xffa00000, cbfrsynra=3D0x0, cb=3D1
>
> To fix this, walk the map with a stride of 3 + '#iommu-cells' of the
> referenced IOMMU and take the SID from the first specifier cell, which is
> all the BDF to SID table needs. Validate the layout instead of trusting
> the array size. Also, preserve the legacy behavior of the old DTs by
> detecting the same pattern that of_check_bad_map() recognizes and
> falling back to a stride of four.
>
> Fixes: 4c9398822106 ("PCI: qcom: Add support for configuring BDF to SID m=
apping for SM8250")
> Reported-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Arduino Monza (Monaco) ATH11k/WiFi was broken for me. This fixes the issue.

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 90 ++++++++++++++++++--------
>  1 file changed, 64 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/control=
ler/dwc/pcie-qcom.c
> index b58a607b713f..42cbeef083ca 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1143,50 +1143,90 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pc=
ie *pcie)
>
>  static int qcom_pcie_config_sid_1_9_0(struct qcom_pcie *pcie)
>  {
> -       /* iommu map structure */
> -       struct {
> -               u32 bdf;
> -               u32 phandle;
> -               u32 smmu_sid;
> -               u32 smmu_sid_len;
> -       } *map;
>         void __iomem *bdf_to_sid_base =3D pcie->parf + PARF_BDF_TO_SID_TA=
BLE_N;
>         struct device *dev =3D pcie->pci->dev;
> +       struct device_node *iommu_np;
>         u8 qcom_pcie_crc8_table[CRC8_TABLE_SIZE];
> -       int i, nr_map, size =3D 0;
> -       u32 smmu_sid_base;
> +       const __be32 *map;
> +       u32 iommu_cells, entry_cells, phandle, smmu_sid_base;
> +       int i, nr_cells, nr_map, size =3D 0;
>         u32 val;
>
> -       of_get_property(dev->of_node, "iommu-map", &size);
> -       if (!size)
> +       map =3D of_get_property(dev->of_node, "iommu-map", &size);
> +       if (!map || !size)
>                 return 0;
>
> +       if (size % sizeof(*map)) {
> +               dev_err(dev, "Malformed iommu-map property\n");
> +               return -EINVAL;
> +       }
> +       nr_cells =3D size / sizeof(*map);
> +
> +       /*
> +        * Each iommu-map entry is: rid-base (1 cell), phandle (1 cell),
> +        * IOMMU specifier (#iommu-cells cells), length (1 cell). Read
> +        * #iommu-cells from the IOMMU provider referenced by the first
> +        * entry to compute the per-entry stride.
> +        */
> +       phandle =3D be32_to_cpu(map[1]);
> +       iommu_np =3D of_find_node_by_phandle(phandle);
> +       if (!iommu_np) {
> +               dev_err(dev, "Failed to find IOMMU node in iommu-map\n");
> +               return -ENODEV;
> +       }
> +
> +       if (of_property_read_u32(iommu_np, "#iommu-cells", &iommu_cells))
> +               iommu_cells =3D 1;
> +       of_node_put(iommu_np);
> +
> +       entry_cells =3D 3 + iommu_cells;
> +
> +       /*
> +        * Retain backward compatibility with DTs that describe iommu-map
> +        * with 4-cell entries against an IOMMU declaring #iommu-cells =
=3D 2,
> +        * matching the fallback in drivers/of/base.c::of_check_bad_map()=
.
> +        */
> +       if (iommu_cells =3D=3D 2 && !(nr_cells % 4)) {
> +               bool legacy =3D true;
> +
> +               for (i =3D 0; i < nr_cells; i +=3D 4) {
> +                       if (be32_to_cpu(map[i + 1]) !=3D phandle ||
> +                           be32_to_cpu(map[i + 3]) !=3D 1) {
> +                               legacy =3D false;
> +                               break;
> +                       }
> +               }
> +
> +               if (legacy) {
> +                       dev_warn_once(dev, "iommu-map has 1-cell entries =
targeting 2-cell #iommu-cells, treating as 1-cell output\n");
> +                       entry_cells =3D 4;
> +               }
> +       }
> +
> +       if (nr_cells % entry_cells) {
> +               dev_err(dev, "Malformed iommu-map property\n");
> +               return -EINVAL;
> +       }
> +       nr_map =3D nr_cells / entry_cells;
> +
>         /* Enable BDF to SID translation by disabling bypass mode (defaul=
t) */
>         val =3D readl(pcie->parf + PARF_BDF_TO_SID_CFG);
>         val &=3D ~BDF_TO_SID_BYPASS;
>         writel(val, pcie->parf + PARF_BDF_TO_SID_CFG);
>
> -       map =3D kzalloc(size, GFP_KERNEL);
> -       if (!map)
> -               return -ENOMEM;
> -
> -       of_property_read_u32_array(dev->of_node, "iommu-map", (u32 *)map,
> -                                  size / sizeof(u32));
> -
> -       nr_map =3D size / (sizeof(*map));
> -
>         crc8_populate_msb(qcom_pcie_crc8_table, QCOM_PCIE_CRC8_POLYNOMIAL=
);
>
>         /* Registers need to be zero out first */
>         memset_io(bdf_to_sid_base, 0, CRC8_TABLE_SIZE * sizeof(u32));
>
>         /* Extract the SMMU SID base from the first entry of iommu-map */
> -       smmu_sid_base =3D map[0].smmu_sid;
> +       smmu_sid_base =3D be32_to_cpu(map[2]);
>
>         /* Look for an available entry to hold the mapping */
>         for (i =3D 0; i < nr_map; i++) {
> -               __be16 bdf_be =3D cpu_to_be16(map[i].bdf);
> -               u32 val;
> +               u32 bdf =3D be32_to_cpu(map[i * entry_cells]);
> +               u32 sid =3D be32_to_cpu(map[i * entry_cells + 2]);
> +               __be16 bdf_be =3D cpu_to_be16(bdf);
>                 u8 hash;
>
>                 hash =3D crc8(qcom_pcie_crc8_table, (u8 *)&bdf_be, sizeof=
(bdf_be), 0);
> @@ -1208,12 +1248,10 @@ static int qcom_pcie_config_sid_1_9_0(struct qcom=
_pcie *pcie)
>                 }
>
>                 /* BDF [31:16] | SID [15:8] | NEXT [7:0] */
> -               val =3D map[i].bdf << 16 | (map[i].smmu_sid - smmu_sid_ba=
se) << 8 | 0;
> +               val =3D bdf << 16 | (sid - smmu_sid_base) << 8 | 0;
>                 writel(val, bdf_to_sid_base + hash * sizeof(u32));
>         }
>
> -       kfree(map);
> -
>         return 0;
>  }
>
> --
> 2.43.0
>
