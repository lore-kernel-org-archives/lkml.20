Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8E476074
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394803; cv=none; b=g8A2IPm6YV/Zh+FPDC1nCdTSrMfCvI9Goz+LMwA7KPQ/FBavZpDPuU4v/h+uFviJXa2I2TJ6+nrII1kb+FgNklP447Y57feYY0E0iyeO6YPNuWchEj4YMNMlzLxhvucTCbAQbLaKaqGoyuaqTH5Xm0CBj2VsjFJewHPc/X4tAME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394803; c=relaxed/simple;
	bh=M1jhzEngeUQmZn4epgWhZIt5mhVknLgHn2qil+s31Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2VY6TPgLY9pl8Ay96McEBHZwSjsja1QJqCnXwNKaOURxtrGw7EEKCbH9+kaK9w7DKCfORO/qoHF2z85IfysYbifYS6dRoxntGg/slN8tzAdf4IF1ZuKK0+zd8GZRhF8K+qmp9YlHllkwyXhHvbjBN89ckY0OeJPXiozABLYlbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqIGYLXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9Jn3cCr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqIGYLXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9Jn3cCr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0MN54090499
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gnji4ta6O43OZz9qRSk1IXl6
	BaqNTU48rGVf9Qgbt2Q=; b=eqIGYLXYh1Nrbcio2AowZkZ9hL1O7bP2EEQyJ99k
	Hm01vqRYf/BPLVbXrx+QJMlWOsKsRycWjiILJBeKLBbiamFDONALt1GJnzPwPUb/
	EEek1Zjl9uU/W7FIvbHmhRS2S9so8eH8UwDlMV+vxpz8E55y9jn0cBKqvrNf43mJ
	GSNOWnQ94bNjLsGqG8yAYQMk+/StYthr3vy1tiNqQy6B5k5D/8w/qwHY4tf7ryf9
	Js40TADRP59yyOo6rCUV7cNALp73oTnky/mWCCcRBybjXKX+9IvfWR9Zm/nv2Eit
	NAr19HPKiRzrvB1rog0SKpa7k8TZsUt5KmwEAl9F4pPqRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg1g04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:06:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a05d645acso465766885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394800; x=1789999600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gnji4ta6O43OZz9qRSk1IXl6BaqNTU48rGVf9Qgbt2Q=;
        b=a9Jn3cCrkyeE071B4+IVnlmTIMAD+jmzmDf6upC2/NDy8tucPU8iDqD61sTbgI07Nm
         WbguLt2Plt/hqUNRney99FjFhGjZFNQqzui2Gn8O+6vqWU6mLq7lWGVbg9BBsReT0uGT
         b4tmMmPYIZcXjjlV7E2PravhOhulZvsEzSuK33kw0tPBGqADGvRZaFmmtt7F+LOg3VkE
         CdCpVDNRaLM5kDx+k3n5qPJp1EJxNkG/vS9YH+wHSHSPEiW0g15zUDIJKn6reCWlE10c
         3oBhdiXhmqFsxGh+c2djuz5+xKLN93R0AT1ncKwzegFkhUEzUXww52aCf7jUhIheOvC7
         3xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394800; x=1789999600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gnji4ta6O43OZz9qRSk1IXl6BaqNTU48rGVf9Qgbt2Q=;
        b=LZCvb1pnmHlH+H/fAlit5l/MX0UPOrv0gppzEp4tAvl3/Ws99SDwduJanrypcDfMQd
         bWueaVDuScxKu74PMUK/5TynKfapBD7W6lsfk7IsuL84IihXpGEwUKaKDZmaIAPB4y8+
         Nc8c3NIXLOBjNB2JGM/3y3j4Eeo9N1FWbztE+NNqfPRIKaECwllfKe9zqh5iJzYN2O+f
         V8Sq4vxMZ2B3JJOuKFlipkEzaH1MMFs3C+wtMSHyfK3uN/yK7ClWcT2vtr7mlGE/nnOb
         qOdWpktIdWdK6Pca4ZpCcy2W/OsC95dczDPfgW6/ym5IIVKLbj1JqsYUIzRzOz/QvmHG
         +QTg==
X-Forwarded-Encrypted: i=1; AKwUvBzUMyMButWJbxydNDwC1ll9e0l2VwA7DrsA0FOaYGTy/648GiLdAliExCfLm0xyNxsYCoW6OVW79kabrA4=@vger.kernel.org
X-Gm-Message-State: AFuF++nY9JhBk1bdKfOyOIm/2nN0I5sNuJehDWSQYsNQSU9LOhDeG8nK
	CasXCYScQadjTal61x1o/kIwjb3IUbQ2mH0OOM+ozFaC+vhdMtZzV48EWNsuQG1WQOgoF7G8/05
	4J4HpoQsSFl19zteB9514ouNOghjPCIAmKnFrzw5ULc2nfUqHwVEPyaWDExQDDTL9Ua0=
X-Gm-Gg: AYBFou0FR2+i1JOl/JifB5UuOtC3ibhDj9oFHoB2ikY3bmkgO93MRJLBLNZVvEfPa7I
	4prG4ZaGLQ5ciRwa5cIiFaEyN/LrHdoGRL8uCCKxJn2rFgNSpGnU8C7jTbr+qmSZCV4ecg/5l0O
	SOfe6jFOL1Hb0B6YofOPqI/oC0GVloYp9ItW5LexMe5nxjNElR083Z6gWVRsWBiKkeGnaLCifEb
	IlrcFKg+PtESiwRWkyi3sVGpcjXIk7OsbsIKsoL5Ui5vXMpeOehhorggX6ZP7BHKpEAKm9isqFD
	PffEHHta5H0zOGBda4Uf0aFFuE8x0a5badGihhWLyz386p39NVpsJkaSrqn57Hsi3EXzD/KXFZz
	GtKQoe0/qQZ7HDOg=
X-Received: by 2002:a05:620a:640b:b0:939:6de6:9517 with SMTP id af79cd13be357-93a29a92a0bmr442390285a.46.1789394799429;
        Mon, 14 Sep 2026 07:06:39 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:939:6de6:9517 with SMTP id af79cd13be357-93a29a92a0bmr442377585a.46.1789394798784;
        Mon, 14 Sep 2026 07:06:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm432396285e9.5.2026.09.14.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:06:37 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:06:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: glymur: Add UFS nodes
Message-ID: <chmhun7dqj5flvbkzpsoz3pdbjrcbplel5rqfvj3fc6ztaw2sa@4o55fods7yaf>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-3-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-3-b9fc5e2ee99a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7ff70 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ucACzhYzkOUm8HD49FUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Bun9s5IJXJmT0ZKaKBsEvgfbPVVueflH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfX94AMDBaWWTYk
 6BwceGcGc6eE4CyqwAAQvAqSIy9VxEFmAOZNT61jVjmIwisGsw1OdDZpapzi7S+5rRZXqtxFOdh
 AkwB5Ym71S3x8sqpLYJ+56ERs7/Lf0w=
X-Proofpoint-GUID: Bun9s5IJXJmT0ZKaKBsEvgfbPVVueflH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfX00zBO8ZazWqD
 wphOwN02J55CnpfkNxUQ6mdEX3sbAQse667nN8o+NP4ZDKltnDFgZPVIEZbn+N90ViEm7wkIB+x
 ktKryTP5QplpEFBVfuwYL5ZNyu+Y9acTngN+TqlgUQKBjy++zH+9JvycypVaCquKilRqWC1O47b
 7fjvjOqKnn2HJ9EI0MVQVqGE/RkKT3zzRsytL89Gnys8et/fwWf4b6D075sd9QXn150VdbXEcxS
 0s0r+GcKw/0/Y/PwVNDQwsFqwdNiOB02GkLUZLVWmzBSAus3TPTOfXpKkBfd5pb7BTve/Hx4OmX
 bMCLen6SxOfc+CWT8M5h/7fNXbSwC8Gm6GLmoxQ30Onv000PN4Q+3ebViYRoxjVJKaw/3OafElc
 LbQuDISLoL8+U7BzWCA6W+xQ9wh6Gh9rwMp21w7HsSKK6N5c8unCegFYRu9OFEzw/HbIwcDnSfa
 RyXokjn6FINOIJC1clA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140202

On 26-09-11 22:17:07, Pradeep P V K wrote:
> Add UFS PHY and UFS host controller nodes for Glymur SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

One nit below.

With Konrad's comments addressed, I think it looks good, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 114 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 111 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 624a9edd602c..7bbc804ed340 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -812,9 +812,9 @@ gcc: clock-controller@100000 {
>  				 <0>,				/* QUSB4 1 PHY RX 1 */
>  				 <0>,				/* QUSB4 2 PHY RX 0 */
>  				 <0>,				/* QUSB4 2 PHY RX 1 */
> -				 <0>,				/* UFS PHY RX Symbol 0 */
> -				 <0>,				/* UFS PHY RX Symbol 1 */
> -				 <0>,				/* UFS PHY TX Symbol 0 */
> +				 <&ufs_mem_phy 0>,		/* UFS PHY RX Symbol 0 */
> +				 <&ufs_mem_phy 1>,		/* UFS PHY RX Symbol 1 */
> +				 <&ufs_mem_phy 2>,		/* UFS PHY TX Symbol 0 */
>  				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> @@ -4103,6 +4103,114 @@ rng: rng@10c3000 {
>  			reg = <0x0 0x010c3000 0x0 0x1000>;
>  		};
>  
> +		ufs_mem_phy: phy@1d80000 {
> +			compatible = "qcom,glymur-qmp-ufs-phy";
> +			reg = <0x0 0x01d80000 0x0 0x2000>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
> +				 /* UFS and PCIE4 shares the same clkref on glymur */

On top of Konrad's comment, I'd drop the "on glymur" part entirely here.
